Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45729307BDE
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 18:13:13 +0100 (CET)
Received: from localhost ([::1]:58516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Ar2-0006wQ-Ci
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 12:13:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l5AnU-0005Iu-Gd
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 12:09:32 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:41981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l5AnS-0004XX-U2
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 12:09:32 -0500
Received: by mail-ed1-x533.google.com with SMTP id bx12so7458964edb.8
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 09:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6hx4hQ8u4LhVKVdGvyaXrEhiu7LpnjgsmAy1u/gonbg=;
 b=RQG8Xb7XL4JK0CWOfoVCgq7Bw8azoFyZKvVOFnYVs6DQhE+QJnU6qOgesSl9jcgfwL
 XHI7XkG1qs3G5j7UYgG6b14XklGGs6uCXqnqn1y+T5nczYPexY3f14uDHzqdMgSKOBN9
 v/L0KkYorIbY3RnREfVh4RwNv8KGEXUb3YypCSWEtwuVIdEDmhN0DS+yvjG/bRlKE5uQ
 fPeaw/iHxcAVSPg3s4ThvbufBWaztPjZB5/O8EeOXmHQkSLUL1KkAXLq1BgPkmI1VsEh
 GAYlqWo1BspmVF+oDgPlK0f7gykQA04Iwf/TPYky/LWc0o7gs6NELZdl9Tr4hicfNbfD
 D69Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6hx4hQ8u4LhVKVdGvyaXrEhiu7LpnjgsmAy1u/gonbg=;
 b=d9DCKZksiujviRDYmbcis75x5mM6DcBlcHXYudZRj/7zvpGywEtjAGUhRCQ1o1eSuA
 JupgpK6D8IqAYSXCOPDBWUig5E8OZfmzk9Oclnm6+I/IOcxlmB1Dpisqy1zF4pkQtsXI
 5aB/BXkIAbH8vDr+grzvxdK7GOC+g/3Fw/+83SptBOiEGkm7bLMFKjOykhkkTg0P5tLx
 fyAPQ8bZZcRnnJoX9nGiVfkRf7OV2mosKvD0XBdUYuj4YhCgiKr7VoN7Wq58pHDr3l/N
 fnbovdDVW6XuyvA2uGcwxfI1nyRTdKJDkh7muoM39faEvP8KBauoYMEJMQbWlRBYIWNA
 j10Q==
X-Gm-Message-State: AOAM531hcggpFlaWW8Pq4QIWTrn9l9jpXvLAaP92hUTzwxUt7UAerZgW
 AmN5dsvyesigdIpWiegNpnA=
X-Google-Smtp-Source: ABdhPJzSzB9b0uuAEk7GjjSwf2B3Qx/NziS/YH2P/OfZCJ3wyzT006nPTTI102eLusoT60iVh0JvQA==
X-Received: by 2002:a05:6402:4316:: with SMTP id
 m22mr615615edc.64.1611853769340; 
 Thu, 28 Jan 2021 09:09:29 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id ce7sm2549300ejb.100.2021.01.28.09.09.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jan 2021 09:09:28 -0800 (PST)
Subject: Re: [PATCH v2] target/mips: fetch code with translator_ld
To: qemu-devel@nongnu.org
References: <20210125105818.2707067-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <2d70a52c-a832-531f-72c4-9ebb812136e4@amsat.org>
Date: Thu, 28 Jan 2021 18:09:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210125105818.2707067-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 "Emilio G . Cota" <cota@braap.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/25/21 11:58 AM, Philippe Mathieu-Daudé wrote:
> Similarly to commits ae82adc8e29..7f93879e444, use the
> translator_ld*() API introduced in commit 409c1a0bf0f
> to fetch the code on the MIPS target.
> 
> Reviewed-by: Jiaxun Yang  <jiaxun.yang@flygoat.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> v2: Restrict to translator path =)
> ---
>  target/mips/translate.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)

Thanks, applied to mips-next.


