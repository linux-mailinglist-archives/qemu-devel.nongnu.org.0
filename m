Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E0F2CEF85
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 15:15:16 +0100 (CET)
Received: from localhost ([::1]:46642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klBrf-0008CQ-Kh
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 09:15:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1klBqH-0007L8-VD
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 09:13:50 -0500
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:44836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1klBqC-0000GK-UZ
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 09:13:49 -0500
Received: by mail-ed1-x543.google.com with SMTP id l5so5935228edq.11
 for <qemu-devel@nongnu.org>; Fri, 04 Dec 2020 06:13:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Kfw5EAg+SpcYoe7Ec3lxKKkO9Oiie/Wya/fimCojD7g=;
 b=Fe0XzwhBNer13Vvl5ZqsE7KonBVE/7qdUIdymDea5JqzxK96gNCBxMH2nKC0sU+jSr
 x9qEivlBWqjMihb+wdnTZTrnAwOGtzEawpgXJlQgDGxQflnIFDcSjMhRfLmhJeFwqKxT
 qWmUC7NA6rnjT+wPrsczQPBAuftU0ife3dko+VHc6qh0cOIZtlxbv7mM6Dg5l5301riT
 5RU6WAju3jbpcfi7jKkVsIqGwc4UellCj8xAnt/vgeljGXKJxAMbn3nsqpDF5EUDCxZd
 ytwwj9igLTyIQwWMTRdRRasSTT3HpTh33TtwzwArleeqWSJmJMOE6cqAH16CHMOniXJk
 8sYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Kfw5EAg+SpcYoe7Ec3lxKKkO9Oiie/Wya/fimCojD7g=;
 b=Nf+klghH/An2Lu26JzTveIvXP6SYgF50BYe6fs3FcMrNG3aSDMVimQCSXggBhrCtBs
 zA2kafALN/5Jvcu0fNk8VIBr9nsXIFuJIam9W1H8jFpQN/Xk5W5vmbUALrAIuA0YTlqB
 y/JgQfermoNXqYZaUloa+Oh9ycZuxtwvRhp9/PgMlqwmnCsRyHCSeR6DAINjSQ0SxWtr
 r2hhTcRbyVYga1LN7Eq/6UbXxaDkhSgR0FoOX4D1ktuO78jA+DOkx1MprTHq4o0KynuG
 slCUTv+UxEmqIunUZ9rXHcvtCTi5CwY1Xp2prdsXg3Z6i1vV/T6uZPrnMXJQoUlwIsaF
 kbTQ==
X-Gm-Message-State: AOAM531Zt7NwZ/3IySJvzvoGak+0UbNmHrQBgMmNNK4Afx7KqzVoEvQ0
 HGi7pFPMgpm6nhZnGMUMY59fbiVdxmFrCOHcdbo=
X-Google-Smtp-Source: ABdhPJyAAl+kUw/O4Ynt6vH+8SWUP2326FYRYFpsIy0XTKfgp1pvsr9OZddp4wPiWCmGZqjha96eqF67ihhUgIV97K8=
X-Received: by 2002:a50:e846:: with SMTP id k6mr7861924edn.245.1607091223486; 
 Fri, 04 Dec 2020 06:13:43 -0800 (PST)
MIME-Version: 1.0
References: <cover.1606853298.git.jag.raman@oracle.com>
 <5ee82d0afbf1777be7be737209408515df924249.1606853298.git.jag.raman@oracle.com>
In-Reply-To: <5ee82d0afbf1777be7be737209408515df924249.1606853298.git.jag.raman@oracle.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 4 Dec 2020 18:13:31 +0400
Message-ID: <CAJ+F1CJASKQt3bsg0VovDaTdQYPgiX8ujkMKUWKyq220uOVZ+g@mail.gmail.com>
Subject: Re: [PATCH v12 03/19] memory: alloc RAM from file at offset
To: Jagannathan Raman <jag.raman@oracle.com>
Content-Type: multipart/alternative; boundary="0000000000007f663005b5a415f6"
Received-SPF: pass client-ip=2a00:1450:4864:20::543;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x543.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>, Fam Zheng <fam@euphon.net>,
 Swapnil Ingle <swapnil.ingle@nutanix.com>,
 John G Johnson <john.g.johnson@oracle.com>, QEMU <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Kanth Ghatraju <kanth.ghatraju@oracle.com>,
 Felipe Franciosi <felipe@nutanix.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000007f663005b5a415f6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 2, 2020 at 12:23 AM Jagannathan Raman <jag.raman@oracle.com>
wrote:

> Allow RAM MemoryRegion to be created from an offset in a file, instead
> of allocating at offset of 0 by default. This is needed to synchronize
> RAM between QEMU & remote process.
>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  include/exec/memory.h     |  2 ++
>  include/exec/ram_addr.h   |  2 +-
>  include/qemu/mmap-alloc.h |  3 ++-
>  backends/hostmem-memfd.c  |  2 +-
>  hw/misc/ivshmem.c         |  3 ++-
>  softmmu/memory.c          |  3 ++-
>  softmmu/physmem.c         | 11 +++++++----
>  util/mmap-alloc.c         |  7 ++++---
>  util/oslib-posix.c        |  2 +-
>  9 files changed, 22 insertions(+), 13 deletions(-)
>
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index 0f3e6bc..7bcaada 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -980,6 +980,7 @@ void memory_region_init_ram_from_file(MemoryRegion *m=
r,
>   * @size: size of the region.
>   * @share: %true if memory must be mmaped with the MAP_SHARED flag
>   * @fd: the fd to mmap.
> + * @offset: offset within the file referenced by fd
>   * @errp: pointer to Error*, to store an error if it happens.
>   *
>   * Note that this function does not do anything to cause the data in the
> @@ -991,6 +992,7 @@ void memory_region_init_ram_from_fd(MemoryRegion *mr,
>                                      uint64_t size,
>                                      bool share,
>                                      int fd,
> +                                    ram_addr_t offset,
>                                      Error **errp);
>  #endif
>
> diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
> index c6d2ef1..d465a48 100644
> --- a/include/exec/ram_addr.h
> +++ b/include/exec/ram_addr.h
> @@ -121,7 +121,7 @@ RAMBlock *qemu_ram_alloc_from_file(ram_addr_t size,
> MemoryRegion *mr,
>                                     Error **errp);
>  RAMBlock *qemu_ram_alloc_from_fd(ram_addr_t size, MemoryRegion *mr,
>                                   uint32_t ram_flags, int fd,
> -                                 Error **errp);
> +                                 off_t offset, Error **errp);
>
>  RAMBlock *qemu_ram_alloc_from_ptr(ram_addr_t size, void *host,
>                                    MemoryRegion *mr, Error **errp);
> diff --git a/include/qemu/mmap-alloc.h b/include/qemu/mmap-alloc.h
> index e786266..4f57985 100644
> --- a/include/qemu/mmap-alloc.h
> +++ b/include/qemu/mmap-alloc.h
> @@ -25,7 +25,8 @@ void *qemu_ram_mmap(int fd,
>                      size_t size,
>                      size_t align,
>                      bool shared,
> -                    bool is_pmem);
> +                    bool is_pmem,
> +                    off_t start);
>

