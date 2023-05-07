Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC2D6F9C77
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 00:24:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvmno-0002h1-Gc; Sun, 07 May 2023 18:24:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1pvmnl-0002gX-HD
 for qemu-devel@nongnu.org; Sun, 07 May 2023 18:24:21 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1pvmnj-00015D-Gw
 for qemu-devel@nongnu.org; Sun, 07 May 2023 18:24:21 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-55b7630a736so58065067b3.1
 for <qemu-devel@nongnu.org>; Sun, 07 May 2023 15:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1683498258; x=1686090258;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mFmtnCFO6pZOFL/qEUGAJZUUJtumflQl9Zx3XikO00E=;
 b=1JIFCNqHEiu5bP+Y0T+JTrgnBQanqiDYgle6+BfDvkMI57frTDRi2LCXAK7bUIHDIV
 8HrbevJgv89+IvHmw1281G8nCW9rAy5nhP4d/LhlT4c1h3RfBLbGFjjKkLnym5X5y9CX
 9QEgULXgAp9d4CXftewsc6BOnB4vBRj9Zqtur2TL4zRrlrothDQm9QaIr2Ca79/0e8gc
 9s/B7DU0VIGqq407FInr5R0xjopdv0rnr8pREpfsoy7qywG8sooq1AhG3f1qDU0jtoea
 mE/yK+4gODr/zJJQSsyzKxHDqiZcTZyZVyK0djH7LIXtI7YA7XiD0HBu6cylf1zrTAQ0
 esdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683498258; x=1686090258;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mFmtnCFO6pZOFL/qEUGAJZUUJtumflQl9Zx3XikO00E=;
 b=VC9nbTHcu+TKuH5zyLJTV3q6y4JBUxeTmP1uziAmBR7DbuA+opzxFP3MhffgxjPDfA
 9pPzmlKCBlDUK7rLxjs435Pz0UkbpMN3e6SIHv8yEIHGtSOEYIfkfu1jht/VK1aT5jgv
 o3geDhY5qMlk0wSyx8YU+3ZQie6QCAORUnoZ7tLuBsBcXFIArIZFZTkYQGZisANWxwQw
 KinfGRMb6whfJOBfpArwxXR6kI/o0FtCIgxOKfvD5s89WLtZTWzz5QpneQRQg0W8EHTR
 ba6mmzEcpeWcG91eTDqxBxdW9TL4Tdyq9QuMq7smbIzBpMMM6X9t9uszbmbMQtT5YZOl
 XrzA==
X-Gm-Message-State: AC+VfDyfTZqig8LbjXYPcO0B8g51po2HitPOnQGqUihVjkztdOiIIK/a
 5g4EfQBTuhn3bBAkl+g+FbmWRzl+0yum9VA4RZ7szw==
X-Google-Smtp-Source: ACHHUZ5PpHOQTQR9M77PfK/tV1lzQJMa5yeKQH88W9sjxexnrKU8Y/k9Q8VR7Voc7GB7RWo9/kfVzZNHdc4d5o8/EVI=
X-Received: by 2002:a0d:ccd8:0:b0:55a:9b5a:1d9f with SMTP id
 o207-20020a0dccd8000000b0055a9b5a1d9fmr9533893ywd.11.1683498258381; Sun, 07
 May 2023 15:24:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230501072101.22890-1-andrew@daynix.com>
 <20230501072101.22890-5-andrew@daynix.com>
 <ZFJA63EuoIHU1uIG@redhat.com>
In-Reply-To: <ZFJA63EuoIHU1uIG@redhat.com>
From: Andrew Melnichenko <andrew@daynix.com>
Date: Mon, 8 May 2023 01:05:39 +0300
Message-ID: <CABcq3pGs4uPc3JF3Tau2k7gnyaSe4DCayEgAbieAVZkk+zf3Vw@mail.gmail.com>
Subject: Re: [PATCH 4/5] qmp: Added new command to retrieve eBPF blob.
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: jasowang@redhat.com, mst@redhat.com, armbru@redhat.com, eblake@redhat.com, 
 qemu-devel@nongnu.org, yuri.benditovich@daynix.com, yan@daynix.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2607:f8b0:4864:20::1129;
 envelope-from=andrew@daynix.com; helo=mail-yw1-x1129.google.com
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

