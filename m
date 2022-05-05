Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9114751B5F5
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 04:31:45 +0200 (CEST)
Received: from localhost ([::1]:33734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmRHM-0002JQ-Ar
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 22:31:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shuizhuyuanluo@126.com>)
 id 1nmRG7-0001cP-Jb
 for qemu-devel@nongnu.org; Wed, 04 May 2022 22:30:27 -0400
Received: from m1513.mail.126.com ([220.181.15.13]:58294)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <shuizhuyuanluo@126.com>) id 1nmRG0-0006V3-DC
 for qemu-devel@nongnu.org; Wed, 04 May 2022 22:30:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=q4Ul3
 s32h5CeGhiUzjzjwiPDv9MMYGNrQ9ECDA+vsj8=; b=aQXCLXxmp9w2YNYD1BEVf
 RTOG62JOM3hieD9IRSnZThakzmHvaYY3xMuyjbJIRE0VfzmvqByaKV2x49KjZ77J
 iGN5syfAEabbYE3/DaVysAC+4BugZqcJXx62fOftrtwOEdYF9QyifoXu3mH18YYI
 rukfazX2PEapBlC65Ja/uc=
Received: from shuizhuyuanluo$126.com ( [101.228.28.144] ) by
 ajax-webmail-wmsvr13 (Coremail) ; Thu, 5 May 2022 10:29:59 +0800 (CST)
X-Originating-IP: [101.228.28.144]
Date: Thu, 5 May 2022 10:29:59 +0800 (CST)
From: nihui  <shuizhuyuanluo@126.com>
To: "Palmer Dabbelt" <palmer@dabbelt.com>
Cc: alistair23@gmail.com, "Kito Cheng" <kito.cheng@gmail.com>, 
 qemu-devel@nongnu.org
Subject: Re: [PATCH] linux-user: Expose risc-v V and H isa bit in
 get_elf_hwcap()
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20210622(1d4788a8)
 Copyright (c) 2002-2022 www.mailtech.cn 126com
In-Reply-To: <mhng-205d4899-352a-4ef8-b8c9-d251d83d8071@palmer-ri-x1c9>
References: <mhng-205d4899-352a-4ef8-b8c9-d251d83d8071@palmer-ri-x1c9>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
MIME-Version: 1.0
Message-ID: <9112465.1c07.180920d7dab.Coremail.shuizhuyuanluo@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: DcqowABnF3qoNnNiPuIkAA--.21516W
X-CM-SenderInfo: pvkxx65kx13tpqox0qqrswhudrp/1tbiOgj3eluvoP6igAAAs3
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
Received-SPF: pass client-ip=220.181.15.13;
 envelope-from=shuizhuyuanluo@126.com; helo=m1513.mail.126.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QWgsIEkgYWRtaXQgdGhhdCBJIGhhdmVuJ3QgdGVzdGVkIHRoZSBhdmFpbGFiaWxpdHkgb2YgdGhl
