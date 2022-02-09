Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 445884AF4E5
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 16:15:11 +0100 (CET)
Received: from localhost ([::1]:41534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHogY-0006Nd-9R
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 10:15:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=0327b8673=graf@amazon.de>)
 id 1nHoJG-0000ku-6w
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 09:51:14 -0500
Received: from smtp-fw-6002.amazon.com ([52.95.49.90]:46830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=0327b8673=graf@amazon.de>)
 id 1nHoIe-0002Ql-WA
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 09:50:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1644418229; x=1675954229;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=/bfbQkCawyVD0Ipk28+pQL6ukmzMlMP2Lcis4XdM7BU=;
 b=UUpT2rLvZvzp+zgnFIldNHpvvafEUDL2Lb6XI8rDaca3yoHuNyWWo3oT
 vbVXdUD0XVXxN6DcKv+4M8cqYel2NQ8DI/1bDIL5n7auJyNWTtD8uG1+8
 XYDI3rJ9U9rc5/AIinPkM0cM0/eE8UQVgsnLRnwirdOhOZPrOcNtYvulW g=;
X-IronPort-AV: E=Sophos;i="5.88,356,1635206400"; d="scan'208";a="175413329"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-pdx-2a-92ba9394.us-west-2.amazon.com) ([10.43.8.2])
 by smtp-border-fw-6002.iad6.amazon.com with ESMTP; 09 Feb 2022 14:49:55 +0000
Received: from EX13MTAUWC002.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan3.pdx.amazon.com [10.236.137.198])
 by email-inbound-relay-pdx-2a-92ba9394.us-west-2.amazon.com (Postfix) with
 ESMTPS id D3DEB41276; Wed,  9 Feb 2022 14:49:53 +0000 (UTC)
Received: from EX13D20UWC001.ant.amazon.com (10.43.162.244) by
 EX13MTAUWC002.ant.amazon.com (10.43.162.240) with Microsoft SMTP Server (TLS)
 id 15.0.1497.28; Wed, 9 Feb 2022 14:49:53 +0000
Received: from [0.0.0.0] (10.43.160.114) by EX13D20UWC001.ant.amazon.com
 (10.43.162.244) with Microsoft SMTP Server (TLS) id 15.0.1497.28; Wed, 9 Feb
 2022 14:49:48 +0000
Message-ID: <244647ca-a247-cfc1-d0df-b8c74d434a77@amazon.com>
Date: Wed, 9 Feb 2022 15:49:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: Call for GSoC and Outreachy project ideas for summer 2022
To: Stefan Hajnoczi <stefanha@gmail.com>, qemu-devel <qemu-devel@nongnu.org>, 
 kvm <kvm@vger.kernel.org>,
 Rust-VMM Mailing List <rust-vmm@lists.opendev.org>
CC: Damien Le Moal <Damien.LeMoal@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Sergio Lopez <slp@redhat.com>, Dmitry Fomichev <Dmitry.Fomichev@wdc.com>, 
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, Hannes Reinecke
 <hare@suse.de>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 "Florescu, Andreea" <fandree@amazon.com>, <hreitz@redhat.com>, Alex Agache
 <aagch@amazon.com>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, John Snow
 <jsnow@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>,
 <ohering@suse.de>, "Eftime, Petre" <epetre@amazon.com>, <andraprs@amazon.com>
References: <CAJSP0QX7O_auRgTKFjHkBbkBK=B3Z-59S6ZZi10tzFTv1_1hkQ@mail.gmail.com>
From: Alexander Graf <graf@amazon.com>
In-Reply-To: <CAJSP0QX7O_auRgTKFjHkBbkBK=B3Z-59S6ZZi10tzFTv1_1hkQ@mail.gmail.com>
X-Originating-IP: [10.43.160.114]
X-ClientProxiedBy: EX13D16UWB002.ant.amazon.com (10.43.161.234) To
 EX13D20UWC001.ant.amazon.com (10.43.162.244)
Precedence: Bulk
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=52.95.49.90;
 envelope-from=prvs=0327b8673=graf@amazon.de; helo=smtp-fw-6002.amazon.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

