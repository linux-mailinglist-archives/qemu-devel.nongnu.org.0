Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2DC3F0D23
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 23:08:57 +0200 (CEST)
Received: from localhost ([::1]:51420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGSnw-0000fo-KW
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 17:08:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGSmc-0008PU-5H
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 17:07:34 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:37469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGSmZ-0006DK-0o
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 17:07:33 -0400
Received: by mail-wr1-x430.google.com with SMTP id l11so5605160wrx.4
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 14:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Q6TBzHCkIlemfBm9mQRvTxuO5Bkzpnu+rGQSvZXRhZs=;
 b=athnTzZwgo4EX5qSE2IdtRp0Pbgvj+PvpTM9L54iXni71/GrMbcLgy/5xjA3tyUzUB
 iMGp4hvhl8XoFCRTPdc10S+u6X1mY2JLB4IS2c8yNYSD1VLeghIZBqZUFZrdlKYFDrjH
 g12/Hbux7pNhgatHV0LsQjvvUfxGcGIyJ5ep7FP50aSGr6ViwsX03mITYwePy7UUdRNW
 JGAUUBNlYe+YKFd1uJHc74W3aCeBH40vERrXfo9J8R3w1iGl/69+nrMVjKeSzdQExL93
 tZiupcOKhg7ZP9KYXaVLbowjB3B05y2lQitlu+ZPSuXuZTDqO6fhhIJCAMUbd68vVEZE
 SQJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Q6TBzHCkIlemfBm9mQRvTxuO5Bkzpnu+rGQSvZXRhZs=;
 b=o2rt7FiN2xE4EWSRmE7v/qYRNP8Unvj7ZrJTgVYLkS4quNUSvr5fVEOHj7v1JTemUv
 LcKPlMLkBnqL9S3Y8mJb1IWr3giejo/+TuqrzI/UzybU7pe6vqDL3kySfWVaV4DDe1P3
 Z+vs5hMr+UNQdiNZDMtAld94LlBYABknznzXUeYfYyLeD0G3ke4paZ1XMAaEFXajVCjS
 X2tK7Hfr1EsWd1m9IvpI3Df+sH9Npf+SQGVaX3IemLpsYCvjs7s8gvgjBfyNZOrMNrmd
 +XsXU0VjM0kT93BA9gWF3EwZ5KDENu5Vpbv1sI0N5PfH0O8E7MXIQGbZsOSIJE3Gk9/o
 4mwg==
X-Gm-Message-State: AOAM5305v/Eaxkn/18Pc7+WivtZrm5SxCFs1FV/SELry1GE65xOURdwK
 4K5nqYQdb4JK1KqnGfDE2sxZjJASs9Q=
X-Google-Smtp-Source: ABdhPJz/CqQpttgyYi6BofXnNM2Xc2Rxmr3s4aKQc8BUUqQemXFcv8ygfCw5d0hWzcSxdfdKVpnT6A==
X-Received: by 2002:a5d:49cf:: with SMTP id t15mr12667805wrs.208.1629320849476; 
 Wed, 18 Aug 2021 14:07:29 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id c2sm881659wrs.60.2021.08.18.14.07.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 14:07:28 -0700 (PDT)
Subject: Re: [PATCH v3 1/7] tcg/sparc: Drop inline markers
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210818204602.394771-1-richard.henderson@linaro.org>
 <20210818204602.394771-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <dc3e376e-98b6-7514-d7e7-68d41c5f031a@amsat.org>
Date: Wed, 18 Aug 2021 23:07:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210818204602.394771-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.961,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/18/21 10:45 PM, Richard Henderson wrote:
> Let the compiler decide about inlining.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/sparc/tcg-target.c.inc | 45 +++++++++++++++++++-------------------
>  1 file changed, 22 insertions(+), 23 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

