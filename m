Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9DEF1248E
	for <lists+qemu-devel@lfdr.de>; Fri,  3 May 2019 00:25:58 +0200 (CEST)
Received: from localhost ([127.0.0.1]:59300 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hMK9N-00045C-Pw
	for lists+qemu-devel@lfdr.de; Thu, 02 May 2019 18:25:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45044)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <driver1998@foxmail.com>) id 1hMK8J-0003hw-AU
	for qemu-devel@nongnu.org; Thu, 02 May 2019 18:24:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <driver1998@foxmail.com>) id 1hMK8I-0002GD-6q
	for qemu-devel@nongnu.org; Thu, 02 May 2019 18:24:51 -0400
Received: from smtpbgsg2.qq.com ([54.254.200.128]:50898)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <driver1998@foxmail.com>)
	id 1hMK8H-0002DO-DT
	for qemu-devel@nongnu.org; Thu, 02 May 2019 18:24:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1556835877;
	bh=hTVQtuhslYMBK8jsw9MXUT8Xvr8+CbSUWPMaX1HkK4g=;
	h=From:To:Subject:Mime-Version:Date:Message-ID;
	b=NwDoh7zV43jMpmfLgyhyTATz3r3RhFhNAa/EXb5CW9WfjScg4KM9L/c0+DAxC4L6c
	5hdGf5xl+rx/t9JrE44qzmqm7w8uy9eaZRfdmC1XBFrrzuW9PtVKk5elM7DuDdHWWr
	xHpyGJAg4lrGGoiwS5pIu1UYdyJdZu2h+b/zRai8=
X-QQ-FEAT: SDGPAIwMd/K8eE+AtiojIhfeAfBv2egiE4w/CwVUd7Lfzr4LQFIz45/32iNjw
	rV++yx99nYmefqpxCUsqkfkf2aiFn/+khWkHtSWeRYU1jJI9mTxJOvt+zTNUMgFf3qvCngj
	WXLKlU+diCsQXkdjU8N3areVOIkAUWqxR6ZP7BDZjFy09fAuSLE4XRGTVFXhGEeXUiIr2no
	gEEDRPqNoRpXSOLylactRVoBsWtxsyBuWmmPEZPR6A0Nv1FNGUZwe4bM/rGKvyy3VkuD6jm
	WhAhejYT30QTHt
X-QQ-SSF: 000000000000003000000000000000P
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 183.63.18.252
In-Reply-To: <d23b59fa-2909-f124-3aab-cc5ded90f063@redhat.com>
References: <tencent_9962D5F9426BA267581CCB79DB1FE17AD508@qq.com>
	<d23b59fa-2909-f124-3aab-cc5ded90f063@redhat.com>
X-QQ-STYLE: 
X-QQ-mid: webmail122t1556835876t6672583
From: "=?ISO-8859-1?B?R0ggQ2Fv?=" <driver1998@foxmail.com>
To: "=?ISO-8859-1?B?RXJpYyBCbGFrZQ==?=" <eblake@redhat.com>,
	"=?ISO-8859-1?B?cWVtdS1kZXZlbA==?=" <qemu-devel@nongnu.org>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="ISO-8859-1"
Content-Transfer-Encoding: base64
Date: Fri, 3 May 2019 06:24:36 +0800
X-Priority: 3
Message-ID: <tencent_EE29897A62292DA76CA785FB55AF5507090A@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-ReplyHash: 1164750064
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1]) by smtp.qq.com (ESMTP) with SMTP
	id ; Fri, 03 May 2019 06:24:37 +0800 (CST)
Feedback-ID: webmail:foxmail.com:bgforeign:bgforeign4
X-QQ-Bgrelay: 1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 54.254.200.128
Subject: Re: [Qemu-devel] [PATCH v2 2/4] qga: Fix an enum conversion
 warningincommands-win32.c, hit by clang.
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T24gNS8zLzE5IDY6MjAgQU0sIEVyaWMgQmxha2Ugd3JvdGU6DQoNCj4gV2hlcmUgaXMgZW51
bSBTVE9SQUdFX0JVU19UWVBFIGRlZmluZWQ/IA0KSW4gdGhlIFdpbmRvd3MgU0RLICh3aW5p
b2N0bC5oKSwgc28gYSB0d28td2F5IGNvbnZlcnNpb24gdGFibGUgaXMgbmVlZGVkLg0KDQo+
IEluIGZhY3QsIGl0IGxvb2tzIGxpa2Ugd2luMnFlbXVbXSBpcyBzdXBwb3NlZCB0byBiZSB0
aGF0IHRhYmxlLA0KPiBidXQgaXQgd2FzIGluY29ycmVjdGx5IHdyaXR0ZW4uICBZb3UgV0FO
VCB0byBkbzoNCg0KPiBkaWZmIC0tZ2l0IGkvcWdhL2NvbW1hbmRzLXdpbjMyLmMgdy9xZ2Ev
Y29tbWFuZHMtd2luMzIuYw0KPiBpbmRleCBkNDBkNjFmNjA1Yy4uNmI2N2YxNmZhZjEgMTAw
NjQ0DQo+IC0tLSBpL3FnYS9jb21tYW5kcy13aW4zMi5jDQo+ICsrKyB3L3FnYS9jb21tYW5k
cy13aW4zMi5jDQo+IEBAIC00NTcsNyArNDU3LDcgQEAgdm9pZCBxbXBfZ3Vlc3RfZmlsZV9m
bHVzaChpbnQ2NF90IGhhbmRsZSwgRXJyb3IgKiplcnJwKQ0KPg0KPiAjaWZkZWYgQ09ORklH
X1FHQV9OVEREU0NTSQ0KPg0KPiAtc3RhdGljIFNUT1JBR0VfQlVTX1RZUEUgd2luMnFlbXVb
XSA9IHsNCj4gK3N0YXRpYyBHdWVzdERpc2tCdXNUeXBlIHdpbjJxZW11W10gPSB7DQo+ICAg
ICBbQnVzVHlwZVVua25vd25dID0gR1VFU1RfRElTS19CVVNfVFlQRV9VTktOT1dOLA0KPiAg
ICAgW0J1c1R5cGVTY3NpXSA9IEdVRVNUX0RJU0tfQlVTX1RZUEVfU0NTSSwNCj4gICAgIFtC
dXNUeXBlQXRhcGldID0gR1VFU1RfRElTS19CVVNfVFlQRV9JREUsDQo+DQo+IHdpdGggbm8g
Y2FzdHMgbmVlZGVkLCBlaXRoZXIgaW4gdGhlIHRhYmxlIG9yIGluIHRoZSBmdW5jdGlvbiB0
aGF0DQo+IHJlZmVyZW5jZXMgdGhlIHRhYmxlLg0KDQpZZXMsIEkgY2FuIGNvbmZpcm0gdGhh
dCBmaXhlcyB0aGUgaXNzdWUsIGFuZCBjbGVhcmx5IGJldHRlciB0aGFuIG15IHByZXZpb3Vz
IGVmZm9ydC4NCkknbGwgdXNlIHRoaXMgaW5zdGVhZCBpbiBteSB1cGNvbWluZyB2MyBwYXRj
aCBzZXQu




