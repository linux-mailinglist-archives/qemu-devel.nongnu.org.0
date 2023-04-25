Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C90986EDB03
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 07:01:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prAmU-0000iT-9Q; Tue, 25 Apr 2023 00:59:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1prAmQ-0000iA-02
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 00:59:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1prAmM-0004nX-JJ
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 00:59:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682398788;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=A/ErBiNZJUSehrr/XHRa2g/6ETK6ZSu0faDGyZDntEs=;
 b=WEl0Zmq/9ieBm1zavFfmEfs9pvpa4NIWR2Hd9djvuJci2tWA9okmwhJ7zj/USCHmusuONA
 fULgZxvwU9ByWHRuSTuiQpp8s3BLSXMSFIafOzE6qe1xopNCU69PKZ2nEaODaiTLvPxArH
 aGAhekMgizcrd9Wqt6l6EmHj9C30ib0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-581-5vjYnB-HPyiDX0lGxlglrQ-1; Tue, 25 Apr 2023 00:59:44 -0400
X-MC-Unique: 5vjYnB-HPyiDX0lGxlglrQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 47A8C811E7C;
 Tue, 25 Apr 2023 04:59:44 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E3F202027043;
 Tue, 25 Apr 2023 04:59:42 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D5AAB21E675B; Tue, 25 Apr 2023 06:59:41 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org,  michael.roth@amd.com,  kwolf@redhat.com,
 hreitz@redhat.com,  pbonzini@redhat.com,  marcandre.lureau@redhat.com,
 arei.gonglei@huawei.com,  pizhenwei@bytedance.com,  jsnow@redhat.com,
 vsementsov@yandex-team.ru,  eduardo@habkost.net,
 marcel.apfelbaum@gmail.com,  wangyanan55@huawei.com,
 quintela@redhat.com,  jasowang@redhat.com,  yuval.shaia.ml@gmail.com,
 stefanha@redhat.com,  kraxel@redhat.com,  kkostiuk@redhat.com,
 qemu-block@nongnu.org
Subject: Re: [PATCH 16/16] qapi storage-daemon/qapi: Fix documentation
 section structure
References: <20230404115912.2829251-1-armbru@redhat.com>
 <20230404115912.2829251-17-armbru@redhat.com>
 <zvpeqmvqh3cujipmtidqivqslqnlr4nlkuich7jqjtpzpr3qjt@ywve7svdclba>
Date: Tue, 25 Apr 2023 06:59:41 +0200
In-Reply-To: <zvpeqmvqh3cujipmtidqivqslqnlr4nlkuich7jqjtpzpr3qjt@ywve7svdclba>
 (Eric Blake's message of "Tue, 4 Apr 2023 08:12:45 -0500")
Message-ID: <871qk84kw2.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Eric Blake <eblake@redhat.com> writes:

> On Tue, Apr 04, 2023 at 01:59:12PM +0200, Markus Armbruster wrote:
>> In the QEMU QMP Reference Manual, subsection "Block core (VM
>> unrelated)" is empty.  Its contents is at the end of subsection
>> "Background jobs" instead.  That's because qapi/job.json is includeded
>
> included

Fixing...

>> first from qapi/block-core.json, which makes qapi/job.json's
>> documentation go between qapi/block-core.json's subsection heading and
>> contents.
>> 
>> In the QEMU Storage Daemon QMP Reference Manual, section "Block
>> Devices" contains nothing but an empty subsection "Block core (VM
>> unrelated)".  The latter's contents is at the end section "Socket data
>> types", along with subsection "Block device exports".  Subsection
>> "Background jobs" is at the end of section "Cryptography".  All this
>> is because storage-daemon/qapi/qapi-schema.json includes modules in a
>> confused order.
>> 
>> Fix both as follows.
>> 
>> Turn subsection "Background jobs" into a section.
>> 
>> Move it before section "Block devices" in the QEMU QMP Reference
>> Manual, by including qapi/jobs.json right before qapi/block.json.
>> 
>> Reorder include directives in storage-daemon/qapi/qapi-schema.json to
>> match the order in qapi/qapi-schema.json, so that the QEMU Storage
>> Daemon QMP Reference Manual's section structure the QEMU QMP Reference
>> Manual's.
>> 
>> In the QEMU QMP Reference Manual, qapi/cryptodev.json's documentation
>> is at the end of section "Virtio devices".  That's because it lacks a
>> section heading, and therefore gets squashed into whatever section
>> happens to precede it.
>> 
>> Add section heading so it's in section "Cryptography devices".
>> 
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>  qapi/cryptodev.json                  |  4 ++++
>>  qapi/job.json                        |  2 +-
>>  qapi/qapi-schema.json                |  2 +-
>>  storage-daemon/qapi/qapi-schema.json | 22 +++++++++++++++-------
>>  4 files changed, 21 insertions(+), 9 deletions(-)
>
> Reviewed-by: Eric Blake <eblake@redhat.com>

Thanks!


