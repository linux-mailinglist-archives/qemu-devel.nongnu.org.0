Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D71651F56F4
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Jun 2020 16:43:50 +0200 (CEST)
Received: from localhost ([::1]:36960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jj1xF-0002Fr-TI
	for lists+qemu-devel@lfdr.de; Wed, 10 Jun 2020 10:43:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <13824125580@163.com>)
 id 1jj1w0-0000uP-Um
 for qemu-devel@nongnu.org; Wed, 10 Jun 2020 10:42:33 -0400
Received: from m1356.mail.163.com ([220.181.13.56]:32410)
 by eggs.gnu.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <13824125580@163.com>)
 id 1jj1vs-0001ak-9n
 for qemu-devel@nongnu.org; Wed, 10 Jun 2020 10:42:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=O6NSI
 +adb12UfOVoDuuamuSoh2xVNUbozY4iJ0ijQXM=; b=ZaLyKuWDxY98JzeOKuScP
 uI3QElO7kFxPhdB8JiEN5ErZ6VjR/eiJQfmXbZAiMHsIrl86WbtByckH4u7QHHD0
 zQsnxJ+6CJZ7yL1C+fLA9+JWmSUEk/325aDyG9Z4p1BBAiiQrpDvXYOlvUeuaO4l
 /MijOkIqUvmQryw9XH+NHM=
Received: from 13824125580$163.com ( [113.74.47.16] ) by
 ajax-webmail-wmsvr56 (Coremail) ; Wed, 10 Jun 2020 22:42:01 +0800 (CST)
X-Originating-IP: [113.74.47.16]
Date: Wed, 10 Jun 2020 22:42:01 +0800 (CST)
From: tugouxp <13824125580@163.com>
To: qemu-devel@nongnu.org
Subject: what is the difference to transfer elf execute file or binary file
 on "-kernel" paramter?
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.10 build 20190724(ac680a23)
 Copyright (c) 2002-2020 www.mailtech.cn 163com
X-CM-CTRLDATA: 2Gy7B2Zvb3Rlcl9odG09MzI5OjYx
Content-Type: multipart/alternative; 
 boundary="----=_Part_129575_1731139034.1591800121417"
MIME-Version: 1.0
Message-ID: <79c48cfb.8c13.1729eae4849.Coremail.13824125580@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: OMGowAB3jWA58eBequA_AA--.12771W
X-CM-SenderInfo: bprtmjyurskkiyq6il2tof0z/1tbipRw-QlUMYcYOkQACsn
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
Received-SPF: pass client-ip=220.181.13.56; envelope-from=13824125580@163.com;
 helo=m1356.mail.163.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/10 10:42:02
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, FROM_LOCAL_DIGITS=0.001,
 FROM_LOCAL_HEX=0.006, HTML_MESSAGE=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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

------=_Part_129575_1731139034.1591800121417
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: base64

d2hhdCBpcyB0aGUgZGlmZmVyZW5jZSB0byB0cmFuc2ZlciBlbGYgZXhlY3V0ZSBmaWxlIG9yIGJp
bmFyeSBmaWxlIG9uICIta2VybmVsIiBwYXJhbXRlcj8gaXMgaXQgdGhlIHNhbWUgYW5kIGFsbCBi
ZSByZWNvbmdhbml6ZWQgcmlnaHRseSBmb3IgcWVtdT8KCgp0aGFuayB5b3Uh
------=_Part_129575_1731139034.1591800121417
Content-Type: text/html; charset=GBK
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0ibGluZS1oZWlnaHQ6MS43O2NvbG9yOiMwMDAwMDA7Zm9udC1zaXplOjE0cHg7
Zm9udC1mYW1pbHk6QXJpYWwiPjxkaXYgc3R5bGU9Im1hcmdpbjowOyI+d2hhdCBpcyB0aGUgZGlm
ZmVyZW5jZSB0byB0cmFuc2ZlciBlbGYgZXhlY3V0ZSBmaWxlIG9yIGJpbmFyeSBmaWxlIG9uICIt
a2VybmVsIiBwYXJhbXRlcj8gaXMgaXQgdGhlIHNhbWUgYW5kIGFsbCBiZSByZWNvbmdhbml6ZWQg
cmlnaHRseSBmb3IgcWVtdT88L2Rpdj48ZGl2IHN0eWxlPSJtYXJnaW46MDsiPjxicj48L2Rpdj48
ZGl2IHN0eWxlPSJtYXJnaW46MDsiPnRoYW5rIHlvdSE8L2Rpdj48L2Rpdj48YnI+PGJyPjxzcGFu
IHRpdGxlPSJuZXRlYXNlZm9vdGVyIj48cD48YnIvPiZuYnNwOzwvcD48L3NwYW4+
------=_Part_129575_1731139034.1591800121417--


