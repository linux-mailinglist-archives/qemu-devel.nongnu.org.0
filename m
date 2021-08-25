Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 096BA3F7C15
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 20:14:41 +0200 (CEST)
Received: from localhost ([::1]:42202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIxQ8-0001Qq-5B
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 14:14:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1mIxPN-0000cy-6J
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 14:13:53 -0400
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236]:37778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1mIxPL-0007oq-7k
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 14:13:52 -0400
Received: by mail-oi1-x236.google.com with SMTP id y128so599308oie.4
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 11:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qGFAeAO1X0/zgolabxVQZj/hrG91mH5K5HauR5zdyZ4=;
 b=OYYtDYy5Fm9UJB7e6OfNBF3MS+OKgXWfSw94d6WQ9G63HtKw0RnEugdHdy3zCw6isn
 HuxAPC6sFim3nL6VKndOWc+r0DUdbhcnb03baid4o3hgpuPZFF/Z2qIra+/v7CwlyVr0
 2E5PMdXF6S0S0bbHfaDQGIs/zyPGGi1cHKu9qtKG1ibuTmCbfYgJcFVIVHb9ygptk4P3
 F3aWQ88U/uwTA17YJsh8dE69oR6/hKs4qpTHAMVorymsmNOExgk5U9rklS7pj6Oh6JMo
 PHKI2fZffiQqPZV597AdL1s7OV1W4xuhWYAiQNrwqpd+KPR6bXJXKdt/g9BNgGYQyWMW
 aEZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qGFAeAO1X0/zgolabxVQZj/hrG91mH5K5HauR5zdyZ4=;
 b=gzM11XU3ek6u9CqahiQCCbg6W4gBA2xhYk6tXaeskNlHP4y8g5cKFPY+ddG6hPWD6H
 hCTcxmkQODvUmOfcD6f9jrualaBTdbMRcHRv/kdgu1RUdBlnnJcpqKSYjXLhgLUGO45U
 IAOnMSh11WxK+DW/k5IiVZEZuJei7gJv/SHfdSnTQ07WhG2XA2OSlgJt8yfXcdvNiP0+
 uR3LodNe7miVfymdQtu65ybo69tIszmlye27x3U2omtw0PB1pcbDPbFENFEM3VfL78Sa
 EJiQkx56HeX+wm6/CKUBMQmdmELioz3EGB8gP8OcaHOQZZJd41EBPtFvTzd0ri2oGJs4
 tEXg==
X-Gm-Message-State: AOAM530F/tTbb5Id9ol+fUlB68eYCG77rvLc42mae3h+R/MF66zu1WDO
 iQkFaaZHH7C5kx/kBLIUX9V1scbJ1ICOcfS39Ib+mA==
X-Google-Smtp-Source: ABdhPJyx8ffIKK6GOV22c2me1aGCxe8Tnpredh5CiIP3iOJbF4WNkDsdSc2d4k1jEdFVB1lb29ZufiSCsy5QpML/ByU=
X-Received: by 2002:aca:3989:: with SMTP id g131mr7874207oia.169.1629915229157; 
 Wed, 25 Aug 2021 11:13:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210713153758.323614-1-andrew@daynix.com>
 <20210713153758.323614-2-andrew@daynix.com>
 <0cb9e90f-0d9f-8b31-f459-578a8fa90c7e@redhat.com>
In-Reply-To: <0cb9e90f-0d9f-8b31-f459-578a8fa90c7e@redhat.com>
From: Andrew Melnichenko <andrew@daynix.com>
Date: Wed, 25 Aug 2021 21:13:38 +0300
Message-ID: <CABcq3pFMHZWLb4bVoUUheqjs-Yp_6eF1MGTyveCm7G0v3o1S1Q@mail.gmail.com>
Subject: Re: [PATCH 1/5] ebpf: Added eBPF initialization by fds and map update.
To: Jason Wang <jasowang@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000003f8b5a05ca663624"
Received-SPF: none client-ip=2607:f8b0:4864:20::236;
 envelope-from=andrew@daynix.com; helo=mail-oi1-x236.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Yan Vugenfirer <yan@daynix.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000003f8b5a05ca663624
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,
Yes - to make the bpf() syscall capabilities are required, which libvirt
have no intentions to give.
Does it make any sense to leave syscall if mmap works?

