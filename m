Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0717A194527
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Mar 2020 18:12:49 +0100 (CET)
Received: from localhost ([::1]:56832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jHW3j-0005g6-OU
	for lists+qemu-devel@lfdr.de; Thu, 26 Mar 2020 13:12:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39355)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <no-reply@patchew.org>) id 1jHW2W-0004Kz-2x
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 13:11:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <no-reply@patchew.org>) id 1jHW2U-00068f-7Y
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 13:11:31 -0400
Resent-Date: Thu, 26 Mar 2020 13:11:31 -0400
Resent-Message-Id: <E1jHW2U-00068f-7Y@eggs.gnu.org>
Received: from sender4-of-o51.zoho.com ([136.143.188.51]:21165)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <no-reply@patchew.org>)
 id 1jHW2T-00065y-W8; Thu, 26 Mar 2020 13:11:30 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1585242662; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=OcOHeVOWz+593+njDE6Yd9KY64bum+4C1YPG8eCsNMgvA53y2O8OM/EOWq/Uka6910Mrz/iTSyc0ZHicm1zY8pURE/nThee0RTTd7ejpgqI7BxXoti2Kmxaiayhna4beasf+7BgUdrBhtXWOO4tCE1rraa5uHT6Jg2MUjQ97I+M=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1585242662;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=FjUtAbwu9Xm5h79evh3tfmC2dnyZpFBnQHggXszK8eA=; 
 b=Lv8zTTrAv7AFcsx3koBfONyn0WRja03k/d8Q4TQcbGaW3vW49LFc6hD8cSa0s/+f/arz5n//rJOjLVH9GROkjMPnEmxq7ENd3U+B4QqhbrqcNrd9zVVeVhva5OSE5rc6j3Ftr1yB7LwZD3AI7po3RedqxupyZKqaLzEpalzAbLc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1585242660881250.84091073241416;
 Thu, 26 Mar 2020 10:11:00 -0700 (PDT)
In-Reply-To: <20200326155628.859862-1-s.reiter@proxmox.com>
Subject: Re: [PATCH v2 0/3] Fix some AIO context locking in jobs
Message-ID: <158524265908.25711.7430460880242717404@39012742ff91>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: s.reiter@proxmox.com
Date: Thu, 26 Mar 2020 10:11:00 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 136.143.188.51
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, qemu-block@nongnu.org,
 slp@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com, stefanha@redhat.com,
 jsnow@redhat.com, dietmar@proxmox.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMDMyNjE1NTYyOC44NTk4
