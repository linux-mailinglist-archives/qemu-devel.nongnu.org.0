Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FD030E0DD
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 18:24:00 +0100 (CET)
Received: from localhost ([::1]:42804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Lsl-0007ep-W1
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 12:24:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=661eeea40=graf@amazon.de>)
 id 1l7LgW-00027U-VB
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 12:11:22 -0500
Received: from smtp-fw-9103.amazon.com ([207.171.188.200]:39889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=661eeea40=graf@amazon.de>)
 id 1l7LgT-0002Ha-Dw
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 12:11:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1612372277; x=1643908277;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=ugcddGCMXbWoOu3Z7xDe6SGdEgISKYvIni3YqmUng+s=;
 b=uQBlNjMXyIQUwxyQjRTc6MzMXkq4ZchLlWgQbcBZ26xgvDSO/eO2Wl2T
 ZyD0oaXAU2kHPBsoDgE0JWdMX+sV6RbebJ8dqNR9L10N2+FKWvhUEx/Eh
 T4bxuhc2ItMoeX399m4LV9SBXdjTjkQXQnam89iCq0MdHrKmXep6tDk7M 0=;
X-IronPort-AV: E=Sophos;i="5.79,398,1602547200"; d="scan'208";a="915401881"
Received: from sea3-co-svc-lb6-vlan3.sea.amazon.com (HELO
 email-inbound-relay-2a-d0be17ee.us-west-2.amazon.com) ([10.47.22.38])
 by smtp-border-fw-out-9103.sea19.amazon.com with ESMTP;
 03 Feb 2021 17:09:53 +0000
Received: from EX13MTAUWC002.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan3.pdx.amazon.com [10.236.137.198])
 by email-inbound-relay-2a-d0be17ee.us-west-2.amazon.com (Postfix) with ESMTPS
 id E0174A0373; Wed,  3 Feb 2021 17:09:52 +0000 (UTC)
Received: from EX13D20UWC001.ant.amazon.com (10.43.162.244) by
 EX13MTAUWC002.ant.amazon.com (10.43.162.240) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Wed, 3 Feb 2021 17:09:52 +0000
Received: from Alexanders-MacBook-Air.local (10.43.162.125) by
 EX13D20UWC001.ant.amazon.com (10.43.162.244) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Wed, 3 Feb 2021 17:09:48 +0000
Subject: Re: About creating machines on the command line
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, Luc Michel
 <luc.michel@greensocs.com>, <qemu-devel@nongnu.org>, Nikos Dragazis
 <ndragazis@arrikto.com>, Maxime Coquelin <maxime.coquelin@redhat.com>,
 "Thanos Makatos" <thanos.makatos@nutanix.com>, Andra-Irina Paraschiv
 <andraprs@amazon.com>, "John G. Johnson" <john.g.johnson@oracle.com>, "Jan
 Kiszka" <jan.kiszka@siemens.com>
References: <13ecc030-f42b-5a27-a0b3-b07921426ce9@greensocs.com>
 <93e41283-ec7c-4c2b-dcfd-9e0e7a2e435c@amsat.org>
Message-ID: <497eb0f5-a308-7a10-37ef-5fcc3ec21b8a@amazon.com>
Date: Wed, 3 Feb 2021 18:09:46 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <93e41283-ec7c-4c2b-dcfd-9e0e7a2e435c@amsat.org>
Content-Language: en-US
X-Originating-IP: [10.43.162.125]
X-ClientProxiedBy: EX13D28UWB002.ant.amazon.com (10.43.161.140) To
 EX13D20UWC001.ant.amazon.com (10.43.162.244)
Precedence: Bulk
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=207.171.188.200;
 envelope-from=prvs=661eeea40=graf@amazon.de; helo=smtp-fw-9103.amazon.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.178,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, peter.maydell@linaro.org,
 berrange@redhat.com, sam.grove@sifive.com,
 Mark Burton <mark.burton@greensocs.com>, richard.fuhler@sifive.com,
 armbru@redhat.com, edgar.iglesias@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Alexander Graf <graf@amazon.com>
From: graf--- via <qemu-devel@nongnu.org>

