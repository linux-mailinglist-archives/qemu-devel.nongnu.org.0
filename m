Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9614F41A196
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 23:58:16 +0200 (CEST)
Received: from localhost ([::1]:56554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUydb-000448-JZ
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 17:58:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vineetg@rivosinc.com>)
 id 1mUyaC-0001se-R6
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 17:54:44 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:37871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vineetg@rivosinc.com>)
 id 1mUya7-0001jy-Q0
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 17:54:43 -0400
Received: by mail-pl1-x62c.google.com with SMTP id j14so12745419plx.4
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 14:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:subject:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=PJzmY0qHI6DChk630lgLKcl3/aH9fh4iKxEHXdjNeAg=;
 b=dkQUUrC5Yi/zC6CXZ8dpap+Z83TGzeaSPChFWmnYNjPjDjaz61x89JoEr3pieSrfK4
 Z9OULe7onqqYxDeDHCrLh5tsNRT+xuZU88QwTEGQcfO8rMVEN32yPEeOqEGfFHn/QKYZ
 FzkcDHdZvlKf/HlY0xTW/A9+Etx7bSRSNE8ksqTNccWZpgxouE9EK1Mnw1dPV+4CKRCi
 o8oPIR68O/D3NW8m9LZlRaEljmuIwiII6mR7gjbyEaqD/x78Ns/Lrit0XEsz4cqEs4L4
 dDu6omU7XSbTKtxhtRf/A4C7T1rKcB7pvNDzjzQsAhqEPyZJcUmNe//fCLWiriAIazhq
 5fkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:subject:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=PJzmY0qHI6DChk630lgLKcl3/aH9fh4iKxEHXdjNeAg=;
 b=qn0NTYY0jTSO/Epmer1b9IFaMIjqw+kIBULfZE64p0m7wkQOhGSBLbXiaekcnMgYyd
 gOIG+48maN0bxs0u/XSR6LLjn21zCy2uapDQBH8lHqY2HgGPevEe1ypWm612GEuARBhf
 jgu7tnOfHicRF/yHId9YLysp60U94xABVUodANJDPcRTrkbDr+ybvtJiPns/dNPCK+OS
 P9rkLPMzAVaVTu7eAjteMx0j7jPKxZURKHeckSYLCeI4HJMHBV7N+uvmPJXtW8qoTgyW
 WnDo64G9wW8vei0UBuu1kbkII7o+d2ns5cdpsOOnrK7onizlB2KO6sR1apsUvXqjrpuP
 O9Sw==
X-Gm-Message-State: AOAM530Zpo8I2YzwnGpFa/fXyYA/BXVfZYWBrP1Kax2LPwWvV3LQpVSC
 uMBtNYx3SLZwwjQ+l/VgN1jmCA==
X-Google-Smtp-Source: ABdhPJz3sKV58OpS1U9joyXGQ4np3v7jRK6ct/kq4vxyb3rPRX/U/UUhhJDZh4vJ44T51Yu6lhjVzA==
X-Received: by 2002:a17:903:18d:b0:13c:aad1:e74e with SMTP id
 z13-20020a170903018d00b0013caad1e74emr1924066plg.64.1632779677962; 
 Mon, 27 Sep 2021 14:54:37 -0700 (PDT)
Received: from [192.168.50.50] (c-24-4-73-83.hsd1.ca.comcast.net. [24.4.73.83])
 by smtp.gmail.com with ESMTPSA id w206sm17985007pfc.45.2021.09.27.14.54.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Sep 2021 14:54:37 -0700 (PDT)
From: Vineet Gupta <vineetg@rivosinc.com>
X-Google-Original-From: Vineet Gupta <vineet.gupta@linux.dev>
Subject: Re: [PATCH v11 00/16] target/riscv: Update QEmu for Zb[abcs] 1.0.0
To: Jim Wilson <jimw@sifive.com>
References: <20210911140016.834071-1-philipp.tomsich@vrull.eu>
 <5be1705c-c39e-fa44-201c-467811f8e5c8@linux.dev>
 <CAFyWVaaULg4rgBa50a_8LFossYmc4AfQcLDi0trEiunSckVaaw@mail.gmail.com>
Message-ID: <823201b9-326c-cd1f-7695-e8f02c0c384a@linux.dev>
Date: Mon, 27 Sep 2021 14:54:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAFyWVaaULg4rgBa50a_8LFossYmc4AfQcLDi0trEiunSckVaaw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=vineetg@rivosinc.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-3.136, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Kito Cheng <kito.cheng@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 9/27/21 1:23 PM, Jim Wilson wrote:
> On Mon, Sep 27, 2021 at 1:01 PM Vineet Gupta <vineetg@rivosinc.com 
> <mailto:vineetg@rivosinc.com>> wrote:
>
>     So I obviously forgot to get the equivalent binutils branch, but the
>     only rvb branch on sifive fork feels dated
>
>     https://github.com/riscv-collab/riscv-binutils-gdb/tree/riscv-binutils-2.35-rvb
>     <https://github.com/riscv-collab/riscv-binutils-gdb/tree/riscv-binutils-2.35-rvb>
>
>
> That is the right branch to use with the gcc that you are using.  This 
> stuff hasn't been actively maintained so we have old gcc and binutils 
> release versions.
>
> We are in the process of putting stuff upstream now.
>

Thx Jim. Guess we'd have to wait for dust to settle, as this instance of 
binutils can't seem to grok sh1add.uw spit out by rvb-shNadd-03.c

-Vineet

