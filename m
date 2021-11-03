Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB372444A4A
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 22:33:34 +0100 (CET)
Received: from localhost ([::1]:58124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miNt0-0000iv-0n
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 17:33:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1miNde-0002tU-RS
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 17:17:42 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:11448)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1miNdd-0007DJ-1y
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 17:17:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1635974261; x=1667510261;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sqiAMH7Fc3zVq4Equlk83XPF2CB+qIpBPbdFDzaXyNY=;
 b=SqjNAd4n+KTFC6DCbFu9D0SzBeXrWNjrs6vI8ISCDp7tOyVeSAA5RTCr
 ZNALY04jyAO91Qx5t8v1kEp98RuFEFETpPAoMZBQ17exwxwx6wqrjtIaR
 DKh0ahqMewKhyHsn9E8qdKQ4PXiHm1hKNasaQltx2DPkpmerohVfXk+xk 8=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 03 Nov 2021 14:17:30 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg02-sd.qualcomm.com with ESMTP; 03 Nov 2021 14:17:30 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id D56EA322B; Wed,  3 Nov 2021 16:17:28 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 27/30] Hexagon HVX (tests/tcg/hexagon) vector_add_int test
Date: Wed,  3 Nov 2021 16:17:24 -0500
Message-Id: <1635974247-1820-28-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635974247-1820-1-git-send-email-tsimpson@quicinc.com>
References: <1635974247-1820-1-git-send-email-tsimpson@quicinc.com>
MIME-Version: 1.0
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
 richard.henderson@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UmV2aWV3ZWQtYnk6IFJpY2hhcmQgSGVuZGVyc29uIDxyaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8u
b3JnPgpTaWduZWQtb2ZmLWJ5OiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVpY2luYy5jb20+
Ci0tLQogdGVzdHMvdGNnL2hleGFnb24vdmVjdG9yX2FkZF9pbnQuYyB8IDYxICsrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNjEgaW5zZXJ0aW9u
cygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHRlc3RzL3RjZy9oZXhhZ29uL3ZlY3Rvcl9hZGRfaW50
LmMKCmRpZmYgLS1naXQgYS90ZXN0cy90Y2cvaGV4YWdvbi92ZWN0b3JfYWRkX2ludC5jIGIvdGVz
dHMvdGNnL2hleGFnb24vdmVjdG9yX2FkZF9pbnQuYwpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRl
eCAwMDAwMDAwLi5kNjAxMGVhCi0tLSAvZGV2L251bGwKKysrIGIvdGVzdHMvdGNnL2hleGFnb24v
dmVjdG9yX2FkZF9pbnQuYwpAQCAtMCwwICsxLDYxIEBACisvKgorICogIENvcHlyaWdodChjKSAy
MDE5LTIwMjEgUXVhbGNvbW0gSW5ub3ZhdGlvbiBDZW50ZXIsIEluYy4gQWxsIFJpZ2h0cyBSZXNl
cnZlZC4KKyAqCisgKiAgVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVk
aXN0cmlidXRlIGl0IGFuZC9vciBtb2RpZnkKKyAqICBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhl
IEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFzIHB1Ymxpc2hlZCBieQorICogIHRoZSBGcmVl
IFNvZnR3YXJlIEZvdW5kYXRpb247IGVpdGhlciB2ZXJzaW9uIDIgb2YgdGhlIExpY2Vuc2UsIG9y
CisgKiAgKGF0IHlvdXIgb3B0aW9uKSBhbnkgbGF0ZXIgdmVyc2lvbi4KKyAqCisgKiAgVGhpcyBw
cm9ncmFtIGlzIGRpc3RyaWJ1dGVkIGluIHRoZSBob3BlIHRoYXQgaXQgd2lsbCBiZSB1c2VmdWws
CisgKiAgYnV0IFdJVEhPVVQgQU5ZIFdBUlJBTlRZOyB3aXRob3V0IGV2ZW4gdGhlIGltcGxpZWQg
d2FycmFudHkgb2YKKyAqICBNRVJDSEFOVEFCSUxJVFkgb3IgRklUTkVTUyBGT1IgQSBQQVJUSUNV
TEFSIFBVUlBPU0UuICBTZWUgdGhlCisgKiAgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgZm9y
IG1vcmUgZGV0YWlscy4KKyAqCisgKiAgWW91IHNob3VsZCBoYXZlIHJlY2VpdmVkIGEgY29weSBv
ZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UKKyAqICBhbG9uZyB3aXRoIHRoaXMgcHJv
Z3JhbTsgaWYgbm90LCBzZWUgPGh0dHA6Ly93d3cuZ251Lm9yZy9saWNlbnNlcy8+LgorICovCisK
KyNpbmNsdWRlIDxzdGRpby5oPgorCitpbnQgZ0FbNDAxXTsKK2ludCBnQls0MDFdOworaW50IGdD
WzQwMV07CisKK3ZvaWQgdmVjdG9yX2FkZF9pbnQoKQoreworICBpbnQgaTsKKyAgZm9yIChpID0g
MDsgaSA8IDQwMDsgaSsrKSB7CisgICAgZ0FbaV0gPSBnQltpXSArIGdDW2ldOworICB9Cit9CisK
K2ludCBtYWluKCkKK3sKKyAgaW50IGVycm9yID0gMDsKKyAgaW50IGk7CisgIGZvciAoaSA9IDA7
IGkgPCA0MDA7IGkrKykgeworICAgIGdCW2ldID0gaSAqIDI7CisgICAgZ0NbaV0gPSBpICogMzsK
KyAgfQorICBnQVs0MDBdID0gMTc7CisgIHZlY3Rvcl9hZGRfaW50KCk7CisgIGZvciAoaSA9IDA7
IGkgPCA0MDA7IGkrKykgeworICAgIGlmIChnQVtpXSAhPSBpICogNSkgeworICAgICAgICBlcnJv
cisrOworICAgICAgICBwcmludGYoIkVSUk9SOiBnQlslZF0gPSAlZFx0IiwgaSwgZ0JbaV0pOwor
ICAgICAgICBwcmludGYoImdDWyVkXSA9ICVkXHQiLCBpLCBnQ1tpXSk7CisgICAgICAgIHByaW50
ZigiZ0FbJWRdID0gJWRcbiIsIGksIGdBW2ldKTsKKyAgICB9CisgIH0KKyAgaWYgKGdBWzQwMF0g
IT0gMTcpIHsKKyAgICBlcnJvcisrOworICAgIHByaW50ZigiRVJST1I6IE92ZXJyYW4gdGhlIGJ1
ZmZlclxuIik7CisgIH0KKyAgaWYgKCFlcnJvcikgeworICAgIHByaW50ZigiUEFTU1xuIik7Cisg
ICAgcmV0dXJuIDA7CisgIH0gZWxzZSB7CisgICAgcHJpbnRmKCJGQUlMXG4iKTsKKyAgICByZXR1
cm4gMTsKKyAgfQorfQotLSAKMi43LjQKCg==

