Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE9C29FF0C
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Oct 2020 08:48:14 +0100 (CET)
Received: from localhost ([::1]:55194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kYP8v-0002FX-KJ
	for lists+qemu-devel@lfdr.de; Fri, 30 Oct 2020 03:48:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kYP4C-0007bb-TE
 for qemu-devel@nongnu.org; Fri, 30 Oct 2020 03:43:20 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:39940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kYP4A-0000YL-Cl
 for qemu-devel@nongnu.org; Fri, 30 Oct 2020 03:43:20 -0400
Received: by mail-ed1-x536.google.com with SMTP id p93so5603343edd.7
 for <qemu-devel@nongnu.org>; Fri, 30 Oct 2020 00:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oV5ITNCZTMLJ5x+waf0u654oeZ9RWReDzRLU8TqIGDc=;
 b=XEpix+sBS5LLMtxRC10iXYNya+P6P3jAgtJrvDGwirYscA+F6fdB1s73WCc/Ub6np/
 ZjNliSaBtDko9/ZbwOstBIEro10hlqpgHA1awalh5/XRW8rCZqt/VAZ2mRwjCTSVa/+V
 Z2X6WFLPmMy/EjXj+7RvyiWCXTznWuOAxMpqRi0SAKhepWNeypR4f2kAQEkMjPKqjzO6
 mU/DarJpYGCikR/b9n/qMP+p+4sPj8wuR7izqBs6DPJUijseHhmmXZ6dAbXSvz/ML4mi
 Ne/M/MevXQSV13HSBLlEzOyoh+Gq41W2jBed+9X6m0ip33V0CX+w9qAOXwGtLSJkMuF+
 Vm1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oV5ITNCZTMLJ5x+waf0u654oeZ9RWReDzRLU8TqIGDc=;
 b=NyflsG1EHi151cD/GMwRK4PswapB5HMVp0+nHwWDWb7EmZ6JPjlFqQBqNf8kBvhOYC
 +YIj0W3xK2WT5DvfqEe6Pgf6hB7VEIw2ITrXGozN1ccZAYAZKQTjdt2OP2a35cK2GBon
 fyEMd0EYyupNDF7sP+1rVRQARSGcE13qTH9c6bWcJp+EhNcLVgwucViw+0ppiGBKCCCv
 Y400NrK8xMnUvbFkEVxlRe0vJEvAHkl0+StsLh33ehXLJ0nzLMS5dAl1uXA7C2O1xmNc
 awzHlUkJU4Vev4jDHwF1d2T++I/wp/r2KYgAhceK2wq/1SQ5aMLcipcBpehD7HUTJjeB
 tgyQ==
X-Gm-Message-State: AOAM533rFhKAGbG5gL5L8RdAjXLZduEkVD6qgPjjWyiWBusl7GiQ81sk
 jmoezrDxI/UeO4r8Nu+JASzBg1xiXfxxDyJGlCY=
X-Google-Smtp-Source: ABdhPJzDfWCwrsrd/GCbuvxEBcJ3mOXPV9BRnKY09K4njwe/O3NNAdRwKgAn1PapMsGLFA+9dL2fz+Z2x/otMxcKgT4=
X-Received: by 2002:a05:6402:195:: with SMTP id
 r21mr930121edv.164.1604043796234; 
 Fri, 30 Oct 2020 00:43:16 -0700 (PDT)
MIME-Version: 1.0
References: <20201029220246.472693-1-ehabkost@redhat.com>
 <20201029220246.472693-6-ehabkost@redhat.com>
In-Reply-To: <20201029220246.472693-6-ehabkost@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 30 Oct 2020 11:43:03 +0400
Message-ID: <CAJ+F1CLA6VCY=3uF5RZRwYXNBomupw=PMdMd1G-nkybp-Cy2hA@mail.gmail.com>
Subject: Re: [PATCH 05/36] sparc: Check dev->realized at sparc_set_nwindows()
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000adc74d05b2de8ce1"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x536.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, QEMU <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, John Snow <jsnow@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000adc74d05b2de8ce1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2020 at 2:07 AM Eduardo Habkost <ehabkost@redhat.com> wrote=
:

> sparc_set_nwindows() is one of the very few property setters that
> don't check dev->realized, and there's no reason for it to be
> special.  Check dev->realized like the other setters.
>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000adc74d05b2de8ce1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 30, 2020 at 2:07 AM Eduar=
do Habkost &lt;<a href=3D"mailto:ehabkost@redhat.com" target=3D"_blank">eha=
bkost@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">sparc_set_nwindows() is one of the very few property setter=
s that<br>
don&#39;t check dev-&gt;realized, and there&#39;s no reason for it to be<br=
>
special.=C2=A0 Check dev-&gt;realized like the other setters.<br>
<br>
Signed-off-by: Eduardo Habkost &lt;<a href=3D"mailto:ehabkost@redhat.com" t=
arget=3D"_blank">ehabkost@redhat.com</a>&gt;<br></blockquote><div><br></div=
><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.l=
ureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;</di=
v><br></div>-- <br><div dir=3D"ltr">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000adc74d05b2de8ce1--

