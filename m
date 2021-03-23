Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1239345D21
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 12:40:35 +0100 (CET)
Received: from localhost ([::1]:37228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOfOk-0008Lq-P9
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 07:40:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1lOfMD-0007Jd-MW
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 07:37:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57174)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1lOfMB-0002vH-MS
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 07:37:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616499474;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bpI6m9rQzDSOkBnGAjKI5qS9LeyY+YcP1WOxFJ8fzcU=;
 b=W3REBXJKZHaRoit/wAb04kop5017X4UpUVZBXORvxFXoEpRtGZ4DYyIBVZn07CtLURTk8e
 rc6ru+fiZf2hzTusmD136o0s8nC/MjU6eATr0/UxpUz9sVJmP+CUuux8oqduNZWcHDRbvx
 btl9fVcgPaiF90PQ83RZLg/dTnY+an4=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-DoeQV8vbOWykkSE2ZgUkKA-1; Tue, 23 Mar 2021 07:37:48 -0400
X-MC-Unique: DoeQV8vbOWykkSE2ZgUkKA-1
Received: by mail-il1-f197.google.com with SMTP id d15so1428190ila.10
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 04:37:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bpI6m9rQzDSOkBnGAjKI5qS9LeyY+YcP1WOxFJ8fzcU=;
 b=g8yrvLsFQNtyiNCnoAAqfZ5ejh8XmuZVcoIeI+HdAxnMEEVEPD2SEPhS/XmUN0MnNM
 KB/D4ksArRmGjyzxuZJWHJ7GxfxqvLoZrJHFnP5Zp9Nx2ey0UL/O1fP6VaBvaY3KGjvZ
 qPb2w5Qga7Fg1iCRy/5ObrV++vau40080WXYseHv1Chz9s5O6Nq46PZtODvVNMcK/tOj
 syQe6yWuw7By2N32npEPbZZrIL+ldc1SxqwxN2Hnuotiqtr0v7FeZG4yabqYzfgeXK4S
 NMkUx+QywFhFdlAleHtiXdwxLPL79yxnCKmsCraymnsDZTsLt/FKOPqo95jKHNoB5yd7
 41Gw==
X-Gm-Message-State: AOAM531h/FNe2LFpihM7sxFhq6T4eOQH/7USo5fJqFepECxFiWLXYSqT
 wKRYeWZL+xq+X4voG4BntOY7afJl36Awq/VBVIa41dmZ+rZ4gm4JZy2p5swK0oB/FeAMng5b6V5
 O1mrNRvPLCu2HAhRDETBoUJKpm4001rg=
X-Received: by 2002:a02:8545:: with SMTP id g63mr3960335jai.79.1616499468100; 
 Tue, 23 Mar 2021 04:37:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxJlfMjzaTzzAIuFPVMYpxqHpf4CN0MsLdKWbCRHK98ggWYsiAwSepL7gmWt6g6gyKh1NrUR93RW2zq+0vSelo=
X-Received: by 2002:a02:8545:: with SMTP id g63mr3960321jai.79.1616499467904; 
 Tue, 23 Mar 2021 04:37:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210322105234.3932691-1-marcandre.lureau@redhat.com>
 <YFnCfhiaixbn7lMy@redhat.com>
 <CAFEAcA_f2fMmVS=Pt6Zd7Si5L2YfRMH+dJZ_pZd=E-neKpxUOg@mail.gmail.com>
 <YFnRBwWPAA9TRntZ@redhat.com>
 <CAFEAcA_BL1myi878cE5V48EeUpvzq5HUMgU5fKP74YRsutjdjQ@mail.gmail.com>
In-Reply-To: <CAFEAcA_BL1myi878cE5V48EeUpvzq5HUMgU5fKP74YRsutjdjQ@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 23 Mar 2021 15:37:36 +0400
Message-ID: <CAMxuvazOeOhyAXvYXb1DpGff+8BAHrZG5bLLG1KYC1xL2eX08Q@mail.gmail.com>
Subject: Re: [PATCH v4] sphinx: adopt kernel readthedoc theme
To: Peter Maydell <peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000907a7705be329c41"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: John Snow <jsnow@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000907a7705be329c41
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Mar 23, 2021 at 3:36 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Tue, 23 Mar 2021 at 11:29, Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m>
> wrote:
> > The theme is pre-packaged for Fedora, Debian, Ubuntu, which gives me
> > confidence for Linux distros in general.
> >
> > BSD / macOS / Windows, who knows ?
>
> Mmm, good point. Marc-Andr=C3=A9's the one who's been doing the work
> here, so I'm happy to leave it up to him if he thinks retaining
> the fallback is the best approach.
>
> > We could check for rtd theme in meson, and disable the docs build
> > if missing.
>
> If you make the docs/conf.py raise an error if the theme is missing,
> then the existing docs/meson.build "does sphinx work?" test will
> disable the docs build. (You would want to improve the error message
> to note that the problem might be missing theme, though.)
>
>
Ok great, I'll do that. thanks

--000000000000907a7705be329c41
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 23, 2021 at 3:36 PM Pet=
er Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@li=
naro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">On Tue, 23 Mar 2021 at 11:29, Daniel P. Berrang=C3=A9 &lt;<a href=
=3D"mailto:berrange@redhat.com" target=3D"_blank">berrange@redhat.com</a>&g=
t; wrote:<br>
&gt; The theme is pre-packaged for Fedora, Debian, Ubuntu, which gives me<b=
r>
&gt; confidence for Linux distros in general.<br>
&gt;<br>
&gt; BSD / macOS / Windows, who knows ?<br>
<br>
Mmm, good point. Marc-Andr=C3=A9&#39;s the one who&#39;s been doing the wor=
k<br>
here, so I&#39;m happy to leave it up to him if he thinks retaining<br>
the fallback is the best approach.<br>
<br>
&gt; We could check for rtd theme in meson, and disable the docs build<br>
&gt; if missing.<br>
<br>
If you make the docs/conf.py raise an error if the theme is missing,<br>
then the existing docs/meson.build &quot;does sphinx work?&quot; test will<=
br>
disable the docs build. (You would want to improve the error message<br>
to note that the problem might be missing theme, though.)<br>
<br></blockquote><div><br></div><div>Ok great, I&#39;ll do that. thanks <br=
></div></div></div>

--000000000000907a7705be329c41--


