Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 424924E60C3
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 09:58:00 +0100 (CET)
Received: from localhost ([::1]:55696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXJI7-0002Jl-4Y
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 04:57:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leohou163@163.com>) id 1nXJ4a-0000KP-OG
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 04:44:00 -0400
Received: from m13123.mail.163.com ([220.181.13.123]:24051)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <leohou163@163.com>) id 1nXJ4V-0000X3-Bc
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 04:43:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=s0t4H
 j/L52vjeuFj5yYC0ZhBcdNe4v6RzR77/am25Ck=; b=Y+oKu9PFiuRefkHQf3qpa
 Et6qyISWzqXPPWiqfVE6eE7njzI3vkX60nb4Hxh7q4ya2gImLp7jT/7DtPc7Uxjh
 lge8IPPc9ogdwPae4NuafhNNX0SacOCCCCJvXDbmFvu1IgRHjom8ccV8jKyl3/iD
 uz/b38jsK0m26ewbiS0qME=
Received: from leohou163$163.com ( [114.249.224.138] ) by
 ajax-webmail-wmsvr123 (Coremail) ; Thu, 24 Mar 2022 16:43:48 +0800 (CST)
X-Originating-IP: [114.249.224.138]
Date: Thu, 24 Mar 2022 16:43:48 +0800 (CST)
From: leohou  <leohou163@163.com>
To: "Jason Wang" <jasowang@redhat.com>
Subject: Re:Re: Address mapping for vIOMMU
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20210622(1d4788a8)
 Copyright (c) 2002-2022 www.mailtech.cn 163com
In-Reply-To: <CACGkMEvcVGvB2ZEes20cVBA1_8TWdDo1o-jPw07R4TOEXNi0kQ@mail.gmail.com>
References: <155d85bb.2709.17fba1369b0.Coremail.leohou163@163.com>
 <CACGkMEvcVGvB2ZEes20cVBA1_8TWdDo1o-jPw07R4TOEXNi0kQ@mail.gmail.com>
X-CM-CTRLDATA: Ycct/mZvb3Rlcl9odG09MTgzMDo1Ng==
Content-Type: multipart/alternative; 
 boundary="----=_Part_76607_634717223.1648111428155"
MIME-Version: 1.0
Message-ID: <441d80cf.51b7.17fbb18a23b.Coremail.leohou163@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: e8GowACHEARELzxiY6MMAA--.16074W
X-CM-SenderInfo: xohrx0jxrwjqqrwthudrp/1tbiDwTNPlUMcQj02wACs1
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
Received-SPF: pass client-ip=220.181.13.123; envelope-from=leohou163@163.com;
 helo=m13123.mail.163.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

------=_Part_76607_634717223.1648111428155
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: base64