IEggZXh0ZW5zaW9uLApJIGNvdWxkIHVwZGF0ZSB0aGUgbmV3IHBhdGNoIHRvIG9ubHkgYWRkIHRo
ZSBWIGV4dGVuc2lvbi4KClJlZ2FyZGluZyB0aGUgbW90aXZhdGlvbiBmb3IgdGhpcyBtb2RpZmlj
YXRpb24sCnRoZSBuY25uIHByb2plY3QgdXNlcyB0aGUgcmlzYy12IHZlY3RvciBleHRlbnNpb24g
dG8gb3B0aW1pemUgdGhlIGVmZmljaWVuY3kgb2Ygbm4gaW5mZXJlbmNlLgpJIGFtIHZlcnkgaGFw
cHkgdG8gZmluZCB0aGF0IHFlbXUgYWxyZWFkeSBzdXBwb3J0cyBydnYuCkkgd2FudCB0byB1c2Ug
cWVtdSdzIHVzZXJzcGFjZSBtb2RlIHRvIGRvIHVuaXQgdGVzdGluZyBmYXN0ZXIgYW5kIG1vcmUg
Y29udmVuaWVudGx5IG9uIHRoZSBjaSBzZXJ2ZXIuCgpJbiB0aGUgcGFzdCwgSSB1c2VkIHRoZSBy
dnYgYnJhbmNoIG9mIHNpZml2ZS9xZW11LgpPbiB0aGF0IGJyYW5jaCwgdGhlIFYgYml0IGV4aXN0
cyBpbiBod2NhcCBhbmQgd29ya3Mgd2VsbCBbMV0uCkkgY2FuIGRpc3Rpbmd1aXNoIGF0IHJ1bnRp
bWUgd2hldGhlciB0aGUgY3VycmVudCBzeXN0ZW0gc3VwcG9ydHMgcnZ2IGJ5IGNoZWNraW5nIHRo
aXMgYml0LgoKQXMgYW4gZWFybHkgYWRvcHRlciBvZiBydnYsIEkgdGhpbmsgZXhwb3NpbmcgViBi
aXQgd2lsbCBoZWxwIHJ2diB0byBiZSBtb3JlIHRlc3RlZCBhbmQgd2lkZWx5IHVzZWQuCkFmdGVy
IGFsbCwgcnZ2IGlzIG5vdCBlbmFibGVkIGJ5IGRlZmF1bHQuClRoaXMgViBiaXQgd2lsbCBvbmx5
IGV4aXN0IGluIHRoZSAtY3B1IHJ2NjQsdj10cnVlIHBhcmFtZXRlciwgd2hpY2ggaXMgZm9yIHNv
bWUgYWR2YW5jZWQgZGV2ZWxvcGVycy4KV2Uga25vdyB0aGF0IHFlbXUgY3VycmVudGx5IGltcGxl
bWVudHMgcnZ2LTEuMCBhbmQgcmVtb3ZlcyBydnYtMC43LjEuCgpbMV0gaHR0cHM6Ly9naXRodWIu
Y29tL3NpZml2ZS9xZW11L2NvbW1pdC83YTNlOGUyM2I0Y2YxNDIyZWM0OGU5ZDRiNDAwOTMzN2Ew
NWE2MzVkCgpiZXN0IHdpc2hlcwpuaWh1aQoKQXQgMjAyMi0wNS0wNSAwMDowNTozMSwgIlBhbG1l
ciBEYWJiZWx0IiA8cGFsbWVyQGRhYmJlbHQuY29tPiB3cm90ZToKPk9uIFdlZCwgMDQgTWF5IDIw
MjIgMDg6MTA6MDMgUERUICgtMDcwMCksIGFsaXN0YWlyMjNAZ21haWwuY29tIHdyb3RlOgo+PiBP
biBXZWQsIE1heSA0LCAyMDIyIGF0IDI6MzIgUE0gbmlodWkgPHNodWl6aHV5dWFubHVvQDEyNi5j
b20+IHdyb3RlOgo+Pj4KPj4+IFRoaXMgcGF0Y2ggYnJpbmdzIHRoZSBvcHRpb25hbCByaXNjLXYg
dmVjdG9yIGFuZCBoeXBlcnZpc29yIGJpdHMKPj4+IGluIGh3Y2FwIHNvIHRoYXQgYXBwbGljYXRp
b24gY291bGQgZGV0ZWN0IHRoZXNlIGlzYSBzdXBwb3J0IGZyb20KPj4+IC9wcm9jL3NlbGYvYXV4
diBjb3JyZWN0bHkgaW4gcWVtdSB1c2Vyc3BhY2UgbW9kZS4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5
OiBOaSBIdWkgPHNodWl6aHV5dWFubHVvQDEyNi5jb20+Cj4+PiAtLS0KPj4+ICBsaW51eC11c2Vy
L2VsZmxvYWQuYyB8IDMgKystCj4+PiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9saW51eC11c2VyL2VsZmxvYWQuYyBi
L2xpbnV4LXVzZXIvZWxmbG9hZC5jCj4+PiBpbmRleCA2MTA2M2ZkOTc0Li4zZjBlZjJiOGY2IDEw
MDY0NAo+Pj4gLS0tIGEvbGludXgtdXNlci9lbGZsb2FkLmMKPj4+ICsrKyBiL2xpbnV4LXVzZXIv
ZWxmbG9hZC5jCj4+PiBAQCAtMTQ4NCw3ICsxNDg0LDggQEAgc3RhdGljIHVpbnQzMl90IGdldF9l
bGZfaHdjYXAodm9pZCkKPj4+ICAjZGVmaW5lIE1JU0FfQklUKEVYVCkgKDEgPDwgKEVYVCAtICdB
JykpCj4+PiAgICAgIFJJU0NWQ1BVICpjcHUgPSBSSVNDVl9DUFUodGhyZWFkX2NwdSk7Cj4+PiAg
ICAgIHVpbnQzMl90IG1hc2sgPSBNSVNBX0JJVCgnSScpIHwgTUlTQV9CSVQoJ00nKSB8IE1JU0Ff
QklUKCdBJykKPj4+IC0gICAgICAgICAgICAgICAgICAgIHwgTUlTQV9CSVQoJ0YnKSB8IE1JU0Ff
QklUKCdEJykgfCBNSVNBX0JJVCgnQycpOwo+Pj4gKyAgICAgICAgICAgICAgICAgICAgfCBNSVNB
X0JJVCgnRicpIHwgTUlTQV9CSVQoJ0QnKSB8IE1JU0FfQklUKCdDJykKPj4+ICsgICAgICAgICAg
ICAgICAgICAgIHwgTUlTQV9CSVQoJ1YnKSB8IE1JU0FfQklUKCdIJyk7Cj4+Cj4+IFRoZSBrZXJu
ZWwgZG9lc24ndCBzdXBwb3J0IEggb3IgVi4gSSB1bmRlcnN0YW5kIFYgc2hvdWxkIGJlIHN1cHBv
cnRlZAo+PiBpbiB0aGUgZnV0dXJlLCBidXQgd2hhdCBpcyB0aGUgdXNlIGNhc2UgZm9yIEg/Cj4K
PklNTyBldmVuIFYgaXMgYSBiaXQgaW4gcXVlc3Rpb246IHN1cmUgdGhhdCBiaXQncyBsaWtlbHkg
dG8gYmUgc2V0IGF0IAo+c29tZSBwb2ludCwgYnV0IHRoZXJlJ3MgbWFueSBmbGF2b3JzIG9mIFYg
bm93IGFuZCB3ZSdsbCBoYXZlIHRvIGdpdmUgCj51c2Vyc3BhY2UgYSB3YXkgdG8gZGlmZmVyZW50
aWF0ZSBiZXR3ZWVuIHRoZW0uICBUaGVyZSdzIGJlZW4gc29tZSAKPnByb3Bvc2FscyAoc2VlIEtp
dG8ncyB0YWxrIGZyb20gUGx1bWJlcnMgbGFzdCB5ZWFyLCBmb3IgZXhhbXBsZSkgYWJvdXQgCj5o
b3cgdG8gZGVhbCB3aXRoIHRoaXMsIGJ1dCBub3RoaW5nIHJlYWxseSBjb25jcmV0ZSBoYXMgc2hv
d24gdXAgeWV0Lgo+Cj5JZiB3ZSBmbGlwIG9uIHRoZSBWIGJpdCBpbiB1c2VyIG1vZGUgZW11bGF0
aW9uIHRoZW4gd2UgcnVuIHRoZSByaXNrIG9mIAo+aGF2aW5nIGEgd2Fja3kgQUJJIGhlcmUsIHdo
ZXJlIFFFTVUgaXMgc2V0dGluZyB0aGUgViBiaXQgYnV0IHRoZW4gbm90IAo+c2V0dGluZyB3aGF0
ZXZlciBleHRyYSBpbmZvIGlzIGV4cGVjdGVkIHRvIGNvbWUgYWxvbmcgd2l0aCBpdC4gIFRoYXQn
ZCAKPm1lYW4gdXNlcnNwYWNlIGhhcyB0byBkZWFsIHdpdGggdGhhdCBjYXNlIC0tIG1heWJlIHRo
YXQncyBub3QgdGhlIHdvcnN0IAo+cHJvYmxlbSwgYW5kIEkgZ3Vlc3MgaXQncyBiZXR0ZXIgdGhh
biBqdXN0IGFzc3VtaW5nIFYgaXMgYWx3YXlzIG9uLCAKPndoaWNoIGlzIGFsbCB1c2Vyc3BhY2Ug
Y2FuIGRvIG5vdywgYnV0IGFueSBBQkkgZGl2ZXJnZW5jZSBpcyBnb2luZyB0byAKPmxlYWQgdG8g
aGVhZGFjaGVzIGF0IHNvbWUgcG9pbnQuCj4KPklNTyB0aGUgcmlnaHQgd2F5IGZvcndhcmQgaGVy
ZSBpcyB0byBqdXN0IHNvcnQgb3V0IHdoYXQgdGhlIGFjdHVhbCAKPmludGVyZmFjZSBpcywgbGFz
dCB0aW1lIEkgdGFsa2VkIHRvIEtpdG8gYWJvdXQgaXQgd2UgaGFkIGEgcm91Z2ggaWRlYSBvZiAK
PndoZXJlIHRvIGdvIGFuZCBwbGFucyB0byBkbyBpdC4gIE5vdCBzdXJlIHdoYXQncyB1cCB0aGVz
ZSBkYXlzLCBzbyBJJ3ZlIAo+YWRkZWQgaGltIHRvIHRoZSB0aHJlYWQuICBJZiBpdCdzIGEgbG9u
ZyB3YXkgb2ZmIHRoZW4gd2UgY2FuIGFsd2F5cyB0b3NzIAo+c29tZSBpbnRlcm1lZGlhdGUgdGhp
bmcgdG9nZXRoZXIgbGlrZSB0aGlzLCBidXQgaWYgaXQncyBjbG9zZSB0aGVuIGl0J3MgCj5wcm9i
YWJseSBiZXN0IHRvIGp1c3QgZ2V0IHRoZSBpbnRlcmZhY2UgaXJvbmVkIG91dCBhbmQgdGhlbiBo
YXZlIGl0IAo+bWF0Y2guCj4KPj4KPj4gQWxpc3RhaXIKPj4KPj4+Cj4+PiAgICAgIHJldHVybiBj
cHUtPmVudi5taXNhX2V4dCAmIG1hc2s7Cj4+PiAgI3VuZGVmIE1JU0FfQklUCj4+PiAtLQo+Pj4g
Mi4yNS4xCj4+Pgo+Pj4K

