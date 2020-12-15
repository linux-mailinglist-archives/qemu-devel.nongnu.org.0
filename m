Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2F02DB6AC
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 23:53:56 +0100 (CET)
Received: from localhost ([::1]:40364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpJCd-0008Pt-Q2
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 17:53:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kpJAn-00074Q-2k
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 17:52:01 -0500
Resent-Date: Tue, 15 Dec 2020 17:52:01 -0500
Resent-Message-Id: <E1kpJAn-00074Q-2k@lists.gnu.org>
Received: from sender4-of-o56.zoho.com ([136.143.188.56]:21654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kpJAk-0001cg-Bt
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 17:52:00 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1608072709; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=g5pKSEKLX2SiLDMxzp9TUtvijNhNZJNqKuqLgxTxz1hEeGA3XywTjpAO8Uu0IwEGQNqDrdAonF56PmvV4rcrkuYjHgW+Ml08j2dU5NPH4nms/xZCtC7prshKuzEjMZvRWln9uCoL2ZkyzVAu5MceeVyr3cXdqbmmc9PaVC0lfEA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1608072709;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=AF/2UFc4+F60Ts3wC/bAyiUJIwWH1gqSicsAAzEoff0=; 
 b=S9xlFMa95IpnRxW0teB55JuHKVScpli/a17+5cE39vgWtz3MYsfbbKv6CU/d10qt1rWu32RaqJtODqkH6yy2atn6XdXpth9SaVgZFhYnjUsYdCM3W26aunlF4Rbfr9EnitqPJ8RBjTq7NWpyvZ0rPw6CccCdXiep3Wpzkg+v++E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1608072707779351.811107104165;
 Tue, 15 Dec 2020 14:51:47 -0800 (PST)
In-Reply-To: <20201215162119.27360-1-zhangjiachen.jaycee@bytedance.com>
Subject: Re: [RFC PATCH 0/9] Support for Virtio-fs daemon crash reconnection
Message-ID: <160807270606.22417.16185751154858977764@600e7e483b3a>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: zhangjiachen.jaycee@bytedance.com
Date: Tue, 15 Dec 2020 14:51:47 -0800 (PST)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.56; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o56.zoho.com
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
Cc: mst@redhat.com, dgilbert@redhat.com, qemu-devel@nongnu.org,
 virtio-fs@redhat.com, xieyongji@bytedance.com,
 zhangjiachen.jaycee@bytedance.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMTIxNTE2MjExOS4yNzM2
MC0xLXpoYW5namlhY2hlbi5qYXljZWVAYnl0ZWRhbmNlLmNvbS8KCgoKSGksCgpUaGlzIHNlcmll
cyBzZWVtcyB0byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJl
bG93IGZvcgptb3JlIGluZm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1lc3NhZ2UtaWQ6IDIwMjAx
MjE1MTYyMTE5LjI3MzYwLTEtemhhbmdqaWFjaGVuLmpheWNlZUBieXRlZGFuY2UuY29tClN1Ympl
Y3Q6IFtSRkMgUEFUQ0ggMC85XSBTdXBwb3J0IGZvciBWaXJ0aW8tZnMgZGFlbW9uIGNyYXNoIHJl
Y29ubmVjdGlvbgoKPT09IFRFU1QgU0NSSVBUIEJFR0lOID09PQojIS9iaW4vYmFzaApnaXQgcmV2
LXBhcnNlIGJhc2UgPiAvZGV2L251bGwgfHwgZXhpdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZm
LnJlbmFtZWxpbWl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lcyBUcnVlCmdpdCBj
b25maWcgLS1sb2NhbCBkaWZmLmFsZ29yaXRobSBoaXN0b2dyYW0KLi9zY3JpcHRzL2NoZWNrcGF0
Y2gucGwgLS1tYWlsYmFjayBiYXNlLi4KPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KClVwZGF0aW5n
IDNjOGNmNWE5YzIxZmY4NzgyMTY0ZDFkZWY3ZjQ0YmQ4ODg3MTMzODQKRnJvbSBodHRwczovL2dp
dGh1Yi5jb20vcGF0Y2hldy1wcm9qZWN0L3FlbXUKICogW25ldyB0YWddICAgICAgICAgcGF0Y2hl
dy8yMDIwMTIxNTE2MjExOS4yNzM2MC0xLXpoYW5namlhY2hlbi5qYXljZWVAYnl0ZWRhbmNlLmNv
bSAtPiBwYXRjaGV3LzIwMjAxMjE1MTYyMTE5LjI3MzYwLTEtemhhbmdqaWFjaGVuLmpheWNlZUBi
eXRlZGFuY2UuY29tCiAqIFtuZXcgdGFnXSAgICAgICAgIHBhdGNoZXcvMjAyMDEyMTUxNzQ4MjQu
NzYwMTctMS1yaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnIC0+IHBhdGNoZXcvMjAyMDEyMTUx
NzQ4MjQuNzYwMTctMS1yaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnClN3aXRjaGVkIHRvIGEg
bmV3IGJyYW5jaCAndGVzdCcKYzYwMTVmNiB2aXJ0aW9mc2Q6ICh3b3JrIGFyb3VuZCkgQ29tbWVu
dCBxc29ydCBpbiBpbmZsaWdodCBJL08gdHJhY2tpbmcKYTI4NTM1NyB2aXJ0aW9mc2Q6IEVuc3Vy
ZSBjcmFzaCBjb25zaXN0ZW5jeSBhZnRlciByZWNvbm5lY3Rpb24KZDVmNjljOCB2aXJ0aW9mc2Q6
IFBlcnNpc3QvcmVzdG9yZSBsb19tYXAgYW5kIG9wZW5lZCBmZHMgdG8vZnJvbSBRRU1VCjRlMGE1
NmQgdmlydGlvZnNkOiBBZGQgdHdvIG5ldyBvcHRpb25zIGZvciBjcmFzaCByZWNvbm5lY3Rpb24K
ZDRiNjM4ZSB2aXJ0aW9mc2Q6IENvbnZlcnQgdGhlIHN0cnVjdCBsb19tYXAgYXJyYXkgdG8gYSBt
b3JlIGZsYXR0ZW4gbGF5b3V0CjZkYWRlYzIgbGlidmhvc3QtdXNlcjogQWRkIHZob3N0LXVzZXIg
bWVzc2FnZSB0eXBlcyBmb3Igc2VuZGluZyBzaGFyZWQgbWVtb3J5IGFuZCBmaWxlIGZkcwo5MWYy
NjViIHZob3N0LXVzZXItZnM6IFN1cHBvcnQgdmlydGlvZnNkIGNyYXNoIHJlY29ubmVjdGlvbgpi
YjU4N2VhIHZob3N0OiBBZGQgdmhvc3QtdXNlciBtZXNzYWdlIHR5cGVzIGZvciBzZW5kaW5nIHNo
YXJlZCBtZW1vcnkgYW5kIGZpbGUgZmRzCmNjYjhlY2Egdmhvc3QtdXNlci1mczogQWRkIHN1cHBv
cnQgZm9yIHJlY29ubmVjdGlvbiBvZiB2aG9zdC11c2VyLWZzIGJhY2tlbmQKCj09PSBPVVRQVVQg
QkVHSU4gPT09CjEvOSBDaGVja2luZyBjb21taXQgY2NiOGVjYTM4ZjU1ICh2aG9zdC11c2VyLWZz
OiBBZGQgc3VwcG9ydCBmb3IgcmVjb25uZWN0aW9uIG9mIHZob3N0LXVzZXItZnMgYmFja2VuZCkK
Mi85IENoZWNraW5nIGNvbW1pdCBiYjU4N2VhZjU1NmUgKHZob3N0OiBBZGQgdmhvc3QtdXNlciBt
ZXNzYWdlIHR5cGVzIGZvciBzZW5kaW5nIHNoYXJlZCBtZW1vcnkgYW5kIGZpbGUgZmRzKQozLzkg
Q2hlY2tpbmcgY29tbWl0IDkxZjI2NWI1NWIxMiAodmhvc3QtdXNlci1mczogU3VwcG9ydCB2aXJ0
aW9mc2QgY3Jhc2ggcmVjb25uZWN0aW9uKQo0LzkgQ2hlY2tpbmcgY29tbWl0IDZkYWRlYzIyNmQw
NSAobGlidmhvc3QtdXNlcjogQWRkIHZob3N0LXVzZXIgbWVzc2FnZSB0eXBlcyBmb3Igc2VuZGlu
ZyBzaGFyZWQgbWVtb3J5IGFuZCBmaWxlIGZkcykKNS85IENoZWNraW5nIGNvbW1pdCBkNGI2Mzhl
MzQyNDIgKHZpcnRpb2ZzZDogQ29udmVydCB0aGUgc3RydWN0IGxvX21hcCBhcnJheSB0byBhIG1v
cmUgZmxhdHRlbiBsYXlvdXQpCkVSUk9SOiB1c2UgcWVtdV9yZWFsX2hvc3RfcGFnZV9zaXplIGlu
c3RlYWQgb2YgZ2V0cGFnZXNpemUoKQojMTk1OiBGSUxFOiB0b29scy92aXJ0aW9mc2QvcGFzc3Ro
cm91Z2hfbGwuYzozODM6CisgICAgaW50IHBhZ2Vfc2l6ZSA9IGdldHBhZ2VzaXplKCk7Cgp0b3Rh
bDogMSBlcnJvcnMsIDAgd2FybmluZ3MsIDk5NyBsaW5lcyBjaGVja2VkCgpQYXRjaCA1LzkgaGFz
IHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55IG9mIHRoZXNlIGVycm9ycwph
cmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBtYWludGFpbmVyLCBzZWUKQ0hF
Q0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KCjYvOSBDaGVja2luZyBjb21taXQgNGUwYTU2ZDAyMTdk
ICh2aXJ0aW9mc2Q6IEFkZCB0d28gbmV3IG9wdGlvbnMgZm9yIGNyYXNoIHJlY29ubmVjdGlvbikK
Ny85IENoZWNraW5nIGNvbW1pdCBkNWY2OWM4NDY1YWMgKHZpcnRpb2ZzZDogUGVyc2lzdC9yZXN0
b3JlIGxvX21hcCBhbmQgb3BlbmVkIGZkcyB0by9mcm9tIFFFTVUpCjgvOSBDaGVja2luZyBjb21t
aXQgYTI4NTM1N2M3YmZmICh2aXJ0aW9mc2Q6IEVuc3VyZSBjcmFzaCBjb25zaXN0ZW5jeSBhZnRl
ciByZWNvbm5lY3Rpb24pCjkvOSBDaGVja2luZyBjb21taXQgYzYwMTVmNjAyZmIwICh2aXJ0aW9m
c2Q6ICh3b3JrIGFyb3VuZCkgQ29tbWVudCBxc29ydCBpbiBpbmZsaWdodCBJL08gdHJhY2tpbmcp
Cj09PSBPVVRQVVQgRU5EID09PQoKVGVzdCBjb21tYW5kIGV4aXRlZCB3aXRoIGNvZGU6IDEKCgpU
aGUgZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0dHA6Ly9wYXRjaGV3Lm9yZy9sb2dzLzIwMjAx
MjE1MTYyMTE5LjI3MzYwLTEtemhhbmdqaWFjaGVuLmpheWNlZUBieXRlZGFuY2UuY29tL3Rlc3Rp
bmcuY2hlY2twYXRjaC8/dHlwZT1tZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRp
Y2FsbHkgYnkgUGF0Y2hldyBbaHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3Vy
IGZlZWRiYWNrIHRvIHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==

