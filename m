Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 855E9387BE8
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 17:05:54 +0200 (CEST)
Received: from localhost ([::1]:34070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj1I9-00026P-88
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 11:05:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thomas.parrott@canonical.com>)
 id 1lj0xL-0001U5-VQ
 for qemu-devel@nongnu.org; Tue, 18 May 2021 10:44:24 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:37680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_CBC_SHA1:128)
 (Exim 4.90_1) (envelope-from <thomas.parrott@canonical.com>)
 id 1lj0xI-0002Qt-Rn
 for qemu-devel@nongnu.org; Tue, 18 May 2021 10:44:23 -0400
Received: from mail-lj1-f200.google.com ([209.85.208.200])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <thomas.parrott@canonical.com>) id 1lj0xG-0004c9-Of
 for qemu-devel@nongnu.org; Tue, 18 May 2021 14:44:18 +0000
Received: by mail-lj1-f200.google.com with SMTP id
 v26-20020a2e481a0000b02900bf48f13296so4605742lja.1
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 07:44:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0mgfC7X1pzfSp4gr1ppfwklCkKy41Czrb1BVkVgk9Sg=;
 b=WBvoVzEMkfrKI8EogzNF1IagF82CoCS1q2ZnvFvq5KbyXzPeb0MIZBa+ZZ+gSRNKqB
 0wPPJ0oJb8zf/fPb/8Uj9qaxjmhDJuGg1KYLeLKMGk89K7p89MvwD/hG9p/aBdp7rRqW
 UUUkElt7DD0aEEnTq8SKT0I1C7YUOPjDAWE7OLtnGfNEuuyaF4U3rrd5UT2iZ4f+pIlQ
 UESIqh93dlIbCXDgg7Y69CDfmRIjsDte87iFSFosIknCoXlz7oyCQnYgPaNAFjGHQ+T4
 YToLGJzE7iyo1C+eV4C17gOF+BGCLHjPFbL1zly+nRZTWqU5Mq72Y8g7iCuK1YfC+k1a
 vCeg==
X-Gm-Message-State: AOAM533gxDMHYjVTKZyrbBLcWpX8Ibr3NjNxu6F0hl8NDbFkxmjtK+/o
 7d6ySIaIbScxqfrxwY6BGpgjc+Liha3QlwLEcNpb/YKe5HWZCd1tFp0y1Mhqc885p0Iysv1we83
 uQLyICxi2VbrCMNs4/PT4HvEyx1whchuwrxLzSj2rQ5JuU44W
X-Received: by 2002:ac2:4f8b:: with SMTP id z11mr4326498lfs.482.1621349058254; 
 Tue, 18 May 2021 07:44:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz9jhfFHmTLXEq14X8WEhXLTP+/2e0RAmy0PIwxWsyO+EoCd9/T+gCzkT8isl/a78e0v1YZrEg9I9pFJ/09t5Q=
X-Received: by 2002:ac2:4f8b:: with SMTP id z11mr4326486lfs.482.1621349057976; 
 Tue, 18 May 2021 07:44:17 -0700 (PDT)
MIME-Version: 1.0
References: <CADNu6esr-fzfP8pug+Rfv+yJrEjDJaGy3EO+O-oLb_nMm7qLDg@mail.gmail.com>
 <CA+aaKfB6BEbPnoRj07EfG_Yjpo5gvMLAiP-7=XLNAz0HL6RQDw@mail.gmail.com>
In-Reply-To: <CA+aaKfB6BEbPnoRj07EfG_Yjpo5gvMLAiP-7=XLNAz0HL6RQDw@mail.gmail.com>
From: Thomas Parrott <thomas.parrott@canonical.com>
Date: Tue, 18 May 2021 15:43:52 +0100
Message-ID: <CADNu6evte+JWzd=i9NiGYtHFyjP_cQgmqT0fzbXXwcVmVOALnw@mail.gmail.com>
Subject: Re: Adding pcie-root-port devices via QMP apparently isn't possible
To: marcel@redhat.com
Content-Type: multipart/alternative; boundary="000000000000a8740b05c29bbe9b"
Received-SPF: none client-ip=91.189.89.112;
 envelope-from=thomas.parrott@canonical.com; helo=youngberry.canonical.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Julia Suvorova <jusual@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000a8740b05c29bbe9b
Content-Type: text/plain; charset="UTF-8"

Thanks for confirming Marcel. Now we understand that -readconfig isn't
going away we can continue to preallocate the pcie-root-ports via the
config file as you suggest.

Thanks
Tom

On Tue, 18 May 2021 at 15:39, Marcel Apfelbaum <mapfelba@redhat.com> wrote:

