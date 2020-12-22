Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CC52E0377
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Dec 2020 01:41:41 +0100 (CET)
Received: from localhost ([::1]:44254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krVkC-00013f-2D
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 19:41:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <changlm@chinatelecom.cn>)
 id 1krVZx-0004xt-0g
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 19:31:05 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.219]:57788
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <changlm@chinatelecom.cn>) id 1krVZt-00018i-Ok
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 19:31:04 -0500
HMM_SOURCE_IP: 172.18.0.48:24268.2040927475
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-106.120.220.78?logid-e8d34752e34a4a0b8e78f982da0cceab
 (unknown [172.18.0.48])
 by chinatelecom.cn (HERMES) with SMTP id CB2FF2800A9
 for <qemu-devel@nongnu.org>; Tue, 22 Dec 2020 08:23:49 +0800 (CST)
X-189-SAVE-TO-SEND: 71112636@chinatelecom.cn
Received: from  ([172.18.0.48])
 by App0024 with ESMTP id e8d34752e34a4a0b8e78f982da0cceab for
 qemu-devel@nongnu.org; Tue Dec 22 08:23:50 2020
X-Transaction-ID: e8d34752e34a4a0b8e78f982da0cceab
X-filter-score: filter<0>
X-Real-From: changlm@chinatelecom.cn
X-Receive-IP: 172.18.0.48
X-MEDUSA-Status: 0
Date: Tue, 22 Dec 2020 08:23:49 +0800
From: ChangLimin <changlm@chinatelecom.cn>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: do_fallocate with (FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZE) is not
 necessary when allocate a new qcow2 cluster
X-Priority: 3
X-GUID: 62064C01-88E0-4EFE-9B89-F936C26DCCDC
X-Has-Attach: no
X-Mailer: Foxmail 7.2.17.58[cn]
Mime-Version: 1.0
Message-ID: <2020122208234934336626@chinatelecom.cn>
Content-Type: multipart/alternative;
 boundary="----=_001_NextPart007276502710_=----"
Received-SPF: pass client-ip=42.123.76.219;
 envelope-from=changlm@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 21 Dec 2020 19:38:53 -0500
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.

------=_001_NextPart007276502710_=----
Content-Type: text/plain;
	charset="GB2312"
Content-Transfer-Encoding: base64

RnJvbSBjb21taXQgaHR0cHM6Ly9naXQucWVtdS5vcmcvP3A9cWVtdS5naXQ7YT1jb21taXQ7aD1j
OGJiMjNjYmRiZTMyZjVjMzI2MzY1ZTBhODJlMWIwZTY4Y2RjZDhhIA0KZm9yIHFjb3cyIGZpbGUg
aW4gb2NmczIgZmlsZXN5c3RlbSwgZG9fZmFsbG9jYXRlIHdpdGggKEZBTExPQ19GTF9QVU5DSF9I
T0xFIHwgRkFMTE9DX0ZMX0tFRVBfU0laRSkgDQp3aWxsIGJlIGNhbGxlZCB3aGVuIGFsbG9jYXRl
IGEgbmV3IGNsdXN0ZXIuICBJdCdzIG5vdCBuZWNlc3NhcnkgYW5kIGFsc28gY2F1c2UgZGF0YSBl
cnJvci4NCg0KMS4gY3JlYXRlIGEgb2NmczIgY2x1c3RlciBhbmQgICBgbWtmcy5vY2ZzMiAtYiA0
ayAtQyAxTSAtTiAyIC9kZXYvc2RiMWAgIHRoZW4gYG1vdW50IC9kZXYvc2RiMSAvbW50YA0KMi4g
cWVtdS1pbWcgY3JlYXRlIC1mIHFjb3cyIC1vIGNsdXN0ZXJfc2l6ZT0yNTZrIC9tbnQvdGVzdC5p
bWcgMUcNCjMuIGF0dGFjaCAvbW50L3Rlc3QuaW1nIHRvIGEgbGludXggdm0gYXMgdmRiDQo0LiBp
biB2bSwgYGRkIGlmPS9yb290L2ZvbyBvZj0vZGV2L3ZkYiBicz00ayBjb3VudD0xYCANCjUuIGBo
ZXhkdW1wIC1DIC9kZXYvdmRiIC1uIDQwOTZgICAgdGhlIG91dHB1dCBpcyBub3QgaWRlbnRpY2Fs
IHRvIHRoZSBmaWxlIC9yb290L2Zvbw0KDQpBZnRlciByZW1vdmUgZG9fZmFsbG9jYXRlIHdpdGgg
KEZBTExPQ19GTF9QVU5DSF9IT0xFIHwgRkFMTE9DX0ZMX0tFRVBfU0laRSkgaW4gaGFuZGxlX2Fp
b2NiX3dyaXRlX3plcm9lcyAsIA0KaXQncyBnb29kLg0KDQpDaGFuZyBMaW1pbg0K

------=_001_NextPart007276502710_=----
Content-Type: text/html;
	charset="GB2312"
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charse=
t=3DGB2312"><style>body { line-height: 1.5; }body { font-size: 14px; font-=
family: 'Microsoft YaHei UI'; color: rgb(0, 0, 0); line-height: 1.5; }</st=
yle></head><body>=0A<div><span></span>From commit&nbsp;<a href=3D"https://=
git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3Dc8bb23cbdbe32f5c326365e0a82e1b0e=
68cdcd8a">https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3Dc8bb23cbdbe32f=
5c326365e0a82e1b0e68cdcd8a</a>&nbsp;</div><div>for qcow2 file in ocfs2 fil=
esystem, do_fallocate with (FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZE)&nb=
sp;</div><div>will be called when allocate a new cluster. &nbsp;It's not n=
ecessary and also cause data error.</div><div><br></div><div>1. create a o=
cfs2 cluster and &nbsp; `mkfs.ocfs2 -b 4k -C 1M -N 2 /dev/sdb1` &nbsp;then=
 `mount /dev/sdb1 /mnt`</div><div>2. qemu-img create -f qcow2 -o cluster_s=
ize=3D256k /mnt/test.img 1G</div><div>3. attach /mnt/test.img to a linux v=
m as vdb</div><div>4. in vm, `dd if=3D/root/foo of=3D/dev/vdb bs=3D4k coun=
t=3D1`&nbsp;</div><div>5. `hexdump -C /dev/vdb -n 4096` &nbsp; the output =
is not identical to the file /root/foo</div><div><br></div><div>After remo=
ve do_fallocate with (FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZE) in&nbsp;=
handle_aiocb_write_zeroes ,&nbsp;</div><div>it's good.</div><div><br></div=
><div>Chang Limin</div>=0A</body></html>
------=_001_NextPart007276502710_=------


