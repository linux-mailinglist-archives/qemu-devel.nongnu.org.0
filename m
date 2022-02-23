Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B74564C0EA3
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 09:57:26 +0100 (CET)
Received: from localhost ([::1]:49664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMnSf-0005ZT-J6
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 03:57:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=0465d7ec3=fandree@amazon.com>)
 id 1nMnK4-0001dT-IM
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 03:48:32 -0500
Received: from smtp-fw-33001.amazon.com ([207.171.190.10]:36214)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=0465d7ec3=fandree@amazon.com>)
 id 1nMnK0-0006uv-9h
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 03:48:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1645606108; x=1677142108;
 h=message-id:date:mime-version:to:cc:references:from:
 in-reply-to:content-transfer-encoding:subject;
 bh=3nclHaGfU2vOoADKml/2fAOT6Mk5ZQunFlCh+Ohjwqw=;
 b=BsqRawX0fx3JTKbdKhZ9EWb+pqN7TIrdTMiQZv+jcZGZgaZyX0xfUXQv
 Qpxm2ZfB7tUe/EXKOAzbjBvB5oyGg1HKrqExh9iMZjq9Plv94WRPW/IVp
 rEvgwlwvAvZceDFK1LcPz19hgQO2RrR3+Kx5Hgau+NFMGv7khOiv+udd8 o=;
X-IronPort-AV: E=Sophos;i="5.88,390,1635206400"; d="scan'208";a="177812925"
Subject: Re: Call for GSoC and Outreachy project ideas for summer 2022
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-iad-1e-ccb3efe0.us-east-1.amazon.com) ([10.43.8.2])
 by smtp-border-fw-33001.sea14.amazon.com with ESMTP; 23 Feb 2022 08:48:10 +0000
Received: from EX13D10EUB003.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
 by email-inbound-relay-iad-1e-ccb3efe0.us-east-1.amazon.com (Postfix) with
 ESMTPS id 80889C13FC; Wed, 23 Feb 2022 08:48:06 +0000 (UTC)
Received: from [192.168.16.35] (10.43.162.55) by EX13D10EUB003.ant.amazon.com
 (10.43.166.160) with Microsoft SMTP Server (TLS) id 15.0.1497.28;
 Wed, 23 Feb 2022 08:47:59 +0000
Message-ID: <54dddcf5-85d7-5170-899e-589dd79a34fb@amazon.com>
Date: Wed, 23 Feb 2022 10:47:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@gmail.com>, qemu-devel <qemu-devel@nongnu.org>, 
 kvm <kvm@vger.kernel.org>,
 Rust-VMM Mailing List <rust-vmm@lists.opendev.org>
CC: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, John Snow <jsnow@redhat.com>, Sergio Lopez
 <slp@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, Alex Agache
 <aagch@amazon.com>, Damien Le Moal <Damien.LeMoal@wdc.com>, Hannes Reinecke
 <hare@suse.de>, Dmitry Fomichev <Dmitry.Fomichev@wdc.com>, Gerd Hoffmann
 <kraxel@redhat.com>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, <hreitz@redhat.com>
References: <CAJSP0QX7O_auRgTKFjHkBbkBK=B3Z-59S6ZZi10tzFTv1_1hkQ@mail.gmail.com>
From: Andreea Florescu <fandree@amazon.com>
In-Reply-To: <CAJSP0QX7O_auRgTKFjHkBbkBK=B3Z-59S6ZZi10tzFTv1_1hkQ@mail.gmail.com>
X-Originating-IP: [10.43.162.55]
X-ClientProxiedBy: EX13D40UWC001.ant.amazon.com (10.43.162.149) To
 EX13D10EUB003.ant.amazon.com (10.43.166.160)
Precedence: Bulk
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=207.171.190.10;
 envelope-from=prvs=0465d7ec3=fandree@amazon.com; helo=smtp-fw-33001.amazon.com
