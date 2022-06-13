Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86BA5548298
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 11:07:28 +0200 (CEST)
Received: from localhost ([::1]:40498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0g2h-00083l-J5
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 05:07:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhlcindy@gmail.com>)
 id 1o0fzA-0006iT-7E
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 05:03:49 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e]:33726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zhlcindy@gmail.com>)
 id 1o0fz3-0003LW-Up
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 05:03:47 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-30fa61b1a83so45004007b3.0
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 02:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jsKRKlm68QVVDkxY6Rj0ZNliM1xJd8+xEyUYh4yp6TM=;
 b=Gap+ZcogR1WAJVzQ5x1f8Kq3KVgrthi6CbdDTWEr1DGMY8CPct1f9J/+PIYMvwi8L/
 jM4zXmR3zc8tCINwk57tly3fCpNGZRPbwWTA+cXqzAh3w2iqUaY58AZKQIdkWmV3vdBm
 ZEWUCK/9GU2zAXnakaWPmreViWX8DNxzgNxEjkF78hU2WOmVHB62cPcVeQ6kA4VMuCzx
 CbcEBv8v543d51fwY/Zh4FL3vqqql6DrIggbENVHL3lI8SL+5yQSKdZVjTiXXvrlU6N+
 sQ1kTFWBRTzXZ/Nc1E6C1pj5RgaT9OpgRhJzyjeyj6saZ0k+c0y5CTFsq5/HBW9YuvOo
 uKIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jsKRKlm68QVVDkxY6Rj0ZNliM1xJd8+xEyUYh4yp6TM=;
 b=ROFQxis/nedtrCstU8a45+FlSZnAFcNp71W6ve0DeAQCuXsY+g1pnWm+vudCbAAxrO
 uu0/T7oLbN1yPhCViCNkob2TAUZaKjLqIcXFpjBNfoULls/wDB6cC6HwpivzkUjuU2mf
 kJlouajjlTJ7uJ/L22sbSLBD8HLKvdSz6hN61Qjf5i47IFKwd0CBef6SvwMjOLS+RlGb
 fnntMqsuiI8ysuOYEubVtncTaFH60RDQZc0P2UXLQBjHF629sWSQ5rErfsPHH+/wD/S8
 Gf1WPsaxCqwBD25N9M/X021edqknheFuTbtvMz8GZoTbjAol2TbycvBoRPXkaNx0uweY
 NKVQ==
X-Gm-Message-State: AOAM532F3ow3Wq3cKZ0aVb3MkPPFKHXKiMsRO8B6aA8j6XA/4/eFCPN1
 6wwiWqJVdk/3CmHPo3/+qaiARot9ulsr59z4lHc=
X-Google-Smtp-Source: ABdhPJzifTBZZWdfh4gvrGLBI2n5RflvjX1ercoYM7qJ6WM8494NTHU/kfCBFq73XvNQM47gC+hUqBwFhHJDTDbn9dk=
X-Received: by 2002:a81:60c6:0:b0:30f:ea59:10c7 with SMTP id
 u189-20020a8160c6000000b0030fea5910c7mr62745903ywb.78.1655111014193; Mon, 13
 Jun 2022 02:03:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220520095602.17379-1-lizhang@suse.de>
 <20220609170525.22eb992d@redhat.com>
In-Reply-To: <20220609170525.22eb992d@redhat.com>
From: Li Zhang <zhlcindy@gmail.com>
Date: Mon, 13 Jun 2022 11:03:23 +0200
Message-ID: <CAD8of+qg7ghVOMYvoB6dXV-nG2D4k=j9NDzreRR-bfMS0P+GVw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] Fix the coredump when memory backend id conflicts
 with default_ram_id
