Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B746D4428
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 14:12:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjJ2C-0001UU-F1; Mon, 03 Apr 2023 08:11:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fanwj@mail.ustc.edu.cn>)
 id 1pjJ2A-0001UL-IN
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 08:11:38 -0400
Received: from email.ustc.edu.cn ([2001:da8:d800::8] helo=ustc.edu.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fanwj@mail.ustc.edu.cn>) id 1pjJ26-0008Cn-Rj
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 08:11:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Subject:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID;
 bh=n0WGBTeW47tb0wz70mZJwt6AA93TiotdHFNl9Ow3xoA=; b=fqp7CzILO3z9W
 O4pP783gxPSv0bUq1nTB49tBm0qkELS5bmDfFgtesnS163yq1678bFCTDjngu6ts
 J0Wj+yZ+prTClDucujfn+cQrFbN9EdPcNlputCilGnH0g0aXTGDgRAjSm+LPsI3T
 h30NjR75nTDik+mxDL6Fweofc/z3yw=
Received: by ajax-webmail-newmailweb.ustc.edu.cn (Coremail) ; Mon, 3 Apr
 2023 20:11:17 +0800 (GMT+08:00)
X-Originating-IP: [120.253.225.34]
Date: Mon, 3 Apr 2023 20:11:17 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
To: julliard@winehq.org, qemu-devel@nongnu.org, wine-devel@winehq.org
Subject: Wine CE 8.5 Released, Cross Architecture Windows Emulator, Support
 Wow64, Base on wine and qemu
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT3.0.8 dev build
 20210401(c5ff3689) Copyright (c) 2002-2023 www.mailtech.cn ustccn
X-SendMailWithSms: false
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <169efbd5.b3cf.18747075e3c.Coremail.fanwj@mail.ustc.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: LkAmygAnLr5mwipkpWV5AA--.1W
X-CM-SenderInfo: pidq4yo6pdxzwoxv3uoohg3hdfq/1tbiAQ0KEFQhoR3B-gABsh
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
 CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
 daVFxhVjvjDU=
Received-SPF: pass client-ip=2001:da8:d800::8;
 envelope-from=fanwj@mail.ustc.edu.cn; helo=ustc.edu.cn
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  fanwj@mail.ustc.edu.cn
From: fanwj--- via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

V2luZSBDRSBpcyBhIGNvbXBhdGliaWxpdHkgbGF5ZXIgY2FwYWJsZSBvZiBydW5uaW5nIFdpbmRv
d3MgYXBwbGljYXRpb25zIG9uIENyb3NzLWFyY2hpdGVjdHVyZSBwYWx0Zm9ybSBvZiBMaW51eCwg
SXQgYmFzZSBvbiB3aW5lIGFuZCBxZW11LCBhbmQgc3VwcG9ydCBhYXJjaDY0IGFuZCByaXNjdjY0
IExpbnV4LiBJdCBjYW4gZW11bGF0ZSB4ODYoMzJiaXQpIHg2NCwgYWFyY2g2NCB3aW5kb3dzIGFw
cC4NCg0KUHJvamVjdCBBZGRyZXNzOiBodHRwczovL2dpdGxhYi5jb20vd2luZS1jZS93aW5lLWNl
DQpCaW5hcnkgRG93bm5sb2FkOiBodHRwczovL2dpdGxhYi5jb20vd2luZS1jZS93aW5lLWNlLy0v
cmVsZWFzZXMvdjguNQ0KDQoNCkRlbW8gVmlkZW86DQpSSVNDViA2NDrCoGh0dHBzOi8vd3d3LmJp
bGliaWxpLmNvbS92aWRlby9CVjFndjR5MTU3OHQNCkFBUkNIIDY0OsKgaHR0cHM6Ly93d3cuYmls
aWJpbGkuY29tL3ZpZGVvL0JWMXljNDExNTdpUw==

