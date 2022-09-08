Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A70955B1ACE
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 13:03:57 +0200 (CEST)
Received: from localhost ([::1]:46048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWFK8-0005DK-Bl
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 07:03:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oWFFV-0002X7-68
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 06:59:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oWFFR-0007XG-8G
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 06:59:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662634738;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZVrxA7ofuQx/IymQoz2IaLflJuVP0gMJp+e+VXwEBe0=;
 b=JMpkQ5fX1BfM1lesTiKWPIcGuZF2n6R4dbnTgeyT94O/QCiEpu3ts4RdVDw/iYoZUVPno+
 YBUelpLiKICDGQ7wfFLQLG85kPQC+N4pIBHFewMvAiHY9sCCDyQoMsLffGHJqO17UJzbnm
 4l5hJUZLq968w6hVpOicfnF5FMyqYqE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-522-CSBTPTPuMcaPUFOg2wi0ww-1; Thu, 08 Sep 2022 06:58:57 -0400
X-MC-Unique: CSBTPTPuMcaPUFOg2wi0ww-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E58408032FB
 for <qemu-devel@nongnu.org>; Thu,  8 Sep 2022 10:58:56 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.188])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 18BE9C15BB3;
 Thu,  8 Sep 2022 10:58:55 +0000 (UTC)
Date: Thu, 8 Sep 2022 12:58:54 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, stefanha@redhat.com, victortoso@redhat.com
Subject: Re: [PULL 00/10] QAPI patches patches for 2022-09-07
Message-ID: <YxnK7jFo+g2Ahvf4@redhat.com>
References: <20220907150327.538464-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220907150327.538464-1-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 07.09.2022 um 17:03 hat Markus Armbruster geschrieben:
> The following changes since commit 946e9bccf12f2bcc3ca471b820738fb22d14fc80:
> 
>   Merge tag 'samuel-thibault' of https://people.debian.org/~sthibault/qemu into staging (2022-09-06 08:31:24 -0400)
> 
> are available in the Git repository at:
> 
>   git://repo.or.cz/qemu/armbru.git tags/pull-qapi-2022-09-07
> 
> for you to fetch changes up to 6e7a37ffc230d06852f1a8893097331d39df77c9:
> 
>   qapi: fix examples of events missing timestamp (2022-09-07 15:10:13 +0200)
> 
> ----------------------------------------------------------------
> QAPI patches patches for 2022-09-07
> 
> ----------------------------------------------------------------
> Victor Toso (10):
>       qapi: fix example of query-ballon command
>       qapi: fix example of query-vnc command
>       qapi: fix example of query-dump-guest-memory-capability command
>       qapi: fix example of BLOCK_JOB_READY event
>       qapi: fix example of NIC_RX_FILTER_CHANGED event
>       qapi: fix example of DEVICE_UNPLUG_GUEST_ERROR event
>       qapi: fix example of MEM_UNPLUG_ERROR event
>       qapi: fix examples of blockdev-add with qcow2

NACK, this patch is wrong.

'file' is a required member (defined in BlockdevOptionsGenericFormat),
removing it makes the example invalid. 'data-file' is only an additional
optional member to be used for external data files (i.e. when the guest
data is kept separate from the metadata in the .qcow2 file).

Kevin

>       qapi: fix example of query-hotpluggable-cpus command
>       qapi: fix examples of events missing timestamp
> 
>  qapi/block-core.json | 12 ++++++------
>  qapi/dump.json       |  2 +-
>  qapi/machine.json    |  8 ++++----
>  qapi/migration.json  | 27 +++++++++++++++++++++++----
>  qapi/net.json        |  1 -
>  qapi/qdev.json       |  3 +--
>  qapi/ui.json         |  4 ++--
>  7 files changed, 37 insertions(+), 20 deletions(-)
> 
> -- 
> 2.37.2
> 
> 


