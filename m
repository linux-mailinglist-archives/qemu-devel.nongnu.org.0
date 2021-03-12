Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5458338202
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 01:03:16 +0100 (CET)
Received: from localhost ([::1]:57980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKVGt-000718-D1
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 19:03:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lKVFh-0006Rq-Bu
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 19:02:01 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:40979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lKVFf-0004fU-AZ
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 19:02:01 -0500
Received: by mail-wr1-x434.google.com with SMTP id f12so3813145wrx.8
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 16:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8ADKN78BGtN0goW6aK5SPhekfSdN97kCzuHk2TVkgFQ=;
 b=pii3mgI/Q3zU0qijZkFUzC9bZkGXoEbQ5b3WZ80DtwNLl96bvDbYfVQ8BvpyyWKBQL
 +QqYOiYD47OHhzP/MA6xWnjwi6sKmcg219kArP3Q48xYWeFdsucD7ocZfHtv8AIKvMwI
 3ADy0DxaSN7vG+X73u3rB4GYYiD03zrTosQMJAcJgSPy9+GjQ6WERJdPgX0m+IzSJ6Oo
 kxtMSYy/xvVmnmnNdDgPHik14UkZzFRna+LpnQw9Y+8pmf1Qkqi/+1HBX8aMbUmDmIXD
 nmZZ2tlKCEMvoxwcfMRp0mERq7Slqpldw+TlbJ5bi1pRX6pdS1LqUdJW0ir3qL5Kgtkh
 zu+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8ADKN78BGtN0goW6aK5SPhekfSdN97kCzuHk2TVkgFQ=;
 b=HQSq2ft5W7h3cqxtQ2gNHT39aCCOcWP2Dc6Sd4b0hQtjMzQ/ez7dZ7CD8pvcRE7bUm
 NaxJlSp+ptQRZMXhFCaBMiwHOtO5AFGtx0v5niAvBqbWmFNyJnt0AN1p1xvWmtlYhO7o
 g8E8jx6QnOfBiZz+ckUfOH3U2JanBuwGOMFE60jhZdySFHSl6ElmRT42vYQJ2l8Av1AL
 /rdWsRUQaWuADaCMubLpR+9oBlgSOcN63LPPmGMielMcZsUCXZX2xBdwuuG2wIgTH1CH
 OHwSwXyzgDSeWKdqKqQF9uzPNr5+xSkv5oVoZJPrZUinv5C4lMSfgelfdMWN6+zBxyO/
 6Low==
X-Gm-Message-State: AOAM533cUpFz0oPDzBBGmKB/o0w7q0s+C9A4S17ZBiaUChbqoT3F7dqf
 t3l2lwdzG/A+8P8oUE1oFAU=
X-Google-Smtp-Source: ABdhPJzKkcfFI7l8/KFRzFIkgFpAANbwrC48EhoFnBXV6v4uhBPT9L9v4ZY8e5SDzXHyQukCzDIS7A==
X-Received: by 2002:a5d:4884:: with SMTP id g4mr11115732wrq.191.1615507317496; 
 Thu, 11 Mar 2021 16:01:57 -0800 (PST)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id p14sm352422wmc.30.2021.03.11.16.01.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Mar 2021 16:01:56 -0800 (PST)
Subject: Re: [RFC PATCH v2 00/22] target/mips: Reintroduce the R5900 CPU
 (without testing)
To: qemu-devel@nongnu.org
References: <20210309145653.743937-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <3ff92482-2f9c-395e-507f-9af69aa75c09@amsat.org>
Date: Fri, 12 Mar 2021 01:01:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210309145653.743937-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Fredrik Noring <noring@nocrew.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/9/21 3:56 PM, Philippe Mathieu-Daudé wrote:
> First part (TCG, testing postponed) of RFC v1:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg782449.html
> 
> 3 patches can still be improved for performance, but the improvement
> is not yet addressed in this series. Other patches are good enough
> for review.
> 
> https://gitlab.com/philmd/qemu/-/commits/mips-r5900-v2
> Based-on: mips-next
> Supersedes: <20210214175912.732946-1-f4bug@amsat.org>
> 
> Philippe Mathieu-Daudé (22):
>   target/mips/tx79: Move MFHI1 / MFLO1 opcodes to decodetree
>   target/mips/tx79: Move MTHI1 / MTLO1 opcodes to decodetree
>   target/mips/translate: Make gen_rdhwr() public
>   target/mips/translate: Simplify PCPYH using deposit_i64()
>   target/mips/tx79: Move PCPYH opcode to decodetree
>   target/mips/tx79: Move PCPYLD / PCPYUD opcodes to decodetree
>   target/mips: Remove 'C790 Multimedia Instructions' dead code
>   target/mips/tx79: Salvage instructions description comment

Patches 1-8 applied to mips-next.

