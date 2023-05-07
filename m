Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E15356F9C17
	for <lists+qemu-devel@lfdr.de>; Sun,  7 May 2023 23:58:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvmO8-0006PP-R9; Sun, 07 May 2023 17:57:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1pvmO7-0006PH-7z
 for qemu-devel@nongnu.org; Sun, 07 May 2023 17:57:51 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1pvmO5-0003rb-3W
 for qemu-devel@nongnu.org; Sun, 07 May 2023 17:57:51 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id
 3f1490d57ef6-b996127ec71so5291941276.0
 for <qemu-devel@nongnu.org>; Sun, 07 May 2023 14:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1683496668; x=1686088668;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2jbZFK06p5cf24+XZrObVfKkbXOInsFYYc23zUp3eM8=;
 b=4jxu6gIXBgVRsyIab7yoftylUW6m8LAJ3SJDsKlCXTilSVylMOio6MocX9hE6jjCHx
 0nhTCmqInY8XQDhXdPF85xY73fU4B7TS5Jhsj7fxlVLOvw9LsrKV46+J6YI6JLQOIwgo
 Sx0W49zHW//FDdw49IIAhVidyW6oAYABLXl2uL/uUJ5tjENaV7V5LCNlnpHZPNC88dQn
 yuUai8Oyob14UnQFum52XNgs5V0gt/rtbHGbTvpEm1ECsYZkukPFXrZECGHGepLUU8/H
 +A9TStVxmJR9JRMYj/oVcOoq1qo/WQVWxwXXWexjO2DxSbcK1g0HnynVJRY2sT5AHhgU
 Kmbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683496668; x=1686088668;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2jbZFK06p5cf24+XZrObVfKkbXOInsFYYc23zUp3eM8=;
 b=lHwf86Y6a8W6MSFaCF4WuA8HNuqXo0SMi4DnbdDgRzqVcM6OcrKrfMfu938m85f10B
 UIuYLuXYVAnnqC5XHT+vOomp5YeFFU5bu/BXD8n+3OXxlJ9RmpT5EJ6tkAhnR8/PfP0J
 IRsPCuw106SasY5EFxYsiPpBzHnrj025H9di+Eixo4k9juPthhuUtZrc8GYz1/S1VuRY
 kd4mlQP03sLiZKj4FjkLC91FLo11QrrKLhQrgSKwiG1d9Fqd2akp2X5RsPbeQD4rJJEG
 B69ZAZ/uiuBCTgyLaY/Zrc2VE2NPIa6xjUeSlurSlq10kPoQkcv+GPPpbpL7nA+B552l
 F/EQ==
X-Gm-Message-State: AC+VfDzJEcW9G6+fok1FdPS8BazSC17nbEYNyLBel6Ky3efxYLNWdg2S
 9ia1gnOOcmdsNNNdkx6nqyLmcWplUlhYx3zacMg5Lg==
X-Google-Smtp-Source: ACHHUZ61wP7eTr1n7DWqghuGq9IJCYRG7K61zwuFjQxcEPh4Qs0s0fsPeN2cM4XURDjuU9+doP48hwwEhseVHKBaIxU=
X-Received: by 2002:a25:4087:0:b0:b9e:5006:42af with SMTP id
 n129-20020a254087000000b00b9e500642afmr8748074yba.58.1683496667770; Sun, 07
 May 2023 14:57:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230501072101.22890-1-andrew@daynix.com>
 <20230501072101.22890-2-andrew@daynix.com>
 <ZFJAbxERGepAmfZT@redhat.com>
In-Reply-To: <ZFJAbxERGepAmfZT@redhat.com>
From: Andrew Melnichenko <andrew@daynix.com>
Date: Mon, 8 May 2023 00:39:08 +0300
Message-ID: <CABcq3pEKpV9ZsGBrdvjTdepEeMZhV07DDcU+=Y5No_E4dJ9MRw@mail.gmail.com>
Subject: Re: [PATCH 1/5] ebpf: Added eBPF initialization by fds and map update.
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: jasowang@redhat.com, mst@redhat.com, armbru@redhat.com, eblake@redhat.com, 
 qemu-devel@nongnu.org, yuri.benditovich@daynix.com, yan@daynix.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=andrew@daynix.com; helo=mail-yb1-xb2a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi all,

