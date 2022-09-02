Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1235AB1B2
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 15:38:31 +0200 (CEST)
Received: from localhost ([::1]:54394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oU6sP-00088X-F6
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 09:38:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1oU6iL-00023q-8b
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 09:28:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1oU6iA-00053y-DX
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 09:27:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662125266;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JezWjdOiJ9E6n+ZIzQnVnglIw59M3y7zrMrF59tUEDA=;
 b=dEadMd30R2LoXK3/SNq1+m0mwLpI1C4UaMiDwAYY/ck2HSDgEQCXJHAiKmPFCgTPKXJaR9
 61FujwVBXSkVzlVHqNf6UY22X3MhZe+7YoEDLv6ExwH+3kOAL90nAuvXGOsUpaonsxR9V4
 gf1ngYT28BYLIuydzZoproKBAEvDWJ4=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-288-Q_cbUCcBPu208HXGa6luBg-1; Fri, 02 Sep 2022 09:27:39 -0400
X-MC-Unique: Q_cbUCcBPu208HXGa6luBg-1
Received: by mail-oo1-f70.google.com with SMTP id
 l14-20020a4a350e000000b0044b6be0c06cso1138935ooa.16
 for <qemu-devel@nongnu.org>; Fri, 02 Sep 2022 06:27:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date;
 bh=JezWjdOiJ9E6n+ZIzQnVnglIw59M3y7zrMrF59tUEDA=;
 b=SgYcoANQMAEbRzOkN4Z3ygNaDyMVrqvFSSic88195zExyHgss7/65bFJzJ0FLom6XJ
 DGsKI9jsgdIBNNRsxpNVLCztMRjDIbe2YqXpSxl7PsYYe6o2LZ5eCjNyIYWIh54mw8vt
 EB/aqGnKI9Ui72GcMUZpwQftTfVAsvPej5ZPJe+rb4qabMfRR2g6tFKPSf4b3uC0slms
 9umoUPT1BgYMjRkC1vEfF2E5NX0i2zAvkyQMZ5S91bxyTZgrIsZp9zCx/IP9QeqFlIb/
 X1a+BGpQNd9vBHcgXvq+Nv7ts5lUF7uHVswTgVoxjjPqHCq0N6LzwWnnbPn+mMz+T0SR
 JZHg==
X-Gm-Message-State: ACgBeo19ZIoAuuOH0m4BWbLzPL1eLnDOcRtdQ3iK+a3cJUBz1z7KUsEg
 Gz4Yr7SCjysx2rBCwfdtQrjaTd8BalTYb5Vl8LRmMuAmDc2VHrQOVOsnHogqBNZC78BtR3OvBNK
 h0x9Ft3K0ZX++Uy8=
X-Received: by 2002:aca:1210:0:b0:345:540a:8d06 with SMTP id
 16-20020aca1210000000b00345540a8d06mr1869294ois.99.1662125258452; 
 Fri, 02 Sep 2022 06:27:38 -0700 (PDT)
X-Google-Smtp-Source: AA6agR76JJGXjrjQQvX9s9wbcXCU/am2XDM8AnS8EA4tTPTpYF+Zxzxca09yire12r4Fbs0r8Oazlg==
X-Received: by 2002:aca:1210:0:b0:345:540a:8d06 with SMTP id
 16-20020aca1210000000b00345540a8d06mr1869276ois.99.1662125258180; 
 Fri, 02 Sep 2022 06:27:38 -0700 (PDT)
Received: from ?IPv6:2804:7f3:fb01:346:a2d4:22c5:c748:1982?
 ([2804:7f3:fb01:346:a2d4:22c5:c748:1982])
 by smtp.gmail.com with ESMTPSA id
 r33-20020a056870e9a100b001241422521bsm890940oao.11.2022.09.02.06.27.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Sep 2022 06:27:37 -0700 (PDT)
Message-ID: <a422638b88db67dc0bc26526578ee5be3880b6a8.camel@redhat.com>
Subject: Re: [PATCH v7 11/12] multifd: Zero pages transmission
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras@redhat.com>
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>, Eric Blake
 <eblake@redhat.com>, Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?=
 <f4bug@amsat.org>,  Yanan Wang <wangyanan55@huawei.com>, Markus Armbruster
 <armbru@redhat.com>, Eduardo Habkost <eduardo@habkost.net>
Date: Fri, 02 Sep 2022 10:27:32 -0300
In-Reply-To: <20220802063907.18882-12-quintela@redhat.com>
References: <20220802063907.18882-1-quintela@redhat.com>
 <20220802063907.18882-12-quintela@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
Received-SPF: pass client-ip=170.10.133.124; envelope-from=leobras@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
> This implements the zero page dection and handling.
>=20
> Signed-off-by: Juan Quintela <quintela@redhat.com>
>=20
> ---
>=20
> Add comment for offset (dave)
> Use local variables for offset/block to have shorter lines
> ---
>  migration/multifd.h |  5 +++++
>  migration/multifd.c | 41 +++++++++++++++++++++++++++++++++++++++--
>  2 files changed, 44 insertions(+), 2 deletions(-)
>=20
> diff --git a/migration/multifd.h b/migration/multifd.h
> index a1b852200d..5931de6f86 100644
> --- a/migration/multifd.h
> +++ b/migration/multifd.h
> @@ -52,6 +52,11 @@ typedef struct {
>      uint32_t unused32[1];    /* Reserved for future use */
>      uint64_t unused64[3];    /* Reserved for future use */
>      char ramblock[256];
> +    /*
> +     * This array contains the pointers to:
> +     *  - normal pages (initial normal_pages entries)
> +     *  - zero pages (following zero_pages entries)
> +     */
>      uint64_t offset[];
>  } __attribute__((packed)) MultiFDPacket_t;
> =20
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 4473d9f834..89811619d8 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -11,6 +11,7 @@
>   */
> =20
>  #include "qemu/osdep.h"
> +#include "qemu/cutils.h"
>  #include "qemu/rcu.h"
>  #include "exec/target_page.h"
>  #include "sysemu/sysemu.h"
> @@ -275,6 +276,12 @@ static void multifd_send_fill_packet(MultiFDSendPara=
ms *p)
> =20
>          packet->offset[i] =3D cpu_to_be64(temp);
>      }
> +    for (i =3D 0; i < p->zero_num; i++) {
> +        /* there are architectures where ram_addr_t is 32 bit */
> +        uint64_t temp =3D p->zero[i];
> +
> +        packet->offset[p->normal_num + i] =3D cpu_to_be64(temp);
> +    }
>  }
> =20
>  static int multifd_recv_unfill_packet(MultiFDRecvParams *p, Error **errp=
)
> @@ -358,6 +365,18 @@ static int multifd_recv_unfill_packet(MultiFDRecvPar=
ams *p, Error **errp)
>          p->normal[i] =3D offset;
>      }
> =20
> +    for (i =3D 0; i < p->zero_num; i++) {
> +        uint64_t offset =3D be64_to_cpu(packet->offset[p->normal_num + i=
]);
> +
> +        if (offset > (block->used_length - p->page_size)) {
> +            error_setg(errp, "multifd: offset too long %" PRIu64
> +                       " (max " RAM_ADDR_FMT ")",
> +                       offset, block->used_length);
> +            return -1;
> +        }
> +        p->zero[i] =3D offset;
> +    }
> +
>      return 0;
>  }

