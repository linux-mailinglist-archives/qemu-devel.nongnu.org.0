Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3831D440F84
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Oct 2021 17:48:58 +0100 (CET)
Received: from localhost ([::1]:56388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhE0v-0001bs-9V
	for lists+qemu-devel@lfdr.de; Sun, 31 Oct 2021 12:48:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1mhDvk-0001VO-6X
 for qemu-devel@nongnu.org; Sun, 31 Oct 2021 12:43:36 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:61927)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1mhDvh-0008B2-9r
 for qemu-devel@nongnu.org; Sun, 31 Oct 2021 12:43:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1635698613; x=1667234613;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0b/oLF3rQXsd/LQkUQuQIJTPCkpErO5fsIT0HvW1WAM=;
 b=pASMLwhdPeSKwj0PRyr2o/x9j8/y/RKCJvJsXjkwAgZvnqmmKIY7Sgqr
 smyQpGOO6Zm1l7+RseLo2c4OCcOpp7rZ+MoN44+iKkTCJmtVzw/XA3iEs
 yaEtaem4yLnXNsZaofjHIVCkRaFyRV6HPH1YIapL6bP6bLaY6K+Eg9WT8 Y=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 31 Oct 2021 09:43:30 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg01-sd.qualcomm.com with ESMTP; 31 Oct 2021 09:43:29 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id 547352657; Sun, 31 Oct 2021 11:43:29 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/30] Hexagon HVX (target/hexagon) instruction attributes
Date: Sun, 31 Oct 2021 11:42:43 -0500
Message-Id: <1635698589-31849-5-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635698589-31849-1-git-send-email-tsimpson@quicinc.com>
References: <1635698589-31849-1-git-send-email-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=199.106.114.39;
 envelope-from=tsimpson@qualcomm.com; helo=alexa-out-sd-02.qualcomm.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: peter.maydell@linaro.org, tsimpson@quicinc.com,
 richard.henderson@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QWNrZWQtYnk6IFJpY2hhcmQgSGVuZGVyc29uIDxyaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3Jn
