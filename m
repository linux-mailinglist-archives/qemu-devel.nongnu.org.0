Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60120324FD7
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 13:26:58 +0100 (CET)
Received: from localhost ([::1]:36106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFFjN-0000Aw-DG
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 07:26:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lFFiE-0007wG-C5
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 07:25:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42100)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lFFi8-0005Ee-2I
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 07:25:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614255938;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=hnk32oTDsmrn5ea24X8Rp0nFgIawxUtWQLX9yhgsJ/Q=;
 b=NJx18ZTyd87PZeH7VD2UqSTd/WxuVGZx/6Mz4D2o6GQzS3jsRaC783Q/X//IxiOab1ZLiE
 /jD2YY1ncQQguxmqh9yyV5bmM6qpA0eojEm88v46rU36Jyxnh5MioNP98pYcXmuGdTqblj
 Mi3+pCouGiCpw/p+0UUT/+1vFdr/NTA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-513-n8fKnlTjNP6YjpKbJP7z_w-1; Thu, 25 Feb 2021 07:25:33 -0500
X-MC-Unique: n8fKnlTjNP6YjpKbJP7z_w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1271ECC626
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 12:25:33 +0000 (UTC)
Received: from redhat.com (ovpn-115-195.ams2.redhat.com [10.36.115.195])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6714260939;
 Thu, 25 Feb 2021 12:25:32 +0000 (UTC)
Date: Thu, 25 Feb 2021 12:25:29 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] vl: deprecate -writeconfig
Message-ID: <YDeXOUlB3IYITBRw@redhat.com>
References: <20210225111148.618704-1-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210225111148.618704-1-pbonzini@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 25, 2021 at 12:11:48PM +0100, Paolo Bonzini wrote:
> The functionality of -writeconfig is limited and the code
> does not even try to detect cases where it prints incorrect
> syntax (for example if values have a quote in them, since
> qemu_config_parse does not support any kind of escaping)
> so remove it.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  docs/system/deprecated.rst | 7 +++++++
>  softmmu/vl.c               | 1 +
>  2 files changed, 8 insertions(+)
> 
> diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
> index 2fcac7861e..9aede21f11 100644
> --- a/docs/system/deprecated.rst
> +++ b/docs/system/deprecated.rst
> @@ -146,6 +146,13 @@ library enabled as a cryptography provider.
>  Neither the ``nettle`` library, or the built-in cryptography provider are
>  supported on FIPS enabled hosts.
>  
> +``-writeconfig`` (since 6.0)
> +'''''''''''''''''''''''''''''
> +
> +The ``-writeconfig`` option is not able to serialize the entire contents
> +of the QEMU command line.  It is thus considered a failed experiment
> +and deprecated.

 s/./, with no current replacement./

> +
>  QEMU Machine Protocol (QMP) commands
>  ------------------------------------
>  
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index b219ce1f35..3e4dce2874 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -3356,6 +3356,7 @@ void qemu_init(int argc, char **argv, char **envp)
>              case QEMU_OPTION_writeconfig:
>                  {
>                      FILE *fp;
> +                    warn_report("The -writeconfig option is deprecated");

I'd suggest same here too

>                      if (strcmp(optarg, "-") == 0) {
>                          fp = stdout;
>                      } else {

Can we hide/remove it from qemu-options.hx, while still letting it be
used if people know it exists ? Failing that, at least add the deprecation
note to the qemu-options.hx help text


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


