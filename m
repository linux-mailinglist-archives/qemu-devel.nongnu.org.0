Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1DC3476BF
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 12:04:11 +0100 (CET)
Received: from localhost ([::1]:34088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP1J4-000416-7J
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 07:04:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lP1HI-0003HO-68
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 07:02:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29151)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lP1HF-0002St-Aa
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 07:02:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616583733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=I/FnAd6hhRkaHo3H04sVgRtYBFPikng4DexyPuADwkI=;
 b=KhvVHf5HQ50mjAuGnAhFW/SmRHS+FaRozZNrMzwa1HDCR0nRlr8t9phRqUEBAHusQVR7he
 wPk3YbZG8V0l3S0u7nw29vJonGapPFDaqBxADlZGRWtdOTNluU4piOyGcBsD5uBBG1a7KY
 SEb0avD5aEo9HFKrwvqVUrlDazmpXGs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-INFuczkmNoeHFJ-1z013TA-1; Wed, 24 Mar 2021 07:02:09 -0400
X-MC-Unique: INFuczkmNoeHFJ-1z013TA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D462087A826;
 Wed, 24 Mar 2021 11:02:07 +0000 (UTC)
Received: from work-vm (ovpn-115-64.ams2.redhat.com [10.36.115.64])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2585453B2F;
 Wed, 24 Mar 2021 11:02:05 +0000 (UTC)
Date: Wed, 24 Mar 2021 11:02:03 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Zhang Chen <chen.zhang@intel.com>
Subject: Re: [PATCH V4 5/7] net/colo-compare: Move data structure and define
 to .h file.
Message-ID: <YFscK6+H69dXLY/Z@work-vm>
References: <20210319035508.113741-1-chen.zhang@intel.com>
 <20210319035508.113741-6-chen.zhang@intel.com>
MIME-Version: 1.0
In-Reply-To: <20210319035508.113741-6-chen.zhang@intel.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Lukas Straub <lukasstraub2@web.de>, Li Zhijian <lizhijian@cn.fujitsu.com>,
 Jason Wang <jasowang@redhat.com>, qemu-dev <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Zhang Chen <zhangckid@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Zhang Chen (chen.zhang@intel.com) wrote:
> Make other modules can reuse COLO code.
> 
> Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> ---
>  net/colo-compare.c | 106 ---------------------------------------------
>  net/colo-compare.h | 106 +++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 106 insertions(+), 106 deletions(-)
> 

<snip>

> diff --git a/net/colo-compare.h b/net/colo-compare.h
> index 22ddd512e2..2a9dcac0a7 100644
> --- a/net/colo-compare.h
> +++ b/net/colo-compare.h
> @@ -17,6 +17,112 @@
>  #ifndef QEMU_COLO_COMPARE_H
>  #define QEMU_COLO_COMPARE_H
>  
> +#include "net/net.h"
> +#include "chardev/char-fe.h"
> +#include "migration/colo.h"
> +#include "migration/migration.h"
> +#include "sysemu/iothread.h"
> +#include "colo.h"
> +
> +#define TYPE_COLO_COMPARE "colo-compare"
> +typedef struct CompareState CompareState;
> +DECLARE_INSTANCE_CHECKER(CompareState, COLO_COMPARE,
> +                         TYPE_COLO_COMPARE)
> +
> +#define COMPARE_READ_LEN_MAX NET_BUFSIZE
> +#define MAX_QUEUE_SIZE 1024

^^^^

> +#define COLO_COMPARE_FREE_PRIMARY     0x01
> +#define COLO_COMPARE_FREE_SECONDARY   0x02
> +
> +#define REGULAR_PACKET_CHECK_MS 1000
> +#define DEFAULT_TIME_OUT_MS 3000
> +
> +typedef struct SendCo {
> +    Coroutine *co;
> +    struct CompareState *s;
> +    CharBackend *chr;
> +    GQueue send_list;
> +    bool notify_remote_frame;
> +    bool done;
> +    int ret;
> +} SendCo;

^^^^^
> +typedef struct SendEntry {
> +    uint32_t size;
> +    uint32_t vnet_hdr_len;
> +    uint8_t *buf;
> +} SendEntry;

^^^^^

> +/*
> + *  + CompareState ++
> + *  |               |
> + *  +---------------+   +---------------+         +---------------+
> + *  |   conn list   + - >      conn     + ------- >      conn     + -- > ......
> + *  +---------------+   +---------------+         +---------------+
> + *  |               |     |           |             |          |
> + *  +---------------+ +---v----+  +---v----+    +---v----+ +---v----+
> + *                    |primary |  |secondary    |primary | |secondary
> + *                    |packet  |  |packet  +    |packet  | |packet  +
> + *                    +--------+  +--------+    +--------+ +--------+
> + *                        |           |             |          |
> + *                    +---v----+  +---v----+    +---v----+ +---v----+
> + *                    |primary |  |secondary    |primary | |secondary
> + *                    |packet  |  |packet  +    |packet  | |packet  +
> + *                    +--------+  +--------+    +--------+ +--------+
> + *                        |           |             |          |
> + *                    +---v----+  +---v----+    +---v----+ +---v----+
> + *                    |primary |  |secondary    |primary | |secondary
> + *                    |packet  |  |packet  +    |packet  | |packet  +
> + *                    +--------+  +--------+    +--------+ +--------+
> + */
> +struct CompareState {

 ^^^^^

For a header, these are too generic names - they need to have Colo in
them; e.g. MAX_COLOQUEUE_SIZE and COLOSendEntry etc

Dave

> +    Object parent;
> +
> +    char *pri_indev;
> +    char *sec_indev;
> +    char *outdev;
> +    char *notify_dev;
> +    CharBackend chr_pri_in;
> +    CharBackend chr_sec_in;
> +    CharBackend chr_out;
> +    CharBackend chr_notify_dev;
> +    SocketReadState pri_rs;
> +    SocketReadState sec_rs;
> +    SocketReadState notify_rs;
> +    SendCo out_sendco;
> +    SendCo notify_sendco;
> +    bool vnet_hdr;
> +    uint64_t compare_timeout;
> +    uint32_t expired_scan_cycle;
> +
> +    /*
> +     * Record the connection that through the NIC
> +     * Element type: Connection
> +     */
> +    GQueue conn_list;
> +    /* Record the connection without repetition */
> +    GHashTable *connection_track_table;
> +
> +    IOThread *iothread;
> +    GMainContext *worker_context;
> +    QEMUTimer *packet_check_timer;
> +
> +    QEMUBH *event_bh;
> +    enum colo_event event;
> +
> +    QTAILQ_ENTRY(CompareState) next;
> +};
> +
> +typedef struct CompareClass {
> +    ObjectClass parent_class;
> +} CompareClass;
> +
> +enum {
> +    PRIMARY_IN = 0,
> +    SECONDARY_IN,
> +};
> +
>  void colo_notify_compares_event(void *opaque, int event, Error **errp);
>  void colo_compare_register_notifier(Notifier *notify);
>  void colo_compare_unregister_notifier(Notifier *notify);
> -- 
> 2.25.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


