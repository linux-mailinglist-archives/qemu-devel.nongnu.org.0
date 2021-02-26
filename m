Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9773266C8
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 19:17:20 +0100 (CET)
Received: from localhost ([::1]:47296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFhfz-000265-5H
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 13:17:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pjp@fedoraproject.org>)
 id 1lFhdr-0000NH-U9
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 13:15:08 -0500
Received: from sonic309-20.consmr.mail.sg3.yahoo.com ([106.10.244.83]:44461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pjp@fedoraproject.org>)
 id 1lFhdp-0000bN-9S
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 13:15:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1614363298; bh=/SinO2wIhGtYgYMwZrbtI/JaS5yen95eKw80IQBvOow=;
 h=Date:From:Reply-To:To:Cc:In-Reply-To:References:Subject:From:Subject:Reply-To;
 b=Vnx7KNS2OlIHb69njQcR+MhOSeEpzLs8SNJKeCTEIMKHbZCD7ogY3b01nW1Rri03MhneDr/oOidTohozBlWUa+3xOCyshOlRAND1LPrl4SW+R2kppbrHPlF6iwVC+FhhprRkCZAjSq7pgTHHjvimDBHzyDfNgVSPY39r+m7wn1eXwshMIW2YehxrCy8pr1/q8RtVPgEj/HOSRXE5zcoW7yBIfJkW52FO7d83s7lIryKDadcEw0thf1SrtVHL6aW73nXZom1N4p4WE6bJEMjwUF53mPVObyDUcYC1ahVx8rJ/PDWHjkXeNRcWCmw7OjM+aL9moh9m94tGLymu0CovCw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1614363298; bh=poUtWFbXy2r4aZvkDluTw5w/LcJD5t8zuvU7uM60daR=;
 h=X-Sonic-MF:Date:From:To:Subject:From:Subject;
 b=kwTZTCdg7wNTUqMgpkWmk56fWi1nEG9Vw9d1wZE8qqW+KpiC6wSGMh0OVbJDVHIFEuEkAW+VK/zBbSQucdLkDket7KGnCWztKVORdXNP5G6rDouNa6K1mKKrq+qGrBxf/8sxkHrcX1SIk2Mb8mpgcM11Wt46TmSeBVHfZ4vx7lsGWJt5VZk9PFKRvi4U2++6afvNvcuTWeY4PoRHnUIE0fILPIQH2Ueb22WReDko1O6mK50zNgVfF4L4ZGajBgyqbhQge5defgONyufruU556Qtrrr0CcREp53yB4t+gi9PK0pMa+cgiA/nH8WmplTXdz7lkL+fXzcUWAnds7vhqHA==
