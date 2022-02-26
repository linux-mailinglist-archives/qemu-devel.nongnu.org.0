Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2BA4C5506
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Feb 2022 10:54:55 +0100 (CET)
Received: from localhost ([::1]:57022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNtmv-0003G1-IP
	for lists+qemu-devel@lfdr.de; Sat, 26 Feb 2022 04:54:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luofei@unicloud.com>)
 id 1nNtl1-0002ZX-Ed
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 04:52:55 -0500
Received: from eage.unicloud.com ([220.194.70.58]:14523 helo=spam.unicloud.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luofei@unicloud.com>)
 id 1nNtkx-0001hW-Cd
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 04:52:54 -0500
Received: from eage.unicloud.com ([220.194.70.35])
 by spam.unicloud.com with ESMTP id 21Q9qZ68097417;
 Sat, 26 Feb 2022 17:52:35 +0800 (GMT-8)
 (envelope-from luofei@unicloud.com)
Received: from zgys-ex-mb09.Unicloud.com (10.10.0.24) by
 zgys-ex-mb09.Unicloud.com (10.10.0.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2375.17; Sat, 26 Feb 2022 17:52:34 +0800
Received: from zgys-ex-mb09.Unicloud.com ([fe80::eda0:6815:ca71:5aa]) by
 zgys-ex-mb09.Unicloud.com ([fe80::eda0:6815:ca71:5aa%16]) with mapi id
 15.01.2375.017; Sat, 26 Feb 2022 17:52:34 +0800
From: =?gb2312?B?wt63yQ==?= <luofei@unicloud.com>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: =?gb2312?B?tPC4tDogW1BBVENIXSBpMzg2OiBTZXQgTUNHX1NUQVRVU19SSVBWIGJpdCBm?=
 =?gb2312?Q?or_mce_SRAR_error?=
Thread-Topic: [PATCH] i386: Set MCG_STATUS_RIPV bit for mce SRAR error
Thread-Index: AQHYDdpiM0Sj+cD120OyD4W4YWbm6ayl0VSf
Date: Sat, 26 Feb 2022 09:52:34 +0000
Message-ID: <ba36a73514754da4ade170a1b39064d8@unicloud.com>
References: <20220120084634.131450-1-luofei@unicloud.com>
In-Reply-To: <20220120084634.131450-1-luofei@unicloud.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.10.1.7]
Content-Type: multipart/alternative;
 boundary="_000_ba36a73514754da4ade170a1b39064d8unicloudcom_"
MIME-Version: 1.0
X-DNSRBL: 
X-MAIL: spam.unicloud.com 21Q9qZ68097417
Received-SPF: pass client-ip=220.194.70.58; envelope-from=luofei@unicloud.com;
 helo=spam.unicloud.com
X-Spam_score_int: 37
X-Spam_score: 3.7
X-Spam_bar: +++
X-Spam_report: (3.7 / 5.0 requ) BAYES_00=-1.9, CHARSET_FARAWAY_HEADER=3.2,
 HTML_MESSAGE=0.001, MIME_CHARSET_FARAWAY=2.45, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_ba36a73514754da4ade170a1b39064d8unicloudcom_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

