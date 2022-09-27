Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EDE5ECF2C
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 23:15:55 +0200 (CEST)
Received: from localhost ([::1]:54782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odHvl-0003hB-OF
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 17:15:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1odHt5-0001Gx-Bn
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 17:13:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29184)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1odHt1-0003VP-U0
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 17:13:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664313182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FYJ/itSNPVNp5wF21Cq1aN5yDusPi45erJplF6R9cKQ=;
 b=EdsCV1nIV2lb2xsj5FlkeoU1V7QJf5FtLVGPpMVcgq07yzjcm5tey+AhlJ8LerXC+kTzhH
 1b5UdMkV50nrbDJWcUjkAwARDMmWib4+rXUH0kqxWZJWaT6lVmZZD93SLXxkUDd/ohRUze
 j2lCVuuaS7tVyfphTa7X+rRNETfJZwo=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-652--aK9GedeNiGsze_RLhVRJA-1; Tue, 27 Sep 2022 17:13:01 -0400
X-MC-Unique: -aK9GedeNiGsze_RLhVRJA-1
Received: by mail-vs1-f69.google.com with SMTP id
 k12-20020a67ef4c000000b00398774a1c52so1968340vsr.18
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 14:13:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=FYJ/itSNPVNp5wF21Cq1aN5yDusPi45erJplF6R9cKQ=;
 b=ueqLvaOLa1zof8PhAH+ZNWouVk02zJXGO3bvdV7OugbkiivIOhmYndaHbDziPa/EHD
 IBaE0msQHvyRMNd07Z2bQmVyJck/tP+liqLbg29EYHRLGeONpjHCast5hJxoynu1Oh8X
 B+krTf/4hX+cZzjTcTWbqXyXMIawojUp3cV42apYBlTKMvmSYW3Q1xxXl037FJvYU0HF
 wBC2pn0BU0/h2IMiMMsm2lg/GQsGXd+D4ngOQfDch/QbSa71ztY0YRmDa+vPD7uCNhGi
 r68pZwNRGZIdt5t5CUUjjvvKRGqyzMsvJadRsPnNUt2nyi3v5e3LdqDJ2tiEj2nUMFEX
 88nA==
X-Gm-Message-State: ACrzQf3JocxXHMLSks6/SrcQku/cFjo+QNtO4wVxqMviqWVIxE9ilPJK
 IYCUSgM7u8ZOWUsrk6MCQjdk+DmZB8ph9VY4gKDRbKdsai5rxCJy7JKmYZsK9ixl6GV5GU2AtTa
 li/5mee6qfjMiWPfy7TdncH8SJiRnP1o=
X-Received: by 2002:a67:ac4c:0:b0:3a4:b881:4490 with SMTP id
 n12-20020a67ac4c000000b003a4b8814490mr8621005vsh.42.1664313179116; 
 Tue, 27 Sep 2022 14:12:59 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7OKFV9XTojVsP32dkOKXr2ytquh7ZGpUC0uc+2ul1/gLsF3LjAGFZZB9Q75NoZAo+/GuUHXKW/OAzJWKIe8SA=
X-Received: by 2002:a67:ac4c:0:b0:3a4:b881:4490 with SMTP id
 n12-20020a67ac4c000000b003a4b8814490mr8620990vsh.42.1664313178891; Tue, 27
 Sep 2022 14:12:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220826132104.3678958-1-eesposit@redhat.com>
 <20220826132104.3678958-19-eesposit@redhat.com>
 <09759123-8ed4-9c6e-2086-7f65af921a13@yandex-team.ru>
 <508253cf-3134-06ba-b5e6-9f2e594cc9ed@redhat.com>
 <083bbff4-d1b9-6485-a1fc-9f75461a5bb7@yandex-team.ru>
