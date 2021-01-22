Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C57BD300504
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 15:14:05 +0100 (CET)
Received: from localhost ([::1]:48228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2xCO-0007tS-Sb
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 09:14:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l2xAB-0006Na-Oi
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 09:11:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l2xA9-0006Wf-Q9
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 09:11:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611324704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZaJOzm3sm9JficO37CAJ0xrLcmuViXgH2UgryYBl2Hc=;
 b=gu8w7tGYvRL5bcgQNYnbWKVZov4OZHgof/JN2ogviaX5/0Mv54yQC6HO6RCBWUZi+HDUue
 dW8KJO8LFxwnyI0d3Iz19IO9krwj7xBXEe7wLRrbM44QWjMcTQiQw0mEjULYUvtSi6UTmi
 ihvoVo/KeoCJ9RIVSLL7JeJxxu3Iiag=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-372-rI5tBNm_PrGaxr7Bu2NEXw-1; Fri, 22 Jan 2021 09:11:42 -0500
X-MC-Unique: rI5tBNm_PrGaxr7Bu2NEXw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B35C100B389;
 Fri, 22 Jan 2021 14:11:35 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-18.ams2.redhat.com [10.36.115.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DCA4E19EF1;
 Fri, 22 Jan 2021 14:11:33 +0000 (UTC)
Date: Fri, 22 Jan 2021 15:11:32 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v7 09/11] iotests: add testrunner.py
Message-ID: <20210122141132.GG15866@merkur.fritz.box>
References: <20210116134424.82867-1-vsementsov@virtuozzo.com>
 <20210116134424.82867-10-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210116134424.82867-10-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
> Add TestRunner class, which will run tests in a new python iotests
> running framework.
> 
> There are some differences with current ./check behavior, most
> significant are:
> - Consider all tests self-executable, just run them, don't run python
>   by hand.
> - Elapsed time is cached in json file
> - Elapsed time precision increased a bit
> - use python difflib instead of "diff -w", to ignore spaces at line
>   ends strip lines by hand. Do not ignore other spaces.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  tests/qemu-iotests/testrunner.py | 344 +++++++++++++++++++++++++++++++
>  1 file changed, 344 insertions(+)
>  create mode 100644 tests/qemu-iotests/testrunner.py

> +TestResult = collections.namedtuple(
> +    'TestResult',
> +    ['status', 'description', 'elapsed', 'diff', 'casenotrun'],
> +    defaults=('', '', '', ''))

defaults was only introduced in Python 3.7, it seems.

Why not use a normal class? I don't think we need the elements to be
iterable or indexable?

> +
> +class TestRunner(AbstractContextManager['TestRunner']):
> +    def __init__(self, env: TestEnv, makecheck: bool = False) -> None:
> +        self.env = env
> +        self.test_run_env = self.env.get_env()
> +        if 'MALLOC_PERTURB_' not in os.environ and \
> +                'MALLOC_PERTURB_' not in self.test_run_env:

'MALLOC_PERTURB_' is not in TestEnv.env_variables, so it will never be
in self.test_run_env here.

> +            x = random.randrange(1, 255)
> +            self.test_run_env['MALLOC_PERTURB_'] = str(x)
> +
> +        self.makecheck = makecheck
> +
> +        self.last_elapsed = LastElapsedTime('.last-elapsed-cache', env)
> +
> +    def __enter__(self) -> 'TestRunner':
> +        # pylint: disable=attribute-defined-outside-init

You can avoid this by declaring the attribute in __init__ without
initialising it yet:

    self._stack: contextlib.ExitStack

> +        self._stack = contextlib.ExitStack()
> +        self._stack.enter_context(self.env)
> +        self._stack.enter_context(self.last_elapsed)
> +        self._stack.enter_context(savetty())
> +        return self

Kevin


