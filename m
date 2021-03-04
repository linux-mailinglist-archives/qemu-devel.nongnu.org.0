Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C9D32C398
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 01:16:22 +0100 (CET)
Received: from localhost ([::1]:37114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHbfA-0004Nd-VI
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 19:16:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <changlm@chinatelecom.cn>)
 id 1lHbe2-0003lm-Ss; Wed, 03 Mar 2021 19:15:10 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.219]:53223
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <changlm@chinatelecom.cn>)
 id 1lHbdy-0004eI-VQ; Wed, 03 Mar 2021 19:15:10 -0500
HMM_SOURCE_IP: 172.18.0.92:21301.1889739628
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-106.120.101.58?logid-8cd137a54d4d4cbb897ce07afb08d71e
 (unknown [172.18.0.92])
 by chinatelecom.cn (HERMES) with SMTP id 57CCA280083;
 Thu,  4 Mar 2021 08:14:55 +0800 (CST)
X-189-SAVE-TO-SEND: 71112636@chinatelecom.cn
Received: from  ([172.18.0.92])
 by App0021 with ESMTP id 8cd137a54d4d4cbb897ce07afb08d71e for
 nsoffer@redhat.com; Thu Mar  4 08:14:59 2021
X-Transaction-ID: 8cd137a54d4d4cbb897ce07afb08d71e
X-filter-score: filter<0>
X-Real-From: changlm@chinatelecom.cn
X-Receive-IP: 172.18.0.92
X-MEDUSA-Status: 0
Date: Thu, 4 Mar 2021 08:14:50 +0800
From: ChangLimin <changlm@chinatelecom.cn>
To: "Nir Soffer" <nsoffer@redhat.com>
Subject: Re: [PATCH] file-posix: allow -EBUSY errors during write zeros on
 block
References: <2021030209564214018344@chinatelecom.cn>, 
 <CAMRbyyu7CLz8ia5yS6WqA542adkJRmvv-Hj-ZPc8xwvr0-QyWA@mail.gmail.com>
X-Priority: 3
X-GUID: F61C77F6-27CB-4C9D-83D0-A8A0BC26DD66
X-Has-Attach: no
X-Mailer: Foxmail 7.2.17.58[cn]
Mime-Version: 1.0
Message-ID: <2021030408145060119660@chinatelecom.cn>
Content-Type: multipart/alternative;
 boundary="----=_001_NextPart850427742781_=----"
Received-SPF: pass client-ip=42.123.76.219;
 envelope-from=changlm@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 qemu-block <qemu-block@nongnu.org>, mreitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.

------=_001_NextPart850427742781_=----
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: base64