X-YMail-OSG: 4lb72D0VM1kdjvfDzcR55Pbbry4pHQFIo.0W3srvHgvQuFdBdeR5Da_w0svzyC9
 OJP_rsoDekwZaO19NkkXvvQeOXzttVB7xUMeD2WJ4MYgmGAXXxAbyL4qTs1qoBk2g6WTgvMqeqb0
 SSy8YncNeb9knQ4yGy1P76sQZPoM6Mf2a0il7TkmW3W00sYbo_FpJ2nq6V_jCgTRtZI3xJd5EwjN
 IIZgASBfiYuxmssDyixakE3c69AF6yN5DIbd0qFmXMyS1skmBQslxg3gcIWpbJpTur3jeQ7ddTAp
 AheDghqY5wwpJkTFy62P9qJR4wQ8qOvqWVvgEler7_vgzm_bI.B_mBo8TjIkfvkNeQ7_6Qpgv3pp
 .fHQ3boRaH2K90GyCM.2fndIXtpsaUIH_vqDD_MCHVEhq8OQpYA7IQj0W_IWAX0I9As.wV1F3xGm
 CfSbAlbqYx2zKc3oWNQ3WXyMtgi.fFUZUtlNnLP7So5zbz6ODfjtQSf2_pih68WEAOksQC1MD.Mc
 zKkPLntV3x9a5HeAQiylaZdHprXi0guv0BS6MQECqhk67KvZ_X05wlVZAqz2pfd59wMQqRJuVlbj
 yFSlObUnhmEFv931.j0CbVzXLurxygiz2PAMe8l8mPDz4SylOboFoFEMNSLSMWPUn9vWiOUBszcQ
 b9_CH0ZY4VNwurawX3oVTLSjIOJ4SR15OeK1IwI7_3dLiA9BE4gYXnOzfgGgP1SkHx1NiwqJykm_
 y5xkCencbwSuWgpVsrRdoa9vMfdbMecFjEY4rj8rrOkUzKBdJ_hOzNt4d_LdstAI3yooKCdRBbB0
 .OHYJR71T8DznTPfRBf3PZsRJavquVWgjZlk2agOkG4Ou3en.B.syd1Ib7XgWaRUIweVkm3PjC9k
 EBJOSOVMGr.wZxy5h30GTjkjJEFrS0QZH8X_DoFpJmbFgS899gLIxMDX9tQh4PmltbmUMmZoYcci
 LYLVQQrzmP68pkczEs49IDV4OdpXB4X.d7pEdtF0NgzDpodn.E7iPMefAb7ViJKRyWkpOgJaOBiw
 9sMr1cDYrGhbkOta7ZZT0Q2MtbzJ3bxwR72pWTfsgzD7sylzeUCRgy3Nxerw4J99nmqPAagPSMV9
 2BWPdu_083JKP68SnEJWnU6v32OPh.aviCJKetI9uPkFhC1ZMVHVCUOly8WiWo1V5pz1Fe5l8yh3
 YD42xO5XfuNOD146HkYxv7wqMwX0RpXhLvbBoUrYCwTvz9KNj8nklFuF4zvTACauOBS4q05zY_nY
 lNifmg7.WsA97mCI6aZOl4Y4XoKs.DNmhrazgVWwTkqolzJ1ErEvMHjwEMS0Es1YjSLxI9UKISTF
 3Az2yUeNxKgLkoAYjL6ykBE61MFdwTAi8kThUiOSRIbYRylrh.JUe43.40PSPrwfvTbrhwf9LF_g
 3UHDCt_1grtjQnf.9FAC9QxeA.RCXuj4ZOrkUq1lcP5AVrkARav4oIXI0eHoxt5TVDrMHBkzsQ34
 c_.KKGZU2y61Q0hxwtbF19z8Qou0wBCRxSFvwjSeirG77D1CfRxyYBw_HZs1QEPzKBZISeXszCc8
 yHkVE5vAprlARnoNhUYYnnvUO3.jLpiqbPBzs0CtpVJXdiAaro19myZAE0BxO3UBTxHOQNtSO9.O
 4fZYw9Mrx0bRnH7TEiBUeGPtqEGobixgx4gl.v_UrQmWREOUM9zuWx9cZWttFtE4ZsmTdDZcs5Pj
 tLU7hXIoPkKXV0dLFcatxnx3HdTr.uBYGR.qeXqy9duqd.tKTzRAna2S2TNRI0jY5oSuQu4Vho4c
 tyl.BaiZ8Cgm3TtUXFLHxRb9qVu18URYCtJ1nkVJwXaJyHY.pndK2vpP7A7Nx9hL4dGzhcoqg.a3
 WLN_0Y6TvwhC6iTk2b2cvKis04294tj72e4deZjWG3TC_Dq8OoModWm3FyL7tlFEEMiCt6i4TMyd
 cXnV4sKkIR3ztedhIgCRQTPgBxp.ol3XT8VXbSI1D95ex8AwGvlf84h_LYUjljQlRRBk_w5R46_Q
 czAG6CJTeQwDX.QU2smq6rNa9L6ad7RLCHlqRBRvAk1r5GxLHwjyocSyhIVfPvpPgW61YLMhQnEt
 p.QKED2pHb1WZ6BWNBMDAo_gr_NgkSQI5vC_hCnO6GmcngLvSbbrjzgTcKMI7iADKL1gN6mCneSq
 nzvqSYCt88JsI1w4fK08duiPOoFXbRZtVuO1oY0Hljwwgb6NIqV_Dkr_aclY3Hb36w300ug6BU3b
 kISxjCBmXWqets.F.FV1LXSY2v5LRUhE9H_jsMlqabz.XoCGgqX_XD2s4eGUEPuLrfkuUxnVIoMf
 p7AZXO6KZMF06OC5h7AWGqX6V6FdStXMyLawcZ4zymuheuqLAYm600iyp2rXk6h34ODV4Qw6FD6R
 qE3rS3YcGqqOUSgk_be8AhtEbNcX6nf.ZXcqjf.n43eHbIZoNfrJK23FtanAK1oXKncSjjKP7eP9
 _JD2CTrAuH2lGOTKmF5f8ieD8s6I13vMiw5mnCTHxA5BP5.ZJaUG8bS48vpm4hosv6dMV3GBrg3X
 7sXtQdI0VmE7rJjTSAt575.kBiZPflM.fps.sE.5kXaiQsxo5ggliWPwALLhOH1CNpxJIbzMWlr6
 qiVpjEN7nP7z2r2VMGHGLe6j0eBQA2QaA80FzRt8c7khuhsih18RZPhc35H_WYuUXOnnwWXTiWYQ
 FGf7ucIQCol5GYCwRGNKpZ2BjSLJ3vO3MhH_husTYRKQ0pvCZxdaj8tBhEtXTRlsgfrENQ98n54n
 T39RXMtQD0cLe
