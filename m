Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E0E2F3843
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 19:16:10 +0100 (CET)
Received: from localhost ([::1]:50016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzODB-00019L-BL
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 13:16:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kzNgH-00022O-4L
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 12:42:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kzNgE-0005tk-4d
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 12:42:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610473324;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BFZUTg0qi6HnNpNgoc2KgbIzNHUE5jpYgBCh/R7+frQ=;
 b=Poo3TUHbNGvAi1Lt4ivhPOiXe+/N2JFlzcQMYxqYvRVVLe3q+GygOUDaArcDzYezJekZA7
 8B/+PmiEHv8G3oBCXG1OPl76zj8u9RWigJ7+TLdoedVvmUCYIfFJfXjzupALiFhH1Wv4mX
 skuLnAgMxBBnLZG4k2pS8lxT9j8QOhU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-MUArYFuoPiGsTpgJxnpdag-1; Tue, 12 Jan 2021 12:42:02 -0500
X-MC-Unique: MUArYFuoPiGsTpgJxnpdag-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 67D17107ACFB;
 Tue, 12 Jan 2021 17:42:01 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-194.ams2.redhat.com [10.36.115.194])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 425961975E;
 Tue, 12 Jan 2021 17:41:55 +0000 (UTC)
Date: Tue, 12 Jan 2021 18:41:54 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v6 10/11] iotests: rewrite check into python
Message-ID: <20210112174154.GD6075@merkur.fritz.box>
References: <20210109122631.167314-1-vsementsov@virtuozzo.com>
 <20210109122631.167314-11-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210109122631.167314-11-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 09.01.2021 um 13:26 hat Vladimir Sementsov-Ogievskiy geschrieben:
> Just use classes introduced in previous three commits. Behavior
> difference is described in these three commits.
> 
> Drop group file, as it becomes unused.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  tests/qemu-iotests/check | 994 ++-------------------------------------
>  tests/qemu-iotests/group | 321 -------------
>  2 files changed, 28 insertions(+), 1287 deletions(-)
>  delete mode 100644 tests/qemu-iotests/group

> +import sys
> +import os
> +from findtests import find_tests, TestFinder
> +from testenv import TestEnv
> +from testrunner import TestRunner
> +
> +if __name__ == '__main__':
> +    if len(sys.argv) == 2 and sys.argv[1] in ['-h', '--help']:
> +        print('Usage: ./check [options] [testlist]')
> +        print()
> +        TestFinder.get_argparser().print_help()
> +        print()
> +        TestEnv.get_argparser().print_help()
> +        print()
> +        TestRunner.get_argparser().print_help()
> +        exit()

+check:34:8: R1722: Consider using sys.exit() (consider-using-sys-exit)

> +
> +    env = TestEnv(sys.argv[1:])
> +    tests, remaining_argv = find_tests(env.remaining_argv,
> +                                       test_dir=env.source_iotests)
> +
> +    with TestRunner(remaining_argv, env) as tr:
> +        assert not tr.remaining_argv
> +        tr.run_tests([os.path.join(env.source_iotests, t) for t in tests])

The assertion means that giving an unknown option results in an error
message like this:

$ build/check -T -raw
Traceback (most recent call last):
  File "/home/kwolf/source/qemu/tests/qemu-iotests/build/check", line 41, in <module>
    assert not tr.remaining_argv
AssertionError

I think this could be a bit friendlier (especially since this doesn't
even tell you which of your options was wrong).

Kevin