Pj4gQWZ0ZXIgTGludXggNS4xMCwgd3JpdGUgemVyb3MgdG8gYSBtdWx0aXBhdGggZGV2aWNlIHVz
aW5nDQo+PiBpb2N0bChmZCwgQkxLWkVST09VVCwgcmFuZ2UpIHdpdGggY2FjaGUgbm9uZSBvciBk
aXJlY3RzeW5jIHdpbGwgcmV0dXJuIEVCVVNZLg0KPj4NCj4+IFNpbWlsYXIgdG8gaGFuZGxlX2Fp
b2NiX3dyaXRlX3plcm9lc191bm1hcCwgaGFuZGxlX2Fpb2NiX3dyaXRlX3plcm9lc19ibG9jaw0K
Pj4gYWxsb3cgLUVCVVNZIGVycm9ycyBkdXJpbmcgaW9jdGwoZmQsIEJMS1pFUk9PVVQsIHJhbmdl
KS4NCj4+DQo+PiBSZWZlcmVuY2UgY29tbWl0IGluIExpbnV4IDUuMTA6DQo+PiBodHRwczovL2dp
dC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9zdGFibGUvbGludXguZ2l0L2Nv
bW1pdC8/aWQ9Mzg0ZDg3ZWYyYzk1NGZjNThlNmM1ZmQ4MjUzZTRhMTk4NGY1ZmUwMg0KPiANCj5C
dXQgdGhpcyBjYW4gaGFwcGVuIG9ubHkgd2hlbiB0aGUgYmxvY2sgZGV2aWNlIGlzIHVzZWQgYnkg
YSBmaWxlIHN5c3RlbSBvcg0KPm1heWJlIHNvbWVvbmUgZWxzZS4gSW4gcWVtdSB3ZSBhc3N1bWUg
dGhhdCB3ZSBhcmUgdGhlIG9ubHkgdXNlciBvZiB0aGUNCj5ibG9jayBkZXZpY2UsIHNvIEVCVVNZ
IGlzIGEgZmF0YWwgZXJyb3IgdGhhdCBzaG91bGQgbmV2ZXIgaGFwcGVuLCBubz8NCj4gDQo+Q2Fu
IHlvdSBleHBsYWluIGEgcmVhbCB3b3JsZCB1c2UgY2FzZSB3aGVuIHdlIGdldCBFQlVTWT8NCj4g
DQo+TmlyDQo+IA0KDQpQbGVhc2UgcmVmZXIgdG8gaHR0cHM6Ly9hY2Nlc3MucmVkaGF0LmNvbS9k
b2N1bWVudGF0aW9uL2VuLXVzL3JlZF9oYXRfZW50ZXJwcmlzZV9saW51eC84L2h0bWwvY29uZmln
dXJpbmdfZGV2aWNlX21hcHBlcl9tdWx0aXBhdGgvaW5kZXgNCldoZXJlIG11bHRpcGF0aCBpcyBj
b25maWd1cmVkIHRvIGEgU0FOIExVTiwgaW9jdGwoZmQsIEJMS1pFUk9PVVQsIHJhbmdlKQ0KdG8g
dGhlIC9kZXYvZG0teCByZXR1cm4gRUJVU1kgcGVybWFuZW50bHkgc2luY2UgTGludXggNS4xMC4N
Cg0KQ2hhbmdMaW1pbg0KDQo+PiBTaWduZWQtb2ZmLWJ5OiBDaGFuZ0xpbWluIDxjaGFuZ2xtQGNo
aW5hdGVsZWNvbS5jbj4NCj4+IC0tLQ0KPj4gIGJsb2NrL2ZpbGUtcG9zaXguYyB8IDcgKysrKysr
LQ0KPj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4+
DQo+PiBkaWZmIC0tZ2l0IGEvYmxvY2svZmlsZS1wb3NpeC5jIGIvYmxvY2svZmlsZS1wb3NpeC5j
DQo+PiBpbmRleCAwNTA3OWI0MGNhLi4zZTYwYzk2MjE0IDEwMDY0NA0KPj4gLS0tIGEvYmxvY2sv
ZmlsZS1wb3NpeC5jDQo+PiArKysgYi9ibG9jay9maWxlLXBvc2l4LmMNCj4+IEBAIC0xNjI5LDgg
KzE2MjksMTMgQEAgc3RhdGljIHNzaXplX3QgaGFuZGxlX2Fpb2NiX3dyaXRlX3plcm9lc19ibG9j
ayhSYXdQb3NpeEFJT0RhdGEgKmFpb2NiKQ0KPj4gICAgICAgICAgfSB3aGlsZSAoZXJybm8gPT0g
RUlOVFIpOw0KPj4NCj4+ICAgICAgICAgIHJldCA9IHRyYW5zbGF0ZV9lcnIoLWVycm5vKTsNCj4+
IC0gICAgICAgIGlmIChyZXQgPT0gLUVOT1RTVVApIHsNCj4+ICsgICAgICAgIHN3aXRjaCAocmV0
KSB7DQo+PiArICAgICAgICBjYXNlIC1FTk9UU1VQOg0KPj4gKyAgICAgICAgY2FzZSAtRUlOVkFM
Og0KPj4gKyAgICAgICAgY2FzZSAtRUJVU1k6DQo+PiAgICAgICAgICAgICAgcy0+aGFzX3dyaXRl
X3plcm9lcyA9IGZhbHNlOw0KPj4gKyAgICAgICAgICAgIHJldHVybiAtRU5PVFNVUDsNCj4+ICsg
ICAgICAgICAgICBicmVhazsNCj4+ICAgICAgICAgIH0NCj4+ICAgICAgfQ0KPj4gICNlbmRpZg0K
Pj4gLS0NCj4+IDIuMjcuMA0KPj4NCiANCiANCg==