PgpTaWduZWQtb2ZmLWJ5OiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVpY2luYy5jb20+Ci0t
LQogdGFyZ2V0L2hleGFnb24vYXR0cmlic19kZWYuaC5pbmMgfCAyMiArKysrKysrKysrKysrKysr
KysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3Rh
cmdldC9oZXhhZ29uL2F0dHJpYnNfZGVmLmguaW5jIGIvdGFyZ2V0L2hleGFnb24vYXR0cmlic19k
ZWYuaC5pbmMKaW5kZXggZTQ0YTdlYS4uZGM4OTBhNSAxMDA2NDQKLS0tIGEvdGFyZ2V0L2hleGFn
b24vYXR0cmlic19kZWYuaC5pbmMKKysrIGIvdGFyZ2V0L2hleGFnb24vYXR0cmlic19kZWYuaC5p
bmMKQEAgLTQxLDYgKzQxLDI3IEBAIERFRl9BVFRSSUIoU1RPUkUsICJTdG9yZXMgdG8gbWVtb3J5
IiwgIiIsICIiKQogREVGX0FUVFJJQihNRU1MSUtFLCAiTWVtb3J5LWxpa2UgaW5zdHJ1Y3Rpb24i
LCAiIiwgIiIpCiBERUZfQVRUUklCKE1FTUxJS0VfUEFDS0VUX1JVTEVTLCAiZm9sbG93cyBNZW1v
cnktbGlrZSBwYWNrZXQgcnVsZXMiLCAiIiwgIiIpCiAKKy8qIFY2IFZlY3RvciBhdHRyaWJ1dGVz
ICovCitERUZfQVRUUklCKENWSSwgIkV4ZWN1dGVzIG9uIHRoZSBIVlggZXh0ZW5zaW9uIiwgIiIs
ICIiKQorCitERUZfQVRUUklCKENWSV9ORVcsICJOZXcgdmFsdWUgbWVtb3J5IGluc3RydWN0aW9u
IGV4ZWN1dGVzIG9uIEhWWCIsICIiLCAiIikKK0RFRl9BVFRSSUIoQ1ZJX1ZNLCAiTWVtb3J5IGlu
c3RydWN0aW9uIGV4ZWN1dGVzIG9uIEhWWCIsICIiLCAiIikKK0RFRl9BVFRSSUIoQ1ZJX1ZQLCAi
UGVybXV0ZSBpbnN0cnVjdGlvbiBleGVjdXRlcyBvbiBIVlgiLCAiIiwgIiIpCitERUZfQVRUUklC
KENWSV9WUF9WUywgIkRvdWJsZSB2ZWN0b3IgcGVybXV0ZS9zaGZ0IGluc24gZXhlY3V0ZXMgb24g
SFZYIiwgIiIsICIiKQorREVGX0FUVFJJQihDVklfVlgsICJNdWx0aXBseSBpbnN0cnVjdGlvbiBl
eGVjdXRlcyBvbiBIVlgiLCAiIiwgIiIpCitERUZfQVRUUklCKENWSV9WWF9EViwgIkRvdWJsZSB2
ZWN0b3IgbXVsdGlwbHkgaW5zbiBleGVjdXRlcyBvbiBIVlgiLCAiIiwgIiIpCitERUZfQVRUUklC
KENWSV9WUywgIlNoaWZ0IGluc3RydWN0aW9uIGV4ZWN1dGVzIG9uIEhWWCIsICIiLCAiIikKK0RF
Rl9BVFRSSUIoQ1ZJX1ZTX1ZYLCAiUGVybXV0ZS9zaGlmdCBhbmQgbXVsdGlwbHkgaW5zbiBleGVj
dXRlcyBvbiBIVlgiLCAiIiwgIiIpCitERUZfQVRUUklCKENWSV9WQSwgIkFMVSBpbnN0cnVjdGlv
biBleGVjdXRlcyBvbiBIVlgiLCAiIiwgIiIpCitERUZfQVRUUklCKENWSV9WQV9EViwgIkRvdWJs
ZSB2ZWN0b3IgYWx1IGluc3RydWN0aW9uIGV4ZWN1dGVzIG9uIEhWWCIsICIiLCAiIikKK0RFRl9B
VFRSSUIoQ1ZJXzRTTE9ULCAiQ29uc3VtZXMgYWxsIHRoZSB2ZWN0b3IgZXhlY3V0aW9uIHJlc291
cmNlcyIsICIiLCAiIikKK0RFRl9BVFRSSUIoQ1ZJX1RNUCwgIlRyYW5zaWVudCBNZW1vcnkgTG9h
ZCBub3Qgd3JpdHRlbiB0byByZWdpc3RlciIsICIiLCAiIikKK0RFRl9BVFRSSUIoQ1ZJX0dBVEhF
UiwgIkNWSSBHYXRoZXIgb3BlcmF0aW9uIiwgIiIsICIiKQorREVGX0FUVFJJQihDVklfU0NBVFRF
UiwgIkNWSSBTY2F0dGVyIG9wZXJhdGlvbiIsICIiLCAiIikKK0RFRl9BVFRSSUIoQ1ZJX1NDQVRU
RVJfUkVMRUFTRSwgIkNWSSBTdG9yZSBSZWxlYXNlIGZvciBzY2F0dGVyIiwgIiIsICIiKQorREVG
X0FUVFJJQihDVklfVE1QX0RTVCwgIkNWSSBpbnN0cnVjdGlvbiB0aGF0IGRvZXNuJ3Qgd3JpdGUg
YSByZWdpc3RlciIsICIiLCAiIikKK0RFRl9BVFRSSUIoQ1ZJX1NMT1QyMywgIkNhbiBleGVjdXRl
IGluIHNsb3QgMiBvciBzbG90IDMgKEhWWCkiLCAiIiwgIiIpCisKIAogLyogQ2hhbmdlLW9mLWZs
b3cgYXR0cmlidXRlcyAqLwogREVGX0FUVFJJQihKVU1QLCAiSnVtcC10eXBlIGluc3RydWN0aW9u
IiwgIiIsICIiKQpAQCAtODcsNiArMTA4LDcgQEAgREVGX0FUVFJJQihIV0xPT1AxX0VORCwgIkVu
ZHMgSFcgbG9vcDEiLCAiIiwgIiIpCiBERUZfQVRUUklCKERDWkVST0EsICJkY3plcm9hIHR5cGUi
LCAiIiwgIiIpCiBERUZfQVRUUklCKElDRkxVU0hPUCwgImljZmx1c2ggb3AgdHlwZSIsICIiLCAi
IikKIERFRl9BVFRSSUIoRENGTFVTSE9QLCAiZGNmbHVzaCBvcCB0eXBlIiwgIiIsICIiKQorREVG
X0FUVFJJQihMMkZMVVNIT1AsICJsMmZsdXNoIG9wIHR5cGUiLCAiIiwgIiIpCiBERUZfQVRUUklC
KERDRkVUQ0gsICJkY2ZldGNoIHR5cGUiLCAiIiwgIiIpCiAKIERFRl9BVFRSSUIoTDJGRVRDSCwg
Ikluc3RydWN0aW9uIGlzIGwyZmV0Y2ggdHlwZSIsICIiLCAiIikKLS0gCjIuNy40Cgo=

