Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E76A9589013
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 18:20:59 +0200 (CEST)
Received: from localhost ([::1]:44252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJH7C-0000kI-6P
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 12:20:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=207aa399e=bchalios@amazon.es>)
 id 1oJH4P-00068V-Ue
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 12:18:06 -0400
Received: from smtp-fw-6001.amazon.com ([52.95.48.154]:13781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=207aa399e=bchalios@amazon.es>)
 id 1oJH4G-0007V6-SY
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 12:18:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.es; i=@amazon.es; q=dns/txt; s=amazon201209;
 t=1659543476; x=1691079476;
 h=message-id:date:mime-version:from:to:references:
 in-reply-to:content-transfer-encoding:subject;
 bh=cZgfLLvQFRErkv2nQkJBXsIv2DmqWOMMiveIq+bQJdU=;
 b=C3iqjFdI0lzhrwky62aMNWOmGCTz5eG7fkoCcHhduxX9oPs3zuUiCvJ8
 +DVfv9BQWA2G6pY+1x8bYFzMcEoD0SjMUcl2vve2MDU9scJAe5nlBUnpu
 IQXUrij6ooykbacZxigGxxPJxsr0kJ2VOyzW2MarHRMuWGw8o6T05n1au o=;
Subject: Re: [PATCH 0/2] vmgenid: add generation counter
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-pdx-2b-28a78e3f.us-west-2.amazon.com) ([10.43.8.2])
 by smtp-border-fw-6001.iad6.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2022 16:17:42 +0000
Received: from EX13D37EUA003.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
 by email-inbound-relay-pdx-2b-28a78e3f.us-west-2.amazon.com (Postfix) with
 ESMTPS id 5BB8BA273C; Wed,  3 Aug 2022 16:17:41 +0000 (UTC)
Received: from [192.168.18.61] (10.43.161.31) by EX13D37EUA003.ant.amazon.com
 (10.43.165.7) with Microsoft SMTP Server (TLS) id 15.0.1497.36;
 Wed, 3 Aug 2022 16:17:37 +0000
Message-ID: <8631898a-bbe2-0f05-52cd-17ae502a1369@amazon.es>
Date: Wed, 3 Aug 2022 18:17:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.0
From: <bchalios@amazon.es>
To: "Michael S. Tsirkin" <mst@redhat.com>, <qemu-devel@nongnu.org>,
 <ani@anisinha.ca>, <imammedo@redhat.com>, <dwmw@amazon.co.uk>,
 <graf@amazon.de>, <xmarcalx@amazon.co.uk>
References: <20220803134147.31073-1-bchalios@amazon.es>
 <20220803113537-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220803113537-mutt-send-email-mst@kernel.org>
X-Originating-IP: [10.43.161.31]
X-ClientProxiedBy: EX13d09UWC003.ant.amazon.com (10.43.162.113) To
 EX13D37EUA003.ant.amazon.com (10.43.165.7)
Precedence: Bulk
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=52.95.48.154;
 envelope-from=prvs=207aa399e=bchalios@amazon.es; helo=smtp-fw-6001.amazon.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

