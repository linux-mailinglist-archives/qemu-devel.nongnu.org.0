Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8F5511448
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 11:28:03 +0200 (CEST)
Received: from localhost ([::1]:44638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njdxq-0002o8-B2
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 05:28:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1njdei-0001dp-T3
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 05:08:18 -0400
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735]:33602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1njdeg-0003Dk-2G
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 05:08:15 -0400
Received: by mail-qk1-x735.google.com with SMTP id s4so875601qkh.0
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 02:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4JQQ+Rl5Y0EulyG7vvnrj02l/99wHn30t1tq9USa1kY=;
 b=VeU9vDWywgWIhFQCGV2sVNz1URhmXio2tkeE12XKm5ybSbSfsrnB43fImBYtCOlABQ
 oR7myXVxritqatKbEJxl4ZGAwAhjMEohxXh23JDiUtxTf82qQnSowv6Mx7WPWH+MZ54W
 n4YpRXBuP/rATflnsy482kfTIw0vzITavBYdvqUvQV8pCjYD+T6aE3YLBcD+VX2v6DsJ
 uwNgF65j4q2+EOMXVSdlLxC17sqXacYVZGPIATLpW2QsHnSrhz8IZ3/SADtCfA2BSov1
 m3SlusMtFJAWo2riGOlEbdm7+hqh0rw/imSdvNnHUxbmwh7YfcwysacxiOIVKcaRUECB
 Y70Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4JQQ+Rl5Y0EulyG7vvnrj02l/99wHn30t1tq9USa1kY=;
 b=sySCIxmnZrLOz7VVBKtvGXrXBD2pWgVJ9EQN3IfUbOPmVrEeHjh5wTGJ30w0P6nO9g
 bigZ84tO8S0oVMNDIE9zUdTfGv/k1qIimweGLnP5/h8tMhxhxAdpYRmL7eLbBAPBbqYk
 osybAJ0M55MhGt6tdmrXJn3oQZEDkTDitszijvDTUC65NxvOeXv5W6zxq8TDa2eFis6N
 L617oIOLHgLcH8pXmTidUYNBhlz21r3bt4fmnN+PyF3XUkpvnv5hhfqGA5uQWTCWl98d
 RTzCg6LLLMwSi/dcdgQ2MgFcWC8P5IfHNFOXSdksLbeJsOXAzRSGRhvC/ghlE4WZuQvi
 9gzg==
X-Gm-Message-State: AOAM533o6A/31IKSewfcwUWrlTN8sid5UDQrASTwbeolvu16T9AECTWo
 RVkEswfrm/We6u06qMJcZT3hME5emXfXzmqkLZg=
X-Google-Smtp-Source: ABdhPJxNFUC4uT76pIBLP7ygg/N16w+xIA/g1sEvCC9HlybJHPb6tCbN5ylqyROPPx+hPp38QATDRgk+sY3OSzSAOWg=
X-Received: by 2002:ae9:ef4e:0:b0:69e:2403:eae8 with SMTP id
 d75-20020ae9ef4e000000b0069e2403eae8mr15064387qkg.397.1651050492113; Wed, 27
 Apr 2022 02:08:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220426092715.3931705-1-marcandre.lureau@redhat.com>
 <20220426092715.3931705-18-marcandre.lureau@redhat.com>
 <bb908912-cc59-c1fb-1dd5-41dcb3495f28@linaro.org>
In-Reply-To: <bb908912-cc59-c1fb-1dd5-41dcb3495f28@linaro.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 27 Apr 2022 13:08:00 +0400
Message-ID: <CAJ+F1CKxnbHA1AZAvCBntMx632nmDik1mA4QwUtPUZkWcNT9bw@mail.gmail.com>
Subject: Re: [PATCH v2 17/26] Replace fcntl(0_NONBLOCK) with
 g_unix_set_fd_nonblocking()
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000016bb6505dd9f26c6"
Received-SPF: pass client-ip=2607:f8b0:4864:20::735;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-qk1-x735.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Jason Wang <jasowang@redhat.com>,
 QEMU <qemu-devel@nongnu.org>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000016bb6505dd9f26c6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Apr 27, 2022 at 5:15 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 4/26/22 02:27, marcandre.lureau@redhat.com wrote:
> > From: Marc-Andr=C3=A9 Lureau<marcandre.lureau@redhat.com>
> >
> > Suggested-by: Daniel P. Berrang=C3=A9<berrange@redhat.com>
> > Signed-off-by: Marc-Andr=C3=A9 Lureau<marcandre.lureau@redhat.com>
> > ---
> >   net/tap-bsd.c                      |  4 ++--
> >   net/tap-linux.c                    |  2 +-
> >   net/tap-solaris.c                  |  2 +-
> >   tests/qtest/fuzz/virtio_net_fuzz.c |  2 +-
> >   tests/unit/test-iov.c              |  4 ++--
> >   util/oslib-posix.c                 | 16 ++--------------
> >   6 files changed, 9 insertions(+), 21 deletions(-)
>
> Typo in subject: s/0/O/.
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
> r~
>
>
Thanks, additionally I fixed the return value to be -errno on
qemu_try_set_nonblock() error.


--=20
Marc-Andr=C3=A9 Lureau

--00000000000016bb6505dd9f26c6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 27, 2022 at 5:15 AM Ric=
hard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.=
henderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">On 4/26/22 02:27, <a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a> wrote:<br>
&gt; From: Marc-Andr=C3=A9 Lureau&lt;<a href=3D"mailto:marcandre.lureau@red=
hat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt; <br>
&gt; Suggested-by: Daniel P. Berrang=C3=A9&lt;<a href=3D"mailto:berrange@re=
dhat.com" target=3D"_blank">berrange@redhat.com</a>&gt;<br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau&lt;<a href=3D"mailto:marcandre.l=
ureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0net/tap-bsd.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 ++--<br>
&gt;=C2=A0 =C2=A0net/tap-linux.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt;=C2=A0 =C2=A0net/tap-solaris.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt;=C2=A0 =C2=A0tests/qtest/fuzz/virtio_net_fuzz.c |=C2=A0 2 +-<br>
&gt;=C2=A0 =C2=A0tests/unit/test-iov.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 4 ++--<br>
&gt;=C2=A0 =C2=A0util/oslib-posix.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 16 ++--------------<br>
&gt;=C2=A0 =C2=A06 files changed, 9 insertions(+), 21 deletions(-)<br>
<br>
Typo in subject: s/0/O/.<br>
<br>
Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@lina=
ro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
<br>
r~<br>
<br></blockquote><div><br></div><div>Thanks, additionally I fixed the retur=
n value to be -errno on qemu_try_set_nonblock() error. <br></div></div><br =
clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"gmail_signature">Marc-An=
dr=C3=A9 Lureau<br></div></div>

--00000000000016bb6505dd9f26c6--

