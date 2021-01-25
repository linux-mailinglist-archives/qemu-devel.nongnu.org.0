Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7530302842
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 17:56:06 +0100 (CET)
Received: from localhost ([::1]:48116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l459p-0007UZ-AW
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 11:56:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l453j-0005U6-PV
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 11:49:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l453f-0003Is-Hi
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 11:49:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611593382;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xkjYBiLx/xxE38bCk/e0wZf9IEnc0eSOUQGAQQ8q5Tw=;
 b=DBgsnCWsrOU4ilQud2oO6a1gonegBSHKrPBP8edPab3Te5kYNfAsFKwH1SKWN18AtLqbfx
 TH3QKMhnZp3+0oV2hpmyYQLSc085gR7egg075iOAJmk+wFCQCkvKeIof6Q+ZerLCciP82Y
 KW/VSRZQ2pno2VllYcvaNTUO5zlMsIU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-7loqGzR7OK2sr6tHuMz6CA-1; Mon, 25 Jan 2021 11:47:52 -0500
X-MC-Unique: 7loqGzR7OK2sr6tHuMz6CA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE79210054FF;
 Mon, 25 Jan 2021 16:47:50 +0000 (UTC)
Received: from redhat.com (ovpn-112-134.ams2.redhat.com [10.36.112.134])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E7B160CE9;
 Mon, 25 Jan 2021 16:47:49 +0000 (UTC)
Date: Mon, 25 Jan 2021 16:47:46 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v4 4/4] meson: Warn when TCI is selected but TCG backend
 is available
Message-ID: <20210125164746.GE3538803@redhat.com>
References: <20210125144530.2837481-1-philmd@redhat.com>
 <20210125144530.2837481-5-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210125144530.2837481-5-philmd@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Cc: Stefan Weil <sw@weilnetz.de>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 25, 2021 at 03:45:30PM +0100, Philippe Mathieu-Daudé wrote:
> Some new users get confused with 'TCG' and 'TCI', and enable TCI
> support expecting to enable TCG.
> 
> Emit a warning when native TCG backend is available on the
> host architecture, mentioning this is a suboptimal configuration.
> 
> Reviewed-by: Stefan Weil <sw@weilnetz.de>
> Reviewed-by: Thomas Huth <thuth@redhat.com>

Nitpick, the text printed is completely rewritten from what they
reviewed, so I would probably have dropped their R-b for that
scenario.

> Suggested-by: Daniel Berrangé <berrange@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  meson.build | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/meson.build b/meson.build
> index 16b2560e7e7..f675c54e636 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -228,6 +228,13 @@
>      else
>        error('Unsupported CPU @0@, try --enable-tcg-interpreter'.format(cpu))
>      endif
> +  elif get_option('tcg_interpreter')
> +    warning('Use of the TCG interpretor is not recommended on this host')
> +    warning('architecture. There is a native TCG execution backend available')
> +    warning('which provides substantially better performance and reliability.')
> +    warning('It is strongly recommended to remove the --enable-tcg-interpreter')
> +    warning('configuration option on this architecture to use the native')
> +    warning('backend.')
>    endif
>    if get_option('tcg_interpreter')
>      tcg_arch = 'tci'
> -- 
> 2.26.2
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


