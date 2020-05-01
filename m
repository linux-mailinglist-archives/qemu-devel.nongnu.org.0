Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4441C1C35
	for <lists+qemu-devel@lfdr.de>; Fri,  1 May 2020 19:47:18 +0200 (CEST)
Received: from localhost ([::1]:53696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jUZkr-0000T9-Cp
	for lists+qemu-devel@lfdr.de; Fri, 01 May 2020 13:47:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1jUZju-0007oz-MH
 for qemu-devel@nongnu.org; Fri, 01 May 2020 13:46:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <no-reply@patchew.org>) id 1jUZjt-0007F6-C5
 for qemu-devel@nongnu.org; Fri, 01 May 2020 13:46:18 -0400
Resent-Date: Fri, 01 May 2020 13:46:18 -0400
Resent-Message-Id: <E1jUZjt-0007F6-C5@eggs.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1jUZjs-0007Ep-RR
 for qemu-devel@nongnu.org; Fri, 01 May 2020 13:46:17 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1588355171; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=UDztodA5Zj1UWKfoHXwldoGIklEK4s/TmZaGyt+cVAaKeLXGfEHaqEwFzydoqMIVZuAPC/6WTjMs6LR1nJchB5olBNbVk36v9sNCisowPX3+MvTApn9IgXglLosTMGvxF3ETM9yahmEEskAPzcYSe05RlyY1q8QesbDU5OktZn4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1588355171;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=5/a0xRLUbIde4tBg4hI1z3JVEF2RTKZmIGzsH34k38Y=; 
 b=aP/lno/IvPUfLRzXgm9/vyrHD6OFbX+8Wmp5B0MziyLFW/GdJ+jyBCO5dMx9xabhhQR9+bEsguRMRTJMQP8YbnfjmRE+5AIWkHNnmvQqLXyvPMO8Lbm2aoz2V2+Ap6sIlBwS1tz4+8HgOpy69mVY6e8AZZs1OcvHMFnNf7Gq824=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 15883551691858.576404099790125;
 Fri, 1 May 2020 10:46:09 -0700 (PDT)
Message-ID: <158835516781.4471.5796358676733161460@45ef0f9c86ae>
In-Reply-To: <20200501172559.6470-1-alxndr@bu.edu>
Subject: Re: [PATCH] chardev: enable distinct input for -chardev file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: alxndr@bu.edu
Date: Fri, 1 May 2020 10:46:09 -0700 (PDT)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.53; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o53.zoho.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/01 13:46:14
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Received-From: 136.143.188.53
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
Cc: alxndr@bu.edu, marcandre.lureau@redhat.com, qemu-devel@nongnu.org,
 stefanha@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMDUwMTE3MjU1OS42NDcw
