Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A12941A91D
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 08:54:29 +0200 (CEST)
Received: from localhost ([::1]:33032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mV70W-0002p7-FB
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 02:54:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mV6xv-0000Ib-Ep
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 02:51:47 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:44616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mV6xu-0003vr-0R
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 02:51:47 -0400
Received: by mail-wr1-x42a.google.com with SMTP id d6so55927955wrc.11
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 23:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cRKj394VFbjeknsmz6UTTF5zH5xWZaxF/5tNFCx9gQM=;
 b=HECe3MwObo9QRGp9waL4ja/kyPq3ebODjcX0+2dARJSzjcJ7+5ekO3CU9cZuWAJhQ+
 JkRk/aHcaB/wbUxQSGQH9ro9bSQsg0g+d8ijiKl/hvVKWKz2E2ql+/Xr4MmnbSS0j5Vz
 hEkpGrI2FVegKR2ISZpuai9GWlRysV8vcRzSuU4uCw4ZeExIKlkw1kC7f7M/Om1XfMdV
 CYuLurRvT8HgBeo7dDkr4r0Ed7TdgS2dsvRVKPGDa98ZXCh5wzmE4Zsh72SRcTIRwArh
 XFCMAAJG8J/T3g15P2ggc83k6CH3knCVa/ZE96+K8rT7BuOwk+/2xYp25nmnsByeC6d0
 sUsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cRKj394VFbjeknsmz6UTTF5zH5xWZaxF/5tNFCx9gQM=;
 b=nl5f5NG57944ZQF/1SVXgI1Lf6z52HfxeqSDEit08MWF7IecR7AjSEwWwF5TwguOjj
 DJg99ZgV4I8Ea0Ic2VPqPZDgosWPDU/k9hgE+sHIOrFsSraG+eFORWsOAw1aGph4loX7
 a2A6cirMZu6SCl2AkROJdL2/tM7xowb9c3XVyML5TlXikwOT3Bd5CDv+TsxNxKM4rNwJ
 QYXPcFv5mdToGTvUDv1+eNHOAnQv62GTcsWqGKHBJbKMu0g9/5k4ckNlm9j8j016e0fe
 rnIraVJPPDcPf6Xto8644ltf5G/MI2Cz/qU4FeEDUHNbkXAGh+8ALhjNcO5NrdRxsDfa
 QaHA==
X-Gm-Message-State: AOAM530yC+VT5vgG1cOdBEh85tb5j7uQIsTNMu1RZWSKvkWUpYlva0gb
 XBDDAYxqc8S8OkCDmenBvUw=
X-Google-Smtp-Source: ABdhPJzY1QZGqGHzqrizVTQ0GoHTFGz3IzxPrzCKQFDlUqDPpMC0DXCQZxhPp54rAHSTA1X7HlTzfg==
X-Received: by 2002:a5d:64e5:: with SMTP id g5mr4440149wri.282.1632811904202; 
 Mon, 27 Sep 2021 23:51:44 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id f9sm2114977wmf.3.2021.09.27.23.51.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Sep 2021 23:51:43 -0700 (PDT)
Message-ID: <70111cf1-c4dd-38b2-290e-f5ea5f86f4fc@amsat.org>
Date: Tue, 28 Sep 2021 08:51:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v4 10/25] linux-user/i386: Implement setup_sigtramp
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210928020039.184412-1-richard.henderson@linaro.org>
 <20210928020039.184412-11-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210928020039.184412-11-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.136,
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
Cc: peter.maydell@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/28/21 04:00, Richard Henderson wrote:
> Create and record the two signal trampolines.
> Use them when the guest does not use SA_RESTORER.
> Note that x86_64 does not use this code.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/i386/target_signal.h   |  2 ++
>  linux-user/x86_64/target_signal.h |  3 ++
>  linux-user/i386/signal.c          | 56 +++++++++++++++++++++----------
>  3 files changed, 43 insertions(+), 18 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

