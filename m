Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A9A5FA417
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 21:23:47 +0200 (CEST)
Received: from localhost ([::1]:60670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohyNN-000208-MF
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 15:23:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ohwzZ-00063t-3D
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:55:05 -0400
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f]:46768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ohwzW-0003cT-02
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:55:04 -0400
Received: by mail-il1-x12f.google.com with SMTP id a2so5985383iln.13
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 10:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=AUG4Nq8CrcLKuHEeKG8XjxYNAOAnVVWBVw2eP2GyseI=;
 b=s9lt2GLJoE7Wfysoo2RBl4i0aCjgc34gVZStAF13/jr2bQvBhUcoglAAqaqj4yrher
 JiKIA7kEqKMswzfG0z2pbptXrp4bAmMj3gExHB2PPrOUV2+Pe7OJbsPNlvFt1DxZ6/II
 TE8bG+44mVZaqOHZho9ehHrSbhbapH2jd9+3V8p5GhKl9UKD53i0dXAaVWpT2M1uDPSn
 rISp+5lUloxwaIzWXYoRmJc2W2Ntl4pesYtfYhcGNjf3WqaSs29RU1rXx8pfDdorevcR
 9s6Go2jJMc4MjFqh01NtgUEPFm2wDBEL8u3Pvt9gJkzZcsfjsT2mkb3WDYkTJwKQuS6a
 jXTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AUG4Nq8CrcLKuHEeKG8XjxYNAOAnVVWBVw2eP2GyseI=;
 b=PWXVrO9plE4JW6nDRsKk04x32qCUNyBpphLyWD+hciB/g5pdJBK9w5Ra1YzbGNQW6X
 FyZ9PKtiA7cTs6Z0RzBMtatV9d08yp6x3etWI5/gYo5V3AyzLjv9UGYPgWM60D58j06D
 MCo1W+SXI0V0cGCzMVXDWw9Po3cbOi5jWOIYBEV/v12y02dU4PMjb55ZeAtdfRTauJgF
 lug9DiB3JrunYuOBCfLSDoY0ZT1eysB9xJq+38jcgkfqSJ4zsTkPH5nZNN5kt23qxZ/B
 JuWFfT7BB5wuuyB1xhJCIOvnJaiztsiy6AKF79dj3jF6OkVxxN1TgA6ZD1LYriHDQJgu
 uhog==
X-Gm-Message-State: ACrzQf2/zJagczGt3Lf6z4BnS6KDHosAoo33s29AX8Q/L2lV9HE2MlMp
 RRuKAl/wbiDV82CPMi2RYFrKhH4mMSQgLH2+aDG4Pg==
X-Google-Smtp-Source: AMsMyM7jZr9mXNM/ceYsOiKNCoPUQaqTKPZ6nbf1QskrkM7LxWfKxIhO0kYyHEgX1Qt3YOjyuvv1j11wBq3/EcRXFFQ=
X-Received: by 2002:a92:2601:0:b0:2fc:48be:e77a with SMTP id
 n1-20020a922601000000b002fc48bee77amr2499423ile.202.1665424500188; Mon, 10
 Oct 2022 10:55:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220831045311.33083-1-ani@anisinha.ca>
 <CAARzgwz8vFEs06U--LWuFrXO_oN3beynysedMxpDZ6EFpJDXQg@mail.gmail.com>
In-Reply-To: <CAARzgwz8vFEs06U--LWuFrXO_oN3beynysedMxpDZ6EFpJDXQg@mail.gmail.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Mon, 10 Oct 2022 23:24:49 +0530
Message-ID: <CAARzgwyfAFZAawL8zY2assm0nKcFbi40AGO4381CAHBo1CdtxQ@mail.gmail.com>
Subject: Re: [PATCH REPOST] hw/i386/e820: remove legacy reserved entries for
 e820
To: Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>, Sergio Lopez <slp@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000bc057605eab1db45"
Received-SPF: none client-ip=2607:f8b0:4864:20::12f;
 envelope-from=ani@anisinha.ca; helo=mail-il1-x12f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

