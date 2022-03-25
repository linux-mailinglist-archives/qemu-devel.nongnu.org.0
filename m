Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1546C4E75A1
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 16:02:16 +0100 (CET)
Received: from localhost ([::1]:49746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXlSA-0000tz-Qb
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 11:02:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nXlPp-00072y-KC
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 10:59:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nXlPm-0004TH-N9
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 10:59:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648220377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=v2PH3o6qNorTEFNQpI+HXFAjPb88kgiHnMGZj9ELo1E=;
 b=djv6w9C/dXhWNKxEHcqmPpkNSK8UME4WYkHHVgy95E1ECR9W6KreE08TUPB7d0NWt+P1kO
 NJv+wumRJ+sFT/1nbfbEGdaCkiy/CKDeE+KgO8GC6+tabsPuXNYMhpTTd4NztCC8CQYvpH
 vsNoMPCf1lBwvnqREi9W/z1/+bIOdIE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433-skCsTSuVP8a3anR2pQXwzA-1; Fri, 25 Mar 2022 10:59:34 -0400
X-MC-Unique: skCsTSuVP8a3anR2pQXwzA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EAA5F101AA42;
 Fri, 25 Mar 2022 14:59:33 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.192])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 88BCF111F3D9;
 Fri, 25 Mar 2022 14:59:33 +0000 (UTC)
Date: Fri, 25 Mar 2022 09:59:31 -0500
From: Eric Blake <eblake@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH] iotests: Fix status checks
Message-ID: <20220325145931.3gh4254v7lj7wf7g@redhat.com>
References: <20220324180221.24508-1-hreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220324180221.24508-1-hreitz@redhat.com>
User-Agent: NeoMutt/20211029-512-43304b
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 24, 2022 at 07:02:21PM +0100, Hanna Reitz wrote:
> An iotest's 'paused' condition is fickle; it will be reported as true
> whenever the job is drained, for example, or when it is in the process
> of completing.
> 
> 030 and 041 contain such checks, we should replace them by checking the
> job status instead.  (As was done for 129 in commit f9a6256b48f29c2816
> for the 'busy' condition.)
> 
> Additionally, when we want to test that a job is paused on error, we
> might want to give it some time to actually switch to the paused state.
> Do that by waiting on the corresponding JOB_STATUS_CHANGE event.  (But
> only if they are not already paused; the loops these places are in fetch
> all VM events, so they may have already fetched that event from the
> queue.)
> 
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
>  tests/qemu-iotests/030 | 25 ++++++++++++++++++++-----
>  tests/qemu-iotests/041 | 26 +++++++++++++++++++-------
>  2 files changed, 39 insertions(+), 12 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


