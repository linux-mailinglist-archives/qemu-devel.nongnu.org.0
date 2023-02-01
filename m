Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 738B2686565
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 12:28:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNBGY-000438-4V; Wed, 01 Feb 2023 06:27:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNBGV-00042g-Bf
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 06:26:59 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNBGT-00080E-MU
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 06:26:59 -0500
Received: by mail-wm1-x329.google.com with SMTP id bg26so6565955wmb.0
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 03:26:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cqdUlYkNk9ry6dR4FdOh4nafV0PhlkTwmeuS3fw7gH0=;
 b=otB1UDyZWjvFLfU+INoeGxjtw5EyVhJvF3AvBVtsidfPAafpkynFk1Z7ipOp96MfFu
 ZzPuy2qWwp85S3vUguQ6lulzW2x6xnTzPayR3QIAVwl4cbvBSXG2huiwBkW1xQ3nKl/1
 hnXQ60oex8JDakR5HMdNjBqkSMgKHmL0Hsf1nOEYxWUudoD9KBaa4ekmF6gk39KA0AG9
 P/JMhZ7HN7WhvTScfmGp6MLD9uGoLh3Se2hcVYun7QLr9XTa7DoWsnWg4rdE0eRrh3bt
 TKp5DrEg2zPIWi/5ki6QSa2rvrYyFBLmW65zN07YEEZvNLuIHxjr5UjZ67PDPhy55L3N
 1JUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cqdUlYkNk9ry6dR4FdOh4nafV0PhlkTwmeuS3fw7gH0=;
 b=on3J7MChDOdBhieqzgH9/gsJ0COYPCLwo5BtwCijmVye42RUdaDvi5UF47WTbERjEB
 BPTqCXPJKV376jtPY53ePLMKgbzKOvz9Wm/XRyKP2ymWLLEfw6UsEcRawGYCMv5QKBbw
 mLNiTjk4ZPpvTIUtuzorQ31BK7Ia39YrLANbR3pfYHsSwwdsa/w7KgXcBxvX7agEyO7F
 4EoiixIA0F1LBg4hDt8/W2jbLxJoTcLVOxPPEWbjgJdjZWxDM5P+AzitcRPhuFqHnB6E
 r/+m89KNpNlEd1snz6e9UHf1I0AEEGd7Cw9HbVSMbBre0/Zj3ZhAYi599eP2MUtBz4T6
 NYkA==
X-Gm-Message-State: AO0yUKX8gK2F4rLO7LRqNlNPal2az8v/2q4BR1LwKjrSLEeKo/X2B+ZM
 4wvZ1PWeiqNUOqsAdz/QMjKrnw==
X-Google-Smtp-Source: AK7set/bABh9NFSpgHkPkI8SMLeFkz+kP86caRBpBxjCdkgQAOppyEv8Pl/T4sBZ525Q+nsL1UCKpw==
X-Received: by 2002:a05:600c:4e88:b0:3d9:f559:1f7e with SMTP id
 f8-20020a05600c4e8800b003d9f5591f7emr7324582wmq.20.1675250814642; 
 Wed, 01 Feb 2023 03:26:54 -0800 (PST)
Received: from [192.168.72.175] (144.red-88-29-179.dynamicip.rima-tde.net.
 [88.29.179.144]) by smtp.gmail.com with ESMTPSA id
 b21-20020a05600c06d500b003de2fc8214esm1376778wmn.20.2023.02.01.03.26.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Feb 2023 03:26:54 -0800 (PST)
Message-ID: <e93a4769-57d1-390b-4a45-50abacaf3169@linaro.org>
Date: Wed, 1 Feb 2023 12:06:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] tests/tcg/s390x: Use -nostdlib for softmmu tests
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-s390x@nongnu.org, 
 qemu-devel@nongnu.org
References: <20230131182057.2261614-1-iii@linux.ibm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230131182057.2261614-1-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 31/1/23 19:20, Ilya Leoshkevich wrote:
> The code currently uses -nostartfiles, but this does not prevent
> linking with libc. On Fedora there is no cross-libc, so the linking
> step fails.
> 
> Fix by using the more comprehensive -nostdlib (that's also what
> probe_target_compiler() checks for as well).
> 
> Fixes: 503e549e441e ("tests/tcg/s390x: Test unaligned accesses to lowcore")
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>   tests/tcg/s390x/Makefile.softmmu-target | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



