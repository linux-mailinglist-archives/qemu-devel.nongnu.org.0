Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9440D3301E1
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Mar 2021 15:13:45 +0100 (CET)
Received: from localhost ([::1]:56860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIuAC-0002IC-50
	for lists+qemu-devel@lfdr.de; Sun, 07 Mar 2021 09:13:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mapfelba@redhat.com>)
 id 1lIu8k-0001BU-0y
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 09:12:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mapfelba@redhat.com>)
 id 1lIu8g-0008N1-0H
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 09:12:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615126326;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=iO8DVvajlIVcikSF0+p61sBq7Hsqgvxjh7GtRJ1CB64=;
 b=gHcdHiRDI500TkUBd9fO9H5SM4+BDpB/QqPCZvnRtIsEnELnGl+enu2SlwLxjnCsLw6J3i
 91dLm+TVtuQxdIi2ndT0OhRuitoXIwqrWOF/KLICrS35eqDDEMd4i/L5wgtw5jGg3ufelS
 sII3Un1ZC2i7TOl6z2FEnc2aFmjlD5g=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-533-_ibbNGICMiOWPNaoUSYj-g-1; Sun, 07 Mar 2021 09:12:04 -0500
X-MC-Unique: _ibbNGICMiOWPNaoUSYj-g-1
Received: by mail-ed1-f70.google.com with SMTP id r19so3319851edv.3
 for <qemu-devel@nongnu.org>; Sun, 07 Mar 2021 06:12:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=iO8DVvajlIVcikSF0+p61sBq7Hsqgvxjh7GtRJ1CB64=;
 b=N1fTB4rxGI+dhJwAoVhRQOwrZ6JmZ/Gf0WymuNt3l9vLDpHx5yn+Fmp5uhnG81Xwdx
 dTwksxDZX2s3jqO9CPr6w0JQxMCPpxyvh+XLp54IXbGpc/CqDWxgW5LRHYvWZryuo3f1
 T/UsqaDnonCVtNHNrZ6FrYma6jgTMS/dcm1UYRASaoqWa2OmQEjtn3ljar9FOYta+JJ4
 oEtw6kNdYngWenCKCWuN8AeQtfGD8YypDseasK06yA35rMk7yeTRtSAQyQEbb3PPVpjH
 0mVBDSETWIzt9CJ/Yc02DVy8fwlryUJ1tURQuFaNUKhdyeA3Tcb9AoXEmJ9seDnCf+BB
 ynXQ==
X-Gm-Message-State: AOAM532qgb4HBSQ7O6T8gsS/sxzISArRYKnFSaKMAO0NZQwgpYVObys/
 JEwAbVwZl5VGhc3EZ8vjZcmobu3HeKlc/DsH6+8+ST7pPYjq8BjtmK3kXiqBcaaKrsz9MqSRtAK
 PgzO0IoXEg9pC0lBnjQiwuOnOhO53NZA=
X-Received: by 2002:a17:906:1c13:: with SMTP id
 k19mr11012842ejg.457.1615126323157; 
 Sun, 07 Mar 2021 06:12:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwEx6BNBZIxKLh5S4rbQJSsTDzZzWJqD+rghvOERgk3pWQUWIojkUZt0kmQg0AxwAf87wA9uQ6AIXAo64CuJiY=
X-Received: by 2002:a17:906:1c13:: with SMTP id
 k19mr11012809ejg.457.1615126322934; 
 Sun, 07 Mar 2021 06:12:02 -0800 (PST)
MIME-Version: 1.0
References: <20210305101634.10745-1-david@redhat.com>
 <20210305101634.10745-9-david@redhat.com>
 <20210305154206.GH397383@xz-x1>
 <f577f691-9bdc-a435-9f20-1de62be2241e@redhat.com>
 <20210305155141.GI397383@xz-x1>
 <26dc6c36-5137-5d5e-36f0-2650e42e40ad@redhat.com>
