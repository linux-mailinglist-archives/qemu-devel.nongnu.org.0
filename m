Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDB42FE6DC
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 10:57:27 +0100 (CET)
Received: from localhost ([::1]:33368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2WiU-0002CZ-RK
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 04:57:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=648267919=acatan@amazon.com>)
 id 1l2Wgc-0001ey-Sd
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 04:55:31 -0500
Received: from smtp-fw-33001.amazon.com ([207.171.190.10]:52593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=648267919=acatan@amazon.com>)
 id 1l2WgZ-00076F-Jt
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 04:55:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1611222928; x=1642758928;
 h=from:to:cc:date:message-id:references:in-reply-to:
 content-id:mime-version:content-transfer-encoding:subject;
 bh=tikY/ymWGHG7OvzSMWQNvUsnxukhLkfx1pylHsOnXHM=;
 b=gVzEFxN1lY6QobIDcYAghzPXgWNr4fNGCyMIsEXDx3yKrj4N1Ck/gKEe
 l4L7GPA+vGv0tglQT4Z97nMztaXh0trBDi+IXA9yzRYxHp02qAOSFH0KR
 1D1ol7/Bz8pqUOCLIZiC9UotdmKbxy1V0BfEsX6fqZJwuchs2gHCQxt8G w=;
X-IronPort-AV: E=Sophos;i="5.79,363,1602547200"; d="scan'208";a="112521061"
Subject: Re: [PATCH v4 1/2] drivers/misc: sysgenid: add system generation id
 driver
Thread-Topic: [PATCH v4 1/2] drivers/misc: sysgenid: add system generation id
 driver
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1a-715bee71.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 21 Jan 2021 09:55:14 +0000
Received: from EX13MTAUEE001.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
 by email-inbound-relay-1a-715bee71.us-east-1.amazon.com (Postfix) with ESMTPS
 id CA814A25BB; Thu, 21 Jan 2021 09:55:03 +0000 (UTC)
Received: from EX13D08UEE004.ant.amazon.com (10.43.62.182) by
 EX13MTAUEE001.ant.amazon.com (10.43.62.226) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 21 Jan 2021 09:54:28 +0000
Received: from EX13D08EUB004.ant.amazon.com (10.43.166.158) by
 EX13D08UEE004.ant.amazon.com (10.43.62.182) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 21 Jan 2021 09:54:27 +0000
Received: from EX13D08EUB004.ant.amazon.com ([10.43.166.158]) by
 EX13D08EUB004.ant.amazon.com ([10.43.166.158]) with mapi id 15.00.1497.010;
 Thu, 21 Jan 2021 09:54:27 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Thread-Index: AQHW6NzJ6Ner/CpAZ0GLGgCheKaWxKoj9j+AgA4QXAA=
Date: Thu, 21 Jan 2021 09:54:27 +0000
Message-ID: <0EFE3365-1698-4BFB-B2F2-BEF1A2634E45@amazon.com>
References: <1610453760-13812-1-git-send-email-acatan@amazon.com>
 <1610453760-13812-2-git-send-email-acatan@amazon.com>
 <X/2fP9LNWXvp7up9@kroah.com>
In-Reply-To: <X/2fP9LNWXvp7up9@kroah.com>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.195]
Content-Type: text/plain; charset="utf-8"
Content-ID: <AC44F688DB044F439484826026445BBE@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=207.171.190.10;
 envelope-from=prvs=648267919=acatan@amazon.com; helo=smtp-fw-33001.amazon.com
