Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F88724A1C0
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Aug 2020 16:29:38 +0200 (CEST)
Received: from localhost ([::1]:37358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k8P5t-0003yC-BB
	for lists+qemu-devel@lfdr.de; Wed, 19 Aug 2020 10:29:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <19210240159@fudan.edu.cn>)
 id 1k8P5C-0003Xx-PV
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 10:28:55 -0400
Received: from mail.fudan.edu.cn ([202.120.224.10]:41894 helo=fudan.edu.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <19210240159@fudan.edu.cn>) id 1k8P56-0000NV-Cw
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 10:28:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fudan.edu.cn; s=dkim; h=Received:Date:From:To:Subject:
 Content-Type:MIME-Version:Message-ID; bh=FquTfrl/UHw65/Duf0AFGst
 388NTc0U39sBEFDEeh04=; b=hXa/RxTLVTjZwt+0leUAIt2zVXrqd0rwNvKrT8m
 ZfHdB7YPjjYqYipo110uvEmEdo5puO3uzRbj/vswBbtjxCCKRWJGQNSzSclO8Itq
 imY6sE1/BUAWLA2tUT5mP1vTaS0MHKE8Tc5aiZmHxss0AmWrvdDp3TanDakJl1EF
 emR0=
Received: by ajax-webmail-app1 (Coremail) ; Wed, 19 Aug 2020 22:28:35 +0800
 (GMT+08:00)
X-Originating-IP: [39.191.9.152]
Date: Wed, 19 Aug 2020 22:28:35 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?5p6X5aWV5biG?= <19210240159@fudan.edu.cn>
To: qemu-devel@nongnu.org
Subject: qemu
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT3.0.8 dev build
 20190909(dad6f454) Copyright (c) 2002-2020 www.mailtech.cn fudan.edu.cn
X-SendMailWithSms: false
X-CM-CTRLDATA: arX6p2Zvb3Rlcl9odG09MzMzOjE0JmZvb3Rlcl90eHQ9MjM0OjEw
Content-Type: multipart/alternative; 
 boundary="----=_Part_71008_892918934.1597847315664"
MIME-Version: 1.0
Message-ID: <48e5d45b.51f9.174071f24d0.Coremail.19210240159@fudan.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: XAUFCgA3eUITNz1fvF9hAw--.933W
X-CM-SenderInfo: irzsiiysuqikmz6i3vldqovvfxof0/1tbiAQ8NB1Kp4fbKlAAFsz
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWUJw
 CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
 daVFxhVjvjDU=
Received-SPF: pass client-ip=202.120.224.10;
 envelope-from=19210240159@fudan.edu.cn; helo=fudan.edu.cn
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/19 10:28:37
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_20=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_LOCAL_DIGITS=0.001, FROM_LOCAL_HEX=0.006, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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

------=_Part_71008_892918934.1597847315664
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

SGVsbG/vvIwKICAgcmVjZW50bHkgd2hlbiBJIHdhcyBjaGVja2luZyB0aGUgY3ZlcyBmb3IgdGhp
cyBzb2Z0d2FyZSwgSSBjYW4gbm90IGZpbmQgdGhlIHBhdGNoIGNvbW1pdCBpZCBmb3IgdGhlc2Ug
Y3ZlczoKICAgQ1ZFLTIwMTktMTIyNDcgQ1ZFLTIwMTgtNTc0OCBDVkUtMjAyMC0xMzc5MQpjb3Vs
ZCB5b3UgcGxlYXNlIHRlbGwgd2hpdGNoIGNvbW1pdCBmaXggdGhlc2UgY3ZlPyBUaGFua3MuCgoK
CgoKCgoKCgoNCg0KDQoNCg0K
------=_Part_71008_892918934.1597847315664
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

SGVsbG/vvIw8ZGl2PiZuYnNwOyAmbmJzcDtyZWNlbnRseSB3aGVuIEkgd2FzIGNoZWNraW5nIHRo
ZSBjdmVzIGZvciB0aGlzIHNvZnR3YXJlLCBJIGNhbiBub3QgZmluZCB0aGUgcGF0Y2ggY29tbWl0
IGlkIGZvciB0aGVzZSBjdmVzOjwvZGl2PjxkaXY+Jm5ic3A7ICZuYnNwO0NWRS0yMDE5LTEyMjQ3
IENWRS0yMDE4LTU3NDgmbmJzcDtDVkUtMjAyMC0xMzc5MTwvZGl2PjxkaXY+Y291bGQgeW91IHBs
ZWFzZSB0ZWxsIHdoaXRjaCBjb21taXQgZml4IHRoZXNlIGN2ZT8gVGhhbmtzLjwvZGl2Pjxicj48
YnI+CgoKPGJyPjxicj4KCgo8YnI+PGJyPgoKCjxicj48YnI+CgoKPGJyPjxicj4KCgo8YnI+PGJy
Pg0KDQoNCg==
------=_Part_71008_892918934.1597847315664--


