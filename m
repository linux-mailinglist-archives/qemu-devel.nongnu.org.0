Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EEEAB8DF4
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Sep 2019 11:43:24 +0200 (CEST)
Received: from localhost ([::1]:57242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iBFRj-0005kW-OW
	for lists+qemu-devel@lfdr.de; Fri, 20 Sep 2019 05:43:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54534)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhlb29@foxmail.com>) id 1iBFP6-0002c0-OX
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 05:40:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhlb29@foxmail.com>) id 1iBFOy-0004lg-Le
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 05:40:33 -0400
Received: from smtpbgbr2.qq.com ([54.207.22.56]:50813)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhlb29@foxmail.com>) id 1iBFOx-0004ii-65
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 05:40:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1568972404;
 bh=7pLhU3ylNn7j5ugZL0+4F5IeDPvTpaRHU1EOVwvDcDs=;
 h=From:To:Subject:Mime-Version:Date:Message-ID;
 b=aFLvXoCzk9a7baNpLcWnAk/2tfjuQAGG8gmzWdVjkfUpaBUk47noPKDZlTahIAJpa
 nvZMFS/+HAis8B1bYEvfUkIS0UPxdGGjAeMDdwsbkhnXHjZXlSh8op9cOcWb7DIUrH
 2Tn1CEj3lhygpl1zX4G3Ov3l3UbQHOb8ydZBnIe8=
X-QQ-SSF: 00000000000000F000000000000000G
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 124.200.70.7
X-QQ-STYLE: 
X-QQ-mid: webenglish1t1568972402t223835
From: "=?ISO-8859-1?B?TGlibyBaaG91?=" <zhlb29@foxmail.com>
To: "=?ISO-8859-1?B?cWVtdS1kZXZlbA==?=" <qemu-devel@nongnu.org>
Subject: Initialize data memory in user space emulation 
Mime-Version: 1.0
Content-Type: text/plain;
	charset="ISO-8859-1"
Content-Transfer-Encoding: base64
Date: Fri, 20 Sep 2019 17:40:02 +0800
X-Priority: 3
Message-ID: <tencent_2E230C3B4383FB605550C90D@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1]) by smtp.qq.com (ESMTP) with SMTP
 id ; Fri, 20 Sep 2019 17:40:03 +0800 (CST)
Feedback-ID: webenglish:foxmail.com:bgforeign:bgforeign4
X-QQ-Bgrelay: 1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 54.207.22.56
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

SGkgYWxsLAoKSSBuZWVkIGEgd2F5IHRvIG1hbmlwdWxhdGUgZGF0YSBzYXZlZCBpbiBhIHJl
c2VydmVkIG1lbW9yeSByZWdpb24gaW4gbGludXggdXNlciBzcGFjZSBlbXVsYXRpb24uIEkg
Zm91bmQgdGhlIC1CIG9wdGlvbiB2ZXJ5IHByb21pc2luZy4gIERvY3VtZW50YXRpb24gc2F5
cyBpdCBpcyB1c2VmdWwgd2hlbiB0aGUgYWRkcmVzcyByZWdpb24gcmVxdWlyZWQgYnkgZ3Vl
c3QgYXBwbGljYXRpb25zIGlzIHJlc2VydmVkIG9uIHRoZSBob3N0LgoKQnV0IGhvdyBjYW4g
SSBpbml0aWFsaXplIHRoYXQgbWVtb3J5IHdpdGggZGF0YT8KClRoYW5rcywKTGlibyBaaG91





