Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A16354CED87
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Mar 2022 20:45:05 +0100 (CET)
Received: from localhost ([::1]:58864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQwoS-0006sZ-Ns
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 14:45:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nQwmv-0005zN-1b
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 14:43:29 -0500
Received: from [2607:f8b0:4864:20::1034] (port=54123
 helo=mail-pj1-x1034.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nQwmt-00029S-CZ
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 14:43:28 -0500
Received: by mail-pj1-x1034.google.com with SMTP id bx5so11461527pjb.3
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 11:43:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=9plVgfW5wBf8/9gcZpwTWQG0j1LTdqmv9dDErqCMUZk=;
 b=mup37hZGyxmuG7OGJ4uE0qzpQMEfgGybInJ7JkxDrZPPrL7ikG10rcYMET1cpCWpLp
 oGJO5vZ62Rlp6CTykdMfQ2SDta3Y2Xr0SrGGPPvMfkS5co06VyGecs6qU6zgdr/maPIn
 r42MI9/cSucgwoHSpzV2q3iK5nBRwmfTWzxi/raXlaZHl3m3tLEdiU4a/PQdrgw48it5
 v1js1+qMyl5JkkX71hgTwc4OKbK56b5MIH+3lPIJXzvez+ilEx5W9srFHwFesVbJ4ZrY
 psbTU9odVTjL1Rg9eItDwuusDnR60WcFzmmUq7sEd0V8SU2yB7u5cS0dk+LigjF8p7wV
 zpog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=9plVgfW5wBf8/9gcZpwTWQG0j1LTdqmv9dDErqCMUZk=;
 b=qf1oDuuuJp0O0f7Nt7xjNbSBsZQeYHaHmStEhpx78a+4+XnTzn9pwN1zzYW0wswCN1
 LJBjDZGoyEx49sm32dNIptDLX4iiFox9GYauP2PtXCR+dO1WYFp9bFYsmIZi55BJ4kn9
 yNTCrane5BemFRrrPhr4Gl61XBFaHynkGdQKvOaIHnnWWNaivOH5GuZywJSDUaQ373Fm
 UnA6kVt3W79ea84vV6e+ZAqqqYAdI1Q2nT41Z7HGH1nbzQ1TXsDmzmCq6q1ns0dqpP+b
 O4cF20tdfp1Dsg1/Lc7gxcK8aiRtEosCPz+00IKpvZii8OyyNrB2Q+hKe3wSJqZWw5zw
 kY/g==
X-Gm-Message-State: AOAM53077U/OhNBxz/hr3iPaPKPhC3U3ovq7rTxOockcxIKWbvcpQSMU
 GwlRD3SSQUWxA7ovehlJge1JFR1ox6Sqeg==
X-Google-Smtp-Source: ABdhPJy8ay+8Z0lRM3Ox7vUg9SNWX1L6nKHuhK5EGQIIbD1yVFWkM1Oc9MPV7P5v099Z9iVleEYqoQ==
X-Received: by 2002:a17:902:ee53:b0:151:ec64:4ee7 with SMTP id
 19-20020a170902ee5300b00151ec644ee7mr1255025plo.89.1646595806156; 
 Sun, 06 Mar 2022 11:43:26 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 w5-20020a17090aaf8500b001bd4c825deesm16024008pjq.43.2022.03.06.11.43.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Mar 2022 11:43:25 -0800 (PST)
Message-ID: <4a60b54b-46be-7cd2-35c1-2ebe759c3593@linaro.org>
Date: Sun, 6 Mar 2022 09:43:22 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] target/arm: Fix sve2 ldnt1 and stnt1
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20220306194003.13030-1-richard.henderson@linaro.org>
In-Reply-To: <20220306194003.13030-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1034
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/6/22 09:40, Richard Henderson wrote:
> The order of arguments between ldnt1 and ld1 are swapped in the
> architecture, and similarly for stnt1 and st1.  Swap them in the
> decode so that we have "m" be the vector operand and "n" be the
> general operand.
> 
> Fixes: https://gitlab.com/qemu-project/qemu/-/issues/826
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/sve.decode | 15 +++++++++------
>   1 file changed, 9 insertions(+), 6 deletions(-)

Oh, Peter, perhaps squash this into the other fix for LDNT1?

r~