QXQgMjAyMi0wMy0yNCAxMjoyNzo0NiwgIkphc29uIFdhbmciIDxqYXNvd2FuZ0ByZWRoYXQuY29t
PiB3cm90ZToKPk9uIFRodSwgTWFyIDI0LCAyMDIyIGF0IDEyOjE1IFBNIGxlb2hvdSA8bGVvaG91
MTYzQDE2My5jb20+IHdyb3RlOgo+Pgo+PiBoaSBhbGwsCj4+IFdoZW4gSSB1c2UgRFBESyBpbiBn
dWVzdE9TICBhbmQgIGNvbmZpZ2VyaW5nIHRoZSBWTSB3aXRoIHZJT01NVSwgSSBmb3VuZCB0aGF0
ICBzZW5kaW5nIHRoZSBnVkEgdG8gdGhlIGhhcmR3YXJlIGRldmljZSAsIHRoZSBoYXJkd2FyZSBk
ZXZpY2UgY2FuJ3QgIGZpbmQgdGhlIHJlYWwgZGF0YS4KPj4gQnV0IHNlbmRpbmcgdGhlIGdQQSB0
byB0aGUgaGFyZHdhcmUgZGV2aWNlLCB0aGUgaGFyZHdhcmUgZGV2aWNlIGNhbiAgZmluZCB0aGUg
cmVhbCBkYXRhLgo+Pgo+PiBFbnZpcm9ubWVudDoKPj4gT1M6IExpbnV4IHZlcnNpb24gNS40LjAt
MTA0LWdlbmVyaWMgKGJ1aWxkZEB1YnVudHUpIChnY2MgdmVyc2lvbiA5LjMuMCAoVWJ1bnR1IDku
My4wLTE3dWJ1bnR1MX4yMC4wNCkpICMxMTgtVWJ1bnR1IFNNUCBXZWQgTWFyIDIgMTk6MDI6NDEg
VVRDIDIwMjIKPj4gUUVNVTogUUVNVSBlbXVsYXRvciB2ZXJzaW9uIDQuMi4xIChEZWJpYW4gMTo0
LjItM3VidW50dTYuMjEpCj4+IERldmljZTogdmlydGlvLW5ldAo+Pgo+PiBRdWVzdGlvbjoKPj4g
VGhlIHZJT01NVSBkb2Vzbid0IHdvcms/Cj4+IEkga25vdyB2aXJ0aW8tbmV0IGRvZXMgbm90IGhh
dmUgRE1BLCBzbyB3aGVuIHZpcnRpby1uZXQgYW5kIERQREsgYXJlIGNvbWJpbmVkLCBJT01NVSBp
cyBub3QgbmVlZGVkPwo+Cj52SU9NTVUgKyB2aXJ0aW8tbmV0IHdvcmtzIGZvciBtZSBsaWtlIGEg
Y2hhcm0uCj4KPkRQREsgc3VwcG9ydGVkIHZJT01NVSBsb25nIGFnbyB3aXRoIHZpcnRpby1uZXQu
Cj4KPk1ha2Ugc3VyZSB5b3UgdklPTU1VIGlzIGVuYWJsZWQgaW4gdGhlIGd1ZXN0IChpbnRlbF9p
b21tdT1vbiBpbiBndWVzdAo+a2VybmVsIGNvbW1hbmQgbGluZSwgYW5kIGVuYWJsZV91bnNhZmVf
bm9pb21tdV9tb2RlIGlzICpub3QqIDEpCj4KPlRoYW5rcwo+Cj4+Cj4+Cj4+Cgo+CmhpLCBqYXNv
bgpJJ20gc3VyZSBteSB2SU9NTVUgaXMgZW5hYmxlZCBpbiB0aGUgZ3Vlc3RPUyhpbnRlbF9pb21t
dT1vbiBpbiBndWVzdCAga2VybmVsIGNvbW1hbmQgbGluZSwgYW5kIGVuYWJsZV91bnNhZmVfbm9p
b21tdV9tb2RlIGlzICIwIiksCmJ1dCBpdCBvbmx5IHdvcmsgd2hlbiBJIGNvbmZpZyB0aGUgRFBE
SyBpbiBwYXNzaW5nIHBoeXNpY2FsIGFkZHJlc3NlcyBtb2RlbC4KU28sIEkgdGhpbmsgcUVNVSBl
bXVsYXRpb24gb2YgVmlydGlvLW5ldCBoYXMgbm8gRE1BLCBzbyB2aXJ0IHF1ZXVlIHJlZ2lzdGVy
IGluIFBDSWUgc3BhY2Ugb2YgVmlydGlvLU5FVCBjYW4gb25seSBjb25maWd1cmUgdGhlIHBoeXNp
Y2FsIGFkZHJlc3Mgb2YgdmlydCBxdWV1ZS4KCgpDYW4gSSB0YWtlIGl0IHRoaXMgd2F5PwoKClRo
YW5rcyEK
------=_Part_76607_634717223.1648111428155
Content-Type: text/html; charset=GBK
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0ibGluZS1oZWlnaHQ6MS43O2NvbG9yOiMwMDAwMDA7Zm9udC1zaXplOjE0cHg7
Zm9udC1mYW1pbHk6QXJpYWwiPkF0IDIwMjItMDMtMjQgMTI6Mjc6NDYsICJKYXNvbiBXYW5nIiAm
bHQ7amFzb3dhbmdAcmVkaGF0LmNvbSZndDsgd3JvdGU6CjxwcmU+Jmd0O09uIFRodSwgTWFyIDI0
LCAyMDIyIGF0IDEyOjE1IFBNIGxlb2hvdSAmbHQ7bGVvaG91MTYzQDE2My5jb20mZ3Q7IHdyb3Rl
OgomZ3Q7Jmd0OwomZ3Q7Jmd0OyBoaSBhbGwsCiZndDsmZ3Q7IFdoZW4gSSB1c2UgRFBESyBpbiBn
dWVzdE9TICBhbmQgIGNvbmZpZ2VyaW5nIHRoZSBWTSB3aXRoIHZJT01NVSwgSSBmb3VuZCB0aGF0
ICBzZW5kaW5nIHRoZSBnVkEgdG8gdGhlIGhhcmR3YXJlIGRldmljZSAsIHRoZSBoYXJkd2FyZSBk
ZXZpY2UgY2FuJ3QgIGZpbmQgdGhlIHJlYWwgZGF0YS4KJmd0OyZndDsgQnV0IHNlbmRpbmcgdGhl
IGdQQSB0byB0aGUgaGFyZHdhcmUgZGV2aWNlLCB0aGUgaGFyZHdhcmUgZGV2aWNlIGNhbiAgZmlu
ZCB0aGUgcmVhbCBkYXRhLgomZ3Q7Jmd0OwomZ3Q7Jmd0OyBFbnZpcm9ubWVudDoKJmd0OyZndDsg
T1M6IExpbnV4IHZlcnNpb24gNS40LjAtMTA0LWdlbmVyaWMgKGJ1aWxkZEB1YnVudHUpIChnY2Mg
dmVyc2lvbiA5LjMuMCAoVWJ1bnR1IDkuMy4wLTE3dWJ1bnR1MX4yMC4wNCkpICMxMTgtVWJ1bnR1
IFNNUCBXZWQgTWFyIDIgMTk6MDI6NDEgVVRDIDIwMjIKJmd0OyZndDsgUUVNVTogUUVNVSBlbXVs
YXRvciB2ZXJzaW9uIDQuMi4xIChEZWJpYW4gMTo0LjItM3VidW50dTYuMjEpCiZndDsmZ3Q7IERl
dmljZTogdmlydGlvLW5ldAomZ3Q7Jmd0OwomZ3Q7Jmd0OyBRdWVzdGlvbjoKJmd0OyZndDsgVGhl
IHZJT01NVSBkb2Vzbid0IHdvcms/CiZndDsmZ3Q7IEkga25vdyB2aXJ0aW8tbmV0IGRvZXMgbm90
IGhhdmUgRE1BLCBzbyB3aGVuIHZpcnRpby1uZXQgYW5kIERQREsgYXJlIGNvbWJpbmVkLCBJT01N
VSBpcyBub3QgbmVlZGVkPwomZ3Q7CiZndDt2SU9NTVUgKyB2aXJ0aW8tbmV0IHdvcmtzIGZvciBt
ZSBsaWtlIGEgY2hhcm0uCiZndDsKJmd0O0RQREsgc3VwcG9ydGVkIHZJT01NVSBsb25nIGFnbyB3
aXRoIHZpcnRpby1uZXQuCiZndDsKJmd0O01ha2Ugc3VyZSB5b3UgdklPTU1VIGlzIGVuYWJsZWQg
aW4gdGhlIGd1ZXN0IChpbnRlbF9pb21tdT1vbiBpbiBndWVzdAomZ3Q7a2VybmVsIGNvbW1hbmQg
bGluZSwgYW5kIGVuYWJsZV91bnNhZmVfbm9pb21tdV9tb2RlIGlzICpub3QqIDEpCiZndDsKJmd0
O1RoYW5rcwomZ3Q7CiZndDsmZ3Q7CiZndDsmZ3Q7CiZndDsmZ3Q7CjwvcHJlPjxkaXY+Jmd0Ozwv
ZGl2PjxkaXY+aGksIGphc29uPC9kaXY+PGRpdj5JJ20gc3VyZSBteSB2SU9NTVUgaXMgZW5hYmxl
ZCBpbiB0aGUgZ3Vlc3RPUyhpbnRlbF9pb21tdT1vbiBpbiBndWVzdCZuYnNwOyBrZXJuZWwgY29t
bWFuZCBsaW5lLCBhbmQgZW5hYmxlX3Vuc2FmZV9ub2lvbW11X21vZGUgaXMgIjAiKSw8L2Rpdj48
ZGl2PmJ1dCBpdCBvbmx5IHdvcmsgd2hlbiBJIGNvbmZpZyB0aGUgRFBESyBpbiBwYXNzaW5nIHBo
eXNpY2FsIGFkZHJlc3NlcyBtb2RlbC48L2Rpdj48ZGl2PlNvLCBJIHRoaW5rIHFFTVUgZW11bGF0
aW9uIG9mIFZpcnRpby1uZXQgaGFzIG5vIERNQSwgc28gdmlydCBxdWV1ZSByZWdpc3RlciBpbiBQ
Q0llIHNwYWNlIG9mIFZpcnRpby1ORVQgY2FuIG9ubHkgY29uZmlndXJlIHRoZSBwaHlzaWNhbCBh
ZGRyZXNzIG9mIHZpcnQgcXVldWUuPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5DYW4gSSB0YWtl
IGl0IHRoaXMgd2F5PzwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+VGhhbmtzITxicj4KPC9kaXY+
PC9kaXY+PGJyPjxicj48c3BhbiB0aXRsZT0ibmV0ZWFzZWZvb3RlciI+PHA+Jm5ic3A7PC9wPjwv
c3Bhbj4=
------=_Part_76607_634717223.1648111428155--


