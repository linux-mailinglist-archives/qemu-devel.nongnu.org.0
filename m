Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2C06470B
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Jul 2019 15:33:03 +0200 (CEST)
Received: from localhost ([::1]:32912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hlCiU-0001aw-5R
	for lists+qemu-devel@lfdr.de; Wed, 10 Jul 2019 09:33:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49943)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <hope2hope@163.com>) id 1hl7i5-0002r0-HP
 for qemu-devel@nongnu.org; Wed, 10 Jul 2019 04:12:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <hope2hope@163.com>) id 1hl7i4-0002N3-G5
 for qemu-devel@nongnu.org; Wed, 10 Jul 2019 04:12:17 -0400
Received: from m13-51.163.com ([220.181.13.51]:52103)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <hope2hope@163.com>) id 1hl7i1-00020x-Jp
 for qemu-devel@nongnu.org; Wed, 10 Jul 2019 04:12:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=7ig0Q
 t8zwVVssQ3gOnIgV+2AHmcW5bQPxWEM4d5tngM=; b=ddfRuBFYjf+zB9FGaWbdy
 NLThDDxrStT2qZCs6+xaUdog+PPSlA9W8OfFt5MRfr12aa2Dz2evXFk+33xuwaWs
 LnQ3kG8GqL+N26Uct1+oVVsFBjh2Z2ZdQ6Q/kTStiRW7hmxSrLkBzmrcH2UTvK+B
 REsuuyqW3MKcVNS8TepKVY=
Received: from hope2hope$163.com ( [36.152.9.226] ) by ajax-webmail-wmsvr51
 (Coremail) ; Wed, 10 Jul 2019 15:56:43 +0800 (CST)
X-Originating-IP: [36.152.9.226]
Date: Wed, 10 Jul 2019 15:56:43 +0800 (CST)
From: ddm <hope2hope@163.com>
To: qemu-devel@nongnu.org
X-Priority: 3
X-Mailer: Coremail Webmail Server Version SP_ntes V3.5 build
 20190614(cb3344cf) Copyright (c) 2002-2019 www.mailtech.cn 163com
X-CM-CTRLDATA: /hGjJWZvb3Rlcl9odG09OTY1OjU2
MIME-Version: 1.0
Message-ID: <c49fcb4.af77.16bdae2795a.Coremail.hope2hope@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: M8GowAD3_8c8miVdY4YBAQ--.6063W
X-CM-SenderInfo: pkrsvjpkrsvqqrwthudrp/1tbizRHtK1c7GoN87AABs+
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 220.181.13.51
X-Mailman-Approved-At: Wed, 10 Jul 2019 09:30:27 -0400
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: base64
X-Content-Filtered-By: Mailman/MimeDel 2.1.23
Subject: [Qemu-devel] Can not relocate APIC registers address from
 0xFEE00000 to self-defined physical addr
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

aGkgZ3V5cywgCgoKSSB3cm90ZSBhIFNtYWxsIE9TIChiYXNlZCBvbiBsaW51eDAuMTEpIHN1cHBv
cnQgU01QLCBhbmQgaXQgY2FuIHJ1biB3ZWxsIG9uIGJvY2hzLCAKTm93IGkgd2FudCB0byBtaWdy
YXRlIGl0IHRvIFFlbXUsIGkgZm91bmQgdGhhdCB3aGVuIGkgdXNlIHdybXNyIGNvbW1hbmQgdG8g
cmVsb2NhdGUgdGhlIEFQSUMgcmVnc2l0ZXJzIGFkZHIgdG8gYSBuZXcgcGh5c2ljYWwgYWRkcmVz
cywgCml0IGNhbiBub3Qgd29yaywgaSBjYW4gbm90IGluaXRpYWwgQVBJQyB0aW1lciB0byB0cmln
Z2VyIHRpbWVyIGludGVycnVwdCBieSB0aGUgbmV3IHBoeXNpY2FsIGFkZHIganVzdCBpIHJlbG9j
YXRlLCBidXQgd2hlbiB1c2UgcmRtc3IgdG8gZ2V0IEFQSUMgYmFzZSBhZGRyIGhhcyBiZWVuIGNo
YW5nZWQgdG8gdGhlIG5ldyBwaHlzaWNhbCBhZGRyZXNzLCBpdCdzIHN0cmFuZ2UuIApJbiBTTVAg
ZW52LCBpZiBjYW4gbm90IHJlbG9jYXRlIEFQSUMgcmVnaXN0ZXJzIGFkZHIgZm9yIGVhY2ggcHJv
Y2Vzc29yIHdpdGggIGRpZmZlcmVudCBhZGRyLCBpdCB3aWxsIHJlc3VsdCBpbiBjb25mbGljdC4g
ClNvLCBpIHdhbnQgdG8ga25vdyBxZW11NC4wIHdoZXRoZXIgc3VwcG9ydCByZW1hcGluZyBBUElD
IGJhc2UgYWRkcmVzcyBieSB3cm1zciBjb21tYW5kPwppZiBzdXBwb3J0LCBwbGVhc2UgdGVsbCBt
ZSBob3cgdG8gcmVtYXAgQVBJQyBiYXNlIGFkZHIgZm9yIGVhY2ggcHJvY2Vzc29yLgoKClRoYW5r
IHlvdSE=
