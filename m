Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 025246869AD
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 16:13:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNEmQ-0002Wz-Eo; Wed, 01 Feb 2023 10:12:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=Q3mX=55=zx2c4.com=Jason@kernel.org>)
 id 1pNEmH-0002Ti-TE
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 10:12:02 -0500
Received: from ams.source.kernel.org ([145.40.68.75])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=Q3mX=55=zx2c4.com=Jason@kernel.org>)
 id 1pNEmD-0003NN-OX
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 10:11:59 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5AFE6B821B0
 for <qemu-devel@nongnu.org>; Wed,  1 Feb 2023 15:11:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA4F3C433D2
 for <qemu-devel@nongnu.org>; Wed,  1 Feb 2023 15:11:50 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="UWp8O0+L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1675264307;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hrhqEye/Hb9y5T49/AWDdkcbQWiHJ+ZQpN8KFYTHIfs=;
 b=UWp8O0+L9iz1wrX0PvRzXvTjRlKuAjdgO8KwHoqVIoUwZZcCjIzyOFWjpDOpw0SeLMieI9
 ZWlPCuT1uPbOM9pz4MHMH7qeeEo1m7W5LklnUeHIPiCrbpf6OHf5iV4UhcU02LkSkDQojW
 nrq3zH6RnHvYeI2qZmVzW/wtdYWZdv8=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 73559a84
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Wed, 1 Feb 2023 15:11:47 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id d132so22721753ybb.5
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 07:11:47 -0800 (PST)
X-Gm-Message-State: AO0yUKXSNRChD+uMjHAP7orub0rHrwptJ1nqvmuBLZi8JSkQTXUOYF97
 lTfhwnvn+y7LBZkzdO+imV43bnzzhALz0sr3TPI=
X-Google-Smtp-Source: AK7set/N+z+PEyhj0rRbbGJoQk4V8XgMENWEmJIdSK0MP3NuUXEP0id8ibd5dGobCBLJZoV76m9EsvMcgDpA8eWRvrM=
X-Received: by 2002:a25:910:0:b0:83e:bd63:6dd7 with SMTP id
 16-20020a250910000000b0083ebd636dd7mr322643ybj.24.1675264305979; Wed, 01 Feb
 2023 07:11:45 -0800 (PST)
MIME-Version: 1.0
References: <da39abab9785aea2a2e7652ed6403b6268aeb31f.camel@linux.ibm.com>
In-Reply-To: <da39abab9785aea2a2e7652ed6403b6268aeb31f.camel@linux.ibm.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 1 Feb 2023 10:10:21 -0500
X-Gmail-Original-Message-ID: <CAHmME9ouTTk1ONXm276CwunOpy=MAW1Q79x25kcQv=YJTZ88dQ@mail.gmail.com>
Message-ID: <CAHmME9ouTTk1ONXm276CwunOpy=MAW1Q79x25kcQv=YJTZ88dQ@mail.gmail.com>
Subject: Re: [PATCH] x86: fix q35 kernel measurements broken due to rng seeding
To: jejb@linux.ibm.com
Cc: QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 DOV MURIK <Dov.Murik1@il.ibm.com>
Content-Type: multipart/alternative; boundary="000000000000dce8d305f3a4ddac"
Received-SPF: pass client-ip=145.40.68.75;
 envelope-from=SRS0=Q3mX=55=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--000000000000dce8d305f3a4ddac
Content-Type: text/plain; charset="UTF-8"

This is already fixed via the patch that MST just sent in his pull. So wait
a few days for that to be merged and it'll be all set.

No need for this patch here. Do not merge.

On Wed, Feb 1, 2023, 08:57 James Bottomley <jejb@linux.ibm.com> wrote:

