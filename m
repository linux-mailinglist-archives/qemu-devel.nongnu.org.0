Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6279667B2C1
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 13:50:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKegC-0004Gl-9K; Wed, 25 Jan 2023 07:15:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pKefr-00042J-Rx
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 07:14:44 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pKefq-0007yu-Aq
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 07:14:43 -0500
Received: by mail-wr1-x429.google.com with SMTP id q5so12177002wrv.0
 for <qemu-devel@nongnu.org>; Wed, 25 Jan 2023 04:14:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xhb26r0g+ueN4ZNmdQEagPvQ+a1A1H9R0Dz0H7Jxv7A=;
 b=guhMwydPepfzwGA1kGpBuR2WhVE4IWtEd2jT4g14TC2S7FyckND18Gzv0HhKmqeSIe
 ooSs/yF1LsOfJt6Fiq2TpvInaBpxfDlVPQBeg1A1jkSWFu7Eff0QNrAlEHakep7Aup3m
 sz8Z0C6GHd+KOG5n400W/gwzQlTIjOp2rBlN+lLwpjri4fP0YrAd/0t6cp+wn4kroIjF
 e4KsmLzsecMYuXP/esYy3+MyhbcIFXzROsXbLGFScMl8HEP1I71o04+3qRO8OuTr2q+7
 ZxiwbtnAUo0RlO8Id2IF3e/jEV+kz3pnBRDL0sBl1oyxGNkWXtUOJha8e/SES63RiWpY
 6rPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xhb26r0g+ueN4ZNmdQEagPvQ+a1A1H9R0Dz0H7Jxv7A=;
 b=0DtF1obYqXfsa+ZR6c/FNIZNtvH5UJ52ore/550JNT1RgLEbgKJFdLjHDIPru20Q0V
 sUBeHRTmjJbuoKGpmHLpN8e/Pvb5wCgybTaV15s6tUxMX1txSh1wOQRXhObvjTOAJKZv
 8UO7QiUR3xJXnycgV/iT5XUVvrpAJMpwJJzehqmMxWfBJtoR/kiDTBFmiogjR2JC/Rvy
 YrIEZtxO5VeRrG1bpF4BAglOPJRheNl3v1SzNDvtn6zEdmi9ZhxsajbcCAUYngNkuaGk
 K1gFvxzjw0bUlZzue+fdJy4OSEgTQgLRBuM0bKjyDEIiPEDdDS9G5PIqRyM9XXQloJht
 GCkA==
X-Gm-Message-State: AO0yUKX1urMnfRh4/hy4kEOZ+cj9uGb4jLiHVMSMuI9U7+c028wIwNtx
 lD6dmYpkhBtZ78H/NqgT7XsGBg==
X-Google-Smtp-Source: AK7set817PJCJzgC8tRINNYNqO585/eE3u97N4YwBmalYUZkfjPj4GhJfW2GMCZxIxJbK1bzFzUD+Q==
X-Received: by 2002:adf:f7c7:0:b0:2bf:bf27:2dc1 with SMTP id
 a7-20020adff7c7000000b002bfbf272dc1mr550731wrq.60.1674648881013; 
 Wed, 25 Jan 2023 04:14:41 -0800 (PST)
Received: from [192.168.0.114] ([196.77.22.181])
 by smtp.gmail.com with ESMTPSA id
 n21-20020adf8b15000000b0028965dc7c6bsm4199593wra.73.2023.01.25.04.14.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jan 2023 04:14:40 -0800 (PST)
Message-ID: <e167b486-9616-6eeb-0aad-fc94f08e6b32@linaro.org>
Date: Wed, 25 Jan 2023 13:14:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 16/35] tests/tcg: Use SIGKILL for timeout
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Ed Maste <emaste@freebsd.org>, Thomas Huth <thuth@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Markus Armbruster <armbru@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Bandan Das <bsd@redhat.com>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Michael Roth <michael.roth@amd.com>, Eduardo Habkost <eduardo@habkost.net>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 qemu-arm@nongnu.org, Yanan Wang <wangyanan55@huawei.com>,
 Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Li-Wen Hsu
 <lwhsu@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>
References: <20230124180127.1881110-1-alex.bennee@linaro.org>
 <20230124180127.1881110-17-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230124180127.1881110-17-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 24/1/23 19:01, Alex Bennée wrote:
> From: Richard Henderson <richard.henderson@linaro.org>
> 
> linux-user blocks all signals while attempting to handle guest
> signals (e.g. ABRT), which means that the default TERM sent by timeout
> has no effect -- KILL instead.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Message-Id: <20230117035701.168514-2-richard.henderson@linaro.org>
> [AJB: expanded commit message from cover letter]
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/tcg/Makefile.target | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


