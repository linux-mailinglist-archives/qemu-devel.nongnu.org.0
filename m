Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F73A2688D0
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Sep 2020 11:53:40 +0200 (CEST)
Received: from localhost ([::1]:52610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kHlB5-0003iL-79
	for lists+qemu-devel@lfdr.de; Mon, 14 Sep 2020 05:53:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kHlAD-0002qq-IA
 for qemu-devel@nongnu.org; Mon, 14 Sep 2020 05:52:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23341)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kHlAB-0004pi-DL
 for qemu-devel@nongnu.org; Mon, 14 Sep 2020 05:52:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600077162;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jl8hkpC5Vm1CwFPyPs6YUGAT1dHUa8tiFP4XfOMN0FY=;
 b=JuKsbal078RamB/YJx1VMIXRtEGCkvgVV0f/Km5BOBCH2ju52oQdQafKuykzyif08NCkFa
 E2Y7m5RCgCubm0pTu5DyWgJEzkT6syH3MXAnQqdY6E4damcsrS+mQ6tWmJS2pJ5CEMHxYt
 pRkLzp36BRMjwutA7IxLXfd/2vE5UPs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-390-VIRWFtoBOv-4El0oGLLpZQ-1; Mon, 14 Sep 2020 05:52:40 -0400
X-MC-Unique: VIRWFtoBOv-4El0oGLLpZQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B394D425CB;
 Mon, 14 Sep 2020 09:52:39 +0000 (UTC)
Received: from localhost (ovpn-114-157.ams2.redhat.com [10.36.114.157])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8B2557513A;
 Mon, 14 Sep 2020 09:52:36 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] configure: add missing CONFIG_TCMALLOC
Date: Mon, 14 Sep 2020 10:52:29 +0100
Message-Id: <20200914095231.621068-2-stefanha@redhat.com>
In-Reply-To: <20200914095231.621068-1-stefanha@redhat.com>
References: <20200914095231.621068-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/14 02:55:39
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.695,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VGhlIGZlYXR1cmUgc3VtbWFyeSBpbiBtZXNvbi5idWlsZCBjaGVja3MgZm9yIENPTkZJR19UQ01B
TExPQzoKCiAgc3VtbWFyeV9pbmZvICs9IHsndGNtYWxsb2Mgc3VwcG9ydCc6ICBjb25maWdfaG9z
dC5oYXNfa2V5KCdDT05GSUdfVENNQUxMT0MnKX0KCk5vdGhpbmcgZW1pdHMgQ09ORklHX1RDTUFM
TE9DIGluIC4vY29uZmlndXJlIHNvIHRoaXMgZmVhdHVyZSBhcHBlYXJzCmRpc2FibGVkIGV2ZW4g
aWYgaXQgaGFzIGJlZW4gZW5hYmxlZC4KClNpZ25lZC1vZmYtYnk6IFN0ZWZhbiBIYWpub2N6aSA8
c3RlZmFuaGFAcmVkaGF0LmNvbT4KLS0tCiBjb25maWd1cmUgfCA0ICsrKysKIDEgZmlsZSBjaGFu
Z2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9jb25maWd1cmUgYi9jb25maWd1cmUK
aW5kZXggMmI2YTExOTZkYS4uOWY1YjNhODg5NyAxMDA3NTUKLS0tIGEvY29uZmlndXJlCisrKyBi
L2NvbmZpZ3VyZQpAQCAtNzAyNyw2ICs3MDI3LDEwIEBAIGlmIHRlc3QgIiRtYWxsb2NfdHJpbSIg
PSAieWVzIiA7IHRoZW4KICAgZWNobyAiQ09ORklHX01BTExPQ19UUklNPXkiID4+ICRjb25maWdf
aG9zdF9tYWsKIGZpCiAKK2lmIHRlc3QgIiR0Y21hbGxvYyIgPSAieWVzIiA7IHRoZW4KKyAgZWNo
byAiQ09ORklHX1RDTUFMTE9DPXkiID4+ICRjb25maWdfaG9zdF9tYWsKK2ZpCisKIGlmIHRlc3Qg
IiRhdngyX29wdCIgPSAieWVzIiA7IHRoZW4KICAgZWNobyAiQ09ORklHX0FWWDJfT1BUPXkiID4+
ICRjb25maWdfaG9zdF9tYWsKIGZpCi0tIAoyLjI2LjIKCg==


