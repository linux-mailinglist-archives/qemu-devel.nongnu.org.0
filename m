Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54EB4403A8A
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 15:24:07 +0200 (CEST)
Received: from localhost ([::1]:54830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNxYb-0005RE-Al
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 09:24:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mNxXC-000438-LY
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 09:22:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mNxXB-00085J-58
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 09:22:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631107356;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wxjD85aNsJcGw/4gjVkCyrLzfOd+HU932uifldvqjiI=;
 b=KeuQax7Jo+JaZ+ayLYfJ9VtvAP+QjeYeJe2rFaUOF26RMhXWDJAvUtlsmpz3K3jcHKDiwp
 8r0tHeHl8mkYo6T26sZXACALB2rbr8uBnWhogKe6JV2wXgHN+hmw1gI5jVQoI7vSyu4CFx
 9a/BYO84EupJKR27JvKA1o2SmQ2phMo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-504-8-BWTi5PPH2NAkRI0ZwhEQ-1; Wed, 08 Sep 2021 09:22:35 -0400
X-MC-Unique: 8-BWTi5PPH2NAkRI0ZwhEQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 908CB801B3D
 for <qemu-devel@nongnu.org>; Wed,  8 Sep 2021 13:22:34 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B8D39196FC;
 Wed,  8 Sep 2021 13:22:26 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 48AEE1138606; Wed,  8 Sep 2021 15:22:25 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [RFC v3 00/32] Rust binding for QAPI and qemu-ga QMP handler
 examples
References: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
Date: Wed, 08 Sep 2021 15:22:25 +0200
In-Reply-To: <20210907121943.3498701-1-marcandre.lureau@redhat.com> (marcandre
 lureau's message of "Tue, 7 Sep 2021 16:19:11 +0400")
Message-ID: <871r5zurqm.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: pbonzini@redhat.com, berrange@redhat.com, qemu-devel@nongnu.org,
 stefanha@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Build fails for me:

make: Entering directory '/work/armbru/qemu/bld'
config-host.mak is out-of-date, running configure
  GIT     ui/keycodemapdb meson tests/fp/berkeley-testfloat-3 tests/fp/berkeley-softfloat-3 dtc capstone slirp
fatal: remote error: upload-pack: not our ref 7077bbbd11a67d60062a9483f996113a349a4ca1
Fetched in submodule path 'rust/vendored', but it did not contain 7077bbbd11a67d60062a9483f996113a349a4ca1. Direct fetching of that commit failed.
/work/armbru/qemu/scripts/git-submodule.sh: failed to update modules

Unable to automatically checkout GIT submodules ' ui/keycodemapdb meson rust/vendored tests/fp/berkeley-testfloat-3 tests/fp/berkeley-softfloat-3 dtc capstone slirp'.
If you require use of an alternative GIT binary (for example to
enable use of a transparent proxy), then please specify it by
running configure by with the '--with-git' argument. e.g.

 $ ./configure --with-git='tsocks git'

Alternatively you may disable automatic GIT submodule checkout
with:

 $ ./configure --with-git-submodules=validate

and then manually update submodules prior to running make, with:

 $ scripts/git-submodule.sh update  ui/keycodemapdb meson rust/vendored tests/fp/berkeley-testfloat-3 tests/fp/berkeley-softfloat-3 dtc capstone slirp

make: *** No rule to make target 'config-host.mak', needed by 'meson.stamp'.
make: Failed to remake makefile 'config-host.mak'.
make: Failed to remake makefile 'Makefile'.
make: Target 'all' not remade because of errors.
make: Leaving directory '/work/armbru/qemu/bld'


