Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CFA84312E7
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 11:12:21 +0200 (CEST)
Received: from localhost ([::1]:60668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcOgu-00051A-Dh
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 05:12:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pjp@fedoraproject.org>)
 id 1mcOeN-00040C-1j
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 05:09:43 -0400
Received: from sonic303-20.consmr.mail.sg3.yahoo.com ([106.10.242.37]:40917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pjp@fedoraproject.org>)
 id 1mcOeK-0000my-8N
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 05:09:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1634548173; bh=TiBXrSCKei4yFqQv3LnLtSu1VTbSN0b75d0Qfuj43/8=;
 h=Date:From:Reply-To:To:Cc:In-Reply-To:References:Subject:From:Subject:Reply-To;
 b=aDcDGoYC/rmQ6ehOYDEgzWiuXzn48sxpSne27IEAY1SQElvvYwNrMOLL/PMqHK45tyk6U6dT0cFiuEhDg1A1LGTYxR++h9AeTmy8BqhEXZ39kx3BOT6ZT34lmMDlSF9BFnl6a5yJi55R41uK3iFMel5HJ6NdHip2V0HSRHoEG/F6hTP33JD1aJgo1TWd3EyqhxBu398fdbKry7EdYNk7JdFPxpmmSvtpZ26UAv3tGgh42OJ50a6/o+9LdxIFlFf5S4D3WDtrerA84gtcrdZeyhmOGFuP/voAYF/srDk7FWFWiE1FfD7cMtNN01MupEpApuzTFnPCrQHFxJJKwFrpjg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1634548173; bh=rcxwP2qJ++Xtrq7owEkNpLQTTSo9jptIwB+A8o3hcLp=;
 h=X-Sonic-MF:Date:From:To:Subject:From:Subject;
 b=oPBdvV2zZKEFcZCa7CMSiaAdzWvD27SaOzpTFPI+auVkSGfSSZ8tF3VWnHsB3VJbBsmAih6sh5h94gQTUDaR3rBjnA4Xg4IgWEGAbsdJHpm6PL5SJu7LJOHXtm6LH9pQxjm1HGrw0HWWISu1c42rIn0MkweCp8E36pwzn/itTR+oIqiuTRSlcVaMhMziC4xztnxQVElVWdtn/0v50AvhgnrL5AaJ+AFdhzY9jONfVe3AM4V+GpuEFJNYHsTXJM0t9T7D6wqO7U3DoPvJZiMVcQbf5vQSM+gitAtcD4J2Kj3YJriW8Q1X02/8l6D8Qw+OFep/XG8eIdDeeoUjdKMaXw==
