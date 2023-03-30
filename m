Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 107076D02FE
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 13:21:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phqKM-00036Y-SD; Thu, 30 Mar 2023 07:20:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1phqKE-0002vl-0E
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 07:20:14 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1phqKB-0005lj-G8
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 07:20:13 -0400
Received: by mail-pg1-x533.google.com with SMTP id k15so11069612pgt.10
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 04:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112; t=1680175210;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wAY/F84NlaORXXC45idlmMzw9UB2BeTyrfHaWU/WpSo=;
 b=oC0Vmi/OjI44WRSahGRmojlOGnHDRR2NqrzloXNogaTJbXZ+qi8DL19+H8Yr3wBDL3
 YoiNiBpalMlVA+fZyAq0j+UQO8SWsS0PWFicxkE4cNQ+cMnQtK801adCL5fObYp1fjXn
 v3rlx72cf5KSvZlAHElkI2qqIG1HGT43MF37+q1nG99qbqv65DuBxoNiOPc9Sr0cBvB1
 mlKPdEbSk+nJQiO69JrT+j75FNgZRGHrKHGXJ5fi2XIS1Z7a6ID+EjvnFH+5nBqMe/zs
 glw2yzeg9j97eDhHLLqf8igcvqzkOqooysQZ2p2SVl6tR9RkCyBlzT2UUPJ2o7sTDJi+
 2xRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680175210;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wAY/F84NlaORXXC45idlmMzw9UB2BeTyrfHaWU/WpSo=;
 b=7UyxohEIgpO1iGuw/3EH2TM1Cb10vv7lNgZNWZYrX967GST9g/pQd8EsUTbpcD+bdM
 8M3C/IQL5oByVE1aGShLsVIMjfXv8euYxrYN/60suhPI782ws4Qllgt+RwsrenAJqNdY
 XaJxcLtG3e9fLjAE5CWxGtsRawgW9vXUhT4SwdA4a1dom68T6naRFYYCXPerz+tsf2F/
 5FRl/T/16zKuP1FR3yYCgRXcEGQVFMdGdi+hjB0wjlEILyFjqZP9CqjXSJYQYj2gR3ig
 LUblEsIXLGyu1lKGMYTNMmH/61L5jKBui0wftPwwNhlzmYrONaLiXZrATdB5wftAN4/f
 pTTQ==
X-Gm-Message-State: AAQBX9cW8NDOPJn/U+p0eT10fNTRconYv5OKKIjQAPoy1FnqHaJ41V3i
 Tcr+LWnihNQ6LiIn/zvbqu2m72frWkSbmc0DgZXXCA==
X-Google-Smtp-Source: AKy350YXfyMjvqhCj2fxt7yY0DtZy5Eil5za2x3o0HyLVXtFypRShF6IW79T/BdkajCZwG8W1N/uoTUGwsXxS9xYPZ4=
X-Received: by 2002:a63:f46:0:b0:507:4697:392d with SMTP id
 6-20020a630f46000000b005074697392dmr6305121pgp.7.1680175209703; Thu, 30 Mar
 2023 04:20:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230330001522.120774-1-andrew@daynix.com>
 <20230330001522.120774-4-andrew@daynix.com>
 <ZCVJQlCXQpWMwmP9@redhat.com>
In-Reply-To: <ZCVJQlCXQpWMwmP9@redhat.com>
From: Andrew Melnichenko <andrew@daynix.com>
Date: Thu, 30 Mar 2023 14:02:17 +0300
Message-ID: <CABcq3pHUC2-qntoJFqK=CEmGwceUf7R19-=bP1pm5PuHv6ui-w@mail.gmail.com>
Subject: Re: [RFC PATCH 3/5] ebpf: Added declaration/initialization routines.
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: jasowang@redhat.com, mst@redhat.com, pbonzini@redhat.com, 
 marcandre.lureau@redhat.com, thuth@redhat.com, philmd@linaro.org, 
 armbru@redhat.com, eblake@redhat.com, qemu-devel@nongnu.org, toke@redhat.com, 
 mprivozn@redhat.com, yuri.benditovich@daynix.com, yan@daynix.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2607:f8b0:4864:20::533;
 envelope-from=andrew@daynix.com; helo=mail-pg1-x533.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On Thu, Mar 30, 2023 at 11:33=E2=80=AFAM Daniel P. Berrang=C3=A9 <berrange@=