CgpPbiA4LzMvMjIgNTozNiBQTSwgIk1pY2hhZWwgUy4gVHNpcmtpbiIgPG1zdEByZWRoYXQuY29t
PiB3cm90ZToKPiBDQVVUSU9OOiBUaGlzIGVtYWlsIG9yaWdpbmF0ZWQgZnJvbSBvdXRzaWRlIG9m
IHRoZSBvcmdhbml6YXRpb24uIERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRz
IHVubGVzcyB5b3UgY2FuIGNvbmZpcm0gdGhlIHNlbmRlciBhbmQga25vdyB0aGUgY29udGVudCBp
cyBzYWZlLgo+IAo+IAo+IAo+IE9uIFdlZCwgQXVnIDAzLCAyMDIyIGF0IDAzOjQxOjQ1UE0gKzAy
MDAsIGJjaGFsaW9zQGFtYXpvbi5lcyB3cm90ZToKPiA+IEZyb206IEJhYmlzIENoYWxpb3MgPGJj
aGFsaW9zQGFtYXpvbi5lcz4KPiA+Cj4gPiBWTSBnZW5lcmF0aW9uIElEIGV4cG9zZXMgYSBHVUlE
IGluc2lkZSB0aGUgVk0gd2hpY2ggY2hhbmdlcyBldmVyeSB0aW1lIGEKPiA+IFZNIHJlc3RvcmUg
aXMgaGFwcGVuaW5nLiBUeXBpY2FsbHksIHRoaXMgR1VJRCBpcyB1c2VkIGJ5IHRoZSBndWVzdAo+
ID4ga2VybmVsIHRvIHJlLXNlZWQgaXRzIGludGVybmFsIFBSTkcuIEFzIGEgcmVzdWx0LCB0aGlz
IHZhbHVlIGNhbm5vdCBiZQo+ID4gZXhwb3NlZCBpbiBndWVzdCB1c2VyLXNwYWNlIGFzIGEgbm90
aWZpY2F0aW9uIG1lY2hhbmlzbSBmb3IgVk0gcmVzdG9yZQo+ID4gZXZlbnRzLgo+ID4KPiA+IFRo
aXMgcGF0Y2ggc2V0IGV4dGVuZHMgdm1nZW5pZCB0byBpbnRyb2R1Y2UgYSAzMiBiaXRzIGdlbmVy
YXRpb24gY291bnRlcgo+ID4gd2hvc2UgcHVycG9zZSBpcyB0byBiZSB1c2VkIGFzIGEgVk0gcmVz
dG9yZSBub3RpZmljYXRpb24gbWVjaGFuaXNtIGZvcgo+ID4gdGhlIGd1ZXN0IHVzZXItc3BhY2Uu
Cj4gPgo+ID4gSXQgaXMgdHJ1ZSB0aGF0IHN1Y2ggYSBjb3VudGVyIGNvdWxkIGJlIGltcGxlbWVu
dGVkIGVudGlyZWx5IGJ5IHRoZQo+ID4gZ3Vlc3Qga2VybmVsLCBidXQgdGhpcyB3b3VsZCByZWx5
IG9uIHRoZSB2bWdlbmlkIEFDUEkgbm90aWZpY2F0aW9uIHRvCj4gPiB0cmlnZ2VyIHRoZSBjb3Vu
dGVyIHVwZGF0ZSwgd2hpY2ggaXMgaW5oZXJlbnRseSByYWN5LiBFeHBvc2luZyB0aGlzCj4gPiB0
aHJvdWdoIHRoZSBtb25pdG9yIGFsbG93cyB0aGUgdXBkYXRlZCB2YWx1ZSB0byBiZSBpbi1wbGFj
ZSBiZWZvcmUKPiA+IHJlc3VtaW5nIHRoZSB2Y3B1cywgc28gaW50ZXJlc3RlZCB1c2VyLXNwYWNl
IGNvZGUgY2FuIChhdG9taWNhbGx5KQo+ID4gb2JzZXJ2ZSB0aGUgdXBkYXRlIHdpdGhvdXQgcmVs
eWluZyBvbiB0aGUgQUNQSSBub3RpZmljYXRpb24uCj4gCj4gUHJvZHVjaW5nIGFub3RoZXIgNCBi
eXRlcyBpcyBub3QgcmVhbGx5IHRoZSBpc3N1ZSwgdGhlIGlzc3VlCj4gaXMgaG93IGRvZXMgZ3Vl
c3QgY29uc3VtZSB0aGlzLgo+IFNvIEkgd291bGQgbGlrZSB0aGlzIGRpc2N1c3Npb24gdG8gaGFw
cGVuIG9uIHRoZSBsaW51eCBrZXJuZWwgbWFpbGluZwo+IGxpc3Qgbm90IGp1c3QgaGVyZS4gIENh
biB5b3UgcG9zdCB0aGUgbGludXggcGF0Y2ggcGxlYXNlPwo+IAoKQ0NlZCB5b3UgaW4gdGhlIExp
bnV4IHBhdGNoIHRocmVhZC4KCj4gCj4gCj4gCj4gPiBCYWJpcyBDaGFsaW9zICgyKToKPiA+ICAg
IHZtZ2VuaWQ6IG1ha2UgZGV2aWNlIGRhdGEgc2l6ZSBjb25maWd1cmFibGUKPiA+ICAgIHZtZ2Vu
aWQ6IGFkZCBnZW5lcmF0aW9uIGNvdW50ZXIKPiA+Cj4gPiAgIGRvY3Mvc3BlY3Mvdm1nZW5pZC50
eHQgICAgfCAxMDEgKysrKysrKysrKysrKysrKysrLS0tLS0tLS0KPiA+ICAgaHcvYWNwaS92bWdl
bmlkLmMgICAgICAgICB8IDE0NSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0t
LQo+ID4gICBpbmNsdWRlL2h3L2FjcGkvdm1nZW5pZC5oIHwgIDIzICsrKystLQo+ID4gICAzIGZp
bGVzIGNoYW5nZWQsIDIwNCBpbnNlcnRpb25zKCspLCA2NSBkZWxldGlvbnMoLSkKPiA+Cj4gPiAt
LQo+ID4gMi4zNy4xCj4gPgo+ID4gQW1hem9uIFNwYWluIFNlcnZpY2VzIHNvY2llZGFkIGxpbWl0
YWRhIHVuaXBlcnNvbmFsLCBDYWxsZSBSYW1pcmV6IGRlIFByYWRvIDUsIDI4MDQ1IE1hZHJpZC4g
UmVnaXN0cm8gTWVyY2FudGlsIGRlIE1hZHJpZCAuIFRvbW8gMjI0NTggLiBGb2xpbyAxMDIgLiBI
b2phIE0tNDAxMjM0IC4gQ0lGIEI4NDU3MDkzNgo+IAo+IApBbWF6b24gU3BhaW4gU2VydmljZXMg
c29jaWVkYWQgbGltaXRhZGEgdW5pcGVyc29uYWwsIENhbGxlIFJhbWlyZXogZGUgUHJhZG8gNSwg
MjgwNDUgTWFkcmlkLiBSZWdpc3RybyBNZXJjYW50aWwgZGUgTWFkcmlkIC4gVG9tbyAyMjQ1OCAu
IEZvbGlvIDEwMiAuIEhvamEgTS00MDEyMzQgLiBDSUYgQjg0NTcwOTM2Cg==


