Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 145DD58DB41
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 17:38:01 +0200 (CEST)
Received: from localhost ([::1]:42082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLRIt-0001xF-Jw
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 11:37:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1oLRDE-0005S4-Eh
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 11:32:12 -0400
Received: from smtp85.cstnet.cn ([159.226.251.85]:43784 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fanjinhao21s@ict.ac.cn>) id 1oLRDA-0003LY-HB
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 11:32:08 -0400
Received: by ajax-webmail-APP-13 (Coremail) ; Tue, 9 Aug 2022 23:31:47 +0800
 (GMT+08:00)
X-Originating-IP: [221.220.143.85]
Date: Tue, 9 Aug 2022 23:31:47 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?5qiK6YeR5piK?= <fanjinhao21s@ict.ac.cn>
To: qemu-devel <qemu-devel@nongnu.org>
Cc: its@irrelevant.dk, kbusch@kernel.org
Subject: Re: Re: [RFC] hw/nvme: Use irqfd to send interrupts
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20210104(ab8c30b6)
 Copyright (c) 2002-2022 www.mailtech.cn cnic.cn
In-Reply-To: <851FC42E-DA19-4142-9AA6-39E2E384F618@ict.ac.cn>
References: <20220709043503.2228736-1-fanjinhao21s@ict.ac.cn>
 <851FC42E-DA19-4142-9AA6-39E2E384F618@ict.ac.cn>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <309812a0.4ab4e.182833bc181.Coremail.fanjinhao21s@ict.ac.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: twCowAD3_9fjffJiBO4SAA--.19941W
X-CM-SenderInfo: xidqyxpqkd0j0rv6xunwoduhdfq/1tbiBwQNCWKY1xUh-QABsi
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
 CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
 daVFxhVjvjDU=
Received-SPF: pass client-ip=159.226.251.85;
 envelope-from=fanjinhao21s@ict.ac.cn; helo=cstnet.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Jmd0OyBJbiB0aGlzIHZlcnNpb24gSSBsZWZ0IGlycWZkIGluaXRpYWxpemF0aW9uIHRvIHRoZSBm
aXJzdCBhc3NlcnRpb24gb2YgYW4KJmd0OyBpcnEuIEJ1dCBJIHRoaW5rIGl0IGlzIGJldHRlciB0
byBpbml0aWFsaXplIGlycWZkIGF0IGNxIGNyZWF0aW9uIHRpbWUgc28gd2UKJmd0OyB3b27igJl0
IGJvdGhlciBjaGVja2luZyBpdCBhdCBlYWNoIGlycSBhc3NlcnRpb24uIEhvd2V2ZXIgaWYgSSBw
dXQgdGhlc2UgY29kZQomZ3Q7IGluIG52bWVfaW5pdF9jcSgpLCBpcnFmZCBkb2VzIG5vdCB3b3Jr
IHByb3Blcmx5LiBBZnRlciBhZGRpbmcgc29tZQomZ3Q7IHRyYWNlcG9pbnRzIEkgZm91bmQgdGhl
IE1TSSBtZXNzYWdlcyBpbiBNU0ktWCB0YWJsZSBjaGFuZ2VkIGFmdGVyCiZndDsgbnZtZV9pbml0
X2NxKCkuIFNwZWNpZmljYWxseSwgdGhlIGBkYXRhYCBmaWVsZCBkb2VzIG5vdCBzZWVtIGNvcnJl
Y3QgYXQgdGhlCiZndDsgdGltZSB3aGVuIG52bWVfaW5pdF9jcSgpIGlzIGNhbGxlZC4KCkkgZm91
bmQgdGhhdCBpbiBMaW51eCBOVk1lIGRyaXZlciwgaW4gbnZtZV9jcmVhdGVfY3EoKSAoZHJpdmVy
cy9udm1lL2hvc3QvcGNpLmMpLApxdWV1ZV9yZXF1ZXN0X2lycSgpIGlzIGNhbGxlZCBhZnRlciBu
dm1lX2luaXRfcXVldWUoKS4gRG9lcyB0aGlzIHBvc3NpYmx5CmNhdXNlIHRoZSBpbmNvcnJlY3Qg
TVNJIG1lc3NhZ2VzIGF0IENRIGNyZWF0aW9uIHRpbWU/Cgo=

