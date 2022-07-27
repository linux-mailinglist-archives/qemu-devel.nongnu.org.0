Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 511B3582034
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 08:38:08 +0200 (CEST)
Received: from localhost ([::1]:52498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGagI-0006eU-UZ
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 02:38:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1oGaYm-00048P-1c
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 02:30:21 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:51704 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fanjinhao21s@ict.ac.cn>) id 1oGaYg-0007l6-OM
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 02:30:18 -0400
Received: from smtpclient.apple (unknown [159.226.43.13])
 by APP-01 (Coremail) with SMTP id qwCowADHDJ1j2+BiGhXyAg--.4012S2;
 Wed, 27 Jul 2022 14:29:56 +0800 (CST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH] hw/nvme: Add iothread support
From: Jinhao Fan <fanjinhao21s@ict.ac.cn>
In-Reply-To: <1FBBC9E0-81BD-47EA-92A0-DDBFDFDFA33F@ict.ac.cn>
Date: Wed, 27 Jul 2022 14:29:55 +0800
Cc: qemu-devel <qemu-devel@nongnu.org>,
 Klaus Birkelund Jensen <its@irrelevant.dk>
Content-Transfer-Encoding: quoted-printable
Message-Id: <AB440904-88D3-45C4-B05A-580C003DB922@ict.ac.cn>
References: <20220720090053.309229-1-fanjinhao21s@ict.ac.cn>
 <E29F6EF6-F2BF-41F4-B04E-E6D901D64078@ict.ac.cn>
 <Yt/+GfYPyeM4gFdq@kbusch-mbp.dhcp.thefacebook.com>
 <2606E835-E12F-4AE2-8CBC-7267016AAB7B@ict.ac.cn>
 <YuAtWPjAu2j+ttvo@kbusch-mbp.dhcp.thefacebook.com>
 <1FBBC9E0-81BD-47EA-92A0-DDBFDFDFA33F@ict.ac.cn>
To: Keith Busch <kbusch@kernel.org>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-CM-TRANSID: qwCowADHDJ1j2+BiGhXyAg--.4012S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKw43Kry7Xw1fur4DWr15urg_yoWfKwbE9F
 1kuayfGw47uanaga4aqrnrArsrta47Wryft39Fvr12q39aqF95Krn3ur45uws5XFW0qFyU
 GrWqqr1YvFyxWjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbw8YjsxI4VWDJwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
 6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
 8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0
 cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I
 8E87Iv6xkF7I0E14v26F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
 0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
 1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI48JMxC2
 0s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI
 0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE
 14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20x
 vaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v2
 6r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jY6wZUUUUU=
X-Originating-IP: [159.226.43.13]
X-CM-SenderInfo: xidqyxpqkd0j0rv6xunwoduhdfq/
Received-SPF: pass client-ip=159.226.251.21;
 envelope-from=fanjinhao21s@ict.ac.cn; helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

at 10:56 AM, Jinhao Fan <fanjinhao21s@ict.ac.cn> wrote:

> at 2:07 AM, Keith Busch <kbusch@kernel.org> wrote:
>=20
>> MSI-x uses MMIO for masking, so there's no need for an NVMe specific =
way to
>> mask these interrupts. You can just use the generic PCIe methods to =
clear the
>> vector's enable bit. But no NVMe driver that I know of is making use =
of these
>> either, though it should be possible to make linux start doing that.
>=20
> I believe we need to handle MSI-x masking in the NVMe controller after =
we
> switch to irqfd. Before that QEMU=E2=80=99s MSI-x emulation logic =
helps us handle
> masked interrupts. But with irqfd, we bypass QEMU=E2=80=99s MSI-x and =
let the kernel
> send the interrupt directly. Therefore qemu-nvme needs to do some
> bookkeeping about which interrupt vectors are masked.
> msix_set_vector_notifiers helps us do that.

But as no NVMe driver makes use of MSI-x interrupt masking, is it OK if =
we
just leave MSI-x masking support broken when irqfd is enabled?=