X-Spam_score_int: -120
X-Spam_score: -12.1
X-Spam_bar: ------------
X-Spam_report: (-12.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Jason@zx2c4.com" <Jason@zx2c4.com>,
 "dgunigun@redhat.com" <dgunigun@redhat.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "ghammer@redhat.com" <ghammer@redhat.com>,
 "vijaysun@ca.ibm.com" <vijaysun@ca.ibm.com>,
 "0x7f454c46@gmail.com" <0x7f454c46@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "mhocko@kernel.org" <mhocko@kernel.org>,
 "oridgar@gmail.com" <oridgar@gmail.com>, "avagin@gmail.com" <avagin@gmail.com>,
 "pavel@ucw.cz" <pavel@ucw.cz>,
 "ptikhomirov@virtuozzo.com" <ptikhomirov@virtuozzo.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "corbet@lwn.net" <corbet@lwn.net>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
 "mst@redhat.com" <mst@redhat.com>, "ebiggers@kernel.org" <ebiggers@kernel.org>,
 "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>, "Singh,
 Balbir" <sblbir@amazon.com>, "bonzini@gnu.org" <bonzini@gnu.org>,
 "Graf \(AWS\), Alexander" <graf@amazon.de>, "arnd@arndb.de" <arnd@arndb.de>,
 "jannh@google.com" <jannh@google.com>, "Weiss, Radu" <raduweis@amazon.com>,
 "asmehra@redhat.com" <asmehra@redhat.com>, "rppt@kernel.org" <rppt@kernel.org>,
 "luto@kernel.org" <luto@kernel.org>, "gil@azul.com" <gil@azul.com>,
 "MacCarthaigh, 
 Colm" <colmmacc@amazon.com>, "tytso@mit.edu" <tytso@mit.edu>,
 "ovzxemul@gmail.com" <ovzxemul@gmail.com>,
 "areber@redhat.com" <areber@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "ebiederm@xmission.com" <ebiederm@xmission.com>,
 "rafael@kernel.org" <rafael@kernel.org>, "w@1wt.eu" <w@1wt.eu>, "Woodhouse,
 David" <dwmw@amazon.co.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  "Catangiu, Adrian Costin" <acatan@amazon.com>
From: acatan--- via <qemu-devel@nongnu.org>

T24gMTIvMDEvMjAyMSwgMTU6MDcsICJHcmVnIEtIIiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5v
cmc+IHdyb3RlOg0KDQogICAgT24gVHVlLCBKYW4gMTIsIDIwMjEgYXQgMDI6MTU6NTlQTSArMDIw
MCwgQWRyaWFuIENhdGFuZ2l1IHdyb3RlOg0KICAgID4gKyAgUGFydGlhbCByZWFkcyBhcmUgbm90
IGFsbG93ZWQgLSByZWFkIGJ1ZmZlciBuZWVkcyB0byBiZSBhdCBsZWFzdA0KICAgID4gKyAgYGBz
aXplb2YodW5zaWduZWQpYGAgaW4gc2l6ZS4NCg0KICAgICJzaXplb2YodW5zaWduZWQpIj8gIEhv
dyBhYm91dCBiZWluZyBzcGVjaWZpYyBhbmQgbWFraW5nIHRoaXMgYSByZWFsICJYDQogICAgYml0
cyBiaWciIHZhbHVlIHBsZWFzZS4NCg0KICAgICJ1bnNpZ25lZCIgZG9lcyBub3Qgd29yayB3ZWxs
IGFjcm9zcyB1c2VyL2tlcm5lbCBib3VuZHJpZXMuICBPaywgdGhhdCdzDQogICAgb24gdW5kZXJz
dGF0ZW1lbnQsIHRoZSBjb3JyZWN0IHRoaW5nIGlzICJkb2VzIG5vdCB3b3JrIGF0IGFsbCIuDQoN
CiAgICBQbGVhc2UgYmUgc3BlY2lmaWMgaW4geW91ciBhcGlzLg0KDQogICAgVGhpcyBpcyBsaXN0
ZWQgZWxzZXdoZXJlIGFsc28uDQoNClJpZ2h0LCB3aWxsIGRvIQ0KDQogICAgPiArICAtIFNZU0dF
TklEX0dFVF9PVVREQVRFRF9XQVRDSEVSUzogaW1tZWRpYXRlbHkgcmV0dXJucyB0aGUgbnVtYmVy
IG9mDQogICAgPiArICAgICpvdXRkYXRlZCogd2F0Y2hlcnMgLSBudW1iZXIgb2YgZmlsZSBkZXNj
cmlwdG9ycyB0aGF0IHdlcmUgb3Blbg0KICAgID4gKyAgICBkdXJpbmcgYSBzeXN0ZW0gZ2VuZXJh
dGlvbiBjaGFuZ2UsIGFuZCB3aGljaCBoYXZlIG5vdCB5ZXQgY29uZmlybWVkDQogICAgPiArICAg
IHRoZSBuZXcgZ2VuZXJhdGlvbiBjb3VudGVyLg0KDQogICAgQnV0IHRoaXMgbnVtYmVyIGNhbiBp
bnN0YW50bHkgY2hhbmdlIGFmdGVyIGl0IGlzIHJlYWQsIHdoYXQgZ29vZCBpcyBpdD8NCiAgICBJ
dCBzaG91bGQgbmV2ZXIgYmUgcmVsaWVkIG9uLCBzbyB3aHkgaXMgdGhpcyBuZWVkZWQgYXQgYWxs
Pw0KDQogICAgV2hhdCBjYW4gdXNlcnNwYWNlIGRvIHdpdGggdGhpcyBpbmZvcm1hdGlvbj8NCg0K
VGhhdCBpcyB0cnVlLCBhIHVzZXJzcGFjZSBwcm9jZXNzIGVpdGhlciBoYXMgdG8gd2FpdCBmb3Ig
YWxsIHRvIGFkanVzdCB0byB0aGUgbmV3IGdlbmVyYXRpb24NCm9yIG5vdCBjYXJlIGFib3V0IG90
aGVyIHByb2Nlc3Nlcy4gSW50ZXJtZWRpYXRlIHByb2JpbmcgZG9lc24ndCBicmluZyByZWFsIHZh
bHVlLiBXaWxsIHJlbW92ZS4NCg0KICAgIHRoYW5rcywNCg0KICAgIGdyZWcgay1oDQoNClRoYW5r
cyBmb3IgdGhlIGZlZWRiYWNrIQ0KQWRyaWFuLg0KDQoKCgpBbWF6b24gRGV2ZWxvcG1lbnQgQ2Vu
dGVyIChSb21hbmlhKSBTLlIuTC4gcmVnaXN0ZXJlZCBvZmZpY2U6IDI3QSBTZi4gTGF6YXIgU3Ry
ZWV0LCBVQkM1LCBmbG9vciAyLCBJYXNpLCBJYXNpIENvdW50eSwgNzAwMDQ1LCBSb21hbmlhLiBS
ZWdpc3RlcmVkIGluIFJvbWFuaWEuIFJlZ2lzdHJhdGlvbiBudW1iZXIgSjIyLzI2MjEvMjAwNS4K


