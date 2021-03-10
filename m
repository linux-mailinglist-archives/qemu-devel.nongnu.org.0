Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 855C2333238
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 01:17:46 +0100 (CET)
Received: from localhost ([::1]:49268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJmXp-0006rc-6E
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 19:17:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <changlm@chinatelecom.cn>)
 id 1lJmWv-0006Ma-SO; Tue, 09 Mar 2021 19:16:49 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.227]:49226
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <changlm@chinatelecom.cn>)
 id 1lJmWt-0003uh-2D; Tue, 09 Mar 2021 19:16:49 -0500
HMM_SOURCE_IP: 172.18.0.92:63150.446179942
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-106.120.101.58?logid-d64dbc63236a46cf8b70b34fc6f97558
 (unknown [172.18.0.92])
 by chinatelecom.cn (HERMES) with SMTP id DB35228008F;
 Wed, 10 Mar 2021 08:16:38 +0800 (CST)
X-189-SAVE-TO-SEND: 71112636@chinatelecom.cn
Received: from  ([172.18.0.92])
 by App0021 with ESMTP id d64dbc63236a46cf8b70b34fc6f97558 for
 qemu-block@nongnu.org; Wed Mar 10 08:16:40 2021
X-Transaction-ID: d64dbc63236a46cf8b70b34fc6f97558
X-filter-score: filter<0>
X-Real-From: changlm@chinatelecom.cn
X-Receive-IP: 172.18.0.92
X-MEDUSA-Status: 0
Date: Wed, 10 Mar 2021 08:16:33 +0800
From: ChangLimin <changlm@chinatelecom.cn>
To: qemu-block <qemu-block@nongnu.org>
Subject: [PATCH V3] file-posix: allow -EBUSY -EINVAL errors during write zeros
 on block
X-Priority: 3
X-GUID: B9069DD7-B16B-4741-978A-164AD87BE309
X-Has-Attach: no
X-Mailer: Foxmail 7.2.17.58[cn]
Mime-Version: 1.0
Message-ID: <2021031008163294066310@chinatelecom.cn>
Content-Type: multipart/alternative;
 boundary="----=_001_NextPart334842552472_=----"
Received-SPF: pass client-ip=42.123.76.227;
 envelope-from=changlm@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 MIME_BASE64_TEXT=1.741, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

------=_001_NextPart334842552472_=----
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: base64

U2luY2UgTGludXggNS4xMCwgd3JpdGUgemVyb3MgdG8gYSBtdWx0aXBhdGggZGV2aWNlIHVzaW5n
DQppb2N0bChmZCwgQkxLWkVST09VVCwgcmFuZ2UpIHdpdGggY2FjaGUgbm9uZSBvciBkaXJlY3Rz
eW5jIHJldHVybiAtRUJVU1kNCnBlcm1hbmVudGx5Lg0KDQpTaW1pbGFyIHRvIGhhbmRsZV9haW9j
Yl93cml0ZV96ZXJvZXNfdW5tYXAsIGhhbmRsZV9haW9jYl93cml0ZV96ZXJvZXNfYmxvY2sNCmFs
bG93IC1FQlVTWSBhbmQgLUVJTlZBTCBlcnJvcnMgZHVyaW5nIGlvY3RsKGZkLCBCTEtaRVJPT1VU
LCByYW5nZSkuDQoNClJlZmVyZW5jZSBjb21taXQgaW4gTGludXggNS4xMDoNCmh0dHBzOi8vZ2l0
Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3N0YWJsZS9saW51eC5naXQvY29t
bWl0Lz9pZD0zODRkODdlZjJjOTU0ZmM1OGU2YzVmZDgyNTNlNGExOTg0ZjVmZTAyDQoNCkFsdGhv
dWdoIGl0IHdpbGwgYmUgZml4ZWQgaW4gNS4xMiwgSSB0aGluayBpdCdzIGdvb2QgdG8gYXZvaWQg
c2ltaWxhciBwcm9ibGVtIGluIHRoZSBmdXR1cmUuDQpodHRwczovL2xvcmUua2VybmVsLm9yZy9s
aW51eC1ibG9jay81MzY4OWE2Ny03NTkxLTBhZDgtM2U3ZC1kY2E5YTYyNmNkOTlAa2VybmVsLmRr
Lw0KDQpTaWduZWQtb2ZmLWJ5OiBDaGFuZ0xpbWluIDxjaGFuZ2xtQGNoaW5hdGVsZWNvbS5jbj4N
Ci0tLQ0KIGJsb2NrL2ZpbGUtcG9zaXguYyB8IDkgKysrKysrKy0tDQogMSBmaWxlIGNoYW5nZWQs
IDcgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2Jsb2NrL2Zp
bGUtcG9zaXguYyBiL2Jsb2NrL2ZpbGUtcG9zaXguYw0KaW5kZXggMDUwNzliNDBjYS4uNGUxMzJk
YjkyOSAxMDA2NDQNCi0tLSBhL2Jsb2NrL2ZpbGUtcG9zaXguYw0KKysrIGIvYmxvY2svZmlsZS1w
b3NpeC5jDQpAQCAtMTYyOSw4ICsxNjI5LDEzIEBAIHN0YXRpYyBzc2l6ZV90IGhhbmRsZV9haW9j
Yl93cml0ZV96ZXJvZXNfYmxvY2soUmF3UG9zaXhBSU9EYXRhICphaW9jYikNCiAgICAgICAgIH0g
d2hpbGUgKGVycm5vID09IEVJTlRSKTsNCg0KICAgICAgICAgcmV0ID0gdHJhbnNsYXRlX2Vycigt
ZXJybm8pOw0KLSAgICAgICAgaWYgKHJldCA9PSAtRU5PVFNVUCkgew0KLSAgICAgICAgICAgIHMt
Pmhhc193cml0ZV96ZXJvZXMgPSBmYWxzZTsNCisgICAgICAgIHN3aXRjaCAocmV0KSB7DQorICAg
ICAgICBjYXNlIC1FTk9UU1VQOg0KKyAgICAgICAgICAgIHMtPmhhc193cml0ZV96ZXJvZXMgPSBm
YWxzZTsgLyogZmFsbCB0aHJvdWdoICovDQorICAgICAgICBjYXNlIC1FSU5WQUw6DQorICAgICAg
ICBjYXNlIC1FQlVTWToNCisgICAgICAgICAgICByZXR1cm4gLUVOT1RTVVA7DQorICAgICAgICAg
ICAgYnJlYWs7DQogICAgICAgICB9DQogICAgIH0NCiAjZW5kaWYNCi0tDQoyLjI3LjANCg0K

