Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A5A516C05
	for <lists+qemu-devel@lfdr.de>; Mon,  2 May 2022 10:28:49 +0200 (CEST)
Received: from localhost ([::1]:51294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlRQD-0000Ch-SR
	for lists+qemu-devel@lfdr.de; Mon, 02 May 2022 04:28:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nlRKO-0005q3-2t
 for qemu-devel@nongnu.org; Mon, 02 May 2022 04:22:49 -0400
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c]:38707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nlRKL-0004FB-0q
 for qemu-devel@nongnu.org; Mon, 02 May 2022 04:22:43 -0400
Received: by mail-lf1-x12c.google.com with SMTP id p12so24070627lfs.5
 for <qemu-devel@nongnu.org>; Mon, 02 May 2022 01:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=t5F4pnnatf1nf6NLd2ii0hqtw0xI8M7e2ArTuC8taD8=;
 b=on5r0Q3TCfJh/fmFXBW8s42WVVbl5G6kkfbjN4scuMn22FzJrUdJSnt/Wmev5vibuq
 7q4dj/iq7SNbZ15/qRIH+RCNxPi/6fNA9gCqAfIryUpzYuNvvmfUDtwNsflqdayx9a1L
 +E5dQRaF1bfA7z7puG8w1NOjbZMxzCsqLiWC+e1d16ffr0zzj/ReC+aTwLgoM3ejJKmU
 bz5ACgfj84wi6TcVaQwT2pTgQX+C/a2PjvGwhbJYQSdAgp2zvrcBGirgMaDOoDhsXnWT
 XI2EwBmac5Pi38chY1jcSmYxKCg3QIgGNlncCAWQMJdK0SfQ7rj/rxBy3rtDfT6kgS5j
 dTaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t5F4pnnatf1nf6NLd2ii0hqtw0xI8M7e2ArTuC8taD8=;
 b=23EZWICz1whRP+s8l9ZuVrrrEIxAlB6lnXUtmymOTk5ElyI6qPyRuik5Mos0qqV6H+
 HD/Rfc9eUF+LekE9ddVNEFN8OhYzWDE9ZTbOjrCAFlb8JKeU8cDf4Muw1KgnJuYrj92+
 xn2KnomGKdr87NIA7EMwMKyz/Fh0kJhnGRbnfahE63Llg1IWFm+RRHzPNudvJh1M/8Y9
 Fl6SNCI2RXhYyr4QiV571QTLzsBKKJjNMFJeXsowyI0Cf1poY//h/uFPVxks19BCzBOp
 tTcMH/1WVCEzgnkDAitnwsh++QcUwRR0oe9I5CV5AuCHjQaBbMAUBKwGPgyRRNtMt68G
 M8lA==
X-Gm-Message-State: AOAM530rxHMwnamOP06nwmb8JOxE6NjdwhCGitirQdO8v8LJFRyk7eXx
 UCwruQEP7c9efpviTEsOtlQQ5bloFbvYH26++bY=
X-Google-Smtp-Source: ABdhPJyeKLeuSUFo7VFx5DW4pC4mnREJ72iX3TPfrIW1kFeMlmYPFtYTRwi+bqRKgRNckpxNKMdtHmmiJNM0c3qLlbI=
X-Received: by 2002:a05:6512:3992:b0:472:31ef:cd80 with SMTP id
 j18-20020a056512399200b0047231efcd80mr8107014lfu.532.1651479759138; Mon, 02
 May 2022 01:22:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220411144749.47185-1-anthony.perard@citrix.com>
 <1610a1ff-435e-e286-6bd7-a820630b865d@linux.ibm.com>
In-Reply-To: <1610a1ff-435e-e286-6bd7-a820630b865d@linux.ibm.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 2 May 2022 12:22:27 +0400
Message-ID: <CAJ+F1CKe5Yi9n7b1hA6JAXGDSVGqJKrzWsYLkzP0rNUUoVZW0g@mail.gmail.com>
Subject: Re: [PATCH] tpm_crb: mark command buffer as dirty on request
 completion
To: Stefan Berger <stefanb@linux.ibm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000065b49705de031896"
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x12c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Eric Auger <eric.auger@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000065b49705de031896
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, Apr 11, 2022 at 8:32 PM Stefan Berger <stefanb@linux.ibm.com> wrote=
:

