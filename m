Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A22723321A5
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 10:11:23 +0100 (CET)
Received: from localhost ([::1]:38974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJYOg-0002Kh-Mm
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 04:11:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJYNm-0001nE-3T
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 04:10:26 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:37083)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJYNk-0002Ox-D6
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 04:10:25 -0500
Received: by mail-wr1-x42c.google.com with SMTP id v15so14354287wrx.4
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 01:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HxSvChybsMbHvVaZQ306A/5VaBVT+suUQoytTvn9WiM=;
 b=uLFSowBsCQWgcFVhMrxEQgB9eWJoFsWTTwihT+Go2IiRhb+fBfAM3TXGbyOGRoNixe
 huKaVCVlc1e1A4eWlCgIlE2vyIofH2yibSIprK8BwVm/OqgqW50PONXsMkUZQARjtrf8
 xY5TEEJHSAsj7aPrluf87cj798irT295XvhiTLPqTaHDfxDCXEG/YWacrwCWTtQa7kfT
 tF3ScZQCQzakXv3MHQE65YnOjtin7bbvY80T4wEuegmSVjYDVTq2MGvXjx5fb3Ph9olp
 uIRqjZwUodHE23+/1xpKA9L1tQlCg27iYS3SH5LB8UMUts/bnmiBeZyh6leUSJ4V5uou
 xkAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HxSvChybsMbHvVaZQ306A/5VaBVT+suUQoytTvn9WiM=;
 b=BvtrinOBzG7z2ZNUGVVNtrAC8eaWV3gyj2zB4/17YYTldisRayjlRcrC6GjFlu07g4
 cqWrC8r+WEZu1n4hC6PfXHnHJKVlbolYsAbvvwsO4Fw8xAcuRjpanx4ndlnXH8nAPZVE
 dqGty+Zfnb7Vpix1uL5DYtiKkeY/mXcwNpKQlBnvHm3RraFn0xDN4R6Vkt9JWL8iP3Ox
 UV6JrSuq3sAlh23wSG8cY62ZpnaNmqfaELNUeSLE6NwmFl6M8dN4t3pegTvbDuBIbNcR
 dGUH6Gg6FIimyjtQD2Dvp2NdPGko9nX3RwUxXnhcg6pFJBS+5t1Qjwns2PeV/tCZ1tjS
 thKA==
X-Gm-Message-State: AOAM532RjZAAsuEWViRtG6VtqikRjIozkcUCWmlKLl6KxGJeuE9bWRcN
 /87KZOsoi3e6TDXQZKEmrUQ=
X-Google-Smtp-Source: ABdhPJwYX29SWThA7uQciokKmdn5N9ePTG41K+5O5mOwQ05OoYX9xcBMALHoz9zpKzCUz6uxxoo7sg==
X-Received: by 2002:a5d:4ac4:: with SMTP id y4mr26518421wrs.86.1615281022462; 
 Tue, 09 Mar 2021 01:10:22 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id n66sm2968269wmn.25.2021.03.09.01.10.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Mar 2021 01:10:22 -0800 (PST)
Subject: Re: [PATCH 0/6] hw/mips/gt64120: Minor fixes
To: qemu-devel@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>
References: <20210305162107.2233203-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <38c097d6-f93c-76ff-d7ad-ddcd95556a2c@amsat.org>
Date: Tue, 9 Mar 2021 10:10:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210305162107.2233203-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Zoltan,

On 3/5/21 5:21 PM, Philippe Mathieu-Daudé wrote:
> Trivial fixes extracted from another series which became too big,
> so I prefer to send them in a previous step.

I just realized I meant to Cc you on this series but forgot :/
As this model is pretty close to your MV64361 one, and this
series is trivial, do you mind reviewing it? It shouldn't take
more than 5min I hope ;)

Thanks,

Phil.

> 
> Philippe Mathieu-Daudé (6):
>   hw/mips/gt64xxx: Initialize ISD I/O memory region in DeviceRealize()
>   hw/mips/gt64xxx: Simplify ISD MemoryRegion read/write handlers
>   hw/mips/gt64xxx: Fix typos in qemu_log_mask() formats
>   hw/mips/gt64xxx: Rename trace events related to interrupt registers
>   hw/mips/gt64xxx: Trace accesses to ISD registers
>   hw/mips/gt64xxx: Let the GT64120 manage the lower 512MiB hole
> 
>  hw/mips/gt64xxx_pci.c | 67 +++++++++++++++++++++++++++----------------
>  hw/mips/malta.c       |  7 -----
>  hw/mips/trace-events  |  6 ++--
>  3 files changed, 47 insertions(+), 33 deletions(-)
> 