> Hi Thomas,
>
>
> On Tue, May 18, 2021 at 3:29 PM Thomas Parrott
> <thomas.parrott@canonical.com> wrote:
> >
> > Due to QEMU moving towards a QMP configuration mechanism and away from
> config file support, the LXD team are currently in the process of migrating
> to using QMP to add devices to VMs (so that we can support the use of QEMU
> 6.0).
> >
> > Currently we are using the `-S` flag to freeze CPU at startup, then
> using QMP to add NIC devices via the `device_add` command, and then using
> the `cont` command to start the VM guest.
> >
> > However we have found that it is apparently not possible to add a
> pcie-root-port device via QMP.
> >
> > Initially we tried using something like:
> >
> > device_add
> {"id":"qemu_pcie5","driver":"pcie-root-port","bus":"pcie.0","addr":"1.5","chassis":5,"multifunction":"on"}
> >
> > Which was a straight conversion from the current config file we use.
> >
> > However this gave the error:
> >
> > Error: Bus 'pcie.0' does not support hotplugging
> >
> > Then I found the `--preconfig` flag which sounded interesting, so we
> removed the use of `-daemonize` which prevents the use of --preconfig` and
> then tried adding the pcie-root-port devices in the preconfig stage.
> >
> > But this resulted in the error:
> >
> > The command 'device_add' isn't permitted in 'preconfig' state
> >
> > So we wondered is this a bug, or if not, what is the correct way to be
> adding pcie-root-ports going forward?
>
> The pcie-root-ports cannot be hot-plugged, you will need to
> pre-allocate enough pcie-root-ports for your needs.
> PCI(e) devices can be hot-plugged into the pre-allocated pcie-root-ports.
>
> Thanks,
> Marcel
>
> >
> > Thanks
> > Tom Parrott
> >
> >
>
>

--000000000000a8740b05c29bbe9b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks for confirming Marcel. Now we understand that =
-readconfig isn&#39;t going away we can continue to preallocate the pcie-ro=
ot-ports via the config file as you suggest.</div><div><br></div><div>Thank=
s</div><div>Tom<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Tue, 18 May 2021 at 15:39, Marcel Apfelbaum &lt=
;<a href=3D"mailto:mapfelba@redhat.com">mapfelba@redhat.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Thomas,<br>
<br>
<br>
On Tue, May 18, 2021 at 3:29 PM Thomas Parrott<br>
&lt;<a href=3D"mailto:thomas.parrott@canonical.com" target=3D"_blank">thoma=
s.parrott@canonical.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Due to QEMU moving towards a QMP configuration mechanism and away from=
 config file support, the LXD team are currently in the process of migratin=
g to using QMP to add devices to VMs (so that we can support the use of QEM=
U 6.0).<br>
&gt;<br>
&gt; Currently we are using the `-S` flag to freeze CPU at startup, then us=
ing QMP to add NIC devices via the `device_add` command, and then using the=
 `cont` command to start the VM guest.<br>
&gt;<br>
&gt; However we have found that it is apparently not possible to add a pcie=
-root-port device via QMP.<br>
&gt;<br>
&gt; Initially we tried using something like:<br>
&gt;<br>
&gt; device_add {&quot;id&quot;:&quot;qemu_pcie5&quot;,&quot;driver&quot;:&=
quot;pcie-root-port&quot;,&quot;bus&quot;:&quot;pcie.0&quot;,&quot;addr&quo=
t;:&quot;1.5&quot;,&quot;chassis&quot;:5,&quot;multifunction&quot;:&quot;on=
&quot;}<br>
&gt;<br>
&gt; Which was a straight conversion from the current config file we use.<b=
r>
&gt;<br>
&gt; However this gave the error:<br>
&gt;<br>
&gt; Error: Bus &#39;pcie.0&#39; does not support hotplugging<br>
&gt;<br>
&gt; Then I found the `--preconfig` flag which sounded interesting, so we r=
emoved the use of `-daemonize` which prevents the use of --preconfig` and t=
hen tried adding the pcie-root-port devices in the preconfig stage.<br>
&gt;<br>
&gt; But this resulted in the error:<br>
&gt;<br>
&gt; The command &#39;device_add&#39; isn&#39;t permitted in &#39;preconfig=
&#39; state<br>
&gt;<br>
&gt; So we wondered is this a bug, or if not, what is the correct way to be=
 adding pcie-root-ports going forward?<br>
<br>
The pcie-root-ports cannot be hot-plugged, you will need to<br>
pre-allocate enough pcie-root-ports for your needs.<br>
PCI(e) devices can be hot-plugged into the pre-allocated pcie-root-ports.<b=
r>
<br>
Thanks,<br>
Marcel<br>
<br>
&gt;<br>
&gt; Thanks<br>
&gt; Tom Parrott<br>
&gt;<br>
&gt;<br>
<br>
</blockquote></div>

--000000000000a8740b05c29bbe9b--