>
>
> On 4/11/22 10:47, Anthony PERARD wrote:
> > From: Anthony PERARD <anthony.perard@citrix.com>
> >
> > At the moment, there doesn't seems to be any way to know that QEMU
> > made modification to the command buffer. This is potentially an issue
> > on Xen while migrating a guest, as modification to the buffer after
> > the migration as started could be ignored and not transfered to the
> > destination. >
> > Mark the memory region of the command buffer as dirty once a request
> > is completed.
>
> Not sure about the CRB...
>
> The TIS at least carries the buffer as part of the state and stores it
> when the interface is saved:
>
> https://github.com/qemu/qemu/blob/v6.2.0/hw/tpm/tpm_tis_isa.c#L56
> https://github.com/qemu/qemu/blob/v6.2.0/hw/tpm/tpm_tis_sysbus.c#L56
>
> With the CRB the memory is registered using these functions.
>
>      memory_region_init_io(&s->mmio, OBJECT(s), &tpm_crb_memory_ops, s,
>          "tpm-crb-mmio", sizeof(s->regs));
>      memory_region_init_ram(&s->cmdmem, OBJECT(s),
>          "tpm-crb-cmd", CRB_CTRL_CMD_SIZE, errp);
>
>      memory_region_add_subregion(get_system_memory(),
>          TPM_CRB_ADDR_BASE, &s->mmio);
>      memory_region_add_subregion(get_system_memory(),
>          TPM_CRB_ADDR_BASE + sizeof(s->regs), &s->cmdmem);
>
>
> The state of the registers is saved using this here:
>
> static const VMStateDescription vmstate_tpm_crb =3D {
>      .name =3D "tpm-crb",
>      .pre_save =3D tpm_crb_pre_save,
>      .fields =3D (VMStateField[]) {
>          VMSTATE_UINT32_ARRAY(regs, CRBState, TPM_CRB_R_MAX),
>          VMSTATE_END_OF_LIST(),
>      }
> };
>
> The buffer with the commands is not part of this. So likely it needs to
> be marked dirty but then I am not sure whether that is going to work if
> the response to a command on the CRB is only received when
> tpm_crb_pre_save() is called.. Maybe this buffer would have to be save
> explicitly in a .save function or also as part of vmstate_tpm_crb... ?
>
>
The memory regions are migrated and the guest modification should be
tracked.

However, when migrating the CRB device, CPUs should be paused, but the
backend could indeed write some reply in the cmdmem memory.

I think the migration logic handles the case where RAM was already migrated
but marked dirty again during a device migration. It would be nice if David
or Juan could confirm.

If that's the case, the patch as is looks good to me.

thanks



