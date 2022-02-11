Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81EB64B2452
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 12:33:14 +0100 (CET)
Received: from localhost ([::1]:57564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIUAr-0001MD-J5
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 06:33:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1nITwK-0007kr-Bj
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 06:18:12 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:17131)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1nITwE-00017S-Qs
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 06:18:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1644578286; x=1676114286;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=acRRcnrLATBML4MoBxB0rPaz8m8kZt6vaPFq00uCNns=;
 b=p4rCUBXQFY9rAD3YTI8IqnvP4oUUdUU9t+ypyJVCTyebr+3tO/9bhSO4
 D7AAGhqO3rDfGYT7wNB3l4drtcEh/CgoQXHD4VKpl4WYzrUoeUf14tLBp
 Td1wOPtGeibv9fxo0nqygjnqSc2bPG9oNjgmTH9SrUUNVtX4U5s3suPiV 0=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 11 Feb 2022 03:17:44 -0800
X-QCInternal: smtphost
Received: from hu-tsimpson-lv.qualcomm.com (HELO
 hu-devc-lv-u18-c.qualcomm.com) ([10.47.235.220])
 by ironmsg07-lv.qualcomm.com with ESMTP; 11 Feb 2022 03:17:44 -0800
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id 8BCA1500175; Fri, 11 Feb 2022 03:17:24 -0800 (PST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/12] Hexagon (target/hexagon) queue
Date: Fri, 11 Feb 2022 03:17:10 -0800
Message-Id: <20220211111722.31036-1-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=129.46.98.28; envelope-from=tsimpson@qualcomm.com;
 helo=alexa-out.qualcomm.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, tsimpson@quicinc.com,
 richard.henderson@linaro.org, f4bug@amsat.org, zongyuan.li@smartx.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCAwYTMwMTYyNGMyZjRjZWQzMzMxZmZk