redhat.com> wrote:
>
> On Thu, Mar 30, 2023 at 03:15:20AM +0300, Andrew Melnychenko wrote:
> > Now, the binary objects may be retrieved by id/name.
> > It would require for future qmp commands that may require specific
> > eBPF blob.
> >
> > Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
> > ---
> >  ebpf/ebpf.c      | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
> >  ebpf/ebpf.h      | 25 +++++++++++++++++++++++++
> >  ebpf/ebpf_rss.c  |  4 ++++
> >  ebpf/meson.build |  1 +
> >  4 files changed, 78 insertions(+)
> >  create mode 100644 ebpf/ebpf.c
> >  create mode 100644 ebpf/ebpf.h
> >
> > diff --git a/ebpf/ebpf.c b/ebpf/ebpf.c
> > new file mode 100644
> > index 0000000000..86320d72f5
> > --- /dev/null
> > +++ b/ebpf/ebpf.c
> > @@ -0,0 +1,48 @@
> > +/*
> > + * QEMU eBPF binary declaration routine.
> > + *
> > + * Developed by Daynix Computing LTD (http://www.daynix.com)
> > + *
> > + * Authors:
> > + *  Andrew Melnychenko <andrew@daynix.com>
> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2 or
> > + * later.  See the COPYING file in the top-level directory.
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include "qemu/queue.h"
> > +#include "ebpf/ebpf.h"
> > +
> > +struct ElfBinaryDataEntry {
> > +    const char *id;
> > +    const void * (*fn)(size_t *);
>
> It feels odd to be storing the function there, as that's just
> an artifact of how the EBPF rss program is acquired. IMHO
> this should just be
>
>    const void *data;
>    size_t datalen;
>

Yeah, have an idea to store data/size instead. the skeleton provides
them in function,
didn't want to make dirty hacks for the constructor. So I've passed
the function straight to
the structure.

> > +
> > +    QSLIST_ENTRY(ElfBinaryDataEntry) node;
> > +};
> > +
> > +static QSLIST_HEAD(, ElfBinaryDataEntry) ebpf_elf_obj_list =3D
> > +                                            QSLIST_HEAD_INITIALIZER();
> > +
> > +void ebpf_register_binary_data(const char *id, const void * (*fn)(size=
_t *))
> > +{
> > +    struct ElfBinaryDataEntry *data =3D NULL;
> > +
> > +    data =3D g_malloc0(sizeof(*data));
>
> We prefer g_new0 over g_malloc and initialize when declaring eg
>
>     struct ElfBinaryDataEntry *data =3D g_new0(struct ElfBinaryDataEntry,=
 1);
>

Ok, thank you.

> > +    data->fn =3D fn;
> > +    data->id =3D id;
> > +
> > +    QSLIST_INSERT_HEAD(&ebpf_elf_obj_list, data, node);
> > +}
> > +
> > +const void *ebpf_find_binary_by_id(const char *id, size_t *sz)
> > +{
> > +    struct ElfBinaryDataEntry *it =3D NULL;
> > +    QSLIST_FOREACH(it, &ebpf_elf_obj_list, node) {
> > +        if (strcmp(id, it->id) =3D=3D 0) {
> > +            return it->fn(sz);
> > +        }
> > +    }
> > +
> > +    return NULL;
> > +}
> > diff --git a/ebpf/ebpf.h b/ebpf/ebpf.h
> > new file mode 100644
> > index 0000000000..fd705cb73e
> > --- /dev/null
> > +++ b/ebpf/ebpf.h
> > @@ -0,0 +1,25 @@
> > +/*
> > + * QEMU eBPF binary declaration routine.
> > + *
> > + * Developed by Daynix Computing LTD (http://www.daynix.com)
> > + *
> > + * Authors:
> > + *  Andrew Melnychenko <andrew@daynix.com>
> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2 or
> > + * later.  See the COPYING file in the top-level directory.
> > + */
> > +
> > +#ifndef EBPF_H
> > +#define EBPF_H
> > +
> > +void ebpf_register_binary_data(const char *id, const void * (*fn)(size=
_t *));
>
> IMHO it would be better as
>
> void ebpf_register_binary_data(const char *id, const void *data, size_t d=
atalen);
>
>
> > +const void *ebpf_find_binary_by_id(const char *id, size_t *sz);
> > +
> > +#define ebpf_binary_init(id, fn)                                      =
     \
> > +static void __attribute__((constructor)) ebpf_binary_init_ ## fn(void)=
     \
> > +{                                                                     =
     \
> > +    ebpf_register_binary_data(id, fn);                                =
     \
>
> size_t datalen;
> const void *data =3D fn(&datalen);
> ebpf_register_binary_data(oid, data, datalen);
>

Yeah, it can work like that. For some reason, I want that register
function and the constructor
have the same call/mention.

>
> > +}
> > +
> > +#endif /* EBPF_H */
> > diff --git a/ebpf/ebpf_rss.c b/ebpf/ebpf_rss.c
> > index 08015fecb1..b4038725f2 100644
> > --- a/ebpf/ebpf_rss.c
> > +++ b/ebpf/ebpf_rss.c
> > @@ -21,6 +21,8 @@
> >
> >  #include "ebpf/ebpf_rss.h"
> >  #include "ebpf/rss.bpf.skeleton.h"
> > +#include "ebpf/ebpf.h"
> > +
> >  #include "trace.h"
> >
> >  void ebpf_rss_init(struct EBPFRSSContext *ctx)
> > @@ -237,3 +239,5 @@ void ebpf_rss_unload(struct EBPFRSSContext *ctx)
> >      ctx->obj =3D NULL;
> >      ctx->program_fd =3D -1;
> >  }
> > +
> > +ebpf_binary_init("rss", rss_bpf__elf_bytes)
> > diff --git a/ebpf/meson.build b/ebpf/meson.build
> > index 2dd0fd8948..67c3f53aa9 100644
> > --- a/ebpf/meson.build
> > +++ b/ebpf/meson.build
> > @@ -1 +1,2 @@
> > +softmmu_ss.add(files('ebpf.c'))
> >  softmmu_ss.add(when: libbpf, if_true: files('ebpf_rss.c'), if_false: f=
iles('ebpf_rss-stub.c'))
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

