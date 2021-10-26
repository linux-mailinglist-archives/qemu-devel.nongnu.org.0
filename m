Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A96F43BB5D
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 22:04:44 +0200 (CEST)
Received: from localhost ([::1]:56208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfSgd-0006MJ-8f
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 16:04:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfSem-0005Ou-KF
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 16:02:48 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:52860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfSek-0003AC-Jb
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 16:02:48 -0400
Received: by mail-pj1-x1033.google.com with SMTP id oa4so321551pjb.2
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 13:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=E1lHeUnwkvjegS0juXeKnqSpAVK9agegYR0E6aeTLUA=;
 b=u5FXA7nsUmHzdS8z3lDT7PeXTyfsqSotX3o8Md39sSZZ6ADwfiOOEEoxM6zEg21tpp
 JxKs2H7RFHtkrO7dyXoPEvzCaokWbIzt7pgwUC6/+9CabTEpBtC5jbUt7bgRzAhYQz0l
 DN+VKgCgFU9dGrvkdx7jo6otX6AQyM+hsbphsLbbyVG6dLFuBKjteR+HBoNHbtQiIFcC
 WTcEVVTkXramJ3GcH8kkH7Ojg5g1wbbmJsE/TyWyw5jdeeMBerCW95U4Fy/L5cigVVu/
 mR5QSIwK60IpOdoAzstP4nYfVEZ1o+H8EZGz7cMBJVa11Bks+Ph13+hw64d1mqBbV6ms
 b81A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=E1lHeUnwkvjegS0juXeKnqSpAVK9agegYR0E6aeTLUA=;
 b=osp9WRFlUGo8h6/X8HCbDah9g9AELOa3LHTenGtK1rsPP9vAQriURKv7ZK3R97u6XD
 HrLf8YZOZ46m1oxnDxENxb7L2Ov5bcmxmMrRHetkfghqQgONfniOAHkZbFb2u8l35Atj
 Ld4qsmtio1KkxwFjzsyNc2LwNft4BiaADrofd9fWLDk3m8Y1KwpvJcxnDZR75xDdmTlT
 w8LrjiQPpXLvlRCVqXvuJpgVU3iAs8q1EQ7Soc7yjCNFYECbYwq5yclHO3MU4R9iWSeQ
 aWNZMjDjE0doj6jxIXUwZFDYsr/M387TBat07pyI/n0sM37zPdPvkq7is87V449GSlOz
 9IBw==
X-Gm-Message-State: AOAM532ZakelY6fGdq2CM+1EGOl2jGQzmJDw3iCFkUm/I5ke0IfaBGZC
 pi91n2gAeTMrQ07K2QFHO/tgGg==
X-Google-Smtp-Source: ABdhPJxDhzTj2vesyWjh3lJLTGJYG+slItN1ZB2O3qysRIrpLLzG9zTITNOQ06SjpC2LgZj9jpJeGA==
X-Received: by 2002:a17:902:7101:b0:140:3e2c:1cbe with SMTP id
 a1-20020a170902710100b001403e2c1cbemr19124797pll.83.1635278564929; 
 Tue, 26 Oct 2021 13:02:44 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id e15sm1678325pja.52.2021.10.26.13.02.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 13:02:44 -0700 (PDT)
Subject: Re: [PATCH v1 11/28] tests/tcg: enable debian-nios2-cross for test
 building
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20211026102234.3961636-1-alex.bennee@linaro.org>
 <20211026102234.3961636-12-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <044c439a-93e2-5662-08ba-2b7016302e37@linaro.org>
Date: Tue, 26 Oct 2021 13:02:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211026102234.3961636-12-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.215,
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
Cc: fam@euphon.net, berrange@redhat.com, pbonzini@redhat.com, crosa@redhat.com,
 f4bug@amsat.org, robhenry@microsoft.com, aaron@os.amperecomputing.com,
 mahmoudabdalghany@outlook.com, minyihh@uci.edu, cota@braap.org,
 stefanha@redhat.com, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 kuhn.chenqun@huawei.com, ma.mandourr@gmail.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/26/21 3:22 AM, Alex Bennée wrote:
> Now we have a nios2 test image we can start using it to build tests.
> However signal handling in nios2 is still broken so we disable the
> signals and linux-test tests that trigger the bug.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   MAINTAINERS                     |  1 +
>   tests/tcg/configure.sh          |  6 ++++++
>   tests/tcg/nios2/Makefile.target | 11 +++++++++++
>   3 files changed, 18 insertions(+)
>   create mode 100644 tests/tcg/nios2/Makefile.target

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