> The origin commit for rng seeding 67f7e426e5 ("hw/i386: pass RNG seed
> via setup_data entry") modifies the kernel image file to append a
> random seed.  Obviously this makes the hash of the kernel file
> non-deterministic and so breaks both measured and some signed boots.
> The commit notes it's only for non-EFI (because EFI has a different
> RNG seeding mechanism) so, since there are no non-EFI q35 systems, this
> should be disabled for the whole of the q35 machine type to bring back
> deterministic kernel file hashes.
>
> Obviously this still leaves the legacy bios case broken for at least
> measured boot, but I don't think anyone cares about that now.
>
> Signed-off-by: James Bottomley <jejb@linux.ibm.com>
> ---
>  hw/i386/pc_q35.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index 83c57c6eb1..11e8dd7ca7 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -357,6 +357,7 @@ static void pc_q35_machine_options(MachineClass *m)
>      pcmc->default_nic_model = "e1000e";
>      pcmc->pci_root_uid = 0;
>      pcmc->default_cpu_version = 1;
> +    pcmc->legacy_no_rng_seed = true;
>
>      m->family = "pc_q35";
>      m->desc = "Standard PC (Q35 + ICH9, 2009)";
> @@ -394,9 +395,7 @@ DEFINE_Q35_MACHINE(v7_2, "pc-q35-7.2", NULL,
>
>  static void pc_q35_7_1_machine_options(MachineClass *m)
>  {
> -    PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
>      pc_q35_7_2_machine_options(m);
> -    pcmc->legacy_no_rng_seed = true;
>      compat_props_add(m->compat_props, hw_compat_7_1,
> hw_compat_7_1_len);
>      compat_props_add(m->compat_props, pc_compat_7_1,
> pc_compat_7_1_len);
>  }
> --
> 2.35.3
>
>
>

--000000000000dce8d305f3a4ddac
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">This is already fixed via the patch that MST just sent in=
 his pull. So wait a few days for that to be merged and it&#39;ll be all se=
t.<div dir=3D"auto"><br></div><div dir=3D"auto">No need for this patch here=
. Do not merge.</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed, Feb 1, 2023, 08:57 James Bottomley &lt;<a href=
=3D"mailto:jejb@linux.ibm.com">jejb@linux.ibm.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">The origin commit for rng seeding 67f7e426e5 =
(&quot;hw/i386: pass RNG seed<br>
via setup_data entry&quot;) modifies the kernel image file to append a<br>
random seed.=C2=A0 Obviously this makes the hash of the kernel file<br>
non-deterministic and so breaks both measured and some signed boots.<br>
The commit notes it&#39;s only for non-EFI (because EFI has a different<br>
RNG seeding mechanism) so, since there are no non-EFI q35 systems, this<br>
should be disabled for the whole of the q35 machine type to bring back<br>
deterministic kernel file hashes.<br>
<br>
Obviously this still leaves the legacy bios case broken for at least<br>
measured boot, but I don&#39;t think anyone cares about that now.<br>
<br>
Signed-off-by: James Bottomley &lt;<a href=3D"mailto:jejb@linux.ibm.com" ta=
rget=3D"_blank" rel=3D"noreferrer">jejb@linux.ibm.com</a>&gt;<br>
---<br>
=C2=A0hw/i386/pc_q35.c | 3 +--<br>
=C2=A01 file changed, 1 insertion(+), 2 deletions(-)<br>
<br>
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c<br>
index 83c57c6eb1..11e8dd7ca7 100644<br>
--- a/hw/i386/pc_q35.c<br>
+++ b/hw/i386/pc_q35.c<br>
@@ -357,6 +357,7 @@ static void pc_q35_machine_options(MachineClass *m)<br>
=C2=A0 =C2=A0 =C2=A0pcmc-&gt;default_nic_model =3D &quot;e1000e&quot;;<br>
=C2=A0 =C2=A0 =C2=A0pcmc-&gt;pci_root_uid =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0pcmc-&gt;default_cpu_version =3D 1;<br>
+=C2=A0 =C2=A0 pcmc-&gt;legacy_no_rng_seed =3D true;<br>
<br>
=C2=A0 =C2=A0 =C2=A0m-&gt;family =3D &quot;pc_q35&quot;;<br>
=C2=A0 =C2=A0 =C2=A0m-&gt;desc =3D &quot;Standard PC (Q35 + ICH9, 2009)&quo=
t;;<br>
@@ -394,9 +395,7 @@ DEFINE_Q35_MACHINE(v7_2, &quot;pc-q35-7.2&quot;, NULL,<=
br>
<br>
=C2=A0static void pc_q35_7_1_machine_options(MachineClass *m)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 PCMachineClass *pcmc =3D PC_MACHINE_CLASS(m);<br>
=C2=A0 =C2=A0 =C2=A0pc_q35_7_2_machine_options(m);<br>
-=C2=A0 =C2=A0 pcmc-&gt;legacy_no_rng_seed =3D true;<br>
=C2=A0 =C2=A0 =C2=A0compat_props_add(m-&gt;compat_props, hw_compat_7_1,<br>
hw_compat_7_1_len);<br>
=C2=A0 =C2=A0 =C2=A0compat_props_add(m-&gt;compat_props, pc_compat_7_1,<br>
pc_compat_7_1_len);<br>
=C2=A0}<br>
-- <br>
2.35.3<br>
<br>
<br>
</blockquote></div>

--000000000000dce8d305f3a4ddac--

