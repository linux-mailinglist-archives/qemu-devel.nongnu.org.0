Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C54FF594B9B
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 02:24:06 +0200 (CEST)
Received: from localhost ([::1]:40604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNkNJ-0003l1-TA
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 20:24:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oNkMD-0002Q9-4S
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 20:22:57 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:53104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oNkMB-0002me-O3
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 20:22:56 -0400
Received: by mail-pj1-x102a.google.com with SMTP id ha11so8341284pjb.2
 for <qemu-devel@nongnu.org>; Mon, 15 Aug 2022 17:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc;
 bh=OxNf1G6yym7w+I9RnhhxnSqpSlxRFJDX7p+FQvdbb2A=;
 b=HtGU6LZpR+MC0Si44RclWDc5IkxnUFCrDcAaynyz7r/q05vjV1k0YpNDwZenmZ+T+X
 eR2ZTKIFuIXLXAmFZhfxz9t6TvGb22jbVi6CBAOtY5anWNjsTdDx2l712uvr2Aie99ky
 GsccR58S7iv21ZK4DAViSDMqfYG+8ySkgReBqpJ1d93th1DI9bpYuQx57FaTgsKQN2AJ
 F0MXzcs3jCDWCx2tddpCLOaRNAdMWHxZipnub2FiyMSroIrje5PZ1cdoBl49Bn8ndKWX
 Fb6aRth3Fn/EdmQnMav1ggFZLvpyqN03jeUU1Jw10zNR9mpNIyl++IiNwbtU22qzupMV
 ndEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc;
 bh=OxNf1G6yym7w+I9RnhhxnSqpSlxRFJDX7p+FQvdbb2A=;
 b=FCaQ0ie4DFpperas60Xtoa2WcgjPoSxzSNjOBF2ZL2siL9dJMaYHCt7hzJaRbJANuC
 4N2SpCb4yGrjEfursWIEPQCYGCzvyCtYOI85RqQ4Q8Hnw/fnCDF7QZs+EAb5gphgALNL
 6+ZuDLA1PjHxJPwHreX+riUZ63iVE25PhTaN7b3P/Gq2F83HF0wM/+8kIQHQCGROJGHE
 njWt91+eeElvqM9tXrdn/rYx8e2wLKnxF68yCh6GslnEIkzfq26bsz7Xo1BKvTvxMWV2
 YkupuC1T/Vuzy1W6FtEMGmw1HI0lhdKfe9fRotgGfwiOyFe3lri5aJV0qAZ5692fAfFq
 f/BA==
X-Gm-Message-State: ACgBeo3Uhg2btn/KAomcxsIjiGTb7gBHS57ZbFKGRfTIy+JbwTqvPlcS
 x3YLQCsGmOLp7zbx+xrGxoc=
X-Google-Smtp-Source: AA6agR5RByoixdiBGsLeGhlIiic/YUE9NpNfvz9vhdyRDoTPT2OHgLCbA8gwFrhGmqEr4h+yGGqDLQ==
X-Received: by 2002:a17:902:f349:b0:171:4d1b:5ff5 with SMTP id
 q9-20020a170902f34900b001714d1b5ff5mr19474223ple.94.1660609374010; 
 Mon, 15 Aug 2022 17:22:54 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 k15-20020a170902c40f00b0016dd6929af5sm7587870plk.206.2022.08.15.17.22.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Aug 2022 17:22:53 -0700 (PDT)
Message-ID: <a50d77f2-68a5-ab65-4911-eef14ebee9a7@amsat.org>
Date: Tue, 16 Aug 2022 02:22:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH 19/20] disas/nanomips: Add modifier static
Content-Language: en-US
To: Milica Lazarevic <milica.lazarevic@syrmia.com>, thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com
References: <20220815072629.12865-1-milica.lazarevic@syrmia.com>
 <20220815072629.12865-20-milica.lazarevic@syrmia.com>
In-Reply-To: <20220815072629.12865-20-milica.lazarevic@syrmia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 15/8/22 09:26, Milica Lazarevic wrote:
> Modifier static has been added to the remaining functions that shouldn't
> be used outside of the nanomips disassembler.
> 
> Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
> ---
>   disas/nanomips.cpp | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
> index e7d6bffe84..6cb527d1f7 100644
> --- a/disas/nanomips.cpp
> +++ b/disas/nanomips.cpp
> @@ -114,13 +114,13 @@ static const char *to_string(img_address a)
>   }
>   
>   
> -uint64 extract_bits(uint64 data, uint32 bit_offset, uint32 bit_size)
> +static uint64 extract_bits(uint64 data, uint32 bit_offset, uint32 bit_size)
>   {
>       return (data << (64 - (bit_size + bit_offset))) >> (64 - bit_size);
>   }
>   
>   
> -int64 sign_extend(int64 data, int msb)
> +static int64 sign_extend(int64 data, int msb)
>   {
>       uint64 shift = 63 - msb;
>       return (data << shift) >> shift;
> @@ -463,7 +463,7 @@ static uint64 encode_shift3_from_shift(uint64 d)
>   
>   
>   /* special value for load literal */
> -int64 encode_eu_from_s_li16(uint64 d)
> +static int64 encode_eu_from_s_li16(uint64 d)
>   {
>       IMGASSERTONCE(d < 128);
>       return d == 127 ? -1 : (int64)d;
> @@ -22780,7 +22780,7 @@ static struct Pool MAJOR[2] = {
>   };
>   
>   
> -int nanomips_dis(char *buf,
> +static int nanomips_dis(char *buf,
>                    unsigned address,
>                    unsigned short one,
>                    unsigned short two,

This seems to belong to patch #4 "Remove helper methods from class",
shouldn't this be squashed there?

