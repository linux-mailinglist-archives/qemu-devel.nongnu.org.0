Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2365352068D
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 23:16:17 +0200 (CEST)
Received: from localhost ([::1]:60458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noAjo-0007yh-78
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 17:16:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1noAhr-0005qN-R3
 for qemu-devel@nongnu.org; Mon, 09 May 2022 17:14:15 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:63599)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1noAhp-0007R9-9G
 for qemu-devel@nongnu.org; Mon, 09 May 2022 17:14:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1652130853; x=1683666853;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UY8zn9qJfKtwpr+Wo2pZQgh9Yev07SybBZIQokl1zuY=;
 b=Iz4XKp2c8HT6y8fZ58RyDeiuR2pluBk/20FAeyzQj8kZ3j6CD4DKKma/
 1e4mWDifDaDNVay83wnYYyIvNQ1RXRuv+9eRH6tJf8UT6T6y4+rApn6Z6
 e8UUib+P64Eiaj+UEKDOdQwM7U4Os/vpAZlHNfMPuqXxn9kJyWPatxEmV A=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 09 May 2022 14:14:12 -0700
X-QCInternal: smtphost
Received: from hu-tsimpson-lv.qualcomm.com (HELO
 hu-devc-lv-u18-c.qualcomm.com) ([10.47.235.220])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP; 09 May 2022 14:14:09 -0700
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id 100075005B9; Mon,  9 May 2022 14:14:09 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, f4bug@amsat.org,
 ale@rev.ng, bcain@quicinc.com, mlambert@quicinc.com
Subject: [PATCH] Hexagon (target/hexagon) remove unused encodings
Date: Mon,  9 May 2022 14:14:03 -0700
Message-Id: <20220509211405.18581-4-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220509211405.18581-1-tsimpson@quicinc.com>
References: <20220509211405.18581-1-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=129.46.98.28; envelope-from=tsimpson@qualcomm.com;
 helo=alexa-out.qualcomm.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UmVtb3ZlIGVuY29kaW5ncyBndWFyZGVkIGJ5IGlmZGVmIHRoYXQgaXMgbm90IGRlZmluZWQKClNp
