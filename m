Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C76139F88
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jan 2020 03:34:32 +0100 (CET)
Received: from localhost ([::1]:58452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irC2J-0004eN-EG
	for lists+qemu-devel@lfdr.de; Mon, 13 Jan 2020 21:34:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51097)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1irC0E-0001p2-Sg
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 21:32:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1irC0D-0004Uv-M9
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 21:32:22 -0500
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:39435)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1irC0D-0004Sm-DD
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 21:32:21 -0500
Received: by mail-pg1-x52d.google.com with SMTP id b137so5651697pga.6
 for <qemu-devel@nongnu.org>; Mon, 13 Jan 2020 18:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JdqfIiYkq/VKmhsBw7D0uiWQSjkGafNQwfuH6P8ZXls=;
 b=WPq4mNWv60VwEnNpYEK4sQHEH5vKsMc+3bxnP28yojQVDDWURcvta0tiiW2bychPpg
 8tZX4ysSNW6Md90jThTFBrZ3+ZkgkujNJfkG5HeSWuXzuie2vOwNZl/JC3vnaCFGNz2o
 4PgKbhTvF83AcOm8Ap5Lhm3QnzN1hp1fZEjfgdSpTFOIPHCuFyubiEWXebGjf7XOPu2k
 YK8VGoWmtQvEQGfgc53NBcwdiu1H/KTMzVNtYDiZy1bzct4zF2dM1UuEjtA+iM1XERIq
 zJc1ZUAUbMzGFLJu6ORiNWE/4loBtTxLv4SoNgy0jrjAOkVN9O6SjuZzmUGGMxRGsu/4
 ItDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JdqfIiYkq/VKmhsBw7D0uiWQSjkGafNQwfuH6P8ZXls=;
 b=q+cEeG3FzWrj6ScYN9u6LENHpWFSp/sV28lLfwhapyGxCWDV9RnDpHEgMDfLzWtJdu
 srPVap2fP0sanzUq3oyEU8uUuaXXVgRwJbc/j+CI30f/l9EEgL4TJN8tV6UHuI8uKr1f
 9zVyuOE1F7xdKHdQ2Z5vFaLLUI7dpCSCtRCmIGr35i4GFn8kD1JI7T04Cbw7nFQXz4cR
 3b+djPtsymfRVL6vf572ZqQJmi5lJwErHdSP8t9c1R4+S9zph5hldQgjTCJ3hTgLOqPT
 MspUa8ELpmGcXxIqbeFH1Aj6skBmtVlI5UXy9OufBXV8Atmo3LSvvc9xQylpwbY7pQPr
 6dJw==
X-Gm-Message-State: APjAAAWWWD06GQ5jK3sinKXJVVCQA6peNEo6AxCEk3Af1vIn8aMHvOwC
 Ra3mPaTpSPD9zno8u/NMVzI/hg==
X-Google-Smtp-Source: APXvYqzs8RpM/TsARJGwA9Qg+uy4YQ9zHVygIku2hvo5QKrWM7T7ovYpuPKsBIi1DkZial4/hAEcqg==
X-Received: by 2002:a63:e0f:: with SMTP id d15mr24122546pgl.255.1578969138694; 
 Mon, 13 Jan 2020 18:32:18 -0800 (PST)
Received: from [192.168.3.43] (rrcs-66-91-136-155.west.biz.rr.com.
 [66.91.136.155])
 by smtp.gmail.com with ESMTPSA id d129sm16140203pfd.115.2020.01.13.18.32.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jan 2020 18:32:17 -0800 (PST)
Subject: Re: [PATCH] target/riscv: Set mstatus.DS & FS correctly
To: shihpo.hung@sifive.com, qemu-devel@nongnu.org
References: <1578647134-13216-1-git-send-email-shihpo.hung@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <19df333a-9a93-d3af-e7ab-fce212bb4978@linaro.org>
Date: Mon, 13 Jan 2020 16:32:13 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1578647134-13216-1-git-send-email-shihpo.hung@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::52d
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
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Alistair Francis <Alistair.Francis@wdc.com>, qemu-riscv@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/9/20 11:05 PM, shihpo.hung@sifive.com wrote:
> Because ctx->mstatus_fs changes dynamically during runtime, we should
> remove the mstatus_fs check at the translation stage.

This change is incorrect.

The actual bug is in cpu_get_tb_cpu_state(), as I just noticed during review:

"[PATCH 2/3] RISC-V: use FIELD macro to define tb flags"
https://lists.gnu.org/archive/html/qemu-devel/2020-01/msg02455.html


r~

