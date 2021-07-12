Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 685ED3C6232
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 19:48:10 +0200 (CEST)
Received: from localhost ([::1]:59662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m302L-0004wF-FZ
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 13:48:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1m2zzn-0003Bc-0Y
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 13:45:31 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:37565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1m2zzj-0000OF-FC
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 13:45:30 -0400
Received: by mail-ej1-x629.google.com with SMTP id i20so36179247ejw.4
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 10:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eu0q2SE6wuLhNqPiXSYxzzAv90jSrKQic9zo4SJqFrc=;
 b=P+1ZaH1RDobCxPZaau2H2x7ZAex7G/RfLCzznKuR/yYLMxN04qTzj1CZ+lsLnzjQuK
 A4re3k1Q2pPjAA12VNbRrbOcG8raT8+ZCBYhUAA9MwE4f6JUrRjY8xAB8bWY4pjBw0bo
 0xkzRsCc2nYM0tTwuwb7S6IFbTTTefX0IbH+Y+ceouWIWk4jSJKVVLp/zu9q50wKfkHp
 r29MWgW7Vg9aEYKs69jOGLbkkRQtP1cPkA8HPeXxrNNAGFuKtIGg7VUVNOZIyNanXYK9
 rH91roz7tSnWyJtivunlWoAmgmZORioo8HUudP2tZbckXN3qMu29uf0k3UfbvA98qzcM
 Wf4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eu0q2SE6wuLhNqPiXSYxzzAv90jSrKQic9zo4SJqFrc=;
 b=DxLFMasS2vJWM8UeaLh7Ygk2st3KoGiNXhxjUup8L+oS9FXAgRtRZU18qaVkTe1WEn
 PHBs5FdIHVEGbEmGy5jWHYIwBFkPPtJETiVogAaWF02pBggpvnKdFTLdxJGmxSSScFee
 gfwIN/gvSxNDoSlbbgQtSZ/JNRY7nKx/HyMkj9GTglL3FYGaiDku5c0uoPBtPFibOeGb
 mCOQMW2XgmSV8ubgrY5NZ4PS0Cgkkvr/C85yHinTi5c+Dcs5J0boSVpLF+5SQiSY/jlY
 bXVqZquj4rdLQtB5P19/Mchrd82/dkjlVMOdj0tkiRs4L/XOT9WeGs3tFpCHYMBSbIHY
 87BQ==
X-Gm-Message-State: AOAM531M4et+MjakB/YXxZrrz71OYIoYSspYHMTzbGh4ISFvM6qBbEMa
 OAIMWJ/q0PJOfQk9MyC2BdFVPNDeIaUwKKyLWjM=
X-Google-Smtp-Source: ABdhPJyAGcfbKIo386nnaiFNkGuo0puHmvbECqc8HOtXSXyCIFedDU/pyd+1UBYUFyvLFJ2MOMPV6F04VzIbHiR1hy4=
X-Received: by 2002:a17:906:f751:: with SMTP id
 jp17mr261651ejb.105.1626111922182; 
 Mon, 12 Jul 2021 10:45:22 -0700 (PDT)
MIME-Version: 1.0
References: <1625678434-240960-1-git-send-email-steven.sistare@oracle.com>
 <1625678434-240960-8-git-send-email-steven.sistare@oracle.com>
 <CAJ+F1CJFV8G+7sR0BLKODypcMeuV-O2Ox+S-jK0sRiRceevFXw@mail.gmail.com>
 <5567f7de-b0dc-053e-6000-3b12ac10a480@oracle.com>
In-Reply-To: <5567f7de-b0dc-053e-6000-3b12ac10a480@oracle.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 12 Jul 2021 21:45:09 +0400
Message-ID: <CAJ+F1C+ntiovYfV1a4cHYU17mXAQmd2G+Xcivpd4yq0HpK4Vbg@mail.gmail.com>
Subject: Re: [PATCH V5 07/25] machine: memfd-alloc option
To: Steven Sistare <steven.sistare@oracle.com>
Content-Type: multipart/alternative; boundary="0000000000007c9ec505c6f0af1c"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x629.google.com
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

--0000000000007c9ec505c6f0af1c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, Jul 12, 2021 at 9:07 PM Steven Sistare <steven.sistare@oracle.com>
wrote:

> On 7/8/2021 10:20 AM, Marc-Andr=C3=A9 Lureau wrote:
> > Hi
> >
> > On Wed, Jul 7, 2021 at 9:39 PM Steve Sistare <steven.sistare@oracle.com
> <mailto:steven.sistare@oracle.com>> wrote:
> >
> >     Allocate anonymous memory using memfd_create if the memfd-alloc
> machine
> >     option is set.
> >
> >
> > Nice, I'd suggest you send this patch separately. (we had discussions
> about an option like this several times)
>
> I would like to keep it with this series to make sure it meets our needs
> as the patches are
> reviewed and evolve.  We can always push it solo later if the series
> stalls.
>
> >     Signed-off-by: Steve Sistare <steven.sistare@oracle.com <mailto:
> steven.sistare@oracle.com>>
> >     ---
> >      hw/core/machine.c   | 19 +++++++++++++++++++
> >      include/hw/boards.h |  1 +
> >      qemu-options.hx     |  5 +++++
> >      softmmu/physmem.c   | 42 +++++++++++++++++++++++++++++++++--------=
-
> >      trace-events        |  1 +
> >      util/qemu-config.c  |  4 ++++
> >      6 files changed, 63 insertions(+), 9 deletions(-)
> >
> >     diff --git a/hw/core/machine.c b/hw/core/machine.c
> >     index 57c18f9..f0656a8 100644
> >     --- a/hw/core/machine.c
> >     +++ b/hw/core/machine.c
> >     @@ -383,6 +383,20 @@ static void machine_set_mem_merge(Object *obj,
> bool value, Error **errp)
> >          ms->mem_merge =3D value;
> >      }
> >
> >     +static bool machine_get_memfd_alloc(Object *obj, Error **errp)
> >     +{
> >     +    MachineState *ms =3D MACHINE(obj);
> >     +
> >     +    return ms->memfd_alloc;
> >     +}
> >     +
> >     +static void machine_set_memfd_alloc(Object *obj, bool value, Error
> **errp)
> >     +{
> >     +    MachineState *ms =3D MACHINE(obj);
> >     +
> >     +    ms->memfd_alloc =3D value;
> >     +}
> >     +
> >      static bool machine_get_usb(Object *obj, Error **errp)
> >      {
> >          MachineState *ms =3D MACHINE(obj);
> >     @@ -917,6 +931,11 @@ static void machine_class_init(ObjectClass *oc=
,
> void *data)
> >          object_class_property_set_description(oc, "mem-merge",
> >              "Enable/disable memory merge support");
> >
> >     +    object_class_property_add_bool(oc, "memfd-alloc",
> >     +        machine_get_memfd_alloc, machine_set_memfd_alloc);
> >     +    object_class_property_set_description(oc, "memfd-alloc",
> >     +        "Enable/disable allocating anonymous memory using
> memfd_create");
> >     +
> >          object_class_property_add_bool(oc, "usb",
> >              machine_get_usb, machine_set_usb);
> >          object_class_property_set_description(oc, "usb",
> >     diff --git a/include/hw/boards.h b/include/hw/boards.h
> >     index accd6ef..299e1ca 100644
> >     --- a/include/hw/boards.h
> >     +++ b/include/hw/boards.h
> >     @@ -305,6 +305,7 @@ struct MachineState {
> >          char *dt_compatible;
> >          bool dump_guest_core;
> >          bool mem_merge;
> >     +    bool memfd_alloc;
> >          bool usb;
> >          bool usb_disabled;
> >          char *firmware;
> >     diff --git a/qemu-options.hx b/qemu-options.hx
> >     index 8965dab..fa53734 100644
> >     --- a/qemu-options.hx
> >     +++ b/qemu-options.hx
> >     @@ -30,6 +30,7 @@ DEF("machine", HAS_ARG, QEMU_OPTION_machine, \
> >          "                vmport=3Don|off|auto controls emulation of
> vmport (default: auto)\n"
> >          "                dump-guest-core=3Don|off include guest memory=
 in
> a core dump (default=3Don)\n"
> >          "                mem-merge=3Don|off controls memory merge supp=
ort
> (default: on)\n"
> >     +    "                memfd-alloc=3Don|off controls allocating
> anonymous memory using memfd_create (default: off)\n"
> >          "                aes-key-wrap=3Don|off controls support for AE=
S
> key wrapping (default=3Don)\n"
> >          "                dea-key-wrap=3Don|off controls support for DE=
A
> key wrapping (default=3Don)\n"
> >          "                suppress-vmdesc=3Don|off disables
> self-describing migration (default=3Doff)\n"
> >     @@ -76,6 +77,10 @@ SRST
> >              supported by the host, de-duplicates identical memory page=
s
> >              among VMs instances (enabled by default).
> >
> >     +    ``memfd-alloc=3Don|off``
> >     +        Enables or disables allocation of anonymous memory using
> memfd_create.
> >     +        (disabled by default).
> >     +
> >          ``aes-key-wrap=3Don|off``
> >              Enables or disables AES key wrapping support on s390-ccw
> hosts.
> >              This feature controls whether AES wrapping keys will be
> created
> >     diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> >     index 9b171c9..b149250 100644
> >     --- a/softmmu/physmem.c
> >     +++ b/softmmu/physmem.c
> >     @@ -64,6 +64,7 @@
> >
> >      #include "qemu/pmem.h"
> >
> >     +#include "qemu/memfd.h"
> >      #include "migration/vmstate.h"
> >
> >      #include "qemu/range.h"
> >     @@ -1960,35 +1961,58 @@ static void ram_block_add(RAMBlock
> *new_block, Error **errp)
> >          const bool shared =3D qemu_ram_is_shared(new_block);
> >          RAMBlock *block;
> >          RAMBlock *last_block =3D NULL;
> >     +    struct MemoryRegion *mr =3D new_block->mr;
> >          ram_addr_t old_ram_size, new_ram_size;
> >          Error *err =3D NULL;
> >     +    const char *name;
> >     +    void *addr =3D 0;
> >     +    size_t maxlen;
> >     +    MachineState *ms =3D MACHINE(qdev_get_machine());
> >
> >          old_ram_size =3D last_ram_page();
> >
> >          qemu_mutex_lock_ramlist();
> >     -    new_block->offset =3D find_ram_offset(new_block->max_length);
> >     +    maxlen =3D new_block->max_length;
> >     +    new_block->offset =3D find_ram_offset(maxlen);
> >
> >          if (!new_block->host) {
> >              if (xen_enabled()) {
> >     -            xen_ram_alloc(new_block->offset, new_block->max_length=
,
> >     -                          new_block->mr, &err);
> >     +            xen_ram_alloc(new_block->offset, maxlen, new_block->mr=
,
> &err);
> >                  if (err) {
> >                      error_propagate(errp, err);
> >                      qemu_mutex_unlock_ramlist();
> >                      return;
> >                  }
> >              } else {
> >     -            new_block->host =3D
> qemu_anon_ram_alloc(new_block->max_length,
> >     -
> &new_block->mr->align,
> >     -                                                  shared,
> noreserve);
> >     -            if (!new_block->host) {
> >     +            name =3D memory_region_name(new_block->mr);
> >     +            if (ms->memfd_alloc) {
> >     +                int mfd =3D -1;          /* placeholder until next
> patch */
> >     +                mr->align =3D QEMU_VMALLOC_ALIGN;
> >     +                if (mfd < 0) {
> >     +                    mfd =3D qemu_memfd_create(name, maxlen +
> mr->align,
> >     +                                            0, 0, 0, &err);
> >     +                    if (mfd < 0) {
> >     +                        return;
> >     +                    }
> >     +                }
> >     +                new_block->flags |=3D RAM_SHARED;
> >
> >
> > I wonder if ram_backend_memory_alloc() shouldn't be updated to reflect
> that the memory backend is "share" =3D true.
>
> It already does this:
>   ram_flags =3D backend->share ? RAM_SHARED : 0;
> Did you have something else in mind?
>

I mean the backend->share value should be updated, as it's always
RAM_SHARED.


> > And I would say so in the doc as well.
>
> Will do.
>
> - Steve
>
> >     +                addr =3D file_ram_alloc(new_block, maxlen, mfd,
> >     +                                      false, false, 0, errp);
> >     +                trace_anon_memfd_alloc(name, maxlen, addr, mfd);
> >     +            } else {
> >     +                addr =3D qemu_anon_ram_alloc(maxlen, &mr->align,
> >     +                                           shared, noreserve);
> >     +            }
> >     +
> >     +            if (!addr) {
> >                      error_setg_errno(errp, errno,
> >                                       "cannot set up guest memory '%s'"=
,
> >     -                                 memory_region_name(new_block->mr)=
);
> >     +                                 name);
> >                      qemu_mutex_unlock_ramlist();
> >                      return;
> >                  }
> >     -            memory_try_enable_merging(new_block->host,
> new_block->max_length);
> >     +            memory_try_enable_merging(addr, maxlen);
> >     +            new_block->host =3D addr;
> >              }
> >          }
> >
> >     diff --git a/trace-events b/trace-events
> >     index 765fe25..6dbcd0e 100644
> >     --- a/trace-events
> >     +++ b/trace-events
> >     @@ -40,6 +40,7 @@ ram_block_discard_range(const char *rbname, void
> *hva, size_t length, bool need_
> >      # accel/tcg/cputlb.c
> >      memory_notdirty_write_access(uint64_t vaddr, uint64_t ram_addr,
> unsigned size) "0x%" PRIx64 " ram_addr 0x%" PRIx64 " size %u"
> >      memory_notdirty_set_dirty(uint64_t vaddr) "0x%" PRIx64
> >     +anon_memfd_alloc(const char *name, size_t size, void *ptr, int fd)
> "%s size %zu ptr %p fd %d"
> >
> >      # gdbstub.c
> >      gdbstub_op_start(const char *device) "Starting gdbstub using devic=
e
> %s"
> >     diff --git a/util/qemu-config.c b/util/qemu-config.c
> >     index 84ee6dc..6162b4d 100644
> >     --- a/util/qemu-config.c
> >     +++ b/util/qemu-config.c
> >     @@ -207,6 +207,10 @@ static QemuOptsList machine_opts =3D {
> >                  .type =3D QEMU_OPT_BOOL,
> >                  .help =3D "enable/disable memory merge support",
> >              },{
> >     +            .name =3D "memfd-alloc",
> >     +            .type =3D QEMU_OPT_BOOL,
> >     +            .help =3D "enable/disable memfd_create for anonymous
> memory",
> >     +        },{
> >                  .name =3D "usb",
> >                  .type =3D QEMU_OPT_BOOL,
> >                  .help =3D "Set on/off to enable/disable usb",
> >     --
> >     1.8.3.1
> >
> >
> >
> >
> > --
> > Marc-Andr=C3=A9 Lureau
>


--=20
Marc-Andr=C3=A9 Lureau

--0000000000007c9ec505c6f0af1c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+SGk8YnI+PC9kaXY+PGJyPjxkaXYgY2xhc3M9
ImdtYWlsX3F1b3RlIj48ZGl2IGRpcj0ibHRyIiBjbGFzcz0iZ21haWxfYXR0ciI+T24gTW9uLCBK
dWwgMTIsIDIwMjEgYXQgOTowNyBQTSBTdGV2ZW4gU2lzdGFyZSAmbHQ7PGEgaHJlZj0ibWFpbHRv
OnN0ZXZlbi5zaXN0YXJlQG9yYWNsZS5jb20iPnN0ZXZlbi5zaXN0YXJlQG9yYWNsZS5jb208L2E+
Jmd0OyB3cm90ZTo8YnI+PC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHls
ZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBzb2xpZCByZ2IoMjA0
LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPk9uIDcvOC8yMDIxIDEwOjIwIEFNLCBNYXJjLUFu
ZHLDqSBMdXJlYXUgd3JvdGU6PGJyPg0KJmd0OyBIaTxicj4NCiZndDsgPGJyPg0KJmd0OyBPbiBX
ZWQsIEp1bCA3LCAyMDIxIGF0IDk6MzkgUE0gU3RldmUgU2lzdGFyZSAmbHQ7PGEgaHJlZj0ibWFp
bHRvOnN0ZXZlbi5zaXN0YXJlQG9yYWNsZS5jb20iIHRhcmdldD0iX2JsYW5rIj5zdGV2ZW4uc2lz
dGFyZUBvcmFjbGUuY29tPC9hPiAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpzdGV2ZW4uc2lz
dGFyZUBvcmFjbGUuY29tIiB0YXJnZXQ9Il9ibGFuayI+c3RldmVuLnNpc3RhcmVAb3JhY2xlLmNv
bTwvYT4mZ3Q7Jmd0OyB3cm90ZTo8YnI+DQomZ3Q7IDxicj4NCiZndDvCoCDCoCDCoEFsbG9jYXRl
IGFub255bW91cyBtZW1vcnkgdXNpbmcgbWVtZmRfY3JlYXRlIGlmIHRoZSBtZW1mZC1hbGxvYyBt
YWNoaW5lPGJyPg0KJmd0O8KgIMKgIMKgb3B0aW9uIGlzIHNldC48YnI+DQomZ3Q7IDxicj4NCiZn
dDsgPGJyPg0KJmd0OyBOaWNlLCBJJiMzOTtkIHN1Z2dlc3QgeW91IHNlbmQgdGhpcyBwYXRjaCBz
ZXBhcmF0ZWx5LiAod2UgaGFkIGRpc2N1c3Npb25zIGFib3V0IGFuIG9wdGlvbiBsaWtlIHRoaXMg
c2V2ZXJhbCB0aW1lcyk8YnI+DQo8YnI+DQpJIHdvdWxkIGxpa2UgdG8ga2VlcCBpdCB3aXRoIHRo
aXMgc2VyaWVzIHRvIG1ha2Ugc3VyZSBpdCBtZWV0cyBvdXIgbmVlZHMgYXMgdGhlIHBhdGNoZXMg
YXJlPGJyPg0KcmV2aWV3ZWQgYW5kIGV2b2x2ZS7CoCBXZSBjYW4gYWx3YXlzIHB1c2ggaXQgc29s
byBsYXRlciBpZiB0aGUgc2VyaWVzIHN0YWxscy48YnI+DQo8YnI+DQomZ3Q7wqAgwqAgwqBTaWdu
ZWQtb2ZmLWJ5OiBTdGV2ZSBTaXN0YXJlICZsdDs8YSBocmVmPSJtYWlsdG86c3RldmVuLnNpc3Rh
cmVAb3JhY2xlLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPnN0ZXZlbi5zaXN0YXJlQG9yYWNsZS5jb208
L2E+ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnN0ZXZlbi5zaXN0YXJlQG9yYWNsZS5jb20i
IHRhcmdldD0iX2JsYW5rIj5zdGV2ZW4uc2lzdGFyZUBvcmFjbGUuY29tPC9hPiZndDsmZ3Q7PGJy
Pg0KJmd0O8KgIMKgIMKgLS0tPGJyPg0KJmd0O8KgIMKgIMKgwqBody9jb3JlL21hY2hpbmUuY8Kg
IMKgfCAxOSArKysrKysrKysrKysrKysrKysrPGJyPg0KJmd0O8KgIMKgIMKgwqBpbmNsdWRlL2h3
L2JvYXJkcy5oIHzCoCAxICs8YnI+DQomZ3Q7wqAgwqAgwqDCoHFlbXUtb3B0aW9ucy5oeMKgIMKg
IMKgfMKgIDUgKysrKys8YnI+DQomZ3Q7wqAgwqAgwqDCoHNvZnRtbXUvcGh5c21lbS5jwqAgwqB8
IDQyICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLTxicj4NCiZndDvC
oCDCoCDCoMKgdHJhY2UtZXZlbnRzwqAgwqAgwqAgwqAgfMKgIDEgKzxicj4NCiZndDvCoCDCoCDC
oMKgdXRpbC9xZW11LWNvbmZpZy5jwqAgfMKgIDQgKysrKzxicj4NCiZndDvCoCDCoCDCoMKgNiBm
aWxlcyBjaGFuZ2VkLCA2MyBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKTxicj4NCiZndDsg
PGJyPg0KJmd0O8KgIMKgIMKgZGlmZiAtLWdpdCBhL2h3L2NvcmUvbWFjaGluZS5jIGIvaHcvY29y
ZS9tYWNoaW5lLmM8YnI+DQomZ3Q7wqAgwqAgwqBpbmRleCA1N2MxOGY5Li5mMDY1NmE4IDEwMDY0
NDxicj4NCiZndDvCoCDCoCDCoC0tLSBhL2h3L2NvcmUvbWFjaGluZS5jPGJyPg0KJmd0O8KgIMKg
IMKgKysrIGIvaHcvY29yZS9tYWNoaW5lLmM8YnI+DQomZ3Q7wqAgwqAgwqBAQCAtMzgzLDYgKzM4
MywyMCBAQCBzdGF0aWMgdm9pZCBtYWNoaW5lX3NldF9tZW1fbWVyZ2UoT2JqZWN0ICpvYmosIGJv
b2wgdmFsdWUsIEVycm9yICoqZXJycCk8YnI+DQomZ3Q7wqAgwqAgwqDCoCDCoCDCoG1zLSZndDtt
ZW1fbWVyZ2UgPSB2YWx1ZTs8YnI+DQomZ3Q7wqAgwqAgwqDCoH08YnI+DQomZ3Q7IDxicj4NCiZn
dDvCoCDCoCDCoCtzdGF0aWMgYm9vbCBtYWNoaW5lX2dldF9tZW1mZF9hbGxvYyhPYmplY3QgKm9i
aiwgRXJyb3IgKiplcnJwKTxicj4NCiZndDvCoCDCoCDCoCt7PGJyPg0KJmd0O8KgIMKgIMKgK8Kg
IMKgIE1hY2hpbmVTdGF0ZSAqbXMgPSBNQUNISU5FKG9iaik7PGJyPg0KJmd0O8KgIMKgIMKgKzxi
cj4NCiZndDvCoCDCoCDCoCvCoCDCoCByZXR1cm4gbXMtJmd0O21lbWZkX2FsbG9jOzxicj4NCiZn
dDvCoCDCoCDCoCt9PGJyPg0KJmd0O8KgIMKgIMKgKzxicj4NCiZndDvCoCDCoCDCoCtzdGF0aWMg
dm9pZCBtYWNoaW5lX3NldF9tZW1mZF9hbGxvYyhPYmplY3QgKm9iaiwgYm9vbCB2YWx1ZSwgRXJy
b3IgKiplcnJwKTxicj4NCiZndDvCoCDCoCDCoCt7PGJyPg0KJmd0O8KgIMKgIMKgK8KgIMKgIE1h
Y2hpbmVTdGF0ZSAqbXMgPSBNQUNISU5FKG9iaik7PGJyPg0KJmd0O8KgIMKgIMKgKzxicj4NCiZn
dDvCoCDCoCDCoCvCoCDCoCBtcy0mZ3Q7bWVtZmRfYWxsb2MgPSB2YWx1ZTs8YnI+DQomZ3Q7wqAg
wqAgwqArfTxicj4NCiZndDvCoCDCoCDCoCs8YnI+DQomZ3Q7wqAgwqAgwqDCoHN0YXRpYyBib29s
IG1hY2hpbmVfZ2V0X3VzYihPYmplY3QgKm9iaiwgRXJyb3IgKiplcnJwKTxicj4NCiZndDvCoCDC
oCDCoMKgezxicj4NCiZndDvCoCDCoCDCoMKgIMKgIMKgTWFjaGluZVN0YXRlICptcyA9IE1BQ0hJ
TkUob2JqKTs8YnI+DQomZ3Q7wqAgwqAgwqBAQCAtOTE3LDYgKzkzMSwxMSBAQCBzdGF0aWMgdm9p
ZCBtYWNoaW5lX2NsYXNzX2luaXQoT2JqZWN0Q2xhc3MgKm9jLCB2b2lkICpkYXRhKTxicj4NCiZn
dDvCoCDCoCDCoMKgIMKgIMKgb2JqZWN0X2NsYXNzX3Byb3BlcnR5X3NldF9kZXNjcmlwdGlvbihv
YywgJnF1b3Q7bWVtLW1lcmdlJnF1b3Q7LDxicj4NCiZndDvCoCDCoCDCoMKgIMKgIMKgIMKgIMKg
JnF1b3Q7RW5hYmxlL2Rpc2FibGUgbWVtb3J5IG1lcmdlIHN1cHBvcnQmcXVvdDspOzxicj4NCiZn
dDsgPGJyPg0KJmd0O8KgIMKgIMKgK8KgIMKgIG9iamVjdF9jbGFzc19wcm9wZXJ0eV9hZGRfYm9v
bChvYywgJnF1b3Q7bWVtZmQtYWxsb2MmcXVvdDssPGJyPg0KJmd0O8KgIMKgIMKgK8KgIMKgIMKg
IMKgIG1hY2hpbmVfZ2V0X21lbWZkX2FsbG9jLCBtYWNoaW5lX3NldF9tZW1mZF9hbGxvYyk7PGJy
Pg0KJmd0O8KgIMKgIMKgK8KgIMKgIG9iamVjdF9jbGFzc19wcm9wZXJ0eV9zZXRfZGVzY3JpcHRp
b24ob2MsICZxdW90O21lbWZkLWFsbG9jJnF1b3Q7LDxicj4NCiZndDvCoCDCoCDCoCvCoCDCoCDC
oCDCoCAmcXVvdDtFbmFibGUvZGlzYWJsZSBhbGxvY2F0aW5nIGFub255bW91cyBtZW1vcnkgdXNp
bmcgbWVtZmRfY3JlYXRlJnF1b3Q7KTs8YnI+DQomZ3Q7wqAgwqAgwqArPGJyPg0KJmd0O8KgIMKg
IMKgwqAgwqAgwqBvYmplY3RfY2xhc3NfcHJvcGVydHlfYWRkX2Jvb2wob2MsICZxdW90O3VzYiZx
dW90Oyw8YnI+DQomZ3Q7wqAgwqAgwqDCoCDCoCDCoCDCoCDCoG1hY2hpbmVfZ2V0X3VzYiwgbWFj
aGluZV9zZXRfdXNiKTs8YnI+DQomZ3Q7wqAgwqAgwqDCoCDCoCDCoG9iamVjdF9jbGFzc19wcm9w
ZXJ0eV9zZXRfZGVzY3JpcHRpb24ob2MsICZxdW90O3VzYiZxdW90Oyw8YnI+DQomZ3Q7wqAgwqAg
wqBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9ody9ib2FyZHMuaCBiL2luY2x1ZGUvaHcvYm9hcmRzLmg8
YnI+DQomZ3Q7wqAgwqAgwqBpbmRleCBhY2NkNmVmLi4yOTllMWNhIDEwMDY0NDxicj4NCiZndDvC
oCDCoCDCoC0tLSBhL2luY2x1ZGUvaHcvYm9hcmRzLmg8YnI+DQomZ3Q7wqAgwqAgwqArKysgYi9p
bmNsdWRlL2h3L2JvYXJkcy5oPGJyPg0KJmd0O8KgIMKgIMKgQEAgLTMwNSw2ICszMDUsNyBAQCBz
dHJ1Y3QgTWFjaGluZVN0YXRlIHs8YnI+DQomZ3Q7wqAgwqAgwqDCoCDCoCDCoGNoYXIgKmR0X2Nv
bXBhdGlibGU7PGJyPg0KJmd0O8KgIMKgIMKgwqAgwqAgwqBib29sIGR1bXBfZ3Vlc3RfY29yZTs8
YnI+DQomZ3Q7wqAgwqAgwqDCoCDCoCDCoGJvb2wgbWVtX21lcmdlOzxicj4NCiZndDvCoCDCoCDC
oCvCoCDCoCBib29sIG1lbWZkX2FsbG9jOzxicj4NCiZndDvCoCDCoCDCoMKgIMKgIMKgYm9vbCB1
c2I7PGJyPg0KJmd0O8KgIMKgIMKgwqAgwqAgwqBib29sIHVzYl9kaXNhYmxlZDs8YnI+DQomZ3Q7
wqAgwqAgwqDCoCDCoCDCoGNoYXIgKmZpcm13YXJlOzxicj4NCiZndDvCoCDCoCDCoGRpZmYgLS1n
aXQgYS9xZW11LW9wdGlvbnMuaHggYi9xZW11LW9wdGlvbnMuaHg8YnI+DQomZ3Q7wqAgwqAgwqBp
bmRleCA4OTY1ZGFiLi5mYTUzNzM0IDEwMDY0NDxicj4NCiZndDvCoCDCoCDCoC0tLSBhL3FlbXUt
b3B0aW9ucy5oeDxicj4NCiZndDvCoCDCoCDCoCsrKyBiL3FlbXUtb3B0aW9ucy5oeDxicj4NCiZn
dDvCoCDCoCDCoEBAIC0zMCw2ICszMCw3IEBAIERFRigmcXVvdDttYWNoaW5lJnF1b3Q7LCBIQVNf
QVJHLCBRRU1VX09QVElPTl9tYWNoaW5lLCBcPGJyPg0KJmd0O8KgIMKgIMKgwqAgwqAgwqAmcXVv
dDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB2bXBvcnQ9b258b2ZmfGF1dG8gY29udHJvbHMgZW11
bGF0aW9uIG9mIHZtcG9ydCAoZGVmYXVsdDogYXV0bylcbiZxdW90Ozxicj4NCiZndDvCoCDCoCDC
oMKgIMKgIMKgJnF1b3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgZHVtcC1ndWVzdC1jb3JlPW9u
fG9mZiBpbmNsdWRlIGd1ZXN0IG1lbW9yeSBpbiBhIGNvcmUgZHVtcCAoZGVmYXVsdD1vbilcbiZx
dW90Ozxicj4NCiZndDvCoCDCoCDCoMKgIMKgIMKgJnF1b3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgbWVtLW1lcmdlPW9ufG9mZiBjb250cm9scyBtZW1vcnkgbWVyZ2Ugc3VwcG9ydCAoZGVmYXVs
dDogb24pXG4mcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqArwqAgwqAgJnF1b3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgbWVtZmQtYWxsb2M9b258b2ZmIGNvbnRyb2xzIGFsbG9jYXRpbmcgYW5vbnlt
b3VzIG1lbW9yeSB1c2luZyBtZW1mZF9jcmVhdGUgKGRlZmF1bHQ6IG9mZilcbiZxdW90Ozxicj4N
CiZndDvCoCDCoCDCoMKgIMKgIMKgJnF1b3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgYWVzLWtl
eS13cmFwPW9ufG9mZiBjb250cm9scyBzdXBwb3J0IGZvciBBRVMga2V5IHdyYXBwaW5nIChkZWZh
dWx0PW9uKVxuJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgwqAgwqAgwqAmcXVvdDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCBkZWEta2V5LXdyYXA9b258b2ZmIGNvbnRyb2xzIHN1cHBvcnQgZm9yIERF
QSBrZXkgd3JhcHBpbmcgKGRlZmF1bHQ9b24pXG4mcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqDCoCDC
oCDCoCZxdW90O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHN1cHByZXNzLXZtZGVzYz1vbnxvZmYg
ZGlzYWJsZXMgc2VsZi1kZXNjcmliaW5nIG1pZ3JhdGlvbiAoZGVmYXVsdD1vZmYpXG4mcXVvdDs8
YnI+DQomZ3Q7wqAgwqAgwqBAQCAtNzYsNiArNzcsMTAgQEAgU1JTVDxicj4NCiZndDvCoCDCoCDC
oMKgIMKgIMKgIMKgIMKgc3VwcG9ydGVkIGJ5IHRoZSBob3N0LCBkZS1kdXBsaWNhdGVzIGlkZW50
aWNhbCBtZW1vcnkgcGFnZXM8YnI+DQomZ3Q7wqAgwqAgwqDCoCDCoCDCoCDCoCDCoGFtb25nIFZN
cyBpbnN0YW5jZXMgKGVuYWJsZWQgYnkgZGVmYXVsdCkuPGJyPg0KJmd0OyA8YnI+DQomZ3Q7wqAg
wqAgwqArwqAgwqAgYGBtZW1mZC1hbGxvYz1vbnxvZmZgYDxicj4NCiZndDvCoCDCoCDCoCvCoCDC
oCDCoCDCoCBFbmFibGVzIG9yIGRpc2FibGVzIGFsbG9jYXRpb24gb2YgYW5vbnltb3VzIG1lbW9y
eSB1c2luZyBtZW1mZF9jcmVhdGUuPGJyPg0KJmd0O8KgIMKgIMKgK8KgIMKgIMKgIMKgIChkaXNh
YmxlZCBieSBkZWZhdWx0KS48YnI+DQomZ3Q7wqAgwqAgwqArPGJyPg0KJmd0O8KgIMKgIMKgwqAg
wqAgwqBgYGFlcy1rZXktd3JhcD1vbnxvZmZgYDxicj4NCiZndDvCoCDCoCDCoMKgIMKgIMKgIMKg
IMKgRW5hYmxlcyBvciBkaXNhYmxlcyBBRVMga2V5IHdyYXBwaW5nIHN1cHBvcnQgb24gczM5MC1j
Y3cgaG9zdHMuPGJyPg0KJmd0O8KgIMKgIMKgwqAgwqAgwqAgwqAgwqBUaGlzIGZlYXR1cmUgY29u
dHJvbHMgd2hldGhlciBBRVMgd3JhcHBpbmcga2V5cyB3aWxsIGJlIGNyZWF0ZWQ8YnI+DQomZ3Q7
wqAgwqAgwqBkaWZmIC0tZ2l0IGEvc29mdG1tdS9waHlzbWVtLmMgYi9zb2Z0bW11L3BoeXNtZW0u
Yzxicj4NCiZndDvCoCDCoCDCoGluZGV4IDliMTcxYzkuLmIxNDkyNTAgMTAwNjQ0PGJyPg0KJmd0
O8KgIMKgIMKgLS0tIGEvc29mdG1tdS9waHlzbWVtLmM8YnI+DQomZ3Q7wqAgwqAgwqArKysgYi9z
b2Z0bW11L3BoeXNtZW0uYzxicj4NCiZndDvCoCDCoCDCoEBAIC02NCw2ICs2NCw3IEBAPGJyPg0K
Jmd0OyA8YnI+DQomZ3Q7wqAgwqAgwqDCoCNpbmNsdWRlICZxdW90O3FlbXUvcG1lbS5oJnF1b3Q7
PGJyPg0KJmd0OyA8YnI+DQomZ3Q7wqAgwqAgwqArI2luY2x1ZGUgJnF1b3Q7cWVtdS9tZW1mZC5o
JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgwqAjaW5jbHVkZSAmcXVvdDttaWdyYXRpb24vdm1zdGF0
ZS5oJnF1b3Q7PGJyPg0KJmd0OyA8YnI+DQomZ3Q7wqAgwqAgwqDCoCNpbmNsdWRlICZxdW90O3Fl
bXUvcmFuZ2UuaCZxdW90Ozxicj4NCiZndDvCoCDCoCDCoEBAIC0xOTYwLDM1ICsxOTYxLDU4IEBA
IHN0YXRpYyB2b2lkIHJhbV9ibG9ja19hZGQoUkFNQmxvY2sgKm5ld19ibG9jaywgRXJyb3IgKipl
cnJwKTxicj4NCiZndDvCoCDCoCDCoMKgIMKgIMKgY29uc3QgYm9vbCBzaGFyZWQgPSBxZW11X3Jh
bV9pc19zaGFyZWQobmV3X2Jsb2NrKTs8YnI+DQomZ3Q7wqAgwqAgwqDCoCDCoCDCoFJBTUJsb2Nr
ICpibG9jazs8YnI+DQomZ3Q7wqAgwqAgwqDCoCDCoCDCoFJBTUJsb2NrICpsYXN0X2Jsb2NrID0g
TlVMTDs8YnI+DQomZ3Q7wqAgwqAgwqArwqAgwqAgc3RydWN0IE1lbW9yeVJlZ2lvbiAqbXIgPSBu
ZXdfYmxvY2stJmd0O21yOzxicj4NCiZndDvCoCDCoCDCoMKgIMKgIMKgcmFtX2FkZHJfdCBvbGRf
cmFtX3NpemUsIG5ld19yYW1fc2l6ZTs8YnI+DQomZ3Q7wqAgwqAgwqDCoCDCoCDCoEVycm9yICpl
cnIgPSBOVUxMOzxicj4NCiZndDvCoCDCoCDCoCvCoCDCoCBjb25zdCBjaGFyICpuYW1lOzxicj4N
CiZndDvCoCDCoCDCoCvCoCDCoCB2b2lkICphZGRyID0gMDs8YnI+DQomZ3Q7wqAgwqAgwqArwqAg
wqAgc2l6ZV90IG1heGxlbjs8YnI+DQomZ3Q7wqAgwqAgwqArwqAgwqAgTWFjaGluZVN0YXRlICpt
cyA9IE1BQ0hJTkUocWRldl9nZXRfbWFjaGluZSgpKTs8YnI+DQomZ3Q7IDxicj4NCiZndDvCoCDC
oCDCoMKgIMKgIMKgb2xkX3JhbV9zaXplID0gbGFzdF9yYW1fcGFnZSgpOzxicj4NCiZndDsgPGJy
Pg0KJmd0O8KgIMKgIMKgwqAgwqAgwqBxZW11X211dGV4X2xvY2tfcmFtbGlzdCgpOzxicj4NCiZn
dDvCoCDCoCDCoC3CoCDCoCBuZXdfYmxvY2stJmd0O29mZnNldCA9IGZpbmRfcmFtX29mZnNldChu
ZXdfYmxvY2stJmd0O21heF9sZW5ndGgpOzxicj4NCiZndDvCoCDCoCDCoCvCoCDCoCBtYXhsZW4g
PSBuZXdfYmxvY2stJmd0O21heF9sZW5ndGg7PGJyPg0KJmd0O8KgIMKgIMKgK8KgIMKgIG5ld19i
bG9jay0mZ3Q7b2Zmc2V0ID0gZmluZF9yYW1fb2Zmc2V0KG1heGxlbik7PGJyPg0KJmd0OyA8YnI+
DQomZ3Q7wqAgwqAgwqDCoCDCoCDCoGlmICghbmV3X2Jsb2NrLSZndDtob3N0KSB7PGJyPg0KJmd0
O8KgIMKgIMKgwqAgwqAgwqAgwqAgwqBpZiAoeGVuX2VuYWJsZWQoKSkgezxicj4NCiZndDvCoCDC
oCDCoC3CoCDCoCDCoCDCoCDCoCDCoCB4ZW5fcmFtX2FsbG9jKG5ld19ibG9jay0mZ3Q7b2Zmc2V0
LCBuZXdfYmxvY2stJmd0O21heF9sZW5ndGgsPGJyPg0KJmd0O8KgIMKgIMKgLcKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIG5ld19ibG9jay0mZ3Q7bXIsICZhbXA7ZXJyKTs8
YnI+DQomZ3Q7wqAgwqAgwqArwqAgwqAgwqAgwqAgwqAgwqAgeGVuX3JhbV9hbGxvYyhuZXdfYmxv
Y2stJmd0O29mZnNldCwgbWF4bGVuLCBuZXdfYmxvY2stJmd0O21yLCAmYW1wO2Vycik7PGJyPg0K
Jmd0O8KgIMKgIMKgwqAgwqAgwqAgwqAgwqAgwqAgwqBpZiAoZXJyKSB7PGJyPg0KJmd0O8KgIMKg
IMKgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBlcnJvcl9wcm9wYWdhdGUoZXJycCwgZXJyKTs8
YnI+DQomZ3Q7wqAgwqAgwqDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHFlbXVfbXV0ZXhfdW5s
b2NrX3JhbWxpc3QoKTs8YnI+DQomZ3Q7wqAgwqAgwqDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oHJldHVybjs8YnI+DQomZ3Q7wqAgwqAgwqDCoCDCoCDCoCDCoCDCoCDCoCDCoH08YnI+DQomZ3Q7
wqAgwqAgwqDCoCDCoCDCoCDCoCDCoH0gZWxzZSB7PGJyPg0KJmd0O8KgIMKgIMKgLcKgIMKgIMKg
IMKgIMKgIMKgIG5ld19ibG9jay0mZ3Q7aG9zdCA9IHFlbXVfYW5vbl9yYW1fYWxsb2MobmV3X2Js
b2NrLSZndDttYXhfbGVuZ3RoLDxicj4NCiZndDvCoCDCoCDCoC3CoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAm
YW1wO25ld19ibG9jay0mZ3Q7bXItJmd0O2FsaWduLDxicj4NCiZndDvCoCDCoCDCoC3CoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCBzaGFyZWQsIG5vcmVzZXJ2ZSk7PGJyPg0KJmd0O8KgIMKgIMKgLcKgIMKgIMKg
IMKgIMKgIMKgIGlmICghbmV3X2Jsb2NrLSZndDtob3N0KSB7PGJyPg0KJmd0O8KgIMKgIMKgK8Kg
IMKgIMKgIMKgIMKgIMKgIG5hbWUgPSBtZW1vcnlfcmVnaW9uX25hbWUobmV3X2Jsb2NrLSZndDtt
cik7PGJyPg0KJmd0O8KgIMKgIMKgK8KgIMKgIMKgIMKgIMKgIMKgIGlmIChtcy0mZ3Q7bWVtZmRf
YWxsb2MpIHs8YnI+DQomZ3Q7wqAgwqAgwqArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgaW50IG1m
ZCA9IC0xO8KgIMKgIMKgIMKgIMKgIC8qIHBsYWNlaG9sZGVyIHVudGlsIG5leHQgcGF0Y2ggKi88
YnI+DQomZ3Q7wqAgwqAgwqArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgbXItJmd0O2FsaWduID0g
UUVNVV9WTUFMTE9DX0FMSUdOOzxicj4NCiZndDvCoCDCoCDCoCvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCBpZiAobWZkICZsdDsgMCkgezxicj4NCiZndDvCoCDCoCDCoCvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCBtZmQgPSBxZW11X21lbWZkX2NyZWF0ZShuYW1lLCBtYXhsZW4gKyBtci0m
Z3Q7YWxpZ24sPGJyPg0KJmd0O8KgIMKgIMKgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIDAsIDAsIDAsICZhbXA7ZXJyKTs8
YnI+DQomZ3Q7wqAgwqAgwqArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgaWYgKG1mZCAm
bHQ7IDApIHs8YnI+DQomZ3Q7wqAgwqAgwqArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgcmV0dXJuOzxicj4NCiZndDvCoCDCoCDCoCvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCB9PGJyPg0KJmd0O8KgIMKgIMKgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIH08YnI+DQom
Z3Q7wqAgwqAgwqArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgbmV3X2Jsb2NrLSZndDtmbGFncyB8
PSBSQU1fU0hBUkVEOzxicj4NCiZndDsgPGJyPg0KJmd0OyA8YnI+DQomZ3Q7IEkgd29uZGVyIGlm
IHJhbV9iYWNrZW5kX21lbW9yeV9hbGxvYygpIHNob3VsZG4mIzM5O3QgYmUgdXBkYXRlZCB0byBy
ZWZsZWN0IHRoYXQgdGhlIG1lbW9yeSBiYWNrZW5kIGlzICZxdW90O3NoYXJlJnF1b3Q7ID0gdHJ1
ZS4gPGJyPg0KPGJyPg0KSXQgYWxyZWFkeSBkb2VzIHRoaXM6PGJyPg0KwqAgcmFtX2ZsYWdzID0g
YmFja2VuZC0mZ3Q7c2hhcmUgPyBSQU1fU0hBUkVEIDogMDs8YnI+DQpEaWQgeW91IGhhdmUgc29t
ZXRoaW5nIGVsc2UgaW4gbWluZD88YnI+PC9ibG9ja3F1b3RlPjxkaXY+PGJyPjwvZGl2PjxkaXY+
SSBtZWFuIHRoZSBiYWNrZW5kLSZndDtzaGFyZSB2YWx1ZSBzaG91bGQgYmUgdXBkYXRlZCwgYXMg
aXQmIzM5O3MgYWx3YXlzIFJBTV9TSEFSRUQuPGJyPjwvZGl2PjxkaXY+IDxicj48L2Rpdj48Ymxv
Y2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBweCAwcHggMC44
ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJnYigyMDQsMjA0LDIwNCk7cGFkZGluZy1sZWZ0OjFl
eCI+DQo8YnI+DQomZ3Q7IEFuZCBJIHdvdWxkIHNheSBzbyBpbiB0aGUgZG9jIGFzIHdlbGwuPGJy
Pg0KPGJyPg0KV2lsbCBkby48YnI+DQo8YnI+DQotIFN0ZXZlPGJyPg0KPGJyPg0KJmd0O8KgIMKg
IMKgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGFkZHIgPSBmaWxlX3JhbV9hbGxvYyhuZXdfYmxv
Y2ssIG1heGxlbiwgbWZkLDxicj4NCiZndDvCoCDCoCDCoCvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBmYWxzZSwgZmFsc2UsIDAsIGVycnAp
Ozxicj4NCiZndDvCoCDCoCDCoCvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB0cmFjZV9hbm9uX21l
bWZkX2FsbG9jKG5hbWUsIG1heGxlbiwgYWRkciwgbWZkKTs8YnI+DQomZ3Q7wqAgwqAgwqArwqAg
wqAgwqAgwqAgwqAgwqAgfSBlbHNlIHs8YnI+DQomZ3Q7wqAgwqAgwqArwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgYWRkciA9IHFlbXVfYW5vbl9yYW1fYWxsb2MobWF4bGVuLCAmYW1wO21yLSZndDth
bGlnbiw8YnI+DQomZ3Q7wqAgwqAgwqArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzaGFyZWQsIG5vcmVzZXJ2ZSk7PGJyPg0K
Jmd0O8KgIMKgIMKgK8KgIMKgIMKgIMKgIMKgIMKgIH08YnI+DQomZ3Q7wqAgwqAgwqArPGJyPg0K
Jmd0O8KgIMKgIMKgK8KgIMKgIMKgIMKgIMKgIMKgIGlmICghYWRkcikgezxicj4NCiZndDvCoCDC
oCDCoMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZXJyb3Jfc2V0Z19lcnJubyhlcnJwLCBlcnJu
byw8YnI+DQomZ3Q7wqAgwqAgwqDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCAmcXVvdDtjYW5ub3Qgc2V0IHVwIGd1ZXN0IG1lbW9yeSAmIzM5OyVzJiMz
OTsmcXVvdDssPGJyPg0KJmd0O8KgIMKgIMKgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgbWVtb3J5X3JlZ2lvbl9uYW1lKG5ld19ibG9jay0mZ3Q7bXIp
KTs8YnI+DQomZ3Q7wqAgwqAgwqArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBuYW1lKTs8YnI+DQomZ3Q7wqAgwqAgwqDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoHFlbXVfbXV0ZXhfdW5sb2NrX3JhbWxpc3QoKTs8YnI+DQomZ3Q7wqAgwqAgwqDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJldHVybjs8YnI+DQomZ3Q7wqAgwqAgwqDCoCDCoCDCoCDC
oCDCoCDCoCDCoH08YnI+DQomZ3Q7wqAgwqAgwqAtwqAgwqAgwqAgwqAgwqAgwqAgbWVtb3J5X3Ry
eV9lbmFibGVfbWVyZ2luZyhuZXdfYmxvY2stJmd0O2hvc3QsIG5ld19ibG9jay0mZ3Q7bWF4X2xl
bmd0aCk7PGJyPg0KJmd0O8KgIMKgIMKgK8KgIMKgIMKgIMKgIMKgIMKgIG1lbW9yeV90cnlfZW5h
YmxlX21lcmdpbmcoYWRkciwgbWF4bGVuKTs8YnI+DQomZ3Q7wqAgwqAgwqArwqAgwqAgwqAgwqAg
wqAgwqAgbmV3X2Jsb2NrLSZndDtob3N0ID0gYWRkcjs8YnI+DQomZ3Q7wqAgwqAgwqDCoCDCoCDC
oCDCoCDCoH08YnI+DQomZ3Q7wqAgwqAgwqDCoCDCoCDCoH08YnI+DQomZ3Q7IDxicj4NCiZndDvC
oCDCoCDCoGRpZmYgLS1naXQgYS90cmFjZS1ldmVudHMgYi90cmFjZS1ldmVudHM8YnI+DQomZ3Q7
wqAgwqAgwqBpbmRleCA3NjVmZTI1Li42ZGJjZDBlIDEwMDY0NDxicj4NCiZndDvCoCDCoCDCoC0t
LSBhL3RyYWNlLWV2ZW50czxicj4NCiZndDvCoCDCoCDCoCsrKyBiL3RyYWNlLWV2ZW50czxicj4N
CiZndDvCoCDCoCDCoEBAIC00MCw2ICs0MCw3IEBAIHJhbV9ibG9ja19kaXNjYXJkX3JhbmdlKGNv
bnN0IGNoYXIgKnJibmFtZSwgdm9pZCAqaHZhLCBzaXplX3QgbGVuZ3RoLCBib29sIG5lZWRfPGJy
Pg0KJmd0O8KgIMKgIMKgwqAjIGFjY2VsL3RjZy9jcHV0bGIuYzxicj4NCiZndDvCoCDCoCDCoMKg
bWVtb3J5X25vdGRpcnR5X3dyaXRlX2FjY2Vzcyh1aW50NjRfdCB2YWRkciwgdWludDY0X3QgcmFt
X2FkZHIsIHVuc2lnbmVkIHNpemUpICZxdW90OzB4JSZxdW90OyBQUkl4NjQgJnF1b3Q7IHJhbV9h
ZGRyIDB4JSZxdW90OyBQUkl4NjQgJnF1b3Q7IHNpemUgJXUmcXVvdDs8YnI+DQomZ3Q7wqAgwqAg
wqDCoG1lbW9yeV9ub3RkaXJ0eV9zZXRfZGlydHkodWludDY0X3QgdmFkZHIpICZxdW90OzB4JSZx
dW90OyBQUkl4NjQ8YnI+DQomZ3Q7wqAgwqAgwqArYW5vbl9tZW1mZF9hbGxvYyhjb25zdCBjaGFy
ICpuYW1lLCBzaXplX3Qgc2l6ZSwgdm9pZCAqcHRyLCBpbnQgZmQpICZxdW90OyVzIHNpemUgJXp1
IHB0ciAlcCBmZCAlZCZxdW90Ozxicj4NCiZndDsgPGJyPg0KJmd0O8KgIMKgIMKgwqAjIGdkYnN0
dWIuYzxicj4NCiZndDvCoCDCoCDCoMKgZ2Ric3R1Yl9vcF9zdGFydChjb25zdCBjaGFyICpkZXZp
Y2UpICZxdW90O1N0YXJ0aW5nIGdkYnN0dWIgdXNpbmcgZGV2aWNlICVzJnF1b3Q7PGJyPg0KJmd0
O8KgIMKgIMKgZGlmZiAtLWdpdCBhL3V0aWwvcWVtdS1jb25maWcuYyBiL3V0aWwvcWVtdS1jb25m
aWcuYzxicj4NCiZndDvCoCDCoCDCoGluZGV4IDg0ZWU2ZGMuLjYxNjJiNGQgMTAwNjQ0PGJyPg0K
Jmd0O8KgIMKgIMKgLS0tIGEvdXRpbC9xZW11LWNvbmZpZy5jPGJyPg0KJmd0O8KgIMKgIMKgKysr
IGIvdXRpbC9xZW11LWNvbmZpZy5jPGJyPg0KJmd0O8KgIMKgIMKgQEAgLTIwNyw2ICsyMDcsMTAg
QEAgc3RhdGljIFFlbXVPcHRzTGlzdCBtYWNoaW5lX29wdHMgPSB7PGJyPg0KJmd0O8KgIMKgIMKg
wqAgwqAgwqAgwqAgwqAgwqAgwqAudHlwZSA9IFFFTVVfT1BUX0JPT0wsPGJyPg0KJmd0O8KgIMKg
IMKgwqAgwqAgwqAgwqAgwqAgwqAgwqAuaGVscCA9ICZxdW90O2VuYWJsZS9kaXNhYmxlIG1lbW9y
eSBtZXJnZSBzdXBwb3J0JnF1b3Q7LDxicj4NCiZndDvCoCDCoCDCoMKgIMKgIMKgIMKgIMKgfSx7
PGJyPg0KJmd0O8KgIMKgIMKgK8KgIMKgIMKgIMKgIMKgIMKgIC5uYW1lID0gJnF1b3Q7bWVtZmQt
YWxsb2MmcXVvdDssPGJyPg0KJmd0O8KgIMKgIMKgK8KgIMKgIMKgIMKgIMKgIMKgIC50eXBlID0g
UUVNVV9PUFRfQk9PTCw8YnI+DQomZ3Q7wqAgwqAgwqArwqAgwqAgwqAgwqAgwqAgwqAgLmhlbHAg
PSAmcXVvdDtlbmFibGUvZGlzYWJsZSBtZW1mZF9jcmVhdGUgZm9yIGFub255bW91cyBtZW1vcnkm
cXVvdDssPGJyPg0KJmd0O8KgIMKgIMKgK8KgIMKgIMKgIMKgIH0sezxicj4NCiZndDvCoCDCoCDC
oMKgIMKgIMKgIMKgIMKgIMKgIMKgLm5hbWUgPSAmcXVvdDt1c2ImcXVvdDssPGJyPg0KJmd0O8Kg
IMKgIMKgwqAgwqAgwqAgwqAgwqAgwqAgwqAudHlwZSA9IFFFTVVfT1BUX0JPT0wsPGJyPg0KJmd0
O8KgIMKgIMKgwqAgwqAgwqAgwqAgwqAgwqAgwqAuaGVscCA9ICZxdW90O1NldCBvbi9vZmYgdG8g
ZW5hYmxlL2Rpc2FibGUgdXNiJnF1b3Q7LDxicj4NCiZndDvCoCDCoCDCoC0tIDxicj4NCiZndDvC
oCDCoCDCoDEuOC4zLjE8YnI+DQomZ3Q7IDxicj4NCiZndDsgPGJyPg0KJmd0OyA8YnI+DQomZ3Q7
IDxicj4NCiZndDsgLS0gPGJyPg0KJmd0OyBNYXJjLUFuZHLDqSBMdXJlYXU8YnI+DQo8L2Jsb2Nr
cXVvdGU+PC9kaXY+PGJyIGNsZWFyPSJhbGwiPjxicj4tLSA8YnI+PGRpdiBkaXI9Imx0ciIgY2xh
c3M9ImdtYWlsX3NpZ25hdHVyZSI+TWFyYy1BbmRyw6kgTHVyZWF1PGJyPjwvZGl2PjwvZGl2Pg0K
--0000000000007c9ec505c6f0af1c--

