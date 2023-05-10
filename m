Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9386FE17A
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 17:22:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwldv-0002DB-4S; Wed, 10 May 2023 11:22:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pwlds-0002C0-Df
 for qemu-devel@nongnu.org; Wed, 10 May 2023 11:22:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pwldq-0006S4-H5
 for qemu-devel@nongnu.org; Wed, 10 May 2023 11:22:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683732129;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DRJ9hZuTlfSHvoRZHO88Lh90T1UD4B8QNAMaTcG0Jg0=;
 b=gOp89r1ECaPsXpYjyu7cy2y1rJONvA1xAhBe6ihTXYpeKaKBCq7229UWBminT7tl8/utcp
 DCITcgwn8r8QXA/XmkpE5QAFzHUGe9Y863QE7hMEKq9VLOUsDQ1etdLendunXZdiJJHOSC
 AuJ3A2/zEs7YVQWuiOKFpYf5fsnm7KI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-417-Ozid0BPrP86X5zeVDI33rw-1; Wed, 10 May 2023 11:22:05 -0400
X-MC-Unique: Ozid0BPrP86X5zeVDI33rw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 589E1870832;
 Wed, 10 May 2023 15:22:05 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2DCD847CD0;
 Wed, 10 May 2023 15:22:05 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id EE09321E6924; Wed, 10 May 2023 17:22:02 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PULL v2 00/17] QAPI patches patches for 2023-05-09
References: <20230510081224.3588673-1-armbru@redhat.com>
 <e94e5411-66de-3aa6-3ed2-f16154ec5294@linaro.org>
Date: Wed, 10 May 2023 17:22:02 +0200
In-Reply-To: <e94e5411-66de-3aa6-3ed2-f16154ec5294@linaro.org> (Richard
 Henderson's message of "Wed, 10 May 2023 15:59:45 +0100")
Message-ID: <877ctg2ov9.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Richard Henderson <richard.henderson@linaro.org> writes:

> On 5/10/23 09:12, Markus Armbruster wrote:
>> The following changes since commit 792f77f376adef944f9a03e601f6ad90c2f891b2:
>>    Merge tag 'pull-loongarch-20230506' of https://gitlab.com/gaosong/qemu into staging (2023-05-06 08:11:52 +0100)
>> are available in the Git repository at:
>>    https://repo.or.cz/qemu/armbru.git tags/pull-qapi-2023-05-09-v2
>> for you to fetch changes up to a937b6aa739f65f2cae2ad9a7eb65a309ad2a359:
>>    qapi: Reformat doc comments to conform to current conventions (2023-05-10 10:01:01 +0200)
>> ----------------------------------------------------------------
>> QAPI patches patches for 2023-05-09
>> ----------------------------------------------------------------
>> Markus Armbruster (17):
>>        docs/devel/qapi-code-gen: Clean up use of quotes a bit
>>        docs/devel/qapi-code-gen: Turn FIXME admonitions into comments
>>        qapi: Fix crash on stray double quote character
>>        meson: Fix to make QAPI generator output depend on main.py
>>        Revert "qapi: BlockExportRemoveMode: move comments to TODO"
>>        sphinx/qapidoc: Do not emit TODO sections into user manuals
>>        qapi: Tidy up a slightly awkward TODO comment
>>        qapi/dump: Indent bulleted lists consistently
>>        tests/qapi-schema/doc-good: Improve a comment
>>        tests/qapi-schema/doc-good: Improve argument description tests
>>        qapi: Fix argument description indentation stripping
>>        qapi: Rewrite parsing of doc comment section symbols and tags
>>        qapi: Relax doc string @name: description indentation rules
>>        qapi: Section parameter @indent is no longer used, drop
>>        docs/devel/qapi-code-gen: Update doc comment conventions
>>        qga/qapi-schema: Reformat doc comments to conform to current conventions
>>        qapi: Reformat doc comments to conform to current conventions
>
> I didn't notice earlier, because centos-stream-8-x86_64 failure is optional,
> but this has another error:
>
> https://gitlab.com/qemu-project/qemu/-/jobs/4258751398#L4649
>
> Exception occurred:
>   File "/home/gitlab-runner/builds/Jpwtyaz7/0/qemu-project/qemu/docs/../scripts/qapi/parser.py", line 566, in QAPIDoc
>     def _match_at_name_colon(string: str) -> re.Match:
> AttributeError: module 're' has no attribute 'Match'

I'll take care of it.  Thanks!


