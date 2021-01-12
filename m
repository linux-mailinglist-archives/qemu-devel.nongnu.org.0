Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9112F32F6
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 15:32:35 +0100 (CET)
Received: from localhost ([::1]:43830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzKio-0005or-0C
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 09:32:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <biboshan23@gmail.com>)
 id 1kzFCb-0005iJ-Nq
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 03:38:57 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:37687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <biboshan23@gmail.com>)
 id 1kzFCZ-0002Oh-Qq
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 03:38:57 -0500
Received: by mail-pg1-x52b.google.com with SMTP id z21so978385pgj.4
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 00:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=wl57iA6uDUEf1OyE494fWe5Grtef4ryEENlC/tjj8eA=;
 b=GvNUQrG1t2IuMLugTnC2P0+KWFR7E/+HAb+EwstHMJ/UThwatbSQeF0d8Ugf9oMadN
 2xbVeHnlRbD9lPseVACUhCtdRt85LmRYtxDUGc1HsaNGD4e/3rRZWHX749MrgQWu94r6
 sBCSs6/GnpCXNyamJxpuinv16D6AjnHZUb0+LsIMLl2lqx7mxQZ5eF09yC7xSMbvpl+Y
 +YWqAA4fCP8EzIT0DeziZizGA3CSN2hEWfigwF6X1kZqQRQG5gmQrLhleVapgrNhCCLR
 wJvqo+fjLxt/Qojj/RMHaxb8K271sPr4t/m3qEx1P6DxygF7iU24OSnnJ/CIbAVKopDs
 D8AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=wl57iA6uDUEf1OyE494fWe5Grtef4ryEENlC/tjj8eA=;
 b=l5n1dyoN4/6nIPpzDTik6ezCc/bhq9ctPsYkGWzo00M+ww691/Qx7q+INRDvgSh8qG
 qXjgV2al3LdZ2CTzS8D0rnqk1u42sMixEyBkSDw+LYHL1CW++Ii/owbtHC2ol5oLkYTk
 Ovj2kSVcZMYNeoKPZtmxW73vi8RVufMSj0JtJZBrrZqRtSfqAiLJ6zkUUhxv53Vv3r04
 hsA5EWoW9+otRX+/vrCYDvFZlqsWT7sYwDiVa8YRsmcfLEluiTnsz8wGW0gshIgPDMPw
 sP9d8/a0wF581tlJMEtz4ZYLGTyi9f8TEWeGnC72NNBWowPmu1XAhi44dL6fKnQd8nHf
 FkMQ==
X-Gm-Message-State: AOAM53351GWwg4BtXYkiXFoUVM3Q3f4/1OlH/xuHbdqH15q5u1Tx2wsL
 wM5q9kBboxPzVpMcXwM90jrK2j0mYyxPOrQufUGmn+K74NihrA==
X-Google-Smtp-Source: ABdhPJwErdoVi8t+VuLNL+gsSCpNUocXUr0h9is0kPdu9dqB87aC+RmI9du6t1kkTojB7P+nFL3G56W+1OXhugXdP24=
X-Received: by 2002:a62:d113:0:b029:1a3:6213:d598 with SMTP id
 z19-20020a62d1130000b02901a36213d598mr3526200pfg.71.1610440733461; Tue, 12
 Jan 2021 00:38:53 -0800 (PST)
MIME-Version: 1.0
From: Biboshan Banerjee <biboshan23@gmail.com>
Date: Tue, 12 Jan 2021 14:08:42 +0530
Message-ID: <CAJeDGJiuhhad_fk-1cdLpP=GDEoYG0rtBKX5uMh68LrDefmXOg@mail.gmail.com>
Subject: MCFG File missing
To: qemu-devel@nongnu.org
Content-Type: multipart/mixed; boundary="000000000000dae8c205b8aff36e"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=biboshan23@gmail.com; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 12 Jan 2021 09:28:44 -0500
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

--000000000000dae8c205b8aff36e
Content-Type: multipart/alternative; boundary="000000000000dae8be05b8aff36c"

--000000000000dae8be05b8aff36c
Content-Type: text/plain; charset="UTF-8"

 Hi All,

