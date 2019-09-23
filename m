Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A90BAF9E
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Sep 2019 10:31:49 +0200 (CEST)
Received: from localhost ([::1]:53612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCJl6-0007Fv-94
	for lists+qemu-devel@lfdr.de; Mon, 23 Sep 2019 04:31:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44334)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhlb29@foxmail.com>) id 1iCJV6-00014z-6I
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 04:15:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhlb29@foxmail.com>) id 1iCJV4-0008Ty-Od
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 04:15:15 -0400
Received: from smtpbg502.qq.com ([203.205.250.69]:34062 helo=smtpbg.qq.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhlb29@foxmail.com>) id 1iCJV3-0008NS-P5
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 04:15:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1569226501;
 bh=d2s29ko//k4w6JXneRyvSRWV9GBWz56FY5VFZl7qBfU=;
 h=From:To:Subject:Mime-Version:Date:Message-ID;
 b=mw7sODaFdlxsFX97OjH28XWFDsole301dJLJ5UVH1ldJHqE2RExUuFsfG1yA68bIY
 kfQqsY3htVGlynQO29IK9rCrcy4oNFU1/ML9KYZEuMXQRhfHVUSGh6vhN4glgV63Ay
 r7JhfRctd7aprIPpwreD8r+ssaO25WCKDp/zuKpI=
X-QQ-SSF: 00000000000000F000000000000000G
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 124.200.70.7
X-QQ-STYLE: 
X-QQ-mid: webenglish1t1569226500t160112
From: "=?ISO-8859-1?B?TGlibyBaaG91?=" <zhlb29@foxmail.com>
To: "=?ISO-8859-1?B?QWxla3NhbmRhciYjMzg7bmJzcDtNYXJrb3ZpYw==?="
 <aleksandar.m.mail@gmail.com>
Subject: illegal hardware instruction during MIPS-I ELF linux user emulation
Mime-Version: 1.0
Content-Type: text/plain;
	charset="ISO-8859-1"
Content-Transfer-Encoding: base64
Date: Mon, 23 Sep 2019 16:15:00 +0800
X-Priority: 3
Message-ID: <tencent_5D6D8ED31E83C5675AB8AA3C@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1]) by smtp.qq.com (ESMTP) with SMTP
 id ; Mon, 23 Sep 2019 16:15:00 +0800 (CST)
Feedback-ID: webenglish:foxmail.com:bgweb:bgweb1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 203.205.250.69
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
Cc: =?ISO-8859-1?B?cWVtdS1kZXZlbA==?= <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SGkgYWxsLAoKSSBoYXZlIGFuIGJpbmFyeSBmaWxlIGdlbmVyYXRlZCBieSBhIGNyb3NzIGNv
bXBpbGVyLiBUaGUgJ2ZpbGUnIGNvbW1hbmQgc2F5cwoKJCBmaWxlIHRlc3QKdGVzdDogRUxG
IDMyLWJpdCBMU0IgTFNCIGV4ZWN1dGFibGUsIE1JUFMsIE1JUFMtSSB2ZXJzaW9uIDEgKFNZ
U1YpLCBzdGF0aWNhbGx5IGxpbmtlZCwgd2l0aCBkZWJ1Z19pbmZvLCBub3Qgc3RyaXBwZWQu
CgpXaGVuIEkgZXhlY3V0ZWQgaXQgd2l0aAoKJC4vcWVtdS1taXBzZWwgdGVzdApxZW11OiB1
bmNhdWdodCB0YXJnZXQgc2lnbmFsIDQgKElsbGVnYWwgaW5zdHJ1Y3Rpb24pIC0gY29yZSBk
dW1wZWQKWzFdIDExMDg4IGlsbGVnYWwgaGFyZHdhcmUgaW5zdHJ1Y3Rpb24gKGNvcmUgZHVt
cGVkKSAuL3FlbXUtbWlwc2VsIHRlc3QKCkhvd2V2ZXIsIHdoZW4gSSB1c2UgYW5vdGhlciBj
cm9zcyBjb21waWxlciB0aGF0IGdlbmVyYXRlcyBNSVBTMzIgcmVsMiBiaW5hcmllcywgaXQg
d29ya2VkIGZpbmUuCgpDYW4gYW55b25lIHRlbGwgbWUgd2hhdCdzIGdvaW5nIHdyb25nPwoK
Q2hlZXJzLApMaWJvIFpob3U=


