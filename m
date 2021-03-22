Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF57343CC2
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 10:28:14 +0100 (CET)
Received: from localhost ([::1]:47882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOGr6-0000HT-1Y
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 05:28:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <changlm@chinatelecom.cn>)
 id 1lOGot-0007Ir-RN; Mon, 22 Mar 2021 05:25:57 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.219]:34059
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <changlm@chinatelecom.cn>)
 id 1lOGoq-0001qX-Mz; Mon, 22 Mar 2021 05:25:55 -0400
HMM_SOURCE_IP: 172.18.0.92:23091.1148938065
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-106.120.101.58?logid-904cfd7ec8f04a0a81bcb2780626ce66
 (unknown [172.18.0.92])
 by chinatelecom.cn (HERMES) with SMTP id 626142800DD;
 Mon, 22 Mar 2021 17:25:37 +0800 (CST)
X-189-SAVE-TO-SEND: 71112636@chinatelecom.cn
Received: from  ([172.18.0.92])
 by App0021 with ESMTP id 904cfd7ec8f04a0a81bcb2780626ce66 for
 qemu-block@nongnu.org; Mon Mar 22 17:25:44 2021
X-Transaction-ID: 904cfd7ec8f04a0a81bcb2780626ce66
X-filter-score: filter<0>
X-Real-From: changlm@chinatelecom.cn
X-Receive-IP: 172.18.0.92
X-MEDUSA-Status: 0
Date: Mon, 22 Mar 2021 17:25:32 +0800
From: ChangLimin <changlm@chinatelecom.cn>
To: qemu-block <qemu-block@nongnu.org>
Subject: [PATCH V4] file-posix: allow -EBUSY error during ioctl(fd, BLKZEROOUT,
 range) on block
X-Priority: 3
X-GUID: E740AFB9-7C56-4866-AAD4-515CE2C1B725
X-Has-Attach: no
X-Mailer: Foxmail 7.2.17.58[cn]
Mime-Version: 1.0
Message-ID: <2021032217253258728710@chinatelecom.cn>
Content-Type: multipart/alternative;
 boundary="----=_001_NextPart748677062475_=----"
Received-SPF: pass client-ip=42.123.76.219;
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
Cc: kwolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel <qemu-devel@nongnu.org>, mreitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.

------=_001_NextPart748677062475_=----
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: base64

Rm9yIExpbnV4IDUuMTAvNS4xMSwgcWVtdSB3cml0ZSB6ZXJvcyB0byBhIG11bHRpcGF0aCBkZXZp
Y2UgdXNpbmcNCmlvY3RsKGZkLCBCTEtaRVJPT1VULCByYW5nZSkgd2l0aCBjYWNoZSBub25lIG9y
IGRpcmVjdHN5bmMgcmV0dXJuIC1FQlVTWQ0KcGVybWFuZW50bHkuIEZhbGxiYWNrIHRvIHB3cml0
ZXYgaW5zdGVhZCBvZiBleGl0IGZvciAtRUJVU1kgZXJyb3IuDQoNClRoZSBpc3N1ZSB3YXMgaW50
cm9kdWNlZCBpbiBMaW51eCA1LjEwOg0KaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xp
bnV4L2tlcm5lbC9naXQvc3RhYmxlL2xpbnV4LmdpdC9jb21taXQvP2lkPTM4NGQ4N2VmMmM5NTRm
YzU4ZTZjNWZkODI1M2U0YTE5ODRmNWZlMDINCg0KRml4ZWQgaW4gTGludXggNS4xMjoNCmh0dHBz
Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4
LmdpdC9jb21taXQvP2lkPTU2ODg3Y2ZmZTk0NmJiMGE5MGM3NDQyOWZhOTRkNjExMGE3MzExOWQN
Cg0KU2lnbmVkLW9mZi1ieTogQ2hhbmdMaW1pbiA8Y2hhbmdsbUBjaGluYXRlbGVjb20uY24+DQot
LS0NCiBibG9jay9maWxlLXBvc2l4LmMgfCA4ICsrKysrKy0tDQogMSBmaWxlIGNoYW5nZWQsIDYg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2Jsb2NrL2ZpbGUt
cG9zaXguYyBiL2Jsb2NrL2ZpbGUtcG9zaXguYw0KaW5kZXggMjBlMTRmOGU5Ni4uZDQwNTRhYzlj
YiAxMDA2NDQNCi0tLSBhL2Jsb2NrL2ZpbGUtcG9zaXguYw0KKysrIGIvYmxvY2svZmlsZS1wb3Np
eC5jDQpAQCAtMTYyNCw4ICsxNjI0LDEyIEBAIHN0YXRpYyBzc2l6ZV90IGhhbmRsZV9haW9jYl93
cml0ZV96ZXJvZXNfYmxvY2soUmF3UG9zaXhBSU9EYXRhICphaW9jYikNCiAgICAgICAgIH0gd2hp
bGUgKGVycm5vID09IEVJTlRSKTsNCg0KICAgICAgICAgcmV0ID0gdHJhbnNsYXRlX2VycigtZXJy
bm8pOw0KLSAgICAgICAgaWYgKHJldCA9PSAtRU5PVFNVUCkgew0KLSAgICAgICAgICAgIHMtPmhh
c193cml0ZV96ZXJvZXMgPSBmYWxzZTsNCisgICAgICAgIHN3aXRjaCAocmV0KSB7DQorICAgICAg
ICBjYXNlIC1FTk9UU1VQOg0KKyAgICAgICAgICAgIHMtPmhhc193cml0ZV96ZXJvZXMgPSBmYWxz
ZTsgLyogZmFsbCB0aHJvdWdoICovDQorICAgICAgICBjYXNlIC1FQlVTWTogLyogTGludXggNS4x
MC81LjExIG1heSByZXR1cm4gLUVCVVNZIGZvciBtdWx0aXBhdGggZGV2aWNlcyAqLw0KKyAgICAg
ICAgICAgIHJldHVybiAtRU5PVFNVUDsNCisgICAgICAgICAgICBicmVhazsNCiAgICAgICAgIH0N
CiAgICAgfQ0KICNlbmRpZg0KLS0NCjIuMjcuMA0KDQo=

