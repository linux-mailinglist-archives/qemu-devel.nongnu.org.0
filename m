Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C698F6D5
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Aug 2019 00:14:19 +0200 (CEST)
Received: from localhost ([::1]:47610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hyO0g-0005oN-Bn
	for lists+qemu-devel@lfdr.de; Thu, 15 Aug 2019 18:14:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36348)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <no-reply@patchew.org>) id 1hyNzs-0005ML-Md
 for qemu-devel@nongnu.org; Thu, 15 Aug 2019 18:13:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <no-reply@patchew.org>) id 1hyNzr-0006bV-6O
 for qemu-devel@nongnu.org; Thu, 15 Aug 2019 18:13:28 -0400
Resent-Date: Thu, 15 Aug 2019 18:13:28 -0400
Resent-Message-Id: <E1hyNzr-0006bV-6O@eggs.gnu.org>
Received: from sender-of-o53.zoho.com ([135.84.80.218]:21890)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <no-reply@patchew.org>)
 id 1hyNzq-0006b4-Uz; Thu, 15 Aug 2019 18:13:27 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1565907194; cv=none; d=zoho.com; s=zohoarc; 
 b=RVGTeKNxRgXZLOrPkW5DasA63RDKN2yc3eQ9fvk4yssWA3vfOBQH2ZtJX2cb+vwugl9cch/wgDafQwVXoImGCdXTFogWh2rKIOS/ofFybB0jU5GgBbdKMJ1Tsq+ztXgZ5Fioacn/BJer8ioZvQUnMOW84//retQvZqzEnsmbqwo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
 s=zohoarc; t=1565907194;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To:ARC-Authentication-Results;
 bh=Dx+2a9Zbil5ET+qllYNyFSRzUUtN98tObSiZFW3mz3M=; 
 b=AUc2wUpjlk+5BVNSgGb71CzWW2gcpEnN5YhlXIEK/G9bPDdgbteTFxx1ywmDC/vYiR1mhYfn6nOxhwi3UWAnWgDTlLsP+rmBvLWjX/TDLg4npq9g8dmb4ywwBt25AoBMrcoqcUGLJJZCo3TwcaMYy+skHGm2QwhvRuvgergbOsc=
ARC-Authentication-Results: i=1; mx.zoho.com; dkim=pass  header.i=patchew.org;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1565907189662921.7316424924544;
 Thu, 15 Aug 2019 15:13:09 -0700 (PDT)
