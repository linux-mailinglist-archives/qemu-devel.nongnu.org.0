Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0D3658DC6
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Dec 2022 15:10:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAtaR-0006Lg-JC; Thu, 29 Dec 2022 09:08:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scalingtree@proton.me>)
 id 1pAqSZ-0003Nu-HT
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 05:48:31 -0500
Received: from mail-4324.protonmail.ch ([185.70.43.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scalingtree@proton.me>)
 id 1pAqSV-0001Sb-Jy
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 05:48:26 -0500
Date: Thu, 29 Dec 2022 10:47:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
 s=cp5a74xmsvbxben3zprofw27tq.protonmail; t=1672310892; x=1672570092;
 bh=npdBhTrvMOFqzkHU2GPm+W3G+DvAvgpLmNOpFvCgJgQ=;
 h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=OOE3cAgTWrfyyz/AGA3gWheiZCG+jUHbsbhnI1b49rlxAksXoUZSU5OaVZavkaHsY
 g6q5zVmd/XfFNxeTp6IKDm/hwtLzSls/hRYINQGtPBKFJTI3+kYzdhQP4JBcZIEdyA
 C8WXA41gMxZZsHR+xmly6NQoP923z0T3QWiPtIHZjntXzZWRxSRFw9TBsK1p6OaQMs
 +obM5PZy0eVq3STW5v1O1i35HWxARFc/9Cdz8c7w96+Br3XDu8uEJD/VvxBksjkbjR
 6/sUk3Lv5sWeoqsth05iFFTl4Vem/Gez+gyAlbuV8l7H/LzLfR1iCMf807Jlv8Cyvh
 HH9CwGJM4IPmg==
To: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "firecracker-maintainers@amazon.com" <firecracker-maintainers@amazon.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "criu@openvz.org" <criu@openvz.org>
From: scalingtree <scalingtree@proton.me>
Subject: checkpoint/restore: Adding more "Getters" to the KVM API
Message-ID: <adpJ8jbQtAUt-PBeSsepyoL3RhC_FATLu7n0OCZV_CVUbufKBArr_jQ4RER3zvKZmJEWFveyaze6iIR_Gh13E219nD1hhZa_PN7xB90p24s=@proton.me>
Feedback-ID: 64659969:user:proton
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="b1_6BUAg9EaMvbSfk2uXhrgklxjsioS1o8TNt22uOhmk"
Received-SPF: pass client-ip=185.70.43.24; envelope-from=scalingtree@proton.me;
 helo=mail-4324.protonmail.ch
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 29 Dec 2022 09:08:39 -0500
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This is a multi-part message in MIME format.

--b1_6BUAg9EaMvbSfk2uXhrgklxjsioS1o8TNt22uOhmk
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64

SGkgbGlzdHMsCgpXZSBhcmUgaW4gdGhlIHByb2Nlc3Mgb2YgdXNpbmcgYW4gZXh0ZXJuYWwgdG9v
bCAoQ1JJVSkgdG8gY2hlY2twb2ludC9yZXN0b3JlIGEgS1ZNLWVuYWJsZWQgdmlydHVhbCBtYWNo
aW5lLiBJbml0aWFsbHkgd2UgdGFyZ2V0IHRoZSBoeXBlcnZpc29yIGt2bXRvb2wgYnV0IHRoZSBl
eHRlbnNpb24sIGlmIGRvbmUgd2VsbCwgc2hvdWxkIGFsbG93IHRvIGNoZWNrcG9pbnQgYW55IGh5
cGVydmlzb3I6IGxpa2UgUWVtdSBvciBmaXJlY3JhY2tlci4KCkNSSVUgY2FuIGNoZWNrcG9pbnQg
YW5kIHJlc3RvcmUgbW9zdCBvZiB0aGUgYXBwbGljYXRpb24gKG9yIHRoZSBWTU0gaW4gb3VyIGNh
c2UpIHN0YXRlIGV4Y2VwdCB0aGUgc3RhdGUgb2YgdGhlIGtlcm5lbCBtb2R1bGUgS1ZNLiBUbyBv
dmVyY29tZSB0aGlzIGxpbWl0YXRpb24sIHdlIG5lZWQgbW9yZSBnZXR0ZXJzIGluIHRoZSBLVk0g
QVBJIHRvIGV4dHJhY3QgdGhlIHN0YXRlIG9mIHRoZSBWTS4KCk9uZSBleGFtcGxlIG9mIGEgbWlz
c2luZyBnZXR0ZXIgaXMgdGhlIG9uZSBmb3IgdGhlIGd1ZXN0IG1lbW9yeS4gVGhlcmUgaXMgYSBL
Vk1fU0VUX01FTU9SWSBBUEkgY2FsbC4gQnV0IHRoZXJlIGlzIG5vIGVxdWl2YWxlbnQgZ2V0dGVy
OiBLVk1fR0VUX01FTU9SWS4KCkNhbiB3ZSBhZGQgc3VjaCBnZXR0ZXJzIHRvIHRoZSBLVk0gQVBJ
PyBBbnkgaWRlYSBvZiB0aGUgZGlmZmljdWx0eT8gSSB0aGluayBvbmUgb2YgdGhlIGRpZmZpY3Vs
dGllcyB3aWxsIGJlIHRvIGdldCB0aGUgc3RhdGUgb2YgdGhlIGFyY2hpdGVjdHVyZS1zcGVjaWZp
YyBzdGF0ZSBvZiBLVk06IGZvciBub3csIHdlIGFyZSB0YXJnZXR0aW5nIEludGVsIHg4Nl82NCBh
cmNoaXRlY3R1cmUgKFZULVgpLgoKQW55IGZlZWRiYWNrIHdpbGwgYmUgYXBwcmVjaWF0ZWQuCgpC
ZXN0IFJlZ2FyZHMsClNjYWxpbmdUcmVl

--b1_6BUAg9EaMvbSfk2uXhrgklxjsioS1o8TNt22uOhmk
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IEFyaWFsOyBmb250LXNpemU6IDE0cHg7Ij5IaSBsaXN0
cyw8L2Rpdj48ZGl2IHN0eWxlPSJmb250LWZhbWlseTogQXJpYWw7IGZvbnQtc2l6ZTogMTRweDsi
Pjxicj48L2Rpdj48ZGl2IHN0eWxlPSJmb250LWZhbWlseTogQXJpYWw7IGZvbnQtc2l6ZTogMTRw
eDsiPldlIGFyZSBpbiB0aGUgcHJvY2VzcyBvZiB1c2luZyBhbiBleHRlcm5hbCB0b29sIChDUklV
KSB0byBjaGVja3BvaW50L3Jlc3RvcmUgYSBLVk0tZW5hYmxlZCB2aXJ0dWFsIG1hY2hpbmUuIElu
aXRpYWxseSB3ZSB0YXJnZXQgdGhlIGh5cGVydmlzb3Iga3ZtdG9vbCBidXQgdGhlIGV4dGVuc2lv
biwgaWYgZG9uZSB3ZWxsLCBzaG91bGQgYWxsb3cgdG8gY2hlY2twb2ludCBhbnkgaHlwZXJ2aXNv
cjogbGlrZSBRZW11IG9yIGZpcmVjcmFja2VyLjwvZGl2PjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5
OiBBcmlhbDsgZm9udC1zaXplOiAxNHB4OyI+PGJyPjwvZGl2PjxkaXYgc3R5bGU9ImZvbnQtZmFt
aWx5OiBBcmlhbDsgZm9udC1zaXplOiAxNHB4OyI+Q1JJVSBjYW4gY2hlY2twb2ludCBhbmQgcmVz
dG9yZSBtb3N0IG9mIHRoZSBhcHBsaWNhdGlvbiAob3IgdGhlIFZNTSBpbiBvdXIgY2FzZSkgc3Rh
dGUgZXhjZXB0IHRoZSBzdGF0ZSBvZiB0aGUga2VybmVsIG1vZHVsZSBLVk0uIFRvIG92ZXJjb21l
IHRoaXMgbGltaXRhdGlvbiwgd2UgbmVlZCBtb3JlIGdldHRlcnMgaW4gdGhlIEtWTSBBUEkgdG8g
ZXh0cmFjdCB0aGUgc3RhdGUgb2YgdGhlIFZNLjwvZGl2PjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5
OiBBcmlhbDsgZm9udC1zaXplOiAxNHB4OyI+PGJyPjwvZGl2PjxkaXYgc3R5bGU9ImZvbnQtZmFt
aWx5OiBBcmlhbDsgZm9udC1zaXplOiAxNHB4OyI+T25lIGV4YW1wbGUgb2YgYSBtaXNzaW5nIGdl
dHRlciBpcyB0aGUgb25lIGZvciB0aGUgZ3Vlc3QgbWVtb3J5LiBUaGVyZSBpcyBhIEtWTV9TRVRf
TUVNT1JZIEFQSSBjYWxsLiBCdXQgdGhlcmUgaXMgbm8gZXF1aXZhbGVudCBnZXR0ZXI6IEtWTV9H
RVRfTUVNT1JZLiZuYnNwOzwvZGl2PjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBBcmlhbDsgZm9u
dC1zaXplOiAxNHB4OyI+PGJyPjwvZGl2PjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBBcmlhbDsg
Zm9udC1zaXplOiAxNHB4OyI+Q2FuIHdlIGFkZCBzdWNoIGdldHRlcnMgdG8gdGhlIEtWTSBBUEk/
IEFueSBpZGVhIG9mIHRoZSBkaWZmaWN1bHR5PyBJIHRoaW5rIG9uZSBvZiB0aGUgZGlmZmljdWx0
aWVzIHdpbGwgYmUgdG8gZ2V0IHRoZSBzdGF0ZSBvZiB0aGUgYXJjaGl0ZWN0dXJlLXNwZWNpZmlj
IHN0YXRlIG9mIEtWTTogZm9yIG5vdywgd2UgYXJlIHRhcmdldHRpbmcgSW50ZWwgeDg2XzY0IGFy
Y2hpdGVjdHVyZSAoVlQtWCkuPC9kaXY+PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IEFyaWFsOyBm
b250LXNpemU6IDE0cHg7Ij48YnI+PC9kaXY+PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IEFyaWFs
OyBmb250LXNpemU6IDE0cHg7Ij5BbnkgZmVlZGJhY2sgd2lsbCBiZSBhcHByZWNpYXRlZC48L2Rp
dj48ZGl2IHN0eWxlPSJmb250LWZhbWlseTogQXJpYWw7IGZvbnQtc2l6ZTogMTRweDsiPjxicj48
L2Rpdj48ZGl2IHN0eWxlPSJmb250LWZhbWlseTogQXJpYWw7IGZvbnQtc2l6ZTogMTRweDsiPkJl
c3QgUmVnYXJkcyw8L2Rpdj48ZGl2IHN0eWxlPSJmb250LWZhbWlseTogQXJpYWw7IGZvbnQtc2l6
ZTogMTRweDsiPlNjYWxpbmdUcmVlPC9kaXY+DQo=


--b1_6BUAg9EaMvbSfk2uXhrgklxjsioS1o8TNt22uOhmk--


