Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92ABD58F8ED
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 10:19:10 +0200 (CEST)
Received: from localhost ([::1]:41590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oM3PJ-00062Y-MN
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 04:19:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1oM3Hp-0008WJ-Bd
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 04:11:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1oM3Hn-0000JP-P2
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 04:11:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660205483;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YBYYGIWnY4xyigXT3MhaYV+L1JkkYV5/nPljTh6rqpg=;
 b=gAjcT1+s5TZ5ix7oJhKwF28fISa7ubgJ/xJ41GxCoJCWFeXz1qgFxVOgkjaNzfuJYo2dta
 hhbqIMUlspBF1d7tElfgO1NHCHCpww07yAhsVDm0hKEq36lPFRxcL7JpR8XZ4wi9MFSqMd
 48eiHs8SbIHpw30lvDQCxLViYrWsALs=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-205-brmE3dYxMFGms_dXyVZsVw-1; Thu, 11 Aug 2022 04:11:21 -0400
X-MC-Unique: brmE3dYxMFGms_dXyVZsVw-1
Received: by mail-ua1-f69.google.com with SMTP id
 y47-20020a9f3272000000b003874d9b010aso3349711uad.6
 for <qemu-devel@nongnu.org>; Thu, 11 Aug 2022 01:11:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc;
 bh=YBYYGIWnY4xyigXT3MhaYV+L1JkkYV5/nPljTh6rqpg=;
 b=XnDPxjVenT27qlFRRUazEuXWYDESco++IFwByOZTv5geiOSdIKsTJzCDA9AvFH2qpP
 UH0r68dqu/by39xEXXfL20xsPPwXFqX+UdkJ17hdthQnaFfBCtGS/9eOiEJeUOd2xrjx
 p/M5ouh7zdD0wSj3qR27UuDVUQWCPbcAJDgP2a99OJtvSQ7X6Gcp362G/enWNvNJ9wFh
 lk701LZ22bAc6JjRgLG3cVeCjFoeLzWEFexHX2x0b+6n5EqlkrDWOCb9A1mx9XdH+k6o
 K7eux10Z/GXxp6CNvSpVUz8y4QIL/4wur0H1S2TCAOSKsslISTjPk6lJvLSQclIAwgOx
 5W7w==
X-Gm-Message-State: ACgBeo0FFG8dJXRY6Q8ay4DBae+kYqNAH2r8926Gjgh3yjw7QJTZCUGa
 VOXi0q5r/GOoAh4wHNLw69c1JfZgaJ4eelsUh8mzr20bUNDuPvZVVpKN3v7t1I8o97N7ba9OTiI
 Z4AET+1JeKURe+4Y=
X-Received: by 2002:a1f:51c2:0:b0:37c:f131:e749 with SMTP id
 f185-20020a1f51c2000000b0037cf131e749mr2291771vkb.38.1660205481377; 
 Thu, 11 Aug 2022 01:11:21 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5Zd8iYb5ogGKBnY1Ll3ayaqWn1IJ9Fzg7Kc8Pl7yx3N/jXvV7Ps3s5pQn27atFO14KQZRYKA==
X-Received: by 2002:a1f:51c2:0:b0:37c:f131:e749 with SMTP id
 f185-20020a1f51c2000000b0037cf131e749mr2291761vkb.38.1660205481175; 
 Thu, 11 Aug 2022 01:11:21 -0700 (PDT)
Received: from ?IPv6:2804:1b3:a800:5713:6880:fd74:a3e5:2086?
 ([2804:1b3:a800:5713:6880:fd74:a3e5:2086])
 by smtp.gmail.com with ESMTPSA id
 i19-20020a67ecd3000000b0037c457e4b49sm1151203vsp.6.2022.08.11.01.11.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 01:11:20 -0700 (PDT)
Message-ID: <1b8e97cdafc2f50924cedd79f484ab9640c38229.camel@redhat.com>
Subject: Re: [PATCH v7 04/12] multifd: Count the number of bytes sent correctly
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras@redhat.com>
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>, Eric Blake
 <eblake@redhat.com>, Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?=
 <f4bug@amsat.org>,  Yanan Wang <wangyanan55@huawei.com>, Markus Armbruster
 <armbru@redhat.com>, Eduardo Habkost <eduardo@habkost.net>
Date: Thu, 11 Aug 2022 05:11:17 -0300
In-Reply-To: <20220802063907.18882-5-quintela@redhat.com>
References: <20220802063907.18882-1-quintela@redhat.com>
 <20220802063907.18882-5-quintela@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.3 
MIME-Version: 1.0
Received-SPF: pass client-ip=170.10.129.124; envelope-from=leobras@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

On Tue, 2022-08-02 at 08:38 +0200, Juan Quintela wrote:
> Current code asumes that all pages are whole.  That is not true for
> example for compression already.  Fix it for creating a new field
> ->sent_bytes that includes it.
>=20
> All ram_counters are used only from the migration thread, so we have
> two options:
> - put a mutex and fill everything when we sent it (not only
> ram_counters, also qemu_file->xfer_bytes).
> - Create a local variable that implements how much has been sent
> through each channel.  And when we push another packet, we "add" the
> previous stats.
>=20
> I choose two due to less changes overall.  On the previous code we
> increase transferred and then we sent.  Current code goes the other
> way around.  It sents the data, and after the fact, it updates the
> counters.  Notice that each channel can have a maximum of half a
> megabyte of data without counting, so it is not very important.
>=20
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>  migration/multifd.h |  2 ++
>  migration/multifd.c | 14 ++++++--------
>  2 files changed, 8 insertions(+), 8 deletions(-)
>=20
> diff --git a/migration/multifd.h b/migration/multifd.h
> index e2802a9ce2..36f899c56f 100644
> --- a/migration/multifd.h
> +++ b/migration/multifd.h
> @@ -102,6 +102,8 @@ typedef struct {
>      uint32_t flags;
>      /* global number of generated multifd packets */
>      uint64_t packet_num;
> +    /* How many bytes have we sent on the last packet */
> +    uint64_t sent_bytes;
>      /* thread has work to do */
>      int pending_job;
>      /* array of pages to sent.
> diff --git a/migration/multifd.c b/migration/multifd.c
> index aa3808a6f4..e25b529235 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -394,7 +394,6 @@ static int multifd_send_pages(QEMUFile *f)
>      static int next_channel;
>      MultiFDSendParams *p =3D NULL; /* make happy gcc */
>      MultiFDPages_t *pages =3D multifd_send_state->pages;
> -    uint64_t transferred;
> =20
>      if (qatomic_read(&multifd_send_state->exiting)) {
>          return -1;
> @@ -429,10 +428,10 @@ static int multifd_send_pages(QEMUFile *f)
>      p->packet_num =3D multifd_send_state->packet_num++;
>      multifd_send_state->pages =3D p->pages;
>      p->pages =3D pages;
> -    transferred =3D ((uint64_t) pages->num) * p->page_size + p->packet_l=
en;
> -    qemu_file_acct_rate_limit(f, transferred);
> -    ram_counters.multifd_bytes +=3D transferred;
> -    ram_counters.transferred +=3D transferred;
> +    ram_transferred_add(p->sent_bytes);
> +    ram_counters.multifd_bytes +=3D p->sent_bytes;

I'm worndering if we could avoid having this last line by having
ram_transferred_add() to include:

if (migrate_use_multifd()) {
    ram_counters.multifd_bytes +=3D bytes;
}

But I am not sure if other usages from ram_transferred_add() could interfer=
e.


> +    qemu_file_acct_rate_limit(f, p->sent_bytes);
> +    p->sent_bytes =3D 0;
>      qemu_mutex_unlock(&p->mutex);
>      qemu_sem_post(&p->sem);
> =20
> @@ -605,9 +604,6 @@ int multifd_send_sync_main(QEMUFile *f)
>          p->packet_num =3D multifd_send_state->packet_num++;
>          p->flags |=3D MULTIFD_FLAG_SYNC;
>          p->pending_job++;
> -        qemu_file_acct_rate_limit(f, p->packet_len);
> -        ram_counters.multifd_bytes +=3D p->packet_len;
> -        ram_counters.transferred +=3D p->packet_len;
>          qemu_mutex_unlock(&p->mutex);
>          qemu_sem_post(&p->sem);
> =20
> @@ -714,6 +710,8 @@ static void *multifd_send_thread(void *opaque)
>              }
> =20
>              qemu_mutex_lock(&p->mutex);
> +            p->sent_bytes +=3D p->packet_len;;

Double semicolon.

> +            p->sent_bytes +=3D p->next_packet_size;
>              p->pending_job--;
>              qemu_mutex_unlock(&p->mutex);
> =20

IIUC, it changes how rate-limiting and ram counters perceive how many bytes=
 have
been sent, by counting actual bytes instead of page multiples. This should
reflect what have been actually sent (in terms of rate limiting).

I'm wondering if having the ram_counters.transferred to reflect acutal byte=
s,
instead of the number of pages * pagesize will cause any user (or managemen=
t
code) to be confuse in any way.

Other than that:
Reviewed-by: Leonardo Bras <leobras@redhat.com>

Best regards,=20
Leo


