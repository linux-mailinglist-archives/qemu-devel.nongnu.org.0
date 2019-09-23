Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B72CBB35C
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Sep 2019 14:09:20 +0200 (CEST)
Received: from localhost ([::1]:55576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCN9b-0003Vm-4F
	for lists+qemu-devel@lfdr.de; Mon, 23 Sep 2019 08:09:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46256)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhlb29@foxmail.com>) id 1iCN5G-0008Rx-OE
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 08:04:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhlb29@foxmail.com>) id 1iCN59-0004Yi-Ki
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 08:04:45 -0400
Received: from smtpbg502.qq.com ([203.205.250.69]:37495 helo=smtpbg.qq.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhlb29@foxmail.com>) id 1iCN57-0004U2-GU
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 08:04:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1569240268;
 bh=Rv+eZfoDRUpe1aKj3lsPOSOIKtsBPBSEU1KpadMkGf0=;
 h=From:To:Subject:Mime-Version:Date:Message-ID;
 b=iIV9hdcLrs28iUXv1eDwF5r3lz1YfeVkJ/M9EoGKdjuQfh5bazOsrEhr1CHMrVHO1
 Zy5A8UU0diDct1/PKTkP5c3tzRqgJMwmK1TH3RhN+RfYgFZrOgmSuWkivI07meqplI
 NeHGeyvprd9chpfz/Uc+sFBs0TNgcTyzZk0i4SJc=
X-QQ-SSF: 00000000000000F000000000000000G
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 124.200.70.7
In-Reply-To: <tencent_5D6D8ED31E83C5675AB8AA3C@qq.com>
References: <tencent_5D6D8ED31E83C5675AB8AA3C@qq.com>
X-QQ-STYLE: 
X-QQ-mid: webenglish1t1569240267t495315
From: "=?ISO-8859-1?B?TGlibyBaaG91?=" <zhlb29@foxmail.com>
To: "=?ISO-8859-1?B?QWxla3NhbmRhciBNYXJrb3ZpYw==?="
 <aleksandar.m.mail@gmail.com>
Subject: Re:illegal hardware instruction during MIPS-I ELF linux user emulation
Mime-Version: 1.0
Content-Type: text/plain;
	charset="ISO-8859-1"
Content-Transfer-Encoding: base64
Date: Mon, 23 Sep 2019 20:04:27 +0800
X-Priority: 3
Message-ID: <tencent_6E390A001F25D33F67930C37@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-ReplyHash: 1586097701
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1]) by smtp.qq.com (ESMTP) with SMTP
 id ; Mon, 23 Sep 2019 20:04:27 +0800 (CST)
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

QW55IGhlbHAgZ3V5cz8gSXMgdGhlcmUgYSB3YXkgdG8gbG9vayBhdCB0aGUgRUxGIGJpbmFy
eSBjb2RlIHRvIHNlZSBpZiB0aGUgaW5zdHJ1Y3Rpb25zIGhhdmUgaW52YWxpZCBlbmNvZGlu
ZyBzY2hlbWU/IFNpbmNlIEkgdXNlZCBhIGN1c3RvbSBjb21waWxlciB0aGF0IGNsYWltcyB0
byBoYXZlIE1JUFMtSSBpbnN0cnVjdGlvbnMuIEkgZG91YnQgaXQgdGhvdWdoIGJlY2F1c2Ug
J2ZpbGUnIGNvbW1hbmQgZ2l2ZXMgYSByZWFzb25hYmxlIG91dHB1dCBzYXlpbmcgaXQgc3Vy
ZWx5IGlzIE1JUFMtSS4=