LTEtYWx4bmRyQGJ1LmVkdS8KCgoKSGksCgpUaGlzIHNlcmllcyBmYWlsZWQgdGhlIGRvY2tlci1x
dWlja0BjZW50b3M3IGJ1aWxkIHRlc3QuIFBsZWFzZSBmaW5kIHRoZSB0ZXN0aW5nIGNvbW1hbmRz
IGFuZAp0aGVpciBvdXRwdXQgYmVsb3cuIElmIHlvdSBoYXZlIERvY2tlciBpbnN0YWxsZWQsIHlv
dSBjYW4gcHJvYmFibHkgcmVwcm9kdWNlIGl0CmxvY2FsbHkuCgo9PT0gVEVTVCBTQ1JJUFQgQkVH
SU4gPT09CiMhL2Jpbi9iYXNoCm1ha2UgZG9ja2VyLWltYWdlLWNlbnRvczcgVj0xIE5FVFdPUks9
MQp0aW1lIG1ha2UgZG9ja2VyLXRlc3QtcXVpY2tAY2VudG9zNyBTSE9XX0VOVj0xIEo9MTQgTkVU
V09SSz0xCj09PSBURVNUIFNDUklQVCBFTkQgPT09CgpxZW11LXN5c3RlbS1hYXJjaDY0OiBmYWxs
aW5nIGJhY2sgdG8gdGNnCnNvY2tldF9hY2NlcHQgZmFpbGVkOiBSZXNvdXJjZSB0ZW1wb3Jhcmls
eSB1bmF2YWlsYWJsZQoqKgpFUlJPUjovdG1wL3FlbXUtdGVzdC9zcmMvdGVzdHMvcXRlc3QvbGli
cXRlc3QuYzozMDE6cXRlc3RfaW5pdF93aXRob3V0X3FtcF9oYW5kc2hha2U6IGFzc2VydGlvbiBm
YWlsZWQ6IChzLT5mZCA+PSAwICYmIHMtPnFtcF9mZCA+PSAwKQovdG1wL3FlbXUtdGVzdC9zcmMv
dGVzdHMvcXRlc3QvbGlicXRlc3QuYzoxNjY6IGtpbGxfcWVtdSgpIHRyaWVkIHRvIHRlcm1pbmF0
ZSBRRU1VIHByb2Nlc3MgYnV0IGVuY291bnRlcmVkIGV4aXQgc3RhdHVzIDEgKGV4cGVjdGVkIDAp
CkVSUk9SIC0gQmFpbCBvdXQhIEVSUk9SOi90bXAvcWVtdS10ZXN0L3NyYy90ZXN0cy9xdGVzdC9s
aWJxdGVzdC5jOjMwMTpxdGVzdF9pbml0X3dpdGhvdXRfcW1wX2hhbmRzaGFrZTogYXNzZXJ0aW9u
IGZhaWxlZDogKHMtPmZkID49IDAgJiYgcy0+cW1wX2ZkID49IDApCm1ha2U6ICoqKiBbY2hlY2st
cXRlc3QteDg2XzY0XSBFcnJvciAxCm1ha2U6ICoqKiBXYWl0aW5nIGZvciB1bmZpbmlzaGVkIGpv
YnMuLi4uCiAgVEVTVCAgICBpb3Rlc3QtcWNvdzI6IDA2MApxZW11LXN5c3RlbS1hYXJjaDY0OiAt
YWNjZWwga3ZtOiBpbnZhbGlkIGFjY2VsZXJhdG9yIGt2bQotLS0KICBURVNUICAgIGlvdGVzdC1x
Y293MjogMTU4CnNvY2tldF9hY2NlcHQgZmFpbGVkOiBSZXNvdXJjZSB0ZW1wb3JhcmlseSB1bmF2
YWlsYWJsZQoqKgpFUlJPUjovdG1wL3FlbXUtdGVzdC9zcmMvdGVzdHMvcXRlc3QvbGlicXRlc3Qu
YzozMDE6cXRlc3RfaW5pdF93aXRob3V0X3FtcF9oYW5kc2hha2U6IGFzc2VydGlvbiBmYWlsZWQ6
IChzLT5mZCA+PSAwICYmIHMtPnFtcF9mZCA+PSAwKQovdG1wL3FlbXUtdGVzdC9zcmMvdGVzdHMv
cXRlc3QvbGlicXRlc3QuYzoxNjY6IGtpbGxfcWVtdSgpIHRyaWVkIHRvIHRlcm1pbmF0ZSBRRU1V
IHByb2Nlc3MgYnV0IGVuY291bnRlcmVkIGV4aXQgc3RhdHVzIDEgKGV4cGVjdGVkIDApCkVSUk9S
IC0gQmFpbCBvdXQhIEVSUk9SOi90bXAvcWVtdS10ZXN0L3NyYy90ZXN0cy9xdGVzdC9saWJxdGVz
dC5jOjMwMTpxdGVzdF9pbml0X3dpdGhvdXRfcW1wX2hhbmRzaGFrZTogYXNzZXJ0aW9uIGZhaWxl
ZDogKHMtPmZkID49IDAgJiYgcy0+cW1wX2ZkID49IDApCm1ha2U6ICoqKiBbY2hlY2stcXRlc3Qt
YWFyY2g2NF0gRXJyb3IgMQogIFRFU1QgICAgaW90ZXN0LXFjb3cyOiAxNTkKICBURVNUICAgIGlv
dGVzdC1xY293MjogMTYxCiAgVEVTVCAgICBpb3Rlc3QtcWNvdzI6IDE3MAotLS0KICAgIHJhaXNl
IENhbGxlZFByb2Nlc3NFcnJvcihyZXRjb2RlLCBjbWQpCnN1YnByb2Nlc3MuQ2FsbGVkUHJvY2Vz
c0Vycm9yOiBDb21tYW5kICdbJ3N1ZG8nLCAnLW4nLCAnZG9ja2VyJywgJ3J1bicsICctLWxhYmVs
JywgJ2NvbS5xZW11Lmluc3RhbmNlLnV1aWQ9ODliNjQ2YjcxMDE2NDU1NGE0Zjk1YzA4NzRhOTZl
NzMnLCAnLXUnLCAnMTAwMScsICctLXNlY3VyaXR5LW9wdCcsICdzZWNjb21wPXVuY29uZmluZWQn
LCAnLS1ybScsICctZScsICdUQVJHRVRfTElTVD0nLCAnLWUnLCAnRVhUUkFfQ09ORklHVVJFX09Q
VFM9JywgJy1lJywgJ1Y9JywgJy1lJywgJ0o9MTQnLCAnLWUnLCAnREVCVUc9JywgJy1lJywgJ1NI
T1dfRU5WPTEnLCAnLWUnLCAnQ0NBQ0hFX0RJUj0vdmFyL3RtcC9jY2FjaGUnLCAnLXYnLCAnL2hv
bWUvcGF0Y2hldy8uY2FjaGUvcWVtdS1kb2NrZXItY2NhY2hlOi92YXIvdG1wL2NjYWNoZTp6Jywg
Jy12JywgJy92YXIvdG1wL3BhdGNoZXctdGVzdGVyLXRtcC00NXM2ZWNjYi9zcmMvZG9ja2VyLXNy
Yy4yMDIwLTA1LTAxLTEzLjMxLjQ5LjI4ODk1Oi92YXIvdG1wL3FlbXU6eixybycsICdxZW11OmNl
bnRvczcnLCAnL3Zhci90bXAvcWVtdS9ydW4nLCAndGVzdC1xdWljayddJyByZXR1cm5lZCBub24t
emVybyBleGl0IHN0YXR1cyAyLgpmaWx0ZXI9LS1maWx0ZXI9bGFiZWw9Y29tLnFlbXUuaW5zdGFu
Y2UudXVpZD04OWI2NDZiNzEwMTY0NTU0YTRmOTVjMDg3NGE5NmU3MwptYWtlWzFdOiAqKiogW2Rv
Y2tlci1ydW5dIEVycm9yIDEKbWFrZVsxXTogTGVhdmluZyBkaXJlY3RvcnkgYC92YXIvdG1wL3Bh
dGNoZXctdGVzdGVyLXRtcC00NXM2ZWNjYi9zcmMnCm1ha2U6ICoqKiBbZG9ja2VyLXJ1bi10ZXN0
LXF1aWNrQGNlbnRvczddIEVycm9yIDIKCnJlYWwgICAgMTRtMTguNDQzcwp1c2VyICAgIDBtOS4x
MzVzCgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hldy5vcmcvbG9n
cy8yMDIwMDUwMTE3MjU1OS42NDcwLTEtYWx4bmRyQGJ1LmVkdS90ZXN0aW5nLmRvY2tlci1xdWlj
a0BjZW50b3M3Lz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGljYWxs
eSBieSBQYXRjaGV3IFtodHRwczovL3BhdGNoZXcub3JnL10uClBsZWFzZSBzZW5kIHlvdXIgZmVl
ZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29t