Ck9uIDI4LjAxLjIyIDE2OjQ3LCBTdGVmYW4gSGFqbm9jemkgd3JvdGU6Cj4gRGVhciBRRU1VLCBL
Vk0sIGFuZCBydXN0LXZtbSBjb21tdW5pdGllcywKPiBRRU1VIHdpbGwgYXBwbHkgZm9yIEdvb2ds
ZSBTdW1tZXIgb2YgQ29kZSAyMDIyCj4gKGh0dHBzOi8vc3VtbWVyb2Zjb2RlLndpdGhnb29nbGUu
Y29tLykgYW5kIGhhcyBiZWVuIGFjY2VwdGVkIGludG8KPiBPdXRyZWFjaHkgTWF5LUF1Z3VzdCAy
MDIyIChodHRwczovL3d3dy5vdXRyZWFjaHkub3JnLykuIFlvdSBjYW4gbm93Cj4gc3VibWl0IGlu
dGVybnNoaXAgcHJvamVjdCBpZGVhcyBmb3IgUUVNVSwgS1ZNLCBhbmQgcnVzdC12bW0hCj4KPiBJ
ZiB5b3UgaGF2ZSBleHBlcmllbmNlIGNvbnRyaWJ1dGluZyB0byBRRU1VLCBLVk0sIG9yIHJ1c3Qt
dm1tIHlvdSBjYW4KPiBiZSBhIG1lbnRvci4gSXQncyBhIGdyZWF0IHdheSB0byBnaXZlIGJhY2sg
YW5kIHlvdSBnZXQgdG8gd29yayB3aXRoCj4gcGVvcGxlIHdobyBhcmUganVzdCBzdGFydGluZyBv
dXQgaW4gb3BlbiBzb3VyY2UuCj4KPiBQbGVhc2UgcmVwbHkgdG8gdGhpcyBlbWFpbCBieSBGZWJy
dWFyeSAyMXN0IHdpdGggeW91ciBwcm9qZWN0IGlkZWFzLgo+Cj4gR29vZCBwcm9qZWN0IGlkZWFz
IGFyZSBzdWl0YWJsZSBmb3IgcmVtb3RlIHdvcmsgYnkgYSBjb21wZXRlbnQKPiBwcm9ncmFtbWVy
IHdobyBpcyBub3QgeWV0IGZhbWlsaWFyIHdpdGggdGhlIGNvZGViYXNlLiBJbgo+IGFkZGl0aW9u
LCB0aGV5IGFyZToKPiAtIFdlbGwtZGVmaW5lZCAtIHRoZSBzY29wZSBpcyBjbGVhcgo+IC0gU2Vs
Zi1jb250YWluZWQgLSB0aGVyZSBhcmUgZmV3IGRlcGVuZGVuY2llcwo+IC0gVW5jb250cm92ZXJz
aWFsIC0gdGhleSBhcmUgYWNjZXB0YWJsZSB0byB0aGUgY29tbXVuaXR5Cj4gLSBJbmNyZW1lbnRh
bCAtIHRoZXkgcHJvZHVjZSBkZWxpdmVyYWJsZXMgYWxvbmcgdGhlIHdheQo+Cj4gRmVlbCBmcmVl
IHRvIHBvc3QgaWRlYXMgZXZlbiBpZiB5b3UgYXJlIHVuYWJsZSB0byBtZW50b3IgdGhlIHByb2pl
Y3QuCj4gSXQgZG9lc24ndCBodXJ0IHRvIHNoYXJlIHRoZSBpZGVhIQoKCkkgaGF2ZSBvbmUgdGhh
dCBJJ2QgYWJzb2x1dGVseSAqbG92ZSogdG8gc2VlIGJ1dCBub3QgZ290dGVuIGFyb3VuZCAKaW1w
bGVtZW50aW5nIG15c2VsZiB5ZXQgOikKCgpTdW1tYXJ5OgoKSW1wbGVtZW50IC1NIG5pdHJvLWVu
Y2xhdmUgaW4gUUVNVQoKTml0cm8gRW5jbGF2ZXMgYXJlIHRoZSBmaXJzdCB3aWRlbHkgYWRvcHRl
ZCBpbXBsZW1lbnRhdGlvbiBvZiBoeXBlcnZpc29yIAphc3Npc3RlZCBjb21wdXRlIGlzb2xhdGlv
bi4gU2ltaWxhciB0byB0ZWNobm9sb2dpZXMgbGlrZSBTR1gsIGl0IGFsbG93cyAKdG8gc3Bhd24g
YSBzZXBhcmF0ZSBjb250ZXh0IHRoYXQgaXMgaW5hY2Nlc3NpYmxlIGJ5IHRoZSBwYXJlbnQgT3Bl
cmF0aW5nIApTeXN0ZW0uIFRoaXMgaXMgaW1wbGVtZW50ZWQgYnkgImdpdmluZyB1cCIgcmVzb3Vy
Y2VzIG9mIHRoZSBwYXJlbnQgVk0gCihDUFUgY29yZXMsIG1lbW9yeSkgdG8gdGhlIGh5cGVydmlz
b3Igd2hpY2ggdGhlbiBzcGF3bnMgYSBzZWNvbmQgdm1tIHRvIApleGVjdXRlIGEgY29tcGxldGVs
eSBzZXBhcmF0ZSB2aXJ0dWFsIG1hY2hpbmUuIFRoYXQgbmV3IFZNIG9ubHkgaGFzIGEgCnZzb2Nr
IGNvbW11bmljYXRpb24gY2hhbm5lbCB0byB0aGUgcGFyZW50IGFuZCBoYXMgYSBidWlsdC1pbiBs
aWdodHdlaWdodCAKVFBNLgoKT25lIGJpZyBjaGFsbGVuZ2Ugd2l0aCBOaXRybyBFbmNsYXZlcyBp
cyB0aGF0IGR1ZSB0byBpdHMgcm9vdHMgaW4gCnNlY3VyaXR5LCB0aGVyZSBhcmUgdmVyeSBmZXcg
ZGVidWdnaW5nIC8gaW50cm9zcGVjdGlvbiBjYXBhYmlsaXRpZXMuIApUaGF0IG1ha2VzIE9TIGJy
aW5ndXAsIGRlYnVnZ2luZyBhbmQgYm9vdHN0cmFwcGluZyB2ZXJ5IGRpZmZpY3VsdC4gCkhhdmlu
ZyBhIGxvY2FsIGRldiZ0ZXN0IGVudmlyb25tZW50IHRoYXQgbG9va3MgbGlrZSBhbiBFbmNsYXZl
LCBidXQgaXMgCjEwMCUgY29udHJvbGxlZCBieSB0aGUgZGV2ZWxvcGVyIGFuZCBpbnRyb3NwZWN0
YWJsZSB3b3VsZCBtYWtlIGxpZmUgYSAKbG90IGVhc2llciBmb3IgZXZlcnlvbmUgd29ya2luZyBv
biB0aGVtLiBJdCBhbHNvIG1heSBwYXZlIHRoZSB3YXkgdG8gc2VlIApOaXRybyBFbmNsYXZlcyBh
ZG9wdGVkIGluIFZNIGVudmlyb25tZW50cyBvdXRzaWRlIG9mIEVDMi4KClRoaXMgcHJvamVjdCB3
aWxsIGNvbnNpc3Qgb2YgYWRkaW5nIGEgbmV3IG1hY2hpbmUgbW9kZWwgdG8gUUVNVSB0aGF0IApt
aW1pY3MgYSBOaXRybyBFbmNsYXZlIGVudmlyb25tZW50LCBpbmNsdWRpbmcgdGhlIGxpZ2h0d2Vp
Z2h0IFRQTSwgdGhlIAp2c29jayBjb21tdW5pY2F0aW9uIGNoYW5uZWwgYW5kIGJ1aWxkaW5nIGZp
cm13YXJlIHdoaWNoIGxvYWRzIHRoZSAKc3BlY2lhbCAiRUlGIiBmaWxlIGZvcm1hdCB3aGljaCBj
b250YWlucyBrZXJuZWwsIGluaXRyYW1mcyBhbmQgbWV0YWRhdGEgCmZyb20gYSAta2VybmVsIGlt
YWdlLgoKTGlua3M6CgpodHRwczovL2F3cy5hbWF6b24uY29tL2VjMi9uaXRyby9uaXRyby1lbmNs
YXZlcy8KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDIwMDkyMTEyMTczMi40NDI5MS0x
MC1hbmRyYXByc0BhbWF6b24uY29tL1QvCgpEZXRhaWxzOgoKU2tpbGwgbGV2ZWw6IGludGVybWVk
aWF0ZSAtIGFkdmFuY2VkIChzb21lIHVuZGVyc3RhbmRpbmcgb2YgUUVNVSBtYWNoaW5lIAptb2Rl
bGluZyB3b3VsZCBiZSBnb29kKQpMYW5ndWFnZTogQwpNZW50b3I6IE1heWJlIG1lIChBbGV4YW5k
ZXIgR3JhZiksIGRlcGVuZHMgb24gdGltZWxpbmVzIGFuZCBob2xpZGF5IApzZWFzb24uIExldCdz
IGZpbmQgYW4gaW50ZXJuIGZpcnN0IC0gSSBwcm9taXNlIHRvIGZpbmQgYSBtZW50b3IgdGhlbiA6
KQpTdWdnZXN0ZWQgYnk6IEFsZXhhbmRlciBHcmFmCgoKTm90ZTogSSBkb24ndCBrbm93IGVub3Vn
aCBhYm91dCBydXN0LXZtbSdzIGRlYnVnZ2luZyBjYXBhYmlsaXRpZXMuIElmIGl0IApoYXMgZ2Ri
c3R1YiBhbmQgYSBsb2NhbCBVQVJUIHRoYXQncyBlYXNpbHkgdXNhYmxlLCB0aGUgcHJvamVjdCBt
aWdodCBiZSAKcGVyZmVjdGx5IHZpYWJsZSB1bmRlciBpdHMgdW1icmVsbGEgYXMgd2VsbCAtIHdy
aXR0ZW4gaW4gUnVzdCB0aGVuIG9mIApjb3Vyc2UuCgpBbGV4CgoKCgpBbWF6b24gRGV2ZWxvcG1l
bnQgQ2VudGVyIEdlcm1hbnkgR21iSApLcmF1c2Vuc3RyLiAzOAoxMDExNyBCZXJsaW4KR2VzY2hh
ZWZ0c2Z1ZWhydW5nOiBDaHJpc3RpYW4gU2NobGFlZ2VyLCBKb25hdGhhbiBXZWlzcwpFaW5nZXRy
YWdlbiBhbSBBbXRzZ2VyaWNodCBDaGFybG90dGVuYnVyZyB1bnRlciBIUkIgMTQ5MTczIEIKU2l0
ejogQmVybGluClVzdC1JRDogREUgMjg5IDIzNyA4NzkKCgo=


