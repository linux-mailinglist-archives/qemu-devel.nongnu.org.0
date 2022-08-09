Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4054958DC50
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 18:43:15 +0200 (CEST)
Received: from localhost ([::1]:55798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLSK1-0007Et-Ul
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 12:43:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1oLSHy-0004Dy-CM
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 12:41:07 -0400
Received: from smtp85.cstnet.cn ([159.226.251.85]:47974 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fanjinhao21s@ict.ac.cn>) id 1oLSHv-0006GT-0N
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 12:41:05 -0400
Received: by ajax-webmail-APP-13 (Coremail) ; Wed, 10 Aug 2022 00:40:51
 +0800 (GMT+08:00)
X-Originating-IP: [221.220.143.85]
Date: Wed, 10 Aug 2022 00:40:51 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?5qiK6YeR5piK?= <fanjinhao21s@ict.ac.cn>
To: "Keith Busch" <kbusch@kernel.org>
Cc: qemu-devel <qemu-devel@nongnu.org>, its@irrelevant.dk
Subject: Re: Re: [RFC] hw/nvme: Use irqfd to send interrupts
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20210104(ab8c30b6)
 Copyright (c) 2002-2022 www.mailtech.cn cnic.cn
In-Reply-To: <YvKJk2dYiwomexFv@kbusch-mbp.dhcp.thefacebook.com>
References: <20220709043503.2228736-1-fanjinhao21s@ict.ac.cn>
 <851FC42E-DA19-4142-9AA6-39E2E384F618@ict.ac.cn>
 <YvKJk2dYiwomexFv@kbusch-mbp.dhcp.thefacebook.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <5737715c.4ac3b.182837afc82.Coremail.fanjinhao21s@ict.ac.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: twCowABXG_QTjvJiuu8SAA--.2316W
X-CM-SenderInfo: xidqyxpqkd0j0rv6xunwoduhdfq/1tbiCg0NCWKY1l8EuwABsO
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

Jmd0OyBUaGUgZHJpdmVyIHdpbGwgY3JlYXRlIHRoZSBjcSB3aXRoIGFuIGFsbG9jYXRlZCB2ZWN0
b3IsIGJ1dCBpdCdzIG5vdCBhY3RpdmF0ZWQKJmd0OyB1bnRpbCBhZnRlciB0aGUgZHJpdmVyIHdp
cmVzIGl0IHVwIHRvIGEgaGFuZGxlci4gSSB0aGluayB0aGF0J3Mgd2hhdCB5b3UncmUKJmd0OyBv
YnNlcnZpbmcgd2l0aCB0aGUgaW5jb21wbGV0ZSBNU0l4IHRhYmxlIGVudHJ5IG9uIGNyZWF0aW9u
LgoKQWdyZWVkLiBJIGRpZ2dlZCB0aHJvdWdoIHBjaV9yZXF1ZXN0X2lycSgpJ3MgY2FsbCBjaGFp
biBhbmQgZm91bmQgCnBjaV93cml0ZV9tc2lfbXNnKCkgd2FzIGNhbGxlZCBpbiB0aGUgZW5kLgoK
Tm93IHRvIGltcGxlbWVudCBpcnFmZCBzdXBwb3J0LCB3ZSBuZWVkIHRvIHJlZ2lzdGVyIHRoZSAo
Y29tcGxldGUpIE1TSSBtZXNzYWdlIAppbiBLVk0gc28gdGhhdCBLVk0gY2FuIGRpcmVjdGx5IHNl
bmQgdGhlIGludGVycnVwdCB3aGVuIHdlIHNpZ25hbCB0aGUgaXJxZmQuCk15IHByaW9yIGltcGxl
bWVudGF0aW9uIGRlbGF5ZWQgZWFjaCBDUSdzIE1TSSBtZXNzYWdlIHJlZ2lzdHJhdGlvbiB0byBp
dHMgZmlyc3QKbnZtZV9wb3N0X2NxZXMoKS4gSSdtIG5vdCBzdXJlIHdoZXRoZXIgdGhpcyBpcyBh
IGdvb2QgY2hvaWNlLiBXaGF0IGRvIHlvdSB0aGluawphYm91dCB0aGlzIGFwcHJvYWNoPyAKCkJU
Vywgc2luY2Ugd2Ugc2tpcCBRRU1VJ3MgTVNJLXggZW11bGF0aW9uIHdpdGggaXJxZmQsIHdlIG5l
ZWQgdG8gcmVjb3JkIHRoZQptYXNrIHN0YXR1cyBvZiBlYWNoIGludGVycnVwdCB2ZWN0b3IuIFFF
TVUgcHJvdmlkZXMgbXNpeF9zZXRfdmVjdG9yX25vdGlmaWVycygpCnRvIGhlbHAgdXMgY2FsbCBo
YW5kbGVycyBvbiBlYWNoIG1hc2sgYW5kIHVubWFzayBldmVudC4gQnV0IHRoaXMgZnVuY3Rpb24g
d29ya3MKb24gYSBwZXItZGV2aWNlIGJhc2lzLiBJIGd1ZXNzIGl0IGlzIGJlc3QgdG8gY2FsbCBt
c2l4X3NldF92ZWN0b3Jfbm90aWZpZXJzKCkKYWZ0ZXIgYWxsIENRcyBhcmUgY3JlYXRlZC4gQnV0
IEkgdGhpbmsgcWVtdS1udm1lIGNhbid0IHRlbGwgd2hlbiB0aGUgaG9zdCBoYXMKZmluaXNoZWQg
Q1EgY3JlYXRpb24uIFdoZXJlIGRvIHlvdSB0aGluayBpcyB0aGUgYmVzdCBwbGFjZSB3ZSByZWdp
c3RlciB0aGUKbWFzay91bm1hc2sgY2FsbGJhY2tzPyBJcyBpdCBPSyB0byBwdXQgaXQgYXQsIHNh
eSwgdGhlIGZpcnN0IG52bWVfcG9zdF9jcWVzKCkKb2YgdGhlIHdob2xlIGRldmljZT8KClRoYW5r
cywKSmluaGFvIEZhbgoK

