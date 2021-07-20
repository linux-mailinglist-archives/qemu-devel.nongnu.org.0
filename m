Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 798C73CF953
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 14:06:15 +0200 (CEST)
Received: from localhost ([::1]:54592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5oVq-0000xE-FF
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 08:06:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m5oIv-0003Nm-C5
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 07:52:53 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:38898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m5oIs-0005vh-Co
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 07:52:52 -0400
Received: by mail-wr1-x42b.google.com with SMTP id c15so2093100wrs.5
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 04:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=X+WULViq4KY97L8GzDu4t9eGlwfpb7TRY6HwkoTafbY=;
 b=dqtbc0+fnEzbKkS2f2F0KS7RgaJBs/+DHYmI/LTf0dtASYU4l2mWmkM0Biufc5RRIl
 6I5sTQZl7DzA/q77vUWu34VRsELIo8NaOsOf90qxO3thyQJrjvc2O7ibcG0+9Ryzlvtr
 ysoMWq3HeKhpntTTuJfnqfeMR1oWbxbIUwep1y9GYKo0mFVuskWwOatLYUEkzMSnfZwM
 VMcNgQEqz6mUWY0m7GRG5gKtZzIxp5iYNcmhyXBaK9xvOVTaXdlYrHvdzV22BxCH4ZHy
 YWvBJ/Io4Cbso7xIcvMX/OyMzAPOUeGdfX7n2ef96cOaH5ElegyTgiipsKoVl1XbCkEJ
 KZXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=X+WULViq4KY97L8GzDu4t9eGlwfpb7TRY6HwkoTafbY=;
 b=GrSzox8v8spbQHBnatdE8e4ySQgMBuo9fNJe8B6/ETpukQOXRUHT5DcWwrwt7MQC6+
 gLmyRqMjVGcDXFn2O9cWnj74uFJMwjmmCPoOs51PULw5Dc0eN5q4OWWnV9gkij8XDmS9
 eXuG4wPQpSJVgYontnr+Eixj6ST4BVjnpVr5mplF45QW6FCpnVjX8E4auGgMClxuTKUr
 a0pp+yQ/2T8ga68dH0TXnH+WRXPol3trXckNa30m4OZe1hNGIoZTZ1xUueJTcExZ/U6N
 OrLhposufWxzCr0qRsZLqfNZlxdElGpr8nuQDJbrMmXjKDHahfbVUhji20SZpdChTST0
 MqqQ==
X-Gm-Message-State: AOAM531hcLnP8B9obTQqByz6/XzkxpMEheOnKQzxko3dqerYHg4A4rzi
 yNu8/BWCmk0r2CNeG9dNI1k=
X-Google-Smtp-Source: ABdhPJyZWty4bdRQpi7LRW2Zdq+N+34vWiBgt7TjTNkvveuSvC93RvxdRD5GV0oNVmo5/Ajw8/fDxA==
X-Received: by 2002:a5d:6148:: with SMTP id y8mr35275566wrt.20.1626781968989; 
 Tue, 20 Jul 2021 04:52:48 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id c10sm19565538wmb.40.2021.07.20.04.52.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jul 2021 04:52:48 -0700 (PDT)
Subject: Re: [PATCH for-6.1 v5 09/15] target/arm: Implement
 debug_check_breakpoint
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210720011800.483966-1-richard.henderson@linaro.org>
 <20210720011800.483966-10-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c758ef0e-f0a4-fa3c-1ed2-b14fb0e8f377@amsat.org>
Date: Tue, 20 Jul 2021 13:52:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210720011800.483966-10-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: alex.bennee@linaro.org, peter.maydell@linaro.org,
 mark.cave-ayland@ilande.co.uk
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/20/21 3:17 AM, Richard Henderson wrote:
> Reuse the code at the bottom of helper_check_breakpoints,
> which is what we currently call from *_tr_breakpoint_check.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/internals.h    | 3 +++
>  target/arm/cpu.c          | 1 +
>  target/arm/cpu_tcg.c      | 1 +
>  target/arm/debug_helper.c | 7 +++----
>  4 files changed, 8 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

