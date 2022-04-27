Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4365114E3
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 12:36:34 +0200 (CEST)
Received: from localhost ([::1]:33524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njf29-0006Vj-Mg
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 06:36:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1njezI-0004zZ-T1
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 06:33:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42282)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1njezF-00084g-Mj
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 06:33:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651055612;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tDoh6IuxbL/dFonyxeT3mjnHQT1cajRa+MXrflwyic4=;
 b=NlR/L+8YvusU8chjDU+KBxaK6HDRjExjsGuplUZWmpt5javhUr2uFoc9zDgHjjmpqN2Mk6
 TBgzy3Ij9kC0Irv6HI2wDV0Amy4efwv/cjN5fmdTWmyx2BvFs294bPKvB5qzV09C/EORob
 2cgqSEx4v6RC9pScdYlI44doFJm7ZSw=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-675-rV3P4WgtNPWAGB0VW7su0g-1; Wed, 27 Apr 2022 06:33:31 -0400
X-MC-Unique: rV3P4WgtNPWAGB0VW7su0g-1
Received: by mail-yb1-f197.google.com with SMTP id
 z14-20020a5b0b0e000000b0064848b628cfso1389137ybp.0
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 03:33:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tDoh6IuxbL/dFonyxeT3mjnHQT1cajRa+MXrflwyic4=;
 b=c9eKJavJgK1zFRuPzWInQInK3UYcVC2mSeD80CJcEzZY2VoQo62BTig2n2ITZGr9iy
 x/1R0R1Vh1TqpllR42vsOyoPK2N6fZ0okWnEf6CLafLWO5DCVxQtLMntja5KAWLVP/of
 UOs0uI6oHMYyw/DXg6ok4215NFDoqm6AlXXCgtaI3E9lgJ0MAy0uCknTU5kbu1rqXVQ4
 +ChLYg32NrLhDsOPr0lnw098s8+ZCffO/HgdxXIsVylLRvZQdkly/QPbTu/xMSzaJCVo
 t4ShvGjEd9UolFl1nSXkezIWVl+tkNEKjRoLqNvHBqd1FtHd15xRH0ToFimRJdZtLpun
 rvtg==
X-Gm-Message-State: AOAM530L+i9hdJpuHnO6YBfTnv9qd3agDcyMUQoFwOddUZDVYJvmMXGh
 9OQtIacQe2EwbQAlPajz79SbZi2q23tIO1sVFPejhxuHv043QtaVK4QxyfvhJc4awPdQ7cKGcoL
 qptpzu6LRMyi8IlyWRmLJCRCiVlee4fU=
X-Received: by 2002:a25:cc0b:0:b0:648:4590:6cb6 with SMTP id
 l11-20020a25cc0b000000b0064845906cb6mr16462751ybf.87.1651055610467; 
 Wed, 27 Apr 2022 03:33:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwiPrqx0vmgY1ooFZv8+EujaH4Z5icDjQlddSsO5AUUT0z7qbX0qJ2RuYtmBne2GJps2fszXNJmkaOZkoKdptM=
X-Received: by 2002:a25:cc0b:0:b0:648:4590:6cb6 with SMTP id
 l11-20020a25cc0b000000b0064845906cb6mr16462740ybf.87.1651055610278; Wed, 27
 Apr 2022 03:33:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220426092715.3931705-1-marcandre.lureau@redhat.com>
 <20220426092715.3931705-26-marcandre.lureau@redhat.com>
 <1a33c268-6d00-4385-f0d2-84a86b022f63@redhat.com>
In-Reply-To: <1a33c268-6d00-4385-f0d2-84a86b022f63@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 27 Apr 2022 14:33:19 +0400
Message-ID: <CAMxuvaye_cx2THfEmk5N3=Z-iqR4=mqa4oGBSg5hCkQdkwMngw@mail.gmail.com>
Subject: Re: [PATCH v2 25/26] tests: replace qemu_set_nonblock()
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Wed, Apr 27, 2022 at 1:41 PM Thomas Huth <thuth@redhat.com> wrote:
>
> On 26/04/2022 11.27, marcandre.lureau@redhat.com wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > The call is POSIX-specific. Use the dedicated GLib API.
>
> g_unix_set_fd_nonblocking() is also available on Unix-like systems accord=
ing
> to its name, I suppose? So what's the advantage of this change?
>

This is a preliminary patch before the last patch
(https://patchew.org/QEMU/20220426092715.3931705-1-marcandre.lureau@redhat.=
com/20220426092715.3931705-27-marcandre.lureau@redhat.com/)

We should reserve qemu_socket_set_*block() usage to socket-like fd.

thanks


>   Thomas
>
>
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >   tests/qtest/vhost-user-test.c | 4 +++-
> >   1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/tests/qtest/vhost-user-test.c b/tests/qtest/vhost-user-tes=
t.c
> > index ee30f5479648..a2cec8768462 100644
> > --- a/tests/qtest/vhost-user-test.c
> > +++ b/tests/qtest/vhost-user-test.c
> > @@ -302,6 +302,7 @@ static int chr_can_read(void *opaque)
> >
> >   static void chr_read(void *opaque, const uint8_t *buf, int size)
> >   {
> > +    g_autoptr(GError) err =3D NULL;
> >       TestServer *s =3D opaque;
> >       CharBackend *chr =3D &s->chr;
> >       VhostUserMsg msg;
> > @@ -394,7 +395,8 @@ static void chr_read(void *opaque, const uint8_t *b=
uf, int size)
> >            * The receive function forces it to be blocking,
> >            * so revert it back to non-blocking.
> >            */
> > -        qemu_set_nonblock(fd);
> > +        g_unix_set_fd_nonblocking(fd, true, &err);
> > +        g_assert_no_error(err);
> >           break;
> >
> >       case VHOST_USER_SET_LOG_BASE:
>


