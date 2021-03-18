Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A518A340AF3
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 18:05:21 +0100 (CET)
Received: from localhost ([::1]:51702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMw5B-0005BK-Ab
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 13:05:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lMw20-0003Tk-Ip; Thu, 18 Mar 2021 13:01:56 -0400
Resent-Date: Thu, 18 Mar 2021 13:01:56 -0400
Resent-Message-Id: <E1lMw20-0003Tk-Ip@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lMw1x-0004xO-O4; Thu, 18 Mar 2021 13:01:55 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1616086866; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=EJ+9m2+AtWfO9qQkOE91S+z6tvKRcn89yUSktQeYi4nlAD2L1bfgMT2rXSF9mztgacSBzSo7Z28CWysShPBHPzNkgRkVk5vukpJ+m7fgN9JbrRnLnyTuzaRDeaxCuDYCgdwEKqxYJq3sa72p1tjh28ARBpN/KFqYnNzex2xZ9pg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1616086866;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=4GhT5LkNR6dEXEjPI84m4jM8vKqXDiUBODkQpb+DRGI=; 
 b=d2410iLCgkgy+SS4y3z9HSHkDpET+9DjsPYRoBRVa8sc7FQVAlQNbHk2Cs/ksBoFS8sucUqb63q33a9NyfcRHlwrE4BYI8fbPJMlkhl2pedTjoEGJLxNXFhBLN8IwXkmir0EpQhKS8WB0ceMAcU8Q7hSQLesFSmiymDqBtylSMQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1616086851681952.2075116199604;
 Thu, 18 Mar 2021 10:00:51 -0700 (PDT)
In-Reply-To: <1616084984-11263-1-git-send-email-jonah.palmer@oracle.com>
Subject: Re: [RFC v5 0/6] hmp,
 qmp: Add some commands to introspect virtio deices
Message-ID: <161608684853.13388.7830738652097458588@c9d4d6fbb2f1>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: jonah.palmer@oracle.com
Date: Thu, 18 Mar 2021 10:00:51 -0700 (PDT)
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
Cc: fam@euphon.net, mst@redhat.com, jasowang@redhat.com, qemu-devel@nongnu.org,
 kraxel@redhat.com, si-wei.liu@oracle.com, joao.m.martins@oracle.com,
 qemu-block@nongnu.org, david@redhat.com, armbru@redhat.com,
 marcandre.lureau@redhat.com, jonah.palmer@oracle.com, thuth@redhat.com,
 amit@kernel.org, michael.roth@amd.com, dgilbert@redhat.com,
 eric.auger@redhat.com, dmitrii.stepanov@cloud.ionos.com, stefanha@redhat.com,
 kwolf@redhat.com, laurent@vivier.eu, mreitz@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8xNjE2MDg0OTg0LTExMjYzLTEt
Z2l0LXNlbmQtZW1haWwtam9uYWgucGFsbWVyQG9yYWNsZS5jb20vCgoKCkhpLAoKVGhpcyBzZXJp
ZXMgc2VlbXMgdG8gaGF2ZSBzb21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBi
ZWxvdyBmb3IKbW9yZSBpbmZvcm1hdGlvbjoKClR5cGU6IHNlcmllcwpNZXNzYWdlLWlkOiAxNjE2
MDg0OTg0LTExMjYzLTEtZ2l0LXNlbmQtZW1haWwtam9uYWgucGFsbWVyQG9yYWNsZS5jb20KU3Vi
amVjdDogW1JGQyB2NSAwLzZdIGhtcCxxbXA6IEFkZCBzb21lIGNvbW1hbmRzIHRvIGludHJvc3Bl
Y3QgdmlydGlvIGRlaWNlcwoKPT09IFRFU1QgU0NSSVBUIEJFR0lOID09PQojIS9iaW4vYmFzaApn
aXQgcmV2LXBhcnNlIGJhc2UgPiAvZGV2L251bGwgfHwgZXhpdCAwCmdpdCBjb25maWcgLS1sb2Nh
bCBkaWZmLnJlbmFtZWxpbWl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lcyBUcnVl
CmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLmFsZ29yaXRobSBoaXN0b2dyYW0KLi9zY3JpcHRzL2No
ZWNrcGF0Y2gucGwgLS1tYWlsYmFjayBiYXNlLi4KPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KClVw
ZGF0aW5nIDNjOGNmNWE5YzIxZmY4NzgyMTY0ZDFkZWY3ZjQ0YmQ4ODg3MTMzODQKRnJvbSBodHRw
czovL2dpdGh1Yi5jb20vcGF0Y2hldy1wcm9qZWN0L3FlbXUKICogW25ldyB0YWddICAgICAgICAg
cGF0Y2hldy8xNjE2MDg0OTg0LTExMjYzLTEtZ2l0LXNlbmQtZW1haWwtam9uYWgucGFsbWVyQG9y
YWNsZS5jb20gLT4gcGF0Y2hldy8xNjE2MDg0OTg0LTExMjYzLTEtZ2l0LXNlbmQtZW1haWwtam9u
YWgucGFsbWVyQG9yYWNsZS5jb20KU3dpdGNoZWQgdG8gYSBuZXcgYnJhbmNoICd0ZXN0JwpiZTcw
NTQ2IGhtcDogYWRkIHZpcnRpbyBjb21tYW5kcwplNGY4MTkwIHFtcDogYWRkIFFNUCBjb21tYW5k
IHgtZGVidWctdmlydGlvLXF1ZXVlLWVsZW1lbnQKMzMxMzk2OCBxbXA6IGFkZCBRTVAgY29tbWFu
ZCB4LWRlYnVnLXZpcnRpby1xdWV1ZS1zdGF0dXMKOGUxNTE3ZiBxbXA6IGRlY29kZSBmZWF0dXJl
IGJpdHMgaW4gdmlydGlvLXN0YXR1cwplOGM4MGZiIHFtcDogYWRkIFFNUCBjb21tYW5kIHgtZGVi
dWctdmlydGlvLXN0YXR1cwo4YjQ2Y2RkIHFtcDogYWRkIFFNUCBjb21tYW5kIHgtZGVidWctcXVl
cnktdmlydGlvCgo9PT0gT1VUUFVUIEJFR0lOID09PQoxLzYgQ2hlY2tpbmcgY29tbWl0IDhiNDZj
ZGQ5MDM3ZCAocW1wOiBhZGQgUU1QIGNvbW1hbmQgeC1kZWJ1Zy1xdWVyeS12aXJ0aW8pClVzZSBv
ZiB1bmluaXRpYWxpemVkIHZhbHVlICRhY3BpX3Rlc3RleHBlY3RlZCBpbiBzdHJpbmcgZXEgYXQg
Li9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgbGluZSAxNTI5LgpXQVJOSU5HOiBhZGRlZCwgbW92ZWQg
b3IgZGVsZXRlZCBmaWxlKHMpLCBkb2VzIE1BSU5UQUlORVJTIG5lZWQgdXBkYXRpbmc/CiM0MTog
Cm5ldyBmaWxlIG1vZGUgMTAwNjQ0Cgp0b3RhbDogMCBlcnJvcnMsIDEgd2FybmluZ3MsIDE4MyBs
aW5lcyBjaGVja2VkCgpQYXRjaCAxLzYgaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3
LiAgSWYgYW55IG9mIHRoZXNlIGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVt
IHRvIHRoZSBtYWludGFpbmVyLCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KMi82IENo
ZWNraW5nIGNvbW1pdCBlOGM4MGZiMDA1NmEgKHFtcDogYWRkIFFNUCBjb21tYW5kIHgtZGVidWct
dmlydGlvLXN0YXR1cykKMy82IENoZWNraW5nIGNvbW1pdCA4ZTE1MTdmMmFiZDcgKHFtcDogZGVj
b2RlIGZlYXR1cmUgYml0cyBpbiB2aXJ0aW8tc3RhdHVzKQo0LzYgQ2hlY2tpbmcgY29tbWl0IDMz
MTM5Njg0OTRkNiAocW1wOiBhZGQgUU1QIGNvbW1hbmQgeC1kZWJ1Zy12aXJ0aW8tcXVldWUtc3Rh
dHVzKQo1LzYgQ2hlY2tpbmcgY29tbWl0IGU0ZjgxOTBlOWEyNCAocW1wOiBhZGQgUU1QIGNvbW1h
bmQgeC1kZWJ1Zy12aXJ0aW8tcXVldWUtZWxlbWVudCkKNi82IENoZWNraW5nIGNvbW1pdCBiZTcw
NTQ2ODY4NWYgKGhtcDogYWRkIHZpcnRpbyBjb21tYW5kcykKVXNlIG9mIHVuaW5pdGlhbGl6ZWQg
dmFsdWUgJGFjcGlfdGVzdGV4cGVjdGVkIGluIHN0cmluZyBlcSBhdCAuL3NjcmlwdHMvY2hlY2tw
YXRjaC5wbCBsaW5lIDE1MjkuCldBUk5JTkc6IGFkZGVkLCBtb3ZlZCBvciBkZWxldGVkIGZpbGUo
cyksIGRvZXMgTUFJTlRBSU5FUlMgbmVlZCB1cGRhdGluZz8KIzM5OiAKbmV3IGZpbGUgbW9kZSAx
MDA2NDQKCldBUk5JTkc6IGxpbmUgb3ZlciA4MCBjaGFyYWN0ZXJzCiMzMDY6IEZJTEU6IGh3L3Zp
cnRpby92aXJ0aW8uYzo0MDE2OgorICAgIG1vbml0b3JfcHJpbnRmKG1vbiwgIiAgc2lnbmFsbGVk
X3VzZWRfdmFsaWQ6ICVkXG4iLCBzLT5zaWduYWxsZWRfdXNlZF92YWxpZCk7CgpFUlJPUjogImZv
byAqIGJhciIgc2hvdWxkIGJlICJmb28gKmJhciIKIzMzMDogRklMRTogaHcvdmlydGlvL3ZpcnRp
by5jOjQxNjQ6CisgICAgICAgIHR5cGUjI0ZlYXR1cmVMaXN0ICogbGlzdCA9IGZlYXR1cmVzLT51
LmZpZWxkLmZlYXR1cmVzOyAgICAgICAgICAgICAgXAoKdG90YWw6IDEgZXJyb3JzLCAyIHdhcm5p
bmdzLCA0NzMgbGluZXMgY2hlY2tlZAoKUGF0Y2ggNi82IGhhcyBzdHlsZSBwcm9ibGVtcywgcGxl
YXNlIHJldmlldy4gIElmIGFueSBvZiB0aGVzZSBlcnJvcnMKYXJlIGZhbHNlIHBvc2l0aXZlcyBy
ZXBvcnQgdGhlbSB0byB0aGUgbWFpbnRhaW5lciwgc2VlCkNIRUNLUEFUQ0ggaW4gTUFJTlRBSU5F
UlMuCgo9PT0gT1VUUFVUIEVORCA9PT0KClRlc3QgY29tbWFuZCBleGl0ZWQgd2l0aCBjb2RlOiAx
CgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8x
NjE2MDg0OTg0LTExMjYzLTEtZ2l0LXNlbmQtZW1haWwtam9uYWgucGFsbWVyQG9yYWNsZS5jb20v
dGVzdGluZy5jaGVja3BhdGNoLz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0
b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRwczovL3BhdGNoZXcub3JnL10uClBsZWFzZSBzZW5k
IHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29t

