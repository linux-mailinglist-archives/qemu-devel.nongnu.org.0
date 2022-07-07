Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA8956AD50
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 23:17:03 +0200 (CEST)
Received: from localhost ([::1]:42228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9Yru-0001lD-HS
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 17:17:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1o9YpS-0000eW-Ui
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 17:14:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1o9YpO-0006p1-94
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 17:14:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657228464;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sZaPdUxXlcaJheop+097Ysil9t5YLkxSHY3SRGMbwSw=;
 b=Rm/5IOPCUm+1wIjzdLDMEHIk40AWA1ar5di0N2Cvun5Ag5eOa3yrzrmjKGVqzJOCtxcSp7
 GMAX/RqmZNSoDPUK6ouXvO9yx3fPlBTPH1M5i3ntQkJGUX1sZc/e9l6zJoyQPMyjCZ98Ya
 K7+PkkOxrtBDjM5amb25KfL3dGgsGCw=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-274-cjpN31S7NNmhCpjNgLNQBg-1; Thu, 07 Jul 2022 17:14:23 -0400
X-MC-Unique: cjpN31S7NNmhCpjNgLNQBg-1
Received: by mail-vs1-f69.google.com with SMTP id
 w188-20020a6762c5000000b003572b8828d8so136453vsb.6
 for <qemu-devel@nongnu.org>; Thu, 07 Jul 2022 14:14:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:content-transfer-encoding:user-agent:mime-version;
 bh=sZaPdUxXlcaJheop+097Ysil9t5YLkxSHY3SRGMbwSw=;
 b=UYdWV6unC1l5TcporbVHpM6EsUJCSYQlk28j8lLk5666vihlGI5B18YqmSMv2f6ghz
 RvYNnw3GBnUVVmLBfgrCZT2ruHbBVRb7ufFBRUoKjE1nuY5DhUUKf+TzQ5njZhuCxM53
 z+dLct87V80Krdm0gEAQ59zddeSFKZC6RAcOtLBvNydQIvPqJ9Ij2eKo638ZX1Gq2NH2
 Fas3pT0vc7Zgc2zuhqHnQdycy3S6I0m5sgnsdeouuh0lJet3k2oi/Bjf/M9CVC1drxQ/
 aGAVRJNlXQ/pTlXDEGuv5FF0jDNNiuCKcEXGtbN24adai29Q+bpkxYWocZ8lQMi6lAq0
 ZvwA==
X-Gm-Message-State: AJIora+/nFUhFF4jL2Ntsuhuo3E/tF0p+5yXc5FgBKgJaXIZ1AUH3Lll
 1OvA91UjdQMVC4e30nF88bRB9ebdSB90VcaqHMDHFGPAlED3zG2xSiP0nv78mnWHQl8vICVNM5u
 r/bAXqbta/Ga097s=
X-Received: by 2002:a67:c019:0:b0:357:93b:978b with SMTP id
 v25-20020a67c019000000b00357093b978bmr7662843vsi.65.1657228462836; 
 Thu, 07 Jul 2022 14:14:22 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sZhXxavTZGi6MYolA0n5qqmuOlS/qGo6u84/mlYCy0LI0wdO6UB5CZNhZQPH+UsgDp4OVzew==
X-Received: by 2002:a67:c019:0:b0:357:93b:978b with SMTP id
 v25-20020a67c019000000b00357093b978bmr7662829vsi.65.1657228462548; 
 Thu, 07 Jul 2022 14:14:22 -0700 (PDT)
Received: from ?IPv6:2804:431:c7ec:44c:8a5c:6c79:3007:b149?
 ([2804:431:c7ec:44c:8a5c:6c79:3007:b149])
 by smtp.gmail.com with ESMTPSA id
 ba16-20020a056102283000b00357329f770dsm642353vsb.21.2022.07.07.14.14.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 14:14:21 -0700 (PDT)
Message-ID: <904f8698a28c27bddbabaa1207a695fe0a832607.camel@redhat.com>
Subject: Re: [PATCH v3 1/3] QIOChannelSocket: Fix zero-copy flush returning
 code 1 when nothing sent
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: "Daniel P." =?ISO-8859-1?Q?Berrang=E9?= <berrange@redhat.com>, Juan
 Quintela <quintela@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Eric Blake <eblake@redhat.com>, Markus Armbruster
 <armbru@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Date: Thu, 07 Jul 2022 18:14:17 -0300
In-Reply-To: <Ysc5hpnTb3k96Ubo@xz-m1.local>
References: <20220704202315.507145-1-leobras@redhat.com>
 <20220704202315.507145-2-leobras@redhat.com> <YsccDel9oiTPqvHW@xz-m1.local>
 <CAJ6HWG5YbABGpacT9hD1dx0-o3Ey8sN++=MxhEaGML62jzQ=xQ@mail.gmail.com>
 <Ysc5hpnTb3k96Ubo@xz-m1.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.3 
MIME-Version: 1.0
Received-SPF: pass client-ip=170.10.133.124; envelope-from=leobras@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Thu, 2022-07-07 at 15:52 -0400, Peter Xu wrote:
> On Thu, Jul 07, 2022 at 04:44:21PM -0300, Leonardo Bras Soares Passos wro=
te:
> > Hello Peter,
> >=20
> > On Thu, Jul 7, 2022 at 2:47 PM Peter Xu <peterx@redhat.com> wrote:
> > >=20
> > > Hi, Leo,
> > >=20
> > > On Mon, Jul 04, 2022 at 05:23:13PM -0300, Leonardo Bras wrote:
> > > > If flush is called when no buffer was sent with MSG_ZEROCOPY, it
> > > > currently
> > > > returns 1. This return code should be used only when Linux fails to=
 use
> > > > MSG_ZEROCOPY on a lot of sendmsg().
> > > >=20
> > > > Fix this by returning early from flush if no sendmsg(...,MSG_ZEROCO=
PY)
> > > > was attempted.
> > > >=20
> > > > Fixes: 2bc58ffc2926 ("QIOChannelSocket: Implement io_writev zero co=
py
> > > > flag & io_flush for CONFIG_LINUX")
> > > > Signed-off-by: Leonardo Bras <leobras@redhat.com>
> > > > ---
> > > > =C2=A0io/channel-socket.c | 8 +++++++-
> > > > =C2=A01 file changed, 7 insertions(+), 1 deletion(-)
> > > >=20
> > > > diff --git a/io/channel-socket.c b/io/channel-socket.c
> > > > index 4466bb1cd4..698c086b70 100644
> > > > --- a/io/channel-socket.c
> > > > +++ b/io/channel-socket.c
> > > > @@ -716,12 +716,18 @@ static int qio_channel_socket_flush(QIOChanne=
l
> > > > *ioc,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 struct cmsghdr *cm;
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 char control[CMSG_SPACE(sizeof(*serr))];
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 int received;
> > > > -=C2=A0=C2=A0=C2=A0 int ret =3D 1;
> > > > +=C2=A0=C2=A0=C2=A0 int ret;
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 if (!sioc->zero_copy_queued) {
> > >=20
> > > I think I asked this in the downstream review but didn't get a
> > > response.. shouldn't this check be "queued =3D=3D sent"?
> >=20
> > This is just supposed to skip flush if nothing was queued for sending.
> > queued =3D=3D sent is tested bellow in the while part.
> >=20
> > Without this, the function could return 1 if nothing was sent with zero=
-
> > copy,
> > and it would be confusing, because the QIOChannel API says 1 should be
> > returned only if all zero-copy sends fell back to copying.
>=20
> I know it won't happen in practise, but.. what if we call flush() without
> sending anything zero-copy-wise at all (so zero_copy_sent > 0,
> zero_copy_queued > 0,=C2=A0

On a no-bug scenario:
- If we don't send anything zero-copy wise, zero_copy_queued will never get
incremented.=C2=A0
- If we don't get inside the while loop in flush, zero_copy_sent will never=
 be
incremented.


But sure, suppose it does get incremented by bug / mistake:=C2=A0
-  zero_copy_queued incremented, zero_copy_sent untouched :=20
 On (queued =3D=3D 0) it will go past the 'if', and get stuck 'forever' in =
the while
loop, since sent will 'never' get incremented.
 On (queued =3D=3D sent), same.
 On (queued <=3D sent), same.

-  zero_copy_queued untouched, zero_copy_sent incremented :
 On 'if (queued =3D=3D 0)' it will not go past the 'if'
 On 'if (queued =3D=3D sent)', will go past the 'if', but will exit on the =
'while',
falsely returning 1.
 On 'if (queued <=3D sent)', it will not go past the 'if'.

-  zero_copy_queued incremented, zero_copy_sent incremented :=20
 On 'if (queued =3D=3D 0)',  infinite loop as above.
 On 'if (queued =3D=3D sent)',=C2=A0
	if sent < queued :  infinite loop ,=C2=A0
	if sent =3D=3D queued : won't go past 'if' ,
       	if sent > queued :  will go past the 'if', but will exit on the
'while', falsely returning 1. =20
 On (queued <=3D sent), infinite loop if sent < queued, not past if otherwi=
se

BTW, I consider it 'infinite loop', but it could also end up returning -1 o=
n any
error.

> meanwhile zero_copy_sent =3D=3D zero_copy_queued)?=C2=A0 Then
> IIUC we'll return 1 even if we didn't do any fallback, or am I wrong?

Having 'if(queued =3D=3D sent)' will cause us to falsely return '1' in two =
buggy
cases, while 'if queued =3D=3D 0) will either skip early or go into 'infini=
te' loop.

Best regards,
Leo

>=20
> >=20
> > Best regards,
> > Leo
> >=20
> > >=20
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
> > > > +=C2=A0=C2=A0=C2=A0 }
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 msg.msg_control =3D control;
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 msg.msg_controllen =3D sizeof(control);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 memset(control, 0, sizeof(control));
> > > >=20
> > > > +=C2=A0=C2=A0=C2=A0 ret =3D 1;
> > > > +
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 while (sioc->zero_copy_sent < sioc->zero_c=
opy_queued) {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 received =3D recvm=
sg(sioc->fd, &msg, MSG_ERRQUEUE);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (received < 0) =
{
> > > > --
> > > > 2.36.1
> > > >=20
> > >=20
> > > --
> > > Peter Xu
> > >=20
> >=20
>=20


