Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E58E46F1876
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 14:52:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psNZn-00068o-Lt; Fri, 28 Apr 2023 08:51:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <t.dzieciol@partner.samsung.com>)
 id 1psNZe-00066F-JB
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 08:51:45 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <t.dzieciol@partner.samsung.com>)
 id 1psNZZ-0003jC-77
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 08:51:41 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20230428125125euoutp02b8dcbde000e5f091d07831f90bd58a87~aGkLSSo7m1748017480euoutp02R
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 12:51:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20230428125125euoutp02b8dcbde000e5f091d07831f90bd58a87~aGkLSSo7m1748017480euoutp02R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1682686285;
 bh=6gut+kM4oXYWyovvJjuX4HsDwxvFhTdoeJJh86bwhPw=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=KgHa+ptdch/dmHuCd7y+j1EPhaEe+ty9RiVqxNoM6tphN5GPTLCyLkgb0CatUxfC9
 Any3202UdW3G1JTiDdz3TCOcWUZPhv8Uh9x5pnDG9w0nsvh65FB01sO19ySzEVjcs6
 bGPLJLlMCqizWKpQaOR6BJjOC8Omt90YTdwL/HKU=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20230428125124eucas1p1eda24544199df6f6220b169877254c7d~aGkK_7jlx2068420684eucas1p1I;
 Fri, 28 Apr 2023 12:51:24 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 21.0D.42423.C41CB446; Fri, 28
 Apr 2023 13:51:24 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20230428125124eucas1p130cc7f0d1df291314c509395ec95bb8e~aGkKilOln2067720677eucas1p1L;
 Fri, 28 Apr 2023 12:51:24 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20230428125124eusmtrp2d6d43808b4113fa83528d70ca626d21b~aGkKh8DSc1619116191eusmtrp2R;
 Fri, 28 Apr 2023 12:51:24 +0000 (GMT)
X-AuditID: cbfec7f2-a51ff7000002a5b7-0b-644bc14c8601
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 96.19.10549.C41CB446; Fri, 28
 Apr 2023 13:51:24 +0100 (BST)
Received: from AMDN5139 (unknown [106.210.135.112]) by eusmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20230428125122eusmtip20005b89684a29623dec28a40df2e3892~aGkI7H_qz0963109631eusmtip2a;
 Fri, 28 Apr 2023 12:51:22 +0000 (GMT)
From: "Tomasz Dzieciol/VIM Integration \(NC\) /SRPOL/Engineer/Samsung
 Electronics" <t.dzieciol@partner.samsung.com>
To: "'Akihiko Odaki'" <akihiko.odaki@daynix.com>, <qemu-devel@nongnu.org>
Cc: <sriram.yagnaraman@est.tech>, <jasowang@redhat.com>,
 <k.kwiecien@samsung.com>, <m.sochacki@samsung.com>
In-Reply-To: <d1eb27dd-1b2e-dca1-2d1e-aa16397c2f15@daynix.com>
Subject: RE: [PATCH v3 1/2] igb: RX descriptors handling cleanup
Date: Fri, 28 Apr 2023 14:51:22 +0200
Message-ID: <000001d979d0$23571b90$6a0552b0$@partner.samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQEd3+2yH27pherbGsInQNBOK9ndlAKi6rc9AwLIhmwB306RhrB7sAPw
Content-Language: pl
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprNKsWRmVeSWpSXmKPExsWy7djP87o+B71TDBZuVrX4fGotu8WyS5+Z
 LBrnz2G12Hr1B7vF8d4dLBa9m14wObB5nHh7kNXjwqNzzB5Prm1m8ni/7yqbR9+WVYwBrFFc
 NimpOZllqUX6dglcGfePt7MVPNrOXPFlzT7GBsbnq5i7GDk5JARMJG7vesPSxcjFISSwglFi
 9YXtUM4XRom7U2+wQjifGSWOLLvPBNPyuHcOVNVyRomfZ/4xQzgvGCVO3pwGNphNoFRiYfdB
 sA4RAU+Jhze2s4PYzAK5EveevmQBsTkF7CQWvOwGs4UFHCS6Z/4Hq2cRUJWYN/kZWD2vgKPE
 6+93GSFsQYmTM5+wQMzRlli28DXUEwoSP58uY4XY5Sax7vE0JogaEYkbj1oYQY6TELjDIXF+
 xQFWiAYXiSkP3rBA2MISr45vYYewZST+75wP9Wa5xM+z29ghmlsYJfZMnQxVZC1xaetPoEEc
 QBs0Jdbv0gcxJYAO3XiYC8Lkk7jxVhDiBD6JSdumM0OEeSU62oQgZuhIfNs0k20Co/IsJI/N
 QvLYLCQPzEJYtYCRZRWjeGppcW56arFhXmq5XnFibnFpXrpecn7uJkZg+jn97/inHYxzX33U
 O8TIxMF4iFGCg1lJhJe30j1FiDclsbIqtSg/vqg0J7X4EKM0B4uSOK+27clkIYH0xJLU7NTU
 gtQimCwTB6dUA5Pi59ebL4RU/9946zTv5fOrXcV4SmR72ezfrORLXG90TXfh9D3CJZ5XhPNb
 Io8GMKW0vWQKWmSUcsVA5atZ8zoBcz1lVddcUZ0KS8+Eb0e//y24mXysKHHN8kcCl17LaN2e
 8YCb9frTHw4cr19l53xbeW/5wzmtu6P7GCxON6ws8jXcyOp4+4jIsTNLm1Pa7h30tUtx75AP
 tHDnCtlxmpNLQWZO44+XCWr8+k/SjW9/85l/aeXP0sw7+wTaLqqeizBsEz75q7bHxFwoY867
 TJf/tv1rI5zEuHa4XazhnunPufXL8vdl6rqOvObfhN3k9gdbiDu56bw4KvNpY8wTXY0NHVP8
 v06bufobo7avsRJLcUaioRZzUXEiACAwCrCuAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNIsWRmVeSWpSXmKPExsVy+t/xe7o+B71TDJ7NZrf4fGotu8WyS5+Z
 LBrnz2G12Hr1B7vF8d4dLBa9m14wObB5nHh7kNXjwqNzzB5Prm1m8ni/7yqbR9+WVYwBrFF6
 NkX5pSWpChn5xSW2StGGFkZ6hpYWekYmlnqGxuaxVkamSvp2NimpOZllqUX6dgl6GUe+zGMp
 WN7AVDH1z0fGBsaeNYxdjJwcEgImEo9757B0MXJxCAksZZT40f0WKiElsa/nPzuELSzx51oX
 G0TRM0aJZ79nMYEk2ASKJTbeaANrEBHwlni//hgziM0sUCix6Ph5qKl/GSX+f30NluAUsJNY
 8LKbBcQWFnCQ6J75H2wQi4CqxLzJz8C28Qo4Srz+fpcRwhaUODnzCQvEUG2JpzefwtnLFkLM
 lBBQkPj5dBkrxBFuEuseT2OCqBGRuPGohXECo/AsJKNmIRk1C8moWUhaFjCyrGIUSS0tzk3P
 LTbUK07MLS7NS9dLzs/dxAiMxW3Hfm7ewTjv1Ue9Q4xMHIyHGCU4mJVEeHkr3VOEeFMSK6tS
 i/Lji0pzUosPMZoC/TaRWUo0OR+YDPJK4g3NDEwNTcwsDUwtzYyVxHk9CzoShQTSE0tSs1NT
 C1KLYPqYODilGpimvBfZcXjvw2dW0lPkH10wEmThM+FVz/s76zvf3HOv/gm5Xj8jcOHjokN3
 uf1yqo5d+C3NkH9d+2zlEjv55DPzTofrXd6ytih1wckf+6r1Vm05d45la6t1/VG10tOf/i9J
 CWQMN/Kx6lzku6Dm/PEirtvvawu6cwKMTPxbZr4wbjSovKwzqUvq/tnkZbUFrAtfKumfSxJd
 fXvu15hdOn2z7vvyMUw7yvluerVqtqCqecTx/yHy0U1HzAVvGSmvDpWSu1B/buMmJt+6CfdX
 Je2doRh/9cUWyZKD+53W7Ok+0GH/X+D5xfeOslvU7Xt1uGu2+cQpiF/Z0CP461cW03mfwsYd
 HOrMq1dMCGhRvfpBiaU4I9FQi7moOBEAF3nXRU4DAAA=
X-CMS-MailID: 20230428125124eucas1p130cc7f0d1df291314c509395ec95bb8e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20230427104750eucas1p1158eee5a37c71cacaea021a7abbd6ace
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230427104750eucas1p1158eee5a37c71cacaea021a7abbd6ace
References: <20230427104743.9072-1-t.dzieciol@partner.samsung.com>
 <CGME20230427104750eucas1p1158eee5a37c71cacaea021a7abbd6ace@eucas1p1.samsung.com>
 <20230427104743.9072-2-t.dzieciol@partner.samsung.com>
 <d1eb27dd-1b2e-dca1-2d1e-aa16397c2f15@daynix.com>
Received-SPF: none client-ip=210.118.77.12;
 envelope-from=t.dzieciol@partner.samsung.com; helo=mailout2.w1.samsung.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

> Please don't ignore comments in reviews, and if you have a question with =
them or you don't agree with them, please write so in a reply. You don't ha=
ve to post a new version quickly so take time to address all problems point=
ed out.

I assumed that comments referred only to places pointed in the code and fix=
ed only those places. Sorry about that. I will keep in mind that your comme=
nts are more general and fix all the places, where array is passed as param=
eter.

> Please split up those changes into separate patches.

I will extract TCP ACK detection removal and IPv6 extensions traffic detect=
ion to separate patches. Those will be small patches in comparison to the r=
est of cleanup, however those are functional changes.

> Do *not*:
> - suffix struct name with _st. The convention is not common in QEMU code =
base, or even e1000e and igb do not always use the suffixes.
> - use _.

ok, I was looking at E1000E_RingInfo_st, which was added recently with IGB =
code in commit 3a977deebe6b9a10043182e922f6883924ef21f5 (=22Intrdocue igb d=
evice emulation=22).

