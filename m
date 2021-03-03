Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 991B832AF59
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 04:25:47 +0100 (CET)
Received: from localhost ([::1]:40350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHI8w-0007dH-4p
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 22:25:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <changlm@chinatelecom.cn>)
 id 1lHI7y-00076P-U0; Tue, 02 Mar 2021 22:24:46 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.228]:54677
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <changlm@chinatelecom.cn>)
 id 1lHI7w-0004aF-EH; Tue, 02 Mar 2021 22:24:46 -0500
HMM_SOURCE_IP: 172.18.0.48:5054.1008649981
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-106.120.101.58?logid-1539d8b0fdd04a199f5c16d18ac4fd80
 (unknown [172.18.0.48])
 by chinatelecom.cn (HERMES) with SMTP id F3F8D2800ED;
 Wed,  3 Mar 2021 11:24:26 +0800 (CST)
X-189-SAVE-TO-SEND: 71112636@chinatelecom.cn
Received: from  ([172.18.0.48])
 by App0024 with ESMTP id 1539d8b0fdd04a199f5c16d18ac4fd80 for
 qemu-block@nongnu.org; Wed Mar  3 11:24:34 2021
X-Transaction-ID: 1539d8b0fdd04a199f5c16d18ac4fd80
X-filter-score: filter<0>
X-Real-From: changlm@chinatelecom.cn
X-Receive-IP: 172.18.0.48
X-MEDUSA-Status: 0
Date: Wed, 3 Mar 2021 11:24:19 +0800
From: ChangLimin <changlm@chinatelecom.cn>
To: qemu-block <qemu-block@nongnu.org>
Subject: [PATCH V2] file-posix: allow -EBUSY -EINVAL errors during write zeros
 on block
References: <2021030209564214018344@chinatelecom.cn>
X-Priority: 3
X-GUID: 412A8D7D-1B20-4009-A1F4-255767C0AFAE
X-Has-Attach: no
X-Mailer: Foxmail 7.2.17.58[cn]
Mime-Version: 1.0
Message-ID: <2021030311241928103058@chinatelecom.cn>
Content-Type: multipart/alternative;
 boundary="----=_001_NextPart156846856287_=----"
Received-SPF: pass client-ip=42.123.76.228;
 envelope-from=changlm@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_KAM_HTML_FONT_INVALID=0.01 autolearn=ham autolearn_force=no
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
Cc: kwolf <kwolf@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 mreitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.

------=_001_NextPart156846856287_=----
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: base64

U2luY2UgTGludXggNS4xMCwgd3JpdGUgemVyb3MgdG8gYSBtdWx0aXBhdGggZGV2aWNlIHVzaW5n
DQppb2N0bChmZCwgQkxLWkVST09VVCwgcmFuZ2UpIHdpdGggY2FjaGUgbm9uZSBvciBkaXJlY3Rz
eW5jIHJldHVybiAtRUJVU1kNCnBlcm1hbmVudGx5Lg0KDQpTaW1pbGFyIHRvIGhhbmRsZV9haW9j
Yl93cml0ZV96ZXJvZXNfdW5tYXAsIGhhbmRsZV9haW9jYl93cml0ZV96ZXJvZXNfYmxvY2sNCmFs
bG93IC1FQlVTWSBhbmQgLUVJTlZBTCBlcnJvcnMgZHVyaW5nIGlvY3RsKGZkLCBCTEtaRVJPT1VU
LCByYW5nZSkuDQoNClJlZmVyZW5jZSBjb21taXQgaW4gTGludXggNS4xMDoNCmh0dHBzOi8vZ2l0
Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3N0YWJsZS9saW51eC5naXQvY29t
bWl0Lz9pZD0zODRkODdlZjJjOTU0ZmM1OGU2YzVmZDgyNTNlNGExOTg0ZjVmZTAyDQoNClNpZ25l
ZC1vZmYtYnk6IENoYW5nTGltaW4gPGNoYW5nbG1AY2hpbmF0ZWxlY29tLmNuPg0KLS0tDQogYmxv
Y2svZmlsZS1wb3NpeC5jIHwgOSArKysrKysrLS0NCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvYmxvY2svZmlsZS1wb3NpeC5j
IGIvYmxvY2svZmlsZS1wb3NpeC5jDQppbmRleCAwNTA3OWI0MGNhLi40ZTEzMmRiOTI5IDEwMDY0
NA0KLS0tIGEvYmxvY2svZmlsZS1wb3NpeC5jDQorKysgYi9ibG9jay9maWxlLXBvc2l4LmMNCkBA
IC0xNjI5LDggKzE2MjksMTMgQEAgc3RhdGljIHNzaXplX3QgaGFuZGxlX2Fpb2NiX3dyaXRlX3pl
cm9lc19ibG9jayhSYXdQb3NpeEFJT0RhdGEgKmFpb2NiKQ0KICAgICAgICAgfSB3aGlsZSAoZXJy
bm8gPT0gRUlOVFIpOw0KDQogICAgICAgICByZXQgPSB0cmFuc2xhdGVfZXJyKC1lcnJubyk7DQot
ICAgICAgICBpZiAocmV0ID09IC1FTk9UU1VQKSB7DQotICAgICAgICAgICAgcy0+aGFzX3dyaXRl
X3plcm9lcyA9IGZhbHNlOw0KKyAgICAgICAgc3dpdGNoIChyZXQpIHsNCisgICAgICAgIGNhc2Ug
LUVOT1RTVVA6DQorICAgICAgICAgICAgcy0+aGFzX3dyaXRlX3plcm9lcyA9IGZhbHNlOyAvKiBm
YWxsIHRocm91Z2ggKi8NCisgICAgICAgIGNhc2UgLUVJTlZBTDoNCisgICAgICAgIGNhc2UgLUVC
VVNZOg0KKyAgICAgICAgICAgIHJldHVybiAtRU5PVFNVUDsNCisgICAgICAgICAgICBicmVhazsN
CiAgICAgICAgIH0NCiAgICAgfQ0KICNlbmRpZg0KLS0NCjIuMjcuMA0KDQo=

