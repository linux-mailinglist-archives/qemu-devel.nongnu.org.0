Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 075E854F816
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 15:04:53 +0200 (CEST)
Received: from localhost ([::1]:35106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2Bed-0007c9-Ih
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 09:04:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1o2Bcu-0006KR-UU
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 09:03:08 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:38964 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fanjinhao21s@ict.ac.cn>) id 1o2Bcs-0003Z1-CI
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 09:03:04 -0400
Received: from smtpclient.apple (unknown [202.38.79.134])
 by APP-01 (Coremail) with SMTP id qwCowAAnLw95e6xicZySBA--.8910S2;
 Fri, 17 Jun 2022 21:02:50 +0800 (CST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH v3 0/2] hw/nvme: Add shadow doorbell buffer support
From: Jinhao Fan <fanjinhao21s@ict.ac.cn>
In-Reply-To: <Yqx6BK6sh5s0FG3O@apples>
Date: Fri, 17 Jun 2022 21:02:48 +0800
Cc: qemu-devel@nongnu.org,
 kbusch@kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <CDB4B749-6B87-4BB4-B04C-5DCD3F068F49@ict.ac.cn>
References: <20220616123408.3306055-1-fanjinhao21s@ict.ac.cn>
 <YqxrXgLeMdVKFQ4P@apples> <75D77EF8-3A0E-4CFB-A7CB-2342C28CB60C@ict.ac.cn>
 <Yqx6BK6sh5s0FG3O@apples>
To: Klaus Jensen <its@irrelevant.dk>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-CM-TRANSID: qwCowAAnLw95e6xicZySBA--.8910S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
 VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY17k0a2IF6F4UM7kC6x804xWl14x267AK
 xVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGw
 A2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r1j
 6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j6r4UM28EF7xvwVC2z280aVAFwI0_Gc
 CE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxI
 r21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87
 Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc2xSY4AK
 67AK6ry8MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrV
 AFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCI
 c40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267
 AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2z280aVAFwI0_
 Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUxO
 6pDUUUU
X-Originating-IP: [202.38.79.134]
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

> On Jun 17, 2022, at 8:56 PM, Klaus Jensen <its@irrelevant.dk> wrote:
>=20
> On Jun 17 20:47, Jinhao Fan wrote:
>>=20
>>=20
>>> On Jun 17, 2022, at 7:54 PM, Klaus Jensen <its@irrelevant.dk> wrote:
>>>=20
>>> LGTM,
>>>=20
>>> Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
>>>=20
>>=20
>> Great!
>>=20
>> I have two questions:
>>=20
>> How many =E2=80=9CReviewed-by=E2=80=9D=E2=80=99s do I need to get my =
patch applied?
>>=20
>=20
> That depends ;) The maintainers decide that.
>=20
>> Do I need to post a v4 patch to add the =E2=80=9CReviewed-by=E2=80=9D=E2=
=80=99s in my commit=20
>> message?
>>=20
>=20
> Nope, the maintainer will pick that up when applying.

Gotcha! Thanks!=


