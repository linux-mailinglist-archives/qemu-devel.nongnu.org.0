Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 697433A67E9
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 15:30:16 +0200 (CEST)
Received: from localhost ([::1]:56752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsmfP-0000ye-Go
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 09:30:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lsmeA-0008W8-9B; Mon, 14 Jun 2021 09:28:58 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:39517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lsme8-0000Xv-TY; Mon, 14 Jun 2021 09:28:58 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso13057503wmh.4; 
 Mon, 14 Jun 2021 06:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ckjG6ejSdo9drlW9OhdRmdSs2L91z0XXqFpXH7PrOww=;
 b=X7OAmvymQcopojaalSKvFbwdTAjg4QzEIn6A2CGTIC18lZi/k8W4kyESA5ionux2f2
 Q3QMzfNJ96Z82cb6fh1u3+uU+bgnC73kI7K/FqX5G8IcAoxytiI4GTcwgQnVzp/lT0Fe
 bPuHAF8iBdf4ClsxN+nJUUC5n9s+tnxsEgMCc3hsUks5mQbY2W5QAjH6KgrnD16UzG30
 xN6iow5NIPz7LzmT1GKQdHOZRC7tXNF7h+6P5hnTE+6NoCFn/khquPbsOi4kzfmRZIIi
 56eb5AqTfiZJV6vVRRWQCEeHR/E4y7awXmubpZyin0poIcn7XLFM10qKqFnagRY/W6oD
 7ldA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ckjG6ejSdo9drlW9OhdRmdSs2L91z0XXqFpXH7PrOww=;
 b=DFMCMwhPYOEyjwVEQ+5Vw39RPuZrGBAFcYWzV25XNGOZ3EuSPH7KZnKxIXHJMiIcuc
 juS2M7qhM/IjZzJeXmSN2uJTNFhui7AfU8FgXgX6q6cojI17WUgwdD1oWDb76n3sevOV
 gz0K4WJcyk+pi69NztwP0yadab6ix6o3NkiwZa8hWVPaVX3yADwRF3dQZEzQAt6aS51D
 0hAXnwvyTa8gC4FIebrDB2DO4h3dLPrfp1fGlpOsfyQ6v9IzYzh6hrN1EB0zcip0uy71
 AdSmvOoCObfRvATVpPWE7p8crFpIwKYkkYrDYJD6ojSzPvOEGCDdHKQqgekc7bl9Xvcw
 cJ1g==
X-Gm-Message-State: AOAM531lDKt95ZQy2G3B0Cyh3AvmpIegfgt+5N4JhN0lhsP6693/3H8Y
 +uSjvDW7ZRN6GMbcGQPJjJfLwECfmi16yQ==
X-Google-Smtp-Source: ABdhPJzQ/d2T9+nrkNC/I1tckxXF5sWzp9NFTspOY8s615sW7giIewuO1BtmQvG8XuKzuB2k67LZ1g==
X-Received: by 2002:a7b:c005:: with SMTP id c5mr16666906wmb.113.1623677335086; 
 Mon, 14 Jun 2021 06:28:55 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id r18sm16233044wro.62.2021.06.14.06.28.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 06:28:54 -0700 (PDT)
Subject: Re: [PATCH] linux-user/trace-events: fix minor type in format string
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210614132536.1657-1-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <2f55a021-afa0-082e-b70d-bfc1a7299e02@amsat.org>
Date: Mon, 14 Jun 2021 15:28:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210614132536.1657-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.489,
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
Cc: qemu-trivial@nongnu.org, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/14/21 3:25 PM, Alex Bennée wrote:
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  linux-user/trace-events | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

