Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D73B4871DE
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 05:47:55 +0100 (CET)
Received: from localhost ([::1]:34008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5hAP-0001lB-VJ
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 23:47:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n5h8w-0000vf-0t
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 23:46:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n5h8t-0001vh-P9
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 23:46:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641530778;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NboakpODRCmkuGswyzNXmACP+H9JXVS12Pg4a9FlT/U=;
 b=CSNieghCoB1tNDAPrn96S9+uiMSeB2T9vbWif6w7ZmdEiKqPWkXtW6JC4O3KhF0dLtbPGM
 ckHxDXTZvzUHnQuwt89I7+32SxpWtlmKtAuN2Fl0bwLY4rtfinLYzql/owD3VnPY08qT1n
 TQNG2eoWPhIo1DGgk/ZSreuX53Znmzg=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-195-wfSEILgWMdeTfai3WoWFcg-1; Thu, 06 Jan 2022 23:46:17 -0500
X-MC-Unique: wfSEILgWMdeTfai3WoWFcg-1
Received: by mail-lf1-f69.google.com with SMTP id
 f17-20020a05651232d100b00429623cf219so1488572lfg.18
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 20:46:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NboakpODRCmkuGswyzNXmACP+H9JXVS12Pg4a9FlT/U=;
 b=qfMHtGBXkGxqam+j7/swIyKZzm0gMVTTYzc/J7sPsax/MQyH0cyuMJYkkVR0f51HGs
 U4gxhg1htsQ8Ya9W+8M1td8H6rH5lGUtTheFRJkaADZ57vp54+D66rAJlIGCG2i+qCjy
 xTdj+wpYlELJ+ONhIPjdnlEMBZsy/zX1oT8nxfL1Vc6PsMd3GhF9b3iXZBzHJpBFoP9m
 VEjRoCSTy0JZv8XvrIGNejqEqwr+4BP4yGpS8azdf7hXCqxcle0Y79dQJ/zG2q89G75N
 DgekAFOU528qtYJU2ak82eNyScqQv96r3vwYUDl4sS964Ao+AdXeyXdYPj6xJmvHmc5w
 TXHA==
X-Gm-Message-State: AOAM530BMPSKNq7OrZ5CMoBY43r2JwMhl3cIRW7vUzDHFZdzJ2bZ2rel
 U93X6psh6zQfoII+Wu0ptZVsxf56rw28gvtD9/8hHugHs92rVTbLuuJJHu9HHrzY8empf9FLL8M
 58WbGGgQfKTNxrYiB7S37SWIzbDUoh/s=
X-Received: by 2002:a05:6512:230f:: with SMTP id
 o15mr51157550lfu.348.1641530774913; 
 Thu, 06 Jan 2022 20:46:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz9LF1Gyfo8NQK0hHWV98pxh2jjeaKFC3W5NGHeAATt+qIxSkyf4/etF0dUPc2S/uSMpasNhQ5QJxXsD7PSQyQ=
X-Received: by 2002:a05:6512:230f:: with SMTP id
 o15mr51157536lfu.348.1641530774628; 
 Thu, 06 Jan 2022 20:46:14 -0800 (PST)
MIME-Version: 1.0
References: <20211220010603.1443843-1-chen.zhang@intel.com>
In-Reply-To: <20211220010603.1443843-1-chen.zhang@intel.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 7 Jan 2022 12:46:03 +0800
Message-ID: <CACGkMEsVp3+Bctgp35AVJPznpNGX+hyTrjZ+47usVvwfxMGEUw@mail.gmail.com>
Subject: Re: [PATCH 1/2] net/colo-compare.c: Optimize compare order for
 performance
To: Zhang Chen <chen.zhang@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: leirao <lei.rao@intel.com>, qemu-dev <qemu-devel@nongnu.org>,
 Li Zhijian <lizhijian@cn.fujitsu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 20, 2021 at 9:16 AM Zhang Chen <chen.zhang@intel.com> wrote:
>
> COLO-compare use the glib function g_queue_find_custom to dump
> another VM's networking packet to compare. But this function always
> start find from the queue->head(here is the newest packet), It will
> reduce the success rate of comparison. So this patch reversed
> the order of the queues for performance.
>
> Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> Reported-by: leirao <lei.rao@intel.com>
> ---
>  net/colo-compare.c | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)

Applied.

Thanks

