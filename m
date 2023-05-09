Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B65CE6FC099
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 09:43:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwHyW-0002Mc-KT; Tue, 09 May 2023 03:41:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pwHyU-0002MT-Hq
 for qemu-devel@nongnu.org; Tue, 09 May 2023 03:41:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pwHyS-0004Jk-WB
 for qemu-devel@nongnu.org; Tue, 09 May 2023 03:41:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683618088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=j+RedoO7zDm9cpisLFfA0e3lNH4vfSdz57sbmd0myE8=;
 b=CxkldwDEBnlx5FOARNeaP7a9DJCGNucV+Q3YZgHu9tjIinF77UqOWVTb/xNrOXlC+e1HaL
 zSJJW5zMBocdNtJxpDfMtAOyelh2Wl6XvNswRMRt0FSdgRlMxoLLc+WPXaXAVFMt47wAJ8
 Jax5F+ywUDZ2irdU1wgaFNLLFYfj4+s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-475-jKUWGjWdNzWYVN6hcnNFxg-1; Tue, 09 May 2023 03:41:23 -0400
X-MC-Unique: jKUWGjWdNzWYVN6hcnNFxg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 305DA100F64F;
 Tue,  9 May 2023 07:41:22 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 956A2C15BA0;
 Tue,  9 May 2023 07:41:21 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5FB9521E6924; Tue,  9 May 2023 09:41:20 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,  qemu-devel@nongnu.org,
 michael.roth@amd.com,  peter.maydell@linaro.org,  pbonzini@redhat.com,
 marcandre.lureau@redhat.com,  berrange@redhat.com,  thuth@redhat.com,
 philmd@linaro.org,  mst@redhat.com,  imammedo@redhat.com,
 anisinha@redhat.com,  eblake@redhat.com,  kraxel@redhat.com,
 kwolf@redhat.com,  hreitz@redhat.com,  arei.gonglei@huawei.com,
 pizhenwei@bytedance.com,  jsnow@redhat.com,  vsementsov@yandex-team.ru,
 eduardo@habkost.net,  marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com,  peterx@redhat.com,  leobras@redhat.com,
 jasowang@redhat.com,  yuval.shaia.ml@gmail.com,
 pavel.dovgaluk@ispras.ru,  jiri@resnulli.us,  stefanb@linux.vnet.ibm.com,
 stefanha@redhat.com,  lukasstraub2@web.de,  kkostiuk@redhat.com,
 qemu-block@nongnu.org,  victortoso@redhat.com
Subject: Re: [PATCH 13/17] qapi: Relax doc string @name: description
 indentation rules
References: <20230428105429.1687850-1-armbru@redhat.com>
 <20230428105429.1687850-14-armbru@redhat.com>
 <87sfcj6eyw.fsf@secure.mitica>
Date: Tue, 09 May 2023 09:41:20 +0200
In-Reply-To: <87sfcj6eyw.fsf@secure.mitica> (Juan Quintela's message of "Fri, 
 28 Apr 2023 20:25:59 +0200")
Message-ID: <87ednqj6jj.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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

Juan Quintela <quintela@redhat.com> writes:

> Markus Armbruster <armbru@redhat.com> wrote:
>> The QAPI schema doc comment language provides special syntax for
>> command and event arguments, struct and union members, alternate
>> branches, enumeration values, and features: descriptions starting with
>> "@name:".
>>
>> By convention, we format them like this:
>>
>>     # @name: Lorem ipsum dolor sit amet, consectetur adipiscing elit,
>>     #        sed do eiusmod tempor incididunt ut labore et dolore
>>     #        magna aliqua.
>>
>> Okay for names as short as "name", but we have much longer ones.  Their
>> description gets squeezed against the right margin, like this:
>>
>>     # @dirty-sync-missed-zero-copy: Number of times dirty RAM synchronization could
>>     #                               not avoid copying dirty pages. This is between
>>     #                               0 and @dirty-sync-count * @multifd-channels.
>>     #                               (since 7.1)
>>
>> The description text is effectively just 50 characters wide.  Easy
>> enough to read, but can be cumbersome to write.
>>
>> The awkward squeeze against the right margin makes people go beyond it,
>> which produces two undesirables: arguments about style, and descriptions
>> that are unnecessarily hard to read, like this one:
>>
>>     # @postcopy-vcpu-blocktime: list of the postcopy blocktime per vCPU.  This is
>>     #                           only present when the postcopy-blocktime migration capability
>>     #                           is enabled. (Since 3.0)
>>
>> We could instead format it like
>>
>>     # @postcopy-vcpu-blocktime:
>>     # list of the postcopy blocktime per vCPU.  This is only present
>>     # when the postcopy-blocktime migration capability is
>>     # enabled. (Since 3.0)
>>
>> or, since the commit before previous, like
>>
>>     # @postcopy-vcpu-blocktime:
>>     # 	  list of the postcopy blocktime per vCPU.  This is only present
>>     # 	  when the postcopy-blocktime migration capability is
>>     # 	  enabled. (Since 3.0)
>>
>> However, I'd rather have
>>
>>     # @postcopy-vcpu-blocktime: list of the postcopy blocktime per vCPU.
>>     #     This is only present when the postcopy-blocktime migration
>>     #     capability is enabled.  (Since 3.0)
>>
>> because this is how rST field and option lists work.
>>
>> To get this, we need to let the first non-blank line after the
>> "@name:" line determine expected indentation.
>>
>> This fills up the indentation pitfall mentioned in
>> docs/devel/qapi-code-gen.rst.  A related pitfall still exists.  Update
>> the text to show it.
>>
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>
> Reviewed-by: Juan Quintela <quintela@redhat.com>
>
>> ---
>>  docs/devel/qapi-code-gen.rst          | 10 ++--
>>  scripts/qapi/parser.py                | 73 +++++++--------------------
>>  tests/qapi-schema/doc-bad-indent.err  |  2 +-
>>  tests/qapi-schema/doc-bad-indent.json |  3 +-
>
> bad order of files
>
>>  tests/qapi-schema/doc-good.json       |  3 +-
>>  tests/qapi-schema/doc-good.out        |  3 +-
>
> good order of files
>
> Should we tweak orderfiles so it displays first the json, and the err or
> out files. reviewing json and then output makes things (at least to me)
> simpler.

I'll look into it.

Thanks!


