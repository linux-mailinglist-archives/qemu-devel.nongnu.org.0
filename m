Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B40EF362404
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 17:34:07 +0200 (CEST)
Received: from localhost ([::1]:54872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXQTu-00005e-0S
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 11:34:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lXQQz-0007N2-EZ
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 11:31:05 -0400
Resent-Date: Fri, 16 Apr 2021 11:31:05 -0400
Resent-Message-Id: <E1lXQQz-0007N2-EZ@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lXQQu-0008Pn-JX
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 11:31:05 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1618587050; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=SIODeaPlgIv1ei4jdib8q58otAETOa4b4Q5RnoUzxQsnhTJq9382r4Mmfd0B1QdKN68+qD6/nMZTyFogPFzP7HdBySv9NtNRMKwGQ9GhTMqtO8PjFuKCoj7oE5302axukXKfPKZSa8lSSyMlmWIYgvVX/CkBNgsaYxcBz4rsa7M=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1618587050;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=EK7WJ05PsTB7kcAE362Oh9N7ZGZ3TO8iSJsGDhlB4ks=; 
 b=Q+DGt6bM+IqvvgMDgvF3Bs7Am/m5o8FmMIatbdEcldqi/6TQXFDNGQOLznTFzkreP9POIsukbTLZyYVxR1oXq3WySEZdTEI11b/WgZyL+s4i8R5WElTwqKsEuuYlXz/ncAh0c64fQilzPz/62Cf792vW4aMJr9NlTkyb6LeY7Y8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1618587047935907.1234836052481;
 Fri, 16 Apr 2021 08:30:47 -0700 (PDT)
In-Reply-To: <20210416152429.91832-1-ziqiaokong@gmail.com>
Subject: Re: [PATCH] Set the correct env->fpip for x86 float instructions
Message-ID: <161858704665.31688.10056471501880366996@72b6d80f974b>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: ziqiaokong@gmail.com
Date: Fri, 16 Apr 2021 08:30:47 -0700 (PDT)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.53; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o53.zoho.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: pbonzini@redhat.com, ziqiaokong@gmail.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDQxNjE1MjQyOS45MTgz
Mi0xLXppcWlhb2tvbmdAZ21haWwuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIHNlZW1zIHRvIGhh
dmUgc29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cgZm9yCm1vcmUg
aW5mb3JtYXRpb246CgpUeXBlOiBzZXJpZXMKTWVzc2FnZS1pZDogMjAyMTA0MTYxNTI0MjkuOTE4
MzItMS16aXFpYW9rb25nQGdtYWlsLmNvbQpTdWJqZWN0OiBbUEFUQ0hdIFNldCB0aGUgY29ycmVj
dCBlbnYtPmZwaXAgZm9yIHg4NiBmbG9hdCBpbnN0cnVjdGlvbnMKCj09PSBURVNUIFNDUklQVCBC
RUdJTiA9PT0KIyEvYmluL2Jhc2gKZ2l0IHJldi1wYXJzZSBiYXNlID4gL2Rldi9udWxsIHx8IGV4
aXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVsaW1pdCAwCmdpdCBjb25maWcgLS1s
b2NhbCBkaWZmLnJlbmFtZXMgVHJ1ZQpnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5hbGdvcml0aG0g
aGlzdG9ncmFtCi4vc2NyaXB0cy9jaGVja3BhdGNoLnBsIC0tbWFpbGJhY2sgYmFzZS4uCj09PSBU
RVNUIFNDUklQVCBFTkQgPT09CgpVcGRhdGluZyAzYzhjZjVhOWMyMWZmODc4MjE2NGQxZGVmN2Y0
NGJkODg4NzEzMzg0CkZyb20gaHR0cHM6Ly9naXRodWIuY29tL3BhdGNoZXctcHJvamVjdC9xZW11
CiAtIFt0YWcgdXBkYXRlXSAgICAgIHBhdGNoZXcvMjAyMTA0MTYxMDQwMTAuMTMyMjgtMS1wZXRl
ci5tYXlkZWxsQGxpbmFyby5vcmcgLT4gcGF0Y2hldy8yMDIxMDQxNjEwNDAxMC4xMzIyOC0xLXBl
dGVyLm1heWRlbGxAbGluYXJvLm9yZwogKiBbbmV3IHRhZ10gICAgICAgICBwYXRjaGV3LzIwMjEw
NDE2MTUyNDI5LjkxODMyLTEtemlxaWFva29uZ0BnbWFpbC5jb20gLT4gcGF0Y2hldy8yMDIxMDQx
NjE1MjQyOS45MTgzMi0xLXppcWlhb2tvbmdAZ21haWwuY29tClN3aXRjaGVkIHRvIGEgbmV3IGJy
YW5jaCAndGVzdCcKYmRiODMyYiBTZXQgdGhlIGNvcnJlY3QgZW52LT5mcGlwIGZvciB4ODYgZmxv
YXQgaW5zdHJ1Y3Rpb25zCgo9PT0gT1VUUFVUIEJFR0lOID09PQpFUlJPUjogTWlzc2luZyBTaWdu
ZWQtb2ZmLWJ5OiBsaW5lKHMpCgp0b3RhbDogMSBlcnJvcnMsIDAgd2FybmluZ3MsIDI2IGxpbmVz
IGNoZWNrZWQKCkNvbW1pdCBiZGI4MzJiZDdkZTAgKFNldCB0aGUgY29ycmVjdCBlbnYtPmZwaXAg
Zm9yIHg4NiBmbG9hdCBpbnN0cnVjdGlvbnMpIGhhcyBzdHlsZSBwcm9ibGVtcywgcGxlYXNlIHJl
dmlldy4gIElmIGFueSBvZiB0aGVzZSBlcnJvcnMKYXJlIGZhbHNlIHBvc2l0aXZlcyByZXBvcnQg
dGhlbSB0byB0aGUgbWFpbnRhaW5lciwgc2VlCkNIRUNLUEFUQ0ggaW4gTUFJTlRBSU5FUlMuCj09
PSBPVVRQVVQgRU5EID09PQoKVGVzdCBjb21tYW5kIGV4aXRlZCB3aXRoIGNvZGU6IDEKCgpUaGUg
ZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0dHA6Ly9wYXRjaGV3Lm9yZy9sb2dzLzIwMjEwNDE2
MTUyNDI5LjkxODMyLTEtemlxaWFva29uZ0BnbWFpbC5jb20vdGVzdGluZy5jaGVja3BhdGNoLz90
eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBQYXRjaGV3
IFtodHRwczovL3BhdGNoZXcub3JnL10uClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0
Y2hldy1kZXZlbEByZWRoYXQuY29t