>    Stefan
>
>
>
>
> >
> > Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> > ---
> >
> > I have only read code to find out whether the tpm-crb device was fine
> > with regards to migration, and I don't think there's anything that
> > could mark the memory region as dirty once a request is completed.
> >
> > There is one call to memory_region_get_ram_ptr(), but nothing seems to
> > be done with the pointer is regards to ram migration. Am I wrong?
> >
> > Thanks.
> > ---
> >   hw/tpm/tpm_crb.c | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/hw/tpm/tpm_crb.c b/hw/tpm/tpm_crb.c
> > index aa9c00aad3..67db594c48 100644
> > --- a/hw/tpm/tpm_crb.c
> > +++ b/hw/tpm/tpm_crb.c
> > @@ -197,6 +197,7 @@ static void tpm_crb_request_completed(TPMIf *ti, in=
t
> ret)
> >           ARRAY_FIELD_DP32(s->regs, CRB_CTRL_STS,
> >                            tpmSts, 1); /* fatal error */
> >       }
> > +    memory_region_set_dirty(&s->cmdmem, 0, CRB_CTRL_CMD_SIZE);
> >   }
> >
> >   static enum TPMVersion tpm_crb_get_version(TPMIf *ti)
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000065b49705de031896
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Apr 11, 2022 at 8:32 PM Ste=
fan Berger &lt;<a href=3D"mailto:stefanb@linux.ibm.com">stefanb@linux.ibm.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"><br>
<br>
On 4/11/22 10:47, Anthony PERARD wrote:<br>
&gt; From: Anthony PERARD &lt;<a href=3D"mailto:anthony.perard@citrix.com" =
target=3D"_blank">anthony.perard@citrix.com</a>&gt;<br>
&gt; <br>
&gt; At the moment, there doesn&#39;t seems to be any way to know that QEMU=
<br>
&gt; made modification to the command buffer. This is potentially an issue<=
br>
&gt; on Xen while migrating a guest, as modification to the buffer after<br=
>
&gt; the migration as started could be ignored and not transfered to the<br=
>
&gt; destination. &gt;<br>
&gt; Mark the memory region of the command buffer as dirty once a request<b=
r>
&gt; is completed.<br>
<br>
Not sure about the CRB...<br>
<br>
The TIS at least carries the buffer as part of the state and stores it <br>
when the interface is saved:<br>
<br>
<a href=3D"https://github.com/qemu/qemu/blob/v6.2.0/hw/tpm/tpm_tis_isa.c#L5=
6" rel=3D"noreferrer" target=3D"_blank">https://github.com/qemu/qemu/blob/v=
6.2.0/hw/tpm/tpm_tis_isa.c#L56</a><br>
<a href=3D"https://github.com/qemu/qemu/blob/v6.2.0/hw/tpm/tpm_tis_sysbus.c=
#L56" rel=3D"noreferrer" target=3D"_blank">https://github.com/qemu/qemu/blo=
b/v6.2.0/hw/tpm/tpm_tis_sysbus.c#L56</a><br>
<br>
With the CRB the memory is registered using these functions.<br>
<br>
=C2=A0 =C2=A0 =C2=A0memory_region_init_io(&amp;s-&gt;mmio, OBJECT(s), &amp;=
tpm_crb_memory_ops, s,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;tpm-crb-mmio&quot;, sizeof(s-&gt;re=
gs));<br>
=C2=A0 =C2=A0 =C2=A0memory_region_init_ram(&amp;s-&gt;cmdmem, OBJECT(s),<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;tpm-crb-cmd&quot;, CRB_CTRL_CMD_SIZ=
E, errp);<br>
<br>
=C2=A0 =C2=A0 =C2=A0memory_region_add_subregion(get_system_memory(),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TPM_CRB_ADDR_BASE, &amp;s-&gt;mmio);<br>
=C2=A0 =C2=A0 =C2=A0memory_region_add_subregion(get_system_memory(),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TPM_CRB_ADDR_BASE + sizeof(s-&gt;regs), &=
amp;s-&gt;cmdmem);<br>
<br>
<br>
The state of the registers is saved using this here:<br>
<br>
static const VMStateDescription vmstate_tpm_crb =3D {<br>
=C2=A0 =C2=A0 =C2=A0.name =3D &quot;tpm-crb&quot;,<br>
=C2=A0 =C2=A0 =C2=A0.pre_save =3D tpm_crb_pre_save,<br>
=C2=A0 =C2=A0 =C2=A0.fields =3D (VMStateField[]) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINT32_ARRAY(regs, CRBState, TPM_=
CRB_R_MAX),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_END_OF_LIST(),<br>
=C2=A0 =C2=A0 =C2=A0}<br>
};<br>
<br>
The buffer with the commands is not part of this. So likely it needs to <br=
>
be marked dirty but then I am not sure whether that is going to work if <br=
>
the response to a command on the CRB is only received when <br>
tpm_crb_pre_save() is called.. Maybe this buffer would have to be save <br>
explicitly in a .save function or also as part of vmstate_tpm_crb... ?<br>
<br></blockquote><div><br></div><div>The memory regions are migrated and th=
e guest modification should be tracked.</div><div><br></div><div>However, w=
hen migrating the CRB device, CPUs should be paused, but the backend could =
indeed write some reply in the cmdmem memory.</div><div><br></div><div>I th=
ink the migration logic handles the case where RAM was already migrated but=
 marked dirty again during a device migration. It would be nice if David or=
 Juan could confirm.</div><div><br></div><div>If that&#39;s the case, the p=
atch as is looks good to me.</div><div><br></div><div>thanks<br></div><div>=
<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
=C2=A0 =C2=A0Stefan<br>
<br>
<br>
<br>
<br>
&gt; <br>
&gt; Signed-off-by: Anthony PERARD &lt;<a href=3D"mailto:anthony.perard@cit=
rix.com" target=3D"_blank">anthony.perard@citrix.com</a>&gt;<br>
&gt; ---<br>
&gt; <br>
&gt; I have only read code to find out whether the tpm-crb device was fine<=
br>
&gt; with regards to migration, and I don&#39;t think there&#39;s anything =
that<br>
&gt; could mark the memory region as dirty once a request is completed.<br>
&gt; <br>
&gt; There is one call to memory_region_get_ram_ptr(), but nothing seems to=
<br>
&gt; be done with the pointer is regards to ram migration. Am I wrong?<br>
&gt; <br>
&gt; Thanks.<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0hw/tpm/tpm_crb.c | 1 +<br>
&gt;=C2=A0 =C2=A01 file changed, 1 insertion(+)<br>
&gt; <br>
&gt; diff --git a/hw/tpm/tpm_crb.c b/hw/tpm/tpm_crb.c<br>
&gt; index aa9c00aad3..67db594c48 100644<br>
&gt; --- a/hw/tpm/tpm_crb.c<br>
&gt; +++ b/hw/tpm/tpm_crb.c<br>
&gt; @@ -197,6 +197,7 @@ static void tpm_crb_request_completed(TPMIf *ti, i=
nt ret)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ARRAY_FIELD_DP32(s-&gt;regs, C=
RB_CTRL_STS,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 tpmSts, 1); /* fatal error */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 memory_region_set_dirty(&amp;s-&gt;cmdmem, 0, CRB_CTRL_=
CMD_SIZE);<br>
&gt;=C2=A0 =C2=A0}<br>
&gt; <br>
&gt;=C2=A0 =C2=A0static enum TPMVersion tpm_crb_get_version(TPMIf *ti)<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000065b49705de031896--

