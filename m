Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A54F16660CD
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 17:41:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFe9k-0006g8-G0; Wed, 11 Jan 2023 11:40:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFe9j-0006fA-4W
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 11:40:51 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFe9h-0008KF-6C
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 11:40:50 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 k22-20020a05600c1c9600b003d1ee3a6289so13151191wms.2
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 08:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=al2lGChPUZ3u+04q/VuYIYJIGmw3V4aA55LXLCAGrNc=;
 b=c5Pg7OwpjWmcQzY+01UbkCzo0MWGwqixZuh29s+Wrbyq+zOm/anYVg4YLDlDwwVGkF
 51bOEuS9fdbjhyhzhVVtUpk0uf/GKfnPvwenG5UApg5K26OHqV0ppIlEhbQeCn2AVQ8a
 F6teOD6bvVvWfWZ8SfAvqubMdmMZQwMKJv/77uHEvQNJ6YKdtggP3fO7A1JQI5VhBm1a
 MBCz/EhkT19lBjNzQBIwSU1cPU8w/QEGnEMBMochBhHNxkPz3WOVMPszWDZT2s1le6TK
 DpHminddWeWz22Xl+ulIfxC1pYTMtu1dFrP4rqvIkEN9o99yizgZeRorE3K/tR6DiElZ
 wDIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=al2lGChPUZ3u+04q/VuYIYJIGmw3V4aA55LXLCAGrNc=;
 b=2vi47/ZL0TRuKAkbdqEEgE2MNoxVZk6FxQ0bACp7BX57ojdFqtequ52HM/Wq8xP1ZD
 BQuR5PDOSumdmny7mRbRYEvK9b/NeOICRCs+gLzUqWbnuaxuXU8bf6Azrv6idcH4h8xN
 aFVFUsQcxY2AfGukRsra7FTniBS/tbeZmZ6iwfq9V0xEH0ri5cwTigKW1jIkhhMr7fak
 RhhtxB8Tas68oXsecrhfRGUccglyrH39JsDjkEoKGa1Di3FiN8ieebYy6JUgDe+5wJGP
 LgFsvuX0ymTAsbKrqEvXz0Il6KBTTA4ayEQ7u/PdcIaCbN5DnAQ+srQty7Rq9l6DVFJA
 11pA==
X-Gm-Message-State: AFqh2kpBKvldWqjciznSM5GOPVhea9+GVfNcVLB2XOMSKtK+s9NEix7w
 v4JN8XDUGee7dpogkHqPKLoYyw==
X-Google-Smtp-Source: AMrXdXs2Khrvo3qBkzDDJlR3UNHhL18rQ/QKGKYO0vpabeNFRzD8PS/h83ffRkQwx1ju2t5qn36enA==
X-Received: by 2002:a05:600c:358a:b0:3cf:8d51:1622 with SMTP id
 p10-20020a05600c358a00b003cf8d511622mr53918847wmq.1.1673455247755; 
 Wed, 11 Jan 2023 08:40:47 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 e18-20020a05600c4e5200b003d9876aa04asm22563096wmq.41.2023.01.11.08.40.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 08:40:47 -0800 (PST)
Message-ID: <8cb2447b-a2e6-f137-5cb3-a5439a35bb7f@linaro.org>
Date: Wed, 11 Jan 2023 17:40:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 6/8] qemu/bswap: Add const_le64()
Content-Language: en-US
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>, qemu-devel@nongnu.org,
 Michael Tsirkin <mst@redhat.com>
Cc: Ben Widawsky <bwidawsk@kernel.org>, linux-cxl@vger.kernel.org,
 linuxarm@huawei.com, Ira Weiny <ira.weiny@intel.com>,
 Gregory Price <gourry.memverge@gmail.com>
References: <20230111142440.24771-1-Jonathan.Cameron@huawei.com>
 <20230111142440.24771-7-Jonathan.Cameron@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230111142440.24771-7-Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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

On 11/1/23 15:24, Jonathan Cameron via wrote:
> From: Ira Weiny <ira.weiny@intel.com>
> 
> Gcc requires constant versions of cpu_to_le* calls.
> 
> Add a 64 bit version.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Ira Weiny <ira.weiny@intel.com>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
>   include/qemu/bswap.h | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/include/qemu/bswap.h b/include/qemu/bswap.h
> index 346d05f2aa..e1eca22f25 100644
> --- a/include/qemu/bswap.h
> +++ b/include/qemu/bswap.h
> @@ -187,6 +187,15 @@ CPU_CONVERT(le, 64, uint64_t)
>    * used to initialize static variables.
>    */
>   #if HOST_BIG_ENDIAN
> +# define const_le64(_x)                          \
> +    ((((_x) & 0x00000000000000ffU) << 56) |      \
> +     (((_x) & 0x000000000000ff00U) << 40) |      \
> +     (((_x) & 0x0000000000ff0000U) << 24) |      \
> +     (((_x) & 0x00000000ff000000U) <<  8) |      \
> +     (((_x) & 0x000000ff00000000U) >>  8) |      \
> +     (((_x) & 0x0000ff0000000000U) >> 24) |      \
> +     (((_x) & 0x00ff000000000000U) >> 40) |      \
> +     (((_x) & 0xff00000000000000U) >> 56))

So looking back at 
https://lore.kernel.org/qemu-devel/20200917163106.49351-4-philmd@redhat.com/
this patch missed to update the function description:

  /*
- * Same as cpu_to_{be,le}{16,32} described below, except that gcc will
+ * Same as cpu_to_{be,le}{16,32,64} described below, except that gcc will
   * figure the result is a compile-time constant if you pass in a constant.
   * So this can be used to initialize static variables.
   */



