Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6434C1E86F1
	for <lists+qemu-devel@lfdr.de>; Fri, 29 May 2020 20:49:54 +0200 (CEST)
Received: from localhost ([::1]:54228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jek4m-0007PD-7n
	for lists+qemu-devel@lfdr.de; Fri, 29 May 2020 14:49:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1jek3v-0006yt-Tx
 for qemu-devel@nongnu.org; Fri, 29 May 2020 14:49:00 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:33020
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1jek3u-0005ge-6a
 for qemu-devel@nongnu.org; Fri, 29 May 2020 14:48:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590778136;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SMVJ0uEgbKS+FYDOhSdvAK7b/1AqSURP3C4gdAzgsxY=;
 b=iJ6a50SXsWKd0UyAUyqEe+4Hbeli3vAKR6ULv+YnE3vU7yUxE5wk3lw2FdWFgAO35HS9X4
 O8eevMllGrmqi4/wYhAyfZlGOwsnH9FbJ0FfZOKZBoxxUGtQWuNCzJ7hVAfLfAjYKL5kn3
 5KhoAChzWWHUGE7Hlio7ewfviwwbHFw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-NuHK6g_dP1SDYXX-W4ylgQ-1; Fri, 29 May 2020 14:48:55 -0400
X-MC-Unique: NuHK6g_dP1SDYXX-W4ylgQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1F8F980183C;
 Fri, 29 May 2020 18:48:54 +0000 (UTC)
Received: from work-vm (ovpn-113-111.ams2.redhat.com [10.36.113.111])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E88F95D9D5;
 Fri, 29 May 2020 18:48:52 +0000 (UTC)
Date: Fri, 29 May 2020 19:48:50 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, armbru@redhat.com
Subject: Re: [PATCH 0/2] HMP: qom-get and set
Message-ID: <20200529184850.GB2895@work-vm>
References: <20200520151108.160598-1-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200520151108.160598-1-dgilbert@redhat.com>
User-Agent: Mutt/1.13.4 (2020-02-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/29 01:27:49
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, T_HK_NAME_DR=0.01 autolearn=_AUTOLEARN
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
Cc: berrange@redhat.com, clg@kaod.org, afaerber@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Dr. David Alan Gilbert (git) (dgilbert@redhat.com) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> HMP has had a qom-set for a long time, but not a matching qom-get;
> various attempts have been made to add one over the last 5 years.
> Here's another go.
> 
> It's got simpler due to a suggestion by Markus to take the output
> from qmp's qom-get.  While we're here, rework hmp's qom-set to be
> a wrapper around the qmp equivalent, which simplifies it a bit.
> 
> In one post people didn't particularly like the use of JSON,
> but in the intervening 4 years no one has implemented anything to
> avoid it, and the output is trivially readable for non-structures
> and still pretty readable for (the very rare) structures.
> 
> Dave

Queued

> 
> Dr. David Alan Gilbert (2):
>   hmp: Implement qom-get HMP command
>   hmp: Simplify qom_set
> 
>  hmp-commands.hx        | 14 ++++++++++++++
>  include/monitor/hmp.h  |  1 +
>  qom/qom-hmp-cmds.c     | 34 +++++++++++++++++++++++-----------
>  tests/qtest/test-hmp.c |  1 +
>  4 files changed, 39 insertions(+), 11 deletions(-)
> 
> -- 
> 2.26.2
> 
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