In-Reply-To: <26dc6c36-5137-5d5e-36f0-2650e42e40ad@redhat.com>
From: Marcel Apfelbaum <mapfelba@redhat.com>
Date: Sun, 7 Mar 2021 16:11:51 +0200
Message-ID: <CA+aaKfAc95Y2Eg2AkHELTzOa8DUt=-8feOufuUHF1jbFg5Z8SQ@mail.gmail.com>
Subject: Re: [PATCH v2 8/9] util/mmap-alloc: Support RAM_NORESERVE via
 MAP_NORESERVE
To: David Hildenbrand <david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mapfelba@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000bf0ce905bcf2e6c6"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mapfelba@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: marcel@redhat.com
Cc: Juan Quintela <quintela@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Greg Kurz <groug@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Igor Kotrasinski <i.kotrasinsk@partner.samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000bf0ce905bcf2e6c6
Content-Type: text/plain; charset="UTF-8"

Hi David,

On Sun, Mar 7, 2021 at 3:18 PM David Hildenbrand <david@redhat.com> wrote:

> On 05.03.21 16:51, Peter Xu wrote:
> > On Fri, Mar 05, 2021 at 04:44:36PM +0100, David Hildenbrand wrote:
> >> On 05.03.21 16:42, Peter Xu wrote:
> >>> On Fri, Mar 05, 2021 at 11:16:33AM +0100, David Hildenbrand wrote:
> >>>> +#define OVERCOMMIT_MEMORY_PATH "/proc/sys/vm/overcommit_memory"
> >>>> +static bool map_noreserve_effective(int fd, bool readonly, bool
> shared)
> >>>> +{
> >>>
> >>> [...]
> >>>
> >>>> @@ -184,8 +251,7 @@ void *qemu_ram_mmap(int fd,
> >>>>        size_t offset, total;
> >>>>        void *ptr, *guardptr;
> >>>> -    if (noreserve) {
> >>>> -        error_report("Skipping reservation of swap space is not
> supported");
> >>>> +    if (noreserve && !map_noreserve_effective(fd, shared, readonly))
> {
> >>>
> >>> Need to switch "shared" & "readonly"?
> >>
> >> Indeed, interestingly it has the same effect (as we don't have anonymous
> >> read-only memory in QEMU :) )
> >
> > But note there is still a "g_assert(!shared || fd >= 0);" inside.. :)
>
> Aaaaaand, I just figured that we actually can create shared anonymous
> memory in QEMU, simply via
>
> -object memory-backend-ram,share=on
>
> Introduced in 06329ccecfa0 ("mem: add share parameter to
> memory-backend-ram"). That's also where we introduced the "shared" flag
> for qemu_anon_ram_alloc().
>
> That commit mentions a use case for "RDMA devices in order to remap
> non-contiguous QEMU virtual addresses to a contiguous virtual address
> range.". I fail to understand why that requires sharing RAM with child
> processes.
>
> Especially:
>
> a) qemu_ram_is_shared() returned false before patch #1. RAM_SHARED is
> never set.
>
> b) qemu_ram_remap() does not work as expected?
>
> c) ram_discard_range() is broken with shared anonymous memory. Instead
> of MADV_DONTNEED we need MADV_REMOVE.
>
> This looks like a partially broken feature and I wonder if there is an
> actual user.
>
> @Marcel, can you clarify if there is an actual use case for shared
> anonymous memory in QEMU? I.e., if the original use case that required
> that change is valid? (and why it wasn't able to just use proper shmem)
>
>
As you correctly stated, the PVRDMA device requires remapping of
non-contiguous QEMU
virtual addresses to a contiguous virtual address range.

In order to do so it calls
     mremap (... , MREMAP_MAYMOVE | MREMAP_FIXED, ...)
The above call succeeds only if the memory is marked as "shared".


> Shared anonymous memory is weird.
>

In this case it is not about sharing the memory between different
processes, but about being
able to remap it.

Thanks,
Marcel


>
> --
> Thanks,
>
> David / dhildenb
>
>

--000000000000bf0ce905bcf2e6c6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi David,</div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Mar 7, 2021 at 3:18 PM D=
avid Hildenbrand &lt;<a href=3D"mailto:david@redhat.com">david@redhat.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On=
 05.03.21 16:51, Peter Xu wrote:<br>
&gt; On Fri, Mar 05, 2021 at 04:44:36PM +0100, David Hildenbrand wrote:<br>
&gt;&gt; On 05.03.21 16:42, Peter Xu wrote:<br>
&gt;&gt;&gt; On Fri, Mar 05, 2021 at 11:16:33AM +0100, David Hildenbrand wr=
ote:<br>
&gt;&gt;&gt;&gt; +#define OVERCOMMIT_MEMORY_PATH &quot;/proc/sys/vm/overcom=
mit_memory&quot;<br>
&gt;&gt;&gt;&gt; +static bool map_noreserve_effective(int fd, bool readonly=
, bool shared)<br>
&gt;&gt;&gt;&gt; +{<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; [...]<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; @@ -184,8 +251,7 @@ void *qemu_ram_mmap(int fd,<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t offset, total;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 void *ptr, *guardptr;<br>
&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 if (noreserve) {<br>
&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;Skipping r=
eservation of swap space is not supported&quot;);<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 if (noreserve &amp;&amp; !map_noreserve_eff=
ective(fd, shared, readonly)) {<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Need to switch &quot;shared&quot; &amp; &quot;readonly&quot;?<=
br>
&gt;&gt;<br>
&gt;&gt; Indeed, interestingly it has the same effect (as we don&#39;t have=
 anonymous<br>
&gt;&gt; read-only memory in QEMU :) )<br>
&gt; <br>
&gt; But note there is still a &quot;g_assert(!shared || fd &gt;=3D 0);&quo=
t; inside.. :)<br>
<br>
Aaaaaand, I just figured that we actually can create shared anonymous <br>
memory in QEMU, simply via<br>
<br>
-object memory-backend-ram,share=3Don<br>
<br>
Introduced in 06329ccecfa0 (&quot;mem: add share parameter to <br>
memory-backend-ram&quot;). That&#39;s also where we introduced the &quot;sh=
ared&quot; flag <br>
for qemu_anon_ram_alloc().<br>
<br>
That commit mentions a use case for &quot;RDMA devices in order to remap <b=
r>
non-contiguous QEMU virtual addresses to a contiguous virtual address <br>
range.&quot;. I fail to understand why that requires sharing RAM with child=
 <br>
processes.<br>
<br>
Especially:<br>
<br>
a) qemu_ram_is_shared() returned false before patch #1. RAM_SHARED is <br>
never set.<br>
<br>
b) qemu_ram_remap() does not work as expected?<br>
<br>
c) ram_discard_range() is broken with shared anonymous memory. Instead <br>
of MADV_DONTNEED we need MADV_REMOVE.<br>
<br>
This looks like a partially broken feature and I wonder if there is an <br>
actual user.<br>
<br>
@Marcel, can you clarify if there is an actual use case for shared <br>
anonymous memory in QEMU? I.e., if the original use case that required <br>
that change is valid? (and why it wasn&#39;t able to just use proper shmem)=
<br>
<br></blockquote><div><br></div><div>As you correctly stated, the PVRDMA de=
vice requires remapping of non-contiguous QEMU</div><div>virtual addresses =
to a contiguous virtual address range.</div><div><br></div><div>In order to=
 do so it calls</div><div>=C2=A0 =C2=A0 =C2=A0mremap=C2=A0(... , MREMAP_MAY=
MOVE | MREMAP_FIXED, ...)</div><div>The above call succeeds only if the mem=
ory is marked as &quot;shared&quot;. </div><div>=C2=A0</div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
Shared anonymous memory is weird.<br></blockquote><div><br></div><div>In th=
is case it is not about sharing the memory between different processes, but=
 about being</div><div>able to remap it.<br></div><div><br></div><div>Thank=
s,</div><div>Marcel</div><div>=C2=A0</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
<br>
-- <br>
Thanks,<br>
<br>
David / dhildenb<br>
<br>
</blockquote></div></div>

--000000000000bf0ce905bcf2e6c6--


