Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C20826E5A87
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 09:33:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pofp8-00010C-E6; Tue, 18 Apr 2023 03:32:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pofp5-0000yA-W9
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 03:32:20 -0400
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pofoz-0004n0-JP
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 03:32:19 -0400
Received: by mail-lj1-x236.google.com with SMTP id j11so16866556ljq.10
 for <qemu-devel@nongnu.org>; Tue, 18 Apr 2023 00:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681803131; x=1684395131;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=AxwWmIoETH1FDz2qtON/JBr8TJ1/CfcpVR5Pmy29sLc=;
 b=pDicfD5nhvWvsy7ZdWceD/PbwbuT1Si+WxAgwAy7hWCDnDCbK3vsjrwpYWqmVpFIz8
 Nm20nsMVqQw0Ssh0W3vA0Wsd1aoA9Mas5QLfHHn80Oym3e09+d1+TQjxe6O874qrhglB
 vnnhmYvtwy6VO91MiBG+pifG+LXfMN/I1TgZw4RtCpvtvyuC831O/F8oOeS3zpvm+uSM
 8q0C/V1uWLhFIFgHZBimcn/OPnXHVXaZOMt+GUFOHkdj1mchTTEsh8xwBKsFfch/sj3W
 1v5fZOXAwgGtx6PkZdLMCYYyXj2lbGO7IbuVv7LOHRf6NqyocW2SJZBBSPjagu74Mo4X
 Ft6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681803131; x=1684395131;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AxwWmIoETH1FDz2qtON/JBr8TJ1/CfcpVR5Pmy29sLc=;
 b=FkZONiGK/jJJVaj3KQAoI+cdbpL2KbBk4/d53rrLW90KPMl9Rzw1Bcu62lVlj31D1z
 XiSvYj6ZqOLZVmKZPVqJNycJ2HR0/ceX2aKWtv/b3Lde++80ISxiGYv4lLtLkpqKMHqS
 jmyrNdEqq/u/mDI2ghhwblLmPqoCw0ox/T8P0vkZnxjJJUnsRR+y/He4+W9wKBbSGYG/
 JLkBzmvnwIoBH4oGC48l+7z68IwSsfkLmLS3VUlrCBTPcLpBLOOJC955sVWquH3oPMez
 HO31h03fHl7IUsNRdbTDWNmx04oQPyGUzObSp8JJbnSrSYGj4/rjZHWKMmwB8XRYrk3p
 X4Sw==
X-Gm-Message-State: AAQBX9cjocO4I3wuJtqq9iD8rGhahcViD0zkVCBE4hN4iXg3zC47X+5i
 Iwj2PqE2HBxYLHBNmJ7K6giA+0Sbb4zrVBt5wGQ=
X-Google-Smtp-Source: AKy350Z2EVrhdbtUFR71LAev8d1g1XB9qGcnkuBhRHqoh4yRP24gcRl9H5f3VqNqh+roFuJop6wfPTfnpfOZvu6aucA=
X-Received: by 2002:a2e:b0e5:0:b0:2a8:c333:1886 with SMTP id
 h5-20020a2eb0e5000000b002a8c3331886mr428645ljl.6.1681803131271; Tue, 18 Apr
 2023 00:32:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230321161609.716474-1-clg@kaod.org>
 <20230321161609.716474-2-clg@kaod.org>
 <14e4785e-6d3c-0891-1d59-3be4cbd700cd@redhat.com>
 <20230322132717.GA1191181@fedora>
 <83dc812a-9d6c-230e-8ed5-2685494c1683@linaro.org>
In-Reply-To: <83dc812a-9d6c-230e-8ed5-2685494c1683@linaro.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 18 Apr 2023 11:31:59 +0400
Message-ID: <CAJ+F1CJtmY4wC5R1hu=3+Q0Ky1kvC4JGP1_x_FvavBbDdc5K3Q@mail.gmail.com>
Subject: Re: [PATCH for-8.0 v2 1/3] async: Suppress GCC13 false positive in
 aio_bh_poll()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000038c0d505f9974e8c"
