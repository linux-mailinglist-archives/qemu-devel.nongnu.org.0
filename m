Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBA6435D53
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 10:50:08 +0200 (CEST)
Received: from localhost ([::1]:49356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdTm3-0005Ov-VF
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 04:50:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mdTkc-0003sS-PJ
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 04:48:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mdTkb-0003jk-76
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 04:48:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634806116;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fESNr/S9YYUAO5dq6lAmRpghrrWE86RQnA3FlSg7qiU=;
 b=brsW7ctgDcHd1fgcTQsCeKI7ZlfndtOH7nh6wOAfuROa/njJZKJUJzy+CwFc6Qpmo1o9ti
 wWv9Czz3XNtaraUPNiftnd5YWIprGLgLlbrIkvqj3wLY78esMv5XqT8kgOy21776erJGEg
 TAKpU1K9pb5kzl99vaETv+Hih05K0+c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-314-A4p3i9ZoO92dKcqEuP_cwQ-1; Thu, 21 Oct 2021 04:48:34 -0400
X-MC-Unique: A4p3i9ZoO92dKcqEuP_cwQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 30AE5100628B;
 Thu, 21 Oct 2021 08:48:23 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B463999D3;
 Thu, 21 Oct 2021 08:48:22 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3AE9111380A7; Thu, 21 Oct 2021 10:48:21 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v2 2/5] qapi: Add feature flags to enum members
References: <20211009120944.2858887-1-armbru@redhat.com>
 <20211009120944.2858887-3-armbru@redhat.com>
 <YWVmV1gdJb66nN2+@redhat.com>
Date: Thu, 21 Oct 2021 10:48:21 +0200
In-Reply-To: <YWVmV1gdJb66nN2+@redhat.com> (Kevin Wolf's message of "Tue, 12
 Oct 2021 12:41:27 +0200")
Message-ID: <87wnm6epbe.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: vsementsov@virtuozzo.com, berrange@redhat.com, libvir-list@redhat.com,
 eblake@redhat.com, mdroth@linux.vnet.ibm.com, qemu-devel@nongnu.org,
 pkrempa@redhat.com, marcandre.lureau@redhat.com, jsnow@redhat.com,
 libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kevin Wolf <kwolf@redhat.com> writes:

> Am 09.10.2021 um 14:09 hat Markus Armbruster geschrieben:
>> This is quite similar to commit 84ab008687 "qapi: Add feature flags to
>> struct members", only for enums instead of structs.
>> 
>> Special feature flag 'deprecated' is silently ignored there.  This is
>> okay only because it will be implemented shortly.
>> 
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> Reviewed-by: Eric Blake <eblake@redhat.com>
>
> Should we have a test case for an invalid value for 'features'?

We have coverage, just not in every context.

struct context:

    tests/qapi-schema/features-bad-type.json
    tests/qapi-schema/features-deprecated-type.json
    tests/qapi-schema/features-duplicate-name.json
    tests/qapi-schema/features-if-invalid.json
    tests/qapi-schema/features-missing-name.json
    tests/qapi-schema/features-name-bad-type.json
    tests/qapi-schema/features-no-list.json
    tests/qapi-schema/features-unknown-key.json

struct member context:

    tests/qapi-schema/features-member-bad-type.json
    tests/qapi-schema/features-member-duplicate-name.json
    tests/qapi-schema/features-member-if-invalid.json
    tests/qapi-schema/features-member-missing-name.json
    tests/qapi-schema/features-member-name-bad-type.json
    tests/qapi-schema/features-member-no-list.json
    tests/qapi-schema/features-member-unknown-key.json

These are basically the same, except for features-deprecated-type.json,
which makes sense only in struct context.

The other contexts are enum, union, alternate, command, event, and now
enum member.

My excuse for skipping contexts is that the errors come from
check_features() for all them.