In-Reply-To: <083bbff4-d1b9-6485-a1fc-9f75461a5bb7@yandex-team.ru>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 27 Sep 2022 23:12:46 +0200
Message-ID: <CABgObfY97yNaaK34BsNDfwtmFsqGZ99fYfrHMU0Tu1d9KTBxAA@mail.gmail.com>
Subject: Re: [PATCH v11 18/21] job.c: enable job lock/unlock and remove
 Aiocontext locks
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>, 
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Kevin Wolf <kwolf@redhat.com>, 
 Hanna Reitz <hreitz@redhat.com>, John Snow <jsnow@redhat.com>, 
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>, 
 Xie Changlong <xiechanglong.d@gmail.com>, Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000d2bf9905e9af1b08"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000d2bf9905e9af1b08
Content-Type: text/plain; charset="UTF-8"

Il lun 26 set 2022, 14:21 Vladimir Sementsov-Ogievskiy <
vsementsov@yandex-team.ru> ha scritto:

> On 9/18/22 20:12, Emanuele Giuseppe Esposito wrote:
> >>> --- a/qemu-img.c
> >>> +++ b/qemu-img.c
> >>> @@ -911,7 +911,6 @@ static void run_block_job(BlockJob *job, Error
> >>> **errp)
> >>>        AioContext *aio_context = block_job_get_aio_context(job);
> >>>        int ret = 0;
> >>>    -    aio_context_acquire(aio_context);
> >>>        job_lock();
> >>>        job_ref_locked(&job->job);
> >>>        do {
> >> aio_poll() call here, doesn't require aio_context to be acquired?
> > On the contrary I think, if you see in AIO_WAIT_WHILE we explicitly
> > release it because we don't want to allow something else to run with the
> > aiocontext acquired.
> >
>
> Still, in AIO_WAIT_WHILE() we release ctx_, but do
> aio_poll(qemu_get_aio_context(), true), so we poll in other context.
>
> But here in qemu-img.c we drop aiocontext lock exactly for aio_context,
> which is an argument of aio_poll()..
>

It's the same, the acquire/release is done again in file descriptor
callback or bottom halves (typically via aio_co_wake).

Paolo


> --
> Best regards,
> Vladimir
>
>

--000000000000d2bf9905e9af1b08
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il lun 26 set 2022, 14:21 Vladimir Sementsov-Ogievskiy=
 &lt;<a href=3D"mailto:vsementsov@yandex-team.ru">vsementsov@yandex-team.ru=
</a>&gt; ha scritto:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On 9/18/22 20:=
12, Emanuele Giuseppe Esposito wrote:<br>
&gt;&gt;&gt; --- a/qemu-img.c<br>
&gt;&gt;&gt; +++ b/qemu-img.c<br>
&gt;&gt;&gt; @@ -911,7 +911,6 @@ static void run_block_job(BlockJob *job, E=
rror<br>
&gt;&gt;&gt; **errp)<br>
&gt;&gt;&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 AioContext *aio_context =
=3D block_job_get_aio_context(job);<br>
&gt;&gt;&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int ret =3D 0;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 -=C2=A0=C2=A0=C2=A0 aio_context_acquire(aio_conte=
xt);<br>
&gt;&gt;&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 job_lock();<br>
&gt;&gt;&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 job_ref_locked(&amp;job-&=
gt;job);<br>
&gt;&gt;&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 do {<br>
&gt;&gt; aio_poll() call here, doesn&#39;t require aio_context to be acquir=
ed?<br>
&gt; On the contrary I think, if you see in AIO_WAIT_WHILE we explicitly<br=
>
&gt; release it because we don&#39;t want to allow something else to run wi=
th the<br>
&gt; aiocontext acquired.<br>
&gt; <br>
<br>
Still, in AIO_WAIT_WHILE() we release ctx_, but do aio_poll(qemu_get_aio_co=
ntext(), true), so we poll in other context.<br>
<br>
But here in qemu-img.c we drop aiocontext lock exactly for aio_context, whi=
ch is an argument of aio_poll()..<br></blockquote></div></div><div dir=3D"a=
uto"><br></div><div dir=3D"auto">It&#39;s the same, the acquire/release is =
done again in file descriptor callback or bottom halves (typically via aio_=
co_wake).</div><div dir=3D"auto"><br></div><div dir=3D"auto">Paolo</div><di=
v dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">
<br>
-- <br>
Best regards,<br>
Vladimir<br>
<br>
</blockquote></div></div></div>

--000000000000d2bf9905e9af1b08--