X-Spam_score_int: -119
X-Spam_score: -12.0
X-Spam_bar: ------------
X-Spam_report: (-12.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

CgpPbiAxLzI4LzIyIDE3OjQ3LCBTdGVmYW4gSGFqbm9jemkgd3JvdGU6Cj4gQ0FVVElPTjogVGhp
cyBlbWFpbCBvcmlnaW5hdGVkIGZyb20gb3V0c2lkZSBvZiB0aGUgb3JnYW5pemF0aW9uLiBEbyBu
b3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGNhbiBjb25maXJt
IHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4KPgo+Cj4KPiBEZWFyIFFF
TVUsIEtWTSwgYW5kIHJ1c3Qtdm1tIGNvbW11bml0aWVzLAo+IFFFTVUgd2lsbCBhcHBseSBmb3Ig
R29vZ2xlIFN1bW1lciBvZiBDb2RlIDIwMjIKPiAoaHR0cHM6Ly9zdW1tZXJvZmNvZGUud2l0aGdv
b2dsZS5jb20vKSBhbmQgaGFzIGJlZW4gYWNjZXB0ZWQgaW50bwo+IE91dHJlYWNoeSBNYXktQXVn
dXN0IDIwMjIgKGh0dHBzOi8vd3d3Lm91dHJlYWNoeS5vcmcvKS4gWW91IGNhbiBub3cKPiBzdWJt
aXQgaW50ZXJuc2hpcCBwcm9qZWN0IGlkZWFzIGZvciBRRU1VLCBLVk0sIGFuZCBydXN0LXZtbSEK
Pgo+IElmIHlvdSBoYXZlIGV4cGVyaWVuY2UgY29udHJpYnV0aW5nIHRvIFFFTVUsIEtWTSwgb3Ig
cnVzdC12bW0geW91IGNhbgo+IGJlIGEgbWVudG9yLiBJdCdzIGEgZ3JlYXQgd2F5IHRvIGdpdmUg
YmFjayBhbmQgeW91IGdldCB0byB3b3JrIHdpdGgKPiBwZW9wbGUgd2hvIGFyZSBqdXN0IHN0YXJ0
aW5nIG91dCBpbiBvcGVuIHNvdXJjZS4KPgo+IFBsZWFzZSByZXBseSB0byB0aGlzIGVtYWlsIGJ5
IEZlYnJ1YXJ5IDIxc3Qgd2l0aCB5b3VyIHByb2plY3QgaWRlYXMuCkhleSwgSSBhbSBhIGJpdCBs
YXRlIGhlcmUsIGJ1dCBpbiBjYXNlIGl0IGlzIHN0aWxsIHBvc3NpYmxlLCBJIHdvdWxkCmxpa2Ug
dG8gYWxzbyBwcm9wb3NlIGEgcHJvamVjdC4KClRpdGxlOiBFeHRlbmQgdGhlIGFhcmNoNjQgc3Vw
cG9ydCBmb3IgcnVzdC12bW0vdm1tLXJlZmVyZW5jZQoKU3VtbWFyeToKVGhlIHZtbS1yZWZlcmVu
Y2UgaXMgYSByZWZlcmVuY2UgaW1wbGVtZW50YXRpb24gb2YgYSBSdXN0IFZNTSBiYXNlZCBvbiAK
cnVzdC12bW0gY3JhdGVzLgpUaGlzIGlzIGN1cnJlbnRseSB1c2VkIGZvciB0ZXN0aW5nIHRoZSBp
bnRlZ3JhdGlvbiBvZiBydXN0LXZtbSAKY29tcG9uZW50cywgd2l0aCBwbGFucyBvZiBleHRlbmRp
bmcgaXQKc3VjaCB0aGF0IGl0IGJlY29tZXMgYSBzdGFydGluZyBwb2ludCBmb3IgY3VzdG9tIFJ1
c3QgVk1Ncy4KClRoZSB2bW0tcmVmZXJlbmNlIGN1cnJlbnRseSBoYXMgc3VwcG9ydCBmb3IgeDg2
XzY0IGFuZCBQT0MgbGV2ZWwgc3VwcG9ydCAKZm9yIGFhcmNoNjQuCk9uIGFhcmNoNjQsIGl0IGp1
c3Qgc3VwcG9ydHMgYm9vdGluZyBhIGR1bW15IFZNIHdpdGggbm8gZGV2aWNlcywgd2hpbGUgCm9u
IHg4Nl82NCBpdCBoYXMgc3VwcG9ydCBmb3IgdGhlCnZzb2NrLW5ldHdvcmsgYW5kIHZzb2NrLWJs
b2NrIGRldmljZXMuIFRoZSBwdXJwb3NlIG9mIHRoaXMgcHJvamVjdCBpcyB0byAKZXh0ZW5kIHRo
ZSBleGlzdGluZyBmdW5jdGlvbmFsaXR5CmdldHRpbmcgaXQgY2xvc2VyIHRvIHdoYXQgaXMgYWxy
ZWFkeSBhdmFpbGFibGUgb24geDg2XzY0LCBhbmQgY29uc3VtZSAKdGhlIHJlYWRpbHkgYXZhaWxh
YmxlIGNyYXRlcwooZm9yIGV4YW1wbGUgdm0tYWxsb2NhdG9yKSB0aGF0IHdvdWxkIG1ha2UgdGhl
IGludGVncmF0aW9uIGVhc2llci4KClJlc291cmNlczoKLSBhYm91dCB0aGUgdm1tLXJlZmVyZW5j
ZTogaHR0cHM6Ly9naXRodWIuY29tL3J1c3Qtdm1tL3ZtbS1yZWZlcmVuY2UKLSBhYm91dCB0aGUg
cnVzdC12bW0gcHJvamVjdDogaHR0cHM6Ly9naXRodWIuY29tL3J1c3Qtdm1tL2NvbW11bml0eQot
IHRhc2sgYnJlYWtkb3duIGZvciBhZGRpbmcgYXJtIHN1cHBvcnQ6IApodHRwczovL2dpdGh1Yi5j
b20vcnVzdC12bW0vdm1tLXJlZmVyZW5jZS9pc3N1ZXM/cT1pcyUzQWlzc3VlK2lzJTNBb3Blbits
YWJlbCUzQWFhcmNoNjQKCkxhbmd1YWdlOgotIDkwJSBSdXN0Ci0gMTAlIFB5dGhvbiAodXNlZCBm
b3IgYWRhcHRpbmcgdGhlIGFscmVhZHkgZXhpc3RpbmcgaW50ZWdyYXRpb24gdGVzdHMpCgpNZW50
b3JzOgotIGZhbmRyZWVAYW1hem9uLmNvbQotIGdzc2VyZ2VAYW1hem9uLmNvbQo+Cj4gR29vZCBw
cm9qZWN0IGlkZWFzIGFyZSBzdWl0YWJsZSBmb3IgcmVtb3RlIHdvcmsgYnkgYSBjb21wZXRlbnQK
PiBwcm9ncmFtbWVyIHdobyBpcyBub3QgeWV0IGZhbWlsaWFyIHdpdGggdGhlIGNvZGViYXNlLiBJ
bgo+IGFkZGl0aW9uLCB0aGV5IGFyZToKPiAtIFdlbGwtZGVmaW5lZCAtIHRoZSBzY29wZSBpcyBj
bGVhcgo+IC0gU2VsZi1jb250YWluZWQgLSB0aGVyZSBhcmUgZmV3IGRlcGVuZGVuY2llcwo+IC0g
VW5jb250cm92ZXJzaWFsIC0gdGhleSBhcmUgYWNjZXB0YWJsZSB0byB0aGUgY29tbXVuaXR5Cj4g
LSBJbmNyZW1lbnRhbCAtIHRoZXkgcHJvZHVjZSBkZWxpdmVyYWJsZXMgYWxvbmcgdGhlIHdheQo+
Cj4gRmVlbCBmcmVlIHRvIHBvc3QgaWRlYXMgZXZlbiBpZiB5b3UgYXJlIHVuYWJsZSB0byBtZW50
b3IgdGhlIHByb2plY3QuCj4gSXQgZG9lc24ndCBodXJ0IHRvIHNoYXJlIHRoZSBpZGVhIQo+Cj4g
SSB3aWxsIHJldmlldyBwcm9qZWN0IGlkZWFzIGFuZCBrZWVwIHlvdSB1cC10by1kYXRlIG9uIFFF
TVUncwo+IGFjY2VwdGFuY2UgaW50byBHU29DLgo+Cj4gSW50ZXJuc2hpcCBwcm9ncmFtIGRldGFp
bHM6Cj4gLSBQYWlkLCByZW1vdGUgd29yayBvcGVuIHNvdXJjZSBpbnRlcm5zaGlwcwo+IC0gR1Nv
QyBwcm9qZWN0cyBhcmUgMTc1IG9yIDM1MCBob3VycywgT3V0cmVhY2h5IHByb2plY3RzIGFyZSAz
MAo+IGhycy93ZWVrIGZvciAxMiB3ZWVrcwo+IC0gTWVudG9yZWQgYnkgdm9sdW50ZWVycyBmcm9t
IFFFTVUsIEtWTSwgYW5kIHJ1c3Qtdm1tCj4gLSBNZW50b3JzIHR5cGljYWxseSBzcGVuZCBhdCBs
ZWFzdCA1IGhvdXJzIHBlciB3ZWVrIGR1cmluZyB0aGUgY29kaW5nIHBlcmlvZAo+Cj4gQ2hhbmdl
cyBzaW5jZSBsYXN0IHllYXI6IEdTb0Mgbm93IGhhcyAxNzUgb3IgMzUwIGhvdXIgcHJvamVjdCBz
aXplcwo+IGluc3RlYWQgb2YgMTIgd2VlayBmdWxsLXRpbWUgcHJvamVjdHMuIEdTb0Mgd2lsbCBh
Y2NlcHQgYXBwbGljYW50cyB3aG8KPiBhcmUgbm90IHN0dWRlbnRzLCBiZWZvcmUgaXQgd2FzIGxp
bWl0ZWQgdG8gc3R1ZGVudHMuCj4KPiBGb3IgbW9yZSBiYWNrZ3JvdW5kIG9uIFFFTVUgaW50ZXJu
c2hpcHMsIGNoZWNrIG91dCB0aGlzIHZpZGVvOgo+IGh0dHBzOi8vd3d3LnlvdXR1YmUuY29tL3dh
dGNoP3Y9eE5WQ1g3WU1VTDgKPgo+IFBsZWFzZSBsZXQgbWUga25vdyBpZiB5b3UgaGF2ZSBhbnkg
cXVlc3Rpb25zIQo+Cj4gU3RlZmFuCgoKCgpBbWF6b24gRGV2ZWxvcG1lbnQgQ2VudGVyIChSb21h
bmlhKSBTLlIuTC4gcmVnaXN0ZXJlZCBvZmZpY2U6IDI3QSBTZi4gTGF6YXIgU3RyZWV0LCBVQkM1
LCBmbG9vciAyLCBJYXNpLCBJYXNpIENvdW50eSwgNzAwMDQ1LCBSb21hbmlhLiBSZWdpc3RlcmVk
IGluIFJvbWFuaWEuIFJlZ2lzdHJhdGlvbiBudW1iZXIgSjIyLzI2MjEvMjAwNS4K


