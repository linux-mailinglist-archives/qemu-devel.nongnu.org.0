Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6584B373611
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 10:09:47 +0200 (CEST)
Received: from localhost ([::1]:57448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leCbK-0000Q1-F7
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 04:09:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1leCZb-0007gk-UU; Wed, 05 May 2021 04:07:59 -0400
Resent-Date: Wed, 05 May 2021 04:07:59 -0400
Resent-Message-Id: <E1leCZb-0007gk-UU@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1leCZZ-0003cA-Bc; Wed, 05 May 2021 04:07:59 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1620202015; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=PZcsRq8Hp45pavPvDRNgw9racsY9i650d6LrLbtxHFkkeiHAIpxOvvSFhAwlGGlMoUkVUqlA7SWak77Kkc67OyDfojiIHliugXUCP8NVlvezlLZy7tlInD0Xpg2rjbC/7WHwIAnHUia5KJSAcVSjemheaL9QyNbArQE/p+HKBc4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1620202015;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=awTiQs9rMqsm6rDclBCBPJRlDHwilXskXTfwb4oGy6M=; 
 b=ARMMON7nVMg6jdjKWkcUSUiZavxv5yQgYGScVulC/01twvbdLZJIpVSwBoNMEUoC0/mxYUP0szDqd3Wx7PbuQRh3PZWgCRi+preetmcGQT0/tsSulcJH+q3EogEsbzPKBvW7t4DM5jJ3HN6HfE1DUNJKDKRL1syMXRk8AMGkP3c=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1620202013969640.7331979054426;
 Wed, 5 May 2021 01:06:53 -0700 (PDT)
In-Reply-To: <20210505075001.45041-1-vsementsov@virtuozzo.com>
Subject: Re: [PATCH v5 00/11] 64bit block-layer: part II
Message-ID: <162020201176.26740.1388132003306753260@d887ba82c771>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: vsementsov@virtuozzo.com
Date: Wed, 5 May 2021 01:06:53 -0700 (PDT)
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
Cc: kwolf@redhat.com, fam@euphon.net, vsementsov@virtuozzo.com,
 berto@igalia.com, pavel.dovgaluk@ispras.ru, qemu-block@nongnu.org,
 dillaman@redhat.com, jsnow@redhat.com, pl@kamp.de, qemu-devel@nongnu.org,
 mreitz@redhat.com, integration@gluster.org, stefanha@redhat.com,
 sw@weilnetz.de, pbonzini@redhat.com, namei.unix@gmail.com, ari@tuxera.com,
 ronniesahlberg@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDUwNTA3NTAwMS40NTA0
MS0xLXZzZW1lbnRzb3ZAdmlydHVvenpvLmNvbS8KCgoKSGksCgpUaGlzIHNlcmllcyBzZWVtcyB0
byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93IGZvcgpt
b3JlIGluZm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1lc3NhZ2UtaWQ6IDIwMjEwNTA1MDc1MDAx
LjQ1MDQxLTEtdnNlbWVudHNvdkB2aXJ0dW96em8uY29tClN1YmplY3Q6IFtQQVRDSCB2NSAwMC8x
MV0gNjRiaXQgYmxvY2stbGF5ZXI6IHBhcnQgSUkKCj09PSBURVNUIFNDUklQVCBCRUdJTiA9PT0K
IyEvYmluL2Jhc2gKZ2l0IHJldi1wYXJzZSBiYXNlID4gL2Rldi9udWxsIHx8IGV4aXQgMApnaXQg
Y29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVsaW1pdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZm
LnJlbmFtZXMgVHJ1ZQpnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5hbGdvcml0aG0gaGlzdG9ncmFt
Ci4vc2NyaXB0cy9jaGVja3BhdGNoLnBsIC0tbWFpbGJhY2sgYmFzZS4uCj09PSBURVNUIFNDUklQ
VCBFTkQgPT09CgpVcGRhdGluZyAzYzhjZjVhOWMyMWZmODc4MjE2NGQxZGVmN2Y0NGJkODg4NzEz
Mzg0CkZyb20gaHR0cHM6Ly9naXRodWIuY29tL3BhdGNoZXctcHJvamVjdC9xZW11CiAtIFt0YWcg
dXBkYXRlXSAgICAgIHBhdGNoZXcvMjAyMTA1MDUwNDU4MjQuMzM4ODAtMS1saXEzZWFAMTYzLmNv
bSAtPiBwYXRjaGV3LzIwMjEwNTA1MDQ1ODI0LjMzODgwLTEtbGlxM2VhQDE2My5jb20KICogW25l
dyB0YWddICAgICAgICAgcGF0Y2hldy8yMDIxMDUwNTA3NTAwMS40NTA0MS0xLXZzZW1lbnRzb3ZA
dmlydHVvenpvLmNvbSAtPiBwYXRjaGV3LzIwMjEwNTA1MDc1MDAxLjQ1MDQxLTEtdnNlbWVudHNv
dkB2aXJ0dW96em8uY29tClN3aXRjaGVkIHRvIGEgbmV3IGJyYW5jaCAndGVzdCcKMzcwMGFhZiBi
bG9jay9pbzogYWxsb3cgNjRiaXQgZGlzY2FyZCByZXF1ZXN0cwo1NGJhNTQ4IGJsb2NrOiB1c2Ug
aW50NjRfdCBpbnN0ZWFkIG9mIGludCBpbiBkcml2ZXIgZGlzY2FyZCBoYW5kbGVycwo3YTNhYWE1
IGJsb2NrOiBtYWtlIEJsb2NrTGltaXRzOjptYXhfcGRpc2NhcmQgNjRiaXQKZjgwZmFmNyBibG9j
ay9pbzogYWxsb3cgNjRiaXQgd3JpdGUtemVyb2VzIHJlcXVlc3RzCjRjYzMzMTAgYmxvY2s6IHVz
ZSBpbnQ2NF90IGluc3RlYWQgb2YgaW50IGluIGRyaXZlciB3cml0ZV96ZXJvZXMgaGFuZGxlcnMK
MTM2ZGQ2MyBibG9jazogbWFrZSBCbG9ja0xpbWl0czo6bWF4X3B3cml0ZV96ZXJvZXMgNjRiaXQK
MDNhN2M0NSBibG9jazogdXNlIGludDY0X3QgaW5zdGVhZCBvZiB1aW50NjRfdCBpbiBjb3B5X3Jh
bmdlIGRyaXZlciBoYW5kbGVycwo0OTZmZThiIGJsb2NrOiB1c2UgaW50NjRfdCBpbnN0ZWFkIG9m
IHVpbnQ2NF90IGluIGRyaXZlciB3cml0ZSBoYW5kbGVycwplZWZiMzFkIGJsb2NrOiB1c2UgaW50
NjRfdCBpbnN0ZWFkIG9mIHVpbnQ2NF90IGluIGRyaXZlciByZWFkIGhhbmRsZXJzCmZiN2ExMTkg
cWNvdzI6IGNoZWNrIHJlcXVlc3Qgb24gdm1zdGF0ZSBzYXZlL2xvYWQgcGF0aAoyM2JhMGY0IGJs
b2NrL2lvOiBicmluZyByZXF1ZXN0IGNoZWNrIHRvIGJkcnZfY29fKHJlYWQsIHdyaXRlKXZfdm1z
dGF0ZQoKPT09IE9VVFBVVCBCRUdJTiA9PT0KMS8xMSBDaGVja2luZyBjb21taXQgMjNiYTBmNGEw
OWMxIChibG9jay9pbzogYnJpbmcgcmVxdWVzdCBjaGVjayB0byBiZHJ2X2NvXyhyZWFkLCB3cml0
ZSl2X3Ztc3RhdGUpCkVSUk9SOiBBdXRob3IgZW1haWwgYWRkcmVzcyBpcyBtYW5nbGVkIGJ5IHRo
ZSBtYWlsaW5nIGxpc3QKIzI6IApBdXRob3I6IFZsYWRpbWlyIFNlbWVudHNvdi1PZ2lldnNraXkg
dmlhIDxxZW11LWRldmVsQG5vbmdudS5vcmc+Cgp0b3RhbDogMSBlcnJvcnMsIDAgd2FybmluZ3Ms
IDQyIGxpbmVzIGNoZWNrZWQKClBhdGNoIDEvMTEgaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2Ug
cmV2aWV3LiAgSWYgYW55IG9mIHRoZXNlIGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9y
dCB0aGVtIHRvIHRoZSBtYWludGFpbmVyLCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4K
CjIvMTEgQ2hlY2tpbmcgY29tbWl0IGZiN2ExMTljZDlhYSAocWNvdzI6IGNoZWNrIHJlcXVlc3Qg
b24gdm1zdGF0ZSBzYXZlL2xvYWQgcGF0aCkKMy8xMSBDaGVja2luZyBjb21taXQgZWVmYjMxZDQ4
MGI0IChibG9jazogdXNlIGludDY0X3QgaW5zdGVhZCBvZiB1aW50NjRfdCBpbiBkcml2ZXIgcmVh
ZCBoYW5kbGVycykKNC8xMSBDaGVja2luZyBjb21taXQgNDk2ZmU4YjJlN2NlIChibG9jazogdXNl
IGludDY0X3QgaW5zdGVhZCBvZiB1aW50NjRfdCBpbiBkcml2ZXIgd3JpdGUgaGFuZGxlcnMpCjUv
MTEgQ2hlY2tpbmcgY29tbWl0IDAzYTdjNDUzNGE1OCAoYmxvY2s6IHVzZSBpbnQ2NF90IGluc3Rl
YWQgb2YgdWludDY0X3QgaW4gY29weV9yYW5nZSBkcml2ZXIgaGFuZGxlcnMpCjYvMTEgQ2hlY2tp
bmcgY29tbWl0IDEzNmRkNjNjYzcyMyAoYmxvY2s6IG1ha2UgQmxvY2tMaW1pdHM6Om1heF9wd3Jp
dGVfemVyb2VzIDY0Yml0KQo3LzExIENoZWNraW5nIGNvbW1pdCA0Y2MzMzEwZDI0M2UgKGJsb2Nr
OiB1c2UgaW50NjRfdCBpbnN0ZWFkIG9mIGludCBpbiBkcml2ZXIgd3JpdGVfemVyb2VzIGhhbmRs
ZXJzKQo4LzExIENoZWNraW5nIGNvbW1pdCBmODBmYWY3M2E4NGEgKGJsb2NrL2lvOiBhbGxvdyA2
NGJpdCB3cml0ZS16ZXJvZXMgcmVxdWVzdHMpCjkvMTEgQ2hlY2tpbmcgY29tbWl0IDdhM2FhYTU4
NzMxNCAoYmxvY2s6IG1ha2UgQmxvY2tMaW1pdHM6Om1heF9wZGlzY2FyZCA2NGJpdCkKMTAvMTEg
Q2hlY2tpbmcgY29tbWl0IDU0YmE1NDg2MGI0YSAoYmxvY2s6IHVzZSBpbnQ2NF90IGluc3RlYWQg
b2YgaW50IGluIGRyaXZlciBkaXNjYXJkIGhhbmRsZXJzKQoxMS8xMSBDaGVja2luZyBjb21taXQg
MzcwMGFhZmVjMWZmIChibG9jay9pbzogYWxsb3cgNjRiaXQgZGlzY2FyZCByZXF1ZXN0cykKPT09
IE9VVFBVVCBFTkQgPT09CgpUZXN0IGNvbW1hbmQgZXhpdGVkIHdpdGggY29kZTogMQoKClRoZSBm
dWxsIGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0cDovL3BhdGNoZXcub3JnL2xvZ3MvMjAyMTA1MDUw
NzUwMDEuNDUwNDEtMS12c2VtZW50c292QHZpcnR1b3p6by5jb20vdGVzdGluZy5jaGVja3BhdGNo
Lz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBQYXRj
aGV3IFtodHRwczovL3BhdGNoZXcub3JnL10uClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8g
cGF0Y2hldy1kZXZlbEByZWRoYXQuY29t