------=_001_NextPart156846856287_=----
Content-Type: text/html;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charse=
t=3DUTF-8"><style>body { line-height: 1.5; }blockquote { margin-top: 0px; =
margin-bottom: 0px; margin-left: 0.5em; }body { font-size: 14px; font-fami=
ly: 'Microsoft YaHei UI'; color: rgb(0, 0, 0); line-height: 1.5; }</style>=
</head><body>=0A<div><span></span><div><span style=3D"line-height: 1.5; ba=
ckground-color: transparent;">Since Linux 5.10, write zeros to a multipath=
 device using</span></div><div>ioctl(fd, BLKZEROOUT, range) with cache non=
e or directsync return -EBUSY</div><div>permanently.</div><div><br></div><=
div>Similar to handle_aiocb_write_zeroes_unmap, handle_aiocb_write_zeroes_=
block</div><div>allow -EBUSY and -EINVAL errors during ioctl(fd, BLKZEROOU=
T, range).</div><div><br></div><div>Reference commit in Linux 5.10:</div><=
div>https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commi=
t/?id=3D384d87ef2c954fc58e6c5fd8253e4a1984f5fe02</div><div><br></div><div>=
Signed-off-by: ChangLimin &lt;changlm@chinatelecom.cn&gt;</div><div>---</d=
iv><div>&nbsp;block/file-posix.c | 9 +++++++--</div><div>&nbsp;1 file chan=
ged, 7 insertions(+), 2 deletions(-)</div><div><br></div><div>diff --git a=
/block/file-posix.c b/block/file-posix.c</div><div>index 05079b40ca..4e132=
db929 100644</div><div>--- a/block/file-posix.c</div><div>+++ b/block/file=
-posix.c</div><div>@@ -1629,8 +1629,13 @@ static ssize_t handle_aiocb_writ=
e_zeroes_block(RawPosixAIOData *aiocb)</div><div>&nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;} while (errno =3D=3D EINTR);</div><div><br></div><div>&nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp;ret =3D translate_err(-errno);</div><div>- &nbsp; =
&nbsp; &nbsp; &nbsp;if (ret =3D=3D -ENOTSUP) {</div><div>- &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;s-&gt;has_write_zeroes =3D false;</div><div>+ &n=
bsp; &nbsp; &nbsp; &nbsp;switch (ret) {</div><div>+ &nbsp; &nbsp; &nbsp; &=
nbsp;case -ENOTSUP:</div><div>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;s=
-&gt;has_write_zeroes =3D false; /* fall through */</div><div>+ &nbsp; &nb=
sp; &nbsp; &nbsp;case -EINVAL:</div><div>+ &nbsp; &nbsp; &nbsp; &nbsp;case=
 -EBUSY:</div><div>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return -ENOT=
SUP;</div><div>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div><div=
>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div><div>&nbsp; &nbsp; &nbsp;}</div>=
<div>&nbsp;#endif</div><div>--</div><div>2.27.0</div></div><div><br></div>=
<blockquote style=3D"margin-Top: 0px; margin-Bottom: 0px; margin-Left: 0.5=
em; margin-Right: inherit"><div>=0A</div></blockquote>=0A</body></html>
------=_001_NextPart156846856287_=------


