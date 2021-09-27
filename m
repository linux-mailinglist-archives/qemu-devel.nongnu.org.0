Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA7D419018
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 09:38:37 +0200 (CEST)
Received: from localhost ([::1]:36908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUlDg-0007uR-7E
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 03:38:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mUlCF-0006wG-Nd
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 03:37:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mUlCD-0007rV-09
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 03:37:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632728223;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=UNTPSLtfnudaTqg6l04ZlFn4A4EaBZzUB0Pv42eFdb4=;
 b=hppr2lBCzREJvVGK9Mr23Ontdb+SDUPB4hARggWUnNGrYx26hcqgB0zeBOiMaYjrjNFmv/
 b/qLOVcpEyKbBggS5WrtR1yN/wK/hxwtRdo8pjYovRevp+k1q0Hr6LdqtjrfAgyZkJ042/
 ZUyC86Un06vu5AN4WOYdfOoeKsdMkQI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-xWVcO5qBNOSAWtjVSBawKA-1; Mon, 27 Sep 2021 03:36:57 -0400
X-MC-Unique: xWVcO5qBNOSAWtjVSBawKA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D80F01084684;
 Mon, 27 Sep 2021 07:36:56 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.156])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2AFA8652AD;
 Mon, 27 Sep 2021 07:36:56 +0000 (UTC)
Date: Mon, 27 Sep 2021 08:36:53 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: nia <nia@netbsd.org>
Subject: Re: [PATCH] configure: Loosen GCC requirement from 7.5.0 to 7.4.0
Message-ID: <YVF0hs8yuoqr6IES@redhat.com>
References: <YVAfpt8k8BHsN2Ln@homeworld.netbsd.org>
MIME-Version: 1.0
In-Reply-To: <YVAfpt8k8BHsN2Ln@homeworld.netbsd.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Sep 26, 2021 at 07:22:14AM +0000, nia wrote:
> As discussed in issue 614, we're shipping GCC 7.4.0 as the
> system compiler in NetBSD 9, the most recent stable branch,
> and are still actively interested in QEMU on this platform.
> 
> The differences between GCC 7.5.0 and 7.4.0 are trivial.
> 
> Signed-off-by: Nia Alarie <nia@NetBSD.org>
> ---
>  configure | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/configure b/configure
> index 1043ccce4f..f918ad67a1 100755
> --- a/configure
> +++ b/configure
> @@ -2094,8 +2094,8 @@ cat > $TMPC << EOF
>  #  endif
>  # endif
>  #elif defined(__GNUC__) && defined(__GNUC_MINOR__)
> -# if __GNUC__ < 7 || (__GNUC__ == 7 && __GNUC_MINOR__ < 5)
> -#  error You need at least GCC v7.5.0 to compile QEMU
> +# if __GNUC__ < 7 || (__GNUC__ == 7 && __GNUC_MINOR__ < 4)
> +#  error You need at least GCC v7.4.0 to compile QEMU
>  # endif
>  #else
>  # error You either need GCC or Clang to compiler QEMU

You missed another version number change just after here


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


