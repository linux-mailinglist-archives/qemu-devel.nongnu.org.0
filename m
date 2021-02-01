Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE05030AC23
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 16:59:08 +0100 (CET)
Received: from localhost ([::1]:41958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6bbX-0003cf-Ut
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 10:59:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l6bT1-0001gO-38
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 10:50:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l6bSw-00083n-6d
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 10:50:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612194613;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OAok3SCm13ziVPivo7dyaJzZdeFBj9afIGPtyzSiesc=;
 b=O7qMUQNZRREDDgHnlbU3WcIxOIKI9AY9IzfrgYhWJ1IQfjzvxSltTgsWXzRwBezNXO2RYq
 BPatZiCNvHPZ/dgYi9fiq7+nPoni1Y2QFvHpjW4kMfCV+rJeu2PX+8ahbihqzX1RtZHq2h
 kDagJQRCt50PfTZqsCMVgw/8XzUWj3I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-533-utdlYTgZNyuNmGtjFfppUA-1; Mon, 01 Feb 2021 10:50:09 -0500
X-MC-Unique: utdlYTgZNyuNmGtjFfppUA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 039698E5F41;
 Mon,  1 Feb 2021 15:48:08 +0000 (UTC)
Received: from localhost (ovpn-115-140.ams2.redhat.com [10.36.115.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 73C6310013C0;
 Mon,  1 Feb 2021 15:48:07 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/11] trace: document how to specify multiple --trace patterns
Date: Mon,  1 Feb 2021 15:47:02 +0000
Message-Id: <20210201154703.180022-11-stefanha@redhat.com>
In-Reply-To: <20210201154703.180022-1-stefanha@redhat.com>
References: <20210201154703.180022-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SXQgaXMgcG9zc2libGUgdG8gcmVwZWF0IHRoZSAtLXRyYWNlIG9wdGlvbiB0byBzcGVjaWZ5IG11
bHRpcGxlCnBhdHRlcm5zLiBUaGlzIG1heSBiZSBwcmVmZXJyYWJsZSB0byB1c2VycyB3aG8gZG8g
bm90IHdhbnQgdG8gY3JlYXRlIGEKZmlsZSB3aXRoIGEgbGlzdCBvZiBwYXR0ZXJucy4KClN1Z2dl
c3RlZC1ieTogQkFMQVRPTiBab2x0YW4gPGJhbGF0b25AZWlrLmJtZS5odT4KU2lnbmVkLW9mZi1i
eTogU3RlZmFuIEhham5vY3ppIDxzdGVmYW5oYUByZWRoYXQuY29tPgpSZXZpZXdlZC1ieTogUGhp
bGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEByZWRoYXQuY29tPgpNZXNzYWdlLWlkOiAyMDIx
MDExMjE2NTg1OS4yMjU1MzQtMi1zdGVmYW5oYUByZWRoYXQuY29tClNpZ25lZC1vZmYtYnk6IFN0
ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNvbT4KLS0tCiBkb2NzL2RldmVsL3RyYWNp
bmcucnN0IHwgOSArKysrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZG9jcy9kZXZlbC90cmFjaW5nLnJzdCBiL2RvY3Mv
ZGV2ZWwvdHJhY2luZy5yc3QKaW5kZXggYWYzOTVlOTU3ZC4uZThmOWI4MmM1ZSAxMDA2NDQKLS0t
IGEvZG9jcy9kZXZlbC90cmFjaW5nLnJzdAorKysgYi9kb2NzL2RldmVsL3RyYWNpbmcucnN0CkBA
IC0yMiwxMCArMjIsMTUgQEAgZXZlbnRzOjoKIFRoaXMgb3V0cHV0IGNvbWVzIGZyb20gdGhlICJs
b2ciIHRyYWNlIGJhY2tlbmQgdGhhdCBpcyBlbmFibGVkIGJ5IGRlZmF1bHQgd2hlbgogYGAuL2Nv
bmZpZ3VyZSAtLWVuYWJsZS10cmFjZS1iYWNrZW5kcz1CQUNLRU5EU2BgIHdhcyBub3QgZXhwbGlj
aXRseSBzcGVjaWZpZWQuCiAKLU1vcmUgdGhhbiBvbmUgdHJhY2UgZXZlbnQgcGF0dGVybiBjYW4g
YmUgc3BlY2lmaWVkIGJ5IHByb3ZpZGluZyBhIGZpbGUKLWluc3RlYWQ6OgorTXVsdGlwbGUgcGF0
dGVybnMgY2FuIGJlIHNwZWNpZmllZCBieSByZXBlYXRpbmcgdGhlIGBgLS10cmFjZWBgIG9wdGlv
bjo6CisKKyAgICAkIHFlbXUgLS10cmFjZSAia3ZtXyoiIC0tdHJhY2UgInZpcnRpb18qIiAuLi4K
KworV2hlbiBwYXR0ZXJucyBhcmUgdXNlZCBmcmVxdWVudGx5IGl0IGlzIG1vcmUgY29udmVuaWVu
dCB0byBzdG9yZSB0aGVtIGluIGEKK2ZpbGUgdG8gYXZvaWQgbG9uZyBjb21tYW5kLWxpbmUgb3B0
aW9uczo6CiAKICAgICAkIGVjaG8gIm1lbW9yeV9yZWdpb25fb3BzXyoiID4vdG1wL2V2ZW50cwor
ICAgICQgZWNobyAia3ZtXyoiID4+L3RtcC9ldmVudHMKICAgICAkIHFlbXUgLS10cmFjZSBldmVu
dHM9L3RtcC9ldmVudHMgLi4uCiAKIFRyYWNlIGV2ZW50cwotLSAKMi4yOS4yCgo=