CgpPbiAwMy4wMi4yMSAxNzo1NSwgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgd3JvdGU6Cj4gCj4g
T24gMS8xMS8yMSAzOjUwIFBNLCBMdWMgTWljaGVsIHdyb3RlOgo+PiBIaSwKPj4KPj4gV2Ugd291
bGQgbGlrZSB0byB3b3JrIG9uIGltcHJvdmluZyBRRU1VIHRvIGJlIGFibGUgdG8gY3JlYXRlIGN1
c3RvbQo+PiBtYWNoaW5lcyBmcm9tIHRoZSBjb21tYW5kIGxpbmUuIFRoZSBnb2FsIGhlcmUgaXMg
dG8gZ2V0IGZlZWRiYWNrIGZyb20KPj4gdGhlIGNvbW11bml0eSBhbmQgc2hhcGUgdGhlIGZ1dHVy
ZSBkZXZlbG9wbWVudHMuCj4gCj4gQ2MnaW5nIEpvaG4gd2hvIGlzIHdvcmtpbmcgb24gY29tbWFu
ZCBsaW5lLCBhbmQgc29tZSBkZXZlbG9wZXJzIGZyb20KPiB0aGUgImludGVyLVZNIGRldmljZSBl
bXVsYXRpb24gaW50ZXJmYWNlIiBjYWxsLgo+IGh0dHBzOi8vd3d3Lm1haWwtYXJjaGl2ZS5jb20v
cWVtdS1kZXZlbEBub25nbnUub3JnL21zZzcyMzI1Mi5odG1sCj4gCj4+Cj4+IFRoZSB1c2UgY2Fz
ZSBtYWlubHkgY29tZXMgZnJvbSBwZW9wbGUgd29ya2luZyB3aXRoIHRvb2xzIHRvIGN1c3RvbWl6
ZQo+PiB0aGVpciBkZXNpZ25zLCBzdWNoIGFzIFNpRml2ZSBDb3JlIERlc2lnbmVyCj4+IChodHRw
czovL3Njcy5zaWZpdmUuY29tL2NvcmUtZGVzaWduZXIpLiBUaGlzIGtpbmQgb2YgdG9vbHMgbWF5
IGFsbG93Cj4+IGNyZWF0aW9uIG9yIGN1c3RvbWl6YXRpb24gb2YgYSB3aG9sZSBTb0MsIGZyb20g
dGhlIG51bWJlciBvZiBjb3JlcywgdG8KPj4gdGhlIG1lbW9yeSBhbmQgSVJRIG1hcHBpbmcgb2Yg
cGVyaXBoZXJhbHMgZXRjLgo+Pgo+PiBUaGUgdWx0aW1hdGUgZ29hbCB3b3VsZCBiZSB0byBiZSBh
YmxlIHRvIGNyZWF0ZSBhbnkga2luZCBvZiBtYWNoaW5lIG9uCj4+IHRoZSBjb21tYW5kIGxpbmUu
IEhvd2V2ZXIgd2UgYXJlIGF3YXJlIHRoYXQgdGhpcyBpcyBhIHN1YnN0YW50aWFsIGFtb3VudAo+
PiBvZiBjaGFuZ2VzIGluIFFFTVUuCgpJcyB0aGUgY29tbWFuZCBsaW5lIHJlYWxseSB0aGUgcmln
aHQgYWJzdHJhY3Rpb24gbGV2ZWwgaGVyZT8gV291bGRuJ3QgaXQgCm1ha2UgbW9yZSBzZW5zZSB0
byBoYXZlIGEgUU9NIC8gPHNjcmlwdGluZyBsYW5ndWFnZT4gYnJpZGdlIHRoYXQgYWxsb3dzIAp5
b3UgdG8gY3JlYXRlIGFuZCBjb25uZWN0IFFPTSBvYmplY3RzIHVzaW5nIGZvciBleGFtcGxlIFB5
dGhvbj8KCllvdSBjb3VsZCB0aGVuIGhhdmUgbWFjaGluZSBkZXNjcmlwdGlvbnMgaW4gYSBzY3Jp
cHQsIHdoaWNoIGNvdWxkIGJlIApnZW5lcmF0ZWQgYnkgdGhlIFNvQyBjdXN0b21pemF0aW9uIHRv
b2xzLgoKSW4gY29tYmluYXRpb24gd2l0aCBwbHVnaW4gc3VwcG9ydCBmb3IgcGxhdGZvcm0gZGV2
aWNlcywgdGhhdCBzaG91bGQgCmFsbG93IHByZXR0eSBtdWNoIGFueSBjdXN0b21pemF0aW9uIHlv
dSB3b3VsZCBuZWVkIHRvIGhhcHBlbiwgbm8/CgoKQWxleAoKPj4KPj4gSW4gaXRzIGN1cnJlbnQg
c3RhdGUsIFFFTVUgYWxsb3dzIGZvciB2ZXJ5IGxpbWl0ZWQgY3VzdG9taXphdGlvbiBvZgo+PiBl
eGlzdGluZyBtYWNoaW5lcyBvbiB0aGUgY29tbWFuZCBsaW5lLiBXZSBpZGVudGlmaWVkIHRoZSBm
b2xsb3dpbmcKPj4gbGltaXRhdGlvbnMgKGZlZWwgZnJlZSB0byBhZGQgdG8gdGhlIGxpc3QpOgo+
Pgo+PiAgICAtIE1vc3QgZGV2aWNlcyBhcmUgbm90IHVzZXIgY3JlYXRhYmxlLiBNb3Jlb3Zlciwg
c3lzYnVzIGRldmljZXMgbXVzdAo+PiBiZSBleHBsaWNpdGx5IGFsbG93ZWQgYnkgYSBtYWNoaW5l
IHRvIGJlIGNyZWF0YWJsZSB0aHJvdWdoIGAtZGV2aWNlYCwKPj4KPj4gICAgLSBNZW1vcnkgcmVn
aW9ucyBjYW5ub3QgYmUgY3JlYXRlZCBvbiB0aGUgY29tbWFuZCBsaW5lLAo+Pgo+PiAgICAtIERl
dmljZSBNTUlPIHJlZ2lvbnMgY2Fubm90IGJlIG1hcHBlZCBvbiBhIGJ1cyBmcm9tIHRoZSBjb21t
YW5kIGxpbmUsCj4+Cj4+ICAgIC0gR1BJT3MgYW5kIGNsb2NrcyBjYW5ub3QgYmUgd2lyZWQgZnJv
bSB0aGUgY29tbWFuZCBsaW5lLAo+Pgo+PiAgICAtIENQVXMgYXJlIG5vdCBzeXNidXMgZGV2aWNl
cyAoYW5kIG5vdCB1c2VyLWNyZWF0YWJsZSkuIFRoZXkgbmVlZAo+PiBzcGVjaWFsIGNhcmUgd2hl
biBjcmVhdGluZyB0aGVtIHJlZ2FyZGluZyBzeXN0ZW0gcmVzZXQuIE5vdCBiZWluZyBvbiBhCj4+
IGJ1cyBtZWFucyB0aGF0IHRoZXkgbXVzdCBiZSByZXNldCBtYW51YWxseSBvbiBzeXN0ZW0gcmVz
ZXQuIFRoaXMgaXMgZG9uZQo+PiBpbiBtYWNoaW5lcyBieSByZWdpc3RlcmluZyBhIFFFTVUgcmVz
ZXQgaGFuZGxlci4KPj4KPj4gICAgLSBNYWNoaW5lIHNwZWNpZmljIGJvb3QgY29kZSBpcyB1c3Vh
bGx5IGhhcmQtY29kZWQgaW50byB0aGUgbWFjaGluZQo+PiBpdHNlbGYuICBTb21lIGFyY2hpdGVj
dHVyZXMgKGUuZy4gQVJNKSBkbyBmYWN0b3JpemUgYm9vdGxvYWRlciByZWxhdGVkCj4+IGNvZGUs
IGJ1dCB0aGVyZSBpcyBubyBzdGFuZGFyZCB3YXkgb2YgZG9pbmcgdGhhdCBpbiBRRU1VLgo+Pgo+
PiBXZSBkb24ndCB3YW50IHRvIGFkZHJlc3MgYWxsIHRob3NlIGxpbWl0YXRpb25zIGF0IG9uY2Uu
IFdlIHBsYW4gdG8gc3RhcnQKPj4gd2l0aCB0aGUgZm9sbG93aW5nIHNjZW5hcmlvOgo+Pgo+PiAg
ICAtIFN0YXJ0IHdpdGggYSBiYXNlIG1hY2hpbmUgdGhhdCB3b3VsZCBoYW5kbGUgQ1BVIGNyZWF0
aW9uIGFuZAo+PiBib290bG9hZGVyIHN0dWZmLiBOb3RlIHRoYXQgdGhlICJub25lIiBtYWNoaW5l
IGlzIHByb2JhYmx5IG5vdAo+PiBzdWZmaWNpZW50IGluIGl0cyBjdXJyZW50IHNoYXBlLiBJdCBk
b2VzIGFsbG93IG9ubHkgb25lIENQVSBhbmQKPj4gb2J2aW91c2x5IGRvZXMgbm90IGhhbmRsZSB0
aGUgYm9vdCBwcm9jZXNzLgo+Pgo+PiAgICAtIEFsbG93IGZvciB0aGlzIG1hY2hpbmUgZXZlcnkg
c3lzYnVzIGRldmljZXMgd2Ugd2FudCB0byBiZSB1c2VyCj4+IGNvbW1hbmQtbGluZSBjcmVhdGFi
bGUgKGFuZCBtYXJrIHRoZW0gdXNlcl9jcmVhdGFibGUgaWYgbmVlZGVkKQo+Pgo+PiAgICAtIEFk
ZCBjb21tYW5kIGxpbmUgb3B0aW9ucyB0byBjcmVhdGUgbWVtb3J5IHJlZ2lvbnMgKHByb2JhYmx5
IHJhbSBvbmVzCj4+IGF0IGZpcnN0KQo+Pgo+PiAgICAtIEFkZCBjb21tYW5kIGxpbmUgb3B0aW9u
cyB0byBtYXAgYSBtZW1vcnkgcmVnaW9uIChpbmNsdWRpbmcgc3lzYnVzCj4+IGRldmljZSBNTUlP
IHJlZ2lvbnMpIG9udG8gYW5vdGhlciAobWVtb3J5X3JlZ2lvbl9hZGRfc3VicmVnaW9uKQo+Pgo+
PiAgICAtIEFkZCBjb21tYW5kIGxpbmUgb3B0aW9ucyB0byBjb25uZWN0IEdQSU9zIGFuZCBjbG9j
a3MuCj4+Cj4+IFRoaXMgd291bGQgaG9wZWZ1bGx5IGFsbG93IGZvciBzaW1wbGUgbWFjaGluZXMg
Y3JlYXRpb24uIFdlIHdvdWxkIHRoZW4KPj4gYmUgYWJsZSB0byB1c2UgZWl0aGVyIHRoZSBjb21t
YW5kIGxpbmUgb3IgdGhlIGAtcmVhZGNvbmZpZ2Agb3B0aW9uIHRvCj4+IGNyZWF0ZSB0aGUgbWFj
aGluZS4KPj4KPj4gTm90ZSB0aGF0IHdlIGFyZSBub3QgcGxhbm5pbmcgdG8gdXNlIFFNUC9ITVAg
Zm9yIG5vdy4gRnJvbSBvdXIKPj4gdW5kZXJzdGFuZGluZywgYSBgZGV2aWNlX2FkZGAgcmVxdWVz
dCBpcyBhbHdheXMgY29uc2lkZXJlZCBhcyBob3QtcGx1ZywKPj4gd2hpY2ggaXMgbm90IHdoYXQg
d2Ugd2FudCBoZXJlLgo+Pgo+PiBQbGVhc2UgdGVsbCB1cyB3aGF0IGRvIHlvdSB0aGluayBhYm91
dCB0aGlzIHBsYW4uIEFueSBmZWVkYmFjayBpcwo+PiBhcHByZWNpYXRlZC4gIFRoZW4gd2UgY2Fu
IGRpc2N1c3MgdGhlIGRldGFpbHMgb2YgaG93IHRvIGRvIHRoaXMgcHJvcGVybHkuCj4+IFRoYW5r
cyEKPj4KPj4gLS0KPj4gTHVjCj4+CgoKCkFtYXpvbiBEZXZlbG9wbWVudCBDZW50ZXIgR2VybWFu
eSBHbWJICktyYXVzZW5zdHIuIDM4CjEwMTE3IEJlcmxpbgpHZXNjaGFlZnRzZnVlaHJ1bmc6IENo
cmlzdGlhbiBTY2hsYWVnZXIsIEpvbmF0aGFuIFdlaXNzCkVpbmdldHJhZ2VuIGFtIEFtdHNnZXJp
Y2h0IENoYXJsb3R0ZW5idXJnIHVudGVyIEhSQiAxNDkxNzMgQgpTaXR6OiBCZXJsaW4KVXN0LUlE
OiBERSAyODkgMjM3IDg3OQoKCg==