In-Reply-To: <cover.1565904855.git.alistair.francis@wdc.com>
Message-ID: <156590718846.17677.8197101794228197057@5dec9699b7de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: alistair.francis@wdc.com
Date: Thu, 15 Aug 2019 15:13:09 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 135.84.80.218
Subject: Re: [Qemu-devel] [PATCH v3 0/7] RISC-V: Hypervisor prep work part 2
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
Cc: alistair23@gmail.com, alistair.francis@wdc.com, palmer@sifive.com,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS9jb3Zlci4xNTY1OTA0ODU1Lmdp
dC5hbGlzdGFpci5mcmFuY2lzQHdkYy5jb20vCgoKCkhpLAoKVGhpcyBzZXJpZXMgZmFpbGVkIGJ1
aWxkIHRlc3Qgb24gczM5MHggaG9zdC4gUGxlYXNlIGZpbmQgdGhlIGRldGFpbHMgYmVsb3cuCgo9
PT0gVEVTVCBTQ1JJUFQgQkVHSU4gPT09CiMhL2Jpbi9iYXNoCiMgVGVzdGluZyBzY3JpcHQgd2ls
bCBiZSBpbnZva2VkIHVuZGVyIHRoZSBnaXQgY2hlY2tvdXQgd2l0aAojIEhFQUQgcG9pbnRpbmcg
dG8gYSBjb21taXQgdGhhdCBoYXMgdGhlIHBhdGNoZXMgYXBwbGllZCBvbiB0b3Agb2YgImJhc2Ui
CiMgYnJhbmNoCnNldCAtZQoKZWNobwplY2hvICI9PT0gRU5WID09PSIKZW52CgplY2hvCmVjaG8g
Ij09PSBQQUNLQUdFUyA9PT0iCnJwbSAtcWEKCmVjaG8KZWNobyAiPT09IFVOQU1FID09PSIKdW5h
bWUgLWEKCkNDPSRIT01FL2Jpbi9jYwpJTlNUQUxMPSRQV0QvaW5zdGFsbApCVUlMRD0kUFdEL2J1
aWxkCm1rZGlyIC1wICRCVUlMRCAkSU5TVEFMTApTUkM9JFBXRApjZCAkQlVJTEQKJFNSQy9jb25m
aWd1cmUgLS1jYz0kQ0MgLS1wcmVmaXg9JElOU1RBTEwKbWFrZSAtajQKIyBYWFg6IHdlIG5lZWQg
cmVsaWFibGUgY2xlYW4gdXAKIyBtYWtlIGNoZWNrIC1qNCBWPTEKbWFrZSBpbnN0YWxsCj09PSBU
RVNUIFNDUklQVCBFTkQgPT09CgogIENDICAgICAgbWlwcy1zb2Z0bW11L2h3L3ZmaW8vZGlzcGxh
eS5vCiAgQ0MgICAgICBtaXBzLXNvZnRtbXUvaHcvdmlydGlvL3ZpcnRpby5vCiAgR0VOICAgICBu
aW9zMi1zb2Z0bW11L2htcC1jb21tYW5kcy5oCmNvbGxlY3QyOiBlcnJvcjogbGQgcmV0dXJuZWQg
MSBleGl0IHN0YXR1cwogIEdFTiAgICAgbmlvczItc29mdG1tdS9obXAtY29tbWFuZHMtaW5mby5o
CiAgR0VOICAgICBuaW9zMi1zb2Z0bW11L2NvbmZpZy1kZXZpY2VzLmgKICBHRU4gICAgIG5pb3My
LXNvZnRtbXUvY29uZmlnLXRhcmdldC5oCi0tLQogIENDICAgICAgYWFyY2g2NC1zb2Z0bW11L2h3
L21pc2MvbnJmNTFfcm5nLm8KICBDQyAgICAgIGFhcmNoNjQtc29mdG1tdS9ody9uZXQvdmlydGlv
LW5ldC5vCiAgQ0MgICAgICBhYXJjaDY0LXNvZnRtbXUvaHcvbnZyYW0vbnJmNTFfbnZtLm8KY29s
bGVjdDI6IGVycm9yOiBsZCByZXR1cm5lZCAxIGV4aXQgc3RhdHVzCm1ha2VbMV06ICoqKiBbTWFr
ZWZpbGU6MjA5OiBxZW11LXN5c3RlbS1uaW9zMl0gRXJyb3IgMQptYWtlOiAqKiogW01ha2VmaWxl
OjQ3MjogbmlvczItc29mdG1tdS9hbGxdIEVycm9yIDIKICBDQyAgICAgIGFhcmNoNjQtc29mdG1t
dS9ody9wY21jaWEvcHhhMnh4Lm8KLS0tCm1ha2VbMV06ICoqKiBbL3Zhci90bXAvcGF0Y2hldy10
ZXN0ZXItdG1wLW1hOGpxdjB1L3NyYy9ydWxlcy5tYWs6Njk6IGh3L3ZmaW8vcGNpLm9dIEVycm9y
IDEKbWFrZVsxXTogKioqIFdhaXRpbmcgZm9yIHVuZmluaXNoZWQgam9icy4uLi4KbWFrZTogKioq
IFtNYWtlZmlsZTo0NzI6IGFhcmNoNjQtc29mdG1tdS9hbGxdIEVycm9yIDIKY29sbGVjdDI6IGVy
cm9yOiBsZCByZXR1cm5lZCAxIGV4aXQgc3RhdHVzCm1ha2VbMV06ICoqKiBbTWFrZWZpbGU6MjA5
OiBxZW11LXN5c3RlbS1taXBzXSBFcnJvciAxCm1ha2U6ICoqKiBbTWFrZWZpbGU6NDcyOiBtaXBz
LXNvZnRtbXUvYWxsXSBFcnJvciAyCj09PSBPVVRQVVQgRU5EID09PQoKClRoZSBmdWxsIGxvZyBp
cyBhdmFpbGFibGUgYXQKaHR0cDovL3BhdGNoZXcub3JnL2xvZ3MvY292ZXIuMTU2NTkwNDg1NS5n
aXQuYWxpc3RhaXIuZnJhbmNpc0B3ZGMuY29tL3Rlc3RpbmcuczM5MHgvP3R5cGU9bWVzc2FnZS4K
LS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHBzOi8vcGF0
Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRjaGV3LWRldmVsQHJl
ZGhhdC5jb20=


