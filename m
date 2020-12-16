Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BADC82DC3CE
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 17:15:25 +0100 (CET)
Received: from localhost ([::1]:56130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpZSW-0004wJ-Qv
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 11:15:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kpZN4-000894-UO
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:09:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kpZN2-0004fW-Af
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:09:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608134983;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RHtbWKrNnLqKWNmeW4kVS2g/BYQBgIgc0+Chp7Q5jgk=;
 b=IbHCui1lOqw3coWbvNnRf6Kdzmy8XteJCFMVlkdYCH7g58mV3+vS4gsSFqd6X2uHaiBgt/
 XlzMEIxnQv3hwG5pdshom0t1QffHnK4Sb2/zk8dgK/f5IGngxez4ea/bHNDAp5k5enlcT0
 1crn7gQ8xXcIjgkP7ztXOenvPpiKHTo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-12-gLyDFBUtMOqERtJKbLTX6g-1; Wed, 16 Dec 2020 11:09:41 -0500
X-MC-Unique: gLyDFBUtMOqERtJKbLTX6g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B68E3192202C;
 Wed, 16 Dec 2020 16:09:40 +0000 (UTC)
Received: from localhost (ovpn-115-151.ams2.redhat.com [10.36.115.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4BDEB1E5;
 Wed, 16 Dec 2020 16:09:37 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/3] trace: recommend "log" backend for getting started
 with tracing
Date: Wed, 16 Dec 2020 16:09:23 +0000
Message-Id: <20201216160923.722894-4-stefanha@redhat.com>
In-Reply-To: <20201216160923.722894-1-stefanha@redhat.com>
References: <20201216160923.722894-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VGhlICJzaW1wbGUiIGJhY2tlbmQgaXMgYWN0dWFsbHkgbW9yZSBjb21wbGljYXRlZCB0byB1c2Ug
dGhhbiB0aGUgImxvZyIKYmFja2VuZC4gVXBkYXRlIHRoZSBxdWlja3N0YXJ0IGRvY3VtZW50YXRp
b24gdG8gZmVhdHVyZSB0aGUgImxvZyIKYmFja2VuZCBpbnN0ZWFkIG9mIHRoZSAic2ltcGxlIiBi
YWNrZW5kLgoKU3VnZ2VzdGVkLWJ5OiBQZXRlciBNYXlkZWxsIDxwZXRlci5tYXlkZWxsQGxpbmFy
by5vcmc+ClNpZ25lZC1vZmYtYnk6IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNv
bT4KLS0tCiBkb2NzL2RldmVsL3RyYWNpbmcucnN0IHwgMzUgKysrKysrKysrKysrKysrKysrLS0t
LS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCAxNyBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kb2NzL2RldmVsL3RyYWNpbmcucnN0IGIvZG9jcy9kZXZl
bC90cmFjaW5nLnJzdAppbmRleCA3NmNjMWIyNGZhLi5lNjAwNThiZjU1IDEwMDY0NAotLS0gYS9k
b2NzL2RldmVsL3RyYWNpbmcucnN0CisrKyBiL2RvY3MvZGV2ZWwvdHJhY2luZy5yc3QKQEAgLTEx
LDIyICsxMSwyMiBAQCBmb3IgZGVidWdnaW5nLCBwcm9maWxpbmcsIGFuZCBvYnNlcnZpbmcgZXhl
Y3V0aW9uLgogUXVpY2tzdGFydAogPT09PT09PT09PQogCi0xLiBCdWlsZCB3aXRoIHRoZSAnc2lt
cGxlJyB0cmFjZSBiYWNrZW5kOjoKK0VuYWJsZSB0cmFjaW5nIG9mIGBgbWVtb3J5X3JlZ2lvbl9v
cHNfcmVhZGBgIGFuZCBgYG1lbW9yeV9yZWdpb25fb3BzX3dyaXRlYGAKK2V2ZW50czo6CiAKLSAg
ICAuL2NvbmZpZ3VyZSAtLWVuYWJsZS10cmFjZS1iYWNrZW5kcz1zaW1wbGUKLSAgICBtYWtlCisg
ICAgJCBxZW11IC0tdHJhY2UgIm1lbW9yeV9yZWdpb25fb3BzXyoiIC4uLgorICAgIC4uLgorICAg
IDcxOTU4NUAxNjA4MTMwMTMwLjQ0MTE4ODptZW1vcnlfcmVnaW9uX29wc19yZWFkIGNwdSAwIG1y
IDB4NTYyZmRmYmIzODIwIGFkZHIgMHgzY2MgdmFsdWUgMHg2NyBzaXplIDEKKyAgICA3MTk1ODVA
MTYwODEzMDEzMC40NDExOTA6bWVtb3J5X3JlZ2lvbl9vcHNfd3JpdGUgY3B1IDAgbXIgMHg1NjJm
ZGZiZDJmMDAgYWRkciAweDNkNCB2YWx1ZSAweDcwZSBzaXplIDIKIAotMi4gQ3JlYXRlIGEgZmls
ZSB3aXRoIHRoZSBldmVudHMgeW91IHdhbnQgdG8gdHJhY2U6OgorVGhpcyBvdXRwdXQgY29tZXMg
ZnJvbSB0aGUgImxvZyIgdHJhY2UgYmFja2VuZCB0aGF0IGlzIGVuYWJsZWQgYnkgZGVmYXVsdCB3
aGVuCitgYC4vY29uZmlndXJlIC0tZW5hYmxlLXRyYWNlLWJhY2tlbmRzPUJBQ0tFTkRTYGAgd2Fz
IG5vdCBleHBsaWNpdGx5IHNwZWNpZmllZC4KIAotICAgIGVjaG8gbWVtb3J5X3JlZ2lvbl9vcHNf
cmVhZCA+L3RtcC9ldmVudHMKK01vcmUgdGhhbiBvbmUgdHJhY2UgZXZlbnQgcGF0dGVybiBjYW4g
YmUgc3BlY2lmaWVkIGJ5IHByb3ZpZGluZyBhIGZpbGUKK2luc3RlYWQ6OgogCi0zLiBSdW4gdGhl
IHZpcnR1YWwgbWFjaGluZSB0byBwcm9kdWNlIGEgdHJhY2UgZmlsZTo6Ci0KLSAgICBxZW11IC0t
dHJhY2UgZXZlbnRzPS90bXAvZXZlbnRzIC4uLiAjIHlvdXIgbm9ybWFsIFFFTVUgaW52b2NhdGlv
bgotCi00LiBQcmV0dHktcHJpbnQgdGhlIGJpbmFyeSB0cmFjZSBmaWxlOjoKLQotICAgIC4vc2Ny
aXB0cy9zaW1wbGV0cmFjZS5weSB0cmFjZS1ldmVudHMtYWxsIHRyYWNlLSogIyBPdmVycmlkZSAq
IHdpdGggUUVNVSA8cGlkPgorICAgICQgZWNobyAibWVtb3J5X3JlZ2lvbl9vcHNfKiIgPi90bXAv
ZXZlbnRzCisgICAgJCBxZW11IC0tdHJhY2UgZXZlbnRzPS90bXAvZXZlbnRzIC4uLgogCiBUcmFj
ZSBldmVudHMKID09PT09PT09PT09PQpAQCAtMTk1LDcgKzE5NSw3IEBAIHNjcmlwdC4KIAogVGhl
IHRyYWNlIGJhY2tlbmRzIGFyZSBjaG9zZW4gYXQgY29uZmlndXJlIHRpbWU6OgogCi0gICAgLi9j
b25maWd1cmUgLS1lbmFibGUtdHJhY2UtYmFja2VuZHM9c2ltcGxlCisgICAgLi9jb25maWd1cmUg
LS1lbmFibGUtdHJhY2UtYmFja2VuZHM9c2ltcGxlLGR0cmFjZQogCiBGb3IgYSBsaXN0IG9mIHN1
cHBvcnRlZCB0cmFjZSBiYWNrZW5kcywgdHJ5IC4vY29uZmlndXJlIC0taGVscCBvciBzZWUgYmVs
b3cuCiBJZiBtdWx0aXBsZSBiYWNrZW5kcyBhcmUgZW5hYmxlZCwgdGhlIHRyYWNlIGlzIHNlbnQg
dG8gdGhlbSBhbGwuCkBAIC0yMjcsMTAgKzIyNywxMSBAQCB1c2VzIERQUklOVEYoKS4KIFNpbXBs
ZXRyYWNlCiAtLS0tLS0tLS0tLQogCi1UaGUgInNpbXBsZSIgYmFja2VuZCBzdXBwb3J0cyBjb21t
b24gdXNlIGNhc2VzIGFuZCBjb21lcyBhcyBwYXJ0IG9mIHRoZSBRRU1VCi1zb3VyY2UgdHJlZS4g
IEl0IG1heSBub3QgYmUgYXMgcG93ZXJmdWwgYXMgcGxhdGZvcm0tc3BlY2lmaWMgb3IgdGhpcmQt
cGFydHkKLXRyYWNlIGJhY2tlbmRzIGJ1dCBpdCBpcyBwb3J0YWJsZS4gIFRoaXMgaXMgdGhlIHJl
Y29tbWVuZGVkIHRyYWNlIGJhY2tlbmQKLXVubGVzcyB5b3UgaGF2ZSBzcGVjaWZpYyBuZWVkcyBm
b3IgbW9yZSBhZHZhbmNlZCBiYWNrZW5kcy4KK1RoZSAic2ltcGxlIiBiYWNrZW5kIHdyaXRlcyBi
aW5hcnkgdHJhY2UgbG9ncyB0byBhIGZpbGUgZnJvbSBhIHRocmVhZCwgbWFraW5nCitpdCBsb3dl
ciBvdmVyaGVhZCB0aGFuIHRoZSAibG9nIiBiYWNrZW5kLiBBIFB5dGhvbiBBUEkgaXMgYXZhaWxh
YmxlIGZvciB3cml0aW5nCitvZmZsaW5lIHRyYWNlIGZpbGUgYW5hbHlzaXMgc2NyaXB0cy4gSXQg
bWF5IG5vdCBiZSBhcyBwb3dlcmZ1bCBhcworcGxhdGZvcm0tc3BlY2lmaWMgb3IgdGhpcmQtcGFy
dHkgdHJhY2UgYmFja2VuZHMgYnV0IGl0IGlzIHBvcnRhYmxlIGFuZCBoYXMgbm8KK3NwZWNpYWwg
bGlicmFyeSBkZXBlbmRlbmNpZXMuCiAKIE1vbml0b3IgY29tbWFuZHMKIH5+fn5+fn5+fn5+fn5+
fn4KLS0gCjIuMjkuMgoK


