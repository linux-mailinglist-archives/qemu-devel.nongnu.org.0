Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7236AB7ED
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 09:07:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ5rz-0005H5-Im; Mon, 06 Mar 2023 03:06:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZ5rx-0005AX-BZ
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 03:06:53 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZ5rv-0006YX-M8
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 03:06:53 -0500
Received: by mail-wr1-x42d.google.com with SMTP id q16so7846862wrw.2
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 00:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678090010;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gaT7dqRDUOSuvcXvQ3WrPmljE4XGecFYj7GQ+PTG+hU=;
 b=i61xSKWgoThNQUZRwbMyqmRoslSgsdqOoI0pViLTCn9Hp8uT7wqRR00O/8E2j55FbN
 8wyD/093A9DVvRAAd++TI5bSLDsbCcEiKKquUjWwV+fSGwiia3wc8wLNLcTKvuAZjxd+
 b+HUM7nYyMqDsHUnhv5S2srBy9S1/uVI+fxkJu0utefufgtNVbaf/rRuhSAy0Of1Rn1s
 OSViuLaiyz6wwKE7KUH8WvpGyehjTEAcMSf2a/y5Sh3iBqUZ240ReY98+geFKdgB+ZTH
 k+qpNIldGBOlXWN6K47BVv6d1xmkpFJSE6NwzHBjviZw+lJy+ubNs5jvM8dGJAWHIew2
 izLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678090010;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gaT7dqRDUOSuvcXvQ3WrPmljE4XGecFYj7GQ+PTG+hU=;
 b=ibDbUVTNNhklt+/KvS7hkXHBthlxn3fj18On2VeBxCcPK13Lgmb6eIZBxIOTYaXpXU
 lN83tN7XjEE3TH4rxFobmP7NCvbf6zztNBkrYO2OvhPmd0zOyxLYaLpOzRjxcxlmen3o
 G4/Y4VW1hJNkTawxhwiieFlAz4OEiO2h1cGxM/fgFe+vm9nm1huY/HuIzEK4Uogw9FVG
 3ysOkzjUnGwzVGiwRvqn7G8dnfhz5vDip0K6WlDl1E9B9HxAwqPM6aQcqyXWblTg0KnG
 MlOLYWTPyMLVNm41Vnef/gTYbnpHdPVo3kNXsYhvxi7YO32PW5DvQxft0FgmVT6/LdCq
 NhEg==
X-Gm-Message-State: AO0yUKVrbT+sJXnaWsMoVTDrcxu/szckh4mrXoXTuI07auznw0u2l4aB
 fPSuWMrYhdF5Zcb2EcCfKDB1PVle03j7FJ9XegY=
X-Google-Smtp-Source: AK7set+ulPrM4KS/YzRoGN7+FVUUu19WF5Ptx0yQv1vFzIqTlbkLrdduXBn6E3WA8QSTOd4k7GjXYg==
X-Received: by 2002:a05:6000:1189:b0:2cc:4dac:fe39 with SMTP id
 g9-20020a056000118900b002cc4dacfe39mr6303971wrx.12.1678090009928; 
 Mon, 06 Mar 2023 00:06:49 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 g15-20020a5d554f000000b002c5526234d2sm9177127wrw.8.2023.03.06.00.06.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 00:06:49 -0800 (PST)
Message-ID: <16306572-e3e7-06d6-f7f4-e4b3299764eb@linaro.org>
Date: Mon, 6 Mar 2023 09:06:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v3 00/20] tcg: drop tcg_temp_free from translators
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20230304181900.1097116-1-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230304181900.1097116-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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

On 4/3/23 19:18, Richard Henderson wrote:

> Richard Henderson (20):
>    target/i386: Drop tcg_temp_free
>    target/mips: Drop tcg_temp_free from micromips_translate.c.inc
>    target/mips: Drop tcg_temp_free from mips16e_translate.c.inc
>    target/mips: Drop tcg_temp_free from msa_translate.c
>    target/mips: Drop tcg_temp_free from mxu_translate.c
>    target/mips: Drop tcg_temp_free from nanomips_translate.c.inc
>    target/mips: Drop tcg_temp_free from octeon_translate.c
>    target/mips: Drop tcg_temp_free from translate_addr_const.c
>    target/mips: Drop tcg_temp_free from tx79_translate.c
>    target/mips: Fix trans_mult_acc return
>    target/mips: Drop tcg_temp_free from vr54xx_translate.c
>    target/mips: Drop tcg_temp_free from translate.c
>    target/s390x: Drop free_compare
>    target/s390x: Drop tcg_temp_free from translate_vx.c.inc
>    target/s390x: Drop tcg_temp_free from translate.c
>    target/s390x: Remove assert vs g_in2
>    target/s390x: Remove g_out, g_out2, g_in1, g_in2 from DisasContext
>    target/tricore: Drop tcg_temp_free
>    tracing: remove transform.py
>    tcg: Create tcg/tcg-temp-internal.h

Series:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

>   26 files changed, 128 insertions(+), 1954 deletions(-)

:)