X-Sonic-MF: <pjp@fedoraproject.org>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic309.consmr.mail.sg3.yahoo.com with HTTP; Fri, 26 Feb 2021 18:14:58 +0000
Date: Fri, 26 Feb 2021 18:14:31 +0000 (UTC)
From: P J P <pjp@fedoraproject.org>
To: Alexander Bulekov <alxndr@bu.edu>
Message-ID: <1530141988.220096.1614363271523@mail.yahoo.com>
In-Reply-To: <20210225162908.awbtm2xud64xdsku@mozz.bu.edu>
References: <20210224055401.492407-1-jasowang@redhat.com>
 <20210224055401.492407-2-jasowang@redhat.com>
 <9e432ff0-793e-64a7-97f3-ff3a374ee98f@redhat.com>
 <b7d39898-d688-70bb-4546-612150a1635b@redhat.com>
 <5386f97e-0fb4-b7bc-6520-698a9c856bf9@redhat.com>
 <90q67362-8n44-60q3-1q8o-nso367onnr3@erqung.pbz>
 <20210225162805.dwgmz4lwfafeqjmg@mozz.bu.edu>
 <20210225162908.awbtm2xud64xdsku@mozz.bu.edu>
Subject: Re: [QEMU-SECURITY] [PATCH 1/6] net: introduce qemu_receive_packet()
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: WebService/1.1.17828 YMailNorrin Mozilla/5.0 (X11;
 Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko)
 Chrome/87.0.4280.141 Safari/537.36
Received-SPF: neutral client-ip=106.10.244.83;
 envelope-from=pjp@fedoraproject.org;
 helo=sonic309-20.consmr.mail.sg3.yahoo.com
X-Spam_score_int: 10
X-Spam_score: 1.0
X-Spam_bar: +
X-Spam_report: (1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 FREEMAIL_FORGED_REPLYTO=2.095, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 QEMU Security <qemu-security@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Alex,

On Thursday, 25 February, 2021, 10:00:33 pm IST, Alexander Bulekov <alxndr@=
bu.edu> wrote:=C2=A0
On 210225 1128, Alexander Bulekov wrote:
> On 210225 1931, P J P wrote:
> > +-- On Wed, 24 Feb 2021, Philippe Mathieu-Daud=C3=A9 wrote --+
> > | On 2/24/21 2:17 PM, Jason Wang wrote:
> > | > On 2021/2/24 6:11 =E4=B8=8B=E5=8D=88, Philippe Mathieu-Daud=C3=A9 w=
rote:
> > | >> IIUC the guest could trigger an infinite loop and brick the emulat=
ed=C2=A0
> > | >> device model. Likely exhausting the stack, so either SEGV by corru=
ption=C2=A0
> > | >> or some ENOMEM?
> > | >=C2=A0
> > | > Yes.
> > | >>
> > | >> Since this is guest triggerable, shouldn't we contact qemu-securit=
y@ list=C2=A0
> > | >> and ask for a CVE for this issue, so distributions can track the p=
atches=C2=A0
> > | >> to backport in their stable releases? (it seems to be within the K=
VM=C2=A0
> > | >> devices boundary).
> > | >=C2=A0
> > | >=C2=A0
> > | > That's the plan. I discussed this with Prasad before and he promise=
 to
> > | > ask CVE for this.
> >=C2=A0
> > 'CVE-2021-3416' is assigned to this issue by Red Hat Inc.
>
> What is the difference with CVE-2021-20255 and CVE-2021-20257 ? Aren't
> those just manifestations of this bug for the e1000 and the eepro100
> devices

* You mean manifestations of the dam re-entrancy issue?=C2=A0

* They have separate CVEs because they are fixed individually.


Thank you.
---
=C2=A0 -P J P
http://feedmug.com

