Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26533620E52
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 12:13:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osMWf-0006T8-FN; Tue, 08 Nov 2022 06:12:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osMWc-0006Sa-VG
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 06:12:14 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osMWb-0000zS-FP
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 06:12:14 -0500
Received: by mail-wr1-x431.google.com with SMTP id o4so20430288wrq.6
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 03:12:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lkEkiO0Y19utgk9roVX+Bv0Y5Y2wq7/rUMMFnND9Kak=;
 b=VX07iBys9szwjs2BZesou8L+kS0QTJQUNvM7hQUu7mqi3GTbFHOuqID2JOwyMDo5dm
 qK42iF+QX3wlwUfs8U0g5qiBwSF2u0UpbTRo1d/PreFapNwX1+sBcv0NExHksBwimC1b
 DA8eP4JlLqczXVIUhvYfHywCcb+4Cn+YkRzrBuWtzSh9fgukPegYCnK8Hi9EQIMsOGTZ
 AHxZRBYFNxGzcQ4XEluCXL2OI77eyQlf7QBwxM+buVUOVc8XuT+jg//7Z8n5awe6YRJu
 FBrId4Wh/89PQ9pmOMX9zEwdSIMPhpni4m6di11mQOmmCB78CWB/rQDwWqjx99VTRrxx
 BbmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lkEkiO0Y19utgk9roVX+Bv0Y5Y2wq7/rUMMFnND9Kak=;
 b=hJweZB2hm/RyngmhJwrw9mTmYP8uQm0NaRWWYSjwGRUq6WediV3eqYop2ePsWGl9wk
 0B5aD7UgI9JbKh0heOmelDzlpwvUpQnwlMa/D+xYVBIZp0Ty6xf19aNlbBUhpxgDaO8p
 IjO+H+qqKp0BXleIYFgZJQuOfC4BitywR0GfaYVpM1bRHuDY+IynOP9rNNfiDcqJuhUE
 ANj4DqIwdqJpKhbIw+10SRWxr7I19RTxKDlPrLxgFYPHa8a00vnGHNGjhiYmV3DY4Qzy
 2c3DmQCnGofblpzHQZSrsx2Ie/HXBGmFO1yNnP/k9wK3C8RmgSeTSRsK2SFlx88dzC1N
 H0sw==
X-Gm-Message-State: ACrzQf1RL70K+951ioeoxRyk7+9n7dRseZ3JHNoBXlQu1wPwYfgzsx4K
 8eHePib+wfG07zYrEraCg0gmMw==
X-Google-Smtp-Source: AMsMyM6gp56Cy+bnG7dTFmYsaEsarcFEh0U1OvfewUmqaCpdmNIvkRJPWJwBQfkVWWks5dq/uhx9Fg==
X-Received: by 2002:a5d:4cca:0:b0:236:aecc:60cb with SMTP id
 c10-20020a5d4cca000000b00236aecc60cbmr34736862wrt.11.1667905931494; 
 Tue, 08 Nov 2022 03:12:11 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 i5-20020adffc05000000b0023660f6cecfsm9965315wrr.80.2022.11.08.03.12.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Nov 2022 03:12:11 -0800 (PST)
Message-ID: <d8027071-5950-80b5-cdcc-a8859e079b6a@linaro.org>
Date: Tue, 8 Nov 2022 12:12:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH v1 4/9] tests/docker: allow user to override check target
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20221108092308.1717426-1-alex.bennee@linaro.org>
 <20221108092308.1717426-5-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221108092308.1717426-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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

On 8/11/22 10:23, Alex Bennée wrote:
> This is useful when trying to bisect a particular failing test behind
> a docker run. For example:
> 
>    make docker-test-clang@fedora \
>      TARGET_LIST=arm-softmmu \
>      TEST_COMMAND="meson test qtest-arm/qos-test" \
>      J=9 V=1
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v1
>   - fix s/target /target./
>   - CHECK_TARGET -> TEST_COMMAND
> ---
>   tests/docker/Makefile.include | 2 ++
>   tests/docker/common.rc        | 6 +++---
>   2 files changed, 5 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


