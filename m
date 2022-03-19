Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C475A4DE7DC
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Mar 2022 13:28:05 +0100 (CET)
Received: from localhost ([::1]:51884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVYBg-0002Qy-Gw
	for lists+qemu-devel@lfdr.de; Sat, 19 Mar 2022 08:28:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ralf.ramsauer@oth-regensburg.de>)
 id 1nVY8k-0001Iv-8n
 for qemu-devel@nongnu.org; Sat, 19 Mar 2022 08:25:03 -0400
Received: from [2001:638:a01:1096::12] (port=47842 helo=mta02.hs-regensburg.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ralf.ramsauer@oth-regensburg.de>)
 id 1nVY8g-0007yz-Tx
 for qemu-devel@nongnu.org; Sat, 19 Mar 2022 08:25:01 -0400
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de
 [IPv6:2001:638:a01:8013::93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "E16S03", Issuer "E16S03" (not verified))
 by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4KLKnq3g9PzxwB;
 Sat, 19 Mar 2022 13:24:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oth-regensburg.de;
 s=mta02-20211122; t=1647692687;
 bh=nwLpcamAiW2FWMbPCpZrIlPqn6XFuUYj+VBQY7dpM8o=;
 h=Date:Subject:To:CC:References:From:In-Reply-To:From;
 b=cc1iORq3NTkEY99qfBh2wwIXEvAFoKb7A+Zj8nJbOnshy7khXXwkNmYY67Q2Scf4F
 v/U9XKR8Z/fsk72y7HplMXqFDEyGTHAiOktFfnH+pGGfj2K8XzqEmLorCc9dI30/OE
 +77a6V9bX1Re24UsWY6yiPqBKHLkp8N44oRgpcpwkcH7pZW67PxXwi3FloiDKFfBmJ
 G3DQc1D59IRJIXgripy32iLD/JqYzPRKhWtUz/e9by/gzawVvV6x6gGepattI5V5sQ
 Ab3xu5CZRDwc8SCdY+Jc3JVzCk4Ib5WJ4RSlXokPytWUCNvANsRh+R370NYKlUUSJA
 mQ5A5E5E3gBiA==
Received: from [IPV6:2a02:810d:8fc0:44bc::10ea] (2001:638:a01:8013::138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sat, 19 Mar 2022 13:24:47 +0100
Message-ID: <80929f17-34c6-672f-18bd-946f381ae69f@oth-regensburg.de>
Date: Sat, 19 Mar 2022 13:24:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [EXT] Re: QEMU+KVM on RISC-V + Hypervisor Extension
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, Alistair Francis
 <alistair23@gmail.com>
References: <57412635-6b46-823b-14a4-0ee694ace5b8@oth-regensburg.de>
 <CAKmqyKOZN=hS73TfgHfMtxktZ9kkw4kBBA4-gjGAV8Q0Kw+KHw@mail.gmail.com>
 <CAAhSdy23Ag=ZqUj82aZ6BNA2SJq54rbCDjeX=1cHtbq7LR8jaQ@mail.gmail.com>
 <a840f9ac-7315-4381-4c85-719efb413b18@oth-regensburg.de>
 <CAFEAcA98VQmM_ETpNuhq31Y7xLkS_AjVRsTeCdnqzMZG-3uxBA@mail.gmail.com>
 <3783dce0-0c5b-824e-2097-bbc3367281a6@oth-regensburg.de>
 <CAKmqyKNf3qL9k83tRD+=Frdue=+WZNAJ8RxK4UivCjz0Adjbqg@mail.gmail.com>
 <CAFEAcA8mqdAf58FkxDPtL_UK2feGTEUE+h--_a8pRpSsGUCHYw@mail.gmail.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <CAFEAcA8mqdAf58FkxDPtL_UK2feGTEUE+h--_a8pRpSsGUCHYw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:638:a01:1096::12
 (failed)
Received-SPF: pass client-ip=2001:638:a01:1096::12;
 envelope-from=ralf.ramsauer@oth-regensburg.de; helo=mta02.hs-regensburg.de
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RDNS_NONE=0.793, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
 Jiangyifei <jiangyifei@huawei.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Stefan Huber <stefan.huber@oth-regensburg.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 17/03/2022 10:45, Peter Maydell wrote:
> On Wed, 16 Mar 2022 at 22:23, Alistair Francis <alistair23@gmail.com> wrote:
>> Hmm... This seems like a bug. We shouldn't allow the user to specify a
>> `-bios` option if using KVM. Would you mind preparing a patch to catch
>> this?
> 
> You don't want to allow the possibility of a bios blob that expects
> to run in S-mode, the way arm virt can run an EL1 UEFI BIOS ?

Valid point. In any case, if you wish, we could provide a patch for 
disallowing -bios in combination with -enable-kvm.

Thanks
   Ralf

> 
> thanks
> -- PMM

