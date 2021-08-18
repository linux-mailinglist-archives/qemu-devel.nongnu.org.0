Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 866453F0DDE
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 00:06:08 +0200 (CEST)
Received: from localhost ([::1]:49128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGThH-0008EX-IR
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 18:06:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGTfX-0007Hh-Ix
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 18:04:19 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:35810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGTfW-000626-60
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 18:04:19 -0400
Received: by mail-wr1-x42d.google.com with SMTP id q10so5814247wro.2
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 15:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MpIJsKpMtG3b1pFeZXAfqSZ7sqDzsCvK+dT30YNpR9U=;
 b=c2KGMYZGxp2npWB3vrcLFqTj0Y83RgKMaKMDGTImG1stF+9T3aiNdY7bGmbjST3/tJ
 EDwr9ziZKSkULPNh9wQ1J56mvhBubQ2YE1CufU4PPaI3+d42oEeGCBhvPlkd/OUYQ4Kn
 jFX96iui24+h/e/9gpaxP33XZz73xoJfXNysLt7bICp05Iom3DDKAYrZnYzRIEMGkRxs
 C5EkSb313NVkWG2sKQLZUkuVrJ930Mwa/iNWV9fcncXfzB1rI5E6fZySVCsM7cSWIqOj
 g6v6S4olkGijAQ9bvthlc59I9dD6YGGhoQCPz1kAjE8U+obfjFPi0Z+kxOH40xzIIJ8l
 O0eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MpIJsKpMtG3b1pFeZXAfqSZ7sqDzsCvK+dT30YNpR9U=;
 b=nHaM8qjBUJwmJYR8jkZDLb+ekEEtXFCENRi1Ib5l4/c7FHEIWAMHDu2NWgFmTVCUOt
 UCxPpNzLsyAxpbdNwHv7vaUiorHw6ITd2RmApgBDpm3v6iOZ1owSL3ZmDu5NLh3xlGRN
 vGVeXx5aGrTebQjYEwv0vfUg4QELogGMoJLot4jX7VxVo4ytxY+zqqN8KO6Wh8nGItIE
 8u2eFypMeM92O5R4QyPRrvofrMSuQNvuuOSvbt9zC381WtYftc01OUlX7wpQA1iZUVtj
 +GGXG8g7t+K3qETe3ZUdiE+oZoHUyRwKwvZsf4O2Pg11748xdJVbBWwovIkq0dnnMhGV
 Gb6A==
X-Gm-Message-State: AOAM530G753HCCVRuGmkq6jDRIfDJIlk6T3rqmQWiFgfdsIO/YRvTgMM
 VzZWPhTNnZ03j/ab7lVKw2S0CnD+jmM=
X-Google-Smtp-Source: ABdhPJxNIoC31kQdqH41OzSj4shY9YiRFSc98cao7y9ItrmAYAXU876Q4hMUNvlrL7rw4B5uqnw7/g==
X-Received: by 2002:a5d:610d:: with SMTP id v13mr13158696wrt.199.1629324256206; 
 Wed, 18 Aug 2021 15:04:16 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id j17sm994923wrt.69.2021.08.18.15.04.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 15:04:15 -0700 (PDT)
Subject: Re: [PATCH v3 10/14] tcg/arm: Give enum arm_cond_code_e a typedef and
 use it
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210818212912.396794-1-richard.henderson@linaro.org>
 <20210818212912.396794-11-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a862b97a-1fc8-de71-1cfd-4a2e1a4a9299@amsat.org>
Date: Thu, 19 Aug 2021 00:04:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210818212912.396794-11-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.961,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

On 8/18/21 11:29 PM, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/arm/tcg-target.c.inc | 136 +++++++++++++++++++--------------------
>  1 file changed, 68 insertions(+), 68 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

