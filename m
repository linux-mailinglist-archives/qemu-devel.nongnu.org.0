Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 161074B1CF6
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 04:32:31 +0100 (CET)
Received: from localhost ([::1]:57588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIMfd-0000oI-Nl
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 22:32:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1nIMdw-0008Qz-5f
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 22:30:44 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:43819)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1nIMdt-0000K9-Tf
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 22:30:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1644550242; x=1676086242;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aglzCQAllTtYT1KBWznnI4qmsENKqBT/HTV75/c5yW4=;
 b=PH8u2Bu2bpDTtfwIy5JBauEyZiEEKJ6e093FkNvqq0sMiQ8M4/4ZIYvg
 Y433ooKipFCoTvU6nsQeoc3JgSNV8sKYSUSyMZjnZWTcp2aZkeH+/mu4Y
 R15LwPjF5NbfDK2y4pxnYWx4EQPE+4fJSjS+H0s1RzirlHSr2BLm+Z5Zf E=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 10 Feb 2022 19:30:37 -0800
X-QCInternal: smtphost
Received: from hu-tsimpson-lv.qualcomm.com (HELO
 hu-devc-lv-u18-c.qualcomm.com) ([10.47.235.220])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP; 10 Feb 2022 19:30:36 -0800
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id 97CC9500583; Thu, 10 Feb 2022 19:30:36 -0800 (PST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] Hexagon (target/hexagon) convert to OBJECT_DECLARE_TYPE
Date: Thu, 10 Feb 2022 19:30:34 -0800
Message-Id: <20220211033034.21107-1-tsimpson@quicinc.com>
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
Cc: ale@rev.ng, bcain@quicinc.com, richard.henderson@linaro.org,
 f4bug@amsat.org, tsimpson@quicinc.com, mlambert@quicinc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

U3VnZ2VzdGVkLWJ5OiBSaWNoYXJkIEhlbmRlcnNvbiA8cmljaGFyZC5oZW5kZXJzb25AbGluYXJv
Lm9yZz4KU2lnbmVkLW9mZi1ieTogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29t
PgotLS0KIHRhcmdldC9oZXhhZ29uL2NwdS5oIHwgOSArKy0tLS0tLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdGFyZ2V0L2hl
eGFnb24vY3B1LmggYi90YXJnZXQvaGV4YWdvbi9jcHUuaAppbmRleCA1OGEwZDM4NzBiLi5lM2Vm
YmIyMzAzIDEwMDY0NAotLS0gYS90YXJnZXQvaGV4YWdvbi9jcHUuaAorKysgYi90YXJnZXQvaGV4
YWdvbi9jcHUuaApAQCAtMSw1ICsxLDUgQEAKIC8qCi0gKiAgQ29weXJpZ2h0KGMpIDIwMTktMjAy
MSBRdWFsY29tbSBJbm5vdmF0aW9uIENlbnRlciwgSW5jLiBBbGwgUmlnaHRzIFJlc2VydmVkLgor
ICogIENvcHlyaWdodChjKSAyMDE5LTIwMjIgUXVhbGNvbW0gSW5ub3ZhdGlvbiBDZW50ZXIsIElu
Yy4gQWxsIFJpZ2h0cyBSZXNlcnZlZC4KICAqCiAgKiAgVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29m
dHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vciBtb2RpZnkKICAqICBpdCB1bmRl
ciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFzIHB1Ymxpc2hl
ZCBieQpAQCAtMTMxLDEyICsxMzEsNyBAQCBzdHJ1Y3QgQ1BVSGV4YWdvblN0YXRlIHsKICAgICBW
VENNU3RvcmVMb2cgdnRjbV9sb2c7CiB9OwogCi0jZGVmaW5lIEhFWEFHT05fQ1BVX0NMQVNTKGts
YXNzKSBcCi0gICAgT0JKRUNUX0NMQVNTX0NIRUNLKEhleGFnb25DUFVDbGFzcywgKGtsYXNzKSwg
VFlQRV9IRVhBR09OX0NQVSkKLSNkZWZpbmUgSEVYQUdPTl9DUFUob2JqKSBcCi0gICAgT0JKRUNU
X0NIRUNLKEhleGFnb25DUFUsIChvYmopLCBUWVBFX0hFWEFHT05fQ1BVKQotI2RlZmluZSBIRVhB
R09OX0NQVV9HRVRfQ0xBU1Mob2JqKSBcCi0gICAgT0JKRUNUX0dFVF9DTEFTUyhIZXhhZ29uQ1BV
Q2xhc3MsIChvYmopLCBUWVBFX0hFWEFHT05fQ1BVKQorT0JKRUNUX0RFQ0xBUkVfVFlQRShIZXhh
Z29uQ1BVLCBIZXhhZ29uQ1BVQ2xhc3MsIEhFWEFHT05fQ1BVKQogCiB0eXBlZGVmIHN0cnVjdCBI
ZXhhZ29uQ1BVQ2xhc3MgewogICAgIC8qPCBwcml2YXRlID4qLwotLSAKMi4xNy4xCgo=

