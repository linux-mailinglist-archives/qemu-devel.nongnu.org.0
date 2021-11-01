Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6D844236A
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 23:28:47 +0100 (CET)
Received: from localhost ([::1]:53346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhfnK-0007pP-NY
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 18:28:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhfYU-0004Nf-Rm
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 18:13:26 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:52861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhfYT-0001Cf-2L
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 18:13:26 -0400
Received: by mail-wm1-x330.google.com with SMTP id b71so2714443wmd.2
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 15:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RXZtkQsrl6/1KOZB6PDQ73AUll24wlnDfzJB+Py6/vg=;
 b=W7yPW30QOR6pZAvm3NqZJX9cKlVSV2dVgDfvFyqul5votVpoO1dJ7ecMAq42RdMJvt
 10YSlBuWkNBQkN8JxGD+qy5mA6S9BtFUgpbqkyT1z7oD40PRxSnjzo7HwLLrcRGPZd0D
 CjpwKCtr+QRnfgsq6wl38Xb8QG0l+AXcZMkmWp7XhRMjV2yfiBbyFyuuE2zuqBjAJ33j
 Y6pkVt8oT/YwZDKUYo/I8+SiVIUYJLulqbxWHAO38mWTdDdQXttHLA0cSJ2bntoQpv4m
 ooO/amWGfSzeddMcNfAUKMekT5MLsFZfH0CDbSwo6AlIr7jD3xhkgBsQwGje/C5SwIJQ
 BeEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RXZtkQsrl6/1KOZB6PDQ73AUll24wlnDfzJB+Py6/vg=;
 b=bufHxcL9P7S7nXxs0yF0XTYgXoaVIREt53tbZEi5B0EVLMv0HpZ82hzFxRu9/kRF1c
 UlUStmZTrtvYGC1eZNz0S8ar6xd3yOHcxJZ15vO5qhI1EVZ2ndwpK4aDrzidawROzBJi
 MKxPXya4vHv4F6n25B3NK+2vQQOBOTB7Iu21Q+qdDhM5pyEz4tgzGTehHjX1/rBqCpos
 +3U844zkwwZTs0GE3sc2iQ0xB9RzuXp3zEQcSWNhWLmJ2RFeoRrHtyA/0SZDVNBXR9aU
 Cqq3OkJ6Cv5LFl5S43rJ3A68qrfMfHnaVBvcCDIPtw0isOrmnL/Opcxmpfum6Ko5wSgJ
 rXFw==
X-Gm-Message-State: AOAM533iwx3mpUlwse/DN/rqIk+zAYelz/SRr/EJMcz5KteSpCZq4i2S
 d2hUNnO7bq0eqqtM2/DXIIU=
X-Google-Smtp-Source: ABdhPJwkh9rWKPrTY6NXFR/eIYCqdtFGNu0V8Q6svSEsk+Y39Q+F35RhkBMGY4GyZIohNWDuQmVQkQ==
X-Received: by 2002:a7b:cb07:: with SMTP id u7mr1941931wmj.178.1635804803596; 
 Mon, 01 Nov 2021 15:13:23 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id t6sm715663wmq.31.2021.11.01.15.13.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Nov 2021 15:13:23 -0700 (PDT)
Message-ID: <d5b99e12-342c-25cd-bed7-cdbd663bb36a@amsat.org>
Date: Mon, 1 Nov 2021 23:13:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: gitlab-ci: clang-user job failed with run-tcg-tests-sh4-linux-user
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>
References: <e27941cc-2622-cb01-4c93-b9ff344bdddb@amsat.org>
 <875ced1d-35ec-f777-f642-db9679082af5@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <875ced1d-35ec-f777-f642-db9679082af5@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.14,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/1/21 19:00, Richard Henderson wrote:
> On 11/1/21 6:27 AM, Philippe Mathieu-Daudé wrote:
>> Build failed running the 'clang-user' job:
>>
>>    TEST    linux-test on sh4
>> ../linux-user/syscall.c:10373:34: runtime error: member access within
>> misaligned address 0x00000048af34 for type 'struct linux_dirent64',
>> which requires 8 byte alignment
>> 0x00000048af34: note: pointer points here
>>    00 00 00 00 00 40 0c 00  00 00 00 00 7b e2 f5 de  fc d8 a1 3a 20 00 0a
>> 66  69 6c 65 33 00 00 00 00
>>                ^
>> make[2]: *** [../Makefile.target:158: run-linux-test] Error 1
>> make[1]: *** [/builds/philmd/qemu/tests/tcg/Makefile.qemu:102:
>> run-guest-tests] Error 2
>> make: *** [/builds/philmd/qemu/tests/Makefile.include:63:
>> run-tcg-tests-sh4-linux-user] Error 2
>>
>> https://gitlab.com/philmd/qemu/-/jobs/1733066358
> 
> Interesting.  It's being skipped on master.  Also, this must have some
> sort of sanitizer enabled to get that warning?

Oh good point, I'm including "tests/tcg: Fix some targets default
cross compiler path" which re-enable alpha/mips/riscv64/sh4:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg846281.html

