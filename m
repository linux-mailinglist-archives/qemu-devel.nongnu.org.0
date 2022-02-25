Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E72C54C3C70
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 04:33:09 +0100 (CET)
Received: from localhost ([::1]:44646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNRLw-0001WP-Dn
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 22:33:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wliang@stu.xidian.edu.cn>)
 id 1nNRK3-0000k0-FW
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 22:31:13 -0500
Received: from zg8tmtyylji0my4xnjeumjiw.icoremail.net ([162.243.161.220]:59454)
 by eggs.gnu.org with smtp (Exim 4.90_1)
 (envelope-from <wliang@stu.xidian.edu.cn>) id 1nNRK0-0003WT-Ka
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 22:31:10 -0500
Received: by ajax-webmail-sr0414.icoremail.net (Coremail) ; Fri, 25 Feb 2022
 11:30:55 +0800 (GMT+08:00)
X-Originating-IP: [39.128.6.55]
Date: Fri, 25 Feb 2022 11:30:55 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: wliang@stu.xidian.edu.cn
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Subject: Re: Fix a potential memory leak bug in write_boot_rom() (v6.2.0).
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20210401(fdb522e2)
 Copyright (c) 2002-2022 www.mailtech.cn
 mispb-ac60dc67-ddbe-4478-9127-1d3314495f10-icoremail.net
In-Reply-To: <ae217469-9f0f-5f1e-f01b-4a6f525f1ff2@kaod.org>
References: <6e7748f1.25d8.17f2705c420.Coremail.wliang@stu.xidian.edu.cn>
 <c91392a4-f75b-4e5d-9e6c-04777fb7ca79@gmail.com>
 <ae217469-9f0f-5f1e-f01b-4a6f525f1ff2@kaod.org>
Content-Type: multipart/mixed; 
 boundary="----=_Part_8729_1099959469.1645759855058"
MIME-Version: 1.0
Message-ID: <74d28271.93a.17f2eee79db.Coremail.wliang@stu.xidian.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: AQAAfwAXVJFwTRhimSsEAA--.367W
X-CM-SenderInfo: pzolt0vj6v33wo0lvxldqovvfxof0/1tbiAQEOA1wR-vcG2AACsV
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWUCw
 CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
 daVFxhVjvjDU=
Received-SPF: pass client-ip=162.243.161.220;
 envelope-from=wliang@stu.xidian.edu.cn;
 helo=zg8tmtyylji0my4xnjeumjiw.icoremail.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

------=_Part_8729_1099959469.1645759855058
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

Cj4gCj4geWVzLiBDb3VsZCB5b3UgcGxlYXNlIHNlbmQgYSBwYXRjaCB1c2luZyAgZ19hdXRvZnJl
ZSA/Cj4gCj4gVGhhbmtzLAo+IAo+IEMuCgoKSGVyZSBpcyB0aGUgbmV3IHBhdGNoLgoKVGhhbmtz
LApXZW50YW8=
------=_Part_8729_1099959469.1645759855058
Content-Type: text/x-patch; 
	name=0001-Fix-a-potential-memory-leak-bug-in-write_boot_rom-v6.patch
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-Fix-a-potential-memory-leak-bug-in-write_boot_rom-v6.patch"

RnJvbSA4ZWQ3NjQ0NmY3OGFiMWI0MTUyNDAzZmRiOWRkNmYzNDlkNmZkNTJlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBXZW50YW9fTGlhbmcgPFdlbnRhb19MaWFuZ19nQDE2My5jb20+
CkRhdGU6IEZyaSwgMjUgRmViIDIwMjIgMTE6MTc6MzMgKzA4MDAKU3ViamVjdDogW1BBVENIXSBG
aXggYSBwb3RlbnRpYWwgbWVtb3J5IGxlYWsgYnVnIGluIHdyaXRlX2Jvb3Rfcm9tKCkgKHY2LjIu
MCkuCgpTaWduZWQtb2ZmLWJ5OiBXZW50YW9fTGlhbmcgPFdlbnRhb19MaWFuZ19nQDE2My5jb20+
Ci0tLQogaHcvYXJtL2FzcGVlZC5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KykKCmRpZmYgLS1naXQgYS9ody9hcm0vYXNwZWVkLmMgYi9ody9hcm0vYXNwZWVkLmMKaW5kZXgg
ZDkxMWRjOTA0Zi4uOWRhNWY4NzQyOSAxMDA2NDQKLS0tIGEvaHcvYXJtL2FzcGVlZC5jCisrKyBi
L2h3L2FybS9hc3BlZWQuYwpAQCAtMjc2LDYgKzI3Niw3IEBAIHN0YXRpYyB2b2lkIHdyaXRlX2Jv
b3Rfcm9tKERyaXZlSW5mbyAqZGluZm8sIGh3YWRkciBhZGRyLCBzaXplX3Qgcm9tX3NpemUsCiAg
ICAgc3RvcmFnZSA9IGdfbmV3MCh1aW50OF90LCByb21fc2l6ZSk7CiAgICAgaWYgKGJsa19wcmVh
ZChibGssIDAsIHN0b3JhZ2UsIHJvbV9zaXplKSA8IDApIHsKICAgICAgICAgZXJyb3Jfc2V0Zyhl
cnJwLCAiZmFpbGVkIHRvIHJlYWQgdGhlIGluaXRpYWwgZmxhc2ggY29udGVudCIpOworICAgICAg
ICBnX2ZyZWUoc3RvcmFnZSk7CiAgICAgICAgIHJldHVybjsKICAgICB9CiAKLS0gCjIuMjUuMQoK

------=_Part_8729_1099959469.1645759855058--


