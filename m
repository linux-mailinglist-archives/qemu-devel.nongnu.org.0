Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91EF639A98F
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 19:52:20 +0200 (CEST)
Received: from localhost ([::1]:51498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lorVz-0002fv-Ja
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 13:52:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lorV4-0001y8-4d
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 13:51:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lorV0-00029g-QX
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 13:51:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622742677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5RVvLxA82EeFFv1TqLly9r9j8ut5VLfo/uroY/XEKoU=;
 b=KGu5a5XAQXjZ/vOCrkaQ6gfYhnR6kDi/6nCT+EmxYLTwDrDZqZ2xIvHokw1xio8FqYVdCC
 fng6OPlSXqJgTj/Ry2L/irhZdUXa3u2XZ3gk1bqImG4OmtFSsV1A7TwkJEER2T08Wb0xTJ
 mHNb8fPbu5CSrY1l+iIJR5qLq37JKk4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-271-IaDoevZTPxexRJn-27bfmA-1; Thu, 03 Jun 2021 13:51:15 -0400
X-MC-Unique: IaDoevZTPxexRJn-27bfmA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 10C818DD120;
 Thu,  3 Jun 2021 17:51:14 +0000 (UTC)
Received: from work-vm (ovpn-114-217.ams2.redhat.com [10.36.114.217])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 985B75D6AB;
 Thu,  3 Jun 2021 17:51:12 +0000 (UTC)
Date: Thu, 3 Jun 2021 18:51:10 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [RFC PATCH 2/2] migration/rdma: Enable use of g_autoptr with
 struct rdma_cm_event
Message-ID: <YLkWjnJRd2g7Y7ny@work-vm>
References: <20210602175105.2522032-1-philmd@redhat.com>
 <20210602175105.2522032-3-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210602175105.2522032-3-philmd@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.37,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, Li Zhijian <lizhijian@cn.fujitsu.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Philippe Mathieu-Daudé (philmd@redhat.com) wrote:
> Since 00f2cfbbec6 ("glib: bump min required glib library version to
> 2.48") we can use g_auto/g_autoptr to have the compiler automatically
> free an allocated variable when it goes out of scope, removing this
> burden on the developers.
> 
> Per rdma_cm(7) and rdma_ack_cm_event(3) man pages:
> 
>   "rdma_ack_cm_event() - Free a communication event.
> 
>    All events which are allocated by rdma_get_cm_event() must be
>    released, there should be a one-to-one correspondence between
>    successful gets and acks. This call frees the event structure
>    and any memory that it references."
> 
> Since the 'ack' description doesn't explicit the event is also
> released (free'd), it is safer to use the GLib g_autoptr feature.
> The G_DEFINE_AUTOPTR_CLEANUP_FUNC() macro expects a single word
> for the type name, so add a type definition to achieve this.
> Convert to use g_autoptr and remove the rdma_ack_cm_event() calls.
> 
> Inspired-by: Li Zhijian <lizhijian@cn.fujitsu.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>

It's unclear to me whether the changes in qemu_rdma_accept are legal
rdma or not.
If we look at the err_rdma_dest_wait: path, it does a
qemu_rdma_cleanup(rdma) before the exit; that does rdma_disconnect's and
calls loads of other rdma/ibv cleanup calls to destroy state - is there
any ordering requirement saying you're supposed to clean up your
cm_event's before you nuke the rest of the channel? It feels like you
probably should - but I have no idea if it's a requirement.

Dave

> ---
> RFC: build-tested only
> ---
>  migration/rdma.c | 27 ++++++++++-----------------
>  1 file changed, 10 insertions(+), 17 deletions(-)
> 
> diff --git a/migration/rdma.c b/migration/rdma.c
> index b50ebb9183a..b703bf1b918 100644
> --- a/migration/rdma.c
> +++ b/migration/rdma.c
> @@ -38,6 +38,9 @@
>  #include "qom/object.h"
>  #include <poll.h>
>  
> +typedef struct rdma_cm_event rdma_cm_event;
> +G_DEFINE_AUTOPTR_CLEANUP_FUNC(rdma_cm_event, rdma_ack_cm_event)
> +
>  /*
>   * Print and error on both the Monitor and the Log file.
>   */
> @@ -939,7 +942,7 @@ static int qemu_rdma_resolve_host(RDMAContext *rdma, Error **errp)
>      int ret;
>      struct rdma_addrinfo *res;
>      char port_str[16];
> -    struct rdma_cm_event *cm_event;
> +    g_autoptr(rdma_cm_event) cm_event = NULL;
>      char ip[40] = "unknown";
>      struct rdma_addrinfo *e;
>  
> @@ -1007,11 +1010,11 @@ route:
>          ERROR(errp, "result not equal to event_addr_resolved %s",
>                  rdma_event_str(cm_event->event));
>          perror("rdma_resolve_addr");
> -        rdma_ack_cm_event(cm_event);
>          ret = -EINVAL;
>          goto err_resolve_get_addr;
>      }
>      rdma_ack_cm_event(cm_event);
> +    cm_event = NULL;
>  
>      /* resolve route */
>      ret = rdma_resolve_route(rdma->cm_id, RDMA_RESOLVE_TIMEOUT_MS);
> @@ -1028,11 +1031,9 @@ route:
>      if (cm_event->event != RDMA_CM_EVENT_ROUTE_RESOLVED) {
>          ERROR(errp, "result not equal to event_route_resolved: %s",
>                          rdma_event_str(cm_event->event));
> -        rdma_ack_cm_event(cm_event);
>          ret = -EINVAL;
>          goto err_resolve_get_addr;
>      }
> -    rdma_ack_cm_event(cm_event);
>      rdma->verbs = rdma->cm_id->verbs;
>      qemu_rdma_dump_id("source_resolve_host", rdma->cm_id->verbs);
>      qemu_rdma_dump_gid("source_resolve_host", rdma->cm_id);
> @@ -1501,7 +1502,7 @@ static uint64_t qemu_rdma_poll(RDMAContext *rdma, uint64_t *wr_id_out,
>   */
>  static int qemu_rdma_wait_comp_channel(RDMAContext *rdma)
>  {
> -    struct rdma_cm_event *cm_event;
> +    g_autoptr(rdma_cm_event) cm_event = NULL;
>      int ret = -1;
>  
>      /*
> @@ -2503,7 +2504,7 @@ static int qemu_rdma_connect(RDMAContext *rdma, Error **errp, bool return_path)
>                                            .private_data = &cap,
>                                            .private_data_len = sizeof(cap),
>                                          };
> -    struct rdma_cm_event *cm_event;
> +    g_autoptr(rdma_cm_event) cm_event = NULL;
>      int ret;
>  
>      /*
> @@ -2544,7 +2545,6 @@ static int qemu_rdma_connect(RDMAContext *rdma, Error **errp, bool return_path)
>      if (cm_event->event != RDMA_CM_EVENT_ESTABLISHED) {
>          perror("rdma_get_cm_event != EVENT_ESTABLISHED after rdma_connect");
>          ERROR(errp, "connecting to destination!");
> -        rdma_ack_cm_event(cm_event);
>          goto err_rdma_source_connect;
>      }
>      rdma->connected = true;
> @@ -2564,8 +2564,6 @@ static int qemu_rdma_connect(RDMAContext *rdma, Error **errp, bool return_path)
>  
>      trace_qemu_rdma_connect_pin_all_outcome(rdma->pin_all);
>  
> -    rdma_ack_cm_event(cm_event);
> -
>      rdma->control_ready_expected = 1;
>      rdma->nb_sent = 0;
>      return 0;
> @@ -3279,7 +3277,7 @@ static void rdma_cm_poll_handler(void *opaque)
>  {
>      RDMAContext *rdma = opaque;
>      int ret;
> -    struct rdma_cm_event *cm_event;
> +    g_autoptr(rdma_cm_event) cm_event = NULL;
>      MigrationIncomingState *mis = migration_incoming_get_current();
>  
>      ret = rdma_get_cm_event(rdma->channel, &cm_event);
> @@ -3287,7 +3285,6 @@ static void rdma_cm_poll_handler(void *opaque)
>          error_report("get_cm_event failed %d", errno);
>          return;
>      }
> -    rdma_ack_cm_event(cm_event);
>  
>      if (cm_event->event == RDMA_CM_EVENT_DISCONNECTED ||
>          cm_event->event == RDMA_CM_EVENT_DEVICE_REMOVAL) {
> @@ -3317,7 +3314,7 @@ static int qemu_rdma_accept(RDMAContext *rdma)
>                                              .private_data_len = sizeof(cap),
>                                           };
>      RDMAContext *rdma_return_path = NULL;
> -    struct rdma_cm_event *cm_event;
> +    g_autoptr(rdma_cm_event) cm_event = NULL;
>      struct ibv_context *verbs;
>      int ret = -EINVAL;
>      int idx;
> @@ -3328,7 +3325,6 @@ static int qemu_rdma_accept(RDMAContext *rdma)
>      }
>  
>      if (cm_event->event != RDMA_CM_EVENT_CONNECT_REQUEST) {
> -        rdma_ack_cm_event(cm_event);
>          goto err_rdma_dest_wait;
>      }
>  
> @@ -3339,7 +3335,6 @@ static int qemu_rdma_accept(RDMAContext *rdma)
>      if (migrate_postcopy() && !rdma->is_return_path) {
>          rdma_return_path = qemu_rdma_data_init(rdma->host_port, NULL);
>          if (rdma_return_path == NULL) {
> -            rdma_ack_cm_event(cm_event);
>              goto err_rdma_dest_wait;
>          }
>  
> @@ -3353,7 +3348,6 @@ static int qemu_rdma_accept(RDMAContext *rdma)
>      if (cap.version < 1 || cap.version > RDMA_CONTROL_VERSION_CURRENT) {
>              error_report("Unknown source RDMA version: %d, bailing...",
>                              cap.version);
> -            rdma_ack_cm_event(cm_event);
>              goto err_rdma_dest_wait;
>      }
>  
> @@ -3374,6 +3368,7 @@ static int qemu_rdma_accept(RDMAContext *rdma)
>      verbs = cm_event->id->verbs;
>  
>      rdma_ack_cm_event(cm_event);
> +    cm_event = NULL;
>  
>      trace_qemu_rdma_accept_pin_state(rdma->pin_all);
>  
> @@ -3441,11 +3436,9 @@ static int qemu_rdma_accept(RDMAContext *rdma)
>  
>      if (cm_event->event != RDMA_CM_EVENT_ESTABLISHED) {
>          error_report("rdma_accept not event established");
> -        rdma_ack_cm_event(cm_event);
>          goto err_rdma_dest_wait;
>      }
>  
> -    rdma_ack_cm_event(cm_event);
>      rdma->connected = true;
>  
>      ret = qemu_rdma_post_recv_control(rdma, RDMA_WRID_READY);
> -- 
> 2.26.3
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


