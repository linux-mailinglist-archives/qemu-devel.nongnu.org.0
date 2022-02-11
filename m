Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3413B4B2437
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 12:24:09 +0100 (CET)
Received: from localhost ([::1]:42712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIU24-0007hr-3c
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 06:24:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1nITw1-0007PR-F9
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 06:17:53 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:60891)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1nITvv-00017U-9f
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 06:17:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1644578267; x=1676114267;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=b8IZazst8zvUoSaocBQDHczZUnZM+iJX86HwuC5v93A=;
 b=yaQeo9PxlEhA+AG+6rz0V/DezHPrfiyLE/BRPUBYfYa7Yr6Nx2GjvuSi
 RzEYiDuBj6Iq5xluYjKmDMfcjJ/IrfEvrgXOHQgFy0WYmMEXLf8+0XPP/
 P14/Ewf46Q0YvXfhahTnrSQuH5+Xj+4wsUVrB5SLl7BdSORncJxjD4Ixx s=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 11 Feb 2022 03:17:25 -0800
X-QCInternal: smtphost
Received: from hu-tsimpson-lv.qualcomm.com (HELO
 hu-devc-lv-u18-c.qualcomm.com) ([10.47.235.220])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP; 11 Feb 2022 03:17:24 -0800
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id A8CE35005A1; Fri, 11 Feb 2022 03:17:24 -0800 (PST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/12] Hexagon (target/hexagon) convert to OBJECT_DECLARE_TYPE
Date: Fri, 11 Feb 2022 03:17:21 -0800
Message-Id: <20220211111722.31036-12-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220211111722.31036-1-tsimpson@quicinc.com>
References: <20220211111722.31036-1-tsimpson@quicinc.com>
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

U3VnZ2VzdGVkLWJ5OiBSaWNoYXJkIEhlbmRlcnNvbiA8cmljaGFyZC5oZW5kZXJzb25AbGluYXJv
Lm9yZz4KU2lnbmVkLW9mZi1ieTogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29t
PgpNZXNzYWdlLUlkOiA8MjAyMjAyMTEwMzMwMzQuMjExMDctMS10c2ltcHNvbkBxdWljaW5jLmNv
bT4KUmV2aWV3ZWQtYnk6IFJpY2hhcmQgSGVuZGVyc29uIDxyaWNoYXJkLmhlbmRlcnNvbkBsaW5h
cm8ub3JnPgotLS0KIHRhcmdldC9oZXhhZ29uL2NwdS5oIHwgOSArKy0tLS0tLS0KIDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdGFy
Z2V0L2hleGFnb24vY3B1LmggYi90YXJnZXQvaGV4YWdvbi9jcHUuaAppbmRleCA1OGEwZDM4NzBi
Li5lM2VmYmIyMzAzIDEwMDY0NAotLS0gYS90YXJnZXQvaGV4YWdvbi9jcHUuaAorKysgYi90YXJn
ZXQvaGV4YWdvbi9jcHUuaApAQCAtMSw1ICsxLDUgQEAKIC8qCi0gKiAgQ29weXJpZ2h0KGMpIDIw
MTktMjAyMSBRdWFsY29tbSBJbm5vdmF0aW9uIENlbnRlciwgSW5jLiBBbGwgUmlnaHRzIFJlc2Vy
dmVkLgorICogIENvcHlyaWdodChjKSAyMDE5LTIwMjIgUXVhbGNvbW0gSW5ub3ZhdGlvbiBDZW50
ZXIsIEluYy4gQWxsIFJpZ2h0cyBSZXNlcnZlZC4KICAqCiAgKiAgVGhpcyBwcm9ncmFtIGlzIGZy
ZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vciBtb2RpZnkKICAqICBp
dCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFzIHB1
Ymxpc2hlZCBieQpAQCAtMTMxLDEyICsxMzEsNyBAQCBzdHJ1Y3QgQ1BVSGV4YWdvblN0YXRlIHsK
ICAgICBWVENNU3RvcmVMb2cgdnRjbV9sb2c7CiB9OwogCi0jZGVmaW5lIEhFWEFHT05fQ1BVX0NM
QVNTKGtsYXNzKSBcCi0gICAgT0JKRUNUX0NMQVNTX0NIRUNLKEhleGFnb25DUFVDbGFzcywgKGts
YXNzKSwgVFlQRV9IRVhBR09OX0NQVSkKLSNkZWZpbmUgSEVYQUdPTl9DUFUob2JqKSBcCi0gICAg
T0JKRUNUX0NIRUNLKEhleGFnb25DUFUsIChvYmopLCBUWVBFX0hFWEFHT05fQ1BVKQotI2RlZmlu
ZSBIRVhBR09OX0NQVV9HRVRfQ0xBU1Mob2JqKSBcCi0gICAgT0JKRUNUX0dFVF9DTEFTUyhIZXhh
Z29uQ1BVQ2xhc3MsIChvYmopLCBUWVBFX0hFWEFHT05fQ1BVKQorT0JKRUNUX0RFQ0xBUkVfVFlQ
RShIZXhhZ29uQ1BVLCBIZXhhZ29uQ1BVQ2xhc3MsIEhFWEFHT05fQ1BVKQogCiB0eXBlZGVmIHN0
cnVjdCBIZXhhZ29uQ1BVQ2xhc3MgewogICAgIC8qPCBwcml2YXRlID4qLwotLSAKMi4xNy4xCgo=