I'd suggest to keep the variable name  "offset", to avoid potential
confusion (it's also the name of the mmap() argument).


>  void qemu_ram_munmap(int fd, void *ptr, size_t size);
>
> diff --git a/backends/hostmem-memfd.c b/backends/hostmem-memfd.c
> index e5626d4..69b0ae3 100644
> --- a/backends/hostmem-memfd.c
> +++ b/backends/hostmem-memfd.c
> @@ -55,7 +55,7 @@ memfd_backend_memory_alloc(HostMemoryBackend *backend,
> Error **errp)
>      name =3D host_memory_backend_get_name(backend);
>      memory_region_init_ram_from_fd(&backend->mr, OBJECT(backend),
>                                     name, backend->size,
> -                                   backend->share, fd, errp);
> +                                   backend->share, fd, 0, errp);
>      g_free(name);
>  }
>
> diff --git a/hw/misc/ivshmem.c b/hw/misc/ivshmem.c
> index e321e5c..8d3e1ee 100644
> --- a/hw/misc/ivshmem.c
> +++ b/hw/misc/ivshmem.c
> @@ -494,7 +494,8 @@ static void process_msg_shmem(IVShmemState *s, int fd=
,
> Error **errp)
>
>      /* mmap the region and map into the BAR2 */
>      memory_region_init_ram_from_fd(&s->server_bar2, OBJECT(s),
> -                                   "ivshmem.bar2", size, true, fd,
> &local_err);
> +                                   "ivshmem.bar2", size, true, fd, 0,
> +                                   &local_err);
>      if (local_err) {
>          error_propagate(errp, local_err);
>          return;
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index 11ca94d..e4ed0e4 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -1612,6 +1612,7 @@ void memory_region_init_ram_from_fd(MemoryRegion *m=
r,
>                                      uint64_t size,
>                                      bool share,
>                                      int fd,
> +                                    ram_addr_t offset,
>                                      Error **errp)
>  {
>      Error *err =3D NULL;
> @@ -1621,7 +1622,7 @@ void memory_region_init_ram_from_fd(MemoryRegion *m=
r,
>      mr->destructor =3D memory_region_destructor_ram;
>      mr->ram_block =3D qemu_ram_alloc_from_fd(size, mr,
>                                             share ? RAM_SHARED : 0,
> -                                           fd, &err);
> +                                           fd, offset, &err);
>      mr->dirty_log_mask =3D tcg_enabled() ? (1 << DIRTY_MEMORY_CODE) : 0;
>      if (err) {
>          mr->size =3D int128_zero();
> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index 3027747..e0b8fc6 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -1461,6 +1461,7 @@ static void *file_ram_alloc(RAMBlock *block,
>                              ram_addr_t memory,
>                              int fd,
>                              bool truncate,
> +                            off_t offset,
>                              Error **errp)
>  {
>      void *area;
> @@ -1511,7 +1512,8 @@ static void *file_ram_alloc(RAMBlock *block,
>      }
>
>      area =3D qemu_ram_mmap(fd, memory, block->mr->align,
> -                         block->flags & RAM_SHARED, block->flags &
> RAM_PMEM);
> +                         block->flags & RAM_SHARED, block->flags &
> RAM_PMEM,
> +                         offset);
>      if (area =3D=3D MAP_FAILED) {
>          error_setg_errno(errp, errno,
>                           "unable to map backing store for guest RAM");
> @@ -1943,7 +1945,7 @@ static void ram_block_add(RAMBlock *new_block, Erro=
r
> **errp, bool shared)
>  #ifdef CONFIG_POSIX
>  RAMBlock *qemu_ram_alloc_from_fd(ram_addr_t size, MemoryRegion *mr,
>                                   uint32_t ram_flags, int fd,
> -                                 Error **errp)
> +                                 off_t offset, Error **errp)
>  {
>      RAMBlock *new_block;
>      Error *local_err =3D NULL;
> @@ -1996,7 +1998,8 @@ RAMBlock *qemu_ram_alloc_from_fd(ram_addr_t size,
> MemoryRegion *mr,
>      new_block->used_length =3D size;
>      new_block->max_length =3D size;
>      new_block->flags =3D ram_flags;
> -    new_block->host =3D file_ram_alloc(new_block, size, fd, !file_size,
> errp);
> +    new_block->host =3D file_ram_alloc(new_block, size, fd, !file_size,
> offset,
> +                                     errp);
>      if (!new_block->host) {
>          g_free(new_block);
>          return NULL;
> @@ -2026,7 +2029,7 @@ RAMBlock *qemu_ram_alloc_from_file(ram_addr_t size,
> MemoryRegion *mr,
>          return NULL;
>      }
>
> -    block =3D qemu_ram_alloc_from_fd(size, mr, ram_flags, fd, errp);
> +    block =3D qemu_ram_alloc_from_fd(size, mr, ram_flags, fd, 0, errp);
>      if (!block) {
>          if (created) {
>              unlink(mem_path);
> diff --git a/util/mmap-alloc.c b/util/mmap-alloc.c
> index 27dcccd..a28f702 100644
> --- a/util/mmap-alloc.c
> +++ b/util/mmap-alloc.c
> @@ -86,7 +86,8 @@ void *qemu_ram_mmap(int fd,
>                      size_t size,
>                      size_t align,
>                      bool shared,
> -                    bool is_pmem)
> +                    bool is_pmem,
> +                    off_t start)
>  {
>      int flags;
>      int map_sync_flags =3D 0;
> @@ -147,7 +148,7 @@ void *qemu_ram_mmap(int fd,
>      offset =3D QEMU_ALIGN_UP((uintptr_t)guardptr, align) -
> (uintptr_t)guardptr;
>
>      ptr =3D mmap(guardptr + offset, size, PROT_READ | PROT_WRITE,
> -               flags | map_sync_flags, fd, 0);
> +               flags | map_sync_flags, fd, start);
>
>      if (ptr =3D=3D MAP_FAILED && map_sync_flags) {
>          if (errno =3D=3D ENOTSUP) {
> @@ -172,7 +173,7 @@ void *qemu_ram_mmap(int fd,
>           * we will remove these flags to handle compatibility.
>           */
>          ptr =3D mmap(guardptr + offset, size, PROT_READ | PROT_WRITE,
> -                   flags, fd, 0);
> +                   flags, fd, start);
>      }
>
>      if (ptr =3D=3D MAP_FAILED) {
> diff --git a/util/oslib-posix.c b/util/oslib-posix.c
> index f15234b..93874df 100644
> --- a/util/oslib-posix.c
> +++ b/util/oslib-posix.c
> @@ -227,7 +227,7 @@ void *qemu_memalign(size_t alignment, size_t size)
>  void *qemu_anon_ram_alloc(size_t size, uint64_t *alignment, bool shared)
>  {
>      size_t align =3D QEMU_VMALLOC_ALIGN;
> -    void *ptr =3D qemu_ram_mmap(-1, size, align, shared, false);
> +    void *ptr =3D qemu_ram_mmap(-1, size, align, shared, false, 0);
>
>      if (ptr =3D=3D MAP_FAILED) {
>          return NULL;
> --
> 1.8.3.1
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000007f663005b5a415f6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 2, 2020 at 12:23 AM Jagan=
nathan Raman &lt;<a href=3D"mailto:jag.raman@oracle.com">jag.raman@oracle.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">Allow RAM MemoryRegion to be created from an offset in a file, instead<br=
>
of allocating at offset of 0 by default. This is needed to synchronize<br>
RAM between QEMU &amp; remote process.<br>
<br>
Signed-off-by: Jagannathan Raman &lt;<a href=3D"mailto:jag.raman@oracle.com=
" target=3D"_blank">jag.raman@oracle.com</a>&gt;<br>
Signed-off-by: John G Johnson &lt;<a href=3D"mailto:john.g.johnson@oracle.c=
om" target=3D"_blank">john.g.johnson@oracle.com</a>&gt;<br>
Signed-off-by: Elena Ufimtseva &lt;<a href=3D"mailto:elena.ufimtseva@oracle=
.com" target=3D"_blank">elena.ufimtseva@oracle.com</a>&gt;<br>
Reviewed-by: Stefan Hajnoczi &lt;<a href=3D"mailto:stefanha@redhat.com" tar=
get=3D"_blank">stefanha@redhat.com</a>&gt;<br>
---<br>
=C2=A0include/exec/memory.h=C2=A0 =C2=A0 =C2=A0|=C2=A0 2 ++<br>
=C2=A0include/exec/ram_addr.h=C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0include/qemu/mmap-alloc.h |=C2=A0 3 ++-<br>
=C2=A0backends/hostmem-memfd.c=C2=A0 |=C2=A0 2 +-<br>
=C2=A0hw/misc/ivshmem.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 3 ++-<br>
=C2=A0softmmu/memory.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 ++-<br>
=C2=A0softmmu/physmem.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 11 +++++++----<b=
r>
=C2=A0util/mmap-alloc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 7 ++++---<=
br>
=C2=A0util/oslib-posix.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A09 files changed, 22 insertions(+), 13 deletions(-)<br>
<br>
diff --git a/include/exec/memory.h b/include/exec/memory.h<br>
index 0f3e6bc..7bcaada 100644<br>
--- a/include/exec/memory.h<br>
+++ b/include/exec/memory.h<br>
@@ -980,6 +980,7 @@ void memory_region_init_ram_from_file(MemoryRegion *mr,=
<br>
=C2=A0 * @size: size of the region.<br>
=C2=A0 * @share: %true if memory must be mmaped with the MAP_SHARED flag<br=
>
=C2=A0 * @fd: the fd to mmap.<br>
+ * @offset: offset within the file referenced by fd<br>
=C2=A0 * @errp: pointer to Error*, to store an error if it happens.<br>
=C2=A0 *<br>
=C2=A0 * Note that this function does not do anything to cause the data in =
the<br>
@@ -991,6 +992,7 @@ void memory_region_init_ram_from_fd(MemoryRegion *mr,<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t size,<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool share,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int fd,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ram_addr_t offset,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Error **errp);<b=
r>
=C2=A0#endif<br>
<br>
diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h<br>
index c6d2ef1..d465a48 100644<br>
--- a/include/exec/ram_addr.h<br>
+++ b/include/exec/ram_addr.h<br>
@@ -121,7 +121,7 @@ RAMBlock *qemu_ram_alloc_from_file(ram_addr_t size, Mem=
oryRegion *mr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Error **errp);<br>
=C2=A0RAMBlock *qemu_ram_alloc_from_fd(ram_addr_t size, MemoryRegion *mr,<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t ram_flags, int fd,<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Error **errp);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0off_t offset, Error **errp);<b=
r>
<br>
=C2=A0RAMBlock *qemu_ram_alloc_from_ptr(ram_addr_t size, void *host,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MemoryRegion *mr, Error=
 **errp);<br>
diff --git a/include/qemu/mmap-alloc.h b/include/qemu/mmap-alloc.h<br>
index e786266..4f57985 100644<br>
--- a/include/qemu/mmap-alloc.h<br>
+++ b/include/qemu/mmap-alloc.h<br>
@@ -25,7 +25,8 @@ void *qemu_ram_mmap(int fd,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0size_t size,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0size_t align,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0bool shared,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bool=
 is_pmem);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bool=
 is_pmem,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 off_=
t start);<br></blockquote><div><br></div><div>I&#39;d suggest to keep the v=
ariable name=C2=A0 &quot;offset&quot;, to avoid potential confusion (it&#39=
;s also the name of the mmap() argument).</div><div><br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
<br>
=C2=A0void qemu_ram_munmap(int fd, void *ptr, size_t size);<br>
<br>
diff --git a/backends/hostmem-memfd.c b/backends/hostmem-memfd.c<br>
index e5626d4..69b0ae3 100644<br>
--- a/backends/hostmem-memfd.c<br>
+++ b/backends/hostmem-memfd.c<br>
@@ -55,7 +55,7 @@ memfd_backend_memory_alloc(HostMemoryBackend *backend, Er=
ror **errp)<br>
=C2=A0 =C2=A0 =C2=A0name =3D host_memory_backend_get_name(backend);<br>
=C2=A0 =C2=A0 =C2=A0memory_region_init_ram_from_fd(&amp;backend-&gt;mr, OBJ=
ECT(backend),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name, backend-&gt;size=
,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0backend-&gt;share, fd, =
errp);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0backend-&gt;share, fd, =
0, errp);<br>
=C2=A0 =C2=A0 =C2=A0g_free(name);<br>
=C2=A0}<br>
<br>
diff --git a/hw/misc/ivshmem.c b/hw/misc/ivshmem.c<br>
index e321e5c..8d3e1ee 100644<br>
--- a/hw/misc/ivshmem.c<br>
+++ b/hw/misc/ivshmem.c<br>
@@ -494,7 +494,8 @@ static void process_msg_shmem(IVShmemState *s, int fd, =
Error **errp)<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* mmap the region and map into the BAR2 */<br>
=C2=A0 =C2=A0 =C2=A0memory_region_init_ram_from_fd(&amp;s-&gt;server_bar2, =
OBJECT(s),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;ivshmem.bar2&quot=
;, size, true, fd, &amp;local_err);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;ivshmem.bar2&quot=
;, size, true, fd, 0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;local_err);<br>
=C2=A0 =C2=A0 =C2=A0if (local_err) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_propagate(errp, local_err);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
diff --git a/softmmu/memory.c b/softmmu/memory.c<br>
index 11ca94d..e4ed0e4 100644<br>
--- a/softmmu/memory.c<br>
+++ b/softmmu/memory.c<br>
@@ -1612,6 +1612,7 @@ void memory_region_init_ram_from_fd(MemoryRegion *mr,=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t size,<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool share,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int fd,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ram_addr_t offset,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Error **errp)<br=
>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0Error *err =3D NULL;<br>
@@ -1621,7 +1622,7 @@ void memory_region_init_ram_from_fd(MemoryRegion *mr,=
<br>
=C2=A0 =C2=A0 =C2=A0mr-&gt;destructor =3D memory_region_destructor_ram;<br>
=C2=A0 =C2=A0 =C2=A0mr-&gt;ram_block =3D qemu_ram_alloc_from_fd(size, mr,<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 share ? RAM_SHARED : 0,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0fd, &amp;err);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0fd, offset, &amp;err);<br>
=C2=A0 =C2=A0 =C2=A0mr-&gt;dirty_log_mask =3D tcg_enabled() ? (1 &lt;&lt; D=
IRTY_MEMORY_CODE) : 0;<br>
=C2=A0 =C2=A0 =C2=A0if (err) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mr-&gt;size =3D int128_zero();<br>
diff --git a/softmmu/physmem.c b/softmmu/physmem.c<br>
index 3027747..e0b8fc6 100644<br>
--- a/softmmu/physmem.c<br>
+++ b/softmmu/physmem.c<br>
@@ -1461,6 +1461,7 @@ static void *file_ram_alloc(RAMBlock *block,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ram_addr_t memory,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int fd,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool truncate,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 off_t offset,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Error **errp)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0void *area;<br>
@@ -1511,7 +1512,8 @@ static void *file_ram_alloc(RAMBlock *block,<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0area =3D qemu_ram_mmap(fd, memory, block-&gt;mr-&gt;ali=
gn,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0block-&gt;flags &amp; RAM_SHARED, block-&gt;flags &amp; RA=
M_PMEM);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0block-&gt;flags &amp; RAM_SHARED, block-&gt;flags &amp; RA=
M_PMEM,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0offset);<br>
=C2=A0 =C2=A0 =C2=A0if (area =3D=3D MAP_FAILED) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg_errno(errp, errno,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;unable to map backing store for guest RAM&quot;);<b=
r>
@@ -1943,7 +1945,7 @@ static void ram_block_add(RAMBlock *new_block, Error =
**errp, bool shared)<br>
=C2=A0#ifdef CONFIG_POSIX<br>
=C2=A0RAMBlock *qemu_ram_alloc_from_fd(ram_addr_t size, MemoryRegion *mr,<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t ram_flags, int fd,<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Error **errp)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0off_t offset, Error **errp)<br=
>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0RAMBlock *new_block;<br>
=C2=A0 =C2=A0 =C2=A0Error *local_err =3D NULL;<br>
@@ -1996,7 +1998,8 @@ RAMBlock *qemu_ram_alloc_from_fd(ram_addr_t size, Mem=
oryRegion *mr,<br>
=C2=A0 =C2=A0 =C2=A0new_block-&gt;used_length =3D size;<br>
=C2=A0 =C2=A0 =C2=A0new_block-&gt;max_length =3D size;<br>
=C2=A0 =C2=A0 =C2=A0new_block-&gt;flags =3D ram_flags;<br>
-=C2=A0 =C2=A0 new_block-&gt;host =3D file_ram_alloc(new_block, size, fd, !=
file_size, errp);<br>
+=C2=A0 =C2=A0 new_block-&gt;host =3D file_ram_alloc(new_block, size, fd, !=
file_size, offset,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0errp);<br>
=C2=A0 =C2=A0 =C2=A0if (!new_block-&gt;host) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_free(new_block);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
@@ -2026,7 +2029,7 @@ RAMBlock *qemu_ram_alloc_from_file(ram_addr_t size, M=
emoryRegion *mr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 block =3D qemu_ram_alloc_from_fd(size, mr, ram_flags, fd, er=
rp);<br>
+=C2=A0 =C2=A0 block =3D qemu_ram_alloc_from_fd(size, mr, ram_flags, fd, 0,=
 errp);<br>
=C2=A0 =C2=A0 =C2=A0if (!block) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (created) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unlink(mem_path);<br>
diff --git a/util/mmap-alloc.c b/util/mmap-alloc.c<br>
index 27dcccd..a28f702 100644<br>
--- a/util/mmap-alloc.c<br>
+++ b/util/mmap-alloc.c<br>
@@ -86,7 +86,8 @@ void *qemu_ram_mmap(int fd,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0size_t size,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0size_t align,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0bool shared,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bool=
 is_pmem)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bool=
 is_pmem,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 off_=
t start)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0int flags;<br>
=C2=A0 =C2=A0 =C2=A0int map_sync_flags =3D 0;<br>
@@ -147,7 +148,7 @@ void *qemu_ram_mmap(int fd,<br>
=C2=A0 =C2=A0 =C2=A0offset =3D QEMU_ALIGN_UP((uintptr_t)guardptr, align) - =
(uintptr_t)guardptr;<br>
<br>
=C2=A0 =C2=A0 =C2=A0ptr =3D mmap(guardptr + offset, size, PROT_READ | PROT_=
WRITE,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0flags | map_sync_fl=
ags, fd, 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0flags | map_sync_fl=
ags, fd, start);<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (ptr =3D=3D MAP_FAILED &amp;&amp; map_sync_flags) {<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (errno =3D=3D ENOTSUP) {<br>
@@ -172,7 +173,7 @@ void *qemu_ram_mmap(int fd,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * we will remove these flags to handle c=
ompatibility.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ptr =3D mmap(guardptr + offset, size, PRO=
T_READ | PROT_WRITE,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0flags=
, fd, 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0flags=
, fd, start);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (ptr =3D=3D MAP_FAILED) {<br>
diff --git a/util/oslib-posix.c b/util/oslib-posix.c<br>
index f15234b..93874df 100644<br>
--- a/util/oslib-posix.c<br>
+++ b/util/oslib-posix.c<br>
@@ -227,7 +227,7 @@ void *qemu_memalign(size_t alignment, size_t size)<br>
=C2=A0void *qemu_anon_ram_alloc(size_t size, uint64_t *alignment, bool shar=
ed)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0size_t align =3D QEMU_VMALLOC_ALIGN;<br>
-=C2=A0 =C2=A0 void *ptr =3D qemu_ram_mmap(-1, size, align, shared, false);=
<br>
+=C2=A0 =C2=A0 void *ptr =3D qemu_ram_mmap(-1, size, align, shared, false, =
0);<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (ptr =3D=3D MAP_FAILED) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
-- <br>
1.8.3.1<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000007f663005b5a415f6--