--000000000000bc057605eab1db45
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 7, 2022 at 18:18 Ani Sinha <ani@anisinha.ca> wrote:

> On Wed, Aug 31, 2022 at 10:23 AM Ani Sinha <ani@anisinha.ca> wrote:
> >
> > e820 reserved entries were used before the dynamic entries with fw
> config files
> > were intoduced. Please see the following change:
> > 7d67110f2d9a6("pc: add etc/e820 fw_cfg file")
> >
> > Identical support was introduced into seabios as well with the following
> commit:
> > ce39bd4031820 ("Add support for etc/e820 fw_cfg file")
> >
> > Both the above commits are now quite old. QEMU machines 1.7 and newer no
> longer
> > use the reserved entries. Seabios uses fw config files and
> > dynamic e820 entries by default and only falls back to using reserved
> entries
> > when it has to work with old qemu (versions earlier than 1.7). Please see
> > functions qemu_cfg_e820() and qemu_early_e820(). It is safe to remove
> legacy
> > FW_CFG_E820_TABLE and associated code now as QEMU 7.0 has deprecated
> i440fx
> > machines 1.7 and older. It would be incredibly rare to run the latest
> qemu
> > version with a very old version of seabios that did not support fw
> config files
> > for e820.
> >
> > As far as I could see, edk2/ovfm never supported reserved entries and
> uses fw
> > config files from the beginning. So there should be no incompatibilities
> with
> > ovfm as well.
> >
> > CC: Gerd Hoffmann <kraxel@redhat.com>
> > Signed-off-by: Ani Sinha <ani@anisinha.ca>
> > Acked-by: Gerd Hoffmann <kraxel@redhat.com>
>
> michael, please pick this one as well for the next pull. thanks.


Michael, seems you kissed this one.


