Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE783318A8
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 21:34:46 +0100 (CET)
Received: from localhost ([::1]:57574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJMaT-0004sa-PP
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 15:34:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lJMZj-0004AR-Bb
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 15:33:59 -0500
Resent-Date: Mon, 08 Mar 2021 15:33:59 -0500
Resent-Message-Id: <E1lJMZj-0004AR-Bb@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lJMZh-0001GO-0L
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 15:33:58 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1615235626; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=nRrVyUP43pmpwYkyPS8nsAndZU4+zzQPQTE1VL4xA06bFQODPnGLNUf4MU2EL7X0Q0dRFJgOStF1BPJjpf2F44zC0DZgeKzdKu3E4b642T1+e6wmE+eQSOMVZ+fC9zS93GAut3e33IPiQyzNoIy9ZNH7bS/q2/QidX3QECylGFg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1615235626;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=5JBJuVlkRjomNjcML6ErgcseEH9qozq5IQGgJqG7Bes=; 
 b=jEbLUNW4DADreyYQKSY1aEY5KIWRvGArzrWuQdOccPfc3nB0LXuTwicWECN/2Y1hbaVUZYGt9VrvPty/tmE1p3uLoHQEsVTPTe8bSz+jdb/Se9PKYj/OhJhZWSXMTyL08bMHA6Ejm33s52tqiku1C+1doFatJZpW3U0KDsNhkIA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1615235624009742.1918001023798;
 Mon, 8 Mar 2021 12:33:44 -0800 (PST)
In-Reply-To: <20210308201406.1240023-1-aaron@os.amperecomputing.com>
Subject: Re: [PATCH] plugins: Expose physical addresses instead of device
 offsets
Message-ID: <161523562265.244.70225526984564992@f3770d8ad632>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: aaron@os.amperecomputing.com
Date: Mon, 8 Mar 2021 12:33:44 -0800 (PST)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.53; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o53.zoho.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Reply-To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, aaron@os.amperecomputing.com, cota@braap.org,
 alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDMwODIwMTQwNi4xMjQw
MDIzLTEtYWFyb25Ab3MuYW1wZXJlY29tcHV0aW5nLmNvbS8KCgoKSGksCgpUaGlzIHNlcmllcyBz
ZWVtcyB0byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93
IGZvcgptb3JlIGluZm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1lc3NhZ2UtaWQ6IDIwMjEwMzA4
MjAxNDA2LjEyNDAwMjMtMS1hYXJvbkBvcy5hbXBlcmVjb21wdXRpbmcuY29tClN1YmplY3Q6IFtQ
QVRDSF0gcGx1Z2luczogRXhwb3NlIHBoeXNpY2FsIGFkZHJlc3NlcyBpbnN0ZWFkIG9mIGRldmlj
ZSBvZmZzZXRzCgo9PT0gVEVTVCBTQ1JJUFQgQkVHSU4gPT09CiMhL2Jpbi9iYXNoCmdpdCByZXYt
cGFyc2UgYmFzZSA+IC9kZXYvbnVsbCB8fCBleGl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYu
cmVuYW1lbGltaXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVzIFRydWUKZ2l0IGNv
bmZpZyAtLWxvY2FsIGRpZmYuYWxnb3JpdGhtIGhpc3RvZ3JhbQouL3NjcmlwdHMvY2hlY2twYXRj
aC5wbCAtLW1haWxiYWNrIGJhc2UuLgo9PT0gVEVTVCBTQ1JJUFQgRU5EID09PQoKVXBkYXRpbmcg
M2M4Y2Y1YTljMjFmZjg3ODIxNjRkMWRlZjdmNDRiZDg4ODcxMzM4NApGcm9tIGh0dHBzOi8vZ2l0
aHViLmNvbS9wYXRjaGV3LXByb2plY3QvcWVtdQogICAwNDM2YzU1Li4yMjlhODM0ICBtYXN0ZXIg
ICAgIC0+IG1hc3RlcgogLSBbdGFnIHVwZGF0ZV0gICAgICBwYXRjaGV3LzIwMjEwMzA4MTIxMTU1
LjI0NzYtMS1tYXJrLmNhdmUtYXlsYW5kQGlsYW5kZS5jby51ayAtPiBwYXRjaGV3LzIwMjEwMzA4
MTIxMTU1LjI0NzYtMS1tYXJrLmNhdmUtYXlsYW5kQGlsYW5kZS5jby51awogLSBbdGFnIHVwZGF0
ZV0gICAgICBwYXRjaGV3LzIwMjEwMzA4MTczMjQ0LjIwNzEwLTEtcGV0ZXIubWF5ZGVsbEBsaW5h
cm8ub3JnIC0+IHBhdGNoZXcvMjAyMTAzMDgxNzMyNDQuMjA3MTAtMS1wZXRlci5tYXlkZWxsQGxp
bmFyby5vcmcKICogW25ldyB0YWddICAgICAgICAgcGF0Y2hldy8yMDIxMDMwODIwMTQwNi4xMjQw
MDIzLTEtYWFyb25Ab3MuYW1wZXJlY29tcHV0aW5nLmNvbSAtPiBwYXRjaGV3LzIwMjEwMzA4MjAx
NDA2LjEyNDAwMjMtMS1hYXJvbkBvcy5hbXBlcmVjb21wdXRpbmcuY29tClN3aXRjaGVkIHRvIGEg
bmV3IGJyYW5jaCAndGVzdCcKZmRkZGJmMSBwbHVnaW5zOiBFeHBvc2UgcGh5c2ljYWwgYWRkcmVz
c2VzIGluc3RlYWQgb2YgZGV2aWNlIG9mZnNldHMKCj09PSBPVVRQVVQgQkVHSU4gPT09CkVSUk9S
OiBsaW5lIG92ZXIgOTAgY2hhcmFjdGVycwojOTY6IEZJTEU6IHBsdWdpbnMvYXBpLmM6MzEwOgor
ICAgICAgICAgICAgYmxvY2sgPSBxZW11X3JhbV9ibG9ja19mcm9tX2hvc3QoKHZvaWQgKikgaGFk
ZHItPnYucmFtLmhvc3RhZGRyLCBmYWxzZSwgJm9mZnNldCk7Cgp0b3RhbDogMSBlcnJvcnMsIDAg
d2FybmluZ3MsIDY4IGxpbmVzIGNoZWNrZWQKCkNvbW1pdCBmZGRkYmYxOGE5YWMgKHBsdWdpbnM6
IEV4cG9zZSBwaHlzaWNhbCBhZGRyZXNzZXMgaW5zdGVhZCBvZiBkZXZpY2Ugb2Zmc2V0cykgaGFz
IHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55IG9mIHRoZXNlIGVycm9ycwph
cmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBtYWludGFpbmVyLCBzZWUKQ0hF
Q0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KPT09IE9VVFBVVCBFTkQgPT09CgpUZXN0IGNvbW1hbmQg
ZXhpdGVkIHdpdGggY29kZTogMQoKClRoZSBmdWxsIGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0cDov
L3BhdGNoZXcub3JnL2xvZ3MvMjAyMTAzMDgyMDE0MDYuMTI0MDAyMy0xLWFhcm9uQG9zLmFtcGVy
ZWNvbXB1dGluZy5jb20vdGVzdGluZy5jaGVja3BhdGNoLz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFp
bCBnZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRwczovL3BhdGNoZXcub3Jn
L10uClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29t

