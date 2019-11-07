Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 240E5F31D9
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Nov 2019 15:56:01 +0100 (CET)
Received: from localhost ([::1]:43796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iSjCa-0008NO-3P
	for lists+qemu-devel@lfdr.de; Thu, 07 Nov 2019 09:56:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51308)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <no-reply@patchew.org>) id 1iSj3z-0000Nu-Mu
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 09:47:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <no-reply@patchew.org>) id 1iSj3u-00085p-Hn
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 09:47:04 -0500
Resent-Date: Thu, 07 Nov 2019 09:47:03 -0500
Resent-Message-Id: <E1iSj3u-00085p-Hn@eggs.gnu.org>
Received: from sender4-of-o54.zoho.com ([136.143.188.54]:21402)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <no-reply@patchew.org>)
 id 1iSj3u-00081R-9a
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 09:47:02 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1573138014; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=BLQUT31bmkz0/lNooPVI/s+K4TjnL/AeXxWsk11df9gT4UK3tt7ImjQBL1Z0SKXihPdoQedf4zH5P8O7vWrbqSKu8OLqwFAg4NS1YbUWjvim7v1B5/RhGdcmw7cdA5FHPOC5743QCl8u4Y6+J/9Qim1iOUclroNNaUOk0RVsMtM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1573138014;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=BhBaygzwc0BBKF6FN1iAyh85y8BmOsnG/Yvj+viR5CE=; 
 b=HcuzLAUlHYjHCk0efX+QndzyFDKx3UJ/CJLAPrbgzbSgQnoTwTw2nnFEtiXmq8km+oGkn5CMwyMluZO30EiyFyesnoFW9a1qkwQn74kEy1421qm8e3fgs3q6qX82hDYT4W4hVji934W83FqolXrmB14WjAIX3BoOOhEBykONjvE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=patchew.org;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1573138012058230.54973871838547;
 Thu, 7 Nov 2019 06:46:52 -0800 (PST)
In-Reply-To: <20191107142613.2379-1-robert.foley@linaro.org>
Subject: Re: [PATCH 0/4] Make the qemu_logfile handle thread safe.
Message-ID: <157313801088.31898.2951120289072713083@37313f22b938>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: robert.foley@linaro.org
Date: Thu, 7 Nov 2019 06:46:52 -0800 (PST)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 136.143.188.54
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
Cc: peter.puhov@linaro.org, alex.bennee@linaro.org, qemu-devel@nongnu.org,
 robert.foley@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDE5MTEwNzE0MjYxMy4yMzc5