>
> > ---
> >  hw/i386/e820_memory_layout.c | 20 +-------------------
> >  hw/i386/e820_memory_layout.h |  8 --------
> >  hw/i386/fw_cfg.c             |  3 ---
> >  hw/i386/fw_cfg.h             |  1 -
> >  hw/i386/microvm.c            |  2 --
> >  5 files changed, 1 insertion(+), 33 deletions(-)
> >
> > Please see:
> >
> https://patchwork.ozlabs.org/project/qemu-devel/patch/20220420043904.1225153-1-ani@anisinha.ca/
> > for the previous post. Now that we are in 7.2 devel cycle, time to push
> > this patch.
> >
> > diff --git a/hw/i386/e820_memory_layout.c b/hw/i386/e820_memory_layout.c
> > index bcf9eaf837..06970ac44a 100644
> > --- a/hw/i386/e820_memory_layout.c
> > +++ b/hw/i386/e820_memory_layout.c
> > @@ -11,29 +11,11 @@
> >  #include "e820_memory_layout.h"
> >
> >  static size_t e820_entries;
> > -struct e820_table e820_reserve;
> >  struct e820_entry *e820_table;
> >
> >  int e820_add_entry(uint64_t address, uint64_t length, uint32_t type)
> >  {
> > -    int index = le32_to_cpu(e820_reserve.count);
> > -    struct e820_entry *entry;
> > -
> > -    if (type != E820_RAM) {
> > -        /* old FW_CFG_E820_TABLE entry -- reservations only */
> > -        if (index >= E820_NR_ENTRIES) {
> > -            return -EBUSY;
> > -        }
> > -        entry = &e820_reserve.entry[index++];
> > -
> > -        entry->address = cpu_to_le64(address);
> > -        entry->length = cpu_to_le64(length);
> > -        entry->type = cpu_to_le32(type);
> > -
> > -        e820_reserve.count = cpu_to_le32(index);
> > -    }
> > -
> > -    /* new "etc/e820" file -- include ram too */
> > +    /* new "etc/e820" file -- include ram and reserved entries */
> >      e820_table = g_renew(struct e820_entry, e820_table, e820_entries +
> 1);
> >      e820_table[e820_entries].address = cpu_to_le64(address);
> >      e820_table[e820_entries].length = cpu_to_le64(length);
> > diff --git a/hw/i386/e820_memory_layout.h b/hw/i386/e820_memory_layout.h
> > index 04f93780f9..7c239aa033 100644
> > --- a/hw/i386/e820_memory_layout.h
> > +++ b/hw/i386/e820_memory_layout.h
> > @@ -16,20 +16,12 @@
> >  #define E820_NVS        4
> >  #define E820_UNUSABLE   5
> >
> > -#define E820_NR_ENTRIES 16
> > -
> >  struct e820_entry {
> >      uint64_t address;
> >      uint64_t length;
> >      uint32_t type;
> >  } QEMU_PACKED __attribute((__aligned__(4)));
> >
> > -struct e820_table {
> > -    uint32_t count;
> > -    struct e820_entry entry[E820_NR_ENTRIES];
> > -} QEMU_PACKED __attribute((__aligned__(4)));
> > -
> > -extern struct e820_table e820_reserve;
> >  extern struct e820_entry *e820_table;
> >
> >  int e820_add_entry(uint64_t address, uint64_t length, uint32_t type);
> > diff --git a/hw/i386/fw_cfg.c b/hw/i386/fw_cfg.c
> > index a283785a8d..72a42f3c66 100644
> > --- a/hw/i386/fw_cfg.c
> > +++ b/hw/i386/fw_cfg.c
> > @@ -36,7 +36,6 @@ const char *fw_cfg_arch_key_name(uint16_t key)
> >          {FW_CFG_ACPI_TABLES, "acpi_tables"},
> >          {FW_CFG_SMBIOS_ENTRIES, "smbios_entries"},
> >          {FW_CFG_IRQ0_OVERRIDE, "irq0_override"},
> > -        {FW_CFG_E820_TABLE, "e820_table"},
> >          {FW_CFG_HPET, "hpet"},
> >      };
> >
> > @@ -127,8 +126,6 @@ FWCfgState *fw_cfg_arch_create(MachineState *ms,
> >  #endif
> >      fw_cfg_add_i32(fw_cfg, FW_CFG_IRQ0_OVERRIDE, 1);
> >
> > -    fw_cfg_add_bytes(fw_cfg, FW_CFG_E820_TABLE,
> > -                     &e820_reserve, sizeof(e820_reserve));
> >      fw_cfg_add_file(fw_cfg, "etc/e820", e820_table,
> >                      sizeof(struct e820_entry) * e820_get_num_entries());
> >
> > diff --git a/hw/i386/fw_cfg.h b/hw/i386/fw_cfg.h
> > index 275f15c1c5..86ca7c1c0c 100644
> > --- a/hw/i386/fw_cfg.h
> > +++ b/hw/i386/fw_cfg.h
> > @@ -17,7 +17,6 @@
> >  #define FW_CFG_ACPI_TABLES      (FW_CFG_ARCH_LOCAL + 0)
> >  #define FW_CFG_SMBIOS_ENTRIES   (FW_CFG_ARCH_LOCAL + 1)
> >  #define FW_CFG_IRQ0_OVERRIDE    (FW_CFG_ARCH_LOCAL + 2)
> > -#define FW_CFG_E820_TABLE       (FW_CFG_ARCH_LOCAL + 3)
> >  #define FW_CFG_HPET             (FW_CFG_ARCH_LOCAL + 4)
> >
> >  FWCfgState *fw_cfg_arch_create(MachineState *ms,
> > diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
> > index 52cafa003d..a591161c02 100644
> > --- a/hw/i386/microvm.c
> > +++ b/hw/i386/microvm.c
> > @@ -324,8 +324,6 @@ static void microvm_memory_init(MicrovmMachineState
> *mms)
> >      fw_cfg_add_i16(fw_cfg, FW_CFG_MAX_CPUS, machine->smp.max_cpus);
> >      fw_cfg_add_i64(fw_cfg, FW_CFG_RAM_SIZE,
> (uint64_t)machine->ram_size);
> >      fw_cfg_add_i32(fw_cfg, FW_CFG_IRQ0_OVERRIDE, 1);
> > -    fw_cfg_add_bytes(fw_cfg, FW_CFG_E820_TABLE,
> > -                     &e820_reserve, sizeof(e820_reserve));
> >      fw_cfg_add_file(fw_cfg, "etc/e820", e820_table,
> >                      sizeof(struct e820_entry) * e820_get_num_entries());
> >
> > --
> > 2.34.1
> >
>

--000000000000bc057605eab1db45
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Sep 7, 2022 at 18:18 Ani Sinha &lt;<a href=3D"mailt=
o:ani@anisinha.ca">ani@anisinha.ca</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;b=
order-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)"=
>On Wed, Aug 31, 2022 at 10:23 AM Ani Sinha &lt;<a href=3D"mailto:ani@anisi=
nha.ca" target=3D"_blank">ani@anisinha.ca</a>&gt; wrote:<br>
&gt;<br>
&gt; e820 reserved entries were used before the dynamic entries with fw con=
fig files<br>
&gt; were intoduced. Please see the following change:<br>
&gt; 7d67110f2d9a6(&quot;pc: add etc/e820 fw_cfg file&quot;)<br>
&gt;<br>
&gt; Identical support was introduced into seabios as well with the followi=
ng commit:<br>
&gt; ce39bd4031820 (&quot;Add support for etc/e820 fw_cfg file&quot;)<br>
&gt;<br>
&gt; Both the above commits are now quite old. QEMU machines 1.7 and newer =
no longer<br>
&gt; use the reserved entries. Seabios uses fw config files and<br>
&gt; dynamic e820 entries by default and only falls back to using reserved =
entries<br>
&gt; when it has to work with old qemu (versions earlier than 1.7). Please =
see<br>
&gt; functions qemu_cfg_e820() and qemu_early_e820(). It is safe to remove =
legacy<br>
&gt; FW_CFG_E820_TABLE and associated code now as QEMU 7.0 has deprecated i=
440fx<br>
&gt; machines 1.7 and older. It would be incredibly rare to run the latest =
qemu<br>
&gt; version with a very old version of seabios that did not support fw con=
fig files<br>
&gt; for e820.<br>
&gt;<br>
&gt; As far as I could see, edk2/ovfm never supported reserved entries and =
uses fw<br>
&gt; config files from the beginning. So there should be no incompatibiliti=
es with<br>
&gt; ovfm as well.<br>
&gt;<br>
&gt; CC: Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" target=3D"_=
blank">kraxel@redhat.com</a>&gt;<br>
&gt; Signed-off-by: Ani Sinha &lt;<a href=3D"mailto:ani@anisinha.ca" target=
=3D"_blank">ani@anisinha.ca</a>&gt;<br>
&gt; Acked-by: Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" targe=
t=3D"_blank">kraxel@redhat.com</a>&gt;<br>
<br>
michael, please pick this one as well for the next pull. thanks.</blockquot=
e><div dir=3D"auto"><br></div><div dir=3D"auto">Michael, seems you kissed t=
his one.</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:=
solid;padding-left:1ex;border-left-color:rgb(204,204,204)" dir=3D"auto"><br=
>
<br>
&gt; ---<br>
&gt;=C2=A0 hw/i386/e820_memory_layout.c | 20 +-------------------<br>
&gt;=C2=A0 hw/i386/e820_memory_layout.h |=C2=A0 8 --------<br>
&gt;=C2=A0 hw/i386/fw_cfg.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
|=C2=A0 3 ---<br>
&gt;=C2=A0 hw/i386/fw_cfg.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
|=C2=A0 1 -<br>
&gt;=C2=A0 hw/i386/microvm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 2 --<br>
&gt;=C2=A0 5 files changed, 1 insertion(+), 33 deletions(-)<br>
&gt;<br>
&gt; Please see:<br>
&gt; <a href=3D"https://patchwork.ozlabs.org/project/qemu-devel/patch/20220=
420043904.1225153-1-ani@anisinha.ca/" rel=3D"noreferrer" target=3D"_blank">=
https://patchwork.ozlabs.org/project/qemu-devel/patch/20220420043904.122515=
3-1-ani@anisinha.ca/</a><br>
&gt; for the previous post. Now that we are in 7.2 devel cycle, time to pus=
h<br>
&gt; this patch.<br>
&gt;<br>
&gt; diff --git a/hw/i386/e820_memory_layout.c b/hw/i386/e820_memory_layout=
.c<br>
&gt; index bcf9eaf837..06970ac44a 100644<br>
&gt; --- a/hw/i386/e820_memory_layout.c<br>
&gt; +++ b/hw/i386/e820_memory_layout.c<br>
&gt; @@ -11,29 +11,11 @@<br>
&gt;=C2=A0 #include &quot;e820_memory_layout.h&quot;<br>
&gt;<br>
&gt;=C2=A0 static size_t e820_entries;<br>
&gt; -struct e820_table e820_reserve;<br>
&gt;=C2=A0 struct e820_entry *e820_table;<br>
&gt;<br>
&gt;=C2=A0 int e820_add_entry(uint64_t address, uint64_t length, uint32_t t=
ype)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 int index =3D le32_to_cpu(e820_reserve.count);<br>
&gt; -=C2=A0 =C2=A0 struct e820_entry *entry;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 if (type !=3D E820_RAM) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* old FW_CFG_E820_TABLE entry -- reserva=
tions only */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (index &gt;=3D E820_NR_ENTRIES) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EBUSY;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 entry =3D &amp;e820_reserve.entry[index++=
];<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 entry-&gt;address =3D cpu_to_le64(address=
);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 entry-&gt;length =3D cpu_to_le64(length);=
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 entry-&gt;type =3D cpu_to_le32(type);<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 e820_reserve.count =3D cpu_to_le32(index)=
;<br>
&gt; -=C2=A0 =C2=A0 }<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 /* new &quot;etc/e820&quot; file -- include ram too */<=
br>
&gt; +=C2=A0 =C2=A0 /* new &quot;etc/e820&quot; file -- include ram and res=
erved entries */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 e820_table =3D g_renew(struct e820_entry, e820_tab=
le, e820_entries + 1);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 e820_table[e820_entries].address =3D cpu_to_le64(a=
ddress);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 e820_table[e820_entries].length =3D cpu_to_le64(le=
ngth);<br>
&gt; diff --git a/hw/i386/e820_memory_layout.h b/hw/i386/e820_memory_layout=
.h<br>
&gt; index 04f93780f9..7c239aa033 100644<br>
&gt; --- a/hw/i386/e820_memory_layout.h<br>
&gt; +++ b/hw/i386/e820_memory_layout.h<br>
&gt; @@ -16,20 +16,12 @@<br>
&gt;=C2=A0 #define E820_NVS=C2=A0 =C2=A0 =C2=A0 =C2=A0 4<br>
&gt;=C2=A0 #define E820_UNUSABLE=C2=A0 =C2=A05<br>
&gt;<br>
&gt; -#define E820_NR_ENTRIES 16<br>
&gt; -<br>
&gt;=C2=A0 struct e820_entry {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 uint64_t address;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 uint64_t length;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 uint32_t type;<br>
&gt;=C2=A0 } QEMU_PACKED __attribute((__aligned__(4)));<br>
&gt;<br>
&gt; -struct e820_table {<br>
&gt; -=C2=A0 =C2=A0 uint32_t count;<br>
&gt; -=C2=A0 =C2=A0 struct e820_entry entry[E820_NR_ENTRIES];<br>
&gt; -} QEMU_PACKED __attribute((__aligned__(4)));<br>
&gt; -<br>
&gt; -extern struct e820_table e820_reserve;<br>
&gt;=C2=A0 extern struct e820_entry *e820_table;<br>
&gt;<br>
&gt;=C2=A0 int e820_add_entry(uint64_t address, uint64_t length, uint32_t t=
ype);<br>
&gt; diff --git a/hw/i386/fw_cfg.c b/hw/i386/fw_cfg.c<br>
&gt; index a283785a8d..72a42f3c66 100644<br>
&gt; --- a/hw/i386/fw_cfg.c<br>
&gt; +++ b/hw/i386/fw_cfg.c<br>
&gt; @@ -36,7 +36,6 @@ const char *fw_cfg_arch_key_name(uint16_t key)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {FW_CFG_ACPI_TABLES, &quot;acpi_tabl=
es&quot;},<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {FW_CFG_SMBIOS_ENTRIES, &quot;smbios=
_entries&quot;},<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {FW_CFG_IRQ0_OVERRIDE, &quot;irq0_ov=
erride&quot;},<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 {FW_CFG_E820_TABLE, &quot;e820_table&quot=
;},<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {FW_CFG_HPET, &quot;hpet&quot;},<br>
&gt;=C2=A0 =C2=A0 =C2=A0 };<br>
&gt;<br>
&gt; @@ -127,8 +126,6 @@ FWCfgState *fw_cfg_arch_create(MachineState *ms,<b=
r>
&gt;=C2=A0 #endif<br>
&gt;=C2=A0 =C2=A0 =C2=A0 fw_cfg_add_i32(fw_cfg, FW_CFG_IRQ0_OVERRIDE, 1);<b=
r>
&gt;<br>
&gt; -=C2=A0 =C2=A0 fw_cfg_add_bytes(fw_cfg, FW_CFG_E820_TABLE,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&amp;e820_reserve, sizeof(e820_reserve));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 fw_cfg_add_file(fw_cfg, &quot;etc/e820&quot;, e820=
_table,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 sizeof(struct e820_entry) * e820_get_num_entries());<br>
&gt;<br>
&gt; diff --git a/hw/i386/fw_cfg.h b/hw/i386/fw_cfg.h<br>
&gt; index 275f15c1c5..86ca7c1c0c 100644<br>
&gt; --- a/hw/i386/fw_cfg.h<br>
&gt; +++ b/hw/i386/fw_cfg.h<br>
&gt; @@ -17,7 +17,6 @@<br>
&gt;=C2=A0 #define FW_CFG_ACPI_TABLES=C2=A0 =C2=A0 =C2=A0 (FW_CFG_ARCH_LOCA=
L + 0)<br>
&gt;=C2=A0 #define FW_CFG_SMBIOS_ENTRIES=C2=A0 =C2=A0(FW_CFG_ARCH_LOCAL + 1=
)<br>
&gt;=C2=A0 #define FW_CFG_IRQ0_OVERRIDE=C2=A0 =C2=A0 (FW_CFG_ARCH_LOCAL + 2=
)<br>
&gt; -#define FW_CFG_E820_TABLE=C2=A0 =C2=A0 =C2=A0 =C2=A0(FW_CFG_ARCH_LOCA=
L + 3)<br>
&gt;=C2=A0 #define FW_CFG_HPET=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0(FW_CFG_ARCH_LOCAL + 4)<br>
&gt;<br>
&gt;=C2=A0 FWCfgState *fw_cfg_arch_create(MachineState *ms,<br>
&gt; diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c<br>
&gt; index 52cafa003d..a591161c02 100644<br>
&gt; --- a/hw/i386/microvm.c<br>
&gt; +++ b/hw/i386/microvm.c<br>
&gt; @@ -324,8 +324,6 @@ static void microvm_memory_init(MicrovmMachineStat=
e *mms)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 fw_cfg_add_i16(fw_cfg, FW_CFG_MAX_CPUS, machine-&g=
t;smp.max_cpus);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 fw_cfg_add_i64(fw_cfg, FW_CFG_RAM_SIZE, (uint64_t)=
machine-&gt;ram_size);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 fw_cfg_add_i32(fw_cfg, FW_CFG_IRQ0_OVERRIDE, 1);<b=
r>
&gt; -=C2=A0 =C2=A0 fw_cfg_add_bytes(fw_cfg, FW_CFG_E820_TABLE,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&amp;e820_reserve, sizeof(e820_reserve));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 fw_cfg_add_file(fw_cfg, &quot;etc/e820&quot;, e820=
_table,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 sizeof(struct e820_entry) * e820_get_num_entries());<br>
&gt;<br>
&gt; --<br>
&gt; 2.34.1<br>
&gt;<br>
</blockquote></div></div>

--000000000000bc057605eab1db45--

