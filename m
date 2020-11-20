Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CFE2BAB85
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 14:50:11 +0100 (CET)
Received: from localhost ([::1]:34636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg6ni-0001A9-BS
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 08:50:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kg6m5-0008Eh-L5
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 08:48:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kg6lz-0000Jl-Jq
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 08:48:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605880100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FxMumkYSRCdhpLenugmONa2au9/BNLA7OULT3r2sMfs=;
 b=R8fG/GgFbt8OMIxM++KSnkqnmd5xaCIPsqpOjyfyljW8RtmdKBgb7ynqgeDd7IquMFTBPr
 xALNLbO6Kix2HG73c/cSdi0leR3YL+541gEWZ0eZGeu+LdH2HhV3hbt1+fwV3i3gQ+PFye
 ySpYF6Xzp+rCi/E+n4NEvwSq8xIS48k=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-S9zT90hTOdugBDoWPcfbVQ-1; Fri, 20 Nov 2020 08:48:17 -0500
X-MC-Unique: S9zT90hTOdugBDoWPcfbVQ-1
Received: by mail-oo1-f70.google.com with SMTP id t188so3956043oot.9
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 05:48:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FxMumkYSRCdhpLenugmONa2au9/BNLA7OULT3r2sMfs=;
 b=bZzI9M7s+qOs77PbsK4iWP8fWnuOUwrlYWJHxfX12WGHeAkULGv1Db77SjhA3BU5e1
 cdkUcDFOniVdZZCVrD2kCkMIkpvEfdTYoygQEfzIGUdlthCtZZdk+ml/FQfD/qEBro1t
 VdAmt0rpQ6Lky3breeopcDUEplURstB8m4BviWY/K5gL7kM2SE4x0T/SiIzMuvSaVv+8
 vlFG/LfO5PbK7URm9wzHwwJknfS7GS/QUuQ8wtHjz7w+H3vsXA/HS2x2iaaiqGVywpTJ
 lQj8G5c8T/O0Cf2pYpAD2ukS+ODqzRbmfngkAhmCe264obpgr7GqtDSCdTRxRIRTE2ok
 Ku4w==
X-Gm-Message-State: AOAM533iNMqH9xQqfQh+M8MsiP+zf5g45Tl7dsOfjN6mxvu+ZxTbQa68
 Qcl8/l3QOyTZvPRjSiN2WWpwOvaQOJk92GuJpPWoUfJLfyD33kC02SnuTzN22xvSMG3WaGmA3zl
 qVV9ftx+qa82iwEED0cIhWcnECY8EnKU=
X-Received: by 2002:aca:5654:: with SMTP id k81mr6094870oib.118.1605880096214; 
 Fri, 20 Nov 2020 05:48:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwjSq87ZIiw135R6vv1aMu7fkJ0Mt41W8+af9e/5M5CFp+NP2ZDcUqBMosjtG3P6qZFWGMUXzroT3IDrID0YXo=
X-Received: by 2002:aca:5654:: with SMTP id k81mr6094846oib.118.1605880095891; 
 Fri, 20 Nov 2020 05:48:15 -0800 (PST)
MIME-Version: 1.0
References: <20201013102252.3562860-1-philmd@redhat.com>
 <60f5af9c-4153-7702-cd99-b317a6de89c0@redhat.com>
 <ccf65075-c0e9-7358-f483-2c7fbbd3fb81@redhat.com>
 <fa5ed32a-1553-2490-b266-375a000f0cef@redhat.com>
 <7a130a3e-3ebf-220f-9115-dd121d8782fb@redhat.com>
 <20201120075445-mutt-send-email-mst@kernel.org>
In-Reply-To: <20201120075445-mutt-send-email-mst@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Date: Fri, 20 Nov 2020 14:48:04 +0100
Message-ID: <CAP+75-UPtZUeznz7S1-yQT1WuhiUfDj+O7fAuONhO8VfhUDvZw@mail.gmail.com>
Subject: Re: [PATCH-for-5.2 v2] hw/core/qdev-properties-system: Rewrite
 set_pci_host_devaddr using GLib
To: "Michael S. Tsirkin" <mst@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Geoffrey McRae <geoff@hostfission.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Klaus Herman <kherman@inbox.lv>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 20, 2020 at 1:55 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> On Fri, Nov 20, 2020 at 12:00:56PM +0100, Philippe Mathieu-Daud=C3=83=C2=
=A9 wrote:
> > On 11/17/20 12:16 PM, Philippe Mathieu-Daud=C3=83=C2=A9 wrote:
> > > ping???
> > >
> > > On 11/9/20 3:16 PM, Philippe Mathieu-Daud=C3=83=C2=A9 wrote:
> > >> Cc'ing PCI developers (rc2 is scheduled for tomorrow).
> > >>
> > >> On 11/7/20 9:59 AM, Philippe Mathieu-Daud=C3=83=C2=A9 wrote:
> > >>> Ping for 5.2 as this is a bugfix.
> > >>>
> > >>> On 10/13/20 12:22 PM, Philippe Mathieu-Daud=C3=83=C2=A9 wrote:
> > >>>> set_pci_host_devaddr() is hard to follow, thus bug-prone.
> > >>>> We indeed introduced a bug in commit bccb20c49df, as the
> > >>>> same line might be used to parse a bus (up to 0xff) or a
> > >>>> slot (up to 0x1f). Instead of making things worst, rewrite
> > >>>> using g_strsplit().
> >
> > As there is few interest in fixing the issue with this patch,
> > let me remind the 2 other approaches:
> >
> > Klaus Herman:
> > https://www.mail-archive.com/qemu-devel@nongnu.org/msg750101.html
> > Geoffrey McRae:
> > https://www.mail-archive.com/qemu-devel@nongnu.org/msg758182.html
> >
> > That said, I'm done with this issue for 5.2.
> >
> > Regards,
> >
> > Phil.
>
> What happens if we just revert bccb20c49df1bd683248a366021973901c11982f?
>
> This is what I'm inclined to do for 5.2 ...

Clever, fine by me.

> > >>>> Fixes: bccb20c49df ("Use qemu_strtoul() in set_pci_host_devaddr()"=
)
> > >>>> Reported-by: Klaus Herman <kherman@inbox.lv>
> > >>>> Signed-off-by: Philippe Mathieu-Daud=C3=83=C2=A9 <philmd@redhat.co=
m>
> > >>>> ---
> > >>>> v2: Free g_strsplit() with g_auto(GStrv) (Daniel)
> > >>>> ---
> > >>>>  hw/core/qdev-properties-system.c | 61 ++++++++++++++-------------=
-----
> > >>>>  1 file changed, 27 insertions(+), 34 deletions(-)
> > >>>>
> > >>>> diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-prope=
rties-system.c
> > >>>> index 49bdd125814..36d4fd8b22a 100644
> > >>>> --- a/hw/core/qdev-properties-system.c
> > >>>> +++ b/hw/core/qdev-properties-system.c
> > >>>> @@ -878,11 +878,11 @@ static void set_pci_host_devaddr(Object *obj=
, Visitor *v, const char *name,
> > >>>>      DeviceState *dev =3D DEVICE(obj);
> > >>>>      Property *prop =3D opaque;
> > >>>>      PCIHostDeviceAddress *addr =3D qdev_get_prop_ptr(dev, prop);
> > >>>> -    char *str, *p;
> > >>>> -    const char *e;
> > >>>> +    g_autofree char *str =3D NULL;
> > >>>> +    g_auto(GStrv) col_s0 =3D NULL;
> > >>>> +    g_auto(GStrv) dot_s =3D NULL;
> > >>>> +    char **col_s;
> > >>>>      unsigned long val;
> > >>>> -    unsigned long dom =3D 0, bus =3D 0;
> > >>>> -    unsigned int slot =3D 0, func =3D 0;
> > >>>>
> > >>>>      if (dev->realized) {
> > >>>>          qdev_prop_set_after_realize(dev, name, errp);
> > >>>> @@ -893,57 +893,50 @@ static void set_pci_host_devaddr(Object *obj=
, Visitor *v, const char *name,
> > >>>>          return;
> > >>>>      }
> > >>>>
> > >>>> -    p =3D str;
> > >>>> -    if (qemu_strtoul(p, &e, 16, &val) < 0 || val > 0xffff || e =
=3D=3D p) {
> > >>>> +    col_s =3D col_s0 =3D g_strsplit(str, ":", 3);
> > >>>> +    if (!col_s || !col_s[0] || !col_s[1]) {
> > >>>>          goto inval;
> > >>>>      }
> > >>>> -    if (*e !=3D ':') {
> > >>>> -        goto inval;
> > >>>> -    }
> > >>>> -    bus =3D val;
> > >>>>
> > >>>> -    p =3D (char *)e + 1;
> > >>>> -    if (qemu_strtoul(p, &e, 16, &val) < 0 || val > 0x1f || e =3D=
=3D p) {
> > >>>> -        goto inval;
> > >>>> -    }
> > >>>> -    if (*e =3D=3D ':') {
> > >>>> -        dom =3D bus;
> > >>>> -        bus =3D val;
> > >>>> -        p =3D (char *)e + 1;
> > >>>> -        if (qemu_strtoul(p, &e, 16, &val) < 0 || val > 0x1f || e =
=3D=3D p) {
> > >>>> +    /* domain */
> > >>>> +    if (col_s[2]) {
> > >>>> +        if (qemu_strtoul(col_s[0], NULL, 16, &val) < 0 || val > 0=
xffff) {
> > >>>>              goto inval;
> > >>>>          }
> > >>>> +        addr->domain =3D val;
> > >>>> +        col_s++;
> > >>>> +    } else {
> > >>>> +        addr->domain =3D 0;
> > >>>>      }
> > >>>> -    slot =3D val;
> > >>>>
> > >>>> -    if (*e !=3D '.') {
> > >>>> +    /* bus */
> > >>>> +    if (qemu_strtoul(col_s[0], NULL, 16, &val) < 0 || val > 0xff)=
 {
> > >>>>          goto inval;
> > >>>>      }
> > >>>> -    p =3D (char *)e + 1;
> > >>>> -    if (qemu_strtoul(p, &e, 10, &val) < 0 || val > 7 || e =3D=3D =
p) {
> > >>>> -        goto inval;
> > >>>> -    }
> > >>>> -    func =3D val;
> > >>>> +    addr->bus =3D val;
> > >>>>
> > >>>> -    if (bus > 0xff) {
> > >>>> +    /* <slot>.<func> */
> > >>>> +    dot_s =3D g_strsplit(col_s[1], ".", 2);
> > >>>> +    if (!dot_s || !dot_s[0] || !dot_s[1]) {
> > >>>>          goto inval;
> > >>>>      }
> > >>>>
> > >>>> -    if (*e) {
> > >>>> +    /* slot */
> > >>>> +    if (qemu_strtoul(dot_s[0], NULL, 16, &val) < 0 || val > 0x1f)=
 {
> > >>>>          goto inval;
> > >>>>      }
> > >>>> +    addr->slot =3D val;
> > >>>>
> > >>>> -    addr->domain =3D dom;
> > >>>> -    addr->bus =3D bus;
> > >>>> -    addr->slot =3D slot;
> > >>>> -    addr->function =3D func;
> > >>>> +    /* func */
> > >>>> +    if (qemu_strtoul(dot_s[1], NULL, 10, &val) < 0 || val > 7) {
> > >>>> +        goto inval;
> > >>>> +    }
> > >>>> +    addr->function =3D val;
> > >>>>
> > >>>> -    g_free(str);
> > >>>>      return;
> > >>>>
> > >>>>  inval:
> > >>>>      error_set_from_qdev_prop_error(errp, EINVAL, dev, prop, str);
> > >>>> -    g_free(str);
> > >>>>  }
> > >>>>
> > >>>>  const PropertyInfo qdev_prop_pci_host_devaddr =3D {
> > >>>>
> > >>>
> > >>
> > >
>