LTEtcm9iZXJ0LmZvbGV5QGxpbmFyby5vcmcvCgoKCkhpLAoKVGhpcyBzZXJpZXMgZmFpbGVkIHRo
ZSBkb2NrZXItcXVpY2tAY2VudG9zNyBidWlsZCB0ZXN0LiBQbGVhc2UgZmluZCB0aGUgdGVzdGlu
ZyBjb21tYW5kcyBhbmQKdGhlaXIgb3V0cHV0IGJlbG93LiBJZiB5b3UgaGF2ZSBEb2NrZXIgaW5z
dGFsbGVkLCB5b3UgY2FuIHByb2JhYmx5IHJlcHJvZHVjZSBpdApsb2NhbGx5LgoKPT09IFRFU1Qg
U0NSSVBUIEJFR0lOID09PQojIS9iaW4vYmFzaAptYWtlIGRvY2tlci1pbWFnZS1jZW50b3M3IFY9
MSBORVRXT1JLPTEKdGltZSBtYWtlIGRvY2tlci10ZXN0LXF1aWNrQGNlbnRvczcgU0hPV19FTlY9
MSBKPTE0IE5FVFdPUks9MQo9PT0gVEVTVCBTQ1JJUFQgRU5EID09PQoKICBURVNUICAgIGNoZWNr
LXVuaXQ6IHRlc3RzL3Rlc3QtaGJpdG1hcAogIFRFU1QgICAgY2hlY2stdW5pdDogdGVzdHMvdGVz
dC1iZHJ2LWRyYWluCnRlc3QtYmRydi1kcmFpbjogL3RtcC9xZW11LXRlc3Qvc3JjL3V0aWwvYXN5
bmMuYzoyODM6IGFpb19jdHhfZmluYWxpemU6IEFzc2VydGlvbiBgIXFlbXVfbG9ja2NudF9jb3Vu
dCgmY3R4LT5saXN0X2xvY2spJyBmYWlsZWQuCkVSUk9SIC0gdG9vIGZldyB0ZXN0cyBydW4gKGV4
cGVjdGVkIDQyLCBnb3QgMTcpCm1ha2U6ICoqKiBbY2hlY2stdW5pdF0gRXJyb3IgMQptYWtlOiAq
KiogV2FpdGluZyBmb3IgdW5maW5pc2hlZCBqb2JzLi4uLgogIFRFU1QgICAgaW90ZXN0LXFjb3cy
OiAwMTMKICBURVNUICAgIGlvdGVzdC1xY293MjogMDE3Ci0tLQogICAgcmFpc2UgQ2FsbGVkUHJv
Y2Vzc0Vycm9yKHJldGNvZGUsIGNtZCkKc3VicHJvY2Vzcy5DYWxsZWRQcm9jZXNzRXJyb3I6IENv
bW1hbmQgJ1snc3VkbycsICctbicsICdkb2NrZXInLCAncnVuJywgJy0tbGFiZWwnLCAnY29tLnFl
bXUuaW5zdGFuY2UudXVpZD1lYWE1N2UzNDQ5ZmI0MzNlYmRlMGVjZWI5ZDA1YjZjMicsICctdScs
ICcxMDAzJywgJy0tc2VjdXJpdHktb3B0JywgJ3NlY2NvbXA9dW5jb25maW5lZCcsICctLXJtJywg
Jy1lJywgJ1RBUkdFVF9MSVNUPScsICctZScsICdFWFRSQV9DT05GSUdVUkVfT1BUUz0nLCAnLWUn
LCAnVj0nLCAnLWUnLCAnSj0xNCcsICctZScsICdERUJVRz0nLCAnLWUnLCAnU0hPV19FTlY9MScs
ICctZScsICdDQ0FDSEVfRElSPS92YXIvdG1wL2NjYWNoZScsICctdicsICcvaG9tZS9wYXRjaGV3
Mi8uY2FjaGUvcWVtdS1kb2NrZXItY2NhY2hlOi92YXIvdG1wL2NjYWNoZTp6JywgJy12JywgJy92
YXIvdG1wL3BhdGNoZXctdGVzdGVyLXRtcC14dzQzbDF6cS9zcmMvZG9ja2VyLXNyYy4yMDE5LTEx
LTA3LTA5LjM0LjA5LjI1MzQxOi92YXIvdG1wL3FlbXU6eixybycsICdxZW11OmNlbnRvczcnLCAn
L3Zhci90bXAvcWVtdS9ydW4nLCAndGVzdC1xdWljayddJyByZXR1cm5lZCBub24temVybyBleGl0
IHN0YXR1cyAyLgpmaWx0ZXI9LS1maWx0ZXI9bGFiZWw9Y29tLnFlbXUuaW5zdGFuY2UudXVpZD1l
YWE1N2UzNDQ5ZmI0MzNlYmRlMGVjZWI5ZDA1YjZjMgptYWtlWzFdOiAqKiogW2RvY2tlci1ydW5d
IEVycm9yIDEKbWFrZVsxXTogTGVhdmluZyBkaXJlY3RvcnkgYC92YXIvdG1wL3BhdGNoZXctdGVz
dGVyLXRtcC14dzQzbDF6cS9zcmMnCm1ha2U6ICoqKiBbZG9ja2VyLXJ1bi10ZXN0LXF1aWNrQGNl
bnRvczddIEVycm9yIDIKCnJlYWwgICAgMTJtMzkuODMzcwp1c2VyICAgIDBtOC4xMzdzCgoKVGhl
IGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8yMDE5MTEw
NzE0MjYxMy4yMzc5LTEtcm9iZXJ0LmZvbGV5QGxpbmFyby5vcmcvdGVzdGluZy5kb2NrZXItcXVp
Y2tAY2VudG9zNy8/dHlwZT1tZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2Fs
bHkgYnkgUGF0Y2hldyBbaHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZl
ZWRiYWNrIHRvIHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==


