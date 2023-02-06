Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E75E268B4B7
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 04:59:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOsdt-0000pP-5h; Sun, 05 Feb 2023 22:58:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liu-weinan@qq.com>) id 1pOsdp-0000pC-1P
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 22:58:05 -0500
Received: from out203-205-221-190.mail.qq.com ([203.205.221.190])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liu-weinan@qq.com>) id 1pOsdm-0002uj-Dm
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 22:58:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1675655872; bh=d616RdHXF/h+pcCPrOKzjDaST7hBtlIYOEhW8clEomQ=;
 h=From:To:Cc:Subject:Date;
 b=LHB4RiBthZ46laQ4bLth22pSykUwvhno3jJFsWIYDcXMD5+ehw/sziVltyKo+cpPA
 MZNAX5f4Qp/r9Kz4sj41fwmp3mL3qHSGcAxuJKzr3O01rxwZOmD2MTYJRPYrm3tPxA
 SQsANU7AKl/wQvviAwiYfSaR+A+YYlFehFK+ZNi4=
X-QQ-FEAT: oHWrrGTW1dDRbvGv3VJP9TzOaNKYzqcj
X-QQ-SSF: 00000000000000F000000000000000I
X-QQ-XMAILINFO: MPoJ54MdyxGBFhcwBRx/gnYLiO583OjbsmMzrQchWaZGbU36fuAn/dYYV4eI+u
 QgyzL/9bQbYbBduaiYP1771X1Mi3STcfCYxBMhXVDngjND3sUfsveHFt+SJcmesRw9nuofFHvhWGb
 fj9HRNAc2V/OiNJIHp0O188MF5qpUANfLsNUTRtLAzb1BfOfIUUzTT15RCtzyUwvRszP0fcM5I/9H
 YNXfe2BzSTl3MS5sKqmo5nEusQjsDjLJa4KQyJSQClTuLIO0SNx0XZElqkDRMUdvnkZUi92PjsTsu
 LWrZ39uhMapfaZusLuSQuF4SKR+5CVjXebTXepsgBlgiL3p15QQzgcCjqM6tmHLlm5jOHe0AE4OUp
 O6FrZUWB1m68wC7z2+naZtWx9xvDQUWB/qE0yYeoT4hpIwcmIFfSUx+v78AcrnRHyhYsJd3DyR8lm
 6DejI0CRI4CUMZPfkYzYpmtn5WYGAE1sG91V/l/hlzih1UnojkhFmDMqWHrkHq07iPijNAhWEowPG
 MGlRT4yZOYznli0dxeY12Na24+3mRx3ZK1h0UETLf8Awdk40SFsRWirCXtVUPRB3VxCLS7LaG6sFQ
 7+XGyNUP4k/zCACwqK7+EWaBcJqlTT0fk2CQMYjDAVIGsjiPH1T1LiTNQ4aLkaATPZMsfiimx4yx/
 lnEDmmaqrTsE6EAgVM5dziACCHRjjGFnLnzSz7BKONxW33UfTnyw2+SXjx6Z+GdoJ/BSjGlv7MJzs
 wWlNYlKoEz7jr9xDW7U6JkDQcZ+mzvENtgvLfEMa2oZi1ZZZ6SArr/HE14pJeMvGcXJYoD1tsvF8T
 2t1aKGoG6fiyvG/9xlINoIu7bgcuHnHuX6ireQH4CaoO7iv8cwRXF+VRK+b1+C7WrWZP1mq4vphZU
 jtiA9SpPMNCD6Zz9AXCDbQ7DOhjTWlEIfBkuGTmvn9H590bspLSv/F/DyrwfAjni0kLxLua1Js=
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 117.28.23.179
X-QQ-STYLE: 
X-QQ-mid: webmail440t1675655678t6329822
From: "=?gb18030?B?V2VpbmFuIExpdaOowfXsv+mqo6k=?=" <liu-weinan@qq.com>
To: "=?gb18030?B?UGV0ZXIgWHU=?=" <peterx@redhat.com>
Cc: "=?gb18030?B?cWVtdS1kZXZlbA==?=" <qemu-devel@nongnu.org>,
 "=?gb18030?B?ZGdpbGJlcnQ=?=" <dgilbert@redhat.com>,
 "=?gb18030?B?UGFvbG8gQm9uemluaQ==?=" <pbonzini@redhat.com>
Subject: Re: [PATCH v2] KVM: dirty ring: check if vcpu is created before
 dirty_ring_reap_one
Mime-Version: 1.0
Content-Type: text/plain;
	charset="gb18030"
Content-Transfer-Encoding: base64
Date: Mon, 6 Feb 2023 11:54:38 +0800
X-Priority: 3
Message-ID: <tencent_977641A1343378C6FD0AEAE6F59A75AD5305@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
Received-SPF: pass client-ip=203.205.221.190; envelope-from=liu-weinan@qq.com;
 helo=out203-205-221-190.mail.qq.com
X-Spam_score_int: 40
X-Spam_score: 4.0
X-Spam_bar: ++++
X-Spam_report: (4.0 / 5.0 requ) BAYES_00=-1.9, CHARSET_FARAWAY_HEADER=3.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_FROM=0.001, HELO_DYNAMIC_IPADDR=1.951, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, RDNS_DYNAMIC=0.982, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

SGksIFBldGVyLAoKJmd0OyBJTUhPIHRoYXQgb25lIHdpbGwgYmUgbW9yZSBzdHJhaWdodGZv
cndhcmQgYW5kIHNlbGYgY29udGFpbmVkIHRoYW4gdGhpcwomZ3Q7IG9uZS4gIFdoYXQgZG8g
eW91IHRoaW5rPwpZZXMsIGl0IGlzLgoKJmd0OyBXaGVuIHBvc3RpbmcgbmV3IHBhdGNoZXMs
IHBsZWFzZSBhbHNvIHJlbWVtYmVyIHRvIGNvcHkgbWFpbnRhaW5lcnMuICBGb3IKJmd0OyB0
aGlzIG9uZSwgaXQnczoKVGhhbmtzIGZvciB5b3VyIHN1Z2dlc3Rpb24uCgpXZWluYW4gTGl1



