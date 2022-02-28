Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 352FB4C796D
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 21:05:49 +0100 (CET)
Received: from localhost ([::1]:38852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOmHE-0001nS-Av
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 15:05:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1nOmFP-0008To-HI
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 15:03:55 -0500
Received: from [2a00:1450:4864:20::132] (port=44971
 helo=mail-lf1-x132.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1nOmFN-0006qQ-Mb
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 15:03:54 -0500
Received: by mail-lf1-x132.google.com with SMTP id j15so23246754lfe.11
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 12:03:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qVQekP/xafOY04rl3YcTXc+HfZnsFwU6PJ2KdsJMuD0=;
 b=C96yvYjVhmQ8NqdZjbnbtrAsXEP8pT3FHQr5zykIXzy86lD6nsn5iOj3MDfr7V/C1I
 Gkrs/D4LSC0UtKpwfdRG3wNV9AWJ0vypSQV+PAWhNITWuv2fgsoeU5HEh6D56xt9HPuX
 2ubX55OEYtcQIFgV0PkLDta+IVUTcocG2MDNzzvSu5eITiBm6e2/PIdfJOVgA//87jAd
 +WfXKjFZ3pmyZezMiSB1DarZNRYaDYSuqsPYQyPOzT8sZuJzTi6QABCW294SylZRCWoP
 48efj1BpPB5zMuY/JMhSWX5UDvwq6cNrh06ZYXW+dU/wCoj3MC85oG1QHjddPlvbrkzs
 GcXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qVQekP/xafOY04rl3YcTXc+HfZnsFwU6PJ2KdsJMuD0=;
 b=oT4xpLjYsPzZLJUHqTTDzxiVDyyDsPPRRLU7kQQw+rfPqb+uHzMgVWcx5h0Cy0ADNe
 6DI2I4AfzBVzlNn+18M7/Mrqm5h68uXF1w6je9V2UJ53NDfUCIRtMF/YKgHRO2dKsN1Z
 dnwqYyc4ep/ogN5fu5XGExYdDRA/b0f3jz90v01xoAEUdkSBS2Q5JncP6F8bVeGywdFm
 qMaqDgJpl/PcACh9UvERVVsx1ye40BKF/v4u/Jei2tZgBr6FlSnxeJiquyuzDccBDZKN
 bdmrhlR6AxqlfiNmHJZ4evwtA60CQTIGn6WihBQHtE5R+BYxCYvYhhJVVYrb5A3C1inz
 j45g==
X-Gm-Message-State: AOAM531q5Av3OIzdBbNS3214H8D2duZpB9kAaMw+exv3xB3SlUHenC+k
 ZxqxWGXYmJwg4VFcOM2JLXM6RFg9PG/4Y6HSdcU=
X-Google-Smtp-Source: ABdhPJyiC3/tMCqjEjmgRH1f+gdvOFbvxwqQyX0bHWALv0q4j5lwCafw3z8DPpW9x/PONj6yjp7IEbcO6524ZvW6eg0=
X-Received: by 2002:a05:6512:32cf:b0:441:67e0:7d92 with SMTP id
 f15-20020a05651232cf00b0044167e07d92mr13903717lfg.150.1646078631337; Mon, 28
 Feb 2022 12:03:51 -0800 (PST)
MIME-Version: 1.0
References: <20220201100940.47788-1-david@redhat.com>
 <18ed54d6-c4e2-404a-f68b-002a67546445@redhat.com>
In-Reply-To: <18ed54d6-c4e2-404a-f68b-002a67546445@redhat.com>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Mon, 28 Feb 2022 21:03:39 +0100
Message-ID: <CAPan3WqFr1wtiZbmtiE8FUqPtW3tGcYRK648MVOzf1m+L_795g@mail.gmail.com>
Subject: Re: [PATCH] memory: Make memory_region_readd_subregion() properly
 handle mapped aliases
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000017e14505d9198cdb"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::132
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=nieklinnenbank@gmail.com; helo=mail-lf1-x132.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000017e14505d9198cdb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Paolo,

Thanks for queing this patch. I did not yet see it appear in master. Do you
know when we can expect to see it?

Regards,
Niek

On Tue, Feb 1, 2022 at 11:51 AM Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 2/1/22 11:09, David Hildenbrand wrote:
> > memory_region_readd_subregion() wants to readd a region by first
> > removing it and then readding it. For readding, it doesn't use one of
> > the memory_region_add_*() variants, which is why fail to re-increment t=
he
> > mr->mapped_via_alias counters, resulting in the
> > assert(alias->mapped_via_alias >=3D 0) in memory_region_del_subregion()
> > triggering the next time we call memory_region_readd_subregion().
> >
> > Fix it by using memory_region_add_subregion_common() for readding the
> > region.
> >
> > Reported-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> > Fixes: 5ead62185d23 ("memory: Make memory_region_is_mapped() succeed
> when mapped via an alias")
> > Tested-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> > Cc: Paolo Bonzini <pbonzini@redhat.com>
> > Cc: Peter Xu <peterx@redhat.com>
> > Cc: "Philippe Mathieu-Daud=C3=A9" <f4bug@amsat.org>
> > Signed-off-by: David Hildenbrand <david@redhat.com>
> > ---
> >   softmmu/memory.c | 3 +--
> >   1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/softmmu/memory.c b/softmmu/memory.c
> > index 678dc62f06..76bb1677fe 100644
> > --- a/softmmu/memory.c
> > +++ b/softmmu/memory.c
> > @@ -2626,8 +2626,7 @@ static void
> memory_region_readd_subregion(MemoryRegion *mr)
> >           memory_region_transaction_begin();
> >           memory_region_ref(mr);
> >           memory_region_del_subregion(container, mr);
> > -        mr->container =3D container;
> > -        memory_region_update_container_subregions(mr);
> > +        memory_region_add_subregion_common(container, mr->addr, mr);
> >           memory_region_unref(mr);
> >           memory_region_transaction_commit();
> >       }
>
> Queued, thanks.
>
> Paolo
>


--=20
Niek Linnenbank

--00000000000017e14505d9198cdb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Paolo,</div><div><br></div><div>Thanks for queing =
this patch. I did not yet see it appear in master. Do you know when we can =
expect to see it?</div><div><br></div><div>Regards,</div><div>Niek<br></div=
></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>On Tue, Feb 1, 2022 at 11:51 AM Paolo Bonzini &lt;<a href=3D"mailto:pbonzi=
ni@redhat.com">pbonzini@redhat.com</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">On 2/1/22 11:09, David Hildenbrand wrote:=
<br>
&gt; memory_region_readd_subregion() wants to readd a region by first<br>
&gt; removing it and then readding it. For readding, it doesn&#39;t use one=
 of<br>
&gt; the memory_region_add_*() variants, which is why fail to re-increment =
the<br>
&gt; mr-&gt;mapped_via_alias counters, resulting in the<br>
&gt; assert(alias-&gt;mapped_via_alias &gt;=3D 0) in memory_region_del_subr=
egion()<br>
&gt; triggering the next time we call memory_region_readd_subregion().<br>
&gt; <br>
&gt; Fix it by using memory_region_add_subregion_common() for readding the<=
br>
&gt; region.<br>
&gt; <br>
&gt; Reported-by: Niek Linnenbank &lt;<a href=3D"mailto:nieklinnenbank@gmai=
l.com" target=3D"_blank">nieklinnenbank@gmail.com</a>&gt;<br>
&gt; Fixes: 5ead62185d23 (&quot;memory: Make memory_region_is_mapped() succ=
eed when mapped via an alias&quot;)<br>
&gt; Tested-by: Niek Linnenbank &lt;<a href=3D"mailto:nieklinnenbank@gmail.=
com" target=3D"_blank">nieklinnenbank@gmail.com</a>&gt;<br>
&gt; Cc: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" target=3D=
"_blank">pbonzini@redhat.com</a>&gt;<br>
&gt; Cc: Peter Xu &lt;<a href=3D"mailto:peterx@redhat.com" target=3D"_blank=
">peterx@redhat.com</a>&gt;<br>
&gt; Cc: &quot;Philippe Mathieu-Daud=C3=A9&quot; &lt;<a href=3D"mailto:f4bu=
g@amsat.org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
&gt; Signed-off-by: David Hildenbrand &lt;<a href=3D"mailto:david@redhat.co=
m" target=3D"_blank">david@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0softmmu/memory.c | 3 +--<br>
&gt;=C2=A0 =C2=A01 file changed, 1 insertion(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/softmmu/memory.c b/softmmu/memory.c<br>
&gt; index 678dc62f06..76bb1677fe 100644<br>
&gt; --- a/softmmu/memory.c<br>
&gt; +++ b/softmmu/memory.c<br>
&gt; @@ -2626,8 +2626,7 @@ static void memory_region_readd_subregion(Memory=
Region *mr)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memory_region_transaction_begi=
n();<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memory_region_ref(mr);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memory_region_del_subregion(co=
ntainer, mr);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 mr-&gt;container =3D container;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 memory_region_update_container_subregions=
(mr);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 memory_region_add_subregion_common(contai=
ner, mr-&gt;addr, mr);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memory_region_unref(mr);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memory_region_transaction_comm=
it();<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
Queued, thanks.<br>
<br>
Paolo<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><div>Niek Linnenbank<br><br></div></div></=
div>

--00000000000017e14505d9198cdb--

