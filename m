Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E09581BC3
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 23:46:27 +0200 (CEST)
Received: from localhost ([::1]:59742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGSNm-0000zR-CS
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 17:46:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oGSLg-0007uF-9l
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 17:44:16 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:33433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oGSLe-0008IW-OG
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 17:44:16 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 f11-20020a17090a4a8b00b001f2f7e32d03so1798169pjh.0
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 14:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Y9mhsEn/4vqp0Tyupt7ORRe6ak75G4kfKy9GeIShSEY=;
 b=EsejyOaqUoEcQOQBOI0rUSeh6nHcJQFOefI7mJAEj0zIjbjFC9J9umHLT6dcZ9RoeO
 kQmFAVIMlJMD6z+slOqjRQ+4VjpBMeWsnty09gTJkIGkqYGmUvNXkH8C1VgWeI8DE1jC
 nwzcZ0ts85IglHVK6nIHdBKzgpz1QUxybMU8Rjfn89JKoW8KOyivUtBvpaG5D98TEWHz
 hV9SuLOLXmNjKtGQ6gtflNQY13lssPeJOTkndEd8jZ6VSMmDFhGpO5SzcawHQ77STLta
 j0lxXn2U73kLrxA2+cR7wJ28w9N0+XadvY89X8JxhXJQuiV5NdC7kmZzVpuY3CrQLI5p
 FaKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Y9mhsEn/4vqp0Tyupt7ORRe6ak75G4kfKy9GeIShSEY=;
 b=d83/RbKsHBEsQ+P5Ak1dPNNBEJ9Po9aOS/IBmESbA7z5AImYFMjiLkcadtBf1C0Mxy
 0+hxrthJWm8SN39rGfkk2x7LDwd4OXxKf/oa1jOQWdWL+/zntz+64nclMJt67kms1V/a
 Mhr9nS+Gj27iA6CZjfq0QUMAhVkGiogiVkH28C/CHbbGqHRAdpbR2jhjmvUep/RkSWXW
 E6YBWyE8OBmHdObsArH2Cm9ndGVrLyJhUkAea1A9gJkKYP5+CqbjP7DQOXJDDmejHtvE
 WkT9lJ/mXmqY3MxAHa4DPx/NkmpIyZXK1ngsS8Ij1KjR+faC1L0pMK+/U24tVFQRRFtc
 P+BA==
X-Gm-Message-State: AJIora+MPSNiBXaHwHei3TPNNe+QkUMMIHudmbycXEX9rpfDks3NORh/
 zH7ti24sKqPRSfwA20fN6T8=
X-Google-Smtp-Source: AGRyM1vE2bz1glb4dIM9knyT7bijiE1qXgUXZo+Q0q63V/zK5L3osO9RGPxjRorooV/IDwO0d1tWVw==
X-Received: by 2002:a17:902:d507:b0:16d:7d89:15dc with SMTP id
 b7-20020a170902d50700b0016d7d8915dcmr9775751plg.31.1658871853097; 
 Tue, 26 Jul 2022 14:44:13 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 my10-20020a17090b4c8a00b001f23db09351sm47519pjb.46.2022.07.26.14.44.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Jul 2022 14:44:12 -0700 (PDT)
Message-ID: <943057f3-1fa4-90e9-1f2d-37fdd81015b4@amsat.org>
Date: Tue, 26 Jul 2022 23:44:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH] Hexagon (tests/tcg/hexagon) add compiler options to
 EXTRA_CFLAGS
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, 
 mlambert@quicinc.com
References: <20220726191757.30104-1-tsimpson@quicinc.com>
In-Reply-To: <20220726191757.30104-1-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102d.google.com
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

Hi Taylor,

On 26/7/22 21:17, Taylor Simpson wrote:
> The cross_cc_cflags_hexagon in configure are not getting passed to
> the Hexagon cross compiler.  Set EXTRA_CFLAGS in
> tests/tcg/hexagon/Makefile.target.
> 
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> ---
>   tests/tcg/hexagon/Makefile.target | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tests/tcg/hexagon/Makefile.target b/tests/tcg/hexagon/Makefile.target
> index 23b9870534..627bf58fe6 100644
> --- a/tests/tcg/hexagon/Makefile.target
> +++ b/tests/tcg/hexagon/Makefile.target
> @@ -20,6 +20,7 @@ EXTRA_RUNS =
>   
>   CFLAGS += -Wno-incompatible-pointer-types -Wno-undefined-internal
>   CFLAGS += -fno-unroll-loops
> +EXTRA_CFLAGS += -mv67 -O2
>   
>   HEX_SRC=$(SRC_PATH)/tests/tcg/hexagon
>   VPATH += $(HEX_SRC)

My understanding of Richard suggestion is something like:

-- >8 --
@@ -45,6 +45,8 @@ HEX_TESTS += overflow

  TESTS += $(HEX_TESTS)

+$(filter-out usr, $(HEX_TESTS)): CFLAGS += -mv67 -O2
+
  # This test has to be compiled for the -mv67t target
  usr: usr.c
         $(CC) $(CFLAGS) -mv67t -O2 -Wno-inline-asm 
-Wno-expansion-to-defined $< -o $@ $(LDFLAGS)
---

Eventually to keep the same style in the file:
-- >8 --
@@ -46,6 +46,5 @@ HEX_TESTS += overflow
  TESTS += $(HEX_TESTS)

  # This test has to be compiled for the -mv67t target
-usr: usr.c
-       $(CC) $(CFLAGS) -mv67t -O2 -Wno-inline-asm 
-Wno-expansion-to-defined $< -o $@ $(LDFLAGS)
+usr: CFLAGS += -mv67t -O2 -Wno-inline-asm -Wno-expansion-to-defined
---

Regards,

Phil.