On Wed, May 3, 2023 at 2:09=E2=80=AFPM Daniel P. Berrang=C3=A9 <berrange@re=
dhat.com> wrote:
>
> On Mon, May 01, 2023 at 10:21:00AM +0300, Andrew Melnychenko wrote:
> > Added command "request-ebpf". This command returns
> > eBPF program encoded base64. The program taken from the
> > skeleton and essentially is an ELF object that can be
> > loaded in the future with libbpf.
> >
> > Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
> > ---
> >  monitor/qmp-cmds.c | 16 ++++++++++++++++
> >  qapi/misc.json     | 28 ++++++++++++++++++++++++++++
> >  2 files changed, 44 insertions(+)
> >
> > diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
> > index b0f948d3376..f7641bb55b9 100644
> > --- a/monitor/qmp-cmds.c
> > +++ b/monitor/qmp-cmds.c
> > @@ -32,6 +32,7 @@
> >  #include "hw/mem/memory-device.h"
> >  #include "hw/intc/intc.h"
> >  #include "hw/rdma/rdma.h"
> > +#include "ebpf/ebpf.h"
> >
> >  NameInfo *qmp_query_name(Error **errp)
> >  {
> > @@ -209,3 +210,18 @@ static void __attribute__((__constructor__)) monit=
or_init_qmp_commands(void)
> >                           qmp_marshal_qmp_capabilities,
> >                           QCO_ALLOW_PRECONFIG, 0);
> >  }
> > +
> > +EbpfObject *qmp_request_ebpf(const char *id, Error **errp)
> > +{
> > +    EbpfObject *ret =3D NULL;
> > +    size_t size =3D 0;
> > +    const void *data =3D ebpf_find_binary_by_id(id, &size, errp);
> > +    if (!data) {
> > +        return NULL;
> > +    }
> > +
> > +    ret =3D g_new0(EbpfObject, 1);
> > +    ret->object =3D g_base64_encode(data, size);
> > +
> > +    return ret;
> > +}
> > diff --git a/qapi/misc.json b/qapi/misc.json
> > index 6ddd16ea283..81613fd1b13 100644
> > --- a/qapi/misc.json
> > +++ b/qapi/misc.json
> > @@ -618,3 +618,31 @@
> >  { 'event': 'VFU_CLIENT_HANGUP',
> >    'data': { 'vfu-id': 'str', 'vfu-qom-path': 'str',
> >              'dev-id': 'str', 'dev-qom-path': 'str' } }
> > +
> > +##
> > +# @EbpfObject:
> > +#
> > +# Structure that holds eBPF ELF object encoded in base64.
> > +#
> > +# Since: 8.1
> > +#
> > +##
> > +{ 'struct': 'EbpfObject',
> > +  'data': {'object': 'str'} }
> > +
> > +##
> > +# @request-ebpf:
> > +#
> > +# Function returns eBPF object that can be loaded with libbpf.
> > +# Management applications (g.e. libvirt) may load it and pass file
> > +# descriptors to QEMU. Which allows running QEMU without BPF capabilit=
ies.
> > +#
> > +# Returns: RSS eBPF object encoded in base64.
> > +#
> > +# Since: 8.1
> > +#
> > +##
> > +{ 'command': 'request-ebpf',
> > +  'data': { 'id': 'str' },
>
> Since the number of EBPF program IDs is finite and known at build
> time, I think we'd be better using an enum instead of str. That
> will let apps introspect the QAPI schema to query whether the
> particular EBPF program ID is known to this version fo QEMU.
>

I've researched that issue a bit. I'll add the qapi enum.

> > +  'returns': 'EbpfObject' }
> > +
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