NjItMS1zLnJlaXRlckBwcm94bW94LmNvbS8KCgoKSGksCgpUaGlzIHNlcmllcyBmYWlsZWQgdGhl
IGRvY2tlci1xdWlja0BjZW50b3M3IGJ1aWxkIHRlc3QuIFBsZWFzZSBmaW5kIHRoZSB0ZXN0aW5n
IGNvbW1hbmRzIGFuZAp0aGVpciBvdXRwdXQgYmVsb3cuIElmIHlvdSBoYXZlIERvY2tlciBpbnN0
YWxsZWQsIHlvdSBjYW4gcHJvYmFibHkgcmVwcm9kdWNlIGl0CmxvY2FsbHkuCgo9PT0gVEVTVCBT
Q1JJUFQgQkVHSU4gPT09CiMhL2Jpbi9iYXNoCm1ha2UgZG9ja2VyLWltYWdlLWNlbnRvczcgVj0x
IE5FVFdPUks9MQp0aW1lIG1ha2UgZG9ja2VyLXRlc3QtcXVpY2tAY2VudG9zNyBTSE9XX0VOVj0x
IEo9MTQgTkVUV09SSz0xCj09PSBURVNUIFNDUklQVCBFTkQgPT09CgogIFRFU1QgICAgY2hlY2st
dW5pdDogdGVzdHMvdGVzdC1iZHJ2LWdyYXBoLW1vZAogIFRFU1QgICAgY2hlY2stdW5pdDogdGVz
dHMvdGVzdC1ibG9ja2pvYgpxZW11OiBxZW11X211dGV4X3VubG9ja19pbXBsOiBPcGVyYXRpb24g
bm90IHBlcm1pdHRlZApFUlJPUiAtIHRvbyBmZXcgdGVzdHMgcnVuIChleHBlY3RlZCA4LCBnb3Qg
NykKbWFrZTogKioqIFtjaGVjay11bml0XSBFcnJvciAxCm1ha2U6ICoqKiBXYWl0aW5nIGZvciB1
bmZpbmlzaGVkIGpvYnMuLi4uCiAgVEVTVCAgICBpb3Rlc3QtcWNvdzI6IDAyMAogIFRFU1QgICAg
aW90ZXN0LXFjb3cyOiAwMjEKLS0tCiAgICByYWlzZSBDYWxsZWRQcm9jZXNzRXJyb3IocmV0Y29k
ZSwgY21kKQpzdWJwcm9jZXNzLkNhbGxlZFByb2Nlc3NFcnJvcjogQ29tbWFuZCAnWydzdWRvJywg
Jy1uJywgJ2RvY2tlcicsICdydW4nLCAnLS1sYWJlbCcsICdjb20ucWVtdS5pbnN0YW5jZS51dWlk
PTI3MjRiMmFmNTQ2NDQzYzdhNjBkMGYwNjFmMWJlYWI3JywgJy11JywgJzEwMDMnLCAnLS1zZWN1
cml0eS1vcHQnLCAnc2VjY29tcD11bmNvbmZpbmVkJywgJy0tcm0nLCAnLWUnLCAnVEFSR0VUX0xJ
U1Q9JywgJy1lJywgJ0VYVFJBX0NPTkZJR1VSRV9PUFRTPScsICctZScsICdWPScsICctZScsICdK
PTE0JywgJy1lJywgJ0RFQlVHPScsICctZScsICdTSE9XX0VOVj0xJywgJy1lJywgJ0NDQUNIRV9E
SVI9L3Zhci90bXAvY2NhY2hlJywgJy12JywgJy9ob21lL3BhdGNoZXcyLy5jYWNoZS9xZW11LWRv
Y2tlci1jY2FjaGU6L3Zhci90bXAvY2NhY2hlOnonLCAnLXYnLCAnL3Zhci90bXAvcGF0Y2hldy10
ZXN0ZXItdG1wLTc4ODd1aGN5L3NyYy9kb2NrZXItc3JjLjIwMjAtMDMtMjYtMTIuNTYuNDEuMjg5
Nzk6L3Zhci90bXAvcWVtdTp6LHJvJywgJ3FlbXU6Y2VudG9zNycsICcvdmFyL3RtcC9xZW11L3J1
bicsICd0ZXN0LXF1aWNrJ10nIHJldHVybmVkIG5vbi16ZXJvIGV4aXQgc3RhdHVzIDIuCmZpbHRl
cj0tLWZpbHRlcj1sYWJlbD1jb20ucWVtdS5pbnN0YW5jZS51dWlkPTI3MjRiMmFmNTQ2NDQzYzdh
NjBkMGYwNjFmMWJlYWI3Cm1ha2VbMV06ICoqKiBbZG9ja2VyLXJ1bl0gRXJyb3IgMQptYWtlWzFd
OiBMZWF2aW5nIGRpcmVjdG9yeSBgL3Zhci90bXAvcGF0Y2hldy10ZXN0ZXItdG1wLTc4ODd1aGN5
L3NyYycKbWFrZTogKioqIFtkb2NrZXItcnVuLXRlc3QtcXVpY2tAY2VudG9zN10gRXJyb3IgMgoK
cmVhbCAgICAxNG0xNy43NThzCnVzZXIgICAgMG04LjE3MXMKCgpUaGUgZnVsbCBsb2cgaXMgYXZh
aWxhYmxlIGF0Cmh0dHA6Ly9wYXRjaGV3Lm9yZy9sb2dzLzIwMjAwMzI2MTU1NjI4Ljg1OTg2Mi0x
LXMucmVpdGVyQHByb3htb3guY29tL3Rlc3RpbmcuZG9ja2VyLXF1aWNrQGNlbnRvczcvP3R5cGU9
bWVzc2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0
dHBzOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRjaGV3
LWRldmVsQHJlZGhhdC5jb20=

