Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCCDA3E0B22
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 02:22:20 +0200 (CEST)
Received: from localhost ([::1]:51332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBR9P-0006Vt-D7
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 20:22:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mBR8A-0005bj-V4
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 20:21:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mBR89-0008DB-6L
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 20:21:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628122859;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5Q4HAdbbnaVHcCg9/ciILon7zzh6V/PFMAbYN6gER1s=;
 b=ZFSi9TKLhdgmY5RKRX6Dw0ft6khHEkd3OFEqZYlrBNT6fX9VL79uu/T0ltzYQSr33ts4GW
 v8rTKbW/Wdmvx9jpBXjG+zU/L4BXQg7S7St/rZAS9nyYopMXr38nORng6F44QtAwnA9Uwz
 ++XhNHeTYujVHc+DGzBD2PTIxzjwNR8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-3BjwJrynOEqMc-v8dBySSg-1; Wed, 04 Aug 2021 20:20:57 -0400
X-MC-Unique: 3BjwJrynOEqMc-v8dBySSg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 919661084F4C;
 Thu,  5 Aug 2021 00:20:56 +0000 (UTC)
Received: from [10.22.11.3] (unknown [10.22.11.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E9AA719C44;
 Thu,  5 Aug 2021 00:20:55 +0000 (UTC)
Subject: Re: [PATCH v2 0/6] qapi: static typing conversion, pt5b
To: qemu-devel@nongnu.org
References: <20210520225710.168356-1-jsnow@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <f979caff-c470-6c3f-422e-08de9dafad0f@redhat.com>
Date: Wed, 4 Aug 2021 20:20:55 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210520225710.168356-1-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) DKIMWL_WL_HIGH=-0.699, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.132,
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
Cc: Michael Roth <michael.roth@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/20/21 6:57 PM, John Snow wrote:
> This is part five (b), and focuses on QAPIDoc in parser.py.
> 
> gitlab: https://gitlab.com/jsnow/qemu/-/commits/python-qapi-cleanup-pt5b
> 
> Requirements:
> - Python 3.6+
> - mypy >= 0.770
> - pylint >= 2.6.0 (2.7.0+ when using Python 3.9+)
> 
> Every commit should pass with:
>   - `isort -c qapi/`
>   - `flake8 qapi/`
>   - `pylint --rcfile=qapi/pylintrc qapi/`
>   - `mypy --config-file=qapi/mypy.ini qapi/`
> 
> V2:
>   - Changed patch 01 to fix error message.
>   - Add a TODO for fixing the cycle in patch 03.
>   - Changed some commit messages, patch names
> 
> John Snow (6):
>    qapi/parser: fix unused check_args_section arguments
>    qapi/parser: Allow empty QAPIDoc Sections
>    qapi/parser: add type hint annotations (QAPIDoc)
>    qapi/parser: enable mypy checks
>    qapi/parser: Silence too-few-public-methods warning
>    qapi/parser: enable pylint checks
> 
>   scripts/qapi/mypy.ini                 |  5 --
>   scripts/qapi/parser.py                | 98 +++++++++++++++++----------
>   scripts/qapi/pylintrc                 |  3 +-
>   tests/qapi-schema/doc-bad-feature.err |  2 +-
>   4 files changed, 64 insertions(+), 44 deletions(-)
> 

 From memory, where we left off was:

- What is our plan for eliminating the cycle in QAPIDoc?
- What's the actual situation with these "empty" sections?

And my answer to both problems as of today is:

... I'm not really sure yet, but I have a lot of preliminary work 
building up on implementing a cross-referenceable QAPI domain for 
sphinx, which might necessitate some heavier changes to how QAPIDoc 
information is parsed and stored.

I'd like to cover fixing both design problems of QAPIDoc at that time if 
you'll let me sweep the dirt under the mat until then. I can add FIXME 
comments to the code -- at the moment, the configuration of ./python/ 
does not tolerate TODO nor FIXME comments, and I do intend to move 
./scripts/qapi to ./python/qemu/qapi once we finish typing it, so you 
can be assured that I'll have to address those to do the thing I want.

In the meantime it means a blemish in the form of TYPE_CHECKING, but it 
lets us get on with everything else in the meantime.

Worst case scenario: A meteorite pierces my skull and the work goes 
unfinished. parser.py type checks but has some FIXME comments jangling 
around that Someone:tm: has to fix, but the Heat Death Of The Universe 
occurs first. Nobody has any energy left to be dissatisfied with the way 
things wound up.

--js


