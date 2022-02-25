Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 727A34C3CE4
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 05:07:51 +0100 (CET)
Received: from localhost ([::1]:37370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNRtW-0000ng-IP
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 23:07:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wliang@stu.xidian.edu.cn>)
 id 1nNRrl-0007fT-MB
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 23:06:03 -0500
Received: from azure-sdnproxy.icoremail.net ([52.187.6.220]:38286
 helo=azure-sdnproxy-1.icoremail.net)
 by eggs.gnu.org with smtp (Exim 4.90_1)
 (envelope-from <wliang@stu.xidian.edu.cn>) id 1nNRrj-0003FS-3G
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 23:06:01 -0500
Received: by ajax-webmail-sr0414.icoremail.net (Coremail) ; Fri, 25 Feb 2022
 12:05:48 +0800 (GMT+08:00)
X-Originating-IP: [39.128.6.55]
Date: Fri, 25 Feb 2022 12:05:48 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: wliang@stu.xidian.edu.cn
To: "Richard Henderson" <richard.henderson@linaro.org>
Subject: Re: Re: Fix a potential Use-after-free bug in
 handle_simd_shift_fpint_conv() (v6.2.0).
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20210401(fdb522e2)
 Copyright (c) 2002-2022 www.mailtech.cn
 mispb-ac60dc67-ddbe-4478-9127-1d3314495f10-icoremail.net
In-Reply-To: <3c7903dd-fc50-3b05-8419-0f5011c5e82c@linaro.org>
References: <5ec4ffe1.25b2.17f27005362.Coremail.wliang@stu.xidian.edu.cn>
 <3c7903dd-fc50-3b05-8419-0f5011c5e82c@linaro.org>
Content-Type: multipart/mixed; 
 boundary="----=_Part_10545_2050624140.1645761948965"
MIME-Version: 1.0
Message-ID: <5cca42a6.b21.17f2f0e6d26.Coremail.wliang@stu.xidian.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: AQAAfwAXVJGdVRhiFb0EAA--.544W
X-CM-SenderInfo: pzolt0vj6v33wo0lvxldqovvfxof0/1tbiAQAOA1wR-vcKugAAs4
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
 CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
 daVFxhVjvjDU=
Received-SPF: pass client-ip=52.187.6.220;
 envelope-from=wliang@stu.xidian.edu.cn; helo=azure-sdnproxy-1.icoremail.net
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_VALIDITY_RPBL=1.31, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

------=_Part_10545_2050624140.1645761948965
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

Cj4gCj4gVGhlIGZpeCBpcyBjb3JyZWN0LiAgV2UganVzdCBuZWVkIHRoZSBzdWJtaXNzaW9uIGZv
cm1hdHRlZCBwcm9wZXJseSwgd2l0aCB5b3VyIAo+IFNpZ25lZC1vZmYtYnkgdGFnLiAgV2hlbiBy
ZS1mb3JtYXR0aW5nLCB5b3UgY2FuIGFkZCBteQo+IAo+IFJldmlld2VkLWJ5OiBSaWNoYXJkIEhl
bmRlcnNvbiA8cmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZz4KPiAKCj4gcn4KCkhpIGd1eXMs
CgpUaGFuayB5b3UgZm9yIHdhaXRpbmcgZm9yIG1lLgoKSGVyZSBpcyBhIG5ldyBwYXRjaCB3aXRo
IFNpZ25lZC1vZmYtYnkgdGFncy4KCkJlc3QsCldlbnRhbwo=
------=_Part_10545_2050624140.1645761948965
Content-Type: text/x-patch; 
	name=0001-Fix-a-potential-Use-after-free-bug-in-handle_simd_sh.patch
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-Fix-a-potential-Use-after-free-bug-in-handle_simd_sh.patch"

RnJvbSAxNTEyOWUyY2VjNDgzYTg0MTY3MzhiMjY2YmMzYjM2ZDU2OTU5ZjY5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBXZW50YW9fTGlhbmcgPFdlbnRhb19MaWFuZ19nQDE2My5jb20+
CkRhdGU6IEZyaSwgMjUgRmViIDIwMjIgMTI6MDE6NDIgKzA4MDAKU3ViamVjdDogW1BBVENIXSBG
aXggYSBwb3RlbnRpYWwgVXNlLWFmdGVyLWZyZWUgYnVnIGluCiBoYW5kbGVfc2ltZF9zaGlmdF9m
cGludF9jb252KCkKClNpZ25lZC1vZmYtYnk6IFdlbnRhb19MaWFuZyA8V2VudGFvX0xpYW5nX2dA
MTYzLmNvbT4KLS0tCiB0YXJnZXQvYXJtL3RyYW5zbGF0ZS1hNjQuYyB8IDIgKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rhcmdl
dC9hcm0vdHJhbnNsYXRlLWE2NC5jIGIvdGFyZ2V0L2FybS90cmFuc2xhdGUtYTY0LmMKaW5kZXgg
NWExZGYyNWY5MS4uZDFhNTlmYWQ5YyAxMDA2NDQKLS0tIGEvdGFyZ2V0L2FybS90cmFuc2xhdGUt
YTY0LmMKKysrIGIvdGFyZ2V0L2FybS90cmFuc2xhdGUtYTY0LmMKQEAgLTkwNDUsOSArOTA0NSw5
IEBAIHN0YXRpYyB2b2lkIGhhbmRsZV9zaW1kX3NoaWZ0X2ZwaW50X2NvbnYoRGlzYXNDb250ZXh0
ICpzLCBib29sIGlzX3NjYWxhciwKICAgICAgICAgfQogICAgIH0KIAotICAgIHRjZ190ZW1wX2Zy
ZWVfcHRyKHRjZ19mcHN0YXR1cyk7CiAgICAgdGNnX3RlbXBfZnJlZV9pMzIodGNnX3NoaWZ0KTsK
ICAgICBnZW5faGVscGVyX3NldF9ybW9kZSh0Y2dfcm1vZGUsIHRjZ19ybW9kZSwgdGNnX2Zwc3Rh
dHVzKTsKKyAgICB0Y2dfdGVtcF9mcmVlX3B0cih0Y2dfZnBzdGF0dXMpOwogICAgIHRjZ190ZW1w
X2ZyZWVfaTMyKHRjZ19ybW9kZSk7CiB9CiAKLS0gCjIuMjUuMQoK
------=_Part_10545_2050624140.1645761948965--


