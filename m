Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75BE169F34F
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 12:15:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUn4U-00088h-Mf; Wed, 22 Feb 2023 06:14:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUn4P-00087i-J9
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 06:14:00 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUn4N-0002vU-OV
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 06:13:57 -0500
Received: by mail-wr1-x433.google.com with SMTP id 6so6933976wrb.11
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 03:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aEWIja3pq4fTwElbbD7V2BQosGhagYHtST01YBX0INg=;
 b=xYbk4Akrx07EA8ayChEbdEumf6PTAcWtSBZxhuigzV5CWYqgpROadOX7BFq8Y3nM1b
 j9cEHDieQQrc6rGcJH1rN0iF9ki1NsAYU7UmTv9n2SZ6YN6QLlQ613wDGHS/Rzxbhmfe
 cvq6II4XUf0uLwPChtmItfu0x7g5gHSiE179/LIcX5H3zpolYWUwvieyFO3Tgpa/2Bo8
 eMb+VkrsK1VuPItJKffid026k6AhCMuYcnjHd32wFWyssKhsPmh2+As9bG0S+D4a2TXg
 1c/QZ+zDlbk29XWhx7YZ36ndVe04xkKB4htb0gBDCf7vM+Dcv260/qTj2SL6YOC3qb8J
 9lqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aEWIja3pq4fTwElbbD7V2BQosGhagYHtST01YBX0INg=;
 b=5Ltibm40tMS8m1eWaeuniItGnWbaoEj1aHDhY9SKLYotysu0T8MM616budaSQJi1jO
 kqn7zTvunZwGzACpsCMJtRFO06tus/lzeQzle9PlUBfDsItZLe3AjSqTCUAQ39QvmAgh
 aJdswO30ela+tnei7ce/4jJAaQIcqLgx8lMAWrDoauOaPnJWg5DWlLfKpgYS2MZjA8V2
 aKO2np5FBua06NX6PLcRpv/SN08STZK7g+mURWdKGyUiyfspLpUra9D7pHpjRhvi0MpG
 jRfOWAzoGQbH98A9vktYcDfYmRfo8hlldNzMkZTFC+0J62OBBcOEa17dmngieqzFhcAw
 t9ZA==
X-Gm-Message-State: AO0yUKWF87qwFQDqgu3b/1TUdxVF6V/VmdNR0lnpwl98f4OujAVs4As9
 JscTdHuzaW6IUKaeHah97pyXYw==
X-Google-Smtp-Source: AK7set+eaOIs9+usm+ggkj6dTsd15ETJkIgvroqoatKdkJkOUsylPeS9k4eXu1ScweiBA39i+OUTkg==
X-Received: by 2002:a05:6000:1cd:b0:2c5:8575:c37 with SMTP id
 t13-20020a05600001cd00b002c585750c37mr6751913wrx.66.1677064433742; 
 Wed, 22 Feb 2023 03:13:53 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 j16-20020a056000125000b002c5706f7c6dsm3908058wrx.94.2023.02.22.03.13.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Feb 2023 03:13:53 -0800 (PST)
Message-ID: <df642e1c-3c74-5cfc-b1bb-091dfe147fc2@linaro.org>
Date: Wed, 22 Feb 2023 12:13:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [RFC PATCH] target/arm: properly document FEAT_CRC32
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20230222110104.3996971-1-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230222110104.3996971-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
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

On 22/2/23 12:01, Alex Bennée wrote:
> This is a mandatory feature for Armv8.1 architectures but we don't
> state the feature clearly in our emulation list.

Split in 2 patches?

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> While checking verify
> our cortex-a76 model matches up with the current TRM by breaking out
> the long form isar into a more modern readable FIELD_DP code.
 >
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   docs/system/arm/emulation.rst |  1 +
>   target/arm/cpu64.c            | 29 ++++++++++++++++++++++++++---
>   target/arm/cpu_tcg.c          |  2 +-
>   3 files changed, 28 insertions(+), 4 deletions(-)