------=_001_NextPart748677062475_=----
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charse=
t=3Dus-ascii"><style>body { line-height: 1.5; }body { font-size: 14px; fon=
t-family: 'Microsoft YaHei UI'; color: rgb(0, 0, 0); line-height: 1.5; }</=
style></head><body>=0A<div><span></span><div><span style=3D"line-height: 1=
.5; background-color: transparent;">For Linux 5.10/5.11, qemu write zeros =
to a multipath device using</span></div><div>ioctl(fd, BLKZEROOUT, range) =
with cache none or directsync return -EBUSY</div><div>permanently. Fallbac=
k to pwritev instead of exit for -EBUSY error.</div><div><br></div><div>Th=
e issue was introduced in Linux 5.10:</div><div>https://git.kernel.org/pub=
/scm/linux/kernel/git/stable/linux.git/commit/?id=3D384d87ef2c954fc58e6c5f=
d8253e4a1984f5fe02</div><div><br></div><div>Fixed in Linux 5.12:</div><div=
>https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D56887cffe946bb0a90c74429fa94d6110a73119d</div><div><br></div><div>S=
igned-off-by: ChangLimin &lt;changlm@chinatelecom.cn&gt;</div><div>---</di=
v><div>&nbsp;block/file-posix.c | 8 ++++++--</div><div>&nbsp;1 file change=
d, 6 insertions(+), 2 deletions(-)</div><div><br></div><div>diff --git a/b=
lock/file-posix.c b/block/file-posix.c</div><div>index 20e14f8e96..d4054ac=
9cb 100644</div><div>--- a/block/file-posix.c</div><div>+++ b/block/file-p=
osix.c</div><div>@@ -1624,8 +1624,12 @@ static ssize_t handle_aiocb_write_=
zeroes_block(RawPosixAIOData *aiocb)</div><div>&nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;} while (errno =3D=3D EINTR);</div><div><br></div><div>&nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;ret =3D translate_err(-errno);</div><div>- &nbsp; &n=
bsp; &nbsp; &nbsp;if (ret =3D=3D -ENOTSUP) {</div><div>- &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp;s-&gt;has_write_zeroes =3D false;</div><div>+ &nbs=
p; &nbsp; &nbsp; &nbsp;switch (ret) {</div><div>+ &nbsp; &nbsp; &nbsp; &nb=
sp;case -ENOTSUP:</div><div>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;s-&=
gt;has_write_zeroes =3D false; /* fall through */</div><div>+ &nbsp; &nbsp=
; &nbsp; &nbsp;case -EBUSY: /* Linux 5.10/5.11 may return -EBUSY for multi=
path devices */</div><div>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;retur=
n -ENOTSUP;</div><div>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</d=
iv><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div><div>&nbsp; &nbsp; &nbsp;=
}</div><div>&nbsp;#endif</div><div>--</div><div>2.27.0</div></div><div><br=
></div>=0A</body></html>
------=_001_NextPart748677062475_=------


