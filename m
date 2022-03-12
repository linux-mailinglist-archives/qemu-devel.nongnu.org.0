Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68EC34D70D1
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Mar 2022 21:22:59 +0100 (CET)
Received: from localhost ([::1]:48828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nT8GQ-0004X4-Gd
	for lists+qemu-devel@lfdr.de; Sat, 12 Mar 2022 15:22:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1nT87T-0004E8-Km
 for qemu-devel@nongnu.org; Sat, 12 Mar 2022 15:13:43 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:1609)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1nT87R-0008Qq-PR
 for qemu-devel@nongnu.org; Sat, 12 Mar 2022 15:13:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1647116022; x=1678652022;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BZ+iH9zLf2vI1qBNcu+w0hYWXnK5YGGYKvLdysWYI6Q=;
 b=USSeSw26SUQ6GdFBttwar0q6vzXejd3Gb0mp1lAvsmKqFairS/RTO4M7
 TGaeTZEcjq1XefRSwQZ2yu87N5aRxuquVW/qXfpY9WOLGGQ8g+vwBMzjF
 LB8GNa1w8ljnwzJ/l7NfR+RcQj8meDiEJtJwqhSCc9WlhmYpL3dmjwEjB I=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 12 Mar 2022 12:13:41 -0800
X-QCInternal: smtphost
Received: from hu-tsimpson-lv.qualcomm.com (HELO
 hu-devc-lv-u18-c.qualcomm.com) ([10.47.235.220])
 by ironmsg07-lv.qualcomm.com with ESMTP; 12 Mar 2022 12:13:40 -0800
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id 94EDD5005B4; Sat, 12 Mar 2022 12:13:20 -0800 (PST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 00/12] Hexagon (target/hexagon) queue
Date: Sat, 12 Mar 2022 12:13:07 -0800
Message-Id: <20220312201319.29040-1-tsimpson@quicinc.com>
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
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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

VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCAxNDE2Njg4YzUzYmU2NTM1YmU3NTVi
NDRjMTVmYjJlYjlkZWZkMjBmOgoKICBNZXJnZSByZW1vdGUtdHJhY2tpbmcgYnJhbmNoICdyZW1v
dGVzL21jYXlsYW5kL3RhZ3MvcTgwMC11cGRhdGVzLWZvci03LjAtMjAyMjAzMDknIGludG8gc3Rh
Z2luZyAoMjAyMi0wMy0xMCAxMzoxNjozNyArMDAwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdp
dCByZXBvc2l0b3J5IGF0OgoKICBodHRwczovL2dpdGh1Yi5jb20vcXVpYy9xZW11IHRhZ3MvcHVs
bC1oZXgtMjAyMjAzMTItMQoKZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDRhODE4YjM3
NjcyMjBkY2QyMWNmNWNjN2YxMmUzM2UyOGMyMDczZWQ6CgogIHRhcmdldC9oZXhhZ29uOiByZW1v
dmUgdW51c2VkIHZhcmlhYmxlICgyMDIyLTAzLTEyIDA5OjE0OjIyIC0wODAwKQoKLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpI
ZXhhZ29uIGJ1ZyBmaXhlcyBhbmQgYWRkaXRpb25hbCB0ZXN0cwoKQWxzbyBpbmNsdWRlcyBhIHBh
dGNoIGZyb20gWm9uZ3l1YW4gTGkgPHpvbmd5dWFuLmxpQHNtYXJ0eC5jb20+IHRvIHJlbW92ZSBh
biB1bnVzZWQgdmFyaWFibGUKCioqKioqKioqIENoYW5nZXMgaW4gdjIgKioqKioqKioKRml4IHBy
b2JsZW1zIHdpdGggYnVpbGQtdXNlci1oZXhhZ29uIENJIGpvYgoKLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpNaWNoYWVsIExh
bWJlcnQgKDEpOgogICAgICBIZXhhZ29uICh0YXJnZXQvaGV4YWdvbikgZml4IGJ1ZyBpbiBjaXJj
dWxhciBhZGRyZXNzaW5nCgpUYXlsb3IgU2ltcHNvbiAoMTApOgogICAgICBIZXhhZ29uIEhWWCAo
dGFyZ2V0L2hleGFnb24pIGZpeCBidWcgaW4gSFZYIHNhdHVyYXRlIGluc3RydWN0aW9ucwogICAg
ICBIZXhhZ29uICh0YXJnZXQvaGV4YWdvbikgcHJvcGVybHkgc2V0IEZQSU5WRiBiaXQgaW4gc2Zj
bXAudW8gYW5kIGRmY21wLnVvCiAgICAgIEhleGFnb24gKHRhcmdldC9oZXhhZ29uKSBwcm9wZXJs
eSBoYW5kbGUgZGVub3JtIGluIGFyY2hfc2ZfcmVjaXBfY29tbW9uCiAgICAgIEhleGFnb24gKHRh
cmdldC9oZXhhZ29uKSBwcm9wZXJseSBoYW5kbGUgTmFOIGluIGRmbWluL2RmbWF4L3NmbWluL3Nm
bWF4CiAgICAgIEhleGFnb24gKHRlc3RzL3RjZy9oZXhhZ29uKSB0ZXN0IGluc3RydWN0aW9ucyB0
aGF0IG1pZ2h0IHNldCBiaXRzIGluIFVTUgogICAgICBIZXhhZ29uICh0ZXN0cy90Y2cvaGV4YWdv
bikgYWRkIGZsb2F0aW5nIHBvaW50IGluc3RydWN0aW9ucyB0byB1c3IuYwogICAgICBIZXhhZ29u
ICh0ZXN0cy90Y2cvaGV4YWdvbikgdXBkYXRlIG92ZXJmbG93IHRlc3QKICAgICAgSGV4YWdvbiAo
dGVzdHMvdGNnL2hleGFnb24pIGZpeCBpbmxpbmUgYXNtIGluIHByZWdfYWxpYXMuYwogICAgICBI
ZXhhZ29uICh0YXJnZXQvaGV4YWdvbikgZml4IGJ1ZyBpbiBjb252X2RmMnV3X2Nob3AKICAgICAg
SGV4YWdvbiAodGFyZ2V0L2hleGFnb24pIGFzc2lnbm1lbnQgdG8gYzQgc2hvdWxkIHdhaXQgdW50
aWwgcGFja2V0IGNvbW1pdAoKWm9uZ3l1YW4gTGkgKDEpOgogICAgICB0YXJnZXQvaGV4YWdvbjog
cmVtb3ZlIHVudXNlZCB2YXJpYWJsZQoKIHRhcmdldC9oZXhhZ29uL2ZtYV9lbXUuaCAgICAgICAg
ICB8ICAgIDYgKy0KIHRhcmdldC9oZXhhZ29uL21hY3Jvcy5oICAgICAgICAgICB8ICAgIDQgKy0K
IHRhcmdldC9oZXhhZ29uL21tdmVjL21hY3Jvcy5oICAgICB8ICAgIDYgKy0KIHRhcmdldC9oZXhh
Z29uL2FyY2guYyAgICAgICAgICAgICB8ICAgIDYgKy0KIHRhcmdldC9oZXhhZ29uL2dlbnB0ci5j
ICAgICAgICAgICB8ICAgMTQgKy0KIHRhcmdldC9oZXhhZ29uL29wX2hlbHBlci5jICAgICAgICB8
ICAgMjggKy0KIHRlc3RzL3RjZy9oZXhhZ29uL2NpcmMuYyAgICAgICAgICB8ICAgIDUgKy0KIHRl
c3RzL3RjZy9oZXhhZ29uL2Zwc3R1ZmYuYyAgICAgICB8ICAxMjMgKysrLQogdGVzdHMvdGNnL2hl
eGFnb24vaHZ4X21pc2MuYyAgICAgIHwgICA3MSArKy0KIHRlc3RzL3RjZy9oZXhhZ29uL292ZXJm
bG93LmMgICAgICB8ICAgNjEgKy0KIHRlc3RzL3RjZy9oZXhhZ29uL3ByZWdfYWxpYXMuYyAgICB8
ICAgODQgKystCiB0ZXN0cy90Y2cvaGV4YWdvbi91c3IuYyAgICAgICAgICAgfCAxMTQxICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIHRlc3RzL3RjZy9oZXhhZ29uL01ha2Vm
aWxlLnRhcmdldCB8ICAgIDggKy0KIDEzIGZpbGVzIGNoYW5nZWQsIDE0NzQgaW5zZXJ0aW9ucygr
KSwgODMgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgdGVzdHMvdGNnL2hleGFnb24v
dXNyLmMK

