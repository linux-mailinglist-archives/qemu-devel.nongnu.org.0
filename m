Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B55446FC203
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 10:51:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwJ3q-0007t9-2q; Tue, 09 May 2023 04:51:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pwJ3n-0007iP-Q4
 for qemu-devel@nongnu.org; Tue, 09 May 2023 04:51:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pwJ3k-0002Z8-Fd
 for qemu-devel@nongnu.org; Tue, 09 May 2023 04:51:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683622259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vBmoKsmc6rod29kPgh3+7bv3NKwQMUa0CxMZ4chM2lA=;
 b=RfN3oZPCoODraaxwADlAWbwqL9Zfe4sXUCUKVECwFcZgjam4i10lNMSgnD5wwndV3kW97C
 m64aRSZh6vb4Mgq94pFeYAC+Ud+OqSDSVnKjIG7/0w8dAOjMVOvEs39IVPecb6WTIYGIuD
 bf+PPalBTYF87RcQhtKhqZnexD6pesI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-168-jucSnsVSOKyqhifqvDQt4w-1; Tue, 09 May 2023 04:50:53 -0400
X-MC-Unique: jucSnsVSOKyqhifqvDQt4w-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0A8B4101A55C;
 Tue,  9 May 2023 08:50:53 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CB012492B01;
 Tue,  9 May 2023 08:50:51 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 70CA521E6924; Tue,  9 May 2023 10:50:50 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org,  michael.roth@amd.com,  peter.maydell@linaro.org,
 pbonzini@redhat.com,  marcandre.lureau@redhat.com,  berrange@redhat.com,
 thuth@redhat.com,  philmd@linaro.org,  mst@redhat.com,
 imammedo@redhat.com,  anisinha@redhat.com,  eblake@redhat.com,
 kraxel@redhat.com,  kwolf@redhat.com,  hreitz@redhat.com,
 arei.gonglei@huawei.com,  pizhenwei@bytedance.com,  jsnow@redhat.com,
 vsementsov@yandex-team.ru,  eduardo@habkost.net,
 marcel.apfelbaum@gmail.com,  wangyanan55@huawei.com,  peterx@redhat.com,
 leobras@redhat.com,  jasowang@redhat.com,  yuval.shaia.ml@gmail.com,
 pavel.dovgaluk@ispras.ru,  jiri@resnulli.us,  stefanb@linux.vnet.ibm.com,
 stefanha@redhat.com,  lukasstraub2@web.de,  kkostiuk@redhat.com,
 qemu-block@nongnu.org,  victortoso@redhat.com
Subject: Re: [PATCH 13/17] qapi: Relax doc string @name: description
 indentation rules
References: <20230428105429.1687850-1-armbru@redhat.com>
 <20230428105429.1687850-14-armbru@redhat.com>
 <87sfcj6eyw.fsf@secure.mitica> <87ednqj6jj.fsf@pond.sub.org>
Date: Tue, 09 May 2023 10:50:50 +0200
In-Reply-To: <87ednqj6jj.fsf@pond.sub.org> (Markus Armbruster's message of
 "Tue, 09 May 2023 09:41:20 +0200")
Message-ID: <87pm79j3bp.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Markus Armbruster <armbru@redhat.com> writes:

> Juan Quintela <quintela@redhat.com> writes:

[...]

>>>  docs/devel/qapi-code-gen.rst          | 10 ++--
>>>  scripts/qapi/parser.py                | 73 +++++++--------------------
>>>  tests/qapi-schema/doc-bad-indent.err  |  2 +-
>>>  tests/qapi-schema/doc-bad-indent.json |  3 +-
>>
>> bad order of files
>>
>>>  tests/qapi-schema/doc-good.json       |  3 +-
>>>  tests/qapi-schema/doc-good.out        |  3 +-
>>
>> good order of files
>>
>> Should we tweak orderfiles so it displays first the json, and the err or
>> out files. reviewing json and then output makes things (at least to me)
>> simpler.
>
> I'll look into it.
>
> Thanks!

We used to put the tests/qapi-schema/*json first, and it was annoying
enough for me to change it in commit b1862ee6233.  Any other ideas?


commit b1862ee6233805172bab89a1fc44e929dcdbd9fa
Author: Markus Armbruster <armbru@redhat.com>
Date:   Fri Sep 13 22:13:34 2019 +0200

    scripts/git.orderfile: Match QAPI schema more precisely
=20=20=20=20
    Pattern *.json also matches the tests/qapi-schema/*.json.  Separates
    them from the tests/qapi-schema/*.{err,exit,out} in diffs.  I hate
    that.  Change the pattern to match just the "real" QAPI schemata.
=20=20=20=20
    Signed-off-by: Markus Armbruster <armbru@redhat.com>
    Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
    Message-Id: <20190913201349.24332-2-armbru@redhat.com>

diff --git a/scripts/git.orderfile b/scripts/git.orderfile
index ac699700b1..e89790941c 100644
--- a/scripts/git.orderfile
+++ b/scripts/git.orderfile
@@ -19,11 +19,11 @@ Makefile*
 *.mak
=20
 # qapi schema
-*.json
+qapi/*.json
+qga/*.json
=20
 # headers
 *.h
=20
 # code
 *.c
-


