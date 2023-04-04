Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8EC6D626C
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 15:13:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjgT5-0000yn-Rd; Tue, 04 Apr 2023 09:12:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pjgT4-0000yA-B9
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 09:12:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pjgT2-0000g4-8t
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 09:12:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680613975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kMmw5+JjvUS+vk/aEuR9n2/3XrR6JNxXuiiyJPxcgPs=;
 b=ZMpJyrnH8xPRKXljFNCPpRUP6qtQbnj3YSvkArZwkllJNC9ubPMNhekJTxdQarV/NxrP6H
 /gSF+arfmEsTwRe+nkp7xn53NsZJ6WOsMC2pl8EVuc920EwhKMDzZeYe0ppYotfu6uHBUh
 GrXx5m9xA1lc5wO7It8HJA9SRst5Nfw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-642--x-GCRRLMT654x_8j6zDRw-1; Tue, 04 Apr 2023 09:12:52 -0400
X-MC-Unique: -x-GCRRLMT654x_8j6zDRw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5FD3F2814246;
 Tue,  4 Apr 2023 13:12:51 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.110])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 158012027061;
 Tue,  4 Apr 2023 13:12:47 +0000 (UTC)
Date: Tue, 4 Apr 2023 08:12:45 -0500
From: Eric Blake <eblake@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, michael.roth@amd.com, kwolf@redhat.com, 
 hreitz@redhat.com, pbonzini@redhat.com, marcandre.lureau@redhat.com, 
 arei.gonglei@huawei.com, pizhenwei@bytedance.com, jsnow@redhat.com, 
 vsementsov@yandex-team.ru, eduardo@habkost.net, marcel.apfelbaum@gmail.com, 
 wangyanan55@huawei.com, quintela@redhat.com, jasowang@redhat.com, 
 yuval.shaia.ml@gmail.com, stefanha@redhat.com, kraxel@redhat.com,
 kkostiuk@redhat.com, qemu-block@nongnu.org
Subject: Re: [PATCH 16/16] qapi storage-daemon/qapi: Fix documentation
 section structure
Message-ID: <zvpeqmvqh3cujipmtidqivqslqnlr4nlkuich7jqjtpzpr3qjt@ywve7svdclba>
References: <20230404115912.2829251-1-armbru@redhat.com>
 <20230404115912.2829251-17-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230404115912.2829251-17-armbru@redhat.com>
User-Agent: NeoMutt/20230322
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, Apr 04, 2023 at 01:59:12PM +0200, Markus Armbruster wrote:
> In the QEMU QMP Reference Manual, subsection "Block core (VM
> unrelated)" is empty.  Its contents is at the end of subsection
> "Background jobs" instead.  That's because qapi/job.json is includeded

included

> first from qapi/block-core.json, which makes qapi/job.json's
> documentation go between qapi/block-core.json's subsection heading and
> contents.
> 
> In the QEMU Storage Daemon QMP Reference Manual, section "Block
> Devices" contains nothing but an empty subsection "Block core (VM
> unrelated)".  The latter's contents is at the end section "Socket data
> types", along with subsection "Block device exports".  Subsection
> "Background jobs" is at the end of section "Cryptography".  All this
> is because storage-daemon/qapi/qapi-schema.json includes modules in a
> confused order.
> 
> Fix both as follows.
> 
> Turn subsection "Background jobs" into a section.
> 
> Move it before section "Block devices" in the QEMU QMP Reference
> Manual, by including qapi/jobs.json right before qapi/block.json.
> 
> Reorder include directives in storage-daemon/qapi/qapi-schema.json to
> match the order in qapi/qapi-schema.json, so that the QEMU Storage
> Daemon QMP Reference Manual's section structure the QEMU QMP Reference
> Manual's.
> 
> In the QEMU QMP Reference Manual, qapi/cryptodev.json's documentation
> is at the end of section "Virtio devices".  That's because it lacks a
> section heading, and therefore gets squashed into whatever section
> happens to precede it.
> 
> Add section heading so it's in section "Cryptography devices".
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  qapi/cryptodev.json                  |  4 ++++
>  qapi/job.json                        |  2 +-
>  qapi/qapi-schema.json                |  2 +-
>  storage-daemon/qapi/qapi-schema.json | 22 +++++++++++++++-------
>  4 files changed, 21 insertions(+), 9 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


