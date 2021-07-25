Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3693D503A
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Jul 2021 23:45:32 +0200 (CEST)
Received: from localhost ([::1]:60814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7lwC-0005E2-26
	for lists+qemu-devel@lfdr.de; Sun, 25 Jul 2021 17:45:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1m7ltl-0001ki-Pn
 for qemu-devel@nongnu.org; Sun, 25 Jul 2021 17:43:01 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:3744)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1m7ltk-0005XQ-5J
 for qemu-devel@nongnu.org; Sun, 25 Jul 2021 17:43:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1627249380; x=1658785380;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ce/ncbFel0kDoOofyeNEWzeZGTOA4D5+bW1/RX/ZavM=;
 b=fG8idIivMzTLKsQa7PcK9aZZVpOrK3z8w4Fh0Qidmzyf9UrV4qkOfUvA
 n8ggsfIBtQr01t7U+AqEc2vaXACYiA263rF1gQXgj/TPh3O88JwPXdxoy
 x0YHNqIHHmgVJOs53q4VUbV+HuksbX/bAJKx8/HUJTzUs70g+It67oCRM c=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 25 Jul 2021 14:42:53 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg02-sd.qualcomm.com with ESMTP; 25 Jul 2021 14:42:53 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id B14E01223; Sun, 25 Jul 2021 16:42:52 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 2/2] target/hexagon: Drop include of qemu.h
Date: Sun, 25 Jul 2021 16:42:48 -0500
Message-Id: <1627249368-8366-3-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1627249368-8366-1-git-send-email-tsimpson@quicinc.com>
References: <1627249368-8366-1-git-send-email-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=199.106.114.39;
 envelope-from=tsimpson@qualcomm.com; helo=alexa-out-sd-02.qualcomm.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: ale@rev.ng, peter.maydell@linaro.org, bcain@quicinc.com,
 richard.henderson@linaro.org, tsimpson@quicinc.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogUGV0ZXIgTWF5ZGVsbCA8cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnPgoKVGhlIHFlbXUu
aCBmaWxlIGlzIGEgQ09ORklHX1VTRVJfT05MWSBoZWFkZXI7IGl0IGRvZXNuJ3QgYXBwZWFyIG9u
CnRoZSBpbmNsdWRlIHBhdGggZm9yIHNvZnRtbXUgYnVpbGRzLiAgQ3VycmVudGx5IHdlIGluY2x1
ZGUgaXQKdW5jb25kaXRpb25hbGx5IGluIHRhcmdldC9oZXhhZ29uL29wX2hlbHBlci5jLiAgV2Ug
dXNlZCB0byBuZWVkIGl0CmZvciB0aGUgcHV0X3VzZXJfKigpIGFuZCBnZXRfdXNlcl8qKCkgZnVu
Y3Rpb25zLCBidXQgbm93IHRoYXQgd2UgaGF2ZQpyZW1vdmVkIHRoZSB1c2VzIG9mIHRob3NlIGZy
b20gb3BfaGVscGVyLmMsIHRoZSBvbmx5IHJlYXNvbiBpdCdzCnN0aWxsIHRoZXJlIGlzIHRoYXQg
d2UncmUgaW1wbGljaXRseSByZWx5aW5nIG9uIGl0IHB1bGxpbmcgaW4gc29tZQpvdGhlciBoZWFk
ZXJzLgoKRXhwbGljaXRseSBpbmNsdWRlIHRoZSBoZWFkZXJzIHdlIG5lZWQgZm9yIG90aGVyIGZ1
bmN0aW9ucywgYW5kIGRyb3AKdGhlIGluY2x1ZGUgb2YgcWVtdS5oLgoKU2lnbmVkLW9mZi1ieTog
UGV0ZXIgTWF5ZGVsbCA8cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnPgpNZXNzYWdlLUlkOiA8MjAy
MTA3MTcxMDMwMTcuMjA0OTEtMS1wZXRlci5tYXlkZWxsQGxpbmFyby5vcmc+ClJldmlld2VkLWJ5
OiBBbGV4IEJlbm7DqWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+ClJldmlld2VkLWJ5OiBSaWNo
YXJkIEhlbmRlcnNvbiA8cmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZz4KUmV2aWV3ZWQtYnk6
IFRheWxvciBTaW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNvbT4KU2lnbmVkLW9mZi1ieTogVGF5
bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29tPgotLS0KIHRhcmdldC9oZXhhZ29uL29w
X2hlbHBlci5jIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkKCmRpZmYgLS1naXQgYS90YXJnZXQvaGV4YWdvbi9vcF9oZWxwZXIuYyBiL3Rhcmdl
dC9oZXhhZ29uL29wX2hlbHBlci5jCmluZGV4IGE5NTlkYmEuLjYxZDVjZGUgMTAwNjQ0Ci0tLSBh
L3RhcmdldC9oZXhhZ29uL29wX2hlbHBlci5jCisrKyBiL3RhcmdldC9oZXhhZ29uL29wX2hlbHBl
ci5jCkBAIC0xNiw3ICsxNiw4IEBACiAgKi8KIAogI2luY2x1ZGUgInFlbXUvb3NkZXAuaCIKLSNp
bmNsdWRlICJxZW11LmgiCisjaW5jbHVkZSAicWVtdS9sb2cuaCIKKyNpbmNsdWRlICJleGVjL2V4
ZWMtYWxsLmgiCiAjaW5jbHVkZSAiZXhlYy9jcHVfbGRzdC5oIgogI2luY2x1ZGUgImV4ZWMvaGVs
cGVyLXByb3RvLmgiCiAjaW5jbHVkZSAiZnB1L3NvZnRmbG9hdC5oIgotLSAKMi43LjQKCg==

