Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D133B4D23E0
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 23:07:45 +0100 (CET)
Received: from localhost ([::1]:43296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRhzc-0003Ml-V3
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 17:07:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1nRhnv-0001pH-OY
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 16:55:39 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:7197)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1nRhnt-0004Ih-PH
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 16:55:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1646776538; x=1678312538;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6pDgmfRp91pFfe/8eNx/jWnG1fBJ4ltvNN64IZw8aqo=;
 b=FdlwFyek7Nxjujf06Na2fbqbt7+WsBOUOOv7/QTW0PuqiC///SvtVSW3
 OGnWc3IDf3n6dynqQ6yULOCxFwUOIaPiyPK7dwriTyzX4zrYevckqYqsj
 tVKH5CgvBXuXzYaj7YECj8t7I1bERvt0/pM5VDuqVTWZHuxoAuoZ3G+y1 g=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 08 Mar 2022 13:55:37 -0800
X-QCInternal: smtphost
Received: from hu-tsimpson-lv.qualcomm.com (HELO
 hu-devc-lv-u18-c.qualcomm.com) ([10.47.235.220])
 by ironmsg07-lv.qualcomm.com with ESMTP; 08 Mar 2022 13:55:37 -0800
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id DB99E500172; Tue,  8 Mar 2022 13:54:36 -0800 (PST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/12] Hexagon (target/hexagon) queue
Date: Tue,  8 Mar 2022 13:54:23 -0800
Message-Id: <20220308215435.21806-1-tsimpson@quicinc.com>
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

VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCAzM2QxMDJlOTJlNDFhNjVjODE3ZDg1
ZmY4YmZkNWZmYTJjMTZiMWQzOgoKICBNZXJnZSByZW1vdGUtdHJhY2tpbmcgYnJhbmNoICdyZW1v
dGVzL2tyYXhlbC90YWdzL3NlYWJpb3MtMjAyMjAzMDctcHVsbC1yZXF1ZXN0JyBpbnRvIHN0YWdp
bmcgKDIwMjItMDMtMDggMTI6NDA6NTggKzAwMDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQg
cmVwb3NpdG9yeSBhdDoKCiAgaHR0cHM6Ly9naXRodWIuY29tL3F1aWMvcWVtdSB0YWdzL3B1bGwt
aGV4LTIwMjIwMzA4Cgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gZWJiZjBlZTEzMzU1
NDhmZTliNDJmY2QxZmYwMzFhZWEyZDI3Y2MxYToKCiAgdGFyZ2V0L2hleGFnb246IHJlbW92ZSB1
bnVzZWQgdmFyaWFibGUgKDIwMjItMDMtMDggMTM6Mjc6MDAgLTA4MDApCgotLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkhleGFn
b24gYnVnIGZpeGVzIGFuZCBhZGRpdGlvbmFsIHRlc3RzCgpBbHNvIGluY2x1ZGVzIGEgcGF0Y2gg
ZnJvbSBab25neXVhbiBMaSA8em9uZ3l1YW4ubGlAc21hcnR4LmNvbT4KdG8gcmVtb3ZlIGFuIHVu
dXNlZCB2YXJpYWJsZQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpNaWNoYWVsIExhbWJlcnQgKDEpOgogICAgICBIZXhhZ29u
ICh0YXJnZXQvaGV4YWdvbikgZml4IGJ1ZyBpbiBjaXJjdWxhciBhZGRyZXNzaW5nCgpUYXlsb3Ig
U2ltcHNvbiAoMTApOgogICAgICBIZXhhZ29uIEhWWCAodGFyZ2V0L2hleGFnb24pIGZpeCBidWcg
aW4gSFZYIHNhdHVyYXRlIGluc3RydWN0aW9ucwogICAgICBIZXhhZ29uICh0YXJnZXQvaGV4YWdv
bikgcHJvcGVybHkgc2V0IEZQSU5WRiBiaXQgaW4gc2ZjbXAudW8gYW5kIGRmY21wLnVvCiAgICAg
IEhleGFnb24gKHRhcmdldC9oZXhhZ29uKSBwcm9wZXJseSBoYW5kbGUgZGVub3JtIGluIGFyY2hf
c2ZfcmVjaXBfY29tbW9uCiAgICAgIEhleGFnb24gKHRhcmdldC9oZXhhZ29uKSBwcm9wZXJseSBo
YW5kbGUgTmFOIGluIGRmbWluL2RmbWF4L3NmbWluL3NmbWF4CiAgICAgIEhleGFnb24gKHRlc3Rz
L3RjZy9oZXhhZ29uKSB0ZXN0IGluc3RydWN0aW9ucyB0aGF0IG1pZ2h0IHNldCBiaXRzIGluIFVT
UgogICAgICBIZXhhZ29uICh0ZXN0cy90Y2cvaGV4YWdvbikgYWRkIGZsb2F0aW5nIHBvaW50IGlu
c3RydWN0aW9ucyB0byB1c3IuYwogICAgICBIZXhhZ29uICh0ZXN0cy90Y2cvaGV4YWdvbikgdXBk
YXRlIG92ZXJmbG93IHRlc3QKICAgICAgSGV4YWdvbiAodGVzdHMvdGNnL2hleGFnb24pIGZpeCBp
bmxpbmUgYXNtIGluIHByZWdfYWxpYXMuYwogICAgICBIZXhhZ29uICh0YXJnZXQvaGV4YWdvbikg
Zml4IGJ1ZyBpbiBjb252X2RmMnV3X2Nob3AKICAgICAgSGV4YWdvbiAodGFyZ2V0L2hleGFnb24p
IGFzc2lnbm1lbnQgdG8gYzQgc2hvdWxkIHdhaXQgdW50aWwgcGFja2V0IGNvbW1pdAoKWm9uZ3l1
YW4gTGkgKDEpOgogICAgICB0YXJnZXQvaGV4YWdvbjogcmVtb3ZlIHVudXNlZCB2YXJpYWJsZQoK
IHRhcmdldC9oZXhhZ29uL2ZtYV9lbXUuaCAgICAgICAgICB8ICAgIDYgKy0KIHRhcmdldC9oZXhh
Z29uL21hY3Jvcy5oICAgICAgICAgICB8ICAgIDQgKy0KIHRhcmdldC9oZXhhZ29uL21tdmVjL21h
Y3Jvcy5oICAgICB8ICAgIDYgKy0KIHRhcmdldC9oZXhhZ29uL2FyY2guYyAgICAgICAgICAgICB8
ICAgIDYgKy0KIHRhcmdldC9oZXhhZ29uL2dlbnB0ci5jICAgICAgICAgICB8ICAgMTQgKy0KIHRh
cmdldC9oZXhhZ29uL29wX2hlbHBlci5jICAgICAgICB8ICAgMjggKy0KIHRlc3RzL3RjZy9oZXhh
Z29uL2NpcmMuYyAgICAgICAgICB8ICAgIDUgKy0KIHRlc3RzL3RjZy9oZXhhZ29uL2Zwc3R1ZmYu
YyAgICAgICB8ICAxMjMgKysrLQogdGVzdHMvdGNnL2hleGFnb24vaHZ4X21pc2MuYyAgICAgIHwg
ICA3MSArKy0KIHRlc3RzL3RjZy9oZXhhZ29uL292ZXJmbG93LmMgICAgICB8ICAgNjEgKy0KIHRl
c3RzL3RjZy9oZXhhZ29uL3ByZWdfYWxpYXMuYyAgICB8ICAgODQgKystCiB0ZXN0cy90Y2cvaGV4
YWdvbi91c3IuYyAgICAgICAgICAgfCAxMTQxICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysKIHRlc3RzL3RjZy9oZXhhZ29uL01ha2VmaWxlLnRhcmdldCB8ICAgIDggKy0KIDEz
IGZpbGVzIGNoYW5nZWQsIDE0NzQgaW5zZXJ0aW9ucygrKSwgODMgZGVsZXRpb25zKC0pCiBjcmVh
dGUgbW9kZSAxMDA2NDQgdGVzdHMvdGNnL2hleGFnb24vdXNyLmMK

