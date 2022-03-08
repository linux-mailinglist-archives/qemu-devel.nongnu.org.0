Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AEDC4D23BE
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 22:57:52 +0100 (CET)
Received: from localhost ([::1]:48168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRhq2-0004Fu-Oj
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 16:57:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1nRhnD-0001RX-Nw
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 16:54:56 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:35641)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1nRhn9-00042X-K2
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 16:54:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1646776491; x=1678312491;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=w23C+Gq/8Apg0c4lG0zXCJikIfeDwNw0QFhXWim8HBk=;
 b=X6uDS0aVr0R4+cz3lmGMy/6rlt5UVQTEqwv7Z1kS+O0mCvSYQ8d0rDTp
 2hqdl/mjtPX0LxgOwMXVWlD2SmxeNgYNeabQRrTHgAQd2zZfu2PwtoyeA
 foXO2zlieEcobC2xYfENS2TiRfes15l0jUXIxhrw80uVKVc7nHXBnW/q+ g=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 08 Mar 2022 13:54:37 -0800
X-QCInternal: smtphost
Received: from hu-tsimpson-lv.qualcomm.com (HELO
 hu-devc-lv-u18-c.qualcomm.com) ([10.47.235.220])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP; 08 Mar 2022 13:54:37 -0800
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id 095C25005B9; Tue,  8 Mar 2022 13:54:37 -0800 (PST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/12] target/hexagon: remove unused variable
Date: Tue,  8 Mar 2022 13:54:35 -0800
Message-Id: <20220308215435.21806-13-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220308215435.21806-1-tsimpson@quicinc.com>
References: <20220308215435.21806-1-tsimpson@quicinc.com>
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

