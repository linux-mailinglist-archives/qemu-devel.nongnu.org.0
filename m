Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 288F74C5F56
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 23:12:34 +0100 (CET)
Received: from localhost ([::1]:51582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nORmL-0000Sf-83
	for lists+qemu-devel@lfdr.de; Sun, 27 Feb 2022 17:12:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nORkd-0007yl-K3
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 17:10:47 -0500
Received: from [2607:f8b0:4864:20::1032] (port=37572
 helo=mail-pj1-x1032.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nORkb-0001LC-NT
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 17:10:46 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 p3-20020a17090a680300b001bbfb9d760eso13143718pjj.2
 for <qemu-devel@nongnu.org>; Sun, 27 Feb 2022 14:10:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=oCGSNMKIx+BloRv6LoiTiQkG8mOVFb/M5nizJP6d0nQ=;
 b=fksTtth3j93PqQJHxtfHlptiZqiedh8uK/0K593NvCNCd0nYLD367RrojL6VPmos0J
 XEbwQoEKiPp2lxxoxFe9FMx6ZGMaJd1SMMFd6kEvyd0rsAtP6WqZHY9tyWILuDfAfS5C
 CdhLga8gnZCqH/qCZrl4aubiM/xty+17irfMVvCBzgP7zFSJxGPNzW2+wtu1amNevrDb
 F0zerhbvrW20zzq5F6WMeGwSKoSv6AYmPG5/EFwWiyfxR6jqLE3B3WDWUyRBX39JITjx
 dAMPwos/4RmuaPu5dF2SnLdu3FYr4CQjjSMUyje3dgDgqa1hlGnl3zZ/dKm/m19xZwH3
 GBEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oCGSNMKIx+BloRv6LoiTiQkG8mOVFb/M5nizJP6d0nQ=;
 b=M72LHRhukfi8OzMtzhvSaUxYW8BTIscgafLu+g+DAjmgU6Kv9kG/aWipCM/Abpn5Hm
 Cfn+k1YXf/En7l9unFdVE81i5ARtydvXz/rPbWVTSmhzebIX27rrCgFUGkB1oToQVUMa
 C3qKGTKf+qW/hUbToS6w98FwRFGs3VEZD296qKBfpaD5GVzLjcsPrg/roChK1BCetMgQ
 1xZ6jXHjNq3mCUUnSbAgtzLVVwZdFNZWoSoXfaJ4+GbWUbBRB1PWasB0Eujf4liPOMtj
 Ak8nrKRNPbYRxi7UgklDBPV54EDHM0ilLCABLCgzgHLtvsGh8jVQ2zqZbSOg6bwWcDzF
 +ugA==
X-Gm-Message-State: AOAM530aWpJap0iUfr+eb2ooRt5wzeMlGT04VUGCVwsvsh89F+iDQlyE
 EtSSJUw34FpIsl77mS/YDh8=
X-Google-Smtp-Source: ABdhPJwq4M+/PjVi7daXpU8uY878cI3DGRSop/pMi/0GPcX98ZT+LCK3e9qykER/b4i61ex8OllZjw==
X-Received: by 2002:a17:90a:c58b:b0:1bc:842c:6c56 with SMTP id
 l11-20020a17090ac58b00b001bc842c6c56mr13748677pjt.142.1645999844429; 
 Sun, 27 Feb 2022 14:10:44 -0800 (PST)
Received: from [192.168.1.115] (32.red-88-28-25.dynamicip.rima-tde.net.
 [88.28.25.32]) by smtp.gmail.com with ESMTPSA id
 l1-20020a17090aec0100b001bc6d8bb27dsm14302026pjy.37.2022.02.27.14.10.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Feb 2022 14:10:44 -0800 (PST)
Message-ID: <9a6d50bc-ff9a-1f4a-22de-bf76f6a2b00b@gmail.com>
Date: Sun, 27 Feb 2022 23:10:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v2 01/22] hw/rtc/mc146818rtc: QOM'ify IRQ number
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
References: <20220222193446.156717-1-shentey@gmail.com>
 <20220222193446.156717-2-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220222193446.156717-2-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1032
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/2/22 20:34, Bernhard Beschow wrote:
> Exposing the IRQ number as a QOM property not only allows it to be
> configurable but also to be printed by standard QOM mechanisms. This allows
> isabus_dev_print() to be retired eventually.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/isa/piix4.c               |  2 +-
>   hw/rtc/mc146818rtc.c         | 13 +++++++++++--
>   include/hw/rtc/mc146818rtc.h |  1 +
>   3 files changed, 13 insertions(+), 3 deletions(-)

> @@ -975,6 +982,7 @@ ISADevice *mc146818_rtc_init(ISABus *bus, int base_year, qemu_irq intercept_irq)
>   
>   static Property mc146818rtc_properties[] = {
>       DEFINE_PROP_INT32("base_year", RTCState, base_year, 1980),
> +    DEFINE_PROP_UINT32("irq", RTCState, isairq, RTC_ISA_IRQ),
>       DEFINE_PROP_LOSTTICKPOLICY("lost_tick_policy", RTCState,
>                                  lost_tick_policy, LOST_TICK_POLICY_DISCARD),
>       DEFINE_PROP_END_OF_LIST(),

> diff --git a/include/hw/rtc/mc146818rtc.h b/include/hw/rtc/mc146818rtc.h
> index 5b45b22924..c7586589ad 100644
> --- a/include/hw/rtc/mc146818rtc.h
> +++ b/include/hw/rtc/mc146818rtc.h
> @@ -26,6 +26,7 @@ struct RTCState {
>       uint8_t cmos_data[128];
>       uint8_t cmos_index;
>       int32_t base_year;
> +    uint32_t isairq;
>       uint64_t base_rtc;
>       uint64_t last_update;
>       int64_t offset;

Enough using DEFINE_PROP_UINT8 / uint8_t, otherwise:

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

