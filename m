Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB80A2DCF4F
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 11:14:47 +0100 (CET)
Received: from localhost ([::1]:33526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpqJ5-0001pq-0y
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 05:14:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kpqDz-0006CW-5g
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 05:09:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57109)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kpqDk-0000FZ-P1
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 05:09:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608199753;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QAAK5PrPnvuu1ATu55SE0CNzMR2cB+J4D1xqqg2Rw58=;
 b=SCgBWGPgPlKxt3U4vcBFLlV7q+AWCJU1T2EXj7BnPEGLtY/wfLTrcWtZKoDUgpZIzd+V5T
 0mVoEag4RS93E/+M78IJMEe28rq9oGMvqwrMVN+Y6zNrXHtT41834QzAFpUaAMDlukT85b
 O2AofPOr5Sv6dkwgpwor/xCK/nKikL0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-bMJ6nFM8NpSvJdmYybWJzg-1; Thu, 17 Dec 2020 05:09:08 -0500
X-MC-Unique: bMJ6nFM8NpSvJdmYybWJzg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5D2746D520
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 10:09:07 +0000 (UTC)
Received: from redhat.com (ovpn-115-33.ams2.redhat.com [10.36.115.33])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D71FE19C9B;
 Thu, 17 Dec 2020 10:09:01 +0000 (UTC)
Date: Thu, 17 Dec 2020 10:08:57 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 02/18] curl: remove compatibility code, require 7.29.0
Message-ID: <20201217100857.GC247354@redhat.com>
References: <20201217094044.46462-1-pbonzini@redhat.com>
 <20201217094044.46462-3-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201217094044.46462-3-pbonzini@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: =?utf-8?B?TWFyYy1BbmRyw4PCqQ==?= Lureau <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 17, 2020 at 10:40:28AM +0100, Paolo Bonzini wrote:
> cURL 7.16.0 was released in October 2006.  Just remove code that is
> in all likelihood not being used anywhere, and require the oldest version
> found in currently supported distros, which is 7.29.0 from CentOS 7.
> 
> pkg-config is enough for QEMU, since it does not need extra information
> such as the path for certicate authorities.  All supported platforms
> today will all have pkg-config for curl, so we can drop curl-config.
> 
> Suggested-by: Daniel Berrangé <berrange@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  block/curl.c | 28 ----------------------------
>  configure    |  9 ++-------
>  2 files changed, 2 insertions(+), 35 deletions(-)
> 

> diff --git a/configure b/configure
> index 42b39544d4..c0a3e1556b 100755
> --- a/configure
> +++ b/configure
> @@ -3428,17 +3428,12 @@ done
>  ##########################################
>  # curl probe
>  if test "$curl" != "no" ; then
> -  if $pkg_config libcurl --exists; then
> -    curlconfig="$pkg_config libcurl"
> -  else
> -    curlconfig=curl-config
> -  fi
>    cat > $TMPC << EOF
>  #include <curl/curl.h>
>  int main(void) { curl_easy_init(); curl_multi_setopt(0, 0, 0); return 0; }
>  EOF
> -  curl_cflags=$($curlconfig --cflags 2>/dev/null)
> -  curl_libs=$($curlconfig --libs 2>/dev/null)
> +  curl_cflags=$($pkg_config libcurl --cflags 2>/dev/null)
> +  curl_libs=$($pkg_config libcurl --libs 2>/dev/null)

Should really be  libcurl >= 7.29.0, but since you're removing this in
the next patch, and have the right version check in meson, I'm ambivalent
here.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>



Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


