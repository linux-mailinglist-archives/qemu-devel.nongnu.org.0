Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8818C4AC7B8
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 18:34:47 +0100 (CET)
Received: from localhost ([::1]:36556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH7uY-0006VV-C6
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 12:34:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nH7n9-0006Kw-R0
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 12:27:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nH7n6-0006dp-Cz
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 12:27:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644254823;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3gzXLMuRTZSij8xhU33hjf5ctoK78eQk9ftGfiLAyRQ=;
 b=Ci/rXHFw7qFGHUmgziNAFaLqNA1namHq3m4UlIJuHBXi7vP4C1sOVjTH7ydg2G4lCGGdDt
 baPeCF31IfTBQqf/P7ottHvIRdZbGnTCjlKhpoLichBbrRZ4Lxj1bpWzY23kOCRlQwrofp
 xK6agG5stk3aLwD5zs8TzmoA8MA45MQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-363-a0qrlkbSOmifp6rBeomNgw-1; Mon, 07 Feb 2022 12:27:02 -0500
X-MC-Unique: a0qrlkbSOmifp6rBeomNgw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A5D684B9A7;
 Mon,  7 Feb 2022 17:27:00 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.223])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0BB092B5AC;
 Mon,  7 Feb 2022 17:26:55 +0000 (UTC)
Date: Mon, 7 Feb 2022 18:26:54 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH v6 13/33] include/block/blockjob.h: global state API
Message-ID: <YgFWXiQgWbZeyr6v@redhat.com>
References: <20220121170544.2049944-1-eesposit@redhat.com>
 <20220121170544.2049944-14-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220121170544.2049944-14-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
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
Cc: Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org,
 "Denis V. Lunev" <den@openvz.org>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 21.01.2022 um 18:05 hat Emanuele Giuseppe Esposito geschrieben:
> blockjob functions run always under the BQL lock.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  include/block/blockjob.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/include/block/blockjob.h b/include/block/blockjob.h
> index 87fbb3985f..2373dfeb07 100644
> --- a/include/block/blockjob.h
> +++ b/include/block/blockjob.h
> @@ -74,6 +74,13 @@ typedef struct BlockJob {
>      GSList *nodes;
>  } BlockJob;
>  
> +/*
> + * Global state (GS) API. These functions run under the BQL lock.
> + *
> + * See include/block/block-global-state.h for more information about
> + * the GS API.
> + */
> +
>  /**
>   * block_job_next:
>   * @job: A block job, or %NULL.
> @@ -155,6 +162,8 @@ BlockJobInfo *block_job_query(BlockJob *job, Error **errp);
>   */
>  void block_job_iostatus_reset(BlockJob *job);
>  
> +/* Common functions that are neither I/O nor Global State */
> +
>  /**
>   * block_job_is_internal:
>   * @job: The job to determine if it is user-visible or not.

It's a bit random to comment on it for this patch specifically, but I
feel that the comments that separate different categories of interfaces
in a single file are not very easy to visually register.

I don't think we're doing this anywhere yet, but I wonder if it wouldn't
be helpful to use a comment style like this which gives more visibility
to the start and end of sections:

/***********************************************************************
 * Common functions that are neither I/O nor Global State
 */

Not sure what checkpatch thinks about it either... ;-)

Kevin


