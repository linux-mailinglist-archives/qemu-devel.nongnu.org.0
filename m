Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 087861FBE53
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jun 2020 20:42:59 +0200 (CEST)
Received: from localhost ([::1]:54488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlGXy-0002ZG-43
	for lists+qemu-devel@lfdr.de; Tue, 16 Jun 2020 14:42:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1jlGWm-00020x-LA; Tue, 16 Jun 2020 14:41:44 -0400
Resent-Date: Tue, 16 Jun 2020 14:41:44 -0400
Resent-Message-Id: <E1jlGWm-00020x-LA@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1jlGWk-0007CS-4N; Tue, 16 Jun 2020 14:41:44 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1592332893; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=cyf62hMRE8gl4CSEHDJXK9OKXcuyUwzeyB5U+midNclHr3prn/6b8oez8HI0aLb/NjM5plQVNSG6nNB4jFiAENxcgZYbDPTGoGkrIHE+8yehQtCLVfgE8kbS+QVdzL0bPyGZawjEk/WW4c29y77gAhicKm4Vw64skl6uxxFhA5o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1592332893;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=B1l7Ri6Qt8nJcf9uKCUPgHBn7sXYi0GIpY6/V+7AIEA=; 
 b=BjieD9aUwTYZScNlO50nZugUA6e6CkBM6+ZYWjhId+SQEYsfN2kdqSwqj2fs/tSqMyvbcowb39f5mwbTOD6Z/o4L4fJx3Zw2jjDI4r5c+5kj7hXD7Yd/8aY5hwAqQ5Q5uMA5cvXSXuB+Xrzfpbg9bQo/ESR4pWdAqEWDHG2qTNE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1592332890346655.8718674109479;
 Tue, 16 Jun 2020 11:41:30 -0700 (PDT)
Message-ID: <159233288930.9045.6594106154915120964@d1fd068a5071>
Subject: Re: [PATCH V4] util/oslib-posix : qemu_init_exec_dir implementation
 for Mac
In-Reply-To: <CA+XhMqx6VjRhT6xBzJ-UYs7cPDXVK=PNdfNVdad3Tqhe43P=Ew@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: devnexen@gmail.com
Date: Tue, 16 Jun 2020 11:41:30 -0700 (PDT)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.53; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o53.zoho.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/16 14:41:39
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS9DQStYaE1xeDZWalJoVDZ4QnpK
LVVZczdjUERYVks9UE5kZk5WZGFkM1RxaGU0M1A9RXdAbWFpbC5nbWFpbC5jb20vCgoKCkhpLAoK
VGhpcyBzZXJpZXMgc2VlbXMgdG8gaGF2ZSBzb21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2Vl
IG91dHB1dCBiZWxvdyBmb3IKbW9yZSBpbmZvcm1hdGlvbjoKClN1YmplY3Q6IFtQQVRDSCBWNF0g
dXRpbC9vc2xpYi1wb3NpeCA6IHFlbXVfaW5pdF9leGVjX2RpciBpbXBsZW1lbnRhdGlvbiBmb3Ig
TWFjClR5cGU6IHNlcmllcwpNZXNzYWdlLWlkOiBDQStYaE1xeDZWalJoVDZ4QnpKLVVZczdjUERY
Vks9UE5kZk5WZGFkM1RxaGU0M1A9RXdAbWFpbC5nbWFpbC5jb20KCj09PSBURVNUIFNDUklQVCBC
RUdJTiA9PT0KIyEvYmluL2Jhc2gKZ2l0IHJldi1wYXJzZSBiYXNlID4gL2Rldi9udWxsIHx8IGV4
aXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVsaW1pdCAwCmdpdCBjb25maWcgLS1s
b2NhbCBkaWZmLnJlbmFtZXMgVHJ1ZQpnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5hbGdvcml0aG0g
aGlzdG9ncmFtCi4vc2NyaXB0cy9jaGVja3BhdGNoLnBsIC0tbWFpbGJhY2sgYmFzZS4uCj09PSBU
RVNUIFNDUklQVCBFTkQgPT09CgpTd2l0Y2hlZCB0byBhIG5ldyBicmFuY2ggJ3Rlc3QnCjRhZThh
MDcgdXRpbC9vc2xpYi1wb3NpeCA6IHFlbXVfaW5pdF9leGVjX2RpciBpbXBsZW1lbnRhdGlvbiBm
b3IgTWFjCgo9PT0gT1VUUFVUIEJFR0lOID09PQpXQVJOSU5HOiBhcmNoaXRlY3R1cmUgc3BlY2lm
aWMgZGVmaW5lcyBzaG91bGQgYmUgYXZvaWRlZAojMjU6IEZJTEU6IHV0aWwvb3NsaWItcG9zaXgu
Yzo2MDoKKyNpZmRlZiBfX0FQUExFX18KCkVSUk9SOiBzdXNwZWN0IGNvZGUgaW5kZW50IGZvciBj
b25kaXRpb25hbCBzdGF0ZW1lbnRzICg4LCA1KQojMzk6IEZJTEU6IHV0aWwvb3NsaWItcG9zaXgu
YzozODU6CisgICAgICAgIGlmIChfTlNHZXRFeGVjdXRhYmxlUGF0aChidWYsICZsZW4pID09IDAp
IHsKKyAgICAgY2hhciBmcGF0aFtQQVRIX01BWF07Cgp0b3RhbDogMSBlcnJvcnMsIDEgd2Fybmlu
Z3MsIDI2IGxpbmVzIGNoZWNrZWQKCkNvbW1pdCA0YWU4YTA3ZWRjODAgKHV0aWwvb3NsaWItcG9z
aXggOiBxZW11X2luaXRfZXhlY19kaXIgaW1wbGVtZW50YXRpb24gZm9yIE1hYykgaGFzIHN0eWxl
IHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55IG9mIHRoZXNlIGVycm9ycwphcmUgZmFs
c2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBtYWludGFpbmVyLCBzZWUKQ0hFQ0tQQVRD
SCBpbiBNQUlOVEFJTkVSUy4KPT09IE9VVFBVVCBFTkQgPT09CgpUZXN0IGNvbW1hbmQgZXhpdGVk
IHdpdGggY29kZTogMQoKClRoZSBmdWxsIGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0cDovL3BhdGNo
ZXcub3JnL2xvZ3MvQ0ErWGhNcXg2VmpSaFQ2eEJ6Si1VWXM3Y1BEWFZLPVBOZGZOVmRhZDNUcWhl
NDNQPUV3QG1haWwuZ21haWwuY29tL3Rlc3RpbmcuY2hlY2twYXRjaC8/dHlwZT1tZXNzYWdlLgot
LS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0cHM6Ly9wYXRj
aGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNoZXctZGV2ZWxAcmVk
aGF0LmNvbQ==