Received-SPF: pass client-ip=2a00:1450:4864:20::236;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x236.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--00000000000038c0d505f9974e8c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Mar 22, 2023 at 6:42=E2=80=AFPM Philippe Mathieu-Daud=C3=A9 <philmd=
@linaro.org>
wrote:

> On 22/3/23 14:27, Stefan Hajnoczi wrote:
> > On Wed, Mar 22, 2023 at 08:11:37AM +0100, Thomas Huth wrote:
> >> On 21/03/2023 17.16, C=C3=A9dric Le Goater wrote:
> >>> From: C=C3=A9dric Le Goater <clg@redhat.com>
> >>>
> >>> GCC13 reports an error :
> >>>
> >>> ../util/async.c: In function =E2=80=98aio_bh_poll=E2=80=99:
> >>> include/qemu/queue.h:303:22: error: storing the address of local
> variable =E2=80=98slice=E2=80=99 in =E2=80=98*ctx.bh_slice_list.sqh_last=
=E2=80=99
> [-Werror=3Ddangling-pointer=3D]
> >>>     303 |     (head)->sqh_last =3D &(elm)->field.sqe_next;
>             \
> >>>         |     ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
> >>> ../util/async.c:169:5: note: in expansion of macro
> =E2=80=98QSIMPLEQ_INSERT_TAIL=E2=80=99
> >>>     169 |     QSIMPLEQ_INSERT_TAIL(&ctx->bh_slice_list, &slice, next)=
;
> >>>         |     ^~~~~~~~~~~~~~~~~~~~
> >>> ../util/async.c:161:17: note: =E2=80=98slice=E2=80=99 declared here
> >>>     161 |     BHListSlice slice;
> >>>         |                 ^~~~~
> >>> ../util/async.c:161:17: note: =E2=80=98ctx=E2=80=99 declared here
> >>>
> >>> But the local variable 'slice' is removed from the global context lis=
t
> >>> in following loop of the same routine. Add a pragma to silent GCC.
> >>>
> >>> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> >>> Cc: Paolo Bonzini <pbonzini@redhat.com>
> >>> Cc: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> >>> Signed-off-by: C=C3=A9dric Le Goater <clg@redhat.com>
> >>> ---
> >>>    util/async.c | 13 +++++++++++++
> >>>    1 file changed, 13 insertions(+)
> >>>
> >>> diff --git a/util/async.c b/util/async.c
> >>> index 21016a1ac7..de9b431236 100644
> >>> --- a/util/async.c
> >>> +++ b/util/async.c
> >>> @@ -164,7 +164,20 @@ int aio_bh_poll(AioContext *ctx)
> >>>        /* Synchronizes with QSLIST_INSERT_HEAD_ATOMIC in
> aio_bh_enqueue().  */
> >>>        QSLIST_MOVE_ATOMIC(&slice.bh_list, &ctx->bh_list);
> >>> +
> >>> +    /*
> >>> +     * GCC13 [-Werror=3Ddangling-pointer=3D] complains that the loca=
l
> variable
> >>> +     * 'slice' is being stored in the global 'ctx->bh_slice_list' bu=
t
> the
> >>> +     * list is emptied before this function returns.
> >>> +     */
> >>> +#if !defined(__clang__)
> >>> +#pragma GCC diagnostic push
> >>> +#pragma GCC diagnostic ignored "-Wdangling-pointer=3D"
> >>
> >> That warning parameter looks like a new one in GCC 13 ?
> >> ... so you have to check whether it's available before disabling
> >> it, otherwise this will fail with older versions of GCC. I just
> >> gave it a try with my GCC 8.5 and got this:
> >>
> >> ../../devel/qemu/util/async.c: In function =E2=80=98aio_bh_poll=E2=80=
=99:
> >> ../../devel/qemu/util/async.c:175:32: error: unknown option after
> =E2=80=98#pragma GCC diagnostic=E2=80=99 kind [-Werror=3Dpragmas]
> >>   #pragma GCC diagnostic ignored "-Wdangling-pointer=3D"
> >>                                  ^~~~~~~~~~~~~~~~~~~~~
> >> cc1: all warnings being treated as errors
> >>
> >>   Thomas
> >>
> >> What about reworking the code like this:
> >>
> >> diff --git a/util/async.c b/util/async.c
> >> index 21016a1ac7..b236bdfbd8 100644
> >> --- a/util/async.c
> >> +++ b/util/async.c
> >> @@ -156,15 +156,14 @@ void aio_bh_call(QEMUBH *bh)
> >>   }
> >>   /* Multiple occurrences of aio_bh_poll cannot be called concurrently=
.
> */
> >> -int aio_bh_poll(AioContext *ctx)
> >> +static int aio_bh_poll_slice(AioContext *ctx, BHListSlice *slice)
> >>   {
> >> -    BHListSlice slice;
> >>       BHListSlice *s;
> >>       int ret =3D 0;
> >>       /* Synchronizes with QSLIST_INSERT_HEAD_ATOMIC in
> aio_bh_enqueue().  */
> >> -    QSLIST_MOVE_ATOMIC(&slice.bh_list, &ctx->bh_list);
> >> -    QSIMPLEQ_INSERT_TAIL(&ctx->bh_slice_list, &slice, next);
> >> +    QSLIST_MOVE_ATOMIC(&slice->bh_list, &ctx->bh_list);
> >> +    QSIMPLEQ_INSERT_TAIL(&ctx->bh_slice_list, slice, next);
> >>       while ((s =3D QSIMPLEQ_FIRST(&ctx->bh_slice_list))) {
> >>           QEMUBH *bh;
> >> @@ -191,6 +190,13 @@ int aio_bh_poll(AioContext *ctx)
> >>       return ret;
> >>   }
> >> +int aio_bh_poll(AioContext *ctx)
> >> +{
> >> +    BHListSlice slice;
> >> +
> >> +    return aio_bh_poll_slice(ctx, &slice);
> >> +}
> >> +
> >>   void qemu_bh_schedule_idle(QEMUBH *bh)
> >>   {
> >>       aio_bh_enqueue(bh, BH_SCHEDULED | BH_IDLE);
> >>
> >> Would that work with GCC 13 and be acceptable?
> >
> > Fine by me. Please add a comment into aio_bh_poll() explaining that thi=
s
> > wrapper function exists to silence the gcc dangling-pointer warning.
> > Otherwise someone may be tempted to remove the function.
>
> IMO by using #pragmas it is clearer this is a kludge. Also we can
> revert this commit adding the pragmas/comment once the compiler
> are fixed.
>
>
up

fwiw,bBoth solutions look fine to me, as long as there is a comment
explaining it.

--=20
Marc-Andr=C3=A9 Lureau

--00000000000038c0d505f9974e8c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 22, 2023 at 6:42=E2=80=
=AFPM Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@linaro.org">=
philmd@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">On 22/3/23 14:27, Stefan Hajnoczi wrote:<br>
&gt; On Wed, Mar 22, 2023 at 08:11:37AM +0100, Thomas Huth wrote:<br>
&gt;&gt; On 21/03/2023 17.16, C=C3=A9dric Le Goater wrote:<br>
&gt;&gt;&gt; From: C=C3=A9dric Le Goater &lt;<a href=3D"mailto:clg@redhat.c=
om" target=3D"_blank">clg@redhat.com</a>&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; GCC13 reports an error :<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; ../util/async.c: In function =E2=80=98aio_bh_poll=E2=80=99:<br=
>
&gt;&gt;&gt; include/qemu/queue.h:303:22: error: storing the address of loc=
al variable =E2=80=98slice=E2=80=99 in =E2=80=98*ctx.bh_slice_list.sqh_last=
=E2=80=99 [-Werror=3Ddangling-pointer=3D]<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0303 |=C2=A0 =C2=A0 =C2=A0(head)-&gt;sqh_las=
t =3D &amp;(elm)-&gt;field.sqe_next;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0~~~~~~~~=
~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~<br>
&gt;&gt;&gt; ../util/async.c:169:5: note: in expansion of macro =E2=80=98QS=
IMPLEQ_INSERT_TAIL=E2=80=99<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0169 |=C2=A0 =C2=A0 =C2=A0QSIMPLEQ_INSERT_TA=
IL(&amp;ctx-&gt;bh_slice_list, &amp;slice, next);<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0^~~~~~~~=
~~~~~~~~~~~~<br>
&gt;&gt;&gt; ../util/async.c:161:17: note: =E2=80=98slice=E2=80=99 declared=
 here<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0161 |=C2=A0 =C2=A0 =C2=A0BHListSlice slice;=
<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~<br>
&gt;&gt;&gt; ../util/async.c:161:17: note: =E2=80=98ctx=E2=80=99 declared h=
ere<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; But the local variable &#39;slice&#39; is removed from the glo=
bal context list<br>
&gt;&gt;&gt; in following loop of the same routine. Add a pragma to silent =
GCC.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Cc: Stefan Hajnoczi &lt;<a href=3D"mailto:stefanha@redhat.com"=
 target=3D"_blank">stefanha@redhat.com</a>&gt;<br>
&gt;&gt;&gt; Cc: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" t=
arget=3D"_blank">pbonzini@redhat.com</a>&gt;<br>
&gt;&gt;&gt; Cc: Daniel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@red=
hat.com" target=3D"_blank">berrange@redhat.com</a>&gt;<br>
&gt;&gt;&gt; Signed-off-by: C=C3=A9dric Le Goater &lt;<a href=3D"mailto:clg=
@redhat.com" target=3D"_blank">clg@redhat.com</a>&gt;<br>
&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 util/async.c | 13 +++++++++++++<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 1 file changed, 13 insertions(+)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; diff --git a/util/async.c b/util/async.c<br>
&gt;&gt;&gt; index 21016a1ac7..de9b431236 100644<br>
&gt;&gt;&gt; --- a/util/async.c<br>
&gt;&gt;&gt; +++ b/util/async.c<br>
&gt;&gt;&gt; @@ -164,7 +164,20 @@ int aio_bh_poll(AioContext *ctx)<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Synchronizes with QSLIST_INSERT_=
HEAD_ATOMIC in aio_bh_enqueue().=C2=A0 */<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 QSLIST_MOVE_ATOMIC(&amp;slice.bh_li=
st, &amp;ctx-&gt;bh_list);<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 /*<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0* GCC13 [-Werror=3Ddangling-pointer=3D] c=
omplains that the local variable<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0* &#39;slice&#39; is being stored in the =
global &#39;ctx-&gt;bh_slice_list&#39; but the<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0* list is emptied before this function re=
turns.<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt;&gt;&gt; +#if !defined(__clang__)<br>
&gt;&gt;&gt; +#pragma GCC diagnostic push<br>
&gt;&gt;&gt; +#pragma GCC diagnostic ignored &quot;-Wdangling-pointer=3D&qu=
ot;<br>
&gt;&gt;<br>
&gt;&gt; That warning parameter looks like a new one in GCC 13 ?<br>
&gt;&gt; ... so you have to check whether it&#39;s available before disabli=
ng<br>
&gt;&gt; it, otherwise this will fail with older versions of GCC. I just<br=
>
&gt;&gt; gave it a try with my GCC 8.5 and got this:<br>
&gt;&gt;<br>
&gt;&gt; ../../devel/qemu/util/async.c: In function =E2=80=98aio_bh_poll=E2=
=80=99:<br>
&gt;&gt; ../../devel/qemu/util/async.c:175:32: error: unknown option after =
=E2=80=98#pragma GCC diagnostic=E2=80=99 kind [-Werror=3Dpragmas]<br>
&gt;&gt;=C2=A0 =C2=A0#pragma GCC diagnostic ignored &quot;-Wdangling-pointe=
r=3D&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~~~~~~~~~~~<=
br>
&gt;&gt; cc1: all warnings being treated as errors<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0Thomas<br>
&gt;&gt;<br>
&gt;&gt; What about reworking the code like this:<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/util/async.c b/util/async.c<br>
&gt;&gt; index 21016a1ac7..b236bdfbd8 100644<br>
&gt;&gt; --- a/util/async.c<br>
&gt;&gt; +++ b/util/async.c<br>
&gt;&gt; @@ -156,15 +156,14 @@ void aio_bh_call(QEMUBH *bh)<br>
&gt;&gt;=C2=A0 =C2=A0}<br>
&gt;&gt;=C2=A0 =C2=A0/* Multiple occurrences of aio_bh_poll cannot be calle=
d concurrently. */<br>
&gt;&gt; -int aio_bh_poll(AioContext *ctx)<br>
&gt;&gt; +static int aio_bh_poll_slice(AioContext *ctx, BHListSlice *slice)=
<br>
&gt;&gt;=C2=A0 =C2=A0{<br>
&gt;&gt; -=C2=A0 =C2=A0 BHListSlice slice;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0BHListSlice *s;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret =3D 0;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Synchronizes with QSLIST_INSERT_HEAD_=
ATOMIC in aio_bh_enqueue().=C2=A0 */<br>
&gt;&gt; -=C2=A0 =C2=A0 QSLIST_MOVE_ATOMIC(&amp;slice.bh_list, &amp;ctx-&gt=
;bh_list);<br>
&gt;&gt; -=C2=A0 =C2=A0 QSIMPLEQ_INSERT_TAIL(&amp;ctx-&gt;bh_slice_list, &a=
mp;slice, next);<br>
&gt;&gt; +=C2=A0 =C2=A0 QSLIST_MOVE_ATOMIC(&amp;slice-&gt;bh_list, &amp;ctx=
-&gt;bh_list);<br>
&gt;&gt; +=C2=A0 =C2=A0 QSIMPLEQ_INSERT_TAIL(&amp;ctx-&gt;bh_slice_list, sl=
ice, next);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0while ((s =3D QSIMPLEQ_FIRST(&amp;ctx-&g=
t;bh_slice_list))) {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QEMUBH *bh;<br>
&gt;&gt; @@ -191,6 +190,13 @@ int aio_bh_poll(AioContext *ctx)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt;&gt;=C2=A0 =C2=A0}<br>
&gt;&gt; +int aio_bh_poll(AioContext *ctx)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0 =C2=A0 BHListSlice slice;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 return aio_bh_poll_slice(ctx, &amp;slice);<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0void qemu_bh_schedule_idle(QEMUBH *bh)<br>
&gt;&gt;=C2=A0 =C2=A0{<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0aio_bh_enqueue(bh, BH_SCHEDULED | BH_IDL=
E);<br>
&gt;&gt;<br>
&gt;&gt; Would that work with GCC 13 and be acceptable?<br>
&gt; <br>
&gt; Fine by me. Please add a comment into aio_bh_poll() explaining that th=
is<br>
&gt; wrapper function exists to silence the gcc dangling-pointer warning.<b=
r>
&gt; Otherwise someone may be tempted to remove the function.<br>
<br>
IMO by using #pragmas it is clearer this is a kludge. Also we can<br>
revert this commit adding the pragmas/comment once the compiler<br>
are fixed.<br>
<br>
</blockquote></div><div><br></div><div>up</div><div><br></div><div>fwiw,bBo=
th solutions look fine to me, as long as there is a comment explaining it.<=
br></div><br><span class=3D"gmail_signature_prefix">-- </span><br><div dir=
=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000038c0d505f9974e8c--