-----Original Message-----
From: Akihiko Odaki <akihiko.odaki=40daynix.com>=20
Sent: pi=C4=85tek,=2028=20kwietnia=202023=2012:31=0D=0ATo:=20Tomasz=20Dziec=
iol=20<t.dzieciol=40partner.samsung.com>;=20qemu-devel=40nongnu.org=0D=0ACc=
:=20sriram.yagnaraman=40est.tech;=20jasowang=40redhat.com;=20k.kwiecien=40s=
amsung.com;=20m.sochacki=40samsung.com=0D=0ASubject:=20Re:=20=5BPATCH=20v3=
=201/2=5D=20igb:=20RX=20descriptors=20handling=20cleanup=0D=0A=0D=0AOn=2020=
23/04/27=2019:47,=20Tomasz=20Dzieciol=20wrote:=0D=0A>=20Format=20of=20Intel=
=2082576=20was=20changed=20in=20comparison=20to=20Intel=2082574=20=0D=0A>=
=20extended=20descriptors.=20This=20change=20updates=20filling=20of=20advan=
ced=20=0D=0A>=20descriptors=20fields=0D=0A>=20accordingly:=0D=0A>=20*=20rem=
ove=20TCP=20ACK=20detection=0D=0A>=20*=20add=20IPv6=20with=20extensions=20t=
raffic=20detection=0D=0A>=20*=20fragment=20checksum=20and=20IP=20ID=20is=20=
filled=20only=20when=20RXCSUM.IPPCSE=20is=20set=20(in=0D=0A>=20=20=20=20add=
ition=20to=20RXCSUM.PCSD=20bit=20cleared=20condition)=0D=0A=0D=0APlease=20s=
plit=20up=20those=20changes=20into=20seperate=20patches.=20The=20relevant=
=20documentation=20is=20=22Split=20up=20long=20patches=22=20section=20of:=
=20=0D=0Adocs/devel/submitting-a-patch.rst=0D=0A=0D=0A>=20=0D=0A>=20Refacto=
ring=20is=20done=20in=20preparation=20for=20support=20of=20multiple=20advan=
ced=20=0D=0A>=20descriptors=20RX=20modes,=20especially=20packet-split=20mod=
es.=0D=0A>=20=0D=0A>=20Signed-off-by:=20Tomasz=20Dzieciol=20<t.dzieciol=40p=
artner.samsung.com>=0D=0A>=20---=0D=0A>=20=20=20hw/net/e1000e_core.c=20=20=
=20=20=20=7C=20=2018=20+-=0D=0A>=20=20=20hw/net/e1000x_regs.h=20=20=20=20=
=20=7C=20=20=201=20+=0D=0A>=20=20=20hw/net/igb_core.c=20=20=20=20=20=20=20=
=20=7C=20478=20++++++++++++++++++++++++---------------=0D=0A>=20=20=20hw/ne=
t/igb_regs.h=20=20=20=20=20=20=20=20=7C=20=2012=20+-=0D=0A>=20=20=20hw/net/=
trace-events=20=20=20=20=20=20=7C=20=20=206=20+-=0D=0A>=20=20=20tests/qtest=
/libqos/igb.c=20=7C=20=20=203=20+=0D=0A>=20=20=206=20files=20changed,=20316=
=20insertions(+),=20202=20deletions(-)=0D=0A>=20=0D=0A>=20diff=20--git=20a/=
hw/net/e1000e_core.c=20b/hw/net/e1000e_core.c=20index=20=0D=0A>=2078373d7db=
7..0085ad53c2=20100644=0D=0A>=20---=20a/hw/net/e1000e_core.c=0D=0A>=20+++=
=20b/hw/net/e1000e_core.c=0D=0A>=20=40=40=20-1418,11=20+1418,11=20=40=40=20=
e1000e_write_hdr_to_rx_buffers(E1000ECore=20*core,=0D=0A>=20=20=20=7D=0D=0A=
>=20=20=20=0D=0A>=20=20=20static=20void=0D=0A>=20-e1000e_write_to_rx_buffer=
s(E1000ECore=20*core,=0D=0A>=20-=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20hwaddr=20ba=5BMAX_PS_BUFFERS=5D,=0D=
=0A>=20-=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20e1000e_ba_state=20*bastate,=0D=0A>=20-=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20const=20char=20=
*data,=0D=0A>=20-=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20dma_addr_t=20data_len)=0D=0A>=20+e1000e_write_paylo=
ad_frag_to_rx_buffers(E1000ECore=20*core,=0D=0A>=20+=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20hwaddr=20ba=5BMAX_PS_BUFFERS=5D,=0D=0A>=20+=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20e1000e_ba_state=20*bastate,=0D=0A>=
=20+=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20const=20char=20*data,=0D=
=0A>=20+=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20dma_addr_t=20data_len=
)=0D=0A>=20=20=20=7B=0D=0A>=20=20=20=20=20=20=20while=20(data_len=20>=200)=
=20=7B=0D=0A>=20=20=20=20=20=20=20=20=20=20=20uint32_t=20cur_buf_len=20=3D=
=20core->rxbuf_sizes=5Bbastate->cur_idx=5D;=0D=0A>=20=40=40=20-1594,8=20+15=
94,10=20=40=40=20e1000e_write_packet_to_guest(E1000ECore=20*core,=20struct=
=20NetRxPkt=20*pkt,=0D=0A>=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20while=20(copy_size)=20=7B=0D=0A>=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20iov_copy=20=3D=20MIN(copy_size,=20iov->=
iov_len=20-=20=0D=0A>=20iov_ofs);=0D=0A>=20=20=20=0D=0A>=20-=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20e1000e_write_to_rx_buffers(cor=
e,=20ba,=20&bastate,=0D=0A>=20-=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20iov->iov_base=20+=20iov_ofs,=20iov_copy);=0D=0A>=20+=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20e1000e_write_payload_=
frag_to_rx_buffers(core,=20ba,=20&bastate,=0D=0A>=20+=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20iov->iov_base=20+=0D=0A>=20+=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20iov_of=
s,=0D=0A>=20+=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=0D=0A>=20+=20iov_copy);=0D=0A=
>=20=20=20=0D=0A>=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20copy_size=20-=3D=20iov_copy;=0D=0A>=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20iov_ofs=20+=3D=20iov_copy;=20=40=
=40=20-1607,7=20+1609,7=20=40=40=20=0D=0A>=20e1000e_write_packet_to_guest(E=
1000ECore=20*core,=20struct=20NetRxPkt=20*pkt,=0D=0A>=20=20=20=0D=0A>=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20if=20(desc_offset=20+=20=
desc_size=20>=3D=20total_size)=20=7B=0D=0A>=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20/*=20Simulate=20FCS=20checksum=20pre=
sence=20in=20the=20last=20descriptor=20*/=0D=0A>=20-=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20e1000e_write_to_rx_buffers(core,=20b=
a,=20&bastate,=0D=0A>=20+=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20e1000e_write_payload_frag_to_rx_buffers(core,=20ba,=20=0D=0A>=
=20+=20&bastate,=0D=0A>=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20(const=20char=20*)=20&fcs_pad,=20e1000x=
_fcs_len(core->mac));=0D=0A>=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=7D=0D=0A>=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=7D=0D=
=0A>=20diff=20--git=20a/hw/net/e1000x_regs.h=20b/hw/net/e1000x_regs.h=20ind=
ex=20=0D=0A>=2013760c66d3..344fd10359=20100644=0D=0A>=20---=20a/hw/net/e100=
0x_regs.h=0D=0A>=20+++=20b/hw/net/e1000x_regs.h=0D=0A>=20=40=40=20-827,6=20=
+827,7=20=40=40=20union=20e1000_rx_desc_packet_split=20=7B=0D=0A>=20=20=20/=
*=20Receive=20Checksum=20Control=20bits=20*/=0D=0A>=20=20=20=23define=20E10=
00_RXCSUM_IPOFLD=20=20=20=20=200x100=20=20=20/*=20IP=20Checksum=20Offload=
=20Enable=20*/=0D=0A>=20=20=20=23define=20E1000_RXCSUM_TUOFLD=20=20=20=20=
=200x200=20=20=20/*=20TCP/UDP=20Checksum=20Offload=20Enable=20*/=0D=0A>=20+=
=23define=20E1000_RXCSUM_IPPCSE=20=20=20=20=200x1000=20=20/*=20IP=20Payload=
=20Checksum=20enable=20*/=0D=0A>=20=20=20=23define=20E1000_RXCSUM_PCSD=20=
=20=20=20=20=20=200x2000=20=20/*=20Packet=20Checksum=20Disable=20*/=0D=0A>=
=20=20=20=0D=0A>=20=20=20=23define=20E1000_RING_DESC_LEN=20=20=20=20=20=20=
=20(16)=0D=0A>=20diff=20--git=20a/hw/net/igb_core.c=20b/hw/net/igb_core.c=
=20index=20=0D=0A>=2096b7335b31..1cb64402aa=20100644=0D=0A>=20---=20a/hw/ne=
t/igb_core.c=0D=0A>=20+++=20b/hw/net/igb_core.c=0D=0A>=20=40=40=20-267,6=20=
+267,21=20=40=40=20igb_rx_use_legacy_descriptor(IGBCore=20*core)=0D=0A>=20=
=20=20=20=20=20=20return=20false;=0D=0A>=20=20=20=7D=0D=0A>=20=20=20=0D=0A>=
=20+typedef=20struct=20E1000E_RingInfo_st=20=7B=0D=0A>=20+=20=20=20=20int=
=20dbah;=0D=0A>=20+=20=20=20=20int=20dbal;=0D=0A>=20+=20=20=20=20int=20dlen=
;=0D=0A>=20+=20=20=20=20int=20dh;=0D=0A>=20+=20=20=20=20int=20dt;=0D=0A>=20=
+=20=20=20=20int=20idx;=0D=0A>=20+=7D=20E1000E_RingInfo;=0D=0A>=20+=0D=0A>=
=20+static=20uint32_t=0D=0A>=20+igb_rx_queue_desctyp_get(IGBCore=20*core,=
=20const=20E1000E_RingInfo=20*r)=20=7B=0D=0A>=20+=20=20=20=20return=20core-=
>mac=5BE1000_SRRCTL(r->idx)=20>>=202=5D=20&=20=0D=0A>=20+E1000_SRRCTL_DESCT=
YPE_MASK;=20=7D=0D=0A>=20+=0D=0A>=20=20=20static=20inline=20bool=0D=0A>=20=
=20=20igb_rss_enabled(IGBCore=20*core)=0D=0A>=20=20=20=7B=0D=0A>=20=40=40=
=20-694,15=20+709,6=20=40=40=20static=20uint32_t=20igb_rx_wb_eic(IGBCore=20=
*core,=20int=20queue_idx)=0D=0A>=20=20=20=20=20=20=20return=20(ent=20&=20E1=
000_IVAR_VALID)=20?=20BIT(ent=20&=200x1f)=20:=200;=0D=0A>=20=20=20=7D=0D=0A=
>=20=20=20=0D=0A>=20-typedef=20struct=20E1000E_RingInfo_st=20=7B=0D=0A>=20-=
=20=20=20=20int=20dbah;=0D=0A>=20-=20=20=20=20int=20dbal;=0D=0A>=20-=20=20=
=20=20int=20dlen;=0D=0A>=20-=20=20=20=20int=20dh;=0D=0A>=20-=20=20=20=20int=
=20dt;=0D=0A>=20-=20=20=20=20int=20idx;=0D=0A>=20-=7D=20E1000E_RingInfo;=0D=
=0A>=20-=0D=0A>=20=20=20static=20inline=20bool=0D=0A>=20=20=20igb_ring_empt=
y(IGBCore=20*core,=20const=20E1000E_RingInfo=20*r)=0D=0A>=20=20=20=7B=0D=0A=
>=20=40=40=20-941,6=20+947,14=20=40=40=20igb_has_rxbufs(IGBCore=20*core,=20=
const=20E1000E_RingInfo=20*r,=20size_t=20total_size)=0D=0A>=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20bufsiz=
e;=0D=0A>=20=20=20=7D=0D=0A>=20=20=20=0D=0A>=20+static=20uint32_t=0D=0A>=20=
+igb_get_queue_rx_header_buf_size(IGBCore=20*core,=20const=20E1000E_RingInf=
o=20=0D=0A>=20+*r)=20=7B=0D=0A>=20+=20=20=20=20uint32_t=20srrctl=20=3D=20co=
re->mac=5BE1000_SRRCTL(r->idx)=20>>=202=5D;=0D=0A>=20+=20=20=20=20return=20=
(srrctl=20&=20E1000_SRRCTL_BSIZEHDRSIZE_MASK)=20>>=0D=0A>=20+=20=20=20=20=
=20=20=20=20=20=20=20E1000_SRRCTL_BSIZEHDRSIZE_SHIFT;=20=7D=0D=0A>=20+=0D=
=0A>=20=20=20void=0D=0A>=20=20=20igb_start_recv(IGBCore=20*core)=0D=0A>=20=
=20=20=7B=0D=0A>=20=40=40=20-1232,7=20+1246,7=20=40=40=20igb_read_adv_rx_de=
scr(IGBCore=20*core,=20union=20e1000_adv_rx_desc=20*desc,=0D=0A>=20=20=20=
=7D=0D=0A>=20=20=20=0D=0A>=20=20=20static=20inline=20void=0D=0A>=20-igb_rea=
d_rx_descr(IGBCore=20*core,=20union=20e1000_rx_desc_union=20*desc,=0D=0A>=
=20+igb_read_rx_descr(IGBCore=20*core,=20union=20e1000_adv_rx_desc=20*desc,=
=0D=0A>=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20hwadd=
r=20*buff_addr)=0D=0A>=20=20=20=7B=0D=0A>=20=20=20=20=20=20=20if=20(igb_rx_=
use_legacy_descriptor(core))=20=7B=20=40=40=20-1281,15=20+1295,11=20=0D=0A>=
=20=40=40=20igb_verify_csum_in_sw(IGBCore=20*core,=0D=0A>=20=20=20=7D=0D=0A=
>=20=20=20=0D=0A>=20=20=20static=20void=0D=0A>=20-igb_build_rx_metadata(IGB=
Core=20*core,=0D=0A>=20-=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20struct=20NetRxPkt=20*pkt,=0D=0A>=20-=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20bool=20is_eop,=0D=0A>=20-=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20const=20E1000E_=
RSSInfo=20*rss_info,=20uint16_t=20etqf,=20bool=20ts,=0D=0A>=20-=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20uint16_t=20*pkt_info,=
=20uint16_t=20*hdr_info,=0D=0A>=20-=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20uint32_t=20*rss,=0D=0A>=20-=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20uint32_t=20*status_flags,=0D=
=0A>=20-=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20u=
int16_t=20*ip_id,=0D=0A>=20-=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20uint16_t=20*vlan_tag)=0D=0A>=20+igb_build_rx_metadata_=
common(IGBCore=20*core,=0D=0A>=20+=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20struct=20NetRxPkt=20*pkt,=
=0D=0A>=20+=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20bool=20is_eop,=0D=0A>=20+=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20uint32_t=20*=
status_flags,=0D=0A>=20+=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20uint16_t=20*vlan_tag)=0D=0A>=20=20=20=
=7B=0D=0A>=20=20=20=20=20=20=20struct=20virtio_net_hdr=20*vhdr;=0D=0A>=20=
=20=20=20=20=20=20bool=20hasip4,=20hasip6,=20csum_valid;=20=40=40=20-1298,7=
=20+1308,6=20=40=40=20=0D=0A>=20igb_build_rx_metadata(IGBCore=20*core,=0D=
=0A>=20=20=20=20=20=20=20*status_flags=20=3D=20E1000_RXD_STAT_DD;=0D=0A>=20=
=20=20=0D=0A>=20=20=20=20=20=20=20/*=20No=20additional=20metadata=20needed=
=20for=20non-EOP=20descriptors=20*/=0D=0A>=20-=20=20=20=20/*=20TODO:=20EOP=
=20apply=20only=20to=20status=20so=20don't=20skip=20whole=20function.=20*/=
=0D=0A>=20=20=20=20=20=20=20if=20(=21is_eop)=20=7B=0D=0A>=20=20=20=20=20=20=
=20=20=20=20=20goto=20func_exit;=0D=0A>=20=20=20=20=20=20=20=7D=0D=0A>=20=
=40=40=20-1315,64=20+1324,6=20=40=40=20igb_build_rx_metadata(IGBCore=20*cor=
e,=0D=0A>=20=20=20=20=20=20=20=20=20=20=20trace_e1000e_rx_metadata_vlan(*vl=
an_tag);=0D=0A>=20=20=20=20=20=20=20=7D=0D=0A>=20=20=20=0D=0A>=20-=20=20=20=
=20/*=20Packet=20parsing=20results=20*/=0D=0A>=20-=20=20=20=20if=20((core->=
mac=5BRXCSUM=5D=20&=20E1000_RXCSUM_PCSD)=20=21=3D=200)=20=7B=0D=0A>=20-=20=
=20=20=20=20=20=20=20if=20(rss_info->enabled)=20=7B=0D=0A>=20-=20=20=20=20=
=20=20=20=20=20=20=20=20*rss=20=3D=20cpu_to_le32(rss_info->hash);=0D=0A>=20=
-=20=20=20=20=20=20=20=20=20=20=20=20trace_igb_rx_metadata_rss(*rss);=0D=0A=
>=20-=20=20=20=20=20=20=20=20=7D=0D=0A>=20-=20=20=20=20=7D=20else=20if=20(h=
asip4)=20=7B=0D=0A>=20-=20=20=20=20=20=20=20=20=20=20=20=20*status_flags=20=
=7C=3D=20E1000_RXD_STAT_IPIDV;=0D=0A>=20-=20=20=20=20=20=20=20=20=20=20=20=
=20*ip_id=20=3D=20cpu_to_le16(net_rx_pkt_get_ip_id(pkt));=0D=0A>=20-=20=20=
=20=20=20=20=20=20=20=20=20=20trace_e1000e_rx_metadata_ip_id(*ip_id);=0D=0A=
>=20-=20=20=20=20=7D=0D=0A>=20-=0D=0A>=20-=20=20=20=20if=20(l4hdr_proto=20=
=3D=3D=20ETH_L4_HDR_PROTO_TCP=20&&=20net_rx_pkt_is_tcp_ack(pkt))=20=7B=0D=
=0A>=20-=20=20=20=20=20=20=20=20*status_flags=20=7C=3D=20E1000_RXD_STAT_ACK=
;=0D=0A>=20-=20=20=20=20=20=20=20=20trace_e1000e_rx_metadata_ack();=0D=0A>=
=20-=20=20=20=20=7D=0D=0A>=20-=0D=0A>=20-=20=20=20=20if=20(pkt_info)=20=7B=
=0D=0A>=20-=20=20=20=20=20=20=20=20*pkt_info=20=3D=20rss_info->enabled=20?=
=20rss_info->type=20:=200;=0D=0A>=20-=0D=0A>=20-=20=20=20=20=20=20=20=20if=
=20(etqf=20<=208)=20=7B=0D=0A>=20-=20=20=20=20=20=20=20=20=20=20=20=20*pkt_=
info=20=7C=3D=20BIT(11)=20=7C=20(etqf=20<<=204);=0D=0A>=20-=20=20=20=20=20=
=20=20=20=7D=20else=20=7B=0D=0A>=20-=20=20=20=20=20=20=20=20=20=20=20=20if=
=20(hasip4)=20=7B=0D=0A>=20-=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20*pkt_info=20=7C=3D=20E1000_ADVRXD_PKT_IP4;=0D=0A>=20-=20=20=20=20=20=20=
=20=20=20=20=20=20=7D=0D=0A>=20-=0D=0A>=20-=20=20=20=20=20=20=20=20=20=20=
=20=20if=20(hasip6)=20=7B=0D=0A>=20-=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20*pkt_info=20=7C=3D=20E1000_ADVRXD_PKT_IP6;=0D=0A>=20-=20=20=20=20=
=20=20=20=20=20=20=20=20=7D=0D=0A>=20-=0D=0A>=20-=20=20=20=20=20=20=20=20=
=20=20=20=20switch=20(l4hdr_proto)=20=7B=0D=0A>=20-=20=20=20=20=20=20=20=20=
=20=20=20=20case=20ETH_L4_HDR_PROTO_TCP:=0D=0A>=20-=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20*pkt_info=20=7C=3D=20E1000_ADVRXD_PKT_TCP;=0D=0A>=
=20-=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20break;=0D=0A>=20-=0D=0A=
>=20-=20=20=20=20=20=20=20=20=20=20=20=20case=20ETH_L4_HDR_PROTO_UDP:=0D=0A=
>=20-=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20*pkt_info=20=7C=3D=20E=
1000_ADVRXD_PKT_UDP;=0D=0A>=20-=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20break;=0D=0A>=20-=0D=0A>=20-=20=20=20=20=20=20=20=20=20=20=20=20case=
=20ETH_L4_HDR_PROTO_SCTP:=0D=0A>=20-=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20*pkt_info=20=7C=3D=20E1000_ADVRXD_PKT_SCTP;=0D=0A>=20-=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20break;=0D=0A>=20-=0D=0A>=20-=20=20=20=
=20=20=20=20=20=20=20=20=20default:=0D=0A>=20-=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20break;=0D=0A>=20-=20=20=20=20=20=20=20=20=20=20=20=20=
=7D=0D=0A>=20-=20=20=20=20=20=20=20=20=7D=0D=0A>=20-=20=20=20=20=7D=0D=0A>=
=20-=0D=0A>=20-=20=20=20=20if=20(hdr_info)=20=7B=0D=0A>=20-=20=20=20=20=20=
=20=20=20*hdr_info=20=3D=200;=0D=0A>=20-=20=20=20=20=7D=0D=0A>=20-=0D=0A>=
=20-=20=20=20=20if=20(ts)=20=7B=0D=0A>=20-=20=20=20=20=20=20=20=20*status_f=
lags=20=7C=3D=20BIT(16);=0D=0A>=20-=20=20=20=20=7D=0D=0A>=20-=0D=0A>=20=20=
=20=20=20=20=20/*=20RX=20CSO=20information=20*/=0D=0A>=20=20=20=20=20=20=20=
if=20(hasip6=20&&=20(core->mac=5BRFCTL=5D=20&=20E1000_RFCTL_IPV6_XSUM_DIS))=
=20=7B=0D=0A>=20=20=20=20=20=20=20=20=20=20=20trace_e1000e_rx_metadata_ipv6=
_sum_disabled();=0D=0A>=20=40=40=20-1426,58=20+1377,126=20=40=40=20func_exi=
t:=0D=0A>=20=20=20=7D=0D=0A>=20=20=20=0D=0A>=20=20=20static=20inline=20void=
=0D=0A>=20-igb_write_lgcy_rx_descr(IGBCore=20*core,=20struct=20e1000_rx_des=
c=20*desc,=0D=0A>=20+igb_write_lgcy_rx_descr(IGBCore=20*core,=0D=0A>=20+=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20struct=
=20e1000_rx_desc=20*desc,=0D=0A>=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20struct=20NetRxPkt=20*pkt,=0D=0A>=20-=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20con=
st=20E1000E_RSSInfo=20*rss_info,=20uint16_t=20etqf,=20bool=20ts,=0D=0A>=20+=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20con=
st=20E1000E_RSSInfo=20*rss_info,=0D=0A>=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20uint16_t=20length)=0D=0A>=20=
=20=20=7B=0D=0A>=20-=20=20=20=20uint32_t=20status_flags,=20rss;=0D=0A>=20-=
=20=20=20=20uint16_t=20ip_id;=0D=0A>=20+=20=20=20=20uint32_t=20status_flags=
;=0D=0A>=20=20=20=0D=0A>=20=20=20=20=20=20=20assert(=21rss_info->enabled);=
=0D=0A>=20+=0D=0A>=20+=20=20=20=20memset(desc,=200,=20sizeof(*desc));=0D=0A=
>=20=20=20=20=20=20=20desc->length=20=3D=20cpu_to_le16(length);=0D=0A>=20-=
=20=20=20=20desc->csum=20=3D=200;=0D=0A>=20+=20=20=20=20igb_build_rx_metada=
ta_common(core,=20pkt,=20pkt=20=21=3D=20NULL,=0D=0A>=20+=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20&status_flags,=0D=0A>=20+=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20&desc->special);=
=0D=0A>=20=20=20=0D=0A>=20-=20=20=20=20igb_build_rx_metadata(core,=20pkt,=
=20pkt=20=21=3D=20NULL,=0D=0A>=20-=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20rss_info,=20etqf,=20ts,=0D=0A>=20-=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20NULL,=20NULL,=20&rss,=0D=0A>=20-=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20&status_flags,=20&ip_id,=0D=0A>=20-=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20&desc->special);=0D=0A>=20=20=20=20=20=20=20desc->errors=20=3D=20(uint8_=
t)=20(le32_to_cpu(status_flags)=20>>=2024);=0D=0A>=20=20=20=20=20=20=20desc=
->status=20=3D=20(uint8_t)=20le32_to_cpu(status_flags);=0D=0A>=20=20=20=7D=
=0D=0A>=20=20=20=0D=0A>=20+static=20uint16_t=0D=0A>=20+igb_rx_desc_get_pack=
et_type(IGBCore=20*core,=20struct=20NetRxPkt=20*pkt,=20=0D=0A>=20+uint16_t=
=20etqf)=20=7B=0D=0A>=20+=20=20=20=20uint16_t=20pkt_type=20=3D=200;=0D=0A>=
=20+=20=20=20=20bool=20hasip4,=20hasip6;=0D=0A>=20+=20=20=20=20EthL4HdrProt=
o=20l4hdr_proto;=0D=0A>=20+=0D=0A>=20+=20=20=20=20net_rx_pkt_get_protocols(=
pkt,=20&hasip4,=20&hasip6,=20&l4hdr_proto);=0D=0A>=20+=0D=0A>=20+=20=20=20=
=20if=20(hasip6=20&&=20=21(core->mac=5BRFCTL=5D=20&=20E1000_RFCTL_IPV6_DIS)=
)=20=7B=0D=0A>=20+=20=20=20=20=20=20=20=20eth_ip6_hdr_info=20*ip6hdr_info=
=20=20=3D=20net_rx_pkt_get_ip6_info(pkt);=0D=0A>=20+=20=20=20=20=20=20=20=
=20pkt_type=20=7C=3D=20ip6hdr_info->has_ext_hdrs=20?=20E1000_ADVRXD_PKT_IP6=
E=20:=0D=0A>=20+=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20E1000_ADVRXD_PKT_IP6;=0D=0A>=20+=20=20=20=20=7D=20else=20if=20(=
hasip4)=20=7B=0D=0A>=20+=20=20=20=20=20=20=20=20pkt_type=20=3D=20E1000_ADVR=
XD_PKT_IP4;=0D=0A>=20+=20=20=20=20=7D=0D=0A>=20+=0D=0A>=20+=20=20=20=20if=
=20(etqf=20<=208)=20=7B=0D=0A>=20+=20=20=20=20=20=20=20=20pkt_type=20=7C=3D=
=20(BIT(11)=20>>=204)=20=7C=20etqf;=0D=0A>=20+=20=20=20=20=20=20=20=20retur=
n=20pkt_type;=0D=0A>=20+=20=20=20=20=7D=0D=0A>=20+=0D=0A>=20+=20=20=20=20sw=
itch=20(l4hdr_proto)=20=7B=0D=0A>=20+=20=20=20=20case=20ETH_L4_HDR_PROTO_TC=
P:=0D=0A>=20+=20=20=20=20=20=20=20=20pkt_type=20=7C=3D=20E1000_ADVRXD_PKT_T=
CP;=0D=0A>=20+=20=20=20=20=20=20=20=20break;=0D=0A>=20+=20=20=20=20case=20E=
TH_L4_HDR_PROTO_UDP:=0D=0A>=20+=20=20=20=20=20=20=20=20pkt_type=20=7C=3D=20=
E1000_ADVRXD_PKT_UDP;=0D=0A>=20+=20=20=20=20=20=20=20=20break;=0D=0A>=20+=
=20=20=20=20case=20ETH_L4_HDR_PROTO_SCTP:=0D=0A>=20+=20=20=20=20=20=20=20=
=20pkt_type=20=7C=3D=20E1000_ADVRXD_PKT_SCTP;=0D=0A>=20+=20=20=20=20=20=20=
=20=20break;=0D=0A>=20+=20=20=20=20default:=0D=0A>=20+=20=20=20=20=20=20=20=
=20break;=0D=0A>=20+=20=20=20=20=7D=0D=0A>=20+=0D=0A>=20+=20=20=20=20return=
=20pkt_type;=0D=0A>=20+=7D=0D=0A>=20+=0D=0A>=20=20=20static=20inline=20void=
=0D=0A>=20-igb_write_adv_rx_descr(IGBCore=20*core,=20union=20e1000_adv_rx_d=
esc=20*desc,=0D=0A>=20+igb_write_adv_rx_descr(IGBCore=20*core,=0D=0A>=20+=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20union=
=20e1000_adv_rx_desc=20*d,=0D=0A>=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20struct=20NetRxPkt=20*pkt,=0D=0A>=20-=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20const=20E=
1000E_RSSInfo=20*rss_info,=20uint16_t=20etqf,=20bool=20ts,=0D=0A>=20+=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20const=20E100=
0E_RSSInfo=20*rss_info,=0D=0A>=20+=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20uint16_t=20etqf,=0D=0A>=20+=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20bool=20ts,=0D=0A>=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20uin=
t16_t=20length)=0D=0A>=20=20=20=7B=0D=0A>=20-=20=20=20=20memset(&desc->wb,=
=200,=20sizeof(desc->wb));=0D=0A>=20+=20=20=20=20bool=20hasip4,=20hasip6;=
=0D=0A>=20+=20=20=20=20EthL4HdrProto=20l4hdr_proto;=0D=0A>=20+=20=20=20=20u=
int16_t=20rss_type=20=3D=200,=20pkt_type;=0D=0A>=20+=20=20=20=20bool=20eop=
=20=3D=20(pkt=20=21=3D=20NULL);=0D=0A>=20+=20=20=20=20memset(&d->wb,=200,=
=20sizeof(d->wb));=0D=0A>=20+=0D=0A>=20+=20=20=20=20d->wb.upper.length=20=
=3D=20cpu_to_le16(length);=0D=0A>=20+=20=20=20=20igb_build_rx_metadata_comm=
on(core,=20pkt,=20eop,=0D=0A>=20+=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20&d->wb.upper.statu=
s_error,=0D=0A>=20+=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20&d->wb.upper.vlan);=0D=0A>=20+=
=0D=0A>=20+=20=20=20=20if=20(=21eop)=20=7B=0D=0A>=20+=20=20=20=20=20=20=20=
=20return;=0D=0A>=20+=20=20=20=20=7D=0D=0A>=20+=0D=0A>=20+=20=20=20=20net_r=
x_pkt_get_protocols(pkt,=20&hasip4,=20&hasip6,=20&l4hdr_proto);=0D=0A>=20+=
=0D=0A>=20+=20=20=20=20if=20((core->mac=5BRXCSUM=5D=20&=20E1000_RXCSUM_PCSD=
)=20=21=3D=200)=20=7B=0D=0A>=20+=20=20=20=20=20=20=20=20if=20(rss_info->ena=
bled)=20=7B=0D=0A>=20+=20=20=20=20=20=20=20=20=20=20=20=20d->wb.lower.hi_dw=
ord.rss=20=3D=20cpu_to_le32(rss_info->hash);=0D=0A>=20+=20=20=20=20=20=20=
=20=20=20=20=20=20rss_type=20=3D=20rss_info->type;=0D=0A>=20+=20=20=20=20=
=20=20=20=20=20=20=20=20trace_igb_rx_metadata_rss(d->wb.lower.hi_dword.rss,=
=20rss_type);=0D=0A>=20+=20=20=20=20=20=20=20=20=7D=0D=0A>=20+=20=20=20=20=
=7D=20else=20if=20(core->mac=5BRXCSUM=5D=20&=20E1000_RXCSUM_IPPCSE=20&&=0D=
=0A>=20+=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20hasip4)=20=7B=0D=0A>=
=20+=20=20=20=20=20=20=20=20d->wb.lower.hi_dword.csum_ip.ip_id=20=3D=20cpu_=
to_le16(net_rx_pkt_get_ip_id(pkt));=0D=0A>=20+=20=20=20=20=20=20=20=20trace=
_e1000e_rx_metadata_ip_id(d->wb.lower.hi_dword.csum_ip.ip_id);=0D=0A>=20+=
=20=20=20=20=7D=0D=0A>=20=20=20=0D=0A>=20-=20=20=20=20desc->wb.upper.length=
=20=3D=20cpu_to_le16(length);=0D=0A>=20+=20=20=20=20if=20(ts)=20=7B=0D=0A>=
=20+=20=20=20=20=20=20=20=20d->wb.upper.status_error=20=7C=3D=20BIT(16);=0D=
=0A>=20+=20=20=20=20=7D=0D=0A>=20=20=20=0D=0A>=20-=20=20=20=20igb_build_rx_=
metadata(core,=20pkt,=20pkt=20=21=3D=20NULL,=0D=0A>=20-=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20rss_info,=20etq=
f,=20ts,=0D=0A>=20-=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20&desc->wb.lower.lo_dword.pkt_info,=0D=0A>=20-=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20&de=
sc->wb.lower.lo_dword.hdr_info,=0D=0A>=20-=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20&desc->wb.lower.hi_dword.rss,=
=0D=0A>=20-=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20&desc->wb.upper.status_error,=0D=0A>=20-=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20&desc->wb.lower=
.hi_dword.csum_ip.ip_id,=0D=0A>=20-=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20&desc->wb.upper.vlan);=0D=0A>=20+=20=
=20=20=20pkt_type=20=3D=20igb_rx_desc_get_packet_type(core,=20pkt,=20etqf);=
=0D=0A>=20+=20=20=20=20trace_e1000e_rx_metadata_pkt_type(pkt_type);=0D=0A>=
=20+=20=20=20=20d->wb.lower.lo_dword.pkt_info=20=3D=20cpu_to_le16(rss_type=
=20=7C=20(pkt_type=20=0D=0A>=20+=20<<=204));=0D=0A>=20=20=20=7D=0D=0A>=20=
=20=20=0D=0A>=20=20=20static=20inline=20void=0D=0A>=20-igb_write_rx_descr(I=
GBCore=20*core,=20union=20e1000_rx_desc_union=20*desc,=0D=0A>=20-=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20struct=20NetRxPkt=20*pkt,=
=20const=20E1000E_RSSInfo=20*rss_info,=0D=0A>=20-=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20uint16_t=20etqf,=20bool=20ts,=20uint16_t=
=20length)=0D=0A>=20+igb_write_rx_descr(IGBCore=20*core,=0D=0A>=20+=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20union=20e1000_rx_desc_un=
ion=20*desc,=0D=0A>=20+=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20struct=20NetRxPkt=20*pkt,=0D=0A>=20+=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20const=20E1000E_RSSInfo=20*rss_info,=0D=0A>=20+=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20uint16_t=20etqf,=0D=
=0A>=20+=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20bool=20ts,=
=0D=0A>=20+=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20uint16_=
t(*written)=5BMAX_PS_BUFFERS=5D,=0D=0A=0D=0AAs=20I=20wrote=20in=20the=20las=
t=20review:=0D=0A=20>=20Don't=20use=20an=20array=20here.=20Instead=20use=20=
a=20struct=20as=20e1000_adv_rx_desc=20=20>=20does;=20it=20will=20be=20more=
=20explicit=20and=20easier=20to=20read.=20And=20I=20think=20this=20=20>=20s=
hould=20be=20rather=20part=20of=20the=20next=20patch.=0D=0A=0D=0APlease=20d=
on't=20ignore=20comments=20in=20reviews,=20and=20if=20you=20have=20a=20ques=
tion=20with=20them=20or=20you=20don't=20agree=20with=20them,=20please=20wri=
te=20so=20in=20a=20reply.=20You=20don't=20have=20to=20post=20a=20new=20vers=
ion=20quickly=20so=20take=20time=20to=20address=20all=20problems=20pointed=
=20out.=0D=0A=0D=0ASee=20also:=20=22Stay=20around=20to=20fix=20problems=20r=
aised=20in=20code=20review=22=20section=20in=20docs/devel/submitting-a-patc=
h.rst=0D=0A=0D=0A>=20+=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20const=20E1000E_RingInfo=20*r)=0D=0A>=20=20=20=7B=0D=0A>=20=20=20=20=
=20=20=20if=20(igb_rx_use_legacy_descriptor(core))=20=7B=0D=0A>=20-=20=20=
=20=20=20=20=20=20igb_write_lgcy_rx_descr(core,=20&desc->legacy,=20pkt,=20r=
ss_info,=0D=0A>=20-=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20etqf,=20ts,=20length);=0D=0A>=20+=
=20=20=20=20=20=20=20=20igb_write_lgcy_rx_descr(core,=20&desc->legacy,=20pk=
t,=20rss_info,=20=0D=0A>=20+=20(*written)=5B1=5D);=0D=0A>=20=20=20=20=20=20=
=20=7D=20else=20=7B=0D=0A>=20-=20=20=20=20=20=20=20=20igb_write_adv_rx_desc=
r(core,=20&desc->adv,=20pkt,=20rss_info,=0D=0A>=20-=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20etqf,=
=20ts,=20length);=0D=0A>=20+=20=20=20=20=20=20=20=20igb_write_adv_rx_descr(=
core,=20&desc->adv,=20pkt,=20rss_info,=20etqf,=20=0D=0A>=20+=20ts,=20(*writ=
ten)=5B1=5D);=0D=0A>=20=20=20=20=20=20=20=7D=0D=0A>=20=20=20=7D=0D=0A>=20=
=20=20=0D=0A>=20=40=40=20-1513,19=20+1532,6=20=40=40=20igb_pci_dma_write_rx=
_desc(IGBCore=20*core,=20PCIDevice=20*dev,=20dma_addr_t=20addr,=0D=0A>=20=
=20=20=20=20=20=20=7D=0D=0A>=20=20=20=7D=0D=0A>=20=20=20=0D=0A>=20-static=
=20void=0D=0A>=20-igb_write_to_rx_buffers(IGBCore=20*core,=0D=0A>=20-=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20PCIDevice=
=20*d,=0D=0A>=20-=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20hwaddr=20ba,=0D=0A>=20-=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20uint16_t=20*written,=0D=0A>=20-=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20const=20c=
har=20*data,=0D=0A>=20-=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20dma_addr_t=20data_len)=0D=0A>=20-=7B=0D=0A>=20-=20=20=
=20=20trace_igb_rx_desc_buff_write(ba,=20*written,=20data,=20data_len);=0D=
=0A>=20-=20=20=20=20pci_dma_write(d,=20ba=20+=20*written,=20data,=20data_le=
n);=0D=0A>=20-=20=20=20=20*written=20+=3D=20data_len;=0D=0A>=20-=7D=0D=0A>=
=20-=0D=0A>=20=20=20static=20void=0D=0A>=20=20=20igb_update_rx_stats(IGBCor=
e=20*core,=20const=20E1000E_RingInfo=20*rxi,=0D=0A>=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20size_t=20pkt_size,=20size_t=20=
pkt_fcs_size)=20=40=40=20-1551,6=20=0D=0A>=20+1557,137=20=40=40=20igb_rx_de=
scr_threshold_hit(IGBCore=20*core,=20const=20E1000E_RingInfo=20*rxi)=0D=0A>=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20((core->mac=5BE1000_SRRCTL(rxi->i=
dx)=20>>=202=5D=20>>=2020)=20&=2031)=20*=2016;=0D=0A>=20=20=20=7D=0D=0A>=20=
=20=20=0D=0A>=20+typedef=20struct=20IGB_BaState_st=20=7B=0D=0A>=20+=20=20=
=20=20uint16_t=20written=5BMAX_PS_BUFFERS=5D;=0D=0A>=20+=20=20=20=20uint8_t=
=20cur_idx;=0D=0A>=20+=7D=20IGB_BaState;=0D=0A>=20+=0D=0A>=20+typedef=20str=
uct=20IGB_PacketRxDMAState_st=20=7B=0D=0A>=20+=20=20=20=20size_t=20size;=0D=
=0A>=20+=20=20=20=20size_t=20total_size;=0D=0A>=20+=20=20=20=20size_t=20ps_=
hdr_len;=0D=0A>=20+=20=20=20=20size_t=20desc_size;=0D=0A>=20+=20=20=20=20si=
ze_t=20desc_offset;=0D=0A>=20+=20=20=20=20uint32_t=20rx_desc_packet_buf_siz=
e;=0D=0A>=20+=20=20=20=20uint32_t=20rx_desc_header_buf_size;=0D=0A>=20+=20=
=20=20=20struct=20iovec=20*iov;=0D=0A>=20+=20=20=20=20size_t=20iov_ofs;=0D=
=0A>=20+=20=20=20=20bool=20is_first;=0D=0A>=20+=20=20=20=20IGB_BaState=20ba=
state;=0D=0A>=20+=20=20=20=20hwaddr=20ba=5BMAX_PS_BUFFERS=5D;=0D=0A>=20+=7D=
=20IGB_PacketRxDMAState;=0D=0A=0D=0ADo=20*not*:=0D=0A-=20suffix=20struct=20=
name=20with=20_st.=20The=20convention=20is=20not=20common=20in=20QEMU=20cod=
e=20base,=20or=20even=20e1000e=20and=20igb=20do=20not=20always=20use=20the=
=20suffixes.=0D=0A-=20use=20_.=0D=0A=0D=0ASee=20include/qemu/typedefs.h=20f=
or=20examples.=0D=0A=0D=0A>=20+=0D=0A>=20+static=20void=0D=0A>=20+igb_trunc=
ate_to_descriptor_size(IGB_PacketRxDMAState=20*pdma_st,=20size_t=20=0D=0A>=
=20+*size)=20=7B=0D=0A>=20+=20=20=20=20if=20(*size=20>=20pdma_st->rx_desc_p=
acket_buf_size)=20=7B=0D=0A>=20+=20=20=20=20=20=20=20=20*size=20=3D=20pdma_=
st->rx_desc_packet_buf_size;=0D=0A>=20+=20=20=20=20=7D=0D=0A>=20+=7D=0D=0A>=
=20+=0D=0A>=20+static=20void=0D=0A>=20+igb_write_payload_frag_to_rx_buffers=
(IGBCore=20*core,=0D=0A>=20+=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20PCIDevice=
=20*d,=0D=0A>=20+=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20hwaddr=20(*ba)=5BMAX_=
PS_BUFFERS=5D,=0D=0A>=20+=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20IGB_BaState=
=20*bastate,=0D=0A>=20+=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20uint32_t=20cur_=
buf_len,=0D=0A>=20+=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20const=20char=20*da=
ta,=0D=0A>=20+=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20dma_addr_t=20data_len)=
=20=7B=0D=0A>=20+=20=20=20=20while=20(data_len=20>=200)=20=7B=0D=0A>=20+=20=
=20=20=20=20=20=20=20assert(bastate->cur_idx=20<=20MAX_PS_BUFFERS);=0D=0A>=
=20+=0D=0A>=20+=20=20=20=20=20=20=20=20uint32_t=20cur_buf_bytes_left=20=3D=
=20cur_buf_len=20-=0D=0A>=20+=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20bastat=
e->written=5Bbastate->cur_idx=5D;=0D=0A>=20+=20=20=20=20=20=20=20=20uint32_=
t=20bytes_to_write=20=3D=20MIN(data_len,=20cur_buf_bytes_left);=0D=0A>=20+=
=0D=0A>=20+=20=20=20=20=20=20=20=20trace_igb_rx_desc_buff_write(bastate->cu=
r_idx,=0D=0A>=20+=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20(*ba)=5Bbastate->cur_=
idx=5D,=0D=0A>=20+=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20bastate->written=5Bba=
state->cur_idx=5D,=0D=0A>=20+=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20data,=0D=
=0A>=20+=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20bytes_to_write);=0D=0A>=20+=0D=
=0A>=20+=20=20=20=20=20=20=20=20pci_dma_write(d,=0D=0A>=20+=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20(*ba)=5Bbastate->cur_idx=
=5D=20+=0D=0A>=20+=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20bastate->written=5Bbastate->cur_idx=5D,=0D=0A>=20+=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20data,=20bytes_to_write);=
=0D=0A>=20+=0D=0A>=20+=20=20=20=20=20=20=20=20bastate->written=5Bbastate->c=
ur_idx=5D=20+=3D=20bytes_to_write;=0D=0A>=20+=20=20=20=20=20=20=20=20data=
=20+=3D=20bytes_to_write;=0D=0A>=20+=20=20=20=20=20=20=20=20data_len=20-=3D=
=20bytes_to_write;=0D=0A>=20+=0D=0A>=20+=20=20=20=20=20=20=20=20if=20(basta=
te->written=5Bbastate->cur_idx=5D=20=3D=3D=20cur_buf_len)=20=7B=0D=0A>=20+=
=20=20=20=20=20=20=20=20=20=20=20=20bastate->cur_idx++;=0D=0A>=20+=20=20=20=
=20=20=20=20=20=7D=0D=0A>=20+=20=20=20=20=7D=0D=0A>=20+=7D=0D=0A>=20+=0D=0A=
>=20+static=20void=0D=0A>=20+igb_write_payload_to_rx_buffers(IGBCore=20*cor=
e,=0D=0A>=20+=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20struct=20NetRxPkt=20*pkt,=0D=0A>=20+=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20PCIDevice=20*d,=0D=0A>=20+=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20IGB_Packe=
tRxDMAState=20*pdma_st,=0D=0A>=20+=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20size_t=20*copy_siz=
e)=20=7B=0D=0A>=20+=20=20=20=20static=20const=20uint32_t=20fcs_pad;=0D=0A>=
=20+=20=20=20=20size_t=20iov_copy;=0D=0A>=20+=0D=0A>=20+=20=20=20=20/*=20Co=
py=20packet=20payload=20*/=0D=0A>=20+=20=20=20=20while=20(*copy_size)=20=7B=
=0D=0A>=20+=20=20=20=20=20=20=20=20iov_copy=20=3D=20MIN(*copy_size,=20pdma_=
st->iov->iov_len=20-=20pdma_st->iov_ofs);=0D=0A>=20+=20=20=20=20=20=20=20=
=20igb_write_payload_frag_to_rx_buffers(core,=20d,=0D=0A>=20+=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20&pdma_st->ba,=0D=0A>=20+=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20&pdma_st->bastate,=
=0D=0A>=20+=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20pdm=
a_st->rx_desc_packet_buf_size,=0D=0A>=20+=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20pdma_st->iov->iov_base=20+=0D=0A>=20+=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20pdma_st->iov_ofs,=0D=0A>=
=20+=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20iov_copy)=
;=0D=0A>=20+=0D=0A>=20+=20=20=20=20=20=20=20=20*copy_size=20-=3D=20iov_copy=
;=0D=0A>=20+=20=20=20=20=20=20=20=20pdma_st->iov_ofs=20+=3D=20iov_copy;=0D=
=0A>=20+=20=20=20=20=20=20=20=20if=20(pdma_st->iov_ofs=20=3D=3D=20pdma_st->=
iov->iov_len)=20=7B=0D=0A>=20+=20=20=20=20=20=20=20=20=20=20=20=20pdma_st->=
iov++;=0D=0A>=20+=20=20=20=20=20=20=20=20=20=20=20=20pdma_st->iov_ofs=20=3D=
=200;=0D=0A>=20+=20=20=20=20=20=20=20=20=7D=0D=0A>=20+=20=20=20=20=7D=0D=0A=
>=20+=0D=0A>=20+=20=20=20=20if=20(pdma_st->desc_offset=20+=20pdma_st->desc_=
size=20>=3D=20pdma_st->total_size)=20=7B=0D=0A>=20+=20=20=20=20=20=20=20=20=
/*=20Simulate=20FCS=20checksum=20presence=20in=20the=20last=20descriptor=20=
*/=0D=0A>=20+=20=20=20=20=20=20=20=20igb_write_payload_frag_to_rx_buffers(c=
ore,=20d,=0D=0A>=20+=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20&pdma_st->ba,=0D=0A>=20+=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20&pdma_st->bastate,=0D=0A>=20+=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20pdma_st->rx_desc_packet_buf_size,=0D=0A>=20+=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20(const=20char=
=20*)=20&fcs_pad,=0D=0A>=20+=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20e1000x_fcs_len(core->mac));=0D=0A>=20+=20=20=20=20=7D=0D=0A>=
=20+=7D=0D=0A>=20+=0D=0A>=20+static=20void=0D=0A>=20+igb_write_to_rx_buffer=
s(IGBCore=20*core,=0D=0A>=20+=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20struct=20NetRxPkt=20*pkt,=0D=0A>=20+=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20PCIDevice=20*d,=
=0D=0A>=20+=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20IGB_PacketRxDMAState=20*pdma_st)=20=7B=0D=0A>=20+=20=20=20=20size_=
t=20copy_size;=0D=0A>=20+=0D=0A>=20+=20=20=20=20if=20(=21(pdma_st->ba)=5B1=
=5D)=20=7B=0D=0A>=20+=20=20=20=20=20=20=20=20/*=20as=20per=20intel=20docs;=
=20skip=20descriptors=20with=20null=20buf=20addr=20*/=0D=0A>=20+=20=20=20=
=20=20=20=20=20trace_e1000e_rx_null_descriptor();=0D=0A>=20+=20=20=20=20=20=
=20=20=20return;=0D=0A>=20+=20=20=20=20=7D=0D=0A>=20+=0D=0A>=20+=20=20=20=
=20if=20(pdma_st->desc_offset=20>=3D=20pdma_st->size)=20=7B=0D=0A>=20+=20=
=20=20=20=20=20=20=20return;=0D=0A>=20+=20=20=20=20=7D=0D=0A>=20+=0D=0A>=20=
+=20=20=20=20pdma_st->desc_size=20=3D=20pdma_st->total_size=20-=20pdma_st->=
desc_offset;=0D=0A>=20+=20=20=20=20igb_truncate_to_descriptor_size(pdma_st,=
=20&pdma_st->desc_size);=0D=0A>=20+=20=20=20=20copy_size=20=3D=20pdma_st->s=
ize=20-=20pdma_st->desc_offset;=0D=0A>=20+=20=20=20=20igb_truncate_to_descr=
iptor_size(pdma_st,=20&copy_size);=0D=0A>=20+=20=20=20=20pdma_st->bastate.c=
ur_idx=20=3D=201;=0D=0A>=20+=20=20=20=20igb_write_payload_to_rx_buffers(cor=
e,=20pkt,=20d,=20pdma_st,=20=0D=0A>=20+&copy_size);=20=7D=0D=0A>=20+=0D=0A>=
=20=20=20static=20void=0D=0A>=20=20=20igb_write_packet_to_guest(IGBCore=20*=
core,=20struct=20NetRxPkt=20*pkt,=0D=0A>=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20const=20E1000E_RxRing=
=20*rxr,=20=40=40=20-1560,91=20=0D=0A>=20+1697,58=20=40=40=20igb_write_pack=
et_to_guest(IGBCore=20*core,=20struct=20NetRxPkt=20*pkt,=0D=0A>=20=20=20=20=
=20=20=20PCIDevice=20*d;=0D=0A>=20=20=20=20=20=20=20dma_addr_t=20base;=0D=
=0A>=20=20=20=20=20=20=20union=20e1000_rx_desc_union=20desc;=0D=0A>=20-=20=
=20=20=20size_t=20desc_size;=0D=0A>=20-=20=20=20=20size_t=20desc_offset=20=
=3D=200;=0D=0A>=20-=20=20=20=20size_t=20iov_ofs=20=3D=200;=0D=0A>=20-=0D=0A=
>=20-=20=20=20=20struct=20iovec=20*iov=20=3D=20net_rx_pkt_get_iovec(pkt);=
=0D=0A>=20-=20=20=20=20size_t=20size=20=3D=20net_rx_pkt_get_total_len(pkt);=
=0D=0A>=20-=20=20=20=20size_t=20total_size=20=3D=20size=20+=20e1000x_fcs_le=
n(core->mac);=0D=0A>=20-=20=20=20=20const=20E1000E_RingInfo=20*rxi=20=3D=20=
rxr->i;=0D=0A>=20-=20=20=20=20size_t=20bufsize=20=3D=20igb_rxbufsize(core,=
=20rxi);=0D=0A>=20-=0D=0A>=20+=20=20=20=20const=20E1000E_RingInfo=20*rxi;=
=0D=0A>=20+=20=20=20=20size_t=20rx_desc_len;=0D=0A>=20+=0D=0A>=20+=20=20=20=
=20IGB_PacketRxDMAState=20pdma_st=20=3D=20=7B0=7D;=0D=0A>=20+=20=20=20=20pd=
ma_st.is_first=20=3D=20true;=0D=0A>=20+=20=20=20=20pdma_st.size=20=3D=20net=
_rx_pkt_get_total_len(pkt);=0D=0A>=20+=20=20=20=20pdma_st.total_size=20=3D=
=20pdma_st.size=20+=20e1000x_fcs_len(core->mac);=0D=0A>=20+=0D=0A>=20+=20=
=20=20=20rxi=20=3D=20rxr->i;=0D=0A>=20+=20=20=20=20rx_desc_len=20=3D=20core=
->rx_desc_len;=0D=0A>=20+=20=20=20=20pdma_st.rx_desc_packet_buf_size=20=3D=
=0D=0A>=20+=20=20=20=20=20=20=20=20igb_rxbufsize(core,=20rxi);=0D=0A>=20+=
=20=20=20=20pdma_st.rx_desc_header_buf_size=20=3D=0D=0A>=20+=20=20=20=20=20=
=20=20=20igb_get_queue_rx_header_buf_size(core,=20rxi);=0D=0A>=20+=20=20=20=
=20pdma_st.iov=20=3D=20net_rx_pkt_get_iovec(pkt);=0D=0A>=20=20=20=20=20=20=
=20d=20=3D=20pcie_sriov_get_vf_at_index(core->owner,=20rxi->idx=20%=208);=
=0D=0A>=20=20=20=20=20=20=20if=20(=21d)=20=7B=0D=0A>=20=20=20=20=20=20=20=
=20=20=20=20d=20=3D=20core->owner;=0D=0A>=20=20=20=20=20=20=20=7D=0D=0A>=20=
=20=20=0D=0A>=20=20=20=20=20=20=20do=20=7B=0D=0A>=20-=20=20=20=20=20=20=20=
=20hwaddr=20ba;=0D=0A>=20-=20=20=20=20=20=20=20=20uint16_t=20written=20=3D=
=200;=0D=0A>=20+=20=20=20=20=20=20=20=20memset(&pdma_st.bastate,=200,=20siz=
eof(IGB_BaState));=0D=0A>=20=20=20=20=20=20=20=20=20=20=20bool=20is_last=20=
=3D=20false;=0D=0A>=20=20=20=0D=0A>=20-=20=20=20=20=20=20=20=20desc_size=20=
=3D=20total_size=20-=20desc_offset;=0D=0A>=20-=0D=0A>=20-=20=20=20=20=20=20=
=20=20if=20(desc_size=20>=20bufsize)=20=7B=0D=0A>=20-=20=20=20=20=20=20=20=
=20=20=20=20=20desc_size=20=3D=20bufsize;=0D=0A>=20-=20=20=20=20=20=20=20=
=20=7D=0D=0A>=20-=0D=0A>=20=20=20=20=20=20=20=20=20=20=20if=20(igb_ring_emp=
ty(core,=20rxi))=20=7B=0D=0A>=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20r=
eturn;=0D=0A>=20=20=20=20=20=20=20=20=20=20=20=7D=0D=0A>=20=20=20=0D=0A>=20=
=20=20=20=20=20=20=20=20=20=20base=20=3D=20igb_ring_head_descr(core,=20rxi)=
;=0D=0A>=20+=20=20=20=20=20=20=20=20pci_dma_read(d,=20base,=20&desc,=20rx_d=
esc_len);=0D=0A>=20+=20=20=20=20=20=20=20=20trace_e1000e_rx_descr(rxi->idx,=
=20base,=20rx_desc_len);=0D=0A>=20=20=20=0D=0A>=20-=20=20=20=20=20=20=20=20=
pci_dma_read(d,=20base,=20&desc,=20core->rx_desc_len);=0D=0A>=20-=0D=0A>=20=
-=20=20=20=20=20=20=20=20trace_e1000e_rx_descr(rxi->idx,=20base,=20core->rx=
_desc_len);=0D=0A>=20-=0D=0A>=20-=20=20=20=20=20=20=20=20igb_read_rx_descr(=
core,=20&desc,=20&ba);=0D=0A>=20-=0D=0A>=20-=20=20=20=20=20=20=20=20if=20(b=
a)=20=7B=0D=0A>=20-=20=20=20=20=20=20=20=20=20=20=20=20if=20(desc_offset=20=
<=20size)=20=7B=0D=0A>=20-=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20s=
tatic=20const=20uint32_t=20fcs_pad;=0D=0A>=20-=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20size_t=20iov_copy;=0D=0A>=20-=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20size_t=20copy_size=20=3D=20size=20-=20desc_offset;=
=0D=0A>=20-=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20if=20(copy_size=
=20>=20bufsize)=20=7B=0D=0A>=20-=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20copy_size=20=3D=20bufsize;=0D=0A>=20-=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=7D=0D=0A>=20-=0D=0A>=20-=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20/*=20Copy=20packet=20payload=20*/=0D=0A>=20-=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20while=20(copy_size)=20=7B=
=0D=0A>=20-=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20iov_=
copy=20=3D=20MIN(copy_size,=20iov->iov_len=20-=20iov_ofs);=0D=0A>=20-=0D=0A=
>=20-=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20igb_write_=
to_rx_buffers(core,=20d,=20ba,=20&written,=0D=0A>=20-=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20iov->iov_base=20+=20iov_ofs,=20iov_copy=
);=0D=0A>=20+=20=20=20=20=20=20=20=20igb_read_rx_descr(core,=20&desc,=20&pd=
ma_st->ba=5B1=5D,=20rxi);=0D=0A>=20=20=20=0D=0A>=20-=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20copy_size=20-=3D=20iov_copy;=0D=0A>=
=20-=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20iov_ofs=20+=
=3D=20iov_copy;=0D=0A>=20-=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20if=20(iov_ofs=20=3D=3D=20iov->iov_len)=20=7B=0D=0A>=20-=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20iov++;=0D=
=0A>=20-=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20iov_ofs=20=3D=200;=0D=0A>=20-=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=7D=0D=0A>=20-=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=7D=0D=0A>=20-=0D=0A>=20-=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20if=20(desc_offset=20+=20desc_size=20>=3D=20total_size)=20=7B=0D=0A=
>=20-=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20/*=20Simul=
ate=20FCS=20checksum=20presence=20in=20the=20last=20descriptor=20*/=0D=0A>=
=20-=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20igb_write_t=
o_rx_buffers(core,=20d,=20ba,=20&written,=0D=0A>=20-=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20(const=20char=20*)=
=20&fcs_pad,=20e1000x_fcs_len(core->mac));=0D=0A>=20-=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=7D=0D=0A>=20-=20=20=20=20=20=20=20=20=20=20=20=
=20=7D=0D=0A>=20-=20=20=20=20=20=20=20=20=7D=20else=20=7B=20/*=20as=20per=
=20intel=20docs;=20skip=20descriptors=20with=20null=20buf=20addr=20*/=0D=0A=
>=20-=20=20=20=20=20=20=20=20=20=20=20=20trace_e1000e_rx_null_descriptor();=
=0D=0A>=20-=20=20=20=20=20=20=20=20=7D=0D=0A>=20-=20=20=20=20=20=20=20=20de=
sc_offset=20+=3D=20desc_size;=0D=0A>=20-=20=20=20=20=20=20=20=20if=20(desc_=
offset=20>=3D=20total_size)=20=7B=0D=0A>=20+=20=20=20=20=20=20=20=20igb_wri=
te_to_rx_buffers(core,=20pkt,=20d,=20&pdma_st);=0D=0A>=20+=20=20=20=20=20=
=20=20=20pdma_st.desc_offset=20+=3D=20pdma_st.desc_size;=0D=0A>=20+=20=20=
=20=20=20=20=20=20if=20(pdma_st.desc_offset=20>=3D=20pdma_st.total_size)=20=
=7B=0D=0A>=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20is_last=20=3D=20true=
;=0D=0A>=20=20=20=20=20=20=20=20=20=20=20=7D=0D=0A>=20=20=20=0D=0A>=20-=20=
=20=20=20=20=20=20=20igb_write_rx_descr(core,=20&desc,=20is_last=20?=20core=
->rx_pkt=20:=20NULL,=0D=0A>=20-=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20rss_info,=20etqf,=20ts,=20written);=
=0D=0A>=20-=20=20=20=20=20=20=20=20igb_pci_dma_write_rx_desc(core,=20d,=20b=
ase,=20&desc,=20core->rx_desc_len);=0D=0A>=20-=0D=0A>=20-=20=20=20=20=20=20=
=20=20igb_ring_advance(core,=20rxi,=20core->rx_desc_len=20/=20E1000_MIN_RX_=
DESC_LEN);=0D=0A>=20-=0D=0A>=20-=20=20=20=20=7D=20while=20(desc_offset=20<=
=20total_size);=0D=0A>=20-=0D=0A>=20-=20=20=20=20igb_update_rx_stats(core,=
=20rxi,=20size,=20total_size);=0D=0A>=20+=20=20=20=20=20=20=20=20igb_write_=
rx_descr(core,=20&desc,=0D=0A>=20+=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20is_last=20?=20pkt=20:=20NULL,=0D=
=0A>=20+=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20rss_info,=0D=0A>=20+=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20etqf,=20ts,=0D=0A>=20+=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20&pd=
ma_st.bastate.written,=0D=0A>=20+=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20rxi);=0D=0A>=20+=20=20=20=20=20=20=
=20=20pci_dma_write(d,=20base,=20&desc,=20rx_desc_len);=0D=0A>=20+=20=20=20=
=20=20=20=20=20igb_ring_advance(core,=20rxi,=0D=0A>=20+=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20rx_desc_len=20/=20=
E1000_MIN_RX_DESC_LEN);=0D=0A>=20+=20=20=20=20=7D=20while=20(pdma_st.desc_o=
ffset=20<=20pdma_st.total_size);=0D=0A>=20+=0D=0A>=20+=20=20=20=20igb_updat=
e_rx_stats(core,=20rxi,=20pdma_st.size,=20pdma_st.total_size);=0D=0A>=20=20=
=20=7D=0D=0A>=20=20=20=0D=0A>=20=20=20static=20bool=0D=0A>=20diff=20--git=
=20a/hw/net/igb_regs.h=20b/hw/net/igb_regs.h=20index=20=0D=0A>=2082ff195dfc=
..c4ede22181=20100644=0D=0A>=20---=20a/hw/net/igb_regs.h=0D=0A>=20+++=20b/h=
w/net/igb_regs.h=0D=0A>=20=40=40=20-452,6=20+452,7=20=40=40=20union=20e1000=
_adv_rx_desc=20=7B=0D=0A>=20=20=20=23define=20E1000_SRRCTL_BSIZEHDRSIZE_MAS=
K=20=20=20=20=20=20=20=20=200x00000F00=0D=0A>=20=20=20=23define=20E1000_SRR=
CTL_BSIZEHDRSIZE_SHIFT=20=20=20=20=20=20=20=202=20=20/*=20Shift=20_left_=20=
*/=0D=0A>=20=20=20=23define=20E1000_SRRCTL_DESCTYPE_ADV_ONEBUF=20=20=20=20=
=20=20=200x02000000=0D=0A>=20+=23define=20E1000_SRRCTL_DESCTYPE_HDR_SPLIT=
=20=20=20=20=20=20=20=200x04000000=0D=0A>=20=20=20=23define=20E1000_SRRCTL_=
DESCTYPE_HDR_SPLIT_ALWAYS=200x0A000000=0D=0A>=20=20=20=23define=20E1000_SRR=
CTL_DESCTYPE_MASK=20=20=20=20=20=20=20=20=20=20=20=20=200x0E000000=0D=0A>=
=20=20=20=23define=20E1000_SRRCTL_DROP_EN=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=200x80000000=0D=0A>=20=40=40=20-692,11=20+693,12=20=
=40=40=20union=20e1000_adv_rx_desc=20=7B=0D=0A>=20=20=20=0D=0A>=20=20=20=23=
define=20E1000_STATUS_NUM_VFS_SHIFT=2014=0D=0A>=20=20=20=0D=0A>=20-=23defin=
e=20E1000_ADVRXD_PKT_IP4=20BIT(4)=0D=0A>=20-=23define=20E1000_ADVRXD_PKT_IP=
6=20BIT(6)=0D=0A>=20-=23define=20E1000_ADVRXD_PKT_TCP=20BIT(8)=0D=0A>=20-=
=23define=20E1000_ADVRXD_PKT_UDP=20BIT(9)=0D=0A>=20-=23define=20E1000_ADVRX=
D_PKT_SCTP=20BIT(10)=0D=0A>=20+=23define=20E1000_ADVRXD_PKT_IP4=20=20BIT(0)=
=0D=0A>=20+=23define=20E1000_ADVRXD_PKT_IP6=20=20BIT(2)=0D=0A>=20+=23define=
=20E1000_ADVRXD_PKT_IP6E=20BIT(3)=0D=0A>=20+=23define=20E1000_ADVRXD_PKT_TC=
P=20=20BIT(4)=0D=0A>=20+=23define=20E1000_ADVRXD_PKT_UDP=20=20BIT(5)=0D=0A>=
=20+=23define=20E1000_ADVRXD_PKT_SCTP=20BIT(6)=0D=0A>=20=20=20=0D=0A>=20=20=
=20static=20inline=20uint8_t=20igb_ivar_entry_rx(uint8_t=20i)=0D=0A>=20=20=
=20=7B=0D=0A>=20diff=20--git=20a/hw/net/trace-events=20b/hw/net/trace-event=
s=20index=20=0D=0A>=20e4a98b2c7d..9a02261360=20100644=0D=0A>=20---=20a/hw/n=
et/trace-events=0D=0A>=20+++=20b/hw/net/trace-events=0D=0A>=20=40=40=20-277=
,9=20+277,9=20=40=40=20igb_core_mdic_write_unhandled(uint32_t=20addr)=20=22=
MDIC=20WRITE:=20PHY=5B%u=5D=20UNHANDLED=22=0D=0A>=20=20=20igb_link_set_ext_=
params(bool=20asd_check,=20bool=20speed_select_bypass,=20bool=20pfrstd)=20=
=22Set=20extended=20link=20params:=20ASD=20check:=20%d,=20Speed=20select=20=
bypass:=20%d,=20PF=20reset=20done:=20%d=22=0D=0A>=20=20=20=0D=0A>=20=20=20i=
gb_rx_desc_buff_size(uint32_t=20b)=20=22buffer=20size:=20%u=22=0D=0A>=20-ig=
b_rx_desc_buff_write(uint64_t=20addr,=20uint16_t=20offset,=20const=20void*=
=20source,=20uint32_t=20len)=20=22addr:=200x%=22PRIx64=22,=20offset:=20%u,=
=20from:=20%p,=20length:=20%u=22=0D=0A>=20+igb_rx_desc_buff_write(uint8_t=
=20idx,=20uint64_t=20addr,=20uint16_t=20offset,=20const=20void*=20source,=
=20uint32_t=20len)=20=22buffer=20=23%u,=20addr:=200x%=22PRIx64=22,=20offset=
:=20%u,=20from:=20%p,=20length:=20%u=22=0D=0A>=20=20=20=0D=0A>=20-igb_rx_me=
tadata_rss(uint32_t=20rss)=20=22RSS=20data:=200x%X=22=0D=0A>=20+igb_rx_meta=
data_rss(uint32_t=20rss,=20uint16_t=20rss_pkt_type)=20=22RSS=20data:=20rss:=
=200x%X,=20rss_pkt_type:=200x%X=22=0D=0A>=20=20=20=0D=0A>=20=20=20igb_irq_i=
cr_clear_gpie_nsicr(void)=20=22Clearing=20ICR=20on=20read=20due=20to=20GPIE=
.NSICR=20enabled=22=0D=0A>=20=20=20igb_irq_set_iam(uint32_t=20icr)=20=22Upd=
ate=20IAM:=200x%x=22=0D=0A>=20=40=40=20-294,6=20+294,8=20=40=40=20igb_irq_e=
itr_set(uint32_t=20eitr_num,=20uint32_t=20val)=20=22EITR=5B%u=5D=20=3D=200x=
%x=22=0D=0A>=20=20=20igb_set_pfmailbox(uint32_t=20vf_num,=20uint32_t=20val)=
=20=22PFMailbox=5B%d=5D:=200x%x=22=0D=0A>=20=20=20igb_set_vfmailbox(uint32_=
t=20vf_num,=20uint32_t=20val)=20=22VFMailbox=5B%d=5D:=200x%x=22=0D=0A>=20=
=20=20=0D=0A>=20+igb_wrn_rx_desc_modes_not_supp(int=20desc_type)=20=22Not=
=20supported=20descriptor=20type:=20%d=22=0D=0A>=20+=0D=0A>=20=20=20=23=20i=
gbvf.c=0D=0A>=20=20=20igbvf_wrn_io_addr_unknown(uint64_t=20addr)=20=22IO=20=
unknown=20register=20=0D=0A>=200x%=22PRIx64=0D=0A>=20=20=20=0D=0A>=20diff=
=20--git=20a/tests/qtest/libqos/igb.c=20b/tests/qtest/libqos/igb.c=20index=
=20=0D=0A>=20a603468beb..aa65b5452c=20100644=0D=0A>=20---=20a/tests/qtest/l=
ibqos/igb.c=0D=0A>=20+++=20b/tests/qtest/libqos/igb.c=0D=0A>=20=40=40=20-10=
9,6=20+109,9=20=40=40=20static=20void=20igb_pci_start_hw(QOSGraphObject=20*=
obj)=0D=0A>=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20E1000_RAH_AV=20=7C=20E1000_RAH_POOL_1=20=7C=0D=0A>=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
le16_to_cpu(*(uint16_t=20*)(address=20+=204)));=0D=0A>=20=20=20=0D=0A>=20+=
=20=20=20=20/*=20Set=20supported=20receive=20descriptor=20mode=20*/=0D=0A>=
=20+=20=20=20=20e1000e_macreg_write(&d->e1000e,=20E1000_SRRCTL(0),=20=0D=0A=
>=20+=20E1000_SRRCTL_DESCTYPE_ADV_ONEBUF);=0D=0A>=20+=0D=0A>=20=20=20=20=20=
=20=20/*=20Enable=20receive=20*/=0D=0A>=20=20=20=20=20=20=20e1000e_macreg_w=
rite(&d->e1000e,=20E1000_RFCTL,=20E1000_RFCTL_EXTEN);=0D=0A>=20=20=20=20=20=
=20=20e1000e_macreg_write(&d->e1000e,=20E1000_RCTL,=20E1000_RCTL_EN);=0D=0A=
=0D=0A

