Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8BEF5F638A
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 11:22:59 +0200 (CEST)
Received: from localhost ([::1]:40186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogN5m-0008E9-T6
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 05:22:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ogMcg-0006Ky-ER
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 04:52:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ogMcc-00008Z-UV
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 04:52:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665046369;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ne1hcZA/IvNixK9YxcfJq6ZgDN4PbML19r6o7ECGmAs=;
 b=O4UgT9GqePdPNYBUX2xNXxKOys+RKXc8asYNvf5G8o4eOfoDMPUgV+IO7srnposXhLNNdK
 4ijii3CC56qqFgMklQpB7249zeR+zERbIYyQofs+aVgTwDANP4fyUtXzj0IE2e4uWc9FX0
 UrdSWU1pgasOS8HlMGEYK07UJtJiNwM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-352-eYMm5dbmM5yfvA4HRF5o2A-1; Thu, 06 Oct 2022 04:52:48 -0400
X-MC-Unique: eYMm5dbmM5yfvA4HRF5o2A-1
Received: by mail-ed1-f70.google.com with SMTP id
 s17-20020a056402521100b004511c8d59e3so1074600edd.11
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 01:52:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=ne1hcZA/IvNixK9YxcfJq6ZgDN4PbML19r6o7ECGmAs=;
 b=rRopS2q5yY43/GQ9uvcvu+QAtDTRCMeJaQNWk/Il4TImDtTWoGx+D+g+e4yPNwazCO
 HKlDrpIDujUZ/Xl7ZQdraRAbqPyyONXozv7QXESNSIgFm06GKoJl7bg1XkcANaIx1Mqo
 dtQ0eQr5dVxYYsQqIR3qZ/oosL/J897wao7q5jTaet7hejmvFCwoOZ5AQ/sNY6m38g6c
 6EqgbsMSxYosR7pxzqi7Boigb0KUuCSk2aYrsSga9MT03dxDueeaRuQXQ0l5ybrFfTC8
 z3bh+/FsSVCHh9azwhQDQoRPhnoetr7e6Aw90c8/DielMNaRQ0Ud40223GaP8J+dR0ko
 En1w==
X-Gm-Message-State: ACrzQf0PfcGFgGSMkG4iB/rb+0Nbq5YYK+CIInuKe2AJ+1yBOjm5plQZ
 dGCoFonL1lVUXL+kBaJBofIo/76beJJ4ZrptfExFY7TlXaJ32KtNIjUb18ArDscVeGY2x3kjb66
 rdB+tlw75d2fRmNA=
X-Received: by 2002:a17:906:cc10:b0:77a:fe95:eae2 with SMTP id
 ml16-20020a170906cc1000b0077afe95eae2mr3179813ejb.466.1665046367210; 
 Thu, 06 Oct 2022 01:52:47 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5a9LoVO0eSO8cw70rCqqaojHWQ7mHKwsLJ1l12gv39UJ8aw7UiqyMD6YFrOZ48d6D0eoHxOQ==
X-Received: by 2002:a17:906:cc10:b0:77a:fe95:eae2 with SMTP id
 ml16-20020a170906cc1000b0077afe95eae2mr3179801ejb.466.1665046366986; 
 Thu, 06 Oct 2022 01:52:46 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-179-124.web.vodafone.de.
 [109.43.179.124]) by smtp.gmail.com with ESMTPSA id
 r19-20020aa7d153000000b0045754cd5e08sm5371138edo.39.2022.10.06.01.52.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Oct 2022 01:52:46 -0700 (PDT)
Message-ID: <74f4b4f3-53df-e44e-513b-052550bd3c2f@redhat.com>
Date: Thu, 6 Oct 2022 10:52:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2] build-sys: error when slirp is not found and not
 disabled
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: jb-gnumlists@wisemo.com, jasowang@redhat.com, qemu_oss@crudebyte.com
References: <20221006083322.2612639-1-marcandre.lureau@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221006083322.2612639-1-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.435, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/10/2022 10.33, marcandre.lureau@redhat.com wrote:
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
>   meson.build | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/meson.build b/meson.build
> index 4321b8f8da..b05080b051 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -690,6 +690,13 @@ if not get_option('slirp').auto() or have_system
>     endif
>   endif
>   
> +# Remove this error after QEMU 8.1 has been released.
> +if not get_option('slirp').disabled() and not slirp.found()
> +  error('libslirp is not explicitely disabled and was not found. ' +
> +        'Since qemu 7.2, libslirp is no longer included as a submodule ' +

Maybe s/qemu/QEMU/

> +        'fallback, you must install it on your system or --disable-slirp.')
> +endif
> +
>   vde = not_found
>   if not get_option('vde').auto() or have_system or have_tools
>     vde = cc.find_library('vdeplug', has_headers: ['libvdeplug.h'],

Reviewed-by: Thomas Huth <thuth@redhat.com>