I am trying to run the PCM tool ( https://github.com/opcm/pcm ) on a VM
running CentOS 7.4 running on the host OS CentOS 7.4.

The tool is trying to access  the " /sys/firmware/acpi/tables/MCFG " file.
The file is available on the host OS but not on the VM.   ( The error logs
are attached. )

How can this file be generated? on the VM?
I am using Qemu version 4.1.94

Thanks
Biboshan Banerjee.

--000000000000dae8be05b8aff36c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">=C2=A0Hi All,=C2=A0<div><br></div><div>I am trying to run =
the PCM tool (=C2=A0<a href=3D"https://github.com/opcm/pcm" target=3D"_blan=
k">https://github.com/opcm/pcm</a> ) on a VM running CentOS 7.4 running on =
the host OS CentOS 7.4.=C2=A0</div><div><br></div><div>The tool is trying t=
o access=C2=A0 the &quot; /sys/firmware/acpi/tables/MCFG &quot; file.=C2=A0=
</div><div>The file is available on the host OS but not on the VM.=C2=A0 =
=C2=A0( The error logs are attached. )=C2=A0</div><div><br></div><div>How c=
an this file be generated? on the VM?=C2=A0<br></div><div>I am using Qemu v=
ersion 4.1.94=C2=A0</div><div><br></div><div>Thanks=C2=A0</div><div>Bibosha=
n Banerjee.=C2=A0</div></div>

--000000000000dae8be05b8aff36c--

--000000000000dae8c205b8aff36e
Content-Type: text/plain; charset="US-ASCII"; name="pcm-memory_ERROR.txt"
Content-Disposition: attachment; filename="pcm-memory_ERROR.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_kjtqto8z0>
X-Attachment-Id: f_kjtqto8z0

W3Jvb3RAbG9jYWxob3N0IHBjbV0jIC4vcGNtLW1lbW9yeS54DQoNCiBQcm9jZXNzb3IgQ291bnRl
ciBNb25pdG9yOiBNZW1vcnkgQmFuZHdpZHRoIE1vbml0b3JpbmcgVXRpbGl0eSAgKCRGb3JtYXQ6
JWNpIElEPSVoJCkNCg0KIFRoaXMgdXRpbGl0eSBtZWFzdXJlcyBtZW1vcnkgYmFuZHdpZHRoIHBl
ciBjaGFubmVsIG9yIHBlciBESU1NIHJhbmsgaW4gcmVhbC10aW1lDQoNCkRldGVjdGVkIGEgaHlw
ZXJ2aXNvci92aXJ0dWFsaXphdGlvbiB0ZWNobm9sb2d5LiBTb21lIG1ldHJpY3MgbWlnaHQgbm90
IGJlIGF2YWlsYWJsZSBkdWUgdG8gY29uZmlndXJhdGlvbiBvciBhdmFpbGFiaWxpdHkgb2Ygdmly
dHVhbCBoYXJkd2FyZSBmZWF0dXJlcy4NCkxpbnV4IGFyY2hfcGVyZm1vbiBmbGFnICA6IHllcw0K
SUJSUyBhbmQgSUJQQiBzdXBwb3J0ZWQgIDogeWVzDQpTVElCUCBzdXBwb3J0ZWQgICAgICAgICAg
OiBubw0KU3BlYyBhcmNoIGNhcHMgc3VwcG9ydGVkIDogeWVzDQpJTkZPOiBSZWR1Y2luZyB0aGUg
bnVtYmVyIG9mIHByb2dyYW1tYWJsZSBjb3VudGVycyB0byAzIHRvIHdvcmthcm91bmQgdGhlIGZp
eGVkIGN5Y2xlIGNvdW50ZXIgdmlydHVhbGl6YXRpb24gaXNzdWUgb24gQVdTLg0KICAgICAgWW91
IGNhbiBkaXNhYmxlIHRoZSB3b3JrYXJvdW5kIGJ5IHNldHRpbmcgUENNX05PX0FXU19XT1JLQVJP
VU5EPTEgZW52aXJvbm1lbnQgdmFyaWFibGUNCk51bWJlciBvZiBwaHlzaWNhbCBjb3JlczogMTgN
Ck51bWJlciBvZiBsb2dpY2FsIGNvcmVzOiAxOA0KTnVtYmVyIG9mIG9ubGluZSBsb2dpY2FsIGNv
cmVzOiAxOA0KVGhyZWFkcyAobG9naWNhbCBjb3JlcykgcGVyIHBoeXNpY2FsIGNvcmU6IDENCk51
bSBzb2NrZXRzOiAxOA0KUGh5c2ljYWwgY29yZXMgcGVyIHNvY2tldDogMQ0KQ29yZSBQTVUgKHBl
cmZtb24pIHZlcnNpb246IDINCk51bWJlciBvZiBjb3JlIFBNVSBnZW5lcmljIChwcm9ncmFtbWFi
bGUpIGNvdW50ZXJzOiAzDQpXaWR0aCBvZiBnZW5lcmljIChwcm9ncmFtbWFibGUpIGNvdW50ZXJz
OiA0OCBiaXRzDQpOdW1iZXIgb2YgY29yZSBQTVUgZml4ZWQgY291bnRlcnM6IDMNCldpZHRoIG9m
IGZpeGVkIGNvdW50ZXJzOiA0OCBiaXRzDQpOb21pbmFsIGNvcmUgZnJlcXVlbmN5OiAyMTAwMDAw
MDAwIEh6DQpJQlJTIGVuYWJsZWQgaW4gdGhlIGtlcm5lbCAgIDogeWVzDQpTVElCUCBlbmFibGVk
IGluIHRoZSBrZXJuZWwgIDogbm8NClRoZSBwcm9jZXNzb3IgaXMgbm90IHN1c2NlcHRpYmxlIHRv
IFJvZ3VlIERhdGEgQ2FjaGUgTG9hZDogeWVzDQpUaGUgcHJvY2Vzc29yIHN1cHBvcnRzIGVuaGFu
Y2VkIElCUlMgICAgICAgICAgICAgICAgICAgICA6IHllcw0KUGFja2FnZSB0aGVybWFsIHNwZWMg
cG93ZXI6IDAgV2F0dDsgUGFja2FnZSBtaW5pbXVtIHBvd2VyOiAwIFdhdHQ7IFBhY2thZ2UgbWF4
aW11bSBwb3dlcjogMCBXYXR0Ow0KQ2FuJ3Qgb3BlbiBNQ0ZHIHRhYmxlLiBDaGVjayBwZXJtaXNz
aW9uIG9mIC9zeXMvZmlybXdhcmUvYWNwaS90YWJsZXMvTUNGRw0KQ2FuJ3Qgb3BlbiBNQ0ZHIHRh
YmxlLiBDaGVjayBwZXJtaXNzaW9uIG9mIC9zeXMvZmlybXdhcmUvYWNwaS90YWJsZXMvTUNGRzEN
CkNhbid0IG9wZW4gTUNGRyB0YWJsZS4gQ2hlY2sgcGVybWlzc2lvbiBvZiAvcGNtL3N5cy9maXJt
d2FyZS9hY3BpL3RhYmxlcy9NQ0ZHDQpDYW4ndCBvcGVuIE1DRkcgdGFibGUuIENoZWNrIHBlcm1p
c3Npb24gb2YgL3BjbS9zeXMvZmlybXdhcmUvYWNwaS90YWJsZXMvTUNGRzENCkNhbiBub3QgYWNj
ZXNzIHNlcnZlciB1bmNvcmUgUENJIGNvbmZpZ3VyYXRpb24gc3BhY2UuIEFjY2VzcyB0byB1bmNv
cmUgY291bnRlcnMgKG1lbW9yeSBhbmQgUVBJIGJhbmR3aWR0aCkgaXMgZGlzYWJsZWQuDQpZb3Ug
bXVzdCBiZSByb290IHRvIGFjY2VzcyBzZXJ2ZXIgdW5jb3JlIGNvdW50ZXJzIGluIFBDTS4NCg0K
RGV0ZWN0ZWQgSW50ZWwoUikgWGVvbihSKSBHb2xkIDYyMzhNIENQVSBAIDIuMTBHSHogIkludGVs
KHIpIG1pY3JvYXJjaGl0ZWN0dXJlIGNvZGVuYW1lIENhc2NhZGUgTGFrZS1TUCIgc3RlcHBpbmcg
NyBtaWNyb2NvZGUgbGV2ZWwgMHgxDQpBY2Nlc3MgdG8gUHJvY2Vzc29yIENvdW50ZXIgTW9uaXRv
ciBoYXMgZGVuaWVkIChubyBNU1Igb3IgUENJIENGRyBzcGFjZSBhY2Nlc3MpLg0KQ2xlYW5pbmcg
dXANCiBaZXJvZWQgdW5jb3JlIFBNVSByZWdpc3RlcnM=
--000000000000dae8c205b8aff36e--

