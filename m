Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD77324FD6
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 13:26:01 +0100 (CET)
Received: from localhost ([::1]:33904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFFiS-0007aN-G2
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 07:26:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lFFgX-0006v9-GP
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 07:24:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lFFgS-0004WW-F0
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 07:24:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614255835;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=3ftjdeQ538tCZjYK4XhxkSg63afvB9VZZ2CpuDcIfhw=;
 b=bL6Z5MWlXxta0uF13Xir4ZDGZfqqIiDCrhvSrBKxvPDM3XXLclpzHyBEWY/QUxKJjOlccp
 rSXeIBvPsC2FQV8JDCdNL9fLWIjHaH9J3hv3oC3HB4h9uoNp9l5q2r23f/sTVRZbty9U/Z
 JG/16ijZQmrrbeSikXTQdobZXS86x+Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-3y7RPnLBMO6cTiQVAfUgMQ-1; Thu, 25 Feb 2021 07:23:53 -0500
X-MC-Unique: 3y7RPnLBMO6cTiQVAfUgMQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 28DD1107ACE3;
 Thu, 25 Feb 2021 12:23:52 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-79.ams2.redhat.com
 [10.36.115.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EEFD760855;
 Thu, 25 Feb 2021 12:23:51 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 82522113860F; Thu, 25 Feb 2021 13:23:50 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Yonggang Luo <luoyonggang@gmail.com>
Subject: Bogus "is either too old or uses too old a Python version" from
 docs/meson.build
Date: Thu, 25 Feb 2021 13:23:50 +0100
Message-ID: <87ft1kqqsp.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I just chanced on this one:

    Program sphinx-build-3 found: YES
    ../docs/meson.build:30: WARNING: /usr/bin/sphinx-build-3 is either too old or uses too old a Python version

    ../docs/meson.build:33:6: ERROR: Problem encountered: Install a Python 3 version of python-sphinx

    A full log can be found at /work/armbru/qemu/bld-x86/meson-logs/meson-log.txt

    ERROR: meson setup failed

My sphinx-build-3 is just fine, the problem is caused by me changing my
tree so that

1. qapi-gen.py fails (because I messed up), and

2. make re-runs configure.

Perhaps the test for a working sphinx-build-3 could be made a bit more
robust.


