Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 634D23DBF6E
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 22:14:23 +0200 (CEST)
Received: from localhost ([::1]:51702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9Yth-0002k3-UD
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 16:14:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9YsV-0001T0-5s
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 16:13:07 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:37858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9YsR-0005Mf-UC
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 16:13:06 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 a4-20020a17090aa504b0290176a0d2b67aso22426173pjq.2
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 13:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=GfMhsEPK/7Sm7MHT9WSDgkZrAOZR+u9fjBLqNe+YCBk=;
 b=YVd6fXAlqa4Y/88xYkMaw2KLuyFTMD3031KCI3EOJshDKTaDda6r9cmDIgxF7T1VVQ
 YILojW1XWHb1z5kCt+X7D2hAp0YQkUWcxkqQ4sPnJik6tdOn0QnVHKqxM2AP96gi7m3X
 N9Cp1hodIxjU2Wr09ie3qrbM8oxy2Z2FMXicAtmIZvLvKqHmtwYsE9r9E+cnhoHYNthU
 Mn/Mh9CGrsl5NpnEB6JvFiBcXaLqJ/bo6jJcWCMBxrZDfh3l4/0v3QkeB9zPCsuvpSeW
 GOoprsHfb0iMjed8eu4tDa1893gPevbtjdJw+ijj83vSBcqaM23V/pzJYpj5qMVPpM0d
 6i+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GfMhsEPK/7Sm7MHT9WSDgkZrAOZR+u9fjBLqNe+YCBk=;
 b=BLlTauRUdvAVdJbLLGgliTzd63Hiav+lIcuTVNMsjkYbxg/GZCqsyLn/kQBt4LRIIR
 ZO1cEHY4X+xfPmviB7RqZRYiAoji8185gkzBbByFTEH4CAMQgsw+ZISgLsGmjJhrsyfP
 K8t/gTmM0BV8wCdkYoEmKj9fg5JA1h5xvfXCN2oaj36lJhS3HrWLvjKzQFkSW2t8dlbK
 E5z49/bxxLy/MN8mS8Lq0CZp2QHO1CWUk0bZbBW5cBrRyRkiYEGTG1MXZlkxzZNN4KtR
 2LeN5Y6pX7isLBUzlDPYxVDbp9HrCUYRj1OYDSxwYRkuaxo4AHiL3Hm0GBndQ1HBxNts
 O1gQ==
X-Gm-Message-State: AOAM531zf0SkfkoZsGOrRnRFvamJjK1cIMYEPRm7z2o7sY9mQAmkrzfd
 NfDoLhn9cDFAi1MqYkBj2Ysjvj68h5D5UQ==
X-Google-Smtp-Source: ABdhPJyIMaSHQlctyH2FHXlAQZIu9J/8q5k4NWj9Sn3GecIpGhblXNYewp7fOl48q9NWSR5UnjP6OQ==
X-Received: by 2002:a17:90a:6008:: with SMTP id
 y8mr4874139pji.81.1627675982260; 
 Fri, 30 Jul 2021 13:13:02 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe?
 (2603-800c-3202-ffa7-c4c7-6719-c57e-8ffe.res6.spectrum.com.
 [2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe])
 by smtp.gmail.com with ESMTPSA id h14sm3262480pfo.47.2021.07.30.13.13.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 13:13:01 -0700 (PDT)
Subject: Re: [PATCH for-6.2 45/53] target/arm: Implement MVE FP max/min across
 vector
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210729111512.16541-1-peter.maydell@linaro.org>
 <20210729111512.16541-46-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <547e4ace-a7e3-f5ad-bf53-42c82a993d81@linaro.org>
Date: Fri, 30 Jul 2021 10:12:59 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729111512.16541-46-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.125,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 7/29/21 1:15 AM, Peter Maydell wrote:
>   
>   {
> +  VMAXNMAV       1110 1110 1110  11 00 ....  1111 0 0 . 0 ... 0 @vmaxnmv size=2
> +  VMINNMAV       1110 1110 1110  11 00 ....  1111 1 0 . 0 ... 0 @vmaxnmv size=2
> +  VMAXNMV        1110 1110 1110  11 10 ....  1111 0 0 . 0 ... 0 @vmaxnmv size=2
> +  VMINNMV        1110 1110 1110  11 10 ....  1111 1 0 . 0 ... 0 @vmaxnmv size=2
>     VMAXV_S        1110 1110 1110  .. 10 ....  1111 0 0 . 0 ... 0 @vmaxv
>     VMINV_S        1110 1110 1110  .. 10 ....  1111 1 0 . 0 ... 0 @vmaxv
>     VMAXAV         1110 1110 1110  .. 00 ....  1111 0 0 . 0 ... 0 @vmaxv

Looks like we could usefully have two [] blocks in here, for these 4 insns, and the 
previous 4 minmax.


> +#define DO_FP_VMAXMINV(OP, ESIZE, TYPE, FTYPE, ABS, FN)         \

Drop TYPE and just use FTYPE.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