On Fri, Aug 20, 2021 at 6:34 AM Jason Wang <jasowang@redhat.com> wrote:

>
> =E5=9C=A8 2021/7/13 =E4=B8=8B=E5=8D=8811:37, Andrew Melnychenko =E5=86=99=
=E9=81=93:
> > -static bool ebpf_rss_set_indirections_table(struct EBPFRSSContext *ctx=
,
> > -                                            uint16_t
> *indirections_table,
> > -                                            size_t len)
> > -{
> > -    uint32_t i =3D 0;
> > +    ctx->program_fd =3D program_fd;
> > +    ctx->map_configuration =3D config_fd;
> >
> > -    if (!ebpf_rss_is_loaded(ctx) || indirections_table =3D=3D NULL ||
> > -       len > VIRTIO_NET_RSS_MAX_TABLE_LEN) {
> > +    ctx->mmap_configuration =3D mmap(NULL, qemu_real_host_page_size,
> > +                                   PROT_READ | PROT_WRITE, MAP_SHARED,
> > +                                   ctx->map_configuration, 0);
> > +    if (ctx->mmap_configuration =3D=3D MAP_FAILED) {
> > +        trace_ebpf_error("eBPF RSS", "can not mmap eBPF configuration
> array");
> >           return false;
> >       }
> >
> > -    for (; i < len; ++i) {
> > -        if (bpf_map_update_elem(ctx->map_indirections_table, &i,
> > -                                indirections_table + i, 0) < 0) {
> > -            return false;
> > -        }
> > -    }
> > -    return true;
> > -}
> > -
>
>
> It looks to me you want to drop syscall path for map updating
> completely. I think we'd better keep that for backward compatibility?
>
> Thanks
>
>

--0000000000003f8b5a05ca663624
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div>Yes - to make the bpf() syscall capabil=
ities are required, which libvirt have no intentions to give.<br></div><div=
>Does it make any sense to leave syscall if mmap works?<br></div></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Au=
g 20, 2021 at 6:34 AM Jason Wang &lt;<a href=3D"mailto:jasowang@redhat.com"=
>jasowang@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex"><br>
=E5=9C=A8 2021/7/13 =E4=B8=8B=E5=8D=8811:37, Andrew Melnychenko =E5=86=99=
=E9=81=93:<br>
&gt; -static bool ebpf_rss_set_indirections_table(struct EBPFRSSContext *ct=
x,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 uint16_t *indirections_table,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 size_t len)<br>
&gt; -{<br>
&gt; -=C2=A0 =C2=A0 uint32_t i =3D 0;<br>
&gt; +=C2=A0 =C2=A0 ctx-&gt;program_fd =3D program_fd;<br>
&gt; +=C2=A0 =C2=A0 ctx-&gt;map_configuration =3D config_fd;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 if (!ebpf_rss_is_loaded(ctx) || indirections_table =3D=
=3D NULL ||<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0len &gt; VIRTIO_NET_RSS_MAX_TABLE_LEN) {<b=
r>
&gt; +=C2=A0 =C2=A0 ctx-&gt;mmap_configuration =3D mmap(NULL, qemu_real_hos=
t_page_size,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PROT_READ | PROT_WR=
ITE, MAP_SHARED,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;map_configu=
ration, 0);<br>
&gt; +=C2=A0 =C2=A0 if (ctx-&gt;mmap_configuration =3D=3D MAP_FAILED) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 trace_ebpf_error(&quot;eBPF RSS&quot;, &q=
uot;can not mmap eBPF configuration array&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 for (; i &lt; len; ++i) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (bpf_map_update_elem(ctx-&gt;map_indir=
ections_table, &amp;i,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 indirections_table + i, 0) &lt; =
0) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 return true;<br>
&gt; -}<br>
&gt; -<br>
<br>
<br>
It looks to me you want to drop syscall path for map updating <br>
completely. I think we&#39;d better keep that for backward compatibility?<b=
r>
<br>
Thanks<br>
<br>
</blockquote></div>

--0000000000003f8b5a05ca663624--