On Wed, May 3, 2023 at 2:07=E2=80=AFPM Daniel P. Berrang=C3=A9 <berrange@re=
dhat.com> wrote:
>
> On Mon, May 01, 2023 at 10:20:57AM +0300, Andrew Melnychenko wrote:
> > Changed eBPF map updates through mmaped array.
> > Mmaped arrays provide direct access to map data.
> > It should omit using bpf_map_update_elem() call,
> > which may require capabilities that are not present.
> >
> > Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
> > ---
> >  ebpf/ebpf_rss-stub.c |   6 +++
> >  ebpf/ebpf_rss.c      | 120 ++++++++++++++++++++++++++++++++++---------
> >  ebpf/ebpf_rss.h      |  10 ++++
> >  3 files changed, 113 insertions(+), 23 deletions(-)
> >
> > diff --git a/ebpf/ebpf_rss-stub.c b/ebpf/ebpf_rss-stub.c
> > index e71e229190d..8d7fae2ad92 100644
> > --- a/ebpf/ebpf_rss-stub.c
> > +++ b/ebpf/ebpf_rss-stub.c
> > @@ -28,6 +28,12 @@ bool ebpf_rss_load(struct EBPFRSSContext *ctx)
> >      return false;
> >  }
> >
> > +bool ebpf_rss_load_fds(struct EBPFRSSContext *ctx, int program_fd,
> > +                       int config_fd, int toeplitz_fd, int table_fd)
> > +{
> > +    return false;
> > +}
> > +
> >  bool ebpf_rss_set_all(struct EBPFRSSContext *ctx, struct EBPFRSSConfig=
 *config,
> >                        uint16_t *indirections_table, uint8_t *toeplitz_=
key)
> >  {
> > diff --git a/ebpf/ebpf_rss.c b/ebpf/ebpf_rss.c
> > index cee658c158b..08015fecb18 100644
> > --- a/ebpf/ebpf_rss.c
> > +++ b/ebpf/ebpf_rss.c
> > @@ -27,19 +27,68 @@ void ebpf_rss_init(struct EBPFRSSContext *ctx)
> >  {
> >      if (ctx !=3D NULL) {
> >          ctx->obj =3D NULL;
> > +        ctx->program_fd =3D -1;
> >      }
> >  }
> >
> >  bool ebpf_rss_is_loaded(struct EBPFRSSContext *ctx)
> >  {
> > -    return ctx !=3D NULL && ctx->obj !=3D NULL;
> > +    return ctx !=3D NULL && (ctx->obj !=3D NULL || ctx->program_fd !=
=3D -1);
> > +}
> > +
> > +static bool ebpf_rss_mmap(struct EBPFRSSContext *ctx)
> > +{
> > +    if (!ebpf_rss_is_loaded(ctx)) {
> > +        return false;
> > +    }
> > +
> > +    ctx->mmap_configuration =3D mmap(NULL, qemu_real_host_page_size(),
> > +                                   PROT_READ | PROT_WRITE, MAP_SHARED,
> > +                                   ctx->map_configuration, 0);
> > +    if (ctx->mmap_configuration =3D=3D MAP_FAILED) {
> > +        trace_ebpf_error("eBPF RSS", "can not mmap eBPF configuration =
array");
> > +        return false;
> > +    }
> > +    ctx->mmap_toeplitz_key =3D mmap(NULL, qemu_real_host_page_size(),
> > +                                   PROT_READ | PROT_WRITE, MAP_SHARED,
> > +                                   ctx->map_toeplitz_key, 0);
> > +    if (ctx->mmap_toeplitz_key =3D=3D MAP_FAILED) {
> > +        trace_ebpf_error("eBPF RSS", "can not mmap eBPF toeplitz key")=
;
> > +        goto toeplitz_fail;
> > +    }
> > +    ctx->mmap_indirections_table =3D mmap(NULL, qemu_real_host_page_si=
ze(),
> > +                                   PROT_READ | PROT_WRITE, MAP_SHARED,
> > +                                   ctx->map_indirections_table, 0);
> > +    if (ctx->mmap_indirections_table =3D=3D MAP_FAILED) {
> > +        trace_ebpf_error("eBPF RSS", "can not mmap eBPF indirection ta=
ble");
> > +        goto indirection_fail;
> > +    }
> > +
> > +    return true;
> > +
> > +indirection_fail:
> > +    munmap(ctx->mmap_toeplitz_key, qemu_real_host_page_size());
> > +toeplitz_fail:
> > +    munmap(ctx->mmap_configuration, qemu_real_host_page_size());
> > +    return false;
> > +}
> > +
> > +static void ebpf_rss_munmap(struct EBPFRSSContext *ctx)
> > +{
> > +    if (!ebpf_rss_is_loaded(ctx)) {
> > +        return;
> > +    }
> > +
> > +    munmap(ctx->mmap_indirections_table, qemu_real_host_page_size());
> > +    munmap(ctx->mmap_toeplitz_key, qemu_real_host_page_size());
> > +    munmap(ctx->mmap_configuration, qemu_real_host_page_size());
> >  }
> >
> >  bool ebpf_rss_load(struct EBPFRSSContext *ctx)
> >  {
> >      struct rss_bpf *rss_bpf_ctx;
> >
> > -    if (ctx =3D=3D NULL) {
> > +    if (ctx =3D=3D NULL || ebpf_rss_is_loaded(ctx)) {
> >          return false;
> >      }
> >
> > @@ -66,26 +115,51 @@ bool ebpf_rss_load(struct EBPFRSSContext *ctx)
> >      ctx->map_toeplitz_key =3D bpf_map__fd(
> >              rss_bpf_ctx->maps.tap_rss_map_toeplitz_key);
> >
> > +    if (!ebpf_rss_mmap(ctx)) {
> > +        goto error;
> > +    }
> > +
> >      return true;
> >  error:
> >      rss_bpf__destroy(rss_bpf_ctx);
> >      ctx->obj =3D NULL;
> > +    ctx->program_fd =3D -1;
> >
> >      return false;
> >  }
> >
> > -static bool ebpf_rss_set_config(struct EBPFRSSContext *ctx,
> > -                                struct EBPFRSSConfig *config)
> > +bool ebpf_rss_load_fds(struct EBPFRSSContext *ctx, int program_fd,
> > +                       int config_fd, int toeplitz_fd, int table_fd)
> >  {
> > -    uint32_t map_key =3D 0;
> > +    if (ctx =3D=3D NULL || ebpf_rss_is_loaded(ctx)) {
> > +        return false;
> > +    }
> >
> > -    if (!ebpf_rss_is_loaded(ctx)) {
> > +    if (program_fd < 0 || config_fd < 0 || toeplitz_fd < 0 || table_fd=
 < 0) {
> >          return false;
> >      }
> > -    if (bpf_map_update_elem(ctx->map_configuration,
> > -                            &map_key, config, 0) < 0) {
> > +
> > +    ctx->program_fd =3D program_fd;
> > +    ctx->map_configuration =3D config_fd;
> > +    ctx->map_toeplitz_key =3D toeplitz_fd;
> > +    ctx->map_indirections_table =3D table_fd;
> > +
> > +    if (!ebpf_rss_mmap(ctx)) {
> > +        ctx->program_fd =3D -1;
> >          return false;
> >      }
> > +
> > +    return true;
> > +}
> > +
> > +static bool ebpf_rss_set_config(struct EBPFRSSContext *ctx,
> > +                                struct EBPFRSSConfig *config)
> > +{
> > +    if (!ebpf_rss_is_loaded(ctx)) {
> > +        return false;
> > +    }
> > +
> > +    memcpy(ctx->mmap_configuration, config, sizeof(*config));
> >      return true;
> >  }
> >
> > @@ -93,27 +167,19 @@ static bool ebpf_rss_set_indirections_table(struct=
 EBPFRSSContext *ctx,
> >                                              uint16_t *indirections_tab=
le,
> >                                              size_t len)
> >  {
> > -    uint32_t i =3D 0;
> > -
> >      if (!ebpf_rss_is_loaded(ctx) || indirections_table =3D=3D NULL ||
> >         len > VIRTIO_NET_RSS_MAX_TABLE_LEN) {
> >          return false;
> >      }
> >
> > -    for (; i < len; ++i) {
> > -        if (bpf_map_update_elem(ctx->map_indirections_table, &i,
> > -                                indirections_table + i, 0) < 0) {
> > -            return false;
> > -        }
> > -    }
> > +    memcpy(ctx->mmap_indirections_table, indirections_table,
> > +            sizeof(*indirections_table) * len);
> >      return true;
> >  }
> >
> >  static bool ebpf_rss_set_toepliz_key(struct EBPFRSSContext *ctx,
> >                                       uint8_t *toeplitz_key)
> >  {
> > -    uint32_t map_key =3D 0;
> > -
> >      /* prepare toeplitz key */
> >      uint8_t toe[VIRTIO_NET_RSS_MAX_KEY_SIZE] =3D {};
> >
> > @@ -123,10 +189,7 @@ static bool ebpf_rss_set_toepliz_key(struct EBPFRS=
SContext *ctx,
> >      memcpy(toe, toeplitz_key, VIRTIO_NET_RSS_MAX_KEY_SIZE);
> >      *(uint32_t *)toe =3D ntohl(*(uint32_t *)toe);
> >
> > -    if (bpf_map_update_elem(ctx->map_toeplitz_key, &map_key, toe,
> > -                            0) < 0) {
> > -        return false;
> > -    }
> > +    memcpy(ctx->mmap_toeplitz_key, toe, VIRTIO_NET_RSS_MAX_KEY_SIZE);
> >      return true;
> >  }
> >
> > @@ -160,6 +223,17 @@ void ebpf_rss_unload(struct EBPFRSSContext *ctx)
> >          return;
> >      }
> >
> > -    rss_bpf__destroy(ctx->obj);
> > +    ebpf_rss_munmap(ctx);
> > +
> > +    if (ctx->obj) {
> > +        rss_bpf__destroy(ctx->obj);
> > +    } else {
> > +        close(ctx->program_fd);
> > +        close(ctx->map_configuration);
> > +        close(ctx->map_toeplitz_key);
> > +        close(ctx->map_indirections_table);
>
> These 4 fds are left uninitialized with 'ctx' is first allocated,
> so will either default to 0 (aka stdin's FD num), or worse,
> default to uninitialized memory.
>
> Correct sequencing of the API calls will probably operate safely
> afaict, but I'd prefer us to proactively initialize all these
> to '-1' in ebpf_rss_init(), and check there that they're not
> '-1' before trying to close them, and then set them to -1 once
> closed.
>

Oh yeah, I've missed it, I'll fix it, there is supposed to be a check
for opened context.

> > +    }
> > +
> >      ctx->obj =3D NULL;
> > +    ctx->program_fd =3D -1;
> >  }
> > diff --git a/ebpf/ebpf_rss.h b/ebpf/ebpf_rss.h
> > index bf3f2572c7c..239242b0d26 100644
> > --- a/ebpf/ebpf_rss.h
> > +++ b/ebpf/ebpf_rss.h
> > @@ -14,12 +14,19 @@
> >  #ifndef QEMU_EBPF_RSS_H
> >  #define QEMU_EBPF_RSS_H
> >
> > +#define EBPF_RSS_MAX_FDS 4
> > +
> >  struct EBPFRSSContext {
> >      void *obj;
> >      int program_fd;
> >      int map_configuration;
> >      int map_toeplitz_key;
> >      int map_indirections_table;
> > +
> > +    /* mapped eBPF maps for direct access to omit bpf_map_update_elem(=
) */
> > +    void *mmap_configuration;
> > +    void *mmap_toeplitz_key;
> > +    void *mmap_indirections_table;
> >  };
> >
> >  struct EBPFRSSConfig {
> > @@ -36,6 +43,9 @@ bool ebpf_rss_is_loaded(struct EBPFRSSContext *ctx);
> >
> >  bool ebpf_rss_load(struct EBPFRSSContext *ctx);
> >
> > +bool ebpf_rss_load_fds(struct EBPFRSSContext *ctx, int program_fd,
> > +                       int config_fd, int toeplitz_fd, int table_fd);
>
> I'd probably suggest splitting this into two patches.
>
> One that introduces the mmap'ing to replace bpf_map_update_elem,
> and then a second that adds ebpf_rss_load_fds, as the ebpf_rss_load_fds
> addition is making the diff output harder to read than it needs to be.
>

Ok.

> > +
> >  bool ebpf_rss_set_all(struct EBPFRSSContext *ctx, struct EBPFRSSConfig=
 *config,
> >                        uint16_t *indirections_table, uint8_t *toeplitz_=
key);
> >
> > --
> > 2.39.1
> >
>
> With regards,
> Daniel
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
>

