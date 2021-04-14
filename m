Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B74B35F49C
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 15:18:18 +0200 (CEST)
Received: from localhost ([::1]:45190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWfPN-0003eo-73
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 09:18:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlmgr@proulx.com>) id 1lWels-0003e0-V7
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 08:37:29 -0400
Received: from havoc.proulx.com ([96.88.95.61]:42496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlmgr@proulx.com>) id 1lWelq-0007uC-AU
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 08:37:28 -0400
Received: by havoc.proulx.com (Postfix, from userid 1027)
 id 59BBA627; Wed, 14 Apr 2021 06:37:24 -0600 (MDT)
Authentication-Results: havoc.proulx.com; dkim=pass (1024-bit key;
 unprotected) header.d=163.com header.i=@163.com header.b="KjyoSeFN"; 
 dkim-atps=neutral
Resent-From: Mailing List Manager <mlmgr@proulx.com>
Resent-Date: Wed, 14 Apr 2021 06:37:24 -0600
Resent-Message-ID: <20210414123724.GA12731@havoc.proulx.com>
Resent-To: qemu-devel@nongnu.org
Received: from eggs.gnu.org ([2001:470:142:3::10]:43794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fxm16899@163.com>) id 1lWXvV-0001ut-MY
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 01:18:59 -0400
Received: from m13140.mail.163.com ([220.181.13.140]:29200)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <fxm16899@163.com>) id 1lWXvS-00050Y-D6
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 01:18:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=d3mDX
 QdeagL0PjankrwhjX3lbN5r52MjfZ3GrTh0ZXg=; b=KjyoSeFN7Xv8eIuKXJ3c4
 DC5zSbscUKeYd072P60BmGYseu3rmOlrvOkeaqZGEQvO/J+bII8rusnx68lTNZl+
 Mg3z8lYFxSCT8Te8IZ+74FcNUaE2yd7EvfFJoOx01jbBFu+zjGn+59MLrcEt2KxL
 gyCuq268ObsIvcl7GekkUA=
Received: from fxm16899$163.com ( [220.200.42.2] ) by ajax-webmail-wmsvr140
 (Coremail) ; Wed, 14 Apr 2021 13:03:37 +0800 (CST)
X-Originating-IP: [220.200.42.2]
Date: Wed, 14 Apr 2021 13:03:37 +0800 (CST)
From: =?GBK?B?uLbQocP3?= <fxm16899@163.com>
To: qemu-devel@nongnu.org
Subject: set qemu support serial crtscts
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20210104(ab8c30b6)
 Copyright (c) 2002-2021 www.mailtech.cn 163com
X-CM-CTRLDATA: fxMJdGZvb3Rlcl9odG09MjMzOjU2
Content-Type: multipart/mixed; 
 boundary="----=_Part_43729_1553491796.1618376617938"
MIME-Version: 1.0
Message-ID: <554c28f.2f15.178cec36fd2.Coremail.fxm16899@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: jMGowACn0aWpd3ZgM3fkAA--.32491W
X-CM-SenderInfo: pi0pilqyzzqiywtou0bp/xtbBZBd0m1QHM0fdCQADss
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
Received-SPF: pass client-ip=220.181.13.140; envelope-from=fxm16899@163.com;
 helo=m13140.mail.163.com
X-Spam_action: no action
X-Bogosity: Spam, tests=bogofilter, spamicity=1.000000, version=1.2.4
X-CRM114-Status: SPAM  (  -5.34  )
Received-SPF: pass client-ip=96.88.95.61; envelope-from=mlmgr@proulx.com;
 helo=havoc.proulx.com
X-Spam_score_int: 42
X-Spam_score: 4.2
X-Spam_bar: ++++
X-Spam_report: (4.2 / 5.0 requ) BAYES_50=0.8, CHARSET_FARAWAY_HEADER=3.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, HK_RANDOM_ENVFROM=0.001,
 HTML_MESSAGE=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 14 Apr 2021 09:17:15 -0400
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

------=_Part_43729_1553491796.1618376617938
Content-Type: multipart/alternative; 
	boundary="----=_Part_43731_165141430.1618376617938"

------=_Part_43731_165141430.1618376617938
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: 7bit

HI, I have find qemu serial not support crtscts. This result some machine not communication, because this machine need crtscts
------=_Part_43731_165141430.1618376617938
Content-Type: text/html; charset=GBK
Content-Transfer-Encoding: 7bit

<div style="line-height:1.7;color:#000000;font-size:14px;font-family:Arial"><p style="margin:0;">HI, I have find qemu serial not support crtscts. This result some machine not communication, because this machine need crtscts</p></div><br><br><span title="neteasefooter"><p>&nbsp;</p></span>
------=_Part_43731_165141430.1618376617938--

------=_Part_43729_1553491796.1618376617938
Content-Type: application/octet-stream; name=set_seial_crtscts.patch
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="set_seial_crtscts.patch"

ZGlmZiAtLWdpdCAiYS9jaGFyZGV2L2NoYXItc2VyaWFsLmMiICJiL2NoYXJkZXYvY2hhci1zZXJp
YWwuYyIKaW5kZXggN2MzZDg0YWUyNC4uNDA0ODBkNDVlNCAxMDA2NDQKLS0tICJhL2NoYXJkZXYv
Y2hhci1zZXJpYWwuYyIKKysrICJiL2NoYXJkZXYvY2hhci1zZXJpYWwuYyIKQEAgLTE0Myw2ICsx
NDMsNyBAQCBzdGF0aWMgdm9pZCB0dHlfc2VyaWFsX2luaXQoaW50IGZkLCBpbnQgc3BlZWQsCiAg
ICAgdHR5LmNfb2ZsYWcgJj0gfk9QT1NUOwogICAgIHR0eS5jX2xmbGFnICY9IH4oRUNITyB8IEVD
SE9OTCB8IElDQU5PTiB8IElFWFRFTiB8IElTSUcpOwogICAgIHR0eS5jX2NmbGFnICY9IH4oQ1NJ
WkUgfCBQQVJFTkIgfCBQQVJPREQgfCBDUlRTQ1RTIHwgQ1NUT1BCKTsKKyAgICB0dHkuY19jZmxh
ZyB8PSBDUlRTQ1RTCiAgICAgc3dpdGNoIChkYXRhX2JpdHMpIHsKICAgICBkZWZhdWx0OgogICAg
IGNhc2UgODoK
------=_Part_43729_1553491796.1618376617938--