cGluZw0KDQpodHRwczovL3BhdGNoZXcub3JnL1FFTVUvMjAyMjAxMjAwODQ2MzQuMTMxNDUwLTEt
bHVvZmVpQHVuaWNsb3VkLmNvbS8NCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18N
CreivP7Iyzogwt63yQ0Kt6LLzcqxvOQ6IDIwMjLE6jHUwjIwyNUgMTY6NDY6MzQNCsrVvP7Iyzog
cWVtdS1kZXZlbA0Ks63LzTogUGFvbG8gQm9uemluaTsgTWFyY2VsbyBUb3NhdHRpOyBrdm1Admdl
ci5rZXJuZWwub3JnOyDC3rfJDQrW98ziOiBbUEFUQ0hdIGkzODY6IFNldCBNQ0dfU1RBVFVTX1JJ
UFYgYml0IGZvciBtY2UgU1JBUiBlcnJvcg0KDQpJbiB0aGUgcGh5c2ljYWwgbWFjaGluZSBlbnZp
cm9ubWVudCwgd2hlbiBhIFNSQVIgZXJyb3Igb2NjdXJzLA0KdGhlIElBMzJfTUNHX1NUQVRVUyBS
SVBWIGJpdCBpcyBzZXQsIGJ1dCBxZW11IGRvZXMgbm90IHNldCB0aGlzDQpiaXQuIFdoZW4gcWVt
dSBpbmplY3RzIGFuIFNSQVIgZXJyb3IgaW50byB2aXJ0dWFsIG1hY2hpbmUsIHRoZQ0KdmlydHVh
bCBtYWNoaW5lIGtlcm5lbCBqdXN0IGNhbGwgZG9fbWFjaGluZV9jaGVjaygpIHRvIGtpbGwgdGhl
DQpjdXJyZW50IHRhc2ssIGJ1dCBub3QgY2FsbCBtZW1vcnlfZmFpbHVyZSgpIHRvIGlzb2xhdGUg
dGhlIGZhdWx0eQ0KcGFnZSwgd2hpY2ggd2lsbCBjYXVzZSB0aGUgZmF1bHR5IHBhZ2UgdG8gYmUg
YWxsb2NhdGVkIGFuZCB1c2VkDQpyZXBlYXRlZGx5LiBJZiB1c2VkIGJ5IHRoZSB2aXJ0dWFsIG1h
Y2hpbmUga2VybmVsLCBpdCB3aWxsIGNhdXNlDQp0aGUgdmlydHVhbCBtYWNoaW5lIHRvIGNyYXNo
DQoNClNpZ25lZC1vZmYtYnk6IGx1b2ZlaSA8bHVvZmVpQHVuaWNsb3VkLmNvbT4NCi0tLQ0KIHRh
cmdldC9pMzg2L2t2bS9rdm0uYyB8IDIgKy0NCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkNCg0KZGlmZiAtLWdpdCBhL3RhcmdldC9pMzg2L2t2bS9rdm0uYyBi
L3RhcmdldC9pMzg2L2t2bS9rdm0uYw0KaW5kZXggMmM4ZmViNGE2Zi4uMTQ2NTU1NzdmMCAxMDA2
NDQNCi0tLSBhL3RhcmdldC9pMzg2L2t2bS9rdm0uYw0KKysrIGIvdGFyZ2V0L2kzODYva3ZtL2t2
bS5jDQpAQCAtNTM3LDcgKzUzNyw3IEBAIHN0YXRpYyB2b2lkIGt2bV9tY2VfaW5qZWN0KFg4NkNQ
VSAqY3B1LCBod2FkZHIgcGFkZHIsIGludCBjb2RlKQ0KDQogICAgIGlmIChjb2RlID09IEJVU19N
Q0VFUlJfQVIpIHsNCiAgICAgICAgIHN0YXR1cyB8PSBNQ0lfU1RBVFVTX0FSIHwgMHgxMzQ7DQot
ICAgICAgICBtY2dfc3RhdHVzIHw9IE1DR19TVEFUVVNfRUlQVjsNCisgICAgICAgIG1jZ19zdGF0
dXMgfD0gTUNHX1NUQVRVU19SSVBWIHwgTUNHX1NUQVRVU19FSVBWOw0KICAgICB9IGVsc2Ugew0K
ICAgICAgICAgc3RhdHVzIHw9IDB4YzA7DQogICAgICAgICBtY2dfc3RhdHVzIHw9IE1DR19TVEFU
VVNfUklQVjsNCi0tDQoyLjI3LjANCg0K

--_000_ba36a73514754da4ade170a1b39064d8unicloudcom_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
<meta content=3D"text/html; charset=3DUTF-8">
<style type=3D"text/css" style=3D"">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
<div dir=3D"ltr">
<div id=3D"x_divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size:12pt; col=
or:#000000; font-family:Calibri,Helvetica,sans-serif">
<p>ping</p>
<p><a href=3D"https://patchew.org/QEMU/20220120084634.131450-1-luofei@unicl=
oud.com/" class=3D"x_OWAAutoLink" id=3D"LPlnk253608">https://patchew.org/QE=
MU/20220120084634.131450-1-luofei@unicloud.com/</a><br>
</p>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>=B7=A2=BC=FE=C8=CB:</b> =C2=
=DE=B7=C9<br>
<b>=B7=A2=CB=CD=CA=B1=BC=E4:</b> 2022=C4=EA1=D4=C220=C8=D5 16:46:34<br>
<b>=CA=D5=BC=FE=C8=CB:</b> qemu-devel<br>
<b>=B3=AD=CB=CD:</b> Paolo Bonzini; Marcelo Tosatti; kvm@vger.kernel.org; =
=C2=DE=B7=C9<br>
<b>=D6=F7=CC=E2:</b> [PATCH] i386: Set MCG_STATUS_RIPV bit for mce SRAR err=
or</font>
<div>&nbsp;</div>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">In the physical machine environment, when a SRAR e=
rror occurs,<br>
the IA32_MCG_STATUS RIPV bit is set, but qemu does not set this<br>
bit. When qemu injects an SRAR error into virtual machine, the<br>
virtual machine kernel just call do_machine_check() to kill the<br>
current task, but not call memory_failure() to isolate the faulty<br>
page, which will cause the faulty page to be allocated and used<br>
repeatedly. If used by the virtual machine kernel, it will cause<br>
the virtual machine to crash<br>
<br>
Signed-off-by: luofei &lt;luofei@unicloud.com&gt;<br>
---<br>
&nbsp;target/i386/kvm/kvm.c | 2 &#43;-<br>
&nbsp;1 file changed, 1 insertion(&#43;), 1 deletion(-)<br>
<br>
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c<br>
index 2c8feb4a6f..14655577f0 100644<br>
--- a/target/i386/kvm/kvm.c<br>
&#43;&#43;&#43; b/target/i386/kvm/kvm.c<br>
@@ -537,7 &#43;537,7 @@ static void kvm_mce_inject(X86CPU *cpu, hwaddr padd=
r, int code)<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp; if (code =3D=3D BUS_MCEERR_AR) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; status |=3D MCI_STATUS_AR =
| 0x134;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mcg_status |=3D MCG_STATUS_EIPV=
;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mcg_status |=3D MCG_STATUS_=
RIPV | MCG_STATUS_EIPV;<br>
&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; status |=3D 0xc0;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mcg_status |=3D MCG_STATUS=
_RIPV;<br>
-- <br>
2.27.0<br>
<br>
</div>
</span></font>
</body>
</html>

--_000_ba36a73514754da4ade170a1b39064d8unicloudcom_--

