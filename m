Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72463575181
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 17:14:32 +0200 (CEST)
Received: from localhost ([::1]:46624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC0Xv-0002nK-6x
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 11:14:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oC0RV-0005Jk-AP
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 11:07:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49156)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oC0RO-0000RS-C9
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 11:07:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657811264;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=w3qFBJ4lZKPtX8B25djV/LPhr1pfsJvM9Pvk5hSVTFs=;
 b=MfnKm7Pb7agpxP14EWtY1iSvnNBMp33Put/Cn9w7lDv0uKi0siWuL4EWQc8p47xuNGRyM2
 ofs804489PFI5Jn6UBd2OjNwqnzuOx/VkCEtSQ6QIYyLze0PJWxc4p3q95dl493HgCgwNC
 Skd594kC/1dnsdhFgPSIam+g7y8Og8g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-643-CCwJ4NcYMWSlE0ZXqGRmug-1; Thu, 14 Jul 2022 11:07:40 -0400
X-MC-Unique: CCwJ4NcYMWSlE0ZXqGRmug-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9D70E188499F;
 Thu, 14 Jul 2022 15:07:39 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4D6D12166B2A;
 Thu, 14 Jul 2022 15:07:37 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 0/3] target: RFC: display deprecation note for '-cpu help'
Date: Thu, 14 Jul 2022 16:07:32 +0100
Message-Id: <20220714150735.1835166-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When querying '-cpu help' there is no presentation of fact that a
CPU may be deprecated. The user just has to try it and see if they
get a depecation message at runtime.  The QMP command for querying
CPUs report a deprecation bool flag, but not the explanatory
reason.

The Icelake-Client CPU (removed in 6df39f5e583ca0f67bd934d1327f9ead2e3bd49c)
handled this by modifying the '.notes' section to add the word
'deprecated':

            {
                .version = 2,
                .note = "no TSX, deprecated",
                .alias = "Icelake-Client-noTSX",
                .props = (PropValue[]) {
                    { "hle", "off" },
                    { "rtm", "off" },
                    { /* end of list */ }
                },
            },

This relies on the person deprecating the CPU to remember to do this,
and is redundant when this info is already expressed in the
'.deprecation_note' field.

This short series suggests just modifying the '-cpu help'
formatter so that it displays the full deprecation message

eg

$ qemu-system-x86_64 -cpu help:
Available CPUs:
x86 486                   (alias configured by machine type) (deprecated: use at least 'Nehalem' / 'Opteron_G4', or 'host' / 'max')

I wonder if this is too verbose, and we should just do a
concise flag like approach, similar to QMP:

$ qemu-system-x86_64 -cpu help:
Available CPUs:
x86 486                   (alias configured by machine type) (deprecated)

leaving the full message to be displayed at runtime ? I'm slightly
inclined to the simpler more concise output.

This series touched x86_64, s390x, and aarch64 because that's all I
personally needed from a downstream POV, but any & all of the targets
would benefit from this. They have each implemneted the '-cpu help'
logic independantly though, and unifying that code is not entirely
straightforward.

Daniel P. Berrangé (3):
  target/i386: display deprecation note in '-cpu help'
  target/s390x: display deprecation note in '-cpu help'
  target/arm: display deprecation note in '-cpu help'

 target/arm/helper.c       | 10 +++++++++-
 target/i386/cpu.c         | 13 ++++++++++++-
 target/s390x/cpu_models.c | 28 +++++++++++++++++++++++-----
 3 files changed, 44 insertions(+), 7 deletions(-)

-- 
2.36.1