X-YMail-OSG: Kx.opOEVM1ls8QvQ.gtbLDTpX.qruQslVjHBV4tTZrfFg9b705cmnWQvRkp7Z0N
 ymm54AM4unrWxrG6NBHLbMAb1UE6g1dZQqqHn5PmWYE2o3s81oJEHp_ZrPTxB3d14g9OxxgCoC.h
 QBqAF3sOYT9YNsGxEWBl9j_6MOHb0Akk4Nfo3UhRkZ3NWt.XfI1pM2RQuhvnqRtfAz3LmqVb8cfO
 PsDQPIvtYRpncpgSoTWCp0__1fjDpQQt2oRO0ik0x5IHKPdNgjuoJXqvkJzkfZFSsmK4MmAI55qe
 4Ndr6fmN84_ZeDLgu0ClcMCQQuNUpM8_KoqpombGh5MAaro6dRCRoKA_I4of1hQii5Xbl.4uiyy_
 IZ8DZKwW.RvyrJeqa.OrS4Esq6Z_B6n85e.MuxlV6.9RAzSmMb7_4.Qi21QqRpPgNL0Xc9Oi6mlV
 rD.hyEXxFGgcOkoJiqtvxIHyP5mMo3_kjggGIF6KRCtWGisn.uMOPe_XksPN9zfxRwUh7MpWDJdZ
 lw89vclf5YXlzBtWQmH0kcJ.OFc1B7IhsRNpOv5XVGmemyuHPn.x1.Jb_0YQOd_OulhPUqvgwG4n
 BzAjuEo6xk4NvNHzOX1JQkipm.ucPcFZHAUT5vwEVUjGbLrRH6ZHFd9Z2Y271MYBRUskBBYUU6yR
 lHPfEXw53TWdqnDeF4EDseLD7JSEGol0qDVtPzjQuV6P1uphioSzkCkd73x4.LP2KVNU.vQDIFhs
 zIrJmR_6Im08CwTnUliwun1pN3YBfMLqLm9ggcOym9Qzt1s0zKDra_QIFKMLbiRKZXd2Rgd6Ajdo
 4joweE6LQYJyAgQSD0ZxCVe82IFneWtOmDxECyPTsNORmnWtRYOL58erdEU.IV8nHu9bOg5kS.Bw
 CmETcgwZGLHDwM5RGD3S8Ri1tNmCsyYH7vPiLYBAQs5MibXwdrMgC5fhDsoI19E9sRHxAV.Sl_JN
 YK7M05izoVHmj0W1gUpRUN3mxBxoSQhflAqEdKzKweq7VkoAN67IXJEx6rMnhhtvWRH6HunaYAS.
 W9wFE63f8OTtPHyhmSoGArEt6pUvC_tMGZJXZ9DF2RQ_GYygJx9ppyB3aLHlFMZulknxOeWlRa8N
 NPhFzWBchNM1nYsEfFTuwadwjwlpIf27Pj2MzWLQGUrsBZR6snQGSwYuU9BVVr8Qd0WYMF9Fs5O3
 o6eFYaTiHh9U.dkGtyTtX6xxRiu_ZFr9y0kcv3tbardq59gYSI8Zd8oLm7SNYetGm.onpG.mIZBQ
 krCEFLtf6UPXynOj4ikcQjitQ6oLWfvn5oPoXsvFirc5U3OnuNbwmmT9SAn65PkfuuuN3BxpPGhf
 6LjWIYddBsPOLTP8l5lB0T7JpS7TyZuvNzpUU9QQen3GJlQ9aSL9YivQcqCZ3z0Mo1HfPiwO3r0y
 ugj8i7P44uoV9eS2_i6hC3CSRIQshEQJJIn4aB1GHSzN9Tbxla2KVoQvZ1nQDf1v1uAkQwju46_g
 EUNnTdUpKLwBi00DtIVMW2haYtUiEQyJ.rksi6gsSho6eru7_0gQZ9df5M1jpsTrmkOaFr3ETWpL
 05mQKJYz8iwXQq7b4EjUIY1iUXAitzIllrNaN7u1x8freN8xeC0RH42daH5l5p.SbAkmr4NAxffl
 yjbXu0H5jbWY3eux5ricieeVCnFPwfhnHoivwNZvfk0.6zz3uOp4AmOgJemTuK02JTQEU0Wy5jOL
 Z14akAQJjcpt7ghpMmGywUNI.9rL9v6pG0kkxQ7sWew0Ws11DIlED9WcCRDiBWqm6eds0kpJgvNo
 RGZVwzf.wf0jl3oVfmc_Gn6GbAOk5oQ_A2FrG1.WJ6TDKs7XGhcMnEuPLlere9j.bPiQ86rNFlQU
 EK_LmNERrZEJbjOU2NUdVu6i7pfjnHqboBRyOVhAOWtSmj2b0VI47q50Hhc88P2P7T0LdGMRng4R
 yW.eFTOxBnKwXw6VxAMmoyL4Linx16cyg_gXmZAGdN8y2lpUVoIU0KzrXawYT.w4if6KpJJIny63
 y3.0qKqa1bNO7J1wWpelPreYmyqbQUzmU_1zP_vP73UtswI9_FIQEm0NTqzgu1N837Xy2WNw9R95
 rqQ4AW0g9pnfT11bQDqjSM_fiqPDgQvjqhuSOEaHsyOZwDoj.TQWLyul1epMvSK_OYjX1YtScXVp
 x8kHlmDAYiIx9H_vFBlQnWCR6Q5J2.ELQj.aWVVsRVeTvp.m5Lcpsj5eGL5oNF0Ko0ZdU6RrnAs.
 81b.g9AHC1OgdEG77kX.HhkDPwtRBQ3XFESkrvnU5wkXYgYSis4U7Wg.EjUU7IYhwlnBmEAylfDr
 RR.QjSSOyEEk-
X-Sonic-MF: <pjp@fedoraproject.org>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic303.consmr.mail.sg3.yahoo.com with HTTP; Mon, 18 Oct 2021 09:09:33 +0000
Date: Mon, 18 Oct 2021 09:09:32 +0000 (UTC)
From: P J P <pjp@fedoraproject.org>
To: Dmitry Fleytman <dmitry.fleytman@gmail.com>, 
 Jason Wang <jasowang@redhat.com>, Thomas Huth <thuth@redhat.com>
Message-ID: <1881029915.2747345.1634548172221@mail.yahoo.com>
In-Reply-To: <c15f0f4f-dee0-4414-6496-fe4844d34bdf@redhat.com>
References: <20210130131652.954143-1-ppandit@redhat.com>
 <c15f0f4f-dee0-4414-6496-fe4844d34bdf@redhat.com>
Subject: Re: [PATCH] net: vmxnet3: validate configuration values during
 activate (CVE-2021-20203)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: WebService/1.1.19116 YMailNorrin
Received-SPF: neutral client-ip=106.10.242.37;
 envelope-from=pjp@fedoraproject.org;
 helo=sonic303-20.consmr.mail.sg3.yahoo.com
