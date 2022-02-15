Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 947C84B73E9
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 17:52:49 +0100 (CET)
Received: from localhost ([::1]:32858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK14K-0001ph-IG
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 11:52:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nK12F-0000b1-Qg
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 11:50:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38305)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nK12A-0005jN-ST
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 11:50:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644943826;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E8yPHD2nCAKVYR0lb/9jlUC0VnR8MNey/rt/q4y6q2M=;
 b=L1/QZWk4/cdrICaNFbBeuho52llXo5WWaJDLctYRjFz7RAR2Zs7/zWOU0deqgxSlg9grH8
 yYfaJZpEoOK38RnGqhBFJZ11tKK8tLr2qjEFODC/sauT2X6oakDn+TsM6FuiitbZClTInN
 r0CFsfG8z89soJgArGP9mYo3a8hL8JM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-2YnofUwyNO68FzBlcAEJ2w-1; Tue, 15 Feb 2022 11:50:23 -0500
X-MC-Unique: 2YnofUwyNO68FzBlcAEJ2w-1
Received: by mail-wm1-f70.google.com with SMTP id
 7-20020a1c1907000000b003471d9bbe8dso1187829wmz.0
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 08:50:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=E8yPHD2nCAKVYR0lb/9jlUC0VnR8MNey/rt/q4y6q2M=;
 b=fy9Fhrezmy0f2xlTrp37yQYqbjiZBs5f+8WKdGtHrmztTHoa85D9gHn6eFQkhPpO4T
 wM/rUhWtjMIPPZBovJsHRYiOvohe+eut0e3hdlTBqDbTlJ86oBhFweuWXPEL0emBVgNm
 Fgaan50Y3257cV9eC6DLMz/PrzamcWUWCaBrNtWbnkroSC3VDXnHatswQbP6M96MoE2Q
 wDiDHseB+f4XYQr9cF/BIodaJ4aplN7ksGv/e6xYrTcyBbS0u7vmNcoqtD3oZ2fXBy3Y
 XO2fmSXFrWZ298BF5yWMCeAL4UIi5glQmoKcK6k4CNqMDEpPWaSF0DM8EbKuNAUZt3QC
 IzPA==
X-Gm-Message-State: AOAM530yzlHipOt8CaXoCRsiS80UvdmpNL/5hj/ag//8RTPVF3MJIlIs
 QQjj1e9OwYU0MKsdvZxTN88P9wcu3cB1pijK8zWxcIVGHTWgafzpX1Q49zL5oyykMT5Ro1ueES8
 SZaElANzEfCuoX1Q=
X-Received: by 2002:a05:600c:4fcf:: with SMTP id
 o15mr3858828wmq.145.1644943822048; 
 Tue, 15 Feb 2022 08:50:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyL0L6Vqrpm8YRk3f+MxoG95sfqBBesG3Z3oA4bX11cefKttjegPsumGqr8kfoTM63PH80D2g==
X-Received: by 2002:a05:600c:4fcf:: with SMTP id
 o15mr3858809wmq.145.1644943821733; 
 Tue, 15 Feb 2022 08:50:21 -0800 (PST)
Received: from [192.168.8.104] (tmo-098-218.customers.d1-online.com.
 [80.187.98.218])
 by smtp.gmail.com with ESMTPSA id az13sm13105892wrb.39.2022.02.15.08.50.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Feb 2022 08:50:21 -0800 (PST)
Message-ID: <03217598-a05f-5d82-72a4-2016137d1161@redhat.com>
Date: Tue, 15 Feb 2022 17:50:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] hw/i386/pc_piix: Mark the machine types from version 1.4
 to 1.7 as deprecated
From: Thomas Huth <thuth@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
References: <20220117191639.278497-1-thuth@redhat.com>
In-Reply-To: <20220117191639.278497-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/01/2022 20.16, Thomas Huth wrote:
> The list of machine types grows larger and larger each release ... and
> it is unlikely that many people still use the very old ones for live
> migration. QEMU v1.7 has been released more than 8 years ago, so most
> people should have updated their machines to a newer version in those
> 8 years at least once. Thus let's mark the very old 1.x machine types
> as deprecated now.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   docs/about/deprecated.rst | 8 ++++++++
>   hw/i386/pc_piix.c         | 1 +
>   2 files changed, 9 insertions(+)
> 
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index e21e07478f..652a4d43b6 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -318,6 +318,14 @@ machine is hardly emulated at all (e.g. neither the LCD nor the USB part had
>   been implemented), so there is not much value added by this board. Use the
>   ``ref405ep`` machine instead.
>   
> +``pc-i440fx-1.4`` up to ``pc-i440fx-1.7`` (since 7.0)
> +'''''''''''''''''''''''''''''''''''''''''''''''''''''
> +
> +These old machine types are quite neglected nowadays and thus might have
> +various pitfalls with regards to live migration. Use a newer machine type
> +instead.
> +
> +
>   Backend options
>   ---------------
>   
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index d9b344248d..84f3633223 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -757,6 +757,7 @@ static void pc_i440fx_1_7_machine_options(MachineClass *m)
>       m->hw_version = "1.7.0";
>       m->default_machine_opts = NULL;
>       m->option_rom_has_mr = true;
> +    m->deprecation_reason = "old and unattended - use a newer version instead";
>       compat_props_add(m->compat_props, pc_compat_1_7, pc_compat_1_7_len);
>       pcmc->smbios_defaults = false;
>       pcmc->gigabyte_align = false;

*ping*

Seems like the discussion about marking old machine types ceased very 
quickly ... but since nobody has written any concerns against this patch 
here, could we at least agree to apply this patch to get the deprecation 
timer started again for some machine types in 7.0 ?

  Thomas