------=_001_NextPart850427742781_=----
Content-Type: text/html;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charse=
t=3DUTF-8"><style>body { line-height: 1.5; }blockquote { margin-top: 0px; =
margin-bottom: 0px; margin-left: 0.5em; }body { font-size: 14px; font-fami=
ly: 'Microsoft YaHei UI'; color: rgb(0, 0, 0); line-height: 1.5; }</style>=
</head><body>=0A<div><span></span></div><blockquote style=3D"margin-Top: 0=
px; margin-Bottom: 0px; margin-Left: 0.5em; margin-Right: inherit"><div><d=
iv>&gt;&gt; After Linux 5.10, write zeros to a multipath device using</div=
><div>&gt;&gt; ioctl(fd, BLKZEROOUT, range) with cache none or directsync =
will return EBUSY.</div><div>&gt;&gt;</div><div>&gt;&gt; Similar to handle=
_aiocb_write_zeroes_unmap, handle_aiocb_write_zeroes_block</div><div>&gt;&=
gt; allow -EBUSY errors during ioctl(fd, BLKZEROOUT, range).</div><div>&gt=
;&gt;</div><div>&gt;&gt; Reference commit in Linux 5.10:</div><div>&gt;&gt=
; https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/=
?id=3D384d87ef2c954fc58e6c5fd8253e4a1984f5fe02</div><div>&gt;&nbsp;</div><=
div>&gt;But this can happen only when the block device is used by a file s=
ystem or</div><div>&gt;maybe someone else. In qemu we assume that we are t=
he only user of the</div><div>&gt;block device, so EBUSY is a fatal error =
that should never happen, no?</div><div>&gt;&nbsp;</div><div>&gt;Can you e=
xplain a real world use case when we get EBUSY?</div><div>&gt;&nbsp;</div>=
<div>&gt;Nir</div><div>&gt;&nbsp;</div><div><br></div><div>Please refer to=
 https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/=
html/configuring_device_mapper_multipath/index</div><div>Where multipath i=
s configured to a SAN LUN, ioctl(fd, BLKZEROOUT, range)</div><div>to the /=
dev/dm-x return EBUSY permanently since Linux 5.10.</div><div><br></div><d=
iv>ChangLimin</div><div><br></div><div>&gt;&gt; Signed-off-by: ChangLimin =
&lt;changlm@chinatelecom.cn&gt;</div><div>&gt;&gt; ---</div><div>&gt;&gt; =
&nbsp;block/file-posix.c | 7 ++++++-</div><div>&gt;&gt; &nbsp;1 file chang=
ed, 6 insertions(+), 1 deletion(-)</div><div>&gt;&gt;</div><div>&gt;&gt; d=
iff --git a/block/file-posix.c b/block/file-posix.c</div><div>&gt;&gt; ind=
ex 05079b40ca..3e60c96214 100644</div><div>&gt;&gt; --- a/block/file-posix=
.c</div><div>&gt;&gt; +++ b/block/file-posix.c</div><div>&gt;&gt; @@ -1629=
,8 +1629,13 @@ static ssize_t handle_aiocb_write_zeroes_block(RawPosixAIOD=
ata *aiocb)</div><div>&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} while (=
errno =3D=3D EINTR);</div><div>&gt;&gt;</div><div>&gt;&gt; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;ret =3D translate_err(-errno);</div><div>&gt;&gt; - &nb=
sp; &nbsp; &nbsp; &nbsp;if (ret =3D=3D -ENOTSUP) {</div><div>&gt;&gt; + &n=
bsp; &nbsp; &nbsp; &nbsp;switch (ret) {</div><div>&gt;&gt; + &nbsp; &nbsp;=
 &nbsp; &nbsp;case -ENOTSUP:</div><div>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nb=
sp;case -EINVAL:</div><div>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp;case -EBU=
SY:</div><div>&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;s-&=
gt;has_write_zeroes =3D false;</div><div>&gt;&gt; + &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;return -ENOTSUP;</div><div>&gt;&gt; + &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp;break;</div><div>&gt;&gt; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;}</div><div>&gt;&gt; &nbsp; &nbsp; &nbsp;}</div><div>&gt;&gt; &n=
bsp;#endif</div><div>&gt;&gt; --</div><div>&gt;&gt; 2.27.0</div><div>&gt;&=
gt;</div></div>=0A<div>&nbsp;</div>=0A<div>&nbsp;</div>=0A</blockquote>=0A=
</body></html>
------=_001_NextPart850427742781_=------


