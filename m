Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E830E3C1518
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 16:23:01 +0200 (CEST)
Received: from localhost ([::1]:49920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Uvc-0004iQ-OW
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 10:23:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1m1Ut2-0008Sv-ET
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 10:20:20 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:35457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1m1Usv-0005Bm-HF
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 10:20:20 -0400
Received: by mail-ej1-x62d.google.com with SMTP id gn32so9962586ejc.2
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 07:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fQZ7Ejf1cUg/npWJpKY5lpVQ7qjsGx2F6cpRE9iytHk=;
 b=azaXyoHEMbZWScaD9UpfgDkfnhmlZ1UzhAIlbMIsOaxtg0YgFwwchhH5hW52E5c9Or
 P4Vzg0Rkdozn6l0u+ibUOV14SzMsHTUFd54JIhJM7Sqtbloc9uP6nvYPzzZytfz3vwTJ
 MljBnKHW1eIc01f5HdE+tdRJfIaEXLC5+Y/VQK38072rIBDCG8Oa9xCUW3LVOxQ8SEDh
 8022fqccyTUGJpuOTy5Os9gP0Tk6NxA0yBFmGgSDKCSfoC6yJ7Pf01iJsCPcDuYz9xrP
 vVCcdW7zXDnDCcywvD1LvAMERB+KyZHpqbM49gz2XYMkBKOtrqOzh/gNBilpUImSoJ7Q
 BYJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fQZ7Ejf1cUg/npWJpKY5lpVQ7qjsGx2F6cpRE9iytHk=;
 b=q/kEFISj3qzJ0RkrnC0CRy1MfuE+c4ZDLDT5wYBRvvGz+eVlTJhKLDQsgu2BkUItqx
 Q682k0JQ7yKOFHrrsNoYVeoFxbkrIxPh8iIkHAvr2kmWgFU61RqL+5+k1YsHlq3oBNRj
 atX2IDRlvO65ECfvMTk32Fy60fBZQpbKH3ZSve7xVBQpkUfcTF29Pkvna1upCrXMK+3p
 lD4A14ApP5DLmrPkBAJQzeryMG1gK5HSZZdA2jl8A7yWODfCI8jXgYTmLPn+r1MLwQcV
 jWccoOgvymNwntFcOU7f1tS7TfswRKHi6o4Tnbc9mW2acReVMErNKTzJn3ZpOlX8wYuk
 Yivw==
X-Gm-Message-State: AOAM533CaygsAbRLasq8aojavy6caNxmn929zYnF6IZ78OvBghJq/dgn
 mb+C77NJmx/5Hpx9zRPvSCL3uIdBHrZwX/E5tuw=
X-Google-Smtp-Source: ABdhPJxNEpW3SaqzRUHkCGPiTqZ45nRcmtZaj/KdQcBVm5QMUj8CUbeD9y8puX3rucZcc/TM3QOGnbjs04TroQI2x7w=
X-Received: by 2002:a17:906:4fd6:: with SMTP id
 i22mr17839047ejw.92.1625754012054; 
 Thu, 08 Jul 2021 07:20:12 -0700 (PDT)
MIME-Version: 1.0
References: <1625678434-240960-1-git-send-email-steven.sistare@oracle.com>
 <1625678434-240960-8-git-send-email-steven.sistare@oracle.com>
In-Reply-To: <1625678434-240960-8-git-send-email-steven.sistare@oracle.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 8 Jul 2021 18:20:00 +0400
Message-ID: <CAJ+F1CJFV8G+7sR0BLKODypcMeuV-O2Ox+S-jK0sRiRceevFXw@mail.gmail.com>
Subject: Re: [PATCH V5 07/25] machine: memfd-alloc option
To: Steve Sistare <steven.sistare@oracle.com>
Content-Type: multipart/alternative; boundary="00000000000061792105c69d5a13"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x62d.google.com
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
Cc: Jason Zeng <jason.zeng@linux.intel.com>,
 Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000061792105c69d5a13
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Jul 7, 2021 at 9:39 PM Steve Sistare <steven.sistare@oracle.com>
wrote:

> Allocate anonymous memory using memfd_create if the memfd-alloc machine
> option is set.
>

Nice, I'd suggest you send this patch separately. (we had discussions about
an option like this several times)


> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> ---
>  hw/core/machine.c   | 19 +++++++++++++++++++
>  include/hw/boards.h |  1 +
>  qemu-options.hx     |  5 +++++
>  softmmu/physmem.c   | 42 +++++++++++++++++++++++++++++++++---------
>  trace-events        |  1 +
>  util/qemu-config.c  |  4 ++++
>  6 files changed, 63 insertions(+), 9 deletions(-)
>
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 57c18f9..f0656a8 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -383,6 +383,20 @@ static void machine_set_mem_merge(Object *obj, bool
> value, Error **errp)
>      ms->mem_merge =3D value;
>  }
>
> +static bool machine_get_memfd_alloc(Object *obj, Error **errp)
> +{
> +    MachineState *ms =3D MACHINE(obj);
> +
> +    return ms->memfd_alloc;
> +}
> +
> +static void machine_set_memfd_alloc(Object *obj, bool value, Error **err=
p)
> +{
> +    MachineState *ms =3D MACHINE(obj);
> +
> +    ms->memfd_alloc =3D value;
> +}
> +
>  static bool machine_get_usb(Object *obj, Error **errp)
>  {
>      MachineState *ms =3D MACHINE(obj);
> @@ -917,6 +931,11 @@ static void machine_class_init(ObjectClass *oc, void
> *data)
>      object_class_property_set_description(oc, "mem-merge",
>          "Enable/disable memory merge support");
>
> +    object_class_property_add_bool(oc, "memfd-alloc",
> +        machine_get_memfd_alloc, machine_set_memfd_alloc);
> +    object_class_property_set_description(oc, "memfd-alloc",
> +        "Enable/disable allocating anonymous memory using memfd_create")=
;
> +
>      object_class_property_add_bool(oc, "usb",
>          machine_get_usb, machine_set_usb);
>      object_class_property_set_description(oc, "usb",
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index accd6ef..299e1ca 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -305,6 +305,7 @@ struct MachineState {
>      char *dt_compatible;
>      bool dump_guest_core;
>      bool mem_merge;
> +    bool memfd_alloc;
>      bool usb;
>      bool usb_disabled;
>      char *firmware;
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 8965dab..fa53734 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -30,6 +30,7 @@ DEF("machine", HAS_ARG, QEMU_OPTION_machine, \
>      "                vmport=3Don|off|auto controls emulation of vmport
> (default: auto)\n"
>      "                dump-guest-core=3Don|off include guest memory in a
> core dump (default=3Don)\n"
>      "                mem-merge=3Don|off controls memory merge support
> (default: on)\n"
> +    "                memfd-alloc=3Don|off controls allocating anonymous
> memory using memfd_create (default: off)\n"
>      "                aes-key-wrap=3Don|off controls support for AES key
> wrapping (default=3Don)\n"
>      "                dea-key-wrap=3Don|off controls support for DEA key
> wrapping (default=3Don)\n"
>      "                suppress-vmdesc=3Don|off disables self-describing
> migration (default=3Doff)\n"
> @@ -76,6 +77,10 @@ SRST
>          supported by the host, de-duplicates identical memory pages
>          among VMs instances (enabled by default).
>
> +    ``memfd-alloc=3Don|off``
> +        Enables or disables allocation of anonymous memory using
> memfd_create.
> +        (disabled by default).
> +
>      ``aes-key-wrap=3Don|off``
>          Enables or disables AES key wrapping support on s390-ccw hosts.
>          This feature controls whether AES wrapping keys will be created
> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index 9b171c9..b149250 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -64,6 +64,7 @@
>
>  #include "qemu/pmem.h"
>
> +#include "qemu/memfd.h"
>  #include "migration/vmstate.h"
>
>  #include "qemu/range.h"
> @@ -1960,35 +1961,58 @@ static void ram_block_add(RAMBlock *new_block,
> Error **errp)
>      const bool shared =3D qemu_ram_is_shared(new_block);
>      RAMBlock *block;
>      RAMBlock *last_block =3D NULL;
> +    struct MemoryRegion *mr =3D new_block->mr;
>      ram_addr_t old_ram_size, new_ram_size;
>      Error *err =3D NULL;
> +    const char *name;
> +    void *addr =3D 0;
> +    size_t maxlen;
> +    MachineState *ms =3D MACHINE(qdev_get_machine());
>
>      old_ram_size =3D last_ram_page();
>
>      qemu_mutex_lock_ramlist();
> -    new_block->offset =3D find_ram_offset(new_block->max_length);
> +    maxlen =3D new_block->max_length;
> +    new_block->offset =3D find_ram_offset(maxlen);
>
>      if (!new_block->host) {
>          if (xen_enabled()) {
> -            xen_ram_alloc(new_block->offset, new_block->max_length,
> -                          new_block->mr, &err);
> +            xen_ram_alloc(new_block->offset, maxlen, new_block->mr, &err=
);
>              if (err) {
>                  error_propagate(errp, err);
>                  qemu_mutex_unlock_ramlist();
>                  return;
>              }
>          } else {
> -            new_block->host =3D qemu_anon_ram_alloc(new_block->max_lengt=
h,
> -                                                  &new_block->mr->align,
> -                                                  shared, noreserve);
> -            if (!new_block->host) {
> +            name =3D memory_region_name(new_block->mr);
> +            if (ms->memfd_alloc) {
> +                int mfd =3D -1;          /* placeholder until next patch=
 */
> +                mr->align =3D QEMU_VMALLOC_ALIGN;
> +                if (mfd < 0) {
> +                    mfd =3D qemu_memfd_create(name, maxlen + mr->align,
> +                                            0, 0, 0, &err);
> +                    if (mfd < 0) {
> +                        return;
> +                    }
> +                }
> +                new_block->flags |=3D RAM_SHARED;
>

I wonder if ram_backend_memory_alloc() shouldn't be updated to reflect that
the memory backend is "share" =3D true. And I would say so in the doc as we=
ll.


+                addr =3D file_ram_alloc(new_block, maxlen, mfd,
> +                                      false, false, 0, errp);
> +                trace_anon_memfd_alloc(name, maxlen, addr, mfd);
> +            } else {
> +                addr =3D qemu_anon_ram_alloc(maxlen, &mr->align,
> +                                           shared, noreserve);
> +            }
> +
> +            if (!addr) {
>                  error_setg_errno(errp, errno,
>                                   "cannot set up guest memory '%s'",
> -                                 memory_region_name(new_block->mr));
> +                                 name);
>                  qemu_mutex_unlock_ramlist();
>                  return;
>              }
> -            memory_try_enable_merging(new_block->host,
> new_block->max_length);
> +            memory_try_enable_merging(addr, maxlen);
> +            new_block->host =3D addr;
>          }
>      }
>
> diff --git a/trace-events b/trace-events
> index 765fe25..6dbcd0e 100644
> --- a/trace-events
> +++ b/trace-events
> @@ -40,6 +40,7 @@ ram_block_discard_range(const char *rbname, void *hva,
> size_t length, bool need_
>  # accel/tcg/cputlb.c
>  memory_notdirty_write_access(uint64_t vaddr, uint64_t ram_addr, unsigned
> size) "0x%" PRIx64 " ram_addr 0x%" PRIx64 " size %u"
>  memory_notdirty_set_dirty(uint64_t vaddr) "0x%" PRIx64
> +anon_memfd_alloc(const char *name, size_t size, void *ptr, int fd) "%s
> size %zu ptr %p fd %d"
>
>  # gdbstub.c
>  gdbstub_op_start(const char *device) "Starting gdbstub using device %s"
> diff --git a/util/qemu-config.c b/util/qemu-config.c
> index 84ee6dc..6162b4d 100644
> --- a/util/qemu-config.c
> +++ b/util/qemu-config.c
> @@ -207,6 +207,10 @@ static QemuOptsList machine_opts =3D {
>              .type =3D QEMU_OPT_BOOL,
>              .help =3D "enable/disable memory merge support",
>          },{
> +            .name =3D "memfd-alloc",
> +            .type =3D QEMU_OPT_BOOL,
> +            .help =3D "enable/disable memfd_create for anonymous memory"=
,
> +        },{
>              .name =3D "usb",
>              .type =3D QEMU_OPT_BOOL,
>              .help =3D "Set on/off to enable/disable usb",
> --
> 1.8.3.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000061792105c69d5a13
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 7, 2021 at 9:39 PM Stev=
e Sistare &lt;<a href=3D"mailto:steven.sistare@oracle.com">steven.sistare@o=
racle.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Allocate anonymous memory using memfd_create if the memfd-alloc =
machine<br>
option is set.<br></blockquote><div><br></div><div>Nice, I&#39;d suggest yo=
u send this patch separately. (we had discussions about an option like this=
 several times)<br></div><div> <br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
<br>
Signed-off-by: Steve Sistare &lt;<a href=3D"mailto:steven.sistare@oracle.co=
m" target=3D"_blank">steven.sistare@oracle.com</a>&gt;<br>
---<br>
=C2=A0hw/core/machine.c=C2=A0 =C2=A0| 19 +++++++++++++++++++<br>
=C2=A0include/hw/boards.h |=C2=A0 1 +<br>
=C2=A0qemu-options.hx=C2=A0 =C2=A0 =C2=A0|=C2=A0 5 +++++<br>
=C2=A0softmmu/physmem.c=C2=A0 =C2=A0| 42 +++++++++++++++++++++++++++++++++-=
--------<br>
=C2=A0trace-events=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
=C2=A0util/qemu-config.c=C2=A0 |=C2=A0 4 ++++<br>
=C2=A06 files changed, 63 insertions(+), 9 deletions(-)<br>
<br>
diff --git a/hw/core/machine.c b/hw/core/machine.c<br>
index 57c18f9..f0656a8 100644<br>
--- a/hw/core/machine.c<br>
+++ b/hw/core/machine.c<br>
@@ -383,6 +383,20 @@ static void machine_set_mem_merge(Object *obj, bool va=
lue, Error **errp)<br>
=C2=A0 =C2=A0 =C2=A0ms-&gt;mem_merge =3D value;<br>
=C2=A0}<br>
<br>
+static bool machine_get_memfd_alloc(Object *obj, Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 MachineState *ms =3D MACHINE(obj);<br>
+<br>
+=C2=A0 =C2=A0 return ms-&gt;memfd_alloc;<br>
+}<br>
+<br>
+static void machine_set_memfd_alloc(Object *obj, bool value, Error **errp)=
<br>
+{<br>
+=C2=A0 =C2=A0 MachineState *ms =3D MACHINE(obj);<br>
+<br>
+=C2=A0 =C2=A0 ms-&gt;memfd_alloc =3D value;<br>
+}<br>
+<br>
=C2=A0static bool machine_get_usb(Object *obj, Error **errp)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0MachineState *ms =3D MACHINE(obj);<br>
@@ -917,6 +931,11 @@ static void machine_class_init(ObjectClass *oc, void *=
data)<br>
=C2=A0 =C2=A0 =C2=A0object_class_property_set_description(oc, &quot;mem-mer=
ge&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Enable/disable memory merge support=
&quot;);<br>
<br>
+=C2=A0 =C2=A0 object_class_property_add_bool(oc, &quot;memfd-alloc&quot;,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 machine_get_memfd_alloc, machine_set_memfd_all=
oc);<br>
+=C2=A0 =C2=A0 object_class_property_set_description(oc, &quot;memfd-alloc&=
quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Enable/disable allocating anonymous memo=
ry using memfd_create&quot;);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0object_class_property_add_bool(oc, &quot;usb&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0machine_get_usb, machine_set_usb);<br>
=C2=A0 =C2=A0 =C2=A0object_class_property_set_description(oc, &quot;usb&quo=
t;,<br>
diff --git a/include/hw/boards.h b/include/hw/boards.h<br>
index accd6ef..299e1ca 100644<br>
--- a/include/hw/boards.h<br>
+++ b/include/hw/boards.h<br>
@@ -305,6 +305,7 @@ struct MachineState {<br>
=C2=A0 =C2=A0 =C2=A0char *dt_compatible;<br>
=C2=A0 =C2=A0 =C2=A0bool dump_guest_core;<br>
=C2=A0 =C2=A0 =C2=A0bool mem_merge;<br>
+=C2=A0 =C2=A0 bool memfd_alloc;<br>
=C2=A0 =C2=A0 =C2=A0bool usb;<br>
=C2=A0 =C2=A0 =C2=A0bool usb_disabled;<br>
=C2=A0 =C2=A0 =C2=A0char *firmware;<br>
diff --git a/qemu-options.hx b/qemu-options.hx<br>
index 8965dab..fa53734 100644<br>
--- a/qemu-options.hx<br>
+++ b/qemu-options.hx<br>
@@ -30,6 +30,7 @@ DEF(&quot;machine&quot;, HAS_ARG, QEMU_OPTION_machine, \<=
br>
=C2=A0 =C2=A0 =C2=A0&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 vmport=3Don|off|auto controls emulation of vmport (default: auto)\n&=
quot;<br>
=C2=A0 =C2=A0 =C2=A0&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 dump-guest-core=3Don|off include guest memory in a core dump (defaul=
t=3Don)\n&quot;<br>
=C2=A0 =C2=A0 =C2=A0&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 mem-merge=3Don|off controls memory merge support (default: on)\n&quo=
t;<br>
+=C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 memfd-alloc=3Don|off controls allocating anonymous memory using memfd_c=
reate (default: off)\n&quot;<br>
=C2=A0 =C2=A0 =C2=A0&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 aes-key-wrap=3Don|off controls support for AES key wrapping (default=
=3Don)\n&quot;<br>
=C2=A0 =C2=A0 =C2=A0&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 dea-key-wrap=3Don|off controls support for DEA key wrapping (default=
=3Don)\n&quot;<br>
=C2=A0 =C2=A0 =C2=A0&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 suppress-vmdesc=3Don|off disables self-describing migration (default=
=3Doff)\n&quot;<br>
@@ -76,6 +77,10 @@ SRST<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0supported by the host, de-duplicates iden=
tical memory pages<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0among VMs instances (enabled by default).=
<br>
<br>
+=C2=A0 =C2=A0 ``memfd-alloc=3Don|off``<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Enables or disables allocation of anonymous me=
mory using memfd_create.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (disabled by default).<br>
+<br>
=C2=A0 =C2=A0 =C2=A0``aes-key-wrap=3Don|off``<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Enables or disables AES key wrapping supp=
ort on s390-ccw hosts.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This feature controls whether AES wrappin=
g keys will be created<br>
diff --git a/softmmu/physmem.c b/softmmu/physmem.c<br>
index 9b171c9..b149250 100644<br>
--- a/softmmu/physmem.c<br>
+++ b/softmmu/physmem.c<br>
@@ -64,6 +64,7 @@<br>
<br>
=C2=A0#include &quot;qemu/pmem.h&quot;<br>
<br>
+#include &quot;qemu/memfd.h&quot;<br>
=C2=A0#include &quot;migration/vmstate.h&quot;<br>
<br>
=C2=A0#include &quot;qemu/range.h&quot;<br>
@@ -1960,35 +1961,58 @@ static void ram_block_add(RAMBlock *new_block, Erro=
r **errp)<br>
=C2=A0 =C2=A0 =C2=A0const bool shared =3D qemu_ram_is_shared(new_block);<br=
>
=C2=A0 =C2=A0 =C2=A0RAMBlock *block;<br>
=C2=A0 =C2=A0 =C2=A0RAMBlock *last_block =3D NULL;<br>
+=C2=A0 =C2=A0 struct MemoryRegion *mr =3D new_block-&gt;mr;<br>
=C2=A0 =C2=A0 =C2=A0ram_addr_t old_ram_size, new_ram_size;<br>
=C2=A0 =C2=A0 =C2=A0Error *err =3D NULL;<br>
+=C2=A0 =C2=A0 const char *name;<br>
+=C2=A0 =C2=A0 void *addr =3D 0;<br>
+=C2=A0 =C2=A0 size_t maxlen;<br>
+=C2=A0 =C2=A0 MachineState *ms =3D MACHINE(qdev_get_machine());<br>
<br>
=C2=A0 =C2=A0 =C2=A0old_ram_size =3D last_ram_page();<br>
<br>
=C2=A0 =C2=A0 =C2=A0qemu_mutex_lock_ramlist();<br>
-=C2=A0 =C2=A0 new_block-&gt;offset =3D find_ram_offset(new_block-&gt;max_l=
ength);<br>
+=C2=A0 =C2=A0 maxlen =3D new_block-&gt;max_length;<br>
+=C2=A0 =C2=A0 new_block-&gt;offset =3D find_ram_offset(maxlen);<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (!new_block-&gt;host) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (xen_enabled()) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xen_ram_alloc(new_block-&gt;offs=
et, new_block-&gt;max_length,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 new_block-&gt;mr, &amp;err);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xen_ram_alloc(new_block-&gt;offs=
et, maxlen, new_block-&gt;mr, &amp;err);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (err) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_propaga=
te(errp, err);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_mutex_un=
lock_ramlist();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new_block-&gt;host =3D qemu_anon=
_ram_alloc(new_block-&gt;max_length,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;new_block-&gt;mr-&gt;align,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 shared, noreserve);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!new_block-&gt;host) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name =3D memory_region_name(new_=
block-&gt;mr);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ms-&gt;memfd_alloc) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int mfd =3D -1;=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* placeholder until next patch */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mr-&gt;align =3D Q=
EMU_VMALLOC_ALIGN;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (mfd &lt; 0) {<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mfd =
=3D qemu_memfd_create(name, maxlen + mr-&gt;align,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 0, 0, 0, &amp;err);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (=
mfd &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new_block-&gt;flag=
s |=3D RAM_SHARED;<br></blockquote><div><br></div><div>I wonder if ram_back=
end_memory_alloc() shouldn&#39;t be updated to reflect that the memory back=
end is &quot;share&quot; =3D true. And I would say so in the doc as well.</=
div><div><br></div><div><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 addr =3D file_ram_=
alloc(new_block, maxlen, mfd,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 false, false, 0=
, errp);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 trace_anon_memfd_a=
lloc(name, maxlen, addr, mfd);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 addr =3D qemu_anon=
_ram_alloc(maxlen, &amp;mr-&gt;align,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0shared, noreserve);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!addr) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg_er=
rno(errp, errno,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;cannot set up guest mem=
ory &#39;%s&#39;&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memory_region_name(new_block-&=
gt;mr));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0name);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_mutex_un=
lock_ramlist();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 memory_try_enable_merging(new_bl=
ock-&gt;host, new_block-&gt;max_length);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 memory_try_enable_merging(addr, =
maxlen);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new_block-&gt;host =3D addr;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
diff --git a/trace-events b/trace-events<br>
index 765fe25..6dbcd0e 100644<br>
--- a/trace-events<br>
+++ b/trace-events<br>
@@ -40,6 +40,7 @@ ram_block_discard_range(const char *rbname, void *hva, si=
ze_t length, bool need_<br>
=C2=A0# accel/tcg/cputlb.c<br>
=C2=A0memory_notdirty_write_access(uint64_t vaddr, uint64_t ram_addr, unsig=
ned size) &quot;0x%&quot; PRIx64 &quot; ram_addr 0x%&quot; PRIx64 &quot; si=
ze %u&quot;<br>
=C2=A0memory_notdirty_set_dirty(uint64_t vaddr) &quot;0x%&quot; PRIx64<br>
+anon_memfd_alloc(const char *name, size_t size, void *ptr, int fd) &quot;%=
s size %zu ptr %p fd %d&quot;<br>
<br>
=C2=A0# gdbstub.c<br>
=C2=A0gdbstub_op_start(const char *device) &quot;Starting gdbstub using dev=
ice %s&quot;<br>
diff --git a/util/qemu-config.c b/util/qemu-config.c<br>
index 84ee6dc..6162b4d 100644<br>
--- a/util/qemu-config.c<br>
+++ b/util/qemu-config.c<br>
@@ -207,6 +207,10 @@ static QemuOptsList machine_opts =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.type =3D QEMU_OPT_BOOL,<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.help =3D &quot;enable/disa=
ble memory merge support&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =3D &quot;memfd-alloc&quot=
;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .type =3D QEMU_OPT_BOOL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .help =3D &quot;enable/disable m=
emfd_create for anonymous memory&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 },{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D &quot;usb&quot;,<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.type =3D QEMU_OPT_BOOL,<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.help =3D &quot;Set on/off =
to enable/disable usb&quot;,<br>
-- <br>
1.8.3.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000061792105c69d5a13--

