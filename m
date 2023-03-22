Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DEF16C479A
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 11:29:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peviN-0004pc-99; Wed, 22 Mar 2023 06:29:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pevi3-0004nk-ID
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 06:28:49 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pevi0-0007F2-VK
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 06:28:46 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 j18-20020a05600c1c1200b003ee5157346cso1347976wms.1
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 03:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679480923;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=p71unVlNmWSUSoxj+ibKOU2GzDMTVgdFdmVKaVlg/DI=;
 b=BWVbtf0ydpYahzM8IHPi/vrQxxLAP2b7mZLxa5UjUmeH5nx51f5Qi9fbsx5rFzm3Cw
 bogfQYty9NxDEHB25PKEFzJxluVnvXlI5NjVV23i35V/fIbUmLbQAZeBa+hYCq0/TLJx
 4pxtxu02qrcITDMcGT4mj/d0DrBlukoy8FYXOigBwsXOD3mtHUEwp3qGlAqfai+GeajP
 MuFYEmUrSHqhTfusnnI1gEVc8QPVRnJd0pyz3YPUTxJOyX+jvVkxsM3kNSuLq9FatRmC
 70ir7ljTIMJ/MasgSq5/3zZMpz/Z8AjyaA679JkRpNduUn9QYzLyd2Ezl9sMMUe1Exk5
 iUTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679480923;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=p71unVlNmWSUSoxj+ibKOU2GzDMTVgdFdmVKaVlg/DI=;
 b=hch9WEBkeu2gHWPjE6iiwwrdVD3Wn7FoOw6huAd7nwBCWIEapH/4Vi55BzqW0z4/VM
 9rObP3spL/dYxWyWTm6PhRrsmFu8z+IDKYeMSHrcx/8wo1W2nYQmEm+ZRzmlis8tAUlr
 1huhrmlrY80er2x1pR3YcWy3gGJB/rpJWTlYlrYrLFC3kH+IAWp/pMVcYvSOm/miGwIX
 86Qkh6xdoazA/dHiTzJKFdMSpIHqAVNby1y+eI9R9Vpcu2/H3I+huz+l9xMReoK+aasi
 bDZd2gObOQWTGyrijAXCq3nR2HqXRiSXOKXF6y4p2WnKlKufc6ZxA149LECrd9z0qTIR
 vFeg==
X-Gm-Message-State: AO0yUKVuJnEpehS8oPo7Fs1FQ663V3Tl2vDqi8Rn/JhE9iedLC/FdvmP
 Ww5Mj+Zte0mjWpyZyJShxpPYbA==
X-Google-Smtp-Source: AK7set+AjMAZ1YuvJqgTbuCSQrXBcL58ssPhtnhZNL8WDOFEUrtMk2BTLPExbmgWWd4eAySh8sqXXg==
X-Received: by 2002:a1c:4b1a:0:b0:3ed:514d:e07f with SMTP id
 y26-20020a1c4b1a000000b003ed514de07fmr4830054wma.3.1679480923436; 
 Wed, 22 Mar 2023 03:28:43 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 u13-20020adfdb8d000000b002d2b117a6a6sm13496893wri.41.2023.03.22.03.28.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Mar 2023 03:28:43 -0700 (PDT)
Message-ID: <40559c3f-9c42-3877-3e63-45c72cfa1dc6@linaro.org>
Date: Wed, 22 Mar 2023 11:28:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH v8 2/8] igb: handle PF/VF reset properly
Content-Language: en-US
To: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>, Dmitry Fleytman
 <dmitry.fleytman@gmail.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20230322092704.22776-1-sriram.yagnaraman@est.tech>
 <20230322092704.22776-3-sriram.yagnaraman@est.tech>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230322092704.22776-3-sriram.yagnaraman@est.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 22/3/23 10:26, Sriram Yagnaraman wrote:
> Use PFRSTD to reset RSTI bit for VFs, and raise VFLRE interrupt when VF
> is reset.
> 
> Signed-off-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
> ---
>   hw/net/igb_core.c   | 33 +++++++++++++++++++++------------
>   hw/net/igb_regs.h   |  3 +++
>   hw/net/trace-events |  2 ++
>   3 files changed, 26 insertions(+), 12 deletions(-)
> 
> diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
> index 596039aab8..fe6c7518e9 100644
> --- a/hw/net/igb_core.c
> +++ b/hw/net/igb_core.c
> @@ -1895,14 +1895,6 @@ static void igb_set_eims(IGBCore *core, int index, uint32_t val)
>       igb_update_interrupt_state(core);
>   }
>   
> -static void igb_vf_reset(IGBCore *core, uint16_t vfn)
> -{
> -    /* TODO: Reset of the queue enable and the interrupt registers of the VF. */
> -
> -    core->mac[V2PMAILBOX0 + vfn] &= ~E1000_V2PMAILBOX_RSTI;
> -    core->mac[V2PMAILBOX0 + vfn] = E1000_V2PMAILBOX_RSTD;
> -}
> -
>   static void mailbox_interrupt_to_vf(IGBCore *core, uint16_t vfn)
>   {
>       uint32_t ent = core->mac[VTIVAR_MISC + vfn];
> @@ -1980,6 +1972,17 @@ static void igb_set_vfmailbox(IGBCore *core, int index, uint32_t val)
>       }
>   }
>   
> +static void igb_vf_reset(IGBCore *core, uint16_t vfn)
> +{
> +    /* disable Rx and Tx for the VF*/
> +    core->mac[VFTE] &= ~BIT(vfn);
> +    core->mac[VFRE] &= ~BIT(vfn);
> +    /* indicate VF reset to PF */
> +    core->mac[VFLRE] |= BIT(vfn);
> +    /* VFLRE and mailbox use the same interrupt cause */
> +    mailbox_interrupt_to_pf(core);
> +}

Orthogonal to this patch, I'm surprised to see a function named
igb_vf_reset() which is not called by igb_reset().

