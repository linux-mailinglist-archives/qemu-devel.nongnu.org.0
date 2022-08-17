Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5A15968B0
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 07:40:20 +0200 (CEST)
Received: from localhost ([::1]:44844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOBmt-0005XH-Ga
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 01:40:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1oOBih-0001R2-33; Wed, 17 Aug 2022 01:35:59 -0400
Received: from smtp84.cstnet.cn ([159.226.251.84]:58396 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1oOBic-0005sh-1C; Wed, 17 Aug 2022 01:35:58 -0400
Received: from smtpclient.apple (unknown [159.226.43.11])
 by APP-05 (Coremail) with SMTP id zQCowACXt3wqfvxi1cL1GQ--.57152S2;
 Wed, 17 Aug 2022 13:35:39 +0800 (CST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH 4/4] hw/nvme: add MSI-x mask handlers for irqfd
From: Jinhao Fan <fanjinhao21s@ict.ac.cn>
In-Reply-To: <Yvt1k5X6Gu0xW3Lg@apples>
Date: Wed, 17 Aug 2022 13:35:36 +0800
Cc: qemu-devel <qemu-devel@nongnu.org>, Keith Busch <kbusch@kernel.org>,
 Stefan Hajnoczi <stefanha@gmail.com>,
 "open list:nvme" <qemu-block@nongnu.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <110B7873-81ED-4D70-8E87-E29F04A5560F@ict.ac.cn>
References: <20220811153739.3079672-1-fanjinhao21s@ict.ac.cn>
 <20220811153739.3079672-5-fanjinhao21s@ict.ac.cn> <Yvt1k5X6Gu0xW3Lg@apples>
To: Klaus Jensen <its@irrelevant.dk>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-CM-TRANSID: zQCowACXt3wqfvxi1cL1GQ--.57152S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Gw47XF47JF15ZrykKF17Wrg_yoWxArg_W3
 WF9FZYya18ua1xJ3WSkr98XFyUG34rWr17Gr45AryDtrnYqrZYqr9xKF9xuayft3y3ZFZa
 kr1DXw1xZF97ujkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUb2kYjsxI4VWDJwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
 6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
 8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0
 cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I
 8E87Iv6xkF7I0E14v26F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
 0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Cr0_Gr
 1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY02Avz4vE14v_GrWl42xK
 82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGw
 C20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48J
 MIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMI
 IF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvE
 x4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8-eOJUUUUU==
X-Originating-IP: [159.226.43.11]
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

at 6:46 PM, Klaus Jensen <its@irrelevant.dk> wrote:

>=20
> Did qtest work out for you for testing? If so, it would be nice to add =
a
> simple test case as well.

I found MSI-x masking harder to test than we imagined. My plan is to =
only
emulate IO queues in the IOthread and leave admin queue emulation in the
main loop since some admin commands require BQL. So I didn=E2=80=99t =
enable irqfd on
admin queues. Therefore we can onlyt test MSI-x masking on IO queues. =
This
makes qtest complicated since we need to handle IO queue creation.

But I=E2=80=99m not sure my understanding is correct. Is it true that =
the admin
queue does not need irqfd as long as it runs in the main loop thread?=


