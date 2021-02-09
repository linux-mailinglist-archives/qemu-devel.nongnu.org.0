Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DFA315533
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 18:38:37 +0100 (CET)
Received: from localhost ([::1]:56790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9WyC-0006rt-7Q
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 12:38:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l9Ww0-0005ta-Bg; Tue, 09 Feb 2021 12:36:20 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:42117)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l9Wvy-00009H-Jo; Tue, 09 Feb 2021 12:36:20 -0500
Received: by mail-ed1-x533.google.com with SMTP id z22so24816295edb.9;
 Tue, 09 Feb 2021 09:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LbRyAC0F5ykHxeSnvQbI3AuxPDlS8UegMcl3hOGOeoM=;
 b=raoZMle50mMeN6wost5OJQw4rdqlpddLg+SXd7XJebAygTZeHrCeoUPjLNnblBh4jb
 y1dqrs//c7+T54f65uyGlqxA1DuLT3ix+47IZJx8hPZL0Y7Sy15XgBFJfaRqZFkrGZXt
 OG5GGVN9Yb9KBRGxCBfQx11WuB11gzG0f87LlK1ziQkIw+l+2A1IuC0Y6rYFu6Aw6hCB
 dCnRbuXCNu5RtNtB/9+/auXcnQF+0qPPGLYusqokgp71YNShsBLNnA/OakXE3PVmmF9I
 NCnMRxybLxOlGojkgNASSR4lIF+qRa0aRX8vS+xMgB2IDl6ZK5B/0Y8P1v56gWUAt0n9
 6Q8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LbRyAC0F5ykHxeSnvQbI3AuxPDlS8UegMcl3hOGOeoM=;
 b=sxGSpQ3FFUsBXmaOCJlMAue256hWQMKle/zg/+6t92saSBO5opa0ftrrUeKSNaFqNE
 WF8Qz5LqC/zibR4DkNJTO+ivWLxuBTerZsMMDd75yWUFGrZxaWhsfKigbwt1CHIIP9Ye
 /pnXaXaweFFgdfjcFkB/HvAWTSE/gepnmsNAGTbCbi62nYrrIt7TOkqgLppfSwCFGqjY
 2UY8ZiBcWUloJR+ni3VoGnZ9KK2Qgjhh18uDVZqyqtmTYN26VyekAgi5owB3rnF/vmIG
 a/MfZhedX+rOxOOi14gKZwsMpWEPp7apzCJPZ4HdcwgXEjAax3JeydL8ltA0JKEc1DKf
 aQfg==
X-Gm-Message-State: AOAM53243Ow8NqjZWxc6kZ/k2hwLyoqv3ttMHNwLqmvGvW3giNNYIEof
 0FKxIVf1mz2uYSlbNrPk3k4=
X-Google-Smtp-Source: ABdhPJzrxa4CyRL1+OYWVWX8AQkJKGDU7PqzryDfNyLNEwWSiQip0RdQ3bhtOgql0Ku81rMN7MragQ==
X-Received: by 2002:a05:6402:617:: with SMTP id
 n23mr24569659edv.257.1612892176616; 
 Tue, 09 Feb 2021 09:36:16 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id s1sm10970406ejx.25.2021.02.09.09.36.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Feb 2021 09:36:15 -0800 (PST)
Subject: Re: [PATCH v4 0/9] hw/sd: Support block read/write in SPI mode
To: Bin Meng <bmeng.cn@gmail.com>, Qemu-block <qemu-block@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
References: <20210128063035.15674-1-bmeng.cn@gmail.com>
 <CAEUhbmXofQq9AerwBQfjDZkwp0kA9w+y+x_F0LUWZ6ArP+9H=g@mail.gmail.com>
 <CAEUhbmXb58yxg1TAgq0vdH=QE-o0qCTjYghX2XZag-S1cWB=Eg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <2a425f7a-67c6-ad96-5351-ac6c28cbc5ce@amsat.org>
Date: Tue, 9 Feb 2021 18:36:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAEUhbmXb58yxg1TAgq0vdH=QE-o0qCTjYghX2XZag-S1cWB=Eg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.265,
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/9/21 3:32 PM, Bin Meng wrote:
> Hi Philippe,
> 
> On Thu, Feb 4, 2021 at 2:02 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>>
>> On Thu, Jan 28, 2021 at 2:30 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>>>
>>> From: Bin Meng <bin.meng@windriver.com>
>>>
>>> This includes the previously v3 series [1], and one single patch [2].
>>>
>>> Compared to v3, this fixed the following issue in patch [v3,6/6]:
>>> - Keep the card state to SSI_SD_CMD instead of SSI_SD_RESPONSE after
>>>   receiving the STOP_TRAN token per the spec
>>>
>>> All software tested so far (U-Boot/Linux/VxWorks) do work without
>>> the fix, but it is better to comform with the spec.
>>>
>>> In addition to [2], one more issue was exposed when testing with
>>> VxWorks driver related to STOP_TRANSMISSION (CMD12) response.
>>>
>>> [1] http://patchwork.ozlabs.org/project/qemu-devel/list/?series=226136
>>> [2] http://patchwork.ozlabs.org/project/qemu-devel/patch/1611636214-52427-1-git-send-email-bmeng.cn@gmail.com/
>>>
>>> Changes in v4:
>>> - Keep the card state to SSI_SD_CMD instead of SSI_SD_RESPONSE after
>>>   receiving the STOP_TRAN token per the spec
>>> - new patch: fix STOP_TRANSMISSION (CMD12) response
>>> - new patch: handle the rest commands with R1b response type
>>>
>>
>> Ping?
> 
> Will a PR be sent soon to include this series so that the SiFive SPI
> series can follow?

I had it planned for yesterday but had problems with the mails from
the list, + the CVE (you fixed) took priority.

Missing review is patch #8 "Fix STOP_TRANSMISSION (CMD12) response"
for which I don't have test yet.

