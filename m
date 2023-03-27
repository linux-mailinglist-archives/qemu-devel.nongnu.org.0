Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6794A6CA804
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 16:45:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgo5k-0005Zo-Jn; Mon, 27 Mar 2023 10:45:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <casantos@redhat.com>)
 id 1pgo5g-0005ZT-Fb
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 10:44:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <casantos@redhat.com>)
 id 1pgo5e-00084A-UL
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 10:44:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679928294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=taTe2ZO0nsXlSRaAczTuEBaLhDeQPeK+/HUoyJd7LkA=;
 b=Rkj/96K+x82T9bZ2hHrgVFn42sDShAzZBm49EfNhprg0hAUxh/WJZeL9XlXrxOE+STBgjS
 18SMnbAskmHOkOsITZs2NUIBxPaxcBxfvZt+mmyxNDUboK4+McYJzJuEgjmO4ZOq47LXpU
 Ua9oqvjwmfUYlXetyMi6xOSvgHJ0hEI=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-49-GgrEvEn0OWqnWbL2Tyi6Cw-1; Mon, 27 Mar 2023 10:44:44 -0400
X-MC-Unique: GgrEvEn0OWqnWbL2Tyi6Cw-1
Received: by mail-oa1-f71.google.com with SMTP id
 586e51a60fabf-17abb9d4b67so5283840fac.5
 for <qemu-devel@nongnu.org>; Mon, 27 Mar 2023 07:44:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679928283;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=taTe2ZO0nsXlSRaAczTuEBaLhDeQPeK+/HUoyJd7LkA=;
 b=LE2cchBOCEO4L2FvfAPKl8c4sKFU06u7S1oXeuSNm7HIswEjJGjfqEtJPz+pC8zd5p
 N42SoBpLnXuA1cbYY6VTNUjLFAa+KMIBV0dK2TdBhx8pbOvx1MlvZl4AAiAkoAkjQSgi
 /wNi+DCzK07iH9ci5aiU0qsDYweit/JYbxEuyCa2b9avLJLR9o3dM0FpRHpTnCf6Tps6
 Ql54jAKA5B4f5BBR1e/i/CwSTy0ZGoHKmeureXiFUFMS77GPTEtLz/toa6MKonz/M/7K
 0DnVzefyagLU7Uyd+0sup5tpozzBRrbwy7uEYCaHgff3yI5Mq4eLbhrqKGzjABwEhqxj
 StsQ==
X-Gm-Message-State: AO0yUKVeICoVGUZK3gqEPrlyqh++JGuI7XHbGMtLNnAAoHrbei6dbqZa
 YiQhfI+P3N6F9sR9eGFP+JyTflNCA2PAL5IlSooGdQeLVojTtL+klYPuVkVKtw+WvLw4hZVnDjQ
 qkKMxedWUhkQVNUeXCRb1isoBoWOHNr4dcu683Ao=
X-Received: by 2002:a4a:c995:0:b0:53a:9f38:3170 with SMTP id
 u21-20020a4ac995000000b0053a9f383170mr4370368ooq.1.1679928283527; 
 Mon, 27 Mar 2023 07:44:43 -0700 (PDT)
X-Google-Smtp-Source: AK7set/D6aR0lb3G0QQgiULjxNNpyMexXfwmC2d6/vEQ04xIS/w8VPdhvksfh88dxUyLOjx5nhbTCaitggGY7kDRIvU=
X-Received: by 2002:a4a:c995:0:b0:53a:9f38:3170 with SMTP id
 u21-20020a4ac995000000b0053a9f383170mr4370359ooq.1.1679928283259; Mon, 27 Mar
 2023 07:44:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230326210446.66170-1-casantos@redhat.com>
 <ZCFgnySXy4TdPyQD@redhat.com>
 <CAC1VKkNMHbwCZLmPwLWR0XmWnbzt4tcUtagg18_n96fTRUnyZw@mail.gmail.com>
 <ZCGrTwzE+UldLkbL@redhat.com>
In-Reply-To: <ZCGrTwzE+UldLkbL@redhat.com>
From: Carlos Santos <casantos@redhat.com>
Date: Mon, 27 Mar 2023 11:44:32 -0300
Message-ID: <CAC1VKkN7tC0N6Gk7Xko2xUQBmKz2QuBvfCvz_NFsgZ_Q7Jj+cQ@mail.gmail.com>
Subject: Re: [PATCH] tracing: install trace events file only if necessary
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=casantos@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Mar 27, 2023 at 11:42=E2=80=AFAM Daniel P. Berrang=C3=A9 <berrange@=
redhat.com> wrote:
>
> On Mon, Mar 27, 2023 at 11:28:05AM -0300, Carlos Santos wrote:
> > On Mon, Mar 27, 2023 at 6:23=E2=80=AFAM Daniel P. Berrang=C3=A9 <berran=
ge@redhat.com> wrote:
> > >
> > > On Sun, Mar 26, 2023 at 06:04:46PM -0300, casantos@redhat.com wrote:
> > > > From: Carlos Santos <casantos@redhat.com>
> > > >
> > > > It is required only if linux-user, bsd-user or system emulator is b=
uilt.
> > > >
> > > > Signed-off-by: Carlos Santos <casantos@redhat.com>
> > > > ---
> > > >  trace/meson.build | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/trace/meson.build b/trace/meson.build
> > > > index 8e80be895c..3fb41c97a4 100644
> > > > --- a/trace/meson.build
> > > > +++ b/trace/meson.build
> > > > @@ -64,7 +64,7 @@ trace_events_all =3D custom_target('trace-events-=
all',
> > > >                                   input: trace_events_files,
> > > >                                   command: [ 'cat', '@INPUT@' ],
> > > >                                   capture: true,
> > > > -                                 install: true,
> > > > +                                 install: have_linux_user or have_=
bsd_user or have_system,
> > >
> > > Trace events are used by our command line tools too qemu-img, qemu-io=
,
> > > qemu-nbd, qemu-pr-helper, qemu-storage-daemon.
> > >
> > > What build scenario are you seeing that does NOT want the trace event=
s
> > > to be present ?   If there is any, then I might even call that situat=
ion
> > > a bug, as we want trace events to be available as a debugging mechani=
sm
> > > for everything we build.
> >
> > I'm aiming for an embedded system or a VM image that only needs
> > qemu-ga, in which qemu is built with --enable-trace-backends=3Dnop.
>
> How about
>
>   install:   get_option('trace_backends') !=3D 'nop'
>
> ?

That would be perfect :-)

--=20
Carlos Santos
Senior Software Maintenance Engineer
Red Hat
casantos@redhat.com    T: +55-11-3534-6186


