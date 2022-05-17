Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A98952AAF5
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 20:34:31 +0200 (CEST)
Received: from localhost ([::1]:35744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nr21W-0007hi-TS
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 14:34:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nr1yL-0001z1-CS
 for qemu-devel@nongnu.org; Tue, 17 May 2022 14:31:09 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:43588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nr1yJ-0005A4-Oi
 for qemu-devel@nongnu.org; Tue, 17 May 2022 14:31:05 -0400
Received: by mail-pl1-x62b.google.com with SMTP id i17so18074074pla.10
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 11:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=KO5gt18W0nvkdCeiFjzPVRBxtkBn6eM2T4o/ZW4uD28=;
 b=y0gMzr9fazaRATXTdT8M1B+QQEqf0MtH/BWfAuITq/Xe5BZr5NlOc1z0pM7aZKI3Gx
 8ChqelWcsww476MiBFYKu/eGGXUfY+ciM3NLaQy+IZVoO7iLhwMeZEuPQ6UO+pjh1FX5
 ahxdgeawzWHDSXRVVgUDWZkzuR2urwvMifcxbJWqz6jnPKiixe2jWRlEmpvrkPwnD4yN
 CB/AfLGt1b854GaX+7N3Xjg0EOVScEtPLRwFKmcf8pK8PddYO42X3Z85wBJ3zRkfCRrF
 XGZHILXKmSTFREJkJzICbv9qZApLj1Xw1bgqMkSpOpdxSPUiwzBcffeYTYCBzP255VZz
 x2nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KO5gt18W0nvkdCeiFjzPVRBxtkBn6eM2T4o/ZW4uD28=;
 b=MVINewALMJkm1/dFRAukF99ri0L+zRbaaTiTXgKfCeLY1qmfcaUjDvjtR7bI0JWqT4
 4r+Fuzk/r2ir+qiA5fC695pDuwkeuoNMYq73Y5qTR254eyKfJG6hdINV2zMyNU6+/FvM
 dIZXs9WH/dPJPQjcky/pMtve7xJ4LmOTO6IkEesr/PaLiC4y4dVTw4oWaAQt92T1Rts9
 NViycQgP01JLYmjxeLNQJuzzfYQ2nx4NyKLYHPeEXFO14RZwuZtXsoGXd9bo4YuaV3nG
 3OP7KwFIo3k88Yy6cBB6AyubDnyOPh6SF7BcC/sXQ1jxRyukSVniFf55GzwwzIYJ8bGZ
 mE+A==
X-Gm-Message-State: AOAM531aCYuOWlynlNceGpq5SSgaA2Z8QiKCY8ucG5AQMsi23YGbQOyU
 EvhYTsxwfHFLDHotrGfoqJ4B4w==
X-Google-Smtp-Source: ABdhPJwbGXoz/+58KBrcsZrjTr0n1kvrVZNRNCd1Uv86BlMdsoIUL/wUVgBfIwjyoePpldJIoi3a3Q==
X-Received: by 2002:a17:902:6a85:b0:161:96bc:ef5d with SMTP id
 n5-20020a1709026a8500b0016196bcef5dmr7630786plk.46.1652812262516; 
 Tue, 17 May 2022 11:31:02 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 r19-20020a170903021300b0015e8d4eb26esm9482098plh.184.2022.05.17.11.31.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 11:31:01 -0700 (PDT)
Message-ID: <38ffbaa0-4cca-bc6b-2e7e-6172fcc92263@linaro.org>
Date: Tue, 17 May 2022 11:30:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH RESEND 03/10] target/ppc: Move mffsl to decodetree
Content-Language: en-US
To: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org
References: <20220517164744.58131-1-victor.colombo@eldorado.org.br>
 <20220517164744.58131-4-victor.colombo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220517164744.58131-4-victor.colombo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/17/22 09:47, Víctor Colombo wrote:
> Signed-off-by: Víctor Colombo<victor.colombo@eldorado.org.br>
> ---
>   target/ppc/insn32.decode           |  4 ++++
>   target/ppc/translate/fp-impl.c.inc | 27 ++++++++-------------------
>   target/ppc/translate/fp-ops.c.inc  |  2 --
>   3 files changed, 12 insertions(+), 21 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