>
> diff --git a/net/colo-compare.c b/net/colo-compare.c
> index b966e7e514..216de5a12b 100644
> --- a/net/colo-compare.c
> +++ b/net/colo-compare.c
> @@ -197,7 +197,7 @@ static void colo_compare_inconsistency_notify(CompareState *s)
>  /* Use restricted to colo_insert_packet() */
>  static gint seq_sorter(Packet *a, Packet *b, gpointer data)
>  {
> -    return a->tcp_seq - b->tcp_seq;
> +    return b->tcp_seq - a->tcp_seq;
>  }
>
>  static void fill_pkt_tcp_info(void *data, uint32_t *max_ack)
> @@ -421,13 +421,13 @@ pri:
>      if (g_queue_is_empty(&conn->primary_list)) {
>          return;
>      }
> -    ppkt = g_queue_pop_head(&conn->primary_list);
> +    ppkt = g_queue_pop_tail(&conn->primary_list);
>  sec:
>      if (g_queue_is_empty(&conn->secondary_list)) {
> -        g_queue_push_head(&conn->primary_list, ppkt);
> +        g_queue_push_tail(&conn->primary_list, ppkt);
>          return;
>      }
> -    spkt = g_queue_pop_head(&conn->secondary_list);
> +    spkt = g_queue_pop_tail(&conn->secondary_list);
>
>      if (ppkt->tcp_seq == ppkt->seq_end) {
>          colo_release_primary_pkt(s, ppkt);
> @@ -458,7 +458,7 @@ sec:
>              }
>          }
>          if (!ppkt) {
> -            g_queue_push_head(&conn->secondary_list, spkt);
> +            g_queue_push_tail(&conn->secondary_list, spkt);
>              goto pri;
>          }
>      }
> @@ -477,7 +477,7 @@ sec:
>          if (mark == COLO_COMPARE_FREE_PRIMARY) {
>              conn->compare_seq = ppkt->seq_end;
>              colo_release_primary_pkt(s, ppkt);
> -            g_queue_push_head(&conn->secondary_list, spkt);
> +            g_queue_push_tail(&conn->secondary_list, spkt);
>              goto pri;
>          } else if (mark == COLO_COMPARE_FREE_SECONDARY) {
>              conn->compare_seq = spkt->seq_end;
> @@ -490,8 +490,8 @@ sec:
>              goto pri;
>          }
>      } else {
> -        g_queue_push_head(&conn->primary_list, ppkt);
> -        g_queue_push_head(&conn->secondary_list, spkt);
> +        g_queue_push_tail(&conn->primary_list, ppkt);
> +        g_queue_push_tail(&conn->secondary_list, spkt);
>
>  #ifdef DEBUG_COLO_PACKETS
>          qemu_hexdump(stderr, "colo-compare ppkt", ppkt->data, ppkt->size);
> @@ -673,7 +673,7 @@ static void colo_compare_packet(CompareState *s, Connection *conn,
>
>      while (!g_queue_is_empty(&conn->primary_list) &&
>             !g_queue_is_empty(&conn->secondary_list)) {
> -        pkt = g_queue_pop_head(&conn->primary_list);
> +        pkt = g_queue_pop_tail(&conn->primary_list);
>          result = g_queue_find_custom(&conn->secondary_list,
>                   pkt, (GCompareFunc)HandlePacket);
>
> @@ -689,7 +689,7 @@ static void colo_compare_packet(CompareState *s, Connection *conn,
>               * timeout, it will trigger a checkpoint request.
>               */
>              trace_colo_compare_main("packet different");
> -            g_queue_push_head(&conn->primary_list, pkt);
> +            g_queue_push_tail(&conn->primary_list, pkt);
>
>              colo_compare_inconsistency_notify(s);
>              break;
> @@ -819,7 +819,7 @@ static int compare_chr_send(CompareState *s,
>          entry->buf = g_malloc(size);
>          memcpy(entry->buf, buf, size);
>      }
> -    g_queue_push_head(&sendco->send_list, entry);
> +    g_queue_push_tail(&sendco->send_list, entry);
>
>      if (sendco->done) {
>          sendco->co = qemu_coroutine_create(_compare_chr_send, sendco);
> @@ -1347,7 +1347,7 @@ static void colo_flush_packets(void *opaque, void *user_data)
>      Packet *pkt = NULL;
>
>      while (!g_queue_is_empty(&conn->primary_list)) {
> -        pkt = g_queue_pop_head(&conn->primary_list);
> +        pkt = g_queue_pop_tail(&conn->primary_list);
>          compare_chr_send(s,
>                           pkt->data,
>                           pkt->size,
> @@ -1357,7 +1357,7 @@ static void colo_flush_packets(void *opaque, void *user_data)
>          packet_destroy_partial(pkt, NULL);
>      }
>      while (!g_queue_is_empty(&conn->secondary_list)) {
> -        pkt = g_queue_pop_head(&conn->secondary_list);
> +        pkt = g_queue_pop_tail(&conn->secondary_list);
>          packet_destroy(pkt, NULL);
>      }
>  }
> --
> 2.25.1
>


