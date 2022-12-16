Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B856064E654
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 04:22:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p61Ij-0007KK-05; Thu, 15 Dec 2022 22:22:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhangdongdong@eswincomputing.com>)
 id 1p61Ie-0007JX-Fq
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 22:22:17 -0500
Received: from zg8tmja2lje4os4yms4ymjma.icoremail.net ([206.189.21.223])
 by eggs.gnu.org with smtp (Exim 4.90_1)
 (envelope-from <zhangdongdong@eswincomputing.com>)
 id 1p61Ic-00077e-0T
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 22:22:16 -0500
Received: from zhangdongdong$eswincomputing.com ( [10.12.96.123] ) by
 ajax-webmail-app2 (Coremail) ; Fri, 16 Dec 2022 11:22:05 +0800 (GMT+08:00)
X-Originating-IP: [10.12.96.123]
Date: Fri, 16 Dec 2022 11:22:05 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: "Dongdong Zhang" <zhangdongdong@eswincomputing.com>
To: qemu-devel@nongnu.org
Cc: jsnow@redhat.com, crosa@redhat.com, bleal@redhat.com
Subject: [PING PATCH 0/1]  Fix some typos
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT6.0.3 build 20220420(169d3f8c)
 Copyright (c) 2002-2022 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <20221130015358.6998-1-zhangdongdong@eswincomputing.com>
References: <20221130015358.6998-1-zhangdongdong@eswincomputing.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <1ceb5a68.dd0e.18518f40d8f.Coremail.zhangdongdong@eswincomputing.com>
X-Coremail-Locale: en_US
X-CM-TRANSID: EggMCgBX5i9d5Jtj0eMZAA--.20391W
X-CM-SenderInfo: x2kd0wpgrqwvxrqjqvxvzl0uprps33xlqjhudrp/1tbiAgECCmOba
 m0NxQACs+
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
 CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
 daVFxhVjvjDU=
Received-SPF: pass client-ip=206.189.21.223;
 envelope-from=zhangdongdong@eswincomputing.com;
 helo=zg8tmja2lje4os4yms4ymjma.icoremail.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

SGkgYWxsLAoKSSB3b3VsZCBsaWtlIHRvIHBpbmcgYSBwYXRjaAoKaHR0cHM6Ly9saXN0cy5ub25n
bnUub3JnL2FyY2hpdmUvaHRtbC9xZW11LWRldmVsLzIwMjItMTEvbXNnMDQ1NjguaHRtbApodHRw
czovL2xpc3RzLm5vbmdudS5vcmcvYXJjaGl2ZS9odG1sL3FlbXUtZGV2ZWwvMjAyMi0xMS9tc2cw
NDU3MC5odG1sCgoKPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2VzLS0tLS1Gcm9tOiJEb25nZG9uZyBa
aGFuZyIgPHpoYW5nZG9uZ2RvbmdAZXN3aW5jb21wdXRpbmcuY29tPlNlbnQgVGltZToyMDIyLTEx
LTMwIDA5OjUzOjU3IChXZWRuZXNkYXkpVG86cWVtdS1kZXZlbEBub25nbnUub3JnQ2M6anNub3dA
cmVkaGF0LmNvbSwgY3Jvc2FAcmVkaGF0LmNvbSwgYmxlYWxAcmVkaGF0LmNvbSwgIkRvbmdkb25n
IFpoYW5nIiA8emhhbmdkb25nZG9uZ0Blc3dpbmNvbXB1dGluZy5jb20+U3ViamVjdDpbUEFUQ0gg
MC8xXSAgRml4IHNvbWUgdHlwb3MKPiAKPiBUaGlzIHBhdGNoIG1haW5seSBmaXhlcyBzb21lIHR5
cG9zIGluIHRoZSAncHl0aG9uJyBkaXJlY3RvcnkuCj4gCj4gRG9uZ2RvbmcgWmhhbmcgKDEpOgo+
ICAgRml4IHNvbWUgdHlwb3MKPiAKPiAgcHl0aG9uL3FlbXUvbWFjaGluZS9jb25zb2xlX3NvY2tl
dC5weSB8IDIgKy0KPiAgcHl0aG9uL3FlbXUvbWFjaGluZS9xdGVzdC5weSAgICAgICAgICB8IDIg
Ky0KPiAgcHl0aG9uL3FlbXUvcW1wL3Byb3RvY29sLnB5ICAgICAgICAgICB8IDIgKy0KPiAgcHl0
aG9uL3FlbXUvcW1wL3FtcF90dWkucHkgICAgICAgICAgICB8IDYgKysrLS0tCj4gIDQgZmlsZXMg
Y2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+IAo+IC0tIAo+IDIuMTcu
MQo=

