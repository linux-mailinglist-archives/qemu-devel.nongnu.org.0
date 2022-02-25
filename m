Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F50E4C51D0
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 23:58:20 +0100 (CET)
Received: from localhost ([::1]:35282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNjXX-0006qE-DL
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 17:58:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNjS9-000890-4i
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 17:52:45 -0500
Received: from [2607:f8b0:4864:20::62c] (port=43909
 helo=mail-pl1-x62c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNjS7-0004Cf-BU
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 17:52:44 -0500
Received: by mail-pl1-x62c.google.com with SMTP id x11so5960025pll.10
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 14:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=rr6XKenPDqeGvuLBHRpUrvcd/808x2uckqCdYlKEiXE=;
 b=CLJJOqPQeZaqDV1c0nk6sZOsDab+1f99xnQdNs0Sa4Ma9Ok2p6KPC5uxtS4/2DtwXV
 w/Ac6+Q3DTzfPRO1/lOMA9M2b86HVX9+dZde8ZXdiSHFhSs0grNNQM3+/nZS8s3B+C89
 f/7gC8+onEHX6LDWO6JiCxMWq4cTmpLFy0pMpIg60NPQigegfQVYi3x2vriftLtWmwia
 zcvi/Dzt3qCNheAYdPgnvwHOa9QShmPJ3cfAC0mgVemdPh2hmAM4Z0IdPWY5sgpU5Ev0
 fe6oAMz/VbBpTezSgiT7uNK7CmaC/qAV6rmBddO6NUZb/v3egb1zyK4ohcsIEjS4H0YA
 F2TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rr6XKenPDqeGvuLBHRpUrvcd/808x2uckqCdYlKEiXE=;
 b=Hp+pRTCWKkeAjl5kngHNASCaeklXDLvpwviWbSQTHElpJPk9Tmnq3G1fBffAEr3e2a
 klu0ypjMbmhujV/bqiWV/RoculJX3v+n80rFPrFkh9nA1cd9puSULp4QjXL1vnMdon8k
 8Z46mJDFldQDSiive873T6LEIyAw3MudNRVwA/+LNmaI3YDhM0eQUPM747P+KCo0jd4F
 ZS+UsK+xmul69pkLb6VvYiA4gkds4a3cTU9O40rq5qzDWo+dKIzTh6217ilPfB4+Kdv1
 dyL9fwZiPaG9MG2liwwXaEsT36ZJtsyE4aDh7f4IdkD8FmeN/1xw34BlRPafzM4NYaB2
 lszg==
X-Gm-Message-State: AOAM5309YxGyg4idL4ZFJVyDNbfIxORJjeavddnOdFGXsOq9mi0wflcu
 stO8k2kVL87u5V4bh3mLSLGTwA==
X-Google-Smtp-Source: ABdhPJzbLqOBJ+2co9KxoVJK7LvWSBHRdmUf1RG2BbrTpHB91cqK7rpEqpaa3Y/3goxWfZ0i2k9a8g==
X-Received: by 2002:a17:902:e805:b0:14f:d33b:b769 with SMTP id
 u5-20020a170902e80500b0014fd33bb769mr9582273plg.24.1645829561742; 
 Fri, 25 Feb 2022 14:52:41 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 f16-20020a056a00229000b004a818f896b4sm4534051pfe.53.2022.02.25.14.52.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Feb 2022 14:52:41 -0800 (PST)
Message-ID: <61d197db-c44e-3354-f1e5-bea48019bb1e@linaro.org>
Date: Fri, 25 Feb 2022 12:52:38 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 13/18] tests/tcg: add vectorised sha512 versions
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220225172021.3493923-1-alex.bennee@linaro.org>
 <20220225172021.3493923-14-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220225172021.3493923-14-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/25/22 07:20, Alex Bennée wrote:
> +++ b/tests/tcg/i386/Makefile.target
> @@ -71,3 +71,9 @@ TESTS=$(MULTIARCH_TESTS) $(I386_TESTS)
>   
>   # On i386 and x86_64 Linux only supports 4k pages (large pages are a different hack)
>   EXTRA_RUNS+=run-test-mmap-4096
> +
> +sha512-sse: CFLAGS=-msse4.1 -O3
> +sha512-sse: sha512.c
> +	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
> +
> +TESTS+=sha512-sse

The default cpu, qemu32, only implements sse3, not sse4.1, so we get a guest SIGILL.  We 
can execute this with -cpu max, or we could limit the vectorization.


r~

