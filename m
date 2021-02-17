Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C62AE31D74A
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 11:09:15 +0100 (CET)
Received: from localhost ([::1]:48336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCJli-0001w5-BX
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 05:09:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lCJkY-0001U3-Ee
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 05:08:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30127)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lCJkU-00033R-N5
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 05:08:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613556476;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=n6bEzNZRc20F+zz33x2LsSqcue5lQvIFOcg6aVrlsKw=;
 b=GIva7MRxhyxtYiNuK6akApgno2yB392YR0oPfdy7zja7xm3ojkKjKdhE4QmiD7uzVAzs2V
 UhDLGRE8xc6Zne9SXMcetfF3pdQKwfW6WFcy9JEqOum9dBSQvtpPQ7SqLzuyjIxwVd0h16
 1zq31ZRGU6gQq9EMmUJIRdXsrXL0Cao=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-t_WOBO-MNPOpaaxNMVT1SA-1; Wed, 17 Feb 2021 05:07:53 -0500
X-MC-Unique: t_WOBO-MNPOpaaxNMVT1SA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 94593801AAF
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 10:07:52 +0000 (UTC)
Received: from localhost (ovpn-115-102.ams2.redhat.com [10.36.115.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1BF8C6362A;
 Wed, 17 Feb 2021 10:07:48 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [qemu-web PATCH] Add Outreachy and GSoC announcement
Date: Wed, 17 Feb 2021 10:07:48 +0000
Message-Id: <20210217100748.269005-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UUVNVSBpcyBwYXJ0aWNpcGF0aW5nIGluIE91dHJlYWNoeSBNYXktQXVndXN0IGFuZCBpcyBhcHBs
eWluZyBmb3IgR1NvQwoyMDIxLiBJdCdzIHRpbWUgdG8gcHVibGlzaCBpbmZvcm1hdGlvbiBvbiB0
aGVzZSBpbnRlcm5zaGlwIHByb2dyYW1zIGFuZApob3cgdG8gYXBwbHkuCgpTaWduZWQtb2ZmLWJ5
OiBTdGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhhQHJlZGhhdC5jb20+Ci0tLQogX3Bvc3RzLzIwMjEt
MDItMTctZ3NvYy1hbmQtb3V0cmVhY2h5LTIwMjEubWQgfCA0MyArKysrKysrKysrKysrKysrKysr
KwogMSBmaWxlIGNoYW5nZWQsIDQzIGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBf
cG9zdHMvMjAyMS0wMi0xNy1nc29jLWFuZC1vdXRyZWFjaHktMjAyMS5tZAoKZGlmZiAtLWdpdCBh
L19wb3N0cy8yMDIxLTAyLTE3LWdzb2MtYW5kLW91dHJlYWNoeS0yMDIxLm1kIGIvX3Bvc3RzLzIw
MjEtMDItMTctZ3NvYy1hbmQtb3V0cmVhY2h5LTIwMjEubWQKbmV3IGZpbGUgbW9kZSAxMDA2NDQK
aW5kZXggMDAwMDAwMC4uZTQxYjk5OQotLS0gL2Rldi9udWxsCisrKyBiL19wb3N0cy8yMDIxLTAy
LTE3LWdzb2MtYW5kLW91dHJlYWNoeS0yMDIxLm1kCkBAIC0wLDAgKzEsNDMgQEAKKy0tLQorbGF5
b3V0OiBwb3N0Cit0aXRsZTogICJRRU1VIGlzIGFwcGx5aW5nIHRvIEdvb2dsZSBTdW1tZXIgb2Yg
Q29kZSBhbmQgT3V0cmVhY2h5IDIwMjEiCitkYXRlOiAgIDIwMjEtMDItMTcgMDc6MDA6MDAgKzAw
MDAKK2F1dGhvcjogU3RlZmFuIEhham5vY3ppCitjYXRlZ29yaWVzOiBbZ3NvYywgaW50ZXJuc2hp
cHMsIG91dHJlYWNoeV0KKy0tLQorUUVNVSBpcyBhcHBseWluZyB0byBHb29nbGUgU3VtbWVyIG9m
IENvZGUgMjAyMSBhbmQgaXMgcGFydGljaXBhdGluZyBpbgorT3V0cmVhY2h5IE1heS1BdWd1c3Qg
MjAyMS4gQm90aCBvZiB0aGVzZSBvcGVuIHNvdXJjZSBpbnRlcm5zaGlwIHByb2dyYW1zIG9mZmVy
CityZW1vdGUgd29yayBvcHBvcnR1bml0aWVzIGZvciBuZXcgZGV2ZWxvcGVycyB3aXNoaW5nIHRv
IGdldCBpbnZvbHZlZCBpbiBvdXIKK2NvbW11bml0eS4KKworSW50ZXJucyB3b3JrIHdpdGggbWVu
dG9ycyB3aG8gc3VwcG9ydCB0aGVtIGluIHRoZWlyIHByb2plY3QuIFRoZSBjb2RlIGRldmVsb3Bl
ZAorZHVyaW5nIHRoZSBwcm9qZWN0IGlzIHN1Ym1pdHRlZCB2aWEgdGhlIHNhbWUgb3BlbiBzb3Vy
Y2UgZGV2ZWxvcG1lbnQgcHJvY2VzcwordGhhdCBhbGwgUUVNVSBjb2RlIGZvbGxvd3MuIFRoaXMg
Z2l2ZXMgaW50ZXJucyBleHBlcmllbmNlIHdpdGggY29udHJpYnV0aW5nIHRvCitvcGVuIHNvdXJj
ZSBzb2Z0d2FyZS4KKworUUVNVSdzIG1lbnRvcnMgYXJlIGV4cGVyaWVuY2VkIGNvbnRyaWJ1dG9y
cyB3aG8gZW5qb3kgd29ya2luZyB3aXRoIHRhbGVudGVkCitpbmRpdmlkdWFscyB3aG8gYXJlIGdl
dHRpbmcgc3RhcnRlZCBpbiBvcGVuIHNvdXJjZS4gWW91IGNhbiBmaW5kIGEgbGlzdCBvZgorcHJv
amVjdCBpZGVhcyB0aGF0IG1lbnRvcnMgYXJlIHByb3Bvc2luZworW2hlcmVdKGh0dHBzOi8vd2lr
aS5xZW11Lm9yZy9Hb29nbGVfU3VtbWVyX29mX0NvZGVfMjAyMSkuCisKKyMjIE91dHJlYWNoeQor
SW5pdGlhbCBhcHBsaWNhdGlvbnMgYXJlIG9wZW4gdW50aWwgRmVicnVhcnkgMjJuZCBhdCAxNjow
MCBVVEMuIE91dHJlYWNoeSdzCitnb2FsIGlzIHRvIGluY3JlYXNlIGRpdmVyc2l0eSBpbiBvcGVu
IHNvdXJjZSBhbmQgaXMgb3BlbiB0byBhbnlvbmUgd2hvIGZhY2VzCit1bmRlci1yZXByZXNlbnRh
dGlvbiwgc3lzdGVtaWMgYmlhcywgb3IgZGlzY3JpbWluYXRpb24gaW4gdGhlIHRlY2hub2xvZ3kK
K2luZHVzdHJ5IG9mIHRoZWlyIGNvdW50cnkuCisKK1lvdSBjYW4gbGVhcm4gbW9yZSBhYm91dCBP
dXRyZWFjaHkgTWF5LUF1Z3VzdCBhbmQgaG93IHRvIGFwcGx5IGF0IHRoZQorW091dHJlYWNoeSB3
ZWJzaXRlXShodHRwczovL3d3dy5vdXRyZWFjaHkub3JnLykuCisKKyMjIEdvb2dsZSBTdW1tZXIg
b2YgQ29kZQorR29vZ2xlIFN1bW1lciBvZiBDb2RlIChHU09DKSBpcyBhIDEwLXdlZWsgaW50ZXJu
c2hpcCBmb3Igc3R1ZGVudHMuIEFwcGxpY2F0aW9ucworYXJlIG9wZW4gZnJvbSBNYXJjaCAyOXRo
IHRvIEFwcmlsIDEzdGguIFlvdSBjYW4gZmluZCB0aGUgZGV0YWlscyBvZiBob3cgdG8KK2FwcGx5
IGF0IHRoZSBbR29vZ2xlIFN1bW1lciBvZiBDb2RlCit3ZWJzaXRlXShodHRwczovL3N1bW1lcm9m
Y29kZS53aXRoZ29vZ2xlLmNvbS8pLgorCitHb29nbGUgd2lsbCBhbm5vdW5jZWQgYWNjZXB0ZWQg
b3JnYW5pemF0aW9ucyBvbiBNYXJjaCA5dGguIFFFTVUgaXMgYXBwbHlpbmcgYW5kCit3ZSBob3Bl
IHRvIG1lbnRvcnMgR1NvQyBpbnRlcm5zIGFnYWluIHRoaXMgeWVhciEKKworUGxlYXNlIHJldmll
dyB0aGUgW2VsaWdpYmlsaXR5IGNyaXRlcmlhIGZvcgorR1NvQ10oaHR0cHM6Ly9kZXZlbG9wZXJz
Lmdvb2dsZS5jb20vb3Blbi1zb3VyY2UvZ3NvYy9mYXEjd2hhdF9hcmVfdGhlX2VsaWdpYmlsaXR5
X3JlcXVpcmVtZW50c19mb3JfcGFydGljaXBhdGlvbikKK2JlZm9yZSBhcHBseWluZy4KLS0gCjIu
MjkuMgoK


