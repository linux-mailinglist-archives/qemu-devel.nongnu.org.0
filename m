Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8B26FC03E
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 09:13:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwHWZ-0001cK-Fq; Tue, 09 May 2023 03:12:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pwHWT-0001aR-Cw
 for qemu-devel@nongnu.org; Tue, 09 May 2023 03:12:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pwHWR-0007UC-TI
 for qemu-devel@nongnu.org; Tue, 09 May 2023 03:12:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683616351;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=30NVaWRi/+oZ2QUGwoNO97PXlaAzgUjlw9640EZQe6w=;
 b=J650EL5NyQtSg4sLyp1drWuERtUp4AHutmnHywgRi+5qr7do2Wvl6OsaqlM+5TKpzysh3W
 XUGufPHlzhSUKSOd1La9i5n1t9Tq1ntqx5h9wMyvMDClAP+1QX/ZkesOA6k72VomUhbDU6
 d+ucEzNiqC0Jp1MHZ6njoXgYKgFTR1M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-237-_2MwlNySN2OkOnMsvRSJFw-1; Tue, 09 May 2023 03:12:25 -0400
X-MC-Unique: _2MwlNySN2OkOnMsvRSJFw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F00FF868C95;
 Tue,  9 May 2023 07:12:24 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C7E2C40C6E67;
 Tue,  9 May 2023 07:12:24 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8BB5821E6924; Tue,  9 May 2023 09:12:23 +0200 (CEST)
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
Subject: Re: [PATCH 07/17] qapi: Tidy up a slightly awkward TODO comment
References: <20230428105429.1687850-1-armbru@redhat.com>
 <20230428105429.1687850-8-armbru@redhat.com>
 <87sfcj7ulo.fsf@secure.mitica>
Date: Tue, 09 May 2023 09:12:23 +0200
In-Reply-To: <87sfcj7ulo.fsf@secure.mitica> (Juan Quintela's message of "Fri, 
 28 Apr 2023 20:02:59 +0200")
Message-ID: <87ttwmj7vs.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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
>> MigrateSetParameters has a TODO comment sitting right behind its doc
>> comment.  I wrote it this way to keep it out of the manual, but that
>> reason is not obvious.
>>
>> The previous commit (sphinx/qapidoc: Do not emit TODO sections into
>> user manuals) lets me move it into the doc comment as a TODO section.
>>
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>
> Reviewed-by: Juan Quintela <quintela@redhat.com>
>
>> ---
>>  qapi/migration.json | 5 +++--
>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/qapi/migration.json b/qapi/migration.json
>> index 82000adce4..11c09800c2 100644
>> --- a/qapi/migration.json
>> +++ b/qapi/migration.json
>> @@ -945,10 +945,11 @@
>>  # Features:
>>  # @unstable: Member @x-checkpoint-delay is experimental.
>>  #
>> +# TODO: either fuse back into MigrationParameters, or make
>> +#       MigrationParameters members mandatory
>> +#
>>  # Since: 2.4
>
> 2.4 was released in 2015-08-11
> There is no hope for something that has been experimental since then.

I wish it was experimental!  It's actually awfully stable technical
debt.

Thanks!


