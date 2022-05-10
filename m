Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EECE9521AE8
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 16:01:37 +0200 (CEST)
Received: from localhost ([::1]:59236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noQQi-0003XE-Je
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 10:01:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xcd19@mails.tsinghua.edu.cn>)
 id 1noLkN-0003kz-74
 for qemu-devel@nongnu.org; Tue, 10 May 2022 05:01:37 -0400
Received: from zg8tmty1ljiyny4xntqumjca.icoremail.net ([165.227.154.27]:35616)
 by eggs.gnu.org with smtp (Exim 4.90_1)
 (envelope-from <xcd19@mails.tsinghua.edu.cn>) id 1noLkJ-0004eq-Gh
 for qemu-devel@nongnu.org; Tue, 10 May 2022 05:01:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mails.tsinghua.edu.cn; s=dkim; h=Received:Date:From:To:Subject:
 Content-Type:MIME-Version:Message-ID; bh=Yzp7Hl723JaU7mMZYey96To
 yq56MSHwjDmhlzRuu1Uo=; b=rAo0mGF2s2b3p3kUSyN0RQCRkVbNxAob7srB701
 9WN1JH0bM4gjmPP9vrRxp8PNq7gJmla7dLxKAurMYoIvHrJYy4+9LAIdnsBgtCp5
 WBEQbFYuN21UiPZbv8FQCccOWHZ6pOXwRBhrGBDKO3wM/aa34dGN4+/luUUY6jyh
 XMA0=
Received: by ajax-webmail-web5 (Coremail) ; Tue, 10 May 2022 17:01:11 +0800
 (GMT+08:00)
X-Originating-IP: [13.75.0.255]
Date: Tue, 10 May 2022 17:01:11 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?6aG55pmo5Lic?= <xcd19@mails.tsinghua.edu.cn>
To: qemu-devel@nongnu.org
Subject: control stream check in qemu
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20210104(ab8c30b6)
 Copyright (c) 2002-2022 www.mailtech.cn
 mispb-4df55a87-4b50-4a66-85a0-70f79cb6c8b5-tsinghua.edu.cn
Content-Type: multipart/alternative; 
 boundary="----=_Part_377748_1712765499.1652173271236"
MIME-Version: 1.0
Message-ID: <1497a6b3.1a7e9.180ad3370c5.Coremail.xcd19@mails.tsinghua.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: zAQGZQAHHE7XKXpia0CyBg--.527W
X-CM-SenderInfo: 50fgimo6pdxz3vow2x5qjk3toohg3hdfq/1tbiAgQCAV7nFUnlTQA
	BsJ
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWUJw
 CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
 daVFxhVjvjDU=
Received-SPF: pass client-ip=165.227.154.27;
 envelope-from=xcd19@mails.tsinghua.edu.cn;
 helo=zg8tmty1ljiyny4xntqumjca.icoremail.net
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 10 May 2022 09:56:50 -0400
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

------=_Part_377748_1712765499.1652173271236
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

aGVsbG8gZGV2ZWxvcHM6Cmp1c3QgYSB0ZXN0IGVtYWlsLCBpIGFtIHdvbmRlcmluZyB3ZXRoZXIg
dGhlIGVtYWlsIHNlbmQgY29ycmNldGxseQ==
------=_Part_377748_1712765499.1652173271236
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

aGVsbG8gZGV2ZWxvcHM6PGRpdj48c3BhbiBzdHlsZT0id2hpdGUtc3BhY2U6cHJlIj4JPC9zcGFu
Pmp1c3QgYSB0ZXN0IGVtYWlsLCBpIGFtIHdvbmRlcmluZyB3ZXRoZXIgdGhlIGVtYWlsIHNlbmQg
Y29ycmNldGxseTwvZGl2Pg==
------=_Part_377748_1712765499.1652173271236--


