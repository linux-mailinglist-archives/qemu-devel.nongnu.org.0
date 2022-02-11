Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6B04B242E
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 12:21:35 +0100 (CET)
Received: from localhost ([::1]:34026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nITza-0001sF-5V
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 06:21:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1nITvx-0007OQ-NY
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 06:17:50 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:11021)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1nITvs-00015m-15
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 06:17:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1644578264; x=1676114264;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=npPzdry6WJimJkfyL+daXIoJ7iKkVnFctPYsD+j94bk=;
 b=GeRyBKFaqBcfw9ykNQwbn4Kaz4S3OKvoqR7tYzinYNyeOuslet1WlQiO
 APhucauEMg8QQY8nttMm4a29+A6tHbWLRJu98eTrcLNqYH8PjPqx6A/1/
 5k21PxCbvyYL4hDDH+AMZCmxNCU/x4aAKFltLz4IJYNP1vYRmvFcQl28B A=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 11 Feb 2022 03:17:25 -0800
X-QCInternal: smtphost
Received: from hu-tsimpson-lv.qualcomm.com (HELO
 hu-devc-lv-u18-c.qualcomm.com) ([10.47.235.220])
 by ironmsg09-lv.qualcomm.com with ESMTP; 11 Feb 2022 03:17:24 -0800
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id AB52C50059D; Fri, 11 Feb 2022 03:17:24 -0800 (PST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/12] target/hexagon: remove unused variable
Date: Fri, 11 Feb 2022 03:17:22 -0800
Message-Id: <20220211111722.31036-13-tsimpson@quicinc.com>
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
cXVpY2luYy5jb20+Ci0tLQogdGFyZ2V0L2hleGFnb24vbW12ZWMvbWFjcm9zLmggfCA0IC0tLS0K
IDEgZmlsZSBjaGFuZ2VkLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhh
Z29uL21tdmVjL21hY3Jvcy5oIGIvdGFyZ2V0L2hleGFnb24vbW12ZWMvbWFjcm9zLmgKaW5kZXgg
MTBmNDYzMDM2NC4uNDQ3ODFjZmI0YSAxMDA2NDQKLS0tIGEvdGFyZ2V0L2hleGFnb24vbW12ZWMv
bWFjcm9zLmgKKysrIGIvdGFyZ2V0L2hleGFnb24vbW12ZWMvbWFjcm9zLmgKQEAgLTE2NCwxMSAr
MTY0LDkgQEAKICAgICAgICAgdGFyZ2V0X3Vsb25nIHZhID0gRUE7IFwKICAgICAgICAgdGFyZ2V0
X3Vsb25nIHZhX2hpZ2ggPSBFQSArIExFTjsgXAogICAgICAgICB1aW50cHRyX3QgcmEgPSBHRVRQ
QygpOyBcCi0gICAgICAgIGludCBsb2dfYmFuayA9IDA7IFwKICAgICAgICAgaW50IGxvZ19ieXRl
ID0gMDsgXAogICAgICAgICBmb3IgKGkwID0gMDsgaTAgPCBFTEVNRU5UX1NJWkU7IGkwKyspIHsg
XAogICAgICAgICAgICAgbG9nX2J5dGUgPSAoKHZhICsgaTApIDw9IHZhX2hpZ2gpICYmIFFWQUw7
IFwKLSAgICAgICAgICAgIGxvZ19iYW5rIHw9IChsb2dfYnl0ZSA8PCBpMCk7IFwKICAgICAgICAg
ICAgIHVpbnQ4X3QgQjsgXAogICAgICAgICAgICAgQiA9IGNwdV9sZHViX2RhdGFfcmEoZW52LCBF
QSArIGkwLCByYSk7IFwKICAgICAgICAgICAgIGVudi0+dG1wX1ZSZWdzWzBdLnViW0VMRU1FTlRf
U0laRSAqIElEWCArIGkwXSA9IEI7IFwKQEAgLTI0MywxMSArMjQxLDkgQEAKICAgICAgICAgaW50
IGkwOyBcCiAgICAgICAgIHRhcmdldF91bG9uZyB2YSA9IEVBOyBcCiAgICAgICAgIHRhcmdldF91
bG9uZyB2YV9oaWdoID0gRUEgKyBMRU47IFwKLSAgICAgICAgaW50IGxvZ19iYW5rID0gMDsgXAog
ICAgICAgICBpbnQgbG9nX2J5dGUgPSAwOyBcCiAgICAgICAgIGZvciAoaTAgPSAwOyBpMCA8IEVM
RU1fU0laRTsgaTArKykgeyBcCiAgICAgICAgICAgICBsb2dfYnl0ZSA9ICgodmEgKyBpMCkgPD0g
dmFfaGlnaCkgJiYgUVZBTDsgXAotICAgICAgICAgICAgbG9nX2JhbmsgfD0gKGxvZ19ieXRlIDw8
IGkwKTsgXAogICAgICAgICAgICAgTE9HX1ZUQ01fQllURSh2YSArIGkwLCBsb2dfYnl0ZSwgSU4u
dWJbRUxFTV9TSVpFICogSURYICsgaTBdLCBcCiAgICAgICAgICAgICAgICAgICAgICAgICAgIEVM
RU1fU0laRSAqIElEWCArIGkwKTsgXAogICAgICAgICB9IFwKLS0gCjIuMTcuMQoK

