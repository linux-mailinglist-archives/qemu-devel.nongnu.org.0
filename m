Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4CF294F63
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Oct 2020 17:01:12 +0200 (CEST)
Received: from localhost ([::1]:44716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVFbz-0006dl-Cj
	for lists+qemu-devel@lfdr.de; Wed, 21 Oct 2020 11:01:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kVFQe-0006uo-2m
 for qemu-devel@nongnu.org; Wed, 21 Oct 2020 10:49:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kVFQc-0006of-7v
 for qemu-devel@nongnu.org; Wed, 21 Oct 2020 10:49:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603291765;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tS1k+bbeTEw5m5fub/HNGAtSvflWpWoaruzWtHKy0CE=;
 b=L5jr2jWLqxycalj8V8x0J6oxAT4I+x1LJMocqgzMH4ZOT3aRz8UwNrJDXUnmE4t8WTIDZf
 jzbaNsRuCS6ZW4+ksht6kNHq3xMDQ37zemRPenLT1Sol1FhCyv8yLUL+HqQvfQ0DTxGQo9
 SQG/ZxG3CZR36h/Yyq1ozkhVF71v4mQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-535-3rDw2wW2PeSvR328SshMIA-1; Wed, 21 Oct 2020 10:49:22 -0400
X-MC-Unique: 3rDw2wW2PeSvR328SshMIA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CAF6788EF01;
 Wed, 21 Oct 2020 14:48:54 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-66.ams2.redhat.com
 [10.36.114.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7DEF45C225;
 Wed, 21 Oct 2020 14:48:54 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 557FE1FCE5; Wed, 21 Oct 2020 16:48:52 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/17] tests/acpi: update expected data files
Date: Wed, 21 Oct 2020 16:48:41 +0200
Message-Id: <20201021144852.16665-7-kraxel@redhat.com>
In-Reply-To: <20201021144852.16665-1-kraxel@redhat.com>
References: <20201021144852.16665-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/21 02:16:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Message-id: 20201016113835.17465-7-kraxel@redhat.com
---
 tests/data/acpi/microvm/APIC.pcie | Bin 0 -> 110 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/tests/data/acpi/microvm/APIC.pcie b/tests/data/acpi/microvm/APIC.pcie
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..6c51081b50beb061c5f4e5baa134585d82db4c39 100644
GIT binary patch
literal 110
zcmZ<^@N~{&U|?Xp@8s|75v<@85#a0y6k`O6f!H9Lf#JbFFwFr}2jnsGfW!{`1CdNz
b3_Kt%FNnp<3uE!|!C3tKU=|D8f1pMH#A*!z

literal 0
HcmV?d00001

-- 
2.27.0