To: Igor Mammedov <imammedo@redhat.com>
Cc: Li Zhang <lizhang@suse.de>, Eduardo Habkost <eduardo@habkost.net>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Yanan Wang <wangyanan55@huawei.com>, QEMU <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=zhlcindy@gmail.com; helo=mail-yw1-x112e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Thu, Jun 9, 2022 at 5:59 PM Igor Mammedov <imammedo@redhat.com> wrote:
>
> On Fri, 20 May 2022 11:56:02 +0200
> Li Zhang <lizhang@suse.de> wrote:
>
> > When no memory backend is specified in machine options,
> > a default memory device will be added with default_ram_id.
> > However, if a memory backend object is added in QEMU options
> > and id is the same as default_ram_id, a coredump happens.
> >
> > Command line:
> > qemu-system-x86_64 -name guest=vmtest,debug-threads=on \
> > -machine pc-q35-6.0,accel=kvm,usb=off,vmport=off \
> > -smp 16,sockets=16,cores=1,threads=1 \
> > -m 4G \
> > -object memory-backend-ram,id=pc.ram,size=4G \
> > -no-user-config -nodefaults -nographic
> >
> > Stack trace of thread 16903:
> >     #0  0x00007fb109a9318b raise (libc.so.6 + 0x3a18b)
> >     #1  0x00007fb109a94585 abort (libc.so.6 + 0x3b585)
> >     #2  0x0000558c34bc89be error_handle_fatal (qemu-system-x86_64 + 0x9c89be)
> >     #3  0x0000558c34bc8aee error_setv (qemu-system-x86_64 + 0x9c8aee)
> >     #4  0x0000558c34bc8ccf error_setg_internal (qemu-system-x86_64 + 0x9c8ccf)
> >     #5  0x0000558c349f6899 object_property_try_add (qemu-system-x86_64 + 0x7f6899)
> >     #6  0x0000558c349f7df8 object_property_try_add_child (qemu-system-x86_64 + 0x7f7df8)
> >     #7  0x0000558c349f7e91 object_property_add_child (qemu-system-x86_64 + 0x7f7e91)
> >     #8  0x0000558c3454686d create_default_memdev (qemu-system-x86_64 + 0x34686d)
> >     #9  0x0000558c34546f58 qemu_init_board (qemu-system-x86_64 + 0x346f58)
> >     #10 0x0000558c345471b9 qmp_x_exit_preconfig (qemu-system-x86_64 + 0x3471b9)
> >     #11 0x0000558c345497d9 qemu_init (qemu-system-x86_64 + 0x3497d9)
> >     #12 0x0000558c344e54c2 main (qemu-system-x86_64 + 0x2e54c2)
> >     #13 0x00007fb109a7e34d __libc_start_main (libc.so.6 + 0x2534d)
> >     #14 0x0000558c344e53ba _start (qemu-system-x86_64 + 0x2e53ba)
> >
> > Signed-off-by: Li Zhang <lizhang@suse.de>
> > ---
> >  hw/core/machine.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/hw/core/machine.c b/hw/core/machine.c
> > index b03d9192ba..3867af7a8a 100644
> > --- a/hw/core/machine.c
> > +++ b/hw/core/machine.c
> > @@ -1290,9 +1290,17 @@ MemoryRegion *machine_consume_memdev(MachineState *machine,
> >  static bool create_default_memdev(MachineState *ms, const char *path, Error **errp)
> >  {
> >      Object *obj;
> > +    ObjectProperty *prop;
> >      MachineClass *mc = MACHINE_GET_CLASS(ms);
> >      bool r = false;
> >
> > +    prop = object_property_find(object_get_objects_root(), mc->default_ram_id);
> > +    if (prop) {
> > +        error_report("Memory backend id conflicts with default_ram_id %s",
> > +                     mc->default_ram_id);
>
> maybe something like this would be better:
>  A memory backend with id '%s' already exists, cannot create default RAM backend with the same id.
>  Either change id of the offending backend or provide system RAM backend explicitly using
>  '-machine memory-backend' option.
>

Thanks, I will modify it.

>
> > +        exit(EXIT_FAILURE);
> > +    }
> > +
> >      obj = object_new(path ? TYPE_MEMORY_BACKEND_FILE : TYPE_MEMORY_BACKEND_RAM);
> >      if (path) {
> >          if (!object_property_set_str(obj, "mem-path", path, errp)) {
>
>


-- 

Best Regards
-Li

