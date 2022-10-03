Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D405F2B77
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 10:13:57 +0200 (CEST)
Received: from localhost ([::1]:42262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofGaK-0000D0-DN
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 04:13:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ofGS7-0006DN-H8
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 04:05:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ofGS4-0005vR-H9
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 04:05:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664784323;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jzh3pBGbp7vNDKyCAkOPrG5Mmk5K5VTk4qKwSIsBTRY=;
 b=YGMtjUQyxE2sR40lG6hrmkQ+jdXOVcsduh4C9TjnI3UlEZgAsKyjJlGGMl72LBKGL51pWW
 E9hICmfOTyVRMcePd9x5MIp9cyq03gSHWZBBqHH/v3SIOENJoYaA0tdDYpi9q5+aMnJKQw
 Xv8fa9TDd/bWkAD6EKWpiComVzIMts4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-639-xoT3IO_CMsyxICFcHFbB9w-1; Mon, 03 Oct 2022 04:05:22 -0400
X-MC-Unique: xoT3IO_CMsyxICFcHFbB9w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C7296101CC67;
 Mon,  3 Oct 2022 08:05:21 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.10])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 194C42027061;
 Mon,  3 Oct 2022 08:05:19 +0000 (UTC)
Date: Mon, 3 Oct 2022 09:05:14 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, jb-gnumlists@wisemo.com, thuth@redhat.com,
 jasowang@redhat.com, qemu_oss@crudebyte.com
Subject: Re: [PATCH] build-sys: error when slirp is not found and not disabled
Message-ID: <YzqXuhJWloERf6Wm@redhat.com>
References: <20221003070534.2180380-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221003070534.2180380-1-marcandre.lureau@redhat.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 03, 2022 at 11:05:34AM +0400, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> This is an alternative configure-time solution to "[PATCH] net:
> print a more actionable error when slirp is not found".
> 
> See also "If your networking is failing after updating to the latest git
> version of QEMU..." ML thread.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  meson.build | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/meson.build b/meson.build
> index 8dc661363f..565096001d 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -657,6 +657,12 @@ if not get_option('slirp').auto() or have_system
>    endif
>  endif
>  
> +if not get_option('slirp').disabled() and not slirp.found()
> +  error('libslirp is not explicitely disabled and was not found. ' +
> +        'Since qemu 7.2, libslirp is no longer included as a submodule ' +
> +        'fallback, you must install it on your system or --disable-libslirp.')
> +endif

I understand the motivation, but this goes against the main principal
of our build time detection, which is to "do the right thing" automatically.
If libslirp is not present on the host, then I would consider the need to
pass --disable-libslirp to be a bug.

I think this pain that people see of loosing slirp support is going to be
a pretty short term problem. IMHO it suffices to print a warning message
right at the very end of configure, after everything else, just for one
or two releases.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


