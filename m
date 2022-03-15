Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E42014D9BAA
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 13:57:11 +0100 (CET)
Received: from localhost ([::1]:56190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU6je-0004Q3-Ob
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 08:57:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ralf.ramsauer@oth-regensburg.de>)
 id 1nU6eC-00024P-NA
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 08:51:36 -0400
Received: from mta02.hs-regensburg.de ([194.95.104.12]:54458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ralf.ramsauer@oth-regensburg.de>)
 id 1nU6eA-0007AE-AC
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 08:51:32 -0400
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de
 [IPv6:2001:638:a01:8013::93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "E16S03", Issuer "E16S03" (not verified))
 by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4KHtZR0MM6zxvr;
 Tue, 15 Mar 2022 13:51:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oth-regensburg.de;
 s=mta02-20211122; t=1647348687;
 bh=w7nncRMr6drHQr7pnqtm+LGuzUw5f+XH1HzbCMPMW2Y=;
 h=Date:Subject:To:CC:References:From:In-Reply-To:From;
 b=FefjYjkPNYaLXDZF5GDYnxB+G5VibESBQ0Ml68El22oJgdwL8qCwRY8BDyQRFx0l5
 uHjdE/ObEQHaw/flyBnCXQeKMk/eGlID88x9IqQDeE2CsD7VyNChAVdZ8mC27OAh/B
 O1JCeIccLABapKUXFWrhQCDGmloqOg5dgHwS94Cx9E8/zd01kG+GmH0oyBl/wbDymk
 R6BqZ3vIK766DmI5k4vkaZeS26ovKUG8jVRJc8s4YgjzjCmRDmdgIS+wP5hHy5f7kg
 0IJyQwQOWDJzVH/ihGqFdQZFQo6f7sEcTM2PiV2QK1L9T/oAuUTPEc4tZLCBDl26SG
 C0I7ZGmRJwWAA==
Received: from [IPV6:2a02:810d:8fc0:44bc::2592] (2001:638:a01:8013::138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 15 Mar 2022 13:51:26 +0100
Message-ID: <3783dce0-0c5b-824e-2097-bbc3367281a6@oth-regensburg.de>
Date: Tue, 15 Mar 2022 13:51:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [EXT] Re: QEMU+KVM on RISC-V + Hypervisor Extension
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <57412635-6b46-823b-14a4-0ee694ace5b8@oth-regensburg.de>
 <CAKmqyKOZN=hS73TfgHfMtxktZ9kkw4kBBA4-gjGAV8Q0Kw+KHw@mail.gmail.com>
 <CAAhSdy23Ag=ZqUj82aZ6BNA2SJq54rbCDjeX=1cHtbq7LR8jaQ@mail.gmail.com>
 <a840f9ac-7315-4381-4c85-719efb413b18@oth-regensburg.de>
 <CAFEAcA98VQmM_ETpNuhq31Y7xLkS_AjVRsTeCdnqzMZG-3uxBA@mail.gmail.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <CAFEAcA98VQmM_ETpNuhq31Y7xLkS_AjVRsTeCdnqzMZG-3uxBA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
Received-SPF: pass client-ip=194.95.104.12;
 envelope-from=ralf.ramsauer@oth-regensburg.de; helo=mta02.hs-regensburg.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Anup Patel <apatel@ventanamicro.com>, Anup Patel <anup@brainfault.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Jiangyifei <jiangyifei@huawei.com>,
 Stefan Huber <stefan.huber@oth-regensburg.de>,
 Alistair Francis <alistair23@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 15/03/2022 13:42, Peter Maydell wrote:
> On Tue, 15 Mar 2022 at 12:29, Ralf Ramsauer
> <ralf.ramsauer@oth-regensburg.de> wrote:
>> I have no kernel specified in the guest, so I'd then expect to boot into
>> an completely empty machine (besides the tiny startup stub in the MROM).
>> However, I still get the exact same error as mentioned in my initial mail.
>>
>> Again, without "-enable-kvm", everything works as expected (i.e., I
>> don't see any output, because there's basically no guest code to execute).
> 
> Well, you'll always be trying to execute something, even if it's
> all-zeroes. I dunno what RISC-V does with its encodings, but you
> typically either end up in an infinite loop of taking exceptions
> (if all-0s isn't a valid instruction) or else you just execute
> through all of guest RAM (if it is something similar to a no-op).
> In the latter scenario it's quite plausible that the guest ends
> up doing something KVM doesn't expect, such as trying to execute
> from an area of the address space where there is no RAM, or a device.
> If so, "return failure from VCPU_RUN and QEMU aborts" is what I
> think I would expect to see.
> 
> If I were you I would try it with some actual guest code loaded
> at a location where there is RAM...

I guess you are right, and I think, together with the other mail, I now 
understand why I experienced a failure:

As Anup explained, there is no M-Mode, but I passed an OpenSBI BIOS. The 
initial MROM handed over to OpenSBI (located at RAM base 0x80000000). At 
some point, OpenSBI threw an exception (maybe it accessed an CSR it is 
not allowed to, whatever), because it is in S-Mode. Exception vectors 
were not (yet) installed, but initialized with 0x0.

This is how I ended up with the PC at 0x0. Behind 0x0, there's no 
physical backing, and KVM threw an Instruction Guest PF (SCAUSE=0x14).

Didn't verify this, but this somehow sounds plausible to me.

Thanks!
   Ralf

> 
> -- PMM

