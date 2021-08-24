Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 682463F59D0
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 10:24:40 +0200 (CEST)
Received: from localhost ([::1]:58208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIRjb-0005ld-EB
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 04:24:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIRhi-0003hU-AQ
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 04:22:42 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:35424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIRhf-0003xt-6w
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 04:22:42 -0400
Received: by mail-wr1-x42e.google.com with SMTP id i6so6249162wrv.2
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 01:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sdsi17wxC/zGjzftqa3/YH2aKp8DuYOL2v2KH8HGOgc=;
 b=sXbFUnKIqvU1s7TxV90axNcyms+f6f1aQn5X3BppGzd6A2DezcrU2rCXcJlRQwtDpq
 hDXgKKYP/8fT76iK7b40cYk4chhJtki+1GfneuyuXRIo6Rp2hBuOVpwRwBUx+LkwyxDT
 fRTw+JdzNgp/VJXmFUAH8D2fnqZLIIusdtHaBDYBfIN/LRGdijAQUjpYoO3fyEA21fmc
 PsXdNkmTa7tK13ebbTVfJZWR2ypkZW+7UZaDdBsT8QHlYvLd6BnbZqRcbUZ2Qov/sKIX
 Yp/sU4UNoarcxoj8haK0BEDjEsbekU0GTliMBnYodPG6wKbJaiNSbn2F6BpsBzdg4+MR
 Uquw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sdsi17wxC/zGjzftqa3/YH2aKp8DuYOL2v2KH8HGOgc=;
 b=MOzEJgJB8Jfh2vF9or/mRCxnBwx4sgi4Ylabg5E5ArM2b5TdDIImog3y2zq8blCVku
 KZq557xNyMyignfT2g+PcjXTMC1Net7wsuAzWTyE9C/l/aXTJahoS2J5OOu7464nj2lY
 zjZ/I57a1HoROPy3F29ruyo5SoVj8wz2zZ88uXzd7QcYJv27FCN6AZm3ag5YWx9oIIht
 bhrVlvj8qOdkbHh5q/Kkwb6o11jroVmQPWyoantyWz3FGJ/e1E4+tRk1fioZnzgUOEDH
 WskqEGKCKtF672qKH6oBXLK1fM6PepvHJBoggWsVI5nxGDfWW0p9phuixnumwnuP7Vvs
 B6WQ==
X-Gm-Message-State: AOAM532vgmFaXDqKPMIlV4ssripiQWt184Q5proSZqguymuBrfe+Yzh4
 4Vs/Y0eUb4zeJnvuP+cvPzWVSofqvng=
X-Google-Smtp-Source: ABdhPJz0pArqUXk4cSNiwSV/cUZeibPSEU1X7vCd1cOXd/c0pH69Y6XW3CMEIKCWdbMlPms1+bd2mg==
X-Received: by 2002:a5d:4acc:: with SMTP id y12mr9286992wrs.278.1629793356710; 
 Tue, 24 Aug 2021 01:22:36 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id y4sm1602085wmi.22.2021.08.24.01.22.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Aug 2021 01:22:36 -0700 (PDT)
Subject: Re: Testing a microcontroller emulation by loading the binary on
 incomplete Flash emulation
To: Gautam Bhat <mindentropy@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <CAM2a4uwQ0M=TmFdWaaO-E_2J06fpH1ghXhYJJKBP6s5j90ASLg@mail.gmail.com>
 <CAFEAcA9SeTTcU_p+-KwGJPyYG7pKzSJGGb287tXYOvN13E6-iQ@mail.gmail.com>
 <CAM2a4uxO=DaspSeT0LPHTvKuH6crzzQC4_syAf=J+FOE_C_sbw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <9984de93-0b83-ef88-8301-a8b74f3f6247@amsat.org>
Date: Tue, 24 Aug 2021 10:22:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAM2a4uxO=DaspSeT0LPHTvKuH6crzzQC4_syAf=J+FOE_C_sbw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.023,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/23/21 9:46 PM, Gautam Bhat wrote:
> On Sun, Aug 22, 2021 at 10:18 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>> On Sun, 22 Aug 2021 at 15:37, Gautam Bhat <mindentropy@gmail.com> wrote:
>>>
>>> Hi,
>>>
>>> I am to implement a very simple microcontroller for my understanding
>>> of Qemu development. This microcontroller runs its code from
>>> programmable flash which is bit-, byte- and word addressable. To do
>>> some initial tests of my nascent microcontroller implementation I

Aren't Nascent uC based on 8051? Because AFAIK QEMU doesn't emulate
this architecture.

>>> would like to load a very simple program binary. Is there a way to
>>> load this binary and start execution without emulating Flash
>>> controller and memory?
>>
>> Just create a plain old RAM memory region, and then load the
>> guest binary into it with the 'generic loader' (which can
>> take an ELF file or a raw binary).
>>
>> -- PMM
> 
> Thanks. I will check it out.
> 


