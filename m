Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 607B05AB17D
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 15:35:32 +0200 (CEST)
Received: from localhost ([::1]:37386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oU6pX-0002W7-6E
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 09:35:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1oU6hz-0001tv-QH
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 09:27:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1oU6hs-000527-IK
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 09:27:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662125254;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9nk7X/r8+/yl44IqlsdDdXTX8+XI8vPFl0b5H4xWAj8=;
 b=jTWWa5vKSHGDVfS0E2F1nO9/gePv4uOdCJ7HuL2oD0UU+JTRHKHT8xkbrEsj4I/VleWqZW
 dc+NkIKtTKik+b3OptE4XPg/Je+ANMrOTyaa9MBu9O/kfDLRuQgCB0q7w4UEXVn6S7nvdb
 gvmJcLKwQgVZKbnTGjRwZwBUkXGq3kA=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-507-EX_MeXwWMCmiAKIU1HuyCA-1; Fri, 02 Sep 2022 09:27:33 -0400
X-MC-Unique: EX_MeXwWMCmiAKIU1HuyCA-1
Received: by mail-ot1-f70.google.com with SMTP id
 o24-20020a9d6d18000000b00639239e36b0so1086270otp.13
 for <qemu-devel@nongnu.org>; Fri, 02 Sep 2022 06:27:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date;
 bh=9nk7X/r8+/yl44IqlsdDdXTX8+XI8vPFl0b5H4xWAj8=;
 b=h3uK7BkanTOcyVr3bxCEkuj/ea3kq1Jv/J34orGy9S9jv9X/opo78gOBW1XFYntGuK
 bgasdPp0wMNiTDx+leKZ/o/q288/L6SlTloVzH65DWYeoRNOdFXj37uLfhSyea+4+Tar
 vH0Q5Hri2XHVlhvkbxj1v12FgzN2BhcCx4PnAuCkt/GYXSjYrp+9EMY8D1BCEd9G7ain
 cvDk4IsBIF3dfDvFUwSAMmci6yvgJzLpN+xOdptlmcJlscckqTCpJjKE6VplSxb1Rymt
 zGiumh9Du8R3XhwHeWhdqC00y56mKGBv7fOpqW2Q3ARjRc2KOmprfely/Um7WSpsHVln
 fryQ==
X-Gm-Message-State: ACgBeo0c4uXpM7nrPoG7SQdNpdxV0xX8zxsYrjjm6wqqXkBgxwH0Blr/
 VAFxBx3wQzoydc5S47eahbGG81ze0C7NyjTJWn82JjXFV1dwPDtDEVMrkec1Bj37LoSczBhzrjT
 LTXUh8/HQTiyabas=
X-Received: by 2002:a05:6870:f219:b0:122:4182:94 with SMTP id
 t25-20020a056870f21900b0012241820094mr2181449oao.264.1662125252308; 
 Fri, 02 Sep 2022 06:27:32 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6WfylKdW6gNi1SP20wake7uLc2+iPiPheJDsGy2X2ysrPm+mDTjmWSiXba3WHLN0V6v6o4Gw==
X-Received: by 2002:a05:6870:f219:b0:122:4182:94 with SMTP id
 t25-20020a056870f21900b0012241820094mr2181428oao.264.1662125252033; 
 Fri, 02 Sep 2022 06:27:32 -0700 (PDT)
Received: from ?IPv6:2804:7f3:fb01:346:a2d4:22c5:c748:1982?
 ([2804:7f3:fb01:346:a2d4:22c5:c748:1982])
 by smtp.gmail.com with ESMTPSA id
 g4-20020a544f84000000b0034378294973sm964498oiy.30.2022.09.02.06.27.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Sep 2022 06:27:31 -0700 (PDT)
Message-ID: <815debf445a2d3003ab2a2900f182554f0c99b3e.camel@redhat.com>
Subject: Re: [PATCH v7 10/12] multifd: Support for zero pages transmission
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras@redhat.com>
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>, Eric Blake
 <eblake@redhat.com>, Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?=
 <f4bug@amsat.org>,  Yanan Wang <wangyanan55@huawei.com>, Markus Armbruster
 <armbru@redhat.com>, Eduardo Habkost <eduardo@habkost.net>
Date: Fri, 02 Sep 2022 10:27:25 -0300
In-Reply-To: <20220802063907.18882-11-quintela@redhat.com>
References: <20220802063907.18882-1-quintela@redhat.com>
 <20220802063907.18882-11-quintela@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
Received-SPF: pass client-ip=170.10.129.124; envelope-from=leobras@redhat.com;
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

On Tue, 2022-08-02 at 08:39 +0200, Juan Quintela wrote:
> This patch adds counters and similar.  Logic will be added on the
> following patch.
>=20
> Signed-off-by: Juan Quintela <quintela@redhat.com>
>=20
> ---
>=20
> Added counters for duplicated/non duplicated pages.
> Removed reviewed by from David.
> Add total_zero_pages
> ---
>  migration/multifd.h    | 17 ++++++++++++++++-
>  migration/multifd.c    | 36 +++++++++++++++++++++++++++++-------
>  migration/ram.c        |  2 --
>  migration/trace-events |  8 ++++----
>  4 files changed, 49 insertions(+), 14 deletions(-)
>=20
> diff --git a/migration/multifd.h b/migration/multifd.h
> index cd389d18d2..a1b852200d 100644
> --- a/migration/multifd.h
> +++ b/migration/multifd.h
> @@ -47,7 +47,10 @@ typedef struct {
>      /* size of the next packet that contains pages */
>      uint32_t next_packet_size;
>      uint64_t packet_num;
> -    uint64_t unused[4];    /* Reserved for future use */
> +    /* zero pages */
> +    uint32_t zero_pages;
> +    uint32_t unused32[1];    /* Reserved for future use */
> +    uint64_t unused64[3];    /* Reserved for future use */
>      char ramblock[256];
>      uint64_t offset[];
>  } __attribute__((packed)) MultiFDPacket_t;
> @@ -127,6 +130,8 @@ typedef struct {
>      uint64_t num_packets;
>      /* non zero pages sent through this channel */
>      uint64_t total_normal_pages;
> +    /* zero pages sent through this channel */
> +    uint64_t total_zero_pages;
>      /* buffers to send */
>      struct iovec *iov;
>      /* number of iovs used */
> @@ -135,6 +140,10 @@ typedef struct {
>      ram_addr_t *normal;
>      /* num of non zero pages */
>      uint32_t normal_num;
> +    /* Pages that are  zero */
> +    ram_addr_t *zero;
> +    /* num of zero pages */
> +    uint32_t zero_num;

More of an organization viewpoint:=20
I can't see total_zero_pages, zero[] and zero_num as Multifd "Parameters".=
=20
But OTOH there are other data like this in the struct for keeping migration
status, so not an issue.

>      /* used for compression methods */
>      void *data;
>  }  MultiFDSendParams;
> @@ -184,12 +193,18 @@ typedef struct {
>      uint8_t *host;
>      /* non zero pages recv through this channel */
>      uint64_t total_normal_pages;
> +    /* zero pages recv through this channel */
> +    uint64_t total_zero_pages;
>      /* buffers to recv */
>      struct iovec *iov;
>      /* Pages that are not zero */
>      ram_addr_t *normal;
>      /* num of non zero pages */
>      uint32_t normal_num;
> +    /* Pages that are  zero */
> +    ram_addr_t *zero;
> +    /* num of zero pages */
> +    uint32_t zero_num;
>      /* used for de-compression methods */
>      void *data;
>  } MultiFDRecvParams;
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 68fc9f8e88..4473d9f834 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -263,6 +263,7 @@ static void multifd_send_fill_packet(MultiFDSendParam=
s *p)
>      packet->normal_pages =3D cpu_to_be32(p->normal_num);
>      packet->next_packet_size =3D cpu_to_be32(p->next_packet_size);
>      packet->packet_num =3D cpu_to_be64(p->packet_num);
> +    packet->zero_pages =3D cpu_to_be32(p->zero_num);
> =20
>      if (p->pages->block) {
>          strncpy(packet->ramblock, p->pages->block->idstr, 256);
> @@ -323,7 +324,15 @@ static int multifd_recv_unfill_packet(MultiFDRecvPar=
ams *p, Error **errp)
>      p->next_packet_size =3D be32_to_cpu(packet->next_packet_size);
>      p->packet_num =3D be64_to_cpu(packet->packet_num);
> =20
> -    if (p->normal_num =3D=3D 0) {
> +    p->zero_num =3D be32_to_cpu(packet->zero_pages);
> +    if (p->zero_num > packet->pages_alloc - p->normal_num) {
> +        error_setg(errp, "multifd: received packet "
> +                   "with %u zero pages and expected maximum pages are %u=
",
> +                   p->zero_num, packet->pages_alloc - p->normal_num) ;
> +        return -1;
> +    }
> +
> +    if (p->normal_num =3D=3D 0 && p->zero_num =3D=3D 0) {
>          return 0;
>      }
> =20
> @@ -432,6 +441,8 @@ static int multifd_send_pages(QEMUFile *f)
>      ram_counters.multifd_bytes +=3D p->sent_bytes;
>      qemu_file_acct_rate_limit(f, p->sent_bytes);
>      p->sent_bytes =3D 0;
> +    ram_counters.normal +=3D p->normal_num;
> +    ram_counters.duplicate +=3D p->zero_num;
>      qemu_mutex_unlock(&p->mutex);
>      qemu_sem_post(&p->sem);
> =20
> @@ -545,6 +556,8 @@ void multifd_save_cleanup(void)
>          p->iov =3D NULL;
>          g_free(p->normal);
>          p->normal =3D NULL;
> +        g_free(p->zero);
> +        p->zero =3D NULL;
>          multifd_send_state->ops->send_cleanup(p, &local_err);
>          if (local_err) {
>              migrate_set_error(migrate_get_current(), local_err);
> @@ -666,6 +679,7 @@ static void *multifd_send_thread(void *opaque)
>              qemu_mutex_unlock(&p->mutex);
> =20
>              p->normal_num =3D 0;
> +            p->zero_num =3D 0;
> =20
>              if (use_zero_copy_send) {
>                  p->iovs_num =3D 0;
> @@ -687,8 +701,8 @@ static void *multifd_send_thread(void *opaque)
>              }
>              multifd_send_fill_packet(p);
> =20
> -            trace_multifd_send(p->id, packet_num, p->normal_num, p->flag=
s,
> -                               p->next_packet_size);
> +            trace_multifd_send(p->id, packet_num, p->normal_num, p->zero=
_num,
> +                               p->flags, p->next_packet_size);
> =20
>              if (use_zero_copy_send) {
>                  /* Send header first, without zerocopy */
> @@ -712,6 +726,7 @@ static void *multifd_send_thread(void *opaque)
>              qemu_mutex_lock(&p->mutex);
>              p->num_packets++;
>              p->total_normal_pages +=3D p->normal_num;
> +            p->total_zero_pages +=3D p->zero_num;

I can see it getting declared, incremented and used. But where is it initia=
lized
in zero? I mean, should it not have 'p->total_normal_pages =3D 0;' somewher=
e in
setup?

(I understand multifd_save_setup() allocates a multifd_send_state->params w=
ith
g_new0(),but other variables are zeroed there, like p->pending_job and=C2=
=A0
p->write_flags, so why not?)  =20

>              p->pages->num =3D 0;
>              p->pages->block =3D NULL;
>              p->sent_bytes +=3D p->packet_len;;
> @@ -753,7 +768,8 @@ out:
>      qemu_mutex_unlock(&p->mutex);
> =20
>      rcu_unregister_thread();
> -    trace_multifd_send_thread_end(p->id, p->num_packets, p->total_normal=
_pages);
> +    trace_multifd_send_thread_end(p->id, p->num_packets, p->total_normal=
_pages,
> +                                  p->total_zero_pages);
> =20
>      return NULL;
>  }
> @@ -938,6 +954,7 @@ int multifd_save_setup(Error **errp)
>          p->normal =3D g_new0(ram_addr_t, page_count);
>          p->page_size =3D qemu_target_page_size();
>          p->page_count =3D page_count;
> +        p->zero =3D g_new0(ram_addr_t, page_count);
> =20
>          if (migrate_use_zero_copy_send()) {
>              p->write_flags =3D QIO_CHANNEL_WRITE_FLAG_ZERO_COPY;
> @@ -1046,6 +1063,8 @@ int multifd_load_cleanup(Error **errp)
>          p->iov =3D NULL;
>          g_free(p->normal);
>          p->normal =3D NULL;
> +        g_free(p->zero);
> +        p->zero =3D NULL;
>          multifd_recv_state->ops->recv_cleanup(p);
>      }
>      qemu_sem_destroy(&multifd_recv_state->sem_sync);
> @@ -1116,13 +1135,14 @@ static void *multifd_recv_thread(void *opaque)
>              break;
>          }
> =20
> -        trace_multifd_recv(p->id, p->packet_num, p->normal_num, p->flags=
,
> -                           p->next_packet_size);
> +        trace_multifd_recv(p->id, p->packet_num, p->normal_num, p->zero_=
num,
> +                           p->flags, p->next_packet_size);
>          sync_needed =3D p->flags & MULTIFD_FLAG_SYNC;
>          /* recv methods don't know how to handle the SYNC flag */
>          p->flags &=3D ~MULTIFD_FLAG_SYNC;
>          p->num_packets++;
>          p->total_normal_pages +=3D p->normal_num;
> +        p->total_normal_pages +=3D p->zero_num;
>          qemu_mutex_unlock(&p->mutex);
> =20
>          if (p->normal_num) {
> @@ -1147,7 +1167,8 @@ static void *multifd_recv_thread(void *opaque)
>      qemu_mutex_unlock(&p->mutex);
> =20
>      rcu_unregister_thread();
> -    trace_multifd_recv_thread_end(p->id, p->num_packets, p->total_normal=
_pages);
> +    trace_multifd_recv_thread_end(p->id, p->num_packets, p->total_normal=
_pages,
> +                                  p->total_zero_pages);
> =20
>      return NULL;
>  }
> @@ -1187,6 +1208,7 @@ int multifd_load_setup(Error **errp)
>          p->normal =3D g_new0(ram_addr_t, page_count);
>          p->page_count =3D page_count;
>          p->page_size =3D qemu_target_page_size();
> +        p->zero =3D g_new0(ram_addr_t, page_count);
>      }
> =20
>      for (i =3D 0; i < thread_count; i++) {
> diff --git a/migration/ram.c b/migration/ram.c
> index 291ba5c0ed..2af70f517a 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -1412,8 +1412,6 @@ static int ram_save_multifd_page(RAMState *rs, RAMB=
lock *block,
>      if (multifd_queue_page(rs->f, block, offset) < 0) {
>          return -1;
>      }
> -    ram_counters.normal++;
> -
>      return 1;
>  }
> =20
> diff --git a/migration/trace-events b/migration/trace-events
> index a34afe7b85..d34aec177c 100644
> --- a/migration/trace-events
> +++ b/migration/trace-events
> @@ -120,21 +120,21 @@ postcopy_preempt_reset_channel(void) ""
> =20
>  # multifd.c
>  multifd_new_send_channel_async(uint8_t id) "channel %u"
> -multifd_recv(uint8_t id, uint64_t packet_num, uint32_t used, uint32_t fl=
ags, uint32_t next_packet_size) "channel %u packet_num %" PRIu64 " pages %u=
 flags 0x%x next packet size %u"
> +multifd_recv(uint8_t id, uint64_t packet_num, uint32_t normal, uint32_t =
zero, uint32_t flags, uint32_t next_packet_size) "channel %u packet_num %" =
PRIu64 " normal pages %u zero pages %u flags 0x%x next packet size %u"
>  multifd_recv_new_channel(uint8_t id) "channel %u"
>  multifd_recv_sync_main(long packet_num) "packet num %ld"
>  multifd_recv_sync_main_signal(uint8_t id) "channel %u"
>  multifd_recv_sync_main_wait(uint8_t id) "channel %u"
>  multifd_recv_terminate_threads(bool error) "error %d"
> -multifd_recv_thread_end(uint8_t id, uint64_t packets, uint64_t pages) "c=
hannel %u packets %" PRIu64 " pages %" PRIu64
> +multifd_recv_thread_end(uint8_t id, uint64_t packets, uint64_t normal_pa=
ges, uint64_t zero_pages) "channel %u packets %" PRIu64 " normal pages %" P=
RIu64 " zero pages %" PRIu64
>  multifd_recv_thread_start(uint8_t id) "%u"
> -multifd_send(uint8_t id, uint64_t packet_num, uint32_t normal, uint32_t =
flags, uint32_t next_packet_size) "channel %u packet_num %" PRIu64 " normal=
 pages %u flags 0x%x next packet size %u"
> +multifd_send(uint8_t id, uint64_t packet_num, uint32_t normalpages, uint=
32_t zero_pages, uint32_t flags, uint32_t next_packet_size) "channel %u pac=
ket_num %" PRIu64 " normal pages %u zero pages %u flags 0x%x next packet si=
ze %u"
>  multifd_send_error(uint8_t id) "channel %u"
>  multifd_send_sync_main(long packet_num) "packet num %ld"
>  multifd_send_sync_main_signal(uint8_t id) "channel %u"
>  multifd_send_sync_main_wait(uint8_t id) "channel %u"
>  multifd_send_terminate_threads(bool error) "error %d"
> -multifd_send_thread_end(uint8_t id, uint64_t packets, uint64_t normal_pa=
ges) "channel %u packets %" PRIu64 " normal pages %"  PRIu64
> +multifd_send_thread_end(uint8_t id, uint64_t packets, uint64_t normal_pa=
ges, uint64_t zero_pages) "channel %u packets %" PRIu64 " normal pages %"  =
PRIu64 " zero pages %"  PRIu64
>  multifd_send_thread_start(uint8_t id) "%u"
>  multifd_tls_outgoing_handshake_start(void *ioc, void *tioc, const char *=
hostname) "ioc=3D%p tioc=3D%p hostname=3D%s"
>  multifd_tls_outgoing_handshake_error(void *ioc, const char *err) "ioc=3D=
%p err=3D%s"


