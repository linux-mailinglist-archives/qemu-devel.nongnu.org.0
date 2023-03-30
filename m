Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF6B6D0262
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 13:01:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phq0k-00005d-Em; Thu, 30 Mar 2023 07:00:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1phq0h-00005B-Vw
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 07:00:04 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1phq0f-0001Js-FL
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 07:00:03 -0400
Received: by mail-pg1-x52f.google.com with SMTP id d8so11050812pgm.3
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 04:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112; t=1680174000;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XTiCgZ7xSBFm3gWL4CSeBKzx5O3q/dH0zimA7KxwBQ8=;
 b=mRqOpGdLDWtckAwuGw70abAzbed5cUBaPXO3Of8Q5e+2TVBD26IGsT1p3zqoiLKrll
 Zxatj5/zKCZdkg+vCWHM4lutspzpcQIHyS0xw5X+ciprKCWI066B1WXtNYmwmqPJLBw7
 v41Usb2QZrSx7QrOMcoOAmAoqJzH9CIYAQ9TBj4WCv0PCKGaqR37IeEMa7/d3IPeNHFM
 IlNUcIRiS2i2/r0D7CykGiFiqASwu90Ir9iZ1Fj/fVQ1kOX0Py4MjyiIS5i74IPyXAkY
 R0qqEs5GOf0Gk0YuK5RvxWMbMy1rEyqS1Hu+yHg1+tj1hG39zLnXXW8IoVs3iQeVvmvz
 UYAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680174000;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XTiCgZ7xSBFm3gWL4CSeBKzx5O3q/dH0zimA7KxwBQ8=;
 b=vXs8uXxujEDjO7Ix2zL/0kdOlgtld8uiAAWvH2a8q+xOHaKvD3FW2tLhToxWAXlIOZ
 MjHUxwM5CbtVghjVbuJXhtPK8MXoWTZFHkXU15f9MU03oxSwRy+o4o66cg3wBgP6Vi1x
 Ozp0rPQWecOUvVKJVbo82TJnhJ70HBm3SEof3iaj9irHcQSWw06nCbGdi4FqKZ+f1JLi
 m9r1ntfvu2hnVvHHN+lm7ULRfwNGvgMu4mEBJvREisNjpbl1jKRAPLlTLfO7JeDOZmko
 CFd7QPmStJUMDQKsTKaze5lCjiHEmFKm04Yyj3G+GtIukdFjssH5jmqiWX3551nu7byz
 xZaQ==
X-Gm-Message-State: AAQBX9cwuxOG4bcqgNfT6xqq9HgvRsSxYFruKS8te8KnAl9XFws8o37N
 XrqK/Imt2D+nDxsckJmU0k0Dr8dzN4CShm4QPAe6ow==
X-Google-Smtp-Source: AKy350YIVz94x2xZegDd8PMOpFPlNMqsOEwFiRcaRCyYznNNlz/fAbDF6+3Vp0Iu5SvvX0Z19Cf4rblVkYwYZQXM7Bw=
X-Received: by 2002:a63:f46:0:b0:507:4697:392d with SMTP id
 6-20020a630f46000000b005074697392dmr6284562pgp.7.1680173999749; Thu, 30 Mar
 2023 03:59:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230330001522.120774-1-andrew@daynix.com>
 <20230330001522.120774-5-andrew@daynix.com>
 <ZCVKqvw2i3xmQZWn@redhat.com>
In-Reply-To: <ZCVKqvw2i3xmQZWn@redhat.com>
From: Andrew Melnichenko <andrew@daynix.com>
Date: Thu, 30 Mar 2023 13:42:07 +0300
Message-ID: <CABcq3pFTWFrbQ=WYNOiOBgr0-qX2U7mKqfk6VDF3A3LP00OW5w@mail.gmail.com>
Subject: Re: [RFC PATCH 4/5] qmp: Added new command to retrieve eBPF blob.
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: jasowang@redhat.com, mst@redhat.com, pbonzini@redhat.com, 
 marcandre.lureau@redhat.com, thuth@redhat.com, philmd@linaro.org, 
 armbru@redhat.com, eblake@redhat.com, qemu-devel@nongnu.org, toke@redhat.com, 
 mprivozn@redhat.com, yuri.benditovich@daynix.com, yan@daynix.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2607:f8b0:4864:20::52f;
 envelope-from=andrew@daynix.com; helo=mail-pg1-x52f.google.com
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

On Thu, Mar 30, 2023 at 11:39=E2=80=AFAM Daniel P. Berrang=C3=A9 <berrange@=
redhat.com> wrote:
>
> On Thu, Mar 30, 2023 at 03:15:21AM +0300, Andrew Melnychenko wrote:
> > Added command "request-ebpf". This command returns
> > eBPF program encoded base64. The program taken from the
> > skeleton and essentially is an ELF object that can be
> > loaded in the future with libbpf.
> >
> > Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
> > ---
> >  monitor/qmp-cmds.c | 17 +++++++++++++++++
> >  qapi/misc.json     | 25 +++++++++++++++++++++++++
> >  2 files changed, 42 insertions(+)
> >
> > diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
> > index b0f948d337..8f2fc3e7ec 100644
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
> > @@ -209,3 +210,19 @@ static void __attribute__((__constructor__)) monit=
or_init_qmp_commands(void)
> >                           qmp_marshal_qmp_capabilities,
> >                           QCO_ALLOW_PRECONFIG, 0);
> >  }
> > +
> > +EbpfObject *qmp_request_ebpf(const char *id, Error **errp)
> > +{
> > +    EbpfObject *ret =3D NULL;
> > +    size_t size =3D 0;
> > +    const guchar *data =3D ebpf_find_binary_by_id(id, &size);
>
> "const void *data"  I believe
>
> > +
> > +    if (data) {
> > +        ret =3D g_new0(EbpfObject, 1);
> > +        ret->object =3D g_base64_encode(data, size);
> > +    } else {
> > +        error_setg(errp, "can't find eBPF object with id: %s", id);
>
> I think I'm inclined to say that we should add an 'Error **errp'
> parameter to ebpf_find_binary_by_id(), and make it responsible
> for this error message, such that we get

Ok, I'll add it.

>
>    const void *data  ebpf_find_binary_by_id(id, &size, errp);
>    if (!data) {
>        return NULL;
>    }
>
>    ret =3D g_new0(EbpfObject, 1);
>    ret->object =3D g_base64_encode(data, size);
>    return ret;
>
> > +    }
> > +
> > +    return ret;
> > +}
> > diff --git a/qapi/misc.json b/qapi/misc.json
> > index 6ddd16ea28..4689802460 100644
> > --- a/qapi/misc.json
> > +++ b/qapi/misc.json
> > @@ -618,3 +618,28 @@
> >  { 'event': 'VFU_CLIENT_HANGUP',
> >    'data': { 'vfu-id': 'str', 'vfu-qom-path': 'str',
> >              'dev-id': 'str', 'dev-qom-path': 'str' } }
> > +
> > +##
> > +# @EbpfObject:
> > +#
> > +# Structure that holds eBPF ELF object encoded in base64.
>
> Needs a 'Since' tag

Ah yes, thank you.

>
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
> > +# Since: 7.3
>
> We're about to release 8.0 and so the next will be 8.1

Thanks, I'll update it.

>
> > +#
> > +##
> > +{ 'command': 'request-ebpf',
> > +  'data': { 'id': 'str' },
> > +  'returns': 'EbpfObject' }
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

