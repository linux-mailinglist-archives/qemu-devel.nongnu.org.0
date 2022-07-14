Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A975750E8
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 16:34:40 +0200 (CEST)
Received: from localhost ([::1]:39730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBzvM-0000jX-24
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 10:34:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1oBzt4-0007a1-3t
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 10:32:18 -0400
Received: from smtp84.cstnet.cn ([159.226.251.84]:45936 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fanjinhao21s@ict.ac.cn>) id 1oBzt1-0000Jb-Bf
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 10:32:17 -0400
Received: from smtpclient.apple (unknown [111.199.64.159])
 by APP-05 (Coremail) with SMTP id zQCowADX3bHaKNBicZWzDQ--.56026S2;
 Thu, 14 Jul 2022 22:31:55 +0800 (CST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [RFC] hw/nvme: Use irqfd to send interrupts
From: Jinhao Fan <fanjinhao21s@ict.ac.cn>
In-Reply-To: <Ys+ZCHFWbjAH/48O@apples>
Date: Thu, 14 Jul 2022 22:31:54 +0800
Cc: qemu-devel@nongnu.org,
 Keith Busch <kbusch@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <B3BEF322-9EB2-465D-AA67-5C426BBCBB5F@ict.ac.cn>
References: <20220709043503.2228736-1-fanjinhao21s@ict.ac.cn>
 <Ys1oY9LmeDCGT9FT@apples> <Ys+ZCHFWbjAH/48O@apples>
To: Klaus Jensen <its@irrelevant.dk>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-CM-TRANSID: zQCowADX3bHaKNBicZWzDQ--.56026S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kw18WF1DXrW8KF1UWFykKrg_yoW8WF18pa
 y7Ga9rGr48ArWrA34Y9anrWa1UtrZ5ur4ruF9Fga9rJr1vyryxXrW8KFy5GF93urZrJw17
 XrWjga47Aas2v3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUyab7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
 8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
 64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
 Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l4I8I
 3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxV
 WUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAF
 wI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcI
 k0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_
 Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8v_M3UUUUU==
X-Originating-IP: [111.199.64.159]
X-CM-SenderInfo: xidqyxpqkd0j0rv6xunwoduhdfq/
Received-SPF: pass client-ip=159.226.251.84;
 envelope-from=fanjinhao21s@ict.ac.cn; helo=cstnet.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

at 12:18 PM, Klaus Jensen <its@irrelevant.dk> wrote:

> On Jul 12 14:26, Klaus Jensen wrote:
>> On Jul  9 12:35, Jinhao Fan wrote:
>>> Use irqfd to directly notify KVM to inject interrupts. This is done =
by
>>> registering a virtual IRQ(virq) in KVM and associate the virq with =
an
>>> irqfd, so that KVM can directly inject the interrupt when it =
receives
>>> notification from the irqfd. This approach is supposed to improve=20
>>> performance because it bypasses QEMU's MSI interrupt emulation =
logic.
>>>=20
>>> However, I did not see an obvious improvement of the emulation =
KIOPS:
>>>=20
>>> QD      1   4  16  64=20
>>> QEMU   38 123 210 329
>>> irqfd  40 129 219 328
>>>=20
>>> I found this problem quite hard to diagnose since irqfd's workflow
>>> involves both QEMU and the in-kernel KVM.=20
>>>=20
>>> Could you help me figure out the following questions:
>>>=20
>>> 1. How much performance improvement can I expect from using irqfd?
>>=20
>> This is a level of QEMU/KVM that I am by no means an expert on and I
>> would have to let the broader QEMU community comment on this.
>=20
> In any case, I'm wary about adding this level of kvm-dependence in the
> device. This wont work on non-kvm platforms any more.

Yes, irqfd seems only useful on KVM-based systems. Maybe it is more =
suitable
for vhost or VFIO based solutions which need irqfd to deliver =
interrupts.

> I think you should put irqfd on hold and focus on iothreads :)

I=E2=80=99m working on iothread currently. But I also observed a =
performance
regression with iothread enabled. I found ftrace, which is supported by =
both
QEMU and KVM, seems good for analyzing performance issues. I=E2=80=99m =
currently
exploring with ftrace.


