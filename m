Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB51B2FDB38
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 21:54:22 +0100 (CET)
Received: from localhost ([::1]:33322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2KUf-0004g1-VK
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 15:54:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l2KTT-00043i-AH
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 15:53:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l2KTR-0005dJ-Sg
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 15:53:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611175984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7VSwJu92VUvQgAom2XVZM8SwW3UhBDHeZWZlnnqzOM8=;
 b=i737nCMEFTULGWjo+W7SPd1uZmGoQMddV92c6TpfBs8bQE/814tkOjpKZbGlScmF8qZZ6N
 ag4lYMir63cWu6eQEr6Mprseqf9z8igck/WuZKhZt6dCFJawY7lBVRPhe+oPcFDzFgZ/ju
 bNwmOMBWUq1Hdpj+aSMQ+GUnuvwSd4w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-7DUHitlwO7-j9tDWpBwabA-1; Wed, 20 Jan 2021 15:52:59 -0500
X-MC-Unique: 7DUHitlwO7-j9tDWpBwabA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 80F35107ACE4;
 Wed, 20 Jan 2021 20:52:58 +0000 (UTC)
Received: from [10.3.113.116] (ovpn-113-116.phx2.redhat.com [10.3.113.116])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C898C10023B6;
 Wed, 20 Jan 2021 20:52:57 +0000 (UTC)
Subject: Re: [PATCH v7 00/11] Rework iotests/check
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210116134424.82867-1-vsementsov@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <c4bdbd03-7a03-3bf2-3f6e-c8c85dd9897c@redhat.com>
Date: Wed, 20 Jan 2021 14:52:57 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210116134424.82867-1-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, den@openvz.org, jsnow@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/16/21 7:44 AM, Vladimir Sementsov-Ogievskiy wrote:
> Hi all!
> 
> These series has 3 goals:
> 
>  - get rid of group file (to forget about rebase and in-list conflicts)
>  - introduce human-readable names for tests
>  - rewrite check into python
> 
> v7:
>   - fix wording and grammar
>   - satisfy python linters
>   - move argv interfaces all into one in new check script
>   - support '-n' == '--dry-run' option
>   - update check-block to run check with correct PYTHON

I'd really like a second reviewer on 7-11, but I'm queueing 1-6 on my
NBD tree now.

> 
>  findtests: - stop parsing test file after first '# group: ' line
>             - use parse_test_name in add_group_file()
>             - make new list instead of modifying parameter exclude_groups
> 
>  testenv: - fix machine_map
>           - fix self.python
> 
>  testrunner: use env.python to run python tests
> 
> Vladimir Sementsov-Ogievskiy (11):
>   iotests/277: use dot slash for nbd-fault-injector.py running
>   iotests/303: use dot slash for qcow2.py running
>   iotests: fix some whitespaces in test output files
>   iotests: make tests executable
>   iotests/294: add shebang line
>   iotests: define group in each iotest
>   iotests: add findtests.py
>   iotests: add testenv.py
>   iotests: add testrunner.py
>   iotests: rewrite check into python
>   iotests: rename and move 169 and 199 tests
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