RnJvbTogWm9uZ3l1YW4gTGkgPHpvbmd5dWFuLmxpQHNtYXJ0eC5jb20+CgpXaGVuIGJ1aWxkaW5n
IHdpdGggY2xhbmcgdmVyc2lvbiAxMy4wLjAgKGVnLiBGZWRvcmEgMTMuMC4wLTMuZmMzNSksCnR3
byB1bnVzZWQgdmFyaWFibGVzIGludHJvZHVjZWQgYnkgbWFjcm8gR0FUSEVSX0ZVTkNUSU9OIGFu
ZApTQ0FUVEVSX0ZVTkNUSU9OIHdpbGwgY2F1c2UgYnVpbGRpbmcgcHJvY2VzcyBmYWlsdXJlIGR1
ZSB0bwpbLVdlcnJvciAtV3VudXNlZC12YXJpYWJsZV0uCgpTaWduZWQtb2ZmLWJ5OiBab25neXVh
biBMaSA8em9uZ3l1YW4ubGlAc21hcnR4LmNvbT4KUmVzb2x2ZXM6IGh0dHBzOi8vZ2l0bGFiLmNv
bS9xZW11LXByb2plY3QvcWVtdS8tL2lzc3Vlcy84MzEKTWVzc2FnZS1JZDogPDIwMjIwMTI0MDY0
MzM5LjU2MDI3LTEtem9uZ3l1YW4ubGlAc21hcnR4LmNvbT4KUmV2aWV3ZWQtYnk6IFRob21hcyBI
dXRoIDx0aHV0aEByZWRoYXQuY29tPgpSZXZpZXdlZC1ieTogVGF5bG9yIFNpbXBzb24gPHRzaW1w
c29uQHF1aWNpbmMuY29tPgpTaWduZWQtb2ZmLWJ5OiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25A
cXVpY2luYy5jb20+Ci0tLQogdGFyZ2V0L2hleGFnb24vbW12ZWMvbWFjcm9zLmggfCA2ICstLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL3RhcmdldC9oZXhhZ29uL21tdmVjL21hY3Jvcy5oIGIvdGFyZ2V0L2hleGFnb24vbW12
ZWMvbWFjcm9zLmgKaW5kZXggMTBmNDYzMDM2NC4uODM0NTc1MzU4MCAxMDA2NDQKLS0tIGEvdGFy
Z2V0L2hleGFnb24vbW12ZWMvbWFjcm9zLmgKKysrIGIvdGFyZ2V0L2hleGFnb24vbW12ZWMvbWFj
cm9zLmgKQEAgLTEsNSArMSw1IEBACiAvKgotICogIENvcHlyaWdodChjKSAyMDE5LTIwMjEgUXVh
bGNvbW0gSW5ub3ZhdGlvbiBDZW50ZXIsIEluYy4gQWxsIFJpZ2h0cyBSZXNlcnZlZC4KKyAqICBD
b3B5cmlnaHQoYykgMjAxOS0yMDIyIFF1YWxjb21tIElubm92YXRpb24gQ2VudGVyLCBJbmMuIEFs
bCBSaWdodHMgUmVzZXJ2ZWQuCiAgKgogICogIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJl
OyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IgbW9kaWZ5CiAgKiAgaXQgdW5kZXIgdGhl
IHRlcm1zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBhcyBwdWJsaXNoZWQgYnkK
QEAgLTE2NCwxMSArMTY0LDkgQEAKICAgICAgICAgdGFyZ2V0X3Vsb25nIHZhID0gRUE7IFwKICAg
ICAgICAgdGFyZ2V0X3Vsb25nIHZhX2hpZ2ggPSBFQSArIExFTjsgXAogICAgICAgICB1aW50cHRy
X3QgcmEgPSBHRVRQQygpOyBcCi0gICAgICAgIGludCBsb2dfYmFuayA9IDA7IFwKICAgICAgICAg
aW50IGxvZ19ieXRlID0gMDsgXAogICAgICAgICBmb3IgKGkwID0gMDsgaTAgPCBFTEVNRU5UX1NJ
WkU7IGkwKyspIHsgXAogICAgICAgICAgICAgbG9nX2J5dGUgPSAoKHZhICsgaTApIDw9IHZhX2hp
Z2gpICYmIFFWQUw7IFwKLSAgICAgICAgICAgIGxvZ19iYW5rIHw9IChsb2dfYnl0ZSA8PCBpMCk7
IFwKICAgICAgICAgICAgIHVpbnQ4X3QgQjsgXAogICAgICAgICAgICAgQiA9IGNwdV9sZHViX2Rh
dGFfcmEoZW52LCBFQSArIGkwLCByYSk7IFwKICAgICAgICAgICAgIGVudi0+dG1wX1ZSZWdzWzBd
LnViW0VMRU1FTlRfU0laRSAqIElEWCArIGkwXSA9IEI7IFwKQEAgLTI0MywxMSArMjQxLDkgQEAK
ICAgICAgICAgaW50IGkwOyBcCiAgICAgICAgIHRhcmdldF91bG9uZyB2YSA9IEVBOyBcCiAgICAg
ICAgIHRhcmdldF91bG9uZyB2YV9oaWdoID0gRUEgKyBMRU47IFwKLSAgICAgICAgaW50IGxvZ19i
YW5rID0gMDsgXAogICAgICAgICBpbnQgbG9nX2J5dGUgPSAwOyBcCiAgICAgICAgIGZvciAoaTAg
PSAwOyBpMCA8IEVMRU1fU0laRTsgaTArKykgeyBcCiAgICAgICAgICAgICBsb2dfYnl0ZSA9ICgo
dmEgKyBpMCkgPD0gdmFfaGlnaCkgJiYgUVZBTDsgXAotICAgICAgICAgICAgbG9nX2JhbmsgfD0g
KGxvZ19ieXRlIDw8IGkwKTsgXAogICAgICAgICAgICAgTE9HX1ZUQ01fQllURSh2YSArIGkwLCBs
b2dfYnl0ZSwgSU4udWJbRUxFTV9TSVpFICogSURYICsgaTBdLCBcCiAgICAgICAgICAgICAgICAg
ICAgICAgICAgIEVMRU1fU0laRSAqIElEWCArIGkwKTsgXAogICAgICAgICB9IFwKLS0gCjIuMTcu
MQoK