Z25lZC1vZmYtYnk6IFRheWxvciBTaW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNvbT4KLS0tCiB0
YXJnZXQvaGV4YWdvbi9pbXBvcnRlZC9lbmNvZGVfcHAuZGVmIHwgMjMgLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90
YXJnZXQvaGV4YWdvbi9pbXBvcnRlZC9lbmNvZGVfcHAuZGVmIGIvdGFyZ2V0L2hleGFnb24vaW1w
b3J0ZWQvZW5jb2RlX3BwLmRlZgppbmRleCA5MzljNmZjNTVmLi5kNzFjMDRjZDMwIDEwMDY0NAot
LS0gYS90YXJnZXQvaGV4YWdvbi9pbXBvcnRlZC9lbmNvZGVfcHAuZGVmCisrKyBiL3RhcmdldC9o
ZXhhZ29uL2ltcG9ydGVkL2VuY29kZV9wcC5kZWYKQEAgLTk0NCwxMyArOTQ0LDYgQEAgTVBZX0VO
QyhGMl9kZm1weWZpeCwgICAgICAgICAiMTAwMCIsImRkZGRkIiwiMCIsIjAiLCIxIiwiMCIsIjEx
IikKIE1QWV9FTkMoRjJfZGZtaW4sICAgICAgICAgICAgIjEwMDAiLCJkZGRkZCIsIjAiLCIwIiwi
MSIsIjEiLCIxMSIpCiBNUFlfRU5DKEYyX2RmbWF4LCAgICAgICAgICAgICIxMDAwIiwiZGRkZGQi
LCIwIiwiMSIsIjAiLCIwIiwiMTEiKQogTVBZX0VOQyhGMl9kZm1weWxsLCAgICAgICAgICAiMTAw
MCIsImRkZGRkIiwiMCIsIjEiLCIwIiwiMSIsIjExIikKLSNpZmRlZiBBRERfRFBfT1BTCi1NUFlf
RU5DKEYyX2RmZGl2Y2hlYXQsICAgICAgICIxMDAwIiwiZGRkZGQiLCIwIiwiMCIsIjAiLCIxIiwi
MDAiKQotCi1NUFlfRU5DKEYyX2RmZml4dXBuLCAgICAgICAgICIxMDAwIiwiZGRkZGQiLCIwIiwi
MSIsIjAiLCIxIiwiMTEiKQotTVBZX0VOQyhGMl9kZmZpeHVwZCwgICAgICAgICAiMTAwMCIsImRk
ZGRkIiwiMCIsIjEiLCIxIiwiMCIsIjExIikKLU1QWV9FTkMoRjJfZGZyZWNpcGEsICAgICAgICAg
IjEwMDAiLCJkZGRkZCIsIjAiLCIxIiwiMSIsIjEiLCJlZSIpCi0jZW5kaWYKIAogTVBZX0VOQyhN
N19kY21weXJ3LCAgICAgICAgICAiMTAwMCIsImRkZGRkIiwiMCIsIjAiLCIwIiwiMSIsIjEwIikK
IE1QWV9FTkMoTTdfZGNtcHlyd2MsICAgICAgICAgIjEwMDAiLCJkZGRkZCIsIjAiLCIwIiwiMSIs
IjEiLCIxMCIpCkBAIC0xMDI0LDE1ICsxMDE3LDYgQEAgTVBZX0VOQyhNNV92ZG1hY2JzdSwgICAg
ICAgICAiMTAxMCIsInh4eHh4IiwiMCIsIjEiLCIwIiwiMCIsIjAxIikKIAogTVBZX0VOQyhGMl9k
Zm1weWxoLCAgICAgICAgICAiMTAxMCIsInh4eHh4IiwiMCIsIjAiLCIwIiwiMCIsIjExIikKIE1Q
WV9FTkMoRjJfZGZtcHloaCwgICAgICAgICAgIjEwMTAiLCJ4eHh4eCIsIjAiLCIwIiwiMCIsIjEi
LCIxMSIpCi0jaWZkZWYgQUREX0RQX09QUwotTVBZX0VOQyhGMl9kZm1weWhoLCAgICAgICAgICAi
MTAxMCIsInh4eHh4IiwiMCIsIjAiLCIxIiwiMCIsIjExIikKLU1QWV9FTkMoRjJfZGZmbWEsICAg
ICAgICAgICAgIjEwMTAiLCJ4eHh4eCIsIjAiLCIwIiwiMCIsIjAiLCIxMSIpCi1NUFlfRU5DKEYy
X2RmZm1zLCAgICAgICAgICAgICIxMDEwIiwieHh4eHgiLCIwIiwiMCIsIjAiLCIxIiwiMTEiKQot
Ci1NUFlfRU5DKEYyX2RmZm1hX2xpYiwgICAgICAgICIxMDEwIiwieHh4eHgiLCIwIiwiMCIsIjEi
LCIwIiwiMTEiKQotTVBZX0VOQyhGMl9kZmZtc19saWIsICAgICAgICAiMTAxMCIsInh4eHh4Iiwi
MCIsIjAiLCIxIiwiMSIsIjExIikKLU1QWV9FTkMoRjJfZGZmbWFfc2MsICAgICAgICAgIjEwMTAi
LCJ4eHh4eCIsIjAiLCIxIiwiMSIsIjEiLCJ1dSIpCi0jZW5kaWYKIAogCiBNUFlfRU5DKE03X2Rj
bXB5cndfYWNjLCAgICAgICIxMDEwIiwieHh4eHgiLCIwIiwiMCIsIjAiLCIxIiwiMTAiKQpAQCAt
MTU0NywxNSArMTUzMSw4IEBAIFNIMl9SUl9FTkMoRjJfY29udl9kZjJkLCAgICAgICIwMDAwIiwi
MTExIiwiMCIsIjAgMDAiLCJkZGRkZCIpCiBTSDJfUlJfRU5DKEYyX2NvbnZfZGYydWQsICAgICAi
MDAwMCIsIjExMSIsIjAiLCIwIDAxIiwiZGRkZGQiKQogU0gyX1JSX0VOQyhGMl9jb252X3VkMmRm
LCAgICAgIjAwMDAiLCIxMTEiLCIwIiwiMCAxMCIsImRkZGRkIikKIFNIMl9SUl9FTkMoRjJfY29u
dl9kMmRmLCAgICAgICIwMDAwIiwiMTExIiwiMCIsIjAgMTEiLCJkZGRkZCIpCi0jaWZkZWYgQURE
X0RQX09QUwotU0gyX1JSX0VOQyhGMl9kZmZpeHVwciwgICAgICAgIjAwMDAiLCIxMTEiLCIwIiwi
MSAwMCIsImRkZGRkIikKLVNIMl9SUl9FTkMoRjJfZGZzcXJ0Y2hlYXQsICAgICIwMDAwIiwiMTEx
IiwiMCIsIjEgMDEiLCJkZGRkZCIpCi0jZW5kaWYKIFNIMl9SUl9FTkMoRjJfY29udl9kZjJkX2No
b3AsICIwMDAwIiwiMTExIiwiMCIsIjEgMTAiLCJkZGRkZCIpCiBTSDJfUlJfRU5DKEYyX2NvbnZf
ZGYydWRfY2hvcCwiMDAwMCIsIjExMSIsIjAiLCIxIDExIiwiZGRkZGQiKQotI2lmZGVmIEFERF9E
UF9PUFMKLVNIMl9SUl9FTkMoRjJfZGZpbnZzcXJ0YSwgICAgICIwMDAwIiwiMTExIiwiMSIsIjAg
ZWUiLCJkZGRkZCIpCi0jZW5kaWYKIAogCiAKLS0gCjIuMTcuMQoK