NWJjZTg1YjQyNzRmZTEzMmFmOgoKICBNZXJnZSByZW1vdGUtdHJhY2tpbmcgYnJhbmNoICdyZW1v
dGVzL3BtYXlkZWxsL3RhZ3MvcHVsbC10YXJnZXQtYXJtLTIwMjIwMjA4JyBpbnRvIHN0YWdpbmcg
KDIwMjItMDItMDggMTE6NDA6MDggKzAwMDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVw
b3NpdG9yeSBhdDoKCiAgaHR0cHM6Ly9naXRodWIuY29tL3F1aWMvcWVtdSB0YWdzL3B1bGwtaGV4
LTIwMjIwMjExCgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gZWZmZGVkZTdhNGIwNGNh
Y2VhMTQ2MTgwMTBjY2M3Nzc1YmIxOTE5NjoKCiAgdGFyZ2V0L2hleGFnb246IHJlbW92ZSB1bnVz
ZWQgdmFyaWFibGUgKDIwMjItMDItMTEgMDI6MTc6NTQgLTA4MDApCgotLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkhleGFnb24g
YnVnIGZpeGVzIGFuZCBhZGRpdGlvbmFsIHRlc3RzCgpBbHNvIGluY2x1ZGVzIGEgcGF0Y2ggZnJv
bSBab25neXVhbiBMaSA8em9uZ3l1YW4ubGlAc21hcnR4LmNvbT4KdG8gcmVtb3ZlIGFuIHVudXNl
ZCB2YXJpYWJsZQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQpNaWNoYWVsIExhbWJlcnQgKDEpOgogICAgICBIZXhhZ29uICh0
YXJnZXQvaGV4YWdvbikgZml4IGJ1ZyBpbiBjaXJjdWxhciBhZGRyZXNzaW5nCgpUYXlsb3IgU2lt
cHNvbiAoMTApOgogICAgICBIZXhhZ29uIEhWWCAodGFyZ2V0L2hleGFnb24pIGZpeCBidWcgaW4g
SFZYIHNhdHVyYXRlIGluc3RydWN0aW9ucwogICAgICBIZXhhZ29uICh0YXJnZXQvaGV4YWdvbikg
cHJvcGVybHkgc2V0IEZQSU5WRiBiaXQgaW4gc2ZjbXAudW8gYW5kIGRmY21wLnVvCiAgICAgIEhl
eGFnb24gKHRhcmdldC9oZXhhZ29uKSBwcm9wZXJseSBoYW5kbGUgZGVub3JtIGluIGFyY2hfc2Zf
cmVjaXBfY29tbW9uCiAgICAgIEhleGFnb24gKHRlc3RzL3RjZy9oZXhhZ29uKSB0ZXN0IGluc3Ry
dWN0aW9ucyB0aGF0IG1pZ2h0IHNldCBiaXRzIGluIFVTUgogICAgICBIZXhhZ29uICh0ZXN0cy90
Y2cvaGV4YWdvbikgYWRkIGZsb2F0aW5nIHBvaW50IGluc3RydWN0aW9ucyB0byB1c3IuYwogICAg
ICBIZXhhZ29uICh0ZXN0cy90Y2cvaGV4YWdvbikgdXBkYXRlIG92ZXJmbG93IHRlc3QKICAgICAg
SGV4YWdvbiAodGVzdHMvdGNnL2hleGFnb24pIGZpeCBpbmxpbmUgYXNtIGluIHByZWdfYWxpYXMu
YwogICAgICBIZXhhZ29uICh0YXJnZXQvaGV4YWdvbikgZml4IGJ1ZyBpbiBjb252X2RmMnV3X2No
b3AKICAgICAgSGV4YWdvbiAodGFyZ2V0L2hleGFnb24pIGFzc2lnbm1lbnQgdG8gYzQgc2hvdWxk
IHdhaXQgdW50aWwgcGFja2V0IGNvbW1pdAogICAgICBIZXhhZ29uICh0YXJnZXQvaGV4YWdvbikg
Y29udmVydCB0byBPQkpFQ1RfREVDTEFSRV9UWVBFCgpab25neXVhbiBMaSAoMSk6CiAgICAgIHRh
cmdldC9oZXhhZ29uOiByZW1vdmUgdW51c2VkIHZhcmlhYmxlCgogdGFyZ2V0L2hleGFnb24vY3B1
LmggICAgICAgICAgICAgIHwgICAgOSArLQogdGFyZ2V0L2hleGFnb24vZm1hX2VtdS5oICAgICAg
ICAgIHwgICAgNiArLQogdGFyZ2V0L2hleGFnb24vbWFjcm9zLmggICAgICAgICAgIHwgICAgNCAr
LQogdGFyZ2V0L2hleGFnb24vbW12ZWMvbWFjcm9zLmggICAgIHwgICAgNCAtCiB0YXJnZXQvaGV4
YWdvbi9hcmNoLmMgICAgICAgICAgICAgfCAgICA2ICstCiB0YXJnZXQvaGV4YWdvbi9nZW5wdHIu
YyAgICAgICAgICAgfCAgIDE0ICstCiB0YXJnZXQvaGV4YWdvbi9vcF9oZWxwZXIuYyAgICAgICAg
fCAgIDE0ICstCiB0ZXN0cy90Y2cvaGV4YWdvbi9jaXJjLmMgICAgICAgICAgfCAgICA1ICstCiB0
ZXN0cy90Y2cvaGV4YWdvbi9mcHN0dWZmLmMgICAgICAgfCAgIDQ0ICstCiB0ZXN0cy90Y2cvaGV4
YWdvbi9odnhfbWlzYy5jICAgICAgfCAgIDcxICsrLQogdGVzdHMvdGNnL2hleGFnb24vb3ZlcmZs
b3cuYyAgICAgIHwgICA2MSArLQogdGVzdHMvdGNnL2hleGFnb24vcHJlZ19hbGlhcy5jICAgIHwg
ICA4NCArKy0KIHRlc3RzL3RjZy9oZXhhZ29uL3Vzci5jICAgICAgICAgICB8IDExNDEgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogdGVzdHMvdGNnL2hleGFnb24vTWFrZWZp
bGUudGFyZ2V0IHwgICAgOCArLQogMTQgZmlsZXMgY2hhbmdlZCwgMTQwOSBpbnNlcnRpb25zKCsp
LCA2MiBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCB0ZXN0cy90Y2cvaGV4YWdvbi91
c3IuYwo=