IIUC ram_addr_t is supposed to be the address size for the architecture, ma=
inly
being 32 or 64 bits. So packet->offset[i] is always u64, and p->zero[i] pos=
sibly
being u32 or u64.

Since both local variables and packet->offset[i] are 64-bit, there is no is=
sue.

But on=C2=A0'p->zero[i] =3D offset' we can have 'u32 =3D u64', and this sho=
uld raise a
warning (or am I missing something?).
 =20

> =20
> @@ -648,6 +667,8 @@ static void *multifd_send_thread(void *opaque)
>  {
>      MultiFDSendParams *p =3D opaque;
>      Error *local_err =3D NULL;
> +    /* qemu older than 7.0 don't understand zero page on multifd channel=
 */
> +    bool use_zero_page =3D migrate_use_multifd_zero_page();
>      int ret =3D 0;
>      bool use_zero_copy_send =3D migrate_use_zero_copy_send();
> =20
> @@ -670,6 +691,7 @@ static void *multifd_send_thread(void *opaque)
>          qemu_mutex_lock(&p->mutex);
> =20
>          if (p->pending_job) {
> +            RAMBlock *rb =3D p->pages->block;
>              uint64_t packet_num =3D p->packet_num;
>              p->flags =3D 0;
>              if (p->sync_needed) {
> @@ -688,8 +710,16 @@ static void *multifd_send_thread(void *opaque)
>              }
> =20
>              for (int i =3D 0; i < p->pages->num; i++) {
> -                p->normal[p->normal_num] =3D p->pages->offset[i];
> -                p->normal_num++;
> +                uint64_t offset =3D p->pages->offset[i];
> +                if (use_zero_page &&
> +                    buffer_is_zero(rb->host + offset, p->page_size)) {
> +                    p->zero[p->zero_num] =3D offset;

Same here.

> +                    p->zero_num++;
> +                    ram_release_page(rb->idstr, offset);
> +                } else {
> +                    p->normal[p->normal_num] =3D offset;

Same here? (p->normal[i] can also be u32)

> +                    p->normal_num++;
> +                }
>              }
> =20
>              if (p->normal_num) {
> @@ -1152,6 +1182,13 @@ static void *multifd_recv_thread(void *opaque)
>              }
>          }
> =20
> +        for (int i =3D 0; i < p->zero_num; i++) {
> +            void *page =3D p->host + p->zero[i];
> +            if (!buffer_is_zero(page, p->page_size)) {
> +                memset(page, 0, p->page_size);
> +            }
> +        }
> +
>          if (sync_needed) {
>              qemu_sem_post(&multifd_recv_state->sem_sync);
>              qemu_sem_wait(&p->sem_sync);


