Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE785E8C1F
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Sep 2022 14:14:59 +0200 (CEST)
Received: from localhost ([::1]:58872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oc43e-0003qV-Mo
	for lists+qemu-devel@lfdr.de; Sat, 24 Sep 2022 08:14:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oc40t-0000nc-23
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 08:12:07 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:37474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oc40q-0007as-8I
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 08:12:05 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 z13-20020a7bc7cd000000b003b5054c6f9bso4249200wmk.2
 for <qemu-devel@nongnu.org>; Sat, 24 Sep 2022 05:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=Y1yK+OOlaOwOV8eKHwlNXCmlPi63Iea3i2wdKu99C/s=;
 b=mekTmklOYRhgeD2X2D1eITZxYNB/BOwi3pDjOxraXvoxpWm/X2xBsIOsGlbQWBfurC
 IQQy42rxvDA6hPozHsCE4Pui+pAPHpFdm/AByIkfsYxpKOLZ2NATbnU5e8IfSrFx3tXr
 TlTeyoXVWO69s9pGzXzzIl+Fy+LZmIsT2Wn8ECo/PVU62JEmSCDMjNajE4F1N+tiCL3b
 U/Bumf/X6jhfB/jG8BjDtG1pVBiySxXqvIv4pYhqIcxml+kYv8YJCgwGFkFGkNS2Khb7
 A1XUh8UGeV5Ycl+5apXYNWC5cs7GUUBHA24JRuhkajEvHiTpJqI+BsA4T0+ZycHLc5q3
 +CKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=Y1yK+OOlaOwOV8eKHwlNXCmlPi63Iea3i2wdKu99C/s=;
 b=F9B0g78lqblY/lZu+p3s9sfxi0ZljHbovuG3yNYVbm3S8Ffn31riqCe8HFI0bIWBhd
 Utru0z5WG/xDvxRAG2aycxcrmCAMUOzSJmjHq4ZtG7/H3rjqPIZrN8iPdwsho/TDm8lw
 jhi1pV6wUXbIziufvchTQdstx8auTbT5Obt3dfYH5Rv7gG6Zb6vBBRvv+zOlMHme36Ia
 3SbIw4v8qtLHEPXMDFQArAWabZRuDR84CUs9BBxQrSA+w6NAxeBc7/A3goSsfhSUpCM6
 mG9/Z1/rddjuTwZBZ0cgv9fc4P4fHCTIRH8sU+x2m0PrIkvRRBj8fCI69ejHoDViE18+
 YVWA==
X-Gm-Message-State: ACrzQf2BimOGDjrjmCyB16/Kly7IX5mYuPkIVGhuO7QkdaYymvrPr3mY
 zxwh8lbez0iHaU0W/soom3Y=
X-Google-Smtp-Source: AMsMyM7Nn11bx8pyre1LORaHbpcBOoOjANdUwF5BSWqGnZ4+gYkfD32VUkcJJqpgoXlf8SN/hdNWoA==
X-Received: by 2002:a05:600c:1910:b0:3b4:bb80:c951 with SMTP id
 j16-20020a05600c191000b003b4bb80c951mr16354064wmq.81.1664021522427; 
 Sat, 24 Sep 2022 05:12:02 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 p37-20020a05600c1da500b003a3170a7af9sm5269504wms.4.2022.09.24.05.11.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Sep 2022 05:11:59 -0700 (PDT)
Message-ID: <627bbd08-d6b8-3570-9b77-14e25fdfdd33@amsat.org>
Date: Sat, 24 Sep 2022 14:11:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH v11 04/15] target/hexagon: make helper functions non-static
Content-Language: en-US
To: Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: ale@rev.ng, babush@rev.ng, nizzo@rev.ng, tsimpson@quicinc.com,
 bcain@quicinc.com, mlambert@quicinc.com, richard.henderson@linaro.org,
 alex.bennee@linaro.org
References: <20220804115548.13024-1-anjo@rev.ng>
 <20220804115548.13024-5-anjo@rev.ng>
In-Reply-To: <20220804115548.13024-5-anjo@rev.ng>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.118,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 4/8/22 13:55, Anton Johansson via wrote:
> From: Paolo Montesel <babush@rev.ng>
> 
> Make certain helper functions non-static, making them available outside
> genptr.c. These functions are required by code generated by the
> idef-parser.
> 
> This commit also makes some functions in op_helper.c non-static in order
> to avoid having them marked as unused when using the idef-parser
> generated code.
> 
> Signed-off-by: Alessandro Di Federico <ale@rev.ng>
> Signed-off-by: Paolo Montesel <babush@rev.ng>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
> ---
>   target/hexagon/genptr.c    | 61 +++++++++++++++++++++-----------------
>   target/hexagon/genptr.h    | 31 +++++++++++++++++++
>   target/hexagon/op_helper.c | 29 ++++++++----------
>   target/hexagon/op_helper.h | 37 +++++++++++++++++++++++
>   4 files changed, 115 insertions(+), 43 deletions(-)
>   create mode 100644 target/hexagon/op_helper.h

> diff --git a/target/hexagon/op_helper.h b/target/hexagon/op_helper.h
> new file mode 100644
> index 0000000000..9fbebf11c3
> --- /dev/null
> +++ b/target/hexagon/op_helper.h
> @@ -0,0 +1,37 @@
> +/*
> + *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
> + *
> + *  This program is free software; you can redistribute it and/or modify
> + *  it under the terms of the GNU General Public License as published by
> + *  the Free Software Foundation; either version 2 of the License, or
> + *  (at your option) any later version.
> + *
> + *  This program is distributed in the hope that it will be useful,
> + *  but WITHOUT ANY WARRANTY; without even the implied warranty of
> + *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + *  GNU General Public License for more details.
> + *
> + *  You should have received a copy of the GNU General Public License
> + *  along with this program; if not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#ifndef HEXAGON_OP_HELPER_H
> +#define HEXAGON_OP_HELPER_H
> +
> +/* Misc functions */
> +void cancel_slot(CPUHexagonState *env, uint32_t slot);

'unsigned slot'

> +void write_new_pc(CPUHexagonState *env, target_ulong addr);
> +
> +uint8_t mem_load1(CPUHexagonState *env, uint32_t slot, target_ulong vaddr);
> +uint16_t mem_load2(CPUHexagonState *env, uint32_t slot, target_ulong vaddr);
> +uint32_t mem_load4(CPUHexagonState *env, uint32_t slot, target_ulong vaddr);
> +uint64_t mem_load8(CPUHexagonState *env, uint32_t slot, target_ulong vaddr);

Ditto.

> +void log_reg_write(CPUHexagonState *env, int rnum,
> +                   target_ulong val, uint32_t slot);

Ditto.

> +void log_store64(CPUHexagonState *env, target_ulong addr,
> +                 int64_t val, int width, int slot);
'unsigned' :)

> +void log_store32(CPUHexagonState *env, target_ulong addr,
> +                 target_ulong val, int width, int slot);

Ditto.


