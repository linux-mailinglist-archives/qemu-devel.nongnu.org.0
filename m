Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF930322F1D
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 17:54:43 +0100 (CET)
Received: from localhost ([::1]:52830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEaxO-0000Hx-LU
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 11:54:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yshxxsjt715@gmail.com>)
 id 1lEUS7-0003wc-Dl; Tue, 23 Feb 2021 04:57:59 -0500
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d]:42156)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yshxxsjt715@gmail.com>)
 id 1lEUS5-000744-KK; Tue, 23 Feb 2021 04:57:59 -0500
Received: by mail-il1-x12d.google.com with SMTP id z18so13510608ile.9;
 Tue, 23 Feb 2021 01:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DiC2cfi3+/E6H2PIHT9MSeSuf0XVlMNfSncNGe9ypx4=;
 b=LQv9XH9cg7xa1dqE0Oru80aqyn3TLV8L0Tjye/jHL3z+H10nxk0EhUxBKucJAfKGkC
 t/G1QdW+hw15RNpUPVBv/V/h/Q+SZDkO2fJo+ow01RjF1nr7fXZhV1kcHXfhGm3hXPs5
 KZZRDfH9R9kuM2unl8VImBOSTs9RC6KTKtpxaEliaKL5gva4K76eCUcGPPcybFVjkLta
 mVOGKD+yqNn0jBYZy0XlSlU4hUz454KnRThhnfPv2oqGuQezp9Q1K5rbnq5pQYDSUC64
 MHJQPt5hviqLtVC8wpkuKcM/CmQoK+ZRguwD06Qt+qY8wA7s5/rvDnnd+4Hslt9KYZad
 f4vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DiC2cfi3+/E6H2PIHT9MSeSuf0XVlMNfSncNGe9ypx4=;
 b=GpSGSRNKvbw1muj9GCYbZ7pq1fr60/LRR2+S6S85ts479k1XJG0pmuVR+ex76HWXIN
 1c5Nmo4ttA/9qg5IsltyX9VqxAVcOBn8Ge8CY5IRlCmMaPCDeb+fMcFscnAJlFbjwlrx
 nlF7eInRydwVzCWDB+DQ/DLxfIoMf3uEobirE1U+RrJtJBUI7XjGfCcbGuUbpUaVArol
 uoVxJ6jUCDo7nbM/plm9zjvGHaJk8ItESxaMwM/DaBpi2wJoaSmfiN9baxLApxxxplTI
 QsohUaB47QyvavVA59I10BKdJaHP63dhoUG1FABCjjgroQwaZHdRZDkhlGtbgl00R4Mx
 PssQ==
X-Gm-Message-State: AOAM531rEtH16cb2IX9vsGz6P1muPVxD+7j54ZQzbEF1LONxn5cIGLbz
 wWouYS2yXht5sp7VFZQ3sNJBVZwBOFHrjBWI00o=
X-Google-Smtp-Source: ABdhPJwKghgn5HB0t+qbw9egdpJqKKikRiRuhWVzbS2SSn4pNqHmJMMjCLx34t/sHiU7cKgSsX5S1RmwL5Bl5MzisJQ=
X-Received: by 2002:a92:b00d:: with SMTP id x13mr18846657ilh.128.1614074276344; 
 Tue, 23 Feb 2021 01:57:56 -0800 (PST)
MIME-Version: 1.0
References: <CALqm=df_dH41LQfG+X2_qL2z68DPAF9vT=9HGSEbBMWec_zLQA@mail.gmail.com>
 <ef18782e-99d8-8406-152f-46c03bbd3280@redhat.com> <YDTO5yIR1IyxbVZt@work-vm>
In-Reply-To: <YDTO5yIR1IyxbVZt@work-vm>
From: Jiatong Shen <yshxxsjt715@gmail.com>
Date: Tue, 23 Feb 2021 17:57:45 +0800
Message-ID: <CALqm=ddLcPh2wUcYTwrf5uXG1Oyakocef449dyQ8NUeb6CY2Ow@mail.gmail.com>
Subject: Re: romfile resize
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000e1f8e205bbfdf3f6"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12d;
 envelope-from=yshxxsjt715@gmail.com; helo=mail-il1-x12d.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 23 Feb 2021 11:52:20 -0500
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-discuss@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000e1f8e205bbfdf3f6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

  Thank you very much for the answer. so if romfile on destination got a
larger size than source, why romfile check still does not
pass? because dest got enough space to hold romfile.

thank you.

Jiatong Shen

On Tue, Feb 23, 2021 at 5:46 PM Dr. David Alan Gilbert <dgilbert@redhat.com=
>
wrote:

> * Philippe Mathieu-Daud=C3=A9 (philmd@redhat.com) wrote:
> > Cc'ing qemu-devel@
> >
> > On 2/23/21 1:45 AM, Jiatong Shen wrote:
> > > Hello,
> > >
> > >   we are faced with an issue where a changed sized romfile
> > > (efi-virtio.rom) fails live migration. Do qemu load this rom from its
> > > current host only? If yes, why cannot sync this from source vm?
>
> Hi,
>   For migration to work the ROM has to be the same size on the source
> and destination.
>
>   The problem is that whne the destination starts up it allocates the
> size of the ROM based on the size of the file;  but then the migration
> comes along and tries to copy the data from the source machine into that
> allocation; and isn't sure what should happen when it doesn't quite fit.
>
>   There is some variation allowed (I think the allocated size gets
> rounded up, maybe to the next power of 2); but you still hit problems
> wehn the ROM size crosses certain thresholds.
>
>   In the latest qemu, a 'romsize' property was added (see git commit
> 08b1df8ff463e72b0875538fb991d5393047606c ); that lets you specifiy a
> size that's big enough to hold some space for future expansion - e.g.
> lets say your ROM is currently 300k, you might specify romsize=3D512k
> and then it doesn't matter what size the actual file is, we'll always
> allocate 512k, and as long as the file is less than 512k migration will
> work.
>
>   The more manual way to do that, is to arrange for your files to be
> padded to a larger boundary so that you leave room for growth.
> Some distros have done that for a while.
>
> Dave
>
> > > thank you.
> > >
> > > --
> > >
> > > Best Regards,
> > >
> > > Jiatong Shen
> >
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
>
>

--=20

Best Regards,

Jiatong Shen

--000000000000e1f8e205bbfdf3f6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>=C2=A0 Thank you very much for the =
answer. so if romfile on destination got a larger size than source, why rom=
file check still does not</div><div>pass? because dest got enough space to =
hold romfile.</div><div><br></div><div>thank you.</div><div><br></div><div>=
Jiatong Shen</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Tue, Feb 23, 2021 at 5:46 PM Dr. David Alan Gilbert &l=
t;<a href=3D"mailto:dgilbert@redhat.com">dgilbert@redhat.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">* Philippe Math=
ieu-Daud=C3=A9 (<a href=3D"mailto:philmd@redhat.com" target=3D"_blank">phil=
md@redhat.com</a>) wrote:<br>
&gt; Cc&#39;ing qemu-devel@<br>
&gt; <br>
&gt; On 2/23/21 1:45 AM, Jiatong Shen wrote:<br>
&gt; &gt; Hello,<br>
&gt; &gt; <br>
&gt; &gt; =C2=A0 we are faced with an issue where a changed sized romfile<b=
r>
&gt; &gt; (efi-virtio.rom) fails live migration. Do qemu load this rom from=
 its<br>
&gt; &gt; current host only? If yes, why cannot sync this from source vm?<b=
r>
<br>
Hi,<br>
=C2=A0 For migration to work the ROM has to be the same size on the source<=
br>
and destination.<br>
<br>
=C2=A0 The problem is that whne the destination starts up it allocates the<=
br>
size of the ROM based on the size of the file;=C2=A0 but then the migration=
<br>
comes along and tries to copy the data from the source machine into that<br=
>
allocation; and isn&#39;t sure what should happen when it doesn&#39;t quite=
 fit.<br>
<br>
=C2=A0 There is some variation allowed (I think the allocated size gets<br>
rounded up, maybe to the next power of 2); but you still hit problems<br>
wehn the ROM size crosses certain thresholds.<br>
<br>
=C2=A0 In the latest qemu, a &#39;romsize&#39; property was added (see git =
commit<br>
08b1df8ff463e72b0875538fb991d5393047606c ); that lets you specifiy a<br>
size that&#39;s big enough to hold some space for future expansion - e.g.<b=
r>
lets say your ROM is currently 300k, you might specify romsize=3D512k<br>
and then it doesn&#39;t matter what size the actual file is, we&#39;ll alwa=
ys<br>
allocate 512k, and as long as the file is less than 512k migration will<br>
work.<br>
<br>
=C2=A0 The more manual way to do that, is to arrange for your files to be<b=
r>
padded to a larger boundary so that you leave room for growth.<br>
Some distros have done that for a while.<br>
<br>
Dave<br>
<br>
&gt; &gt; thank you.<br>
&gt; &gt; <br>
&gt; &gt; -- <br>
&gt; &gt; <br>
&gt; &gt; Best Regards,<br>
&gt; &gt; <br>
&gt; &gt; Jiatong Shen<br>
&gt; <br>
-- <br>
Dr. David Alan Gilbert / <a href=3D"mailto:dgilbert@redhat.com" target=3D"_=
blank">dgilbert@redhat.com</a> / Manchester, UK<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><br><div>Best Regards,</div><di=
v><br></div><div>Jiatong Shen</div></div></div>

--000000000000e1f8e205bbfdf3f6--

