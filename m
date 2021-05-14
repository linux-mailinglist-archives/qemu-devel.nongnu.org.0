Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0F0380F59
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 19:57:09 +0200 (CEST)
Received: from localhost ([::1]:42268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhc3g-00044U-Pd
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 13:57:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lhc2N-00035o-BD
 for qemu-devel@nongnu.org; Fri, 14 May 2021 13:55:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lhc2K-00020O-EY
 for qemu-devel@nongnu.org; Fri, 14 May 2021 13:55:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621014943;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Gw2dcLV015cVQHE/+/7CdqfoIAYczf0/dfBZokzuWzE=;
 b=G0wqYpcIPNDRVQbrjDFZkvAS7F7YpGatzn0vulVBVvsn1+feHR0K3MN2qAgZQhlIpfmc6n
 DhCCdsXuEhSz+ytoqYqJ2kNq8yRgHfJBVyMsHJBUMZtQ3mmZG5q6MaqrJ4PwvfugyJIW0m
 7hMJuUhKh53t1msiOo/IciSmnZOEtIs=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-547-dXBXVQNCPSyTRTr2kdQffA-1; Fri, 14 May 2021 13:55:41 -0400
X-MC-Unique: dXBXVQNCPSyTRTr2kdQffA-1
Received: by mail-pg1-f198.google.com with SMTP id
 15-20020a630c4f0000b029021a6da9af28so657010pgm.22
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 10:55:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Gw2dcLV015cVQHE/+/7CdqfoIAYczf0/dfBZokzuWzE=;
 b=a4jFG+9T/SKXb9kEp5LmWVgEWQ9/VAg96bUq/+Zicd5ep037qIVnjbs8psObCoAol7
 6XaIc41b/dXgouX0EWwH6efft2XXrSMMrV2GpxnqoIGrKOXqvwB3d+/Kp9Z6JEhz/ke0
 8ICMNH2AkegIAd8wHDge+XcH2Pds3EFDq7uoTrgb5MT1dYqD4P2kJax/p/tANUKhY3Ur
 iL+sagRE6ty/xoTxZM7Oc389WUEE+BocxVzkRUhtnIrn/i2h2y2nh1GTbAPK10cEJkzn
 oDMFxTEG3Jcqig0u4AdKFypBrHOtZa7Bs9wzyl7dAAkFfoh30U9zLznHrt/07SfVkA/0
 B8XA==
X-Gm-Message-State: AOAM533dbbfwPKrI+Wy1WyGSnzF76lPTZJ1WdjJMNuoHw4iJ5iGaw5eg
 pu5NJrgaeARIqBP14eZJoByScNwCIEYJq2yg6wX9dbm1t8hKHXu4BGjyrscqFUr/0mEgjNacsd3
 E7IFeHiwfrOkBECWJHcFcujMdQ5iISac=
X-Received: by 2002:a63:752:: with SMTP id 79mr12196797pgh.10.1621014940012;
 Fri, 14 May 2021 10:55:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzvjH7ujmISmYZ6DDLsnUuNCD15ApBs6a02NJ6GW725zOT+EzyYm6wYMKQXspfxjTpsSAvQVPrZsPVh9bNnhsI=
X-Received: by 2002:a63:752:: with SMTP id 79mr12196782pgh.10.1621014939732;
 Fri, 14 May 2021 10:55:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210510085941.22769-1-eesposit@redhat.com>
 <20210510085941.22769-6-eesposit@redhat.com>
 <YJv3+y42z0Ld1nY0@stefanha-x1.localdomain>
 <6d1e432e-f18a-39a4-0bb6-2a14347c2905@redhat.com>
In-Reply-To: <6d1e432e-f18a-39a4-0bb6-2a14347c2905@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 14 May 2021 19:55:25 +0200
Message-ID: <CABgObfamNZ_2XNHKgEBKXs0XjvhBXnqMVq6jYj+WDojBkJ9cDw@mail.gmail.com>
Subject: Re: [PATCH 5/6] co-shared-resource: protect with a mutex
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000a8a51005c24df368"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 qemu-devel <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000a8a51005c24df368
Content-Type: text/plain; charset="UTF-8"

Il ven 14 mag 2021, 16:10 Emanuele Giuseppe Esposito <eesposit@redhat.com>
ha scritto:

> > I'm not sure I like it since callers may still need coarser grained
> > locks to protect their own state or synchronize access to multiple
> > items of data. Also, some callers may not need thread-safety.
> >
> > Can the caller to be responsible for locking instead (e.g. using
> > CoMutex)?
>
> Right now co-shared-resource is being used only by block-copy, so I
> guess locking it from the caller or within the API won't really matter
> in this case.
>
> One possible idea on how to delegate this to the caller without adding
> additional small lock/unlock in block-copy is to move co_get_from_shres
> in block_copy_task_end, and calling it only when a boolean passed to
> block_copy_task_end is true.
>

The patch below won't work because qemu_co_queue_wait would have to unlock
the CoMutex; therefore you would have to pass it as an additional argument
to co_get_from_shres.

Overall, neither co_get_from_shres not AioTaskPool should be fast paths, so
using a local lock seems to produce the simplest API.

Paolo


> Otherwise make b_c_task_end always call co_get_from_shres and then
> include co_get_from_shres in block_copy_task_create, so that we always
> add and in case remove (if error) in the shared resource.
>
> Something like:
>
> diff --git a/block/block-copy.c b/block/block-copy.c
> index 3a447a7c3d..1e4914b0cb 100644
> --- a/block/block-copy.c
> +++ b/block/block-copy.c
> @@ -233,6 +233,7 @@ static coroutine_fn BlockCopyTask
> *block_copy_task_create(BlockCopyState *s,
>       /* region is dirty, so no existent tasks possible in it */
>       assert(!find_conflicting_task(s, offset, bytes));
>       QLIST_INSERT_HEAD(&s->tasks, task, list);
> +    co_get_from_shres(s->mem, task->bytes);
>       qemu_co_mutex_unlock(&s->tasks_lock);
>
>       return task;
> @@ -269,6 +270,7 @@ static void coroutine_fn
> block_copy_task_end(BlockCopyTask *task, int ret)
>           bdrv_set_dirty_bitmap(task->s->copy_bitmap, task->offset,
> task->bytes);
>       }
>       qemu_co_mutex_lock(&task->s->tasks_lock);
> +    co_put_to_shres(task->s->mem, task->bytes);
>       task->s->in_flight_bytes -= task->bytes;
>       QLIST_REMOVE(task, list);
>       progress_set_remaining(task->s->progress,
> @@ -379,7 +381,6 @@ static coroutine_fn int
> block_copy_task_run(AioTaskPool *pool,
>
>       aio_task_pool_wait_slot(pool);
>       if (aio_task_pool_status(pool) < 0) {
> -        co_put_to_shres(task->s->mem, task->bytes);
>           block_copy_task_end(task, -ECANCELED);
>           g_free(task);
>           return -ECANCELED;
> @@ -498,7 +499,6 @@ static coroutine_fn int
> block_copy_task_entry(AioTask *task)
>       }
>       qemu_mutex_unlock(&t->s->calls_lock);
>
> -    co_put_to_shres(t->s->mem, t->bytes);
>       block_copy_task_end(t, ret);
>
>       return ret;
> @@ -687,8 +687,6 @@ block_copy_dirty_clusters(BlockCopyCallState
> *call_state)
>
>           trace_block_copy_process(s, task->offset);
>
> -        co_get_from_shres(s->mem, task->bytes);
> -
>           offset = task_end(task);
>           bytes = end - offset;
>
>
>
>
> >
> >> diff --git a/util/qemu-co-shared-resource.c
> b/util/qemu-co-shared-resource.c
> >> index 1c83cd9d29..c455d02a1e 100644
> >> --- a/util/qemu-co-shared-resource.c
> >> +++ b/util/qemu-co-shared-resource.c
> >> @@ -32,6 +32,7 @@ struct SharedResource {
> >>       uint64_t available;
> >>
> >>       CoQueue queue;
> >> +    QemuMutex lock;
> >
> > Please add a comment indicating what this lock protects.
> >
> > Thread safety should also be documented in the header file so API users
> > know what to expect.
>
> Will do, thanks.
>
> Emanuele
>
>

--000000000000a8a51005c24df368
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il ven 14 mag 2021, 16:10 Emanuele Giuseppe Esposito &=
lt;<a href=3D"mailto:eesposit@redhat.com">eesposit@redhat.com</a>&gt; ha sc=
ritto:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex">&gt; I&#39;m not sure I like=
 it since callers may still need coarser grained<br>
&gt; locks to protect their own state or synchronize access to multiple<br>
&gt; items of data. Also, some callers may not need thread-safety.<br>
&gt; <br>
&gt; Can the caller to be responsible for locking instead (e.g. using<br>
&gt; CoMutex)?<br>
<br>
Right now co-shared-resource is being used only by block-copy, so I <br>
guess locking it from the caller or within the API won&#39;t really matter =
<br>
in this case.<br>
<br>
One possible idea on how to delegate this to the caller without adding <br>
additional small lock/unlock in block-copy is to move co_get_from_shres <br=
>
in block_copy_task_end, and calling it only when a boolean passed to <br>
block_copy_task_end is true.<br></blockquote></div></div><div dir=3D"auto">=
<br></div><div dir=3D"auto">The patch below won&#39;t work because qemu_co_=
queue_wait would have to unlock the CoMutex; therefore you would have to pa=
ss it as an additional argument to=C2=A0<span style=3D"font-family:sans-ser=
if">co_get_from_shres.</span></div><div dir=3D"auto"><span style=3D"font-fa=
mily:sans-serif"><br></span></div><div dir=3D"auto"><span style=3D"font-fam=
ily:sans-serif">Overall, neither co_get_from_shres not AioTaskPool should b=
e fast paths, so using a local lock seems to produce the simplest API.</spa=
n></div><div dir=3D"auto"><span style=3D"font-family:sans-serif"><br></span=
></div><div dir=3D"auto"><span style=3D"font-family:sans-serif">Paolo</span=
></div><div dir=3D"auto"><span style=3D"font-family:sans-serif"><br></span>=
</div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex">
<br>
Otherwise make b_c_task_end always call co_get_from_shres and then <br>
include co_get_from_shres in block_copy_task_create, so that we always <br>
add and in case remove (if error) in the shared resource.<br>
<br>
Something like:<br>
<br>
diff --git a/block/block-copy.c b/block/block-copy.c<br>
index 3a447a7c3d..1e4914b0cb 100644<br>
--- a/block/block-copy.c<br>
+++ b/block/block-copy.c<br>
@@ -233,6 +233,7 @@ static coroutine_fn BlockCopyTask <br>
*block_copy_task_create(BlockCopyState *s,<br>
=C2=A0 =C2=A0 =C2=A0 /* region is dirty, so no existent tasks possible in i=
t */<br>
=C2=A0 =C2=A0 =C2=A0 assert(!find_conflicting_task(s, offset, bytes));<br>
=C2=A0 =C2=A0 =C2=A0 QLIST_INSERT_HEAD(&amp;s-&gt;tasks, task, list);<br>
+=C2=A0 =C2=A0 co_get_from_shres(s-&gt;mem, task-&gt;bytes);<br>
=C2=A0 =C2=A0 =C2=A0 qemu_co_mutex_unlock(&amp;s-&gt;tasks_lock);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 return task;<br>
@@ -269,6 +270,7 @@ static void coroutine_fn <br>
block_copy_task_end(BlockCopyTask *task, int ret)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bdrv_set_dirty_bitmap(task-&gt;s-&gt;cop=
y_bitmap, task-&gt;offset, <br>
task-&gt;bytes);<br>
=C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 qemu_co_mutex_lock(&amp;task-&gt;s-&gt;tasks_lock);<br=
>
+=C2=A0 =C2=A0 co_put_to_shres(task-&gt;s-&gt;mem, task-&gt;bytes);<br>
=C2=A0 =C2=A0 =C2=A0 task-&gt;s-&gt;in_flight_bytes -=3D task-&gt;bytes;<br=
>
=C2=A0 =C2=A0 =C2=A0 QLIST_REMOVE(task, list);<br>
=C2=A0 =C2=A0 =C2=A0 progress_set_remaining(task-&gt;s-&gt;progress,<br>
@@ -379,7 +381,6 @@ static coroutine_fn int <br>
block_copy_task_run(AioTaskPool *pool,<br>
<br>
=C2=A0 =C2=A0 =C2=A0 aio_task_pool_wait_slot(pool);<br>
=C2=A0 =C2=A0 =C2=A0 if (aio_task_pool_status(pool) &lt; 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 co_put_to_shres(task-&gt;s-&gt;mem, task-&gt;b=
ytes);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 block_copy_task_end(task, -ECANCELED);<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(task);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ECANCELED;<br>
@@ -498,7 +499,6 @@ static coroutine_fn int <br>
block_copy_task_entry(AioTask *task)<br>
=C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock(&amp;t-&gt;s-&gt;calls_lock);<br>
<br>
-=C2=A0 =C2=A0 co_put_to_shres(t-&gt;s-&gt;mem, t-&gt;bytes);<br>
=C2=A0 =C2=A0 =C2=A0 block_copy_task_end(t, ret);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 return ret;<br>
@@ -687,8 +687,6 @@ block_copy_dirty_clusters(BlockCopyCallState <br>
*call_state)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 trace_block_copy_process(s, task-&gt;off=
set);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 co_get_from_shres(s-&gt;mem, task-&gt;bytes);<=
br>
-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 offset =3D task_end(task);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bytes =3D end - offset;<br>
<br>
<br>
<br>
<br>
&gt; <br>
&gt;&gt; diff --git a/util/qemu-co-shared-resource.c b/util/qemu-co-shared-=
resource.c<br>
&gt;&gt; index 1c83cd9d29..c455d02a1e 100644<br>
&gt;&gt; --- a/util/qemu-co-shared-resource.c<br>
&gt;&gt; +++ b/util/qemu-co-shared-resource.c<br>
&gt;&gt; @@ -32,6 +32,7 @@ struct SharedResource {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t available;<br>
&gt;&gt;=C2=A0 =C2=A0<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0CoQueue queue;<br>
&gt;&gt; +=C2=A0 =C2=A0 QemuMutex lock;<br>
&gt; <br>
&gt; Please add a comment indicating what this lock protects.<br>
&gt; <br>
&gt; Thread safety should also be documented in the header file so API user=
s<br>
&gt; know what to expect.<br>
<br>
Will do, thanks.<br>
<br>
Emanuele<br>
<br>
</blockquote></div></div></div>

--000000000000a8a51005c24df368--


