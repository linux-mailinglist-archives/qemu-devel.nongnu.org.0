Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4A43001EE
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 12:50:00 +0100 (CET)
Received: from localhost ([::1]:51978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2uwx-0005yf-46
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 06:49:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l2uvX-00056i-56
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 06:48:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l2uvT-0001SP-St
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 06:48:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611316106;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XsGoaIcAJ1Vg5L2EY5oVt8MZJqWuJsONxymhagpwydA=;
 b=bJSD4upwCdqlalwFzSEWtVPMeb0/Cgm3wRqBjlwixkIfvrLR4xiqEvXDLAyhLJ05b7YqUi
 t2cdgRJFImAoEO8s2v0wT2xpzgWvnJEX8mpRnGRkkFtKZYJ+MkwLG8nmv5fAcvW94Y+srg
 Bzm3RB/QGyrsrUxfp8mWUB4dcVQE4Vc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-246-HMTH8w5sN8Wgm0VRR4Sb-Q-1; Fri, 22 Jan 2021 06:48:21 -0500
X-MC-Unique: HMTH8w5sN8Wgm0VRR4Sb-Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2B70802B48;
 Fri, 22 Jan 2021 11:48:20 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-18.ams2.redhat.com [10.36.115.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 83ECD100239A;
 Fri, 22 Jan 2021 11:48:16 +0000 (UTC)
Date: Fri, 22 Jan 2021 12:48:15 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v7 07/11] iotests: add findtests.py
Message-ID: <20210122114815.GC15866@merkur.fritz.box>
References: <20210116134424.82867-1-vsementsov@virtuozzo.com>
 <20210116134424.82867-8-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210116134424.82867-8-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.182,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 16.01.2021 um 14:44 hat Vladimir Sementsov-Ogievskiy geschrieben:
> Add python script with new logic of searching for tests:
> 
> Current ./check behavior:
>  - tests are named [0-9][0-9][0-9]
>  - tests must be registered in group file (even if test doesn't belong
>    to any group, like 142)
> 
> Behavior of findtests.py:
>  - group file is dropped
>  - tests are all files in tests/ subdirectory (except for .out files),
>    so it's not needed more to "register the test", just create it with
>    appropriate name in tests/ subdirectory. Old names like
>    [0-9][0-9][0-9] (in root iotests directory) are supported too, but
>    not recommended for new tests
>  - groups are parsed from '# group: ' line inside test files
>  - optional file group.local may be used to define some additional
>    groups for downstreams
>  - 'disabled' group is used to temporary disable tests. So instead of
>    commenting tests in old 'group' file you now can add them to
>    disabled group with help of 'group.local' file
>  - selecting test ranges like 5-15 are not supported more
>    (to support restarting failed ./check command from the middle of the
>     process, new argument is added: --start-from)
> 
> Benefits:
>  - no rebase conflicts in group file on patch porting from branch to
>    branch
>  - no conflicts in upstream, when different series want to occupy same
>    test number
>  - meaningful names for test files
>    For example, with digital number, when some person wants to add some
>    test about block-stream, he most probably will just create a new
>    test. But if there would be test-block-stream test already, he will
>    at first look at it and may be just add a test-case into it.
>    And anyway meaningful names are better.
> 
> This commit don't update check behavior (which will be done in further
> commit), still, the documentation changed like new behavior is already
> here.  Let's live with this small inconsistency for the following few
> commits, until final change.
> 
> The file findtests.py is self-executable and may be used for debugging
> purposes.

As Eric mentioned, this isn't accurate any more.

You mentioned using it as a way to debug things. I assume this is now
covered by the dry run option?

> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  docs/devel/testing.rst          |  50 +++++++++-
>  tests/qemu-iotests/findtests.py | 159 ++++++++++++++++++++++++++++++++
>  2 files changed, 208 insertions(+), 1 deletion(-)
>  create mode 100644 tests/qemu-iotests/findtests.py

> +    def add_group_file(self, fname: str) -> None:
> +        with open(fname) as f:
> +            for line in f:
> +                line = line.strip()
> +
> +                if (not line) or line[0] == '#':
> +                    continue
> +
> +                words = line.split()
> +                test_file = self.parse_test_name(words[0])
> +                groups = words[1:]

The previous version still had this:

+                if test_file not in self.all_tests:
+                    print(f'Warning: {fname}: "{test_file}" test is not found.'
+                          ' Skip.')
+                    continue

Why did you remove it? I found this useful when I had a wrong test name
in my group.local. Now it's silently ignored.

> +                for g in groups:
> +                    self.groups[g].add(test_file)

Kevin


