Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FB72BC8CF
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Nov 2020 20:47:32 +0100 (CET)
Received: from localhost ([::1]:52662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgvKd-0002lP-8D
	for lists+qemu-devel@lfdr.de; Sun, 22 Nov 2020 14:47:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kgvJQ-0002Go-9i
 for qemu-devel@nongnu.org; Sun, 22 Nov 2020 14:46:16 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:43201)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kgvJO-0005Fg-8R
 for qemu-devel@nongnu.org; Sun, 22 Nov 2020 14:46:15 -0500
Received: by mail-wr1-x444.google.com with SMTP id s8so16454675wrw.10
 for <qemu-devel@nongnu.org>; Sun, 22 Nov 2020 11:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1bnHGJklN0fXw1mh1/5RpTduIoOb6rvB3lfDJGXp01I=;
 b=NnRtBxrl+qj99G9vr3NS58PAD4aqduKqiSmSFJq9HTNg1JiTzTbWqK+kmigwpR5HaR
 Y8HIN4o/RnmV5b+DhpH/1gVNLAdVJvW2wceTcDDcP+2kN9ky+oO83puThLABDlwaxd8H
 jRXgwlAfTTugmMYrvDYiQHgNmQ51OAAMiEEEzk57cwi+ihUgSGLt/+4udJ3EAvBY2PI2
 G8azoiFEqa4ruxBjT+sV1Y6Cp1HNAxnjQgqaQJfGoFlxfwEUDH5ei1GVVqQQx9ESXzpc
 LITuYDtMEj0M7VzFD+3RU2f9Rckta2JOc6gvaY8P6xn/J0M86V+aYOuzOQFq2q0wfAKV
 v8mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1bnHGJklN0fXw1mh1/5RpTduIoOb6rvB3lfDJGXp01I=;
 b=i/hMNCPtFh2SD1sA3asIip754yOtehbQcDtEUqEah/GqprVJbTLN0mpL0nB4PY3X/o
 KwjdUYA6lumwOWFIPjDOjjR+z03TXskV6+oeqOIDxtd4aWQvMvWyHwuWrSzMeUdlKZ4s
 H2qICX3RH/dhG29xk8NS3JXt1qNkLkNWosH8GCTlcQvpIWogQYFn+RTt9d7Tvm2+Hqx6
 uoon5vahriyPM2nBy5Z9tVwu2rzmJP3i3w5PVCQgoU5KUsPYZ1G1LfQ5nMIWaBF0cxoq
 cdYFcYwOKjiAuMb32aXH4LrlLwVJ4xvC7L+kCY01AqzurSjuVWLYmXJ1lajD1STqD0bf
 U8vA==
X-Gm-Message-State: AOAM532l4UBtkLkhbWxrhSzmtYl+uBVCfF3kwsuAAGFbGL5x9ko+/gYV
 Kgd9onow2C3oKeVT5op/3Pw=
X-Google-Smtp-Source: ABdhPJyPELeIRbD7tbRorXhwolYgCtAv05pJ2K27ZYU3QREBCG/YpJKy35ROlWlCagzkX1KUZ508Sg==
X-Received: by 2002:adf:de85:: with SMTP id w5mr28230074wrl.90.1606074372456; 
 Sun, 22 Nov 2020 11:46:12 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id b4sm13349358wmc.1.2020.11.22.11.46.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 Nov 2020 11:46:11 -0800 (PST)
Subject: Re: [PATCH v2] target/mips/helper: Also display exception names in
 user-mode
To: qemu-devel@nongnu.org
References: <20201119160536.1980329-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <84f65f7f-10ca-6096-35cf-9006e511f4f0@amsat.org>
Date: Sun, 22 Nov 2020 20:46:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201119160536.1980329-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x444.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/19/20 5:05 PM, Philippe Mathieu-Daudé wrote:
> Currently MIPS exceptions are displayed as string in system-mode
> emulation, but as number in user-mode.
> Unify by extracting the current system-mode code as excp_name()
> and use that in user-mode.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> Since v1: Fixed failed cherry-pick conflict resolution
> ---
>  target/mips/helper.c | 24 +++++++++++++-----------
>  1 file changed, 13 insertions(+), 11 deletions(-)

Thanks, applied to mips-next.