------=_001_NextPart334842552472_=----
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charse=
t=3Dus-ascii"><style>body { line-height: 1.5; }body { font-size: 14px; fon=
t-family: 'Microsoft YaHei UI'; color: rgb(0, 0, 0); line-height: 1.5; }</=
style></head><body>=0A<div><span></span><div><div><span style=3D"line-heig=
ht: 1.5; background-color: transparent;">Since Linux 5.10, write zeros to =
a multipath device using</span></div><div>ioctl(fd, BLKZEROOUT, range) wit=
h cache none or directsync return -EBUSY</div><div>permanently.</div><div>=
<br></div><div>Similar to handle_aiocb_write_zeroes_unmap, handle_aiocb_wr=
ite_zeroes_block</div><div>allow -EBUSY and -EINVAL errors during ioctl(fd=
, BLKZEROOUT, range).</div><div><br></div><div>Reference commit in Linux 5=
.10:</div><div><a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/=
stable/linux.git/commit/?id=3D384d87ef2c954fc58e6c5fd8253e4a1984f5fe02" mi=
crosoft=3D"" yahei=3D"" ui';=3D"" font-size:=3D"" 14px;=3D"" font-weight:=
=3D"" normal;=3D"" font-style:=3D"" normal;'=3D"" style=3D"line-height: 1.=
5; background-color: transparent;">https://git.kernel.org/pub/scm/linux/ke=
rnel/git/stable/linux.git/commit/?id=3D384d87ef2c954fc58e6c5fd8253e4a1984f=
5fe02</a></div><div><br></div><div>Although it will be fixed in 5.12, I th=
ink it's good to avoid similar problem in the future.</div><div><span micr=
osoft=3D"" yahei=3D"" ui';=3D"" font-size:=3D"" 14px;=3D"" color:=3D"" rgb=
(0,=3D"" 0,=3D"" 0);=3D"" background-color:=3D"" rgba(0,=3D"" font-weight:=
=3D"" normal;=3D"" font-style:=3D"" normal;text-decoration:=3D"" none;'=3D=
"" style=3D"line-height: 1.5; background-color: transparent;"><a href=3D"h=
ttps://lore.kernel.org/linux-block/53689a67-7591-0ad8-3e7d-dca9a626cd99@ke=
rnel.dk/">https://lore.kernel.org/linux-block/53689a67-7591-0ad8-3e7d-dca9=
a626cd99@kernel.dk/</a></span></div><span microsoft=3D"" yahei=3D"" ui';=
=3D"" font-size:=3D"" 14px;=3D"" color:=3D"" rgb(0,=3D"" 0,=3D"" 0);=3D"" =
background-color:=3D"" rgba(0,=3D"" font-weight:=3D"" normal;=3D"" font-st=
yle:=3D"" normal;text-decoration:=3D"" none;'=3D""></span><div><br></div><=
div>Signed-off-by: ChangLimin &lt;changlm@chinatelecom.cn&gt;</div><div>--=
-</div><div>&nbsp;block/file-posix.c | 9 +++++++--</div><div>&nbsp;1 file =
changed, 7 insertions(+), 2 deletions(-)</div><div><br></div><div>diff --g=
it a/block/file-posix.c b/block/file-posix.c</div><div>index 05079b40ca..4=
e132db929 100644</div><div>--- a/block/file-posix.c</div><div>+++ b/block/=
file-posix.c</div><div>@@ -1629,8 +1629,13 @@ static ssize_t handle_aiocb_=
write_zeroes_block(RawPosixAIOData *aiocb)</div><div>&nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;} while (errno =3D=3D EINTR);</div><div><br></div><div>&nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;ret =3D translate_err(-errno);</div><div>- &nb=
sp; &nbsp; &nbsp; &nbsp;if (ret =3D=3D -ENOTSUP) {</div><div>- &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;s-&gt;has_write_zeroes =3D false;</div><div>=
+ &nbsp; &nbsp; &nbsp; &nbsp;switch (ret) {</div><div>+ &nbsp; &nbsp; &nbs=
p; &nbsp;case -ENOTSUP:</div><div>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;s-&gt;has_write_zeroes =3D false; /* fall through */</div><div>+ &nbsp;=
 &nbsp; &nbsp; &nbsp;case -EINVAL:</div><div>+ &nbsp; &nbsp; &nbsp; &nbsp;=
case -EBUSY:</div><div>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return -=
ENOTSUP;</div><div>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>=
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div><div>&nbsp; &nbsp; &nbsp;}</=
div><div>&nbsp;#endif</div><div>--</div><div>2.27.0</div></div></div><div>=
<br></div>=0A</body></html>
------=_001_NextPart334842552472_=------


