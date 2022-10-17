Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B6960107F
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 15:50:38 +0200 (CEST)
Received: from localhost ([::1]:37542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okQVp-0001cC-A1
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 09:50:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1okQQG-0005Y1-Vk
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 09:44:53 -0400
Received: from esa1.hc2706-39.iphmx.com ([68.232.153.39]:10136)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1okQQE-00061t-P7
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 09:44:52 -0400
X-IronPort-RemoteIP: 209.85.219.71
X-IronPort-MID: 233147338
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:BBCRO62kojk++M8K3fbD5WJzkn2cJEfYwER7XKvMYLTBsI5bpzwGn
 WVOWm2OPv3bYWXwLdtwOoq28E4G7ZDWzocyT1Y6qSg9HnlHl5H5CIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv676yEUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii8tjjMPR7zml4
 LsemOWCfg74s9JIGjhMsfja8Eow5K2aVA4w5TTSW9ga5DcyqFFIVPrzFYnpR1PkT49dGPKNR
 uqr5NlVKUuAon/Bovv8+lrKWhRiroz6ZGBiuVIPM0SWuSWukwRpukoN2FvwXm8M49mBt4gZJ
 NygLvVcQy9wVkHHsL11vxW1j0iSlECJkVPKCSHXjCCd86HJW2v93dFxBVEMBI4/37xaH0Zxz
 P40EglYO3hvh8ruqF66Yuxlh8BmNdeyeY1A4zdvyjbWCftgSpfGK0nIzYUAjXFg24YURKeYO
 JNxhTlHNXwsZzVGPkcRBIgWlvrui3XiG9FdgAjO/vNrvDOInGSd1pDPOuj7deSmSf5NoRnIu
 V7N1Eb/XCgVYYn3JT2ttyjEavX0tTr2XZ9XGLCm+/pChlqVyWoOThoMWjOGTeKRj0e/X5dGN
 RVR9HV366c180OvQ5/2WBjQTGO4gyPwkuF4S4USgDxhAIKOi+pFLgDolgJ8VeE=
IronPort-HdrOrdr: A9a23:odZE/aE6vGbnn4WtpLqFfpHXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6fatskd3ZJhSo6HnBEDgewKqyXcb2/h1AV7PZmfbUQiTXfdfBOnZslnd8kTFn4Ywup
 uIGJIfNDSENykZsS+M2njaLz9P+ri62ZHtod2b42ZmTAlsZa0lxRx+EBynHkp/QxQDLYYlFb
 KHj/A37waISDAyVICWF3MFV+/Mq5ngj5T9eyMLABYh9U2nkS6o0rjnCBKVty1uGA+ngI1Su1
 QtoTaJqplLgMvLhSM0EFWjoai+reGRh+erwvb8y/T9ZA+cyjpAL74RIoFq9ApF2N1Hrmxa2e
 Uk6i1QRPhb+jffeHq4rgDq3BSl2DEy62X6wVvdmnf7p9flLQhKefapqLgpAicx0XBQz+1Uwe
 ZOxSaUppBXBRTPkGD04MXJTQhjkg6xrWA5meAegnRDWc9GAYUh2bA37QdQCtMNDSj64IcoHK
 1nC9zd/u9fdRefY2rCtmdizdSwVjA4HwuAQEIFpsuJugIm6UxR3g8d3ogSj30A/JUyR91N4P
 nFKL1hkPVUQsoffctGdZY8qAuMexLwqD73QR6vyA7cZds60lr22uPKyaRw4v22c5oVy5Z3kI
 jdUTpjxBEPR34=
Received: from mail-qv1-f71.google.com ([209.85.219.71])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Oct 2022 09:44:44 -0400
Received: by mail-qv1-f71.google.com with SMTP id
 q6-20020a0cf5c6000000b004b1999f94bcso6816135qvm.15
 for <qemu-devel@nongnu.org>; Mon, 17 Oct 2022 06:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=F7+1KpaV2oLuCakdJxoHvb4ftmVsXBc8KNJ3r6ep3Og=;
 b=Vy3UtazbcsqWar8aFvWUTR7QmdbCx32q+qcTXMK4bwpp5VubDWAghgxv4oWbf488jL
 kuPUraveuxmRd9RdnYMJTmkUXn7zurPkxxWRjI+CZFOpbzS0e+2EK3vb1u7CvvSBKvnu
 LpwxmoKCEqqJtGeWptyvuSelbF4YpRitrrJXobqEvnQ7M9NzJS1dgf6mvQYWgswwTMSv
 PITNBktPfEnDJw9/ndPXnRVqkoSgV/NMmPCUm0aGo+EC7vbDE/cdBoAVpebuFxplclrs
 D8/KC7omhpRV2ckuk7K0yo4wOnjok6AJ/PcvUSeH8684hIj3lGAEyJQuIPefu8Tt0jV6
 u60Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F7+1KpaV2oLuCakdJxoHvb4ftmVsXBc8KNJ3r6ep3Og=;
 b=o/0pJtfTA7nelOMPpDrRmAWYIQGvFAQQPXTmGSezn3FNj+ZkWNJ0TruRPpkOf8IaFe
 WgLKxcLnYa0CRb5p9yRW6FxOxULibCKCjxCFFLhW9IniNyj+ARsdqXIM9y+kfq7zy7/8
 gm5HM7xnl2mVoyVGkY86RQbilP5CN73h1j8dAwLhZ3jQAjJfd/6y0ntYwI9wQhI7BJzx
 Ceuv4rzK785WqcOv4ZxxTsxGl6anjBpowbnFVvyp+8Gk/7xP1Akhh7C88atgSwfLRI0n
 pPhaiJSJtIfvVQDwbv9YYK97UP88OG7FN+bLmJG6v+5KdnkZyzykUvhSi/42iCBKaMbr
 6ygA==
X-Gm-Message-State: ACrzQf0BpPKAUX9F7xFo6dpNb4RpWPLs3k/I9ZU2fjybIwGB/5enN9i4
 k+DEjageSZJO7y/Oyih1eV7sX+kgnGLiQhLlYHKM9AFYfeOKU9PERmeX1rH5GHHmg31TpiELqW3
 TzSbZmGoflwp8wEBRg8T6IUC+Q4q3NA==
X-Received: by 2002:ac8:5844:0:b0:39c:ea8a:82d4 with SMTP id
 h4-20020ac85844000000b0039cea8a82d4mr4269075qth.399.1666014283533; 
 Mon, 17 Oct 2022 06:44:43 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4Yx5XP1C/CicpZz6PN1HN7BQUoyG8yr0YDZsOMByuKIQyQfDqUnrubEiK6JvEDxIvTv8Tq9Q==
X-Received: by 2002:ac8:5844:0:b0:39c:ea8a:82d4 with SMTP id
 h4-20020ac85844000000b0039cea8a82d4mr4269045qth.399.1666014283227; 
 Mon, 17 Oct 2022 06:44:43 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 t6-20020a05620a450600b006b8e8c657ccsm9561475qkp.117.2022.10.17.06.44.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 06:44:42 -0700 (PDT)
Date: Mon, 17 Oct 2022 09:44:25 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Chris Friedt <chrisfriedt@gmail.com>
Cc: qemu-devel@nongnu.org, cfriedt@meta.com, jslaby@suse.cz
Subject: Re: [v2] hw: misc: edu: fix 2 off-by-one errors
Message-ID: <20221017134425.jbqvtccg5w4yej5g@mozz.bu.edu>
References: <20221015211025.16781-1-chrisfriedt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221015211025.16781-1-chrisfriedt@gmail.com>
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=68.232.153.39; envelope-from=alxndr@bu.edu;
 helo=esa1.hc2706-39.iphmx.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.898, HK_RANDOM_FROM=0.999, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 221015 1710, Chris Friedt wrote:
> From: Christopher Friedt <cfriedt@meta.com>
> 
> In the case that size1 was zero, because of the explicit
> 'end1 > addr' check, the range check would fail and the error
> message would read as shown below. The correct comparison
> is 'end1 >= addr' (or 'addr <= end1').
> 
> EDU: DMA range 0x40000-0x3ffff out of bounds (0x40000-0x40fff)!
> 
> At the opposite end, in the case that size1 was 4096, within()
> would fail because of the non-inclusive check 'end1 < end2',
> which should have been 'end1 <= end2'. The error message would
> previously say
> 
> EDU: DMA range 0x40000-0x40fff out of bounds (0x40000-0x40fff)!
> 
> This change
> 1. renames local variables to be more less ambiguous
> 2. fixes the two off-by-one errors described above.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1254
> 
> Signed-off-by: Christopher Friedt <cfriedt@meta.com>

Reviewed-by: Alexander Bulekov <alxndr@bu.edu>

As a side-note, seems strange that edu_check_range will abort the entire
VM if the check fails, rather than handling the error more elegantly.
Maybe that's useful for students developing kernel drivers against the
device.

> ---
>  hw/misc/edu.c | 25 ++++++++++++-------------
>  1 file changed, 12 insertions(+), 13 deletions(-)
> 
> diff --git a/hw/misc/edu.c b/hw/misc/edu.c
> index e935c418d4..52afbd792a 100644
> --- a/hw/misc/edu.c
> +++ b/hw/misc/edu.c
> @@ -103,25 +103,24 @@ static void edu_lower_irq(EduState *edu, uint32_t val)
>      }
>  }
>  
> -static bool within(uint64_t addr, uint64_t start, uint64_t end)
> +static void edu_check_range(uint64_t xfer_start, uint64_t xfer_size,
> +                uint64_t dma_start, uint64_t dma_size)
>  {
> -    return start <= addr && addr < end;
> -}
> -
> -static void edu_check_range(uint64_t addr, uint64_t size1, uint64_t start,
> -                uint64_t size2)
> -{
> -    uint64_t end1 = addr + size1;
> -    uint64_t end2 = start + size2;
> -
> -    if (within(addr, start, end2) &&
> -            end1 > addr && within(end1, start, end2)) {
> +    uint64_t xfer_end = xfer_start + xfer_size;
> +    uint64_t dma_end = dma_start + dma_size;
> +
> +    /*
> +     * 1. ensure we aren't overflowing
> +     * 2. ensure that xfer is within dma address range
> +     */
> +    if (dma_end >= dma_start && xfer_end >= xfer_start &&
> +        xfer_start >= dma_start && xfer_end <= dma_end) {
>          return;
>      }
>  
>      hw_error("EDU: DMA range 0x%016"PRIx64"-0x%016"PRIx64
>               " out of bounds (0x%016"PRIx64"-0x%016"PRIx64")!",
> -            addr, end1 - 1, start, end2 - 1);
> +            xfer_start, xfer_end - 1, dma_start, dma_end - 1);
>  }
>  
>  static dma_addr_t edu_clamp_addr(const EduState *edu, dma_addr_t addr)
> -- 
> 2.36.1
> 
> 

