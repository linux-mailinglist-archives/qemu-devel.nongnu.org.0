Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 713EE55BCC3
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 02:56:41 +0200 (CEST)
Received: from localhost ([::1]:57656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5z8l-0002Rk-Tb
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 20:31:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1o5z6T-0000N8-CJ
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 20:29:17 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:41460 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fanjinhao21s@ict.ac.cn>) id 1o5z6P-0005aW-QQ
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 20:29:17 -0400
Received: from smtpclient.apple (unknown [111.199.64.159])
 by APP-01 (Coremail) with SMTP id qwCowAAnLARPS7pi5J8xCQ--.8847S2;
 Tue, 28 Jun 2022 08:29:04 +0800 (CST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH v3 1/2] hw/nvme: Implement shadow doorbell buffer support
From: Jinhao Fan <fanjinhao21s@ict.ac.cn>
In-Reply-To: <YroF+BS96Bd8b1Xq@apples>
Date: Tue, 28 Jun 2022 08:29:02 +0800
Cc: Keith Busch <kbusch@kernel.org>,
 qemu-devel@nongnu.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <B48FED4F-6C38-4966-9DD2-DE4E9598BA4C@ict.ac.cn>
References: <20220616123408.3306055-1-fanjinhao21s@ict.ac.cn>
 <20220616123408.3306055-2-fanjinhao21s@ict.ac.cn>
 <YroCVQvTq+z/mgc9@kbusch-mbp.dhcp.thefacebook.com> <YroF+BS96Bd8b1Xq@apples>
To: Klaus Jensen <its@irrelevant.dk>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-CM-TRANSID: qwCowAAnLARPS7pi5J8xCQ--.8847S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kw1UWw4kGw4ktr13Kw48WFg_yoW8GFW8pw
 4ktasakF4vyF1Utry8Xa1Sqw1UCr4IqryUWr4rWay2kr93Xr9IyaykW3y5CF90vrs7tFW0
 yr1qyFsxXFW3t3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUyab7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4
 A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
 64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
 Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l4I8I
 3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxV
 WUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAF
 wI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcI
 k0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_
 Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8v_M3UUUUU==
X-Originating-IP: [111.199.64.159]
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



> On Jun 28, 2022, at 3:33 AM, Klaus Jensen <its@irrelevant.dk> wrote:
>=20
> On Jun 27 13:17, Keith Busch wrote:
>> On Thu, Jun 16, 2022 at 08:34:07PM +0800, Jinhao Fan wrote:
>>>     }
>>>     sq->timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, nvme_process_sq, =
sq);
>>>=20
>>> +    if (n->dbbuf_enabled) {
>>> +        sq->db_addr =3D n->dbbuf_dbs + (sqid << 3);
>>> +        sq->ei_addr =3D n->dbbuf_eis + (sqid << 3);
>>> +    }
>>> +
>>>     assert(n->cq[cqid]);
>>>     cq =3D n->cq[cqid];
>>>     QTAILQ_INSERT_TAIL(&(cq->sq_list), sq, entry);
>>> @@ -4615,6 +4631,10 @@ static void nvme_init_cq(NvmeCQueue *cq, =
NvmeCtrl *n, uint64_t dma_addr,
>>>     cq->head =3D cq->tail =3D 0;
>>>     QTAILQ_INIT(&cq->req_list);
>>>     QTAILQ_INIT(&cq->sq_list);
>>> +    if (n->dbbuf_enabled) {
>>> +        cq->db_addr =3D n->dbbuf_dbs + (cqid << 3) + (1 << 2);
>>> +        cq->ei_addr =3D n->dbbuf_eis + (cqid << 3) + (1 << 2);
>>> +    }
>>>     n->cq[cqid] =3D cq;
>>>     cq->timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, nvme_post_cqes, =
cq);
>>> }
>>=20
>> I just notice these address calculations changed from previous =
versions. What
>> happened to taking the doorbell stride into account? Spec says the =
shadows and
>> events follow the same stride spacing as the registers.
>=20
> The stride is fixed at zero.

Yes. I noticed that nvme_process_db() uses a similar hard-coded approach =
to get
qid from doorbell register offset. So I hard coded here as well. I can =
submit a tiny
patch later to wrap this calculation.



