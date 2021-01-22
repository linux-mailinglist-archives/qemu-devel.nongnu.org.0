Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF73300616
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 15:53:22 +0100 (CET)
Received: from localhost ([::1]:53586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2xoP-0002DJ-V4
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 09:53:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l2xmk-0000mB-QY
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 09:51:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l2xmh-00087r-Ep
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 09:51:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611327092;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NN+iQauePqUL9OvS3IbNgWc9rISTPyzk08CZNINYcTs=;
 b=PhS08N3/MiDF2rUlT+G6wG+poVO6Mn8Y4eY21H9ejYllmyb+14aSTDvpZ8GrvKS1FFb6Hd
 kMYd9tNF0shDXW+pUdiOEOUE5f8+VVZ4G+zgv3Cy7mX6JxC394glV3Wrzqy0jE7iG+u5lu
 dQ9GlmhJFenvuOf0OLfU8y9KwrLfDH8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-1f-EQE8XOy6tWQffvbL0oA-1; Fri, 22 Jan 2021 09:51:30 -0500
X-MC-Unique: 1f-EQE8XOy6tWQffvbL0oA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A8ABD10054FF;
 Fri, 22 Jan 2021 14:51:29 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-18.ams2.redhat.com [10.36.115.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 34D195DA30;
 Fri, 22 Jan 2021 14:51:28 +0000 (UTC)
Date: Fri, 22 Jan 2021 15:51:26 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v7 09/11] iotests: add testrunner.py
Message-ID: <20210122145126.GI15866@merkur.fritz.box>
References: <20210116134424.82867-1-vsementsov@virtuozzo.com>
 <20210116134424.82867-10-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210116134424.82867-10-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.182,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Sorry for sending so many individual mails, but I'm running into things
as I actually run the code during the review of the final 'check'
rewrite.

I get this output for a failing test case:

    001   fail       [15:44:41] [15:44:42]   0.5s   (last: 13.2s) output mismatch (see {f_bad})
    --- /home/kwolf/source/qemu/tests/qemu-iotests/001.out

    +++ 001.out.bad

    @@ -1,4 +1,4 @@

    -QA output created by 001
    +Broken QA output created by 001
     Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134217728

     == reading whole image ==
    Failures: 001

Somehow we get additional empty lines in the diff header that shouldn't
be there. Not sure where it comes from. Especially the empty line after
@@ even corrupts the patch if you try to apply it.

The other problem is obvious enough:

> +        diff = file_diff(str(f_reference), str(f_bad))
> +        if diff:
> +            return TestResult(status='fail', elapsed=elapsed,
> +                              description='output mismatch (see {f_bad})',

This needs to be an f-string.

Kevin


