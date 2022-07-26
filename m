Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBEC55816C3
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 17:48:48 +0200 (CEST)
Received: from localhost ([::1]:51684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGMnf-0004G9-9j
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 11:48:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1oGMYk-0007kh-W7
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 11:33:23 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:52290 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fanjinhao21s@ict.ac.cn>) id 1oGMYh-0008Co-7l
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 11:33:22 -0400
Received: from smtpclient.apple (unknown [221.220.143.85])
 by APP-01 (Coremail) with SMTP id qwCowAAnbZ0qCeBiZSmoAg--.64536S2;
 Tue, 26 Jul 2022 23:32:58 +0800 (CST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH] hw/nvme: Add iothread support
From: Jinhao Fan <fanjinhao21s@ict.ac.cn>
In-Reply-To: <Yt/+GfYPyeM4gFdq@kbusch-mbp.dhcp.thefacebook.com>
Date: Tue, 26 Jul 2022 23:32:57 +0800
Cc: qemu-devel <qemu-devel@nongnu.org>,
 its@irrelevant.dk
Content-Transfer-Encoding: quoted-printable
Message-Id: <2606E835-E12F-4AE2-8CBC-7267016AAB7B@ict.ac.cn>
References: <20220720090053.309229-1-fanjinhao21s@ict.ac.cn>
 <E29F6EF6-F2BF-41F4-B04E-E6D901D64078@ict.ac.cn>
 <Yt/+GfYPyeM4gFdq@kbusch-mbp.dhcp.thefacebook.com>
To: Keith Busch <kbusch@kernel.org>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-CM-TRANSID: qwCowAAnbZ0qCeBiZSmoAg--.64536S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtry8GFy7Jr17JF15uw4DJwb_yoWDZFb_uF
 nYywsrua13JF4qqwsF9r9FyFZ8X34jqFy8tw4Svw4DX3s8Zr1rGr1DArW2qFykJayqqrW5
 G3yaqF1SgrZFkjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUb28YjsxI4VWxJwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
 6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
 8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0
 cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4
 A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
 w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
 vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY02Avz4vE14v_XrWl42xK82IY
 c2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s
 026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF
 0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0x
 vE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2
 jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j2Q6JUUUUU=
X-Originating-IP: [221.220.143.85]
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

at 10:45 PM, Keith Busch <kbusch@kernel.org> wrote:

> On Tue, Jul 26, 2022 at 04:55:54PM +0800, Jinhao Fan wrote:
>> Hi Klaus and Keith,
>>=20
>> I just added support for interrupt masking. How can I test interrupt
>> masking?
>=20
> Are you asking about MSI masking? I don't think any drivers are using =
the
> feature, so you'd need to modify one to test it. I can give you some =
pointers
> if you are asking about MSI.

Thanks Keith,

Do I understand correctly: qemu-nvme only supports MSI-X and pin-based
interrupts. So MSI masking here is equivalent with MSI-X masking.

If the above is correct, I think I am asking about MSI masking.

BTW, a double check on ctrl.c seems to show that we only support =
disabling
interrupt at CQ creation time, which is recorded in the cq->irq_enabled.
This is different from my prior understanding that interrupts can be
disabled at runtime by a call like Linux irq_save(). Therefore I doubt
whether qemu-nvme supported "interrupt masking" before. How do you
understand qemu-nvme=E2=80=99s interrupt masking support?

Jinhao=