X-Spam_score_int: 10
X-Spam_score: 1.0
X-Spam_bar: +
X-Spam_report: (1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 FREEMAIL_FORGED_REPLYTO=2.095, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779 autolearn=no autolearn_force=no
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
Reply-To: P J P <pj.pandit@yahoo.co.in>
Cc: Gaoning Pan <pgn@zju.edu.cn>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Monday, 18 October, 2021, 12:20:55 pm IST, Thomas Huth <thuth@redhat.com=
> wrote:
On 30/01/2021 14.16, P J P wrote:
>> diff --git a/hw/net/vmxnet3.c b/hw/net/vmxnet3.c
>> index eff299f629..4a910ca971 100644
>> --- a/hw/net/vmxnet3.c
>> +++ b/hw/net/vmxnet3.c
>> @@ -1420,6 +1420,7 @@ static void vmxnet3_activate_device(VMXNET3State *=
s)
>>=C2=A0 =C2=A0 =C2=A0 vmxnet3_setup_rx_filtering(s);
>>=C2=A0 =C2=A0 =C2=A0 /* Cache fields from shared memory */
>>=C2=A0 =C2=A0 =C2=A0 s->mtu =3D VMXNET3_READ_DRV_SHARED32(d, s->drv_shmem=
, devRead.misc.mtu);
>> +=C2=A0 =C2=A0 assert(VMXNET3_MIN_MTU <=3D s->mtu && s->mtu < VMXNET3_MA=
X_MTU);
>>=C2=A0 =C2=A0 =C2=A0 VMW_CFPRN("MTU is %u", s->mtu);
>>=C2=A0=20
>>=C2=A0 =C2=A0 =C2=A0 s->max_rx_frags =3D
>> @@ -1473,6 +1474,9 @@ static void vmxnet3_activate_device(VMXNET3State *=
s)
>>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Read rings memory locations for TX =
queues */
>>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pa =3D VMXNET3_READ_TX_QUEUE_DESCR64(d=
, qdescr_pa, conf.txRingBasePA);
>>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size =3D VMXNET3_READ_TX_QUEUE_DESCR32=
(d, qdescr_pa, conf.txRingSize);
>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (size > VMXNET3_TX_RING_MAX_SIZE) {
>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size =3D VMXNET3_TX_RING_MAX_=
SIZE;
>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>>=C2=A0=20
>>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vmxnet3_ring_init(d, &s->txq_descr[i].=
tx_ring, pa, size,
>>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 sizeof(struct Vmxnet3_TxDesc), false);
>> @@ -1483,6 +1487,9 @@ static void vmxnet3_activate_device(VMXNET3State *=
s)
>>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* TXC ring */
>>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pa =3D VMXNET3_READ_TX_QUEUE_DESCR64(d=
, qdescr_pa, conf.compRingBasePA);
>>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size =3D VMXNET3_READ_TX_QUEUE_DESCR32=
(d, qdescr_pa, conf.compRingSize);
>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (size > VMXNET3_TC_RING_MAX_SIZE) {
>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size =3D VMXNET3_TC_RING_MAX_=
SIZE;
>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vmxnet3_ring_init(d, &s->txq_descr[i].=
comp_ring, pa, size,
>>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 sizeof(struct Vmxnet3_TxCompDesc), true);
>>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMXNET3_RING_DUMP(VMW_CFPRN, "TXC", i,=
 &s->txq_descr[i].comp_ring);
>> @@ -1524,6 +1531,9 @@ static void vmxnet3_activate_device(VMXNET3State *=
s)
>>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* RX rings */
>>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pa =3D VMXNET3_READ_RX_Q=
UEUE_DESCR64(d, qd_pa, conf.rxRingBasePA[j]);
>>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size =3D VMXNET3_READ_RX=
_QUEUE_DESCR32(d, qd_pa, conf.rxRingSize[j]);
>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (size > VMXNET3_RX_RING_MA=
X_SIZE) {
>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size =3D VMXNET=
3_RX_RING_MAX_SIZE;
>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vmxnet3_ring_init(d, &s-=
>rxq_descr[i].rx_ring[j], pa, size,
>>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof(struct Vmxnet3_RxDesc), false=
);
>>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMW_CFPRN("RX queue %d:%=
d: Base: %" PRIx64 ", Size: %d",
>> @@ -1533,6 +1543,9 @@ static void vmxnet3_activate_device(VMXNET3State *=
s)
>>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* RXC ring */
>>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pa =3D VMXNET3_READ_RX_QUEUE_DESCR64(d=
, qd_pa, conf.compRingBasePA);
>>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size =3D VMXNET3_READ_RX_QUEUE_DESCR32=
(d, qd_pa, conf.compRingSize);
>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (size > VMXNET3_RC_RING_MAX_SIZE) {
>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size =3D VMXNET3_RC_RING_MAX_=
SIZE;
>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vmxnet3_ring_init(d, &s->rxq_descr[i].=
comp_ring, pa, size,
>>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 sizeof(struct Vmxnet3_RxCompDesc), true);
>>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMW_CFPRN("RXC queue %d: Base: %" PRIx=
64 ", Size: %d", i, pa, size);
>>=20
>>
>Ping!
>
>According to=20
>https://gitlab.com/qemu-project/qemu/-/issues/308#note_705736713 this is=
=20
>still an issue...
>
>Patch looks fine to me ... maybe just add some=20
>qemu_log_mask(LOG_GUEST_ERROR, ...) statements before correcting the value=
s?


* Oops! Not sure how I missed it, thought it was pulled upstream.
=C2=A0 Will send a revised patch.


Thank you.
---
=C2=A0 - P J P

