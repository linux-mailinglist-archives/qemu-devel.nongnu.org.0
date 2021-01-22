Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6C32FFFF8
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 11:17:48 +0100 (CET)
Received: from localhost ([::1]:48454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2tVj-0004Ii-MK
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 05:17:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2tSm-0003gE-Jt
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 05:14:44 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:35508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2tSk-0000vW-H9
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 05:14:44 -0500
Received: by mail-ej1-x633.google.com with SMTP id ox12so6912398ejb.2
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 02:14:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+LBZaf5aKuqW3OjBb5nA3hu+/pwa9W6Box7qhkCgjLE=;
 b=ZTyIlDrRVmdYYShzzPsKtSEry+qs4WquTCBXkIQMnoQNTOXHvuCzECs46I+2rW2plg
 hTDsuavUcLNmnASnYIRsHtk5UtzpAGv4JdCYU7nIg3RJgnG7hotyUNAxMDa3ILK4Zjl+
 hkRSU2vtKJAMyrN/c3S6HeEkolbB08HcPsJfLgCEmAwRqwtqQuMPNQ9V6WM664vRVEcr
 j9aUa/gc/rbfow7YKTV13RQaiGklq/QUbQJymuXD6OsUn+r3Fhywtuvz+phUqt87Kpij
 r02NRJrTsrl+NMLyTDLiY0WJkKKwQOH1d9DVWYxGBhlklBjXZIoK1sZsfSpBmCjODJWM
 TlAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+LBZaf5aKuqW3OjBb5nA3hu+/pwa9W6Box7qhkCgjLE=;
 b=YaNV///JH8lw4aJteBhkIOIPPCAGFXWxbDh0m9DBLJAShaN84BaYZ2Eysbx9+QjbXo
 U1mJadW3TSJrEd83Fdl0P3hiV10cofFjFqdJT4PwykrUGBGQNgO3NPH8z8HmGSGsPhVg
 flmvccd8OTVKpMlZUbWUnN95cGEbCbBEfMEBUKE8VdO8yvNZCwHhIgfSvzMI2nkM3abe
 Oy7ODGyuNMVjF6kADKVHKBOOXH244czD7DKOVIKho7su8axtUymB51olQ6TP12H5QzTc
 +qsB+p9yGnKwt3vdb870PDS6/7ruvv3dAjh/SM0dt8BSL11JMiggy3Igq9w1SHElKc1m
 +Z2g==
X-Gm-Message-State: AOAM530LQsQ0wJoZ1XZk8DcMC7v6rUyIKLau3ww1Wseaj8pBuNpqSzB0
 jrTr94Jy5RibyVer392AbEBb2iqwTPZE+Ox1aCguyQ==
X-Google-Smtp-Source: ABdhPJzaRsuGnvmrNDvr59OSkcBCRw2ON5G4VyVxOOrumjNPblSXv82ZNDf4PaPoEYaJgA+xHrLdIHY6IT5LsTQNxMo=
X-Received: by 2002:a17:906:b215:: with SMTP id
 p21mr2421253ejz.407.1611310479794; 
 Fri, 22 Jan 2021 02:14:39 -0800 (PST)
MIME-Version: 1.0
References: <7b8155ad-0942-dc1c-f43c-bb5eb518a278@redhat.com>
 <445268c9-d91f-af5a-3d7e-f4c6f014ca52@redhat.com>
 <fc35da77-a5c2-08dd-05f2-0ebe781b338c@redhat.com>
In-Reply-To: <fc35da77-a5c2-08dd-05f2-0ebe781b338c@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Jan 2021 10:14:28 +0000
Message-ID: <CAFEAcA8GWMh=Cbrnw4+mzbG7gkHLkeQKXCTGxev6iYu8Q8TkxQ@mail.gmail.com>
Subject: Re: Thread safety of coroutine-sigaltstack
To: Max Reitz <mreitz@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 22 Jan 2021 at 08:50, Max Reitz <mreitz@redhat.com> wrote:
>
> On 20.01.21 18:25, Laszlo Ersek wrote:
>
> [...]
>
> > A simple grep for SIGUSR2 seems to indicate that SIGUSR2 is not used by
> > system emulation for anything else, in practice. Is it possible to
> > dedicate SIGUSR2 explicitly to coroutine-sigaltstack, and set up the
> > action beforehand, from some init function that executes on a "central"
> > thread, before qemu_coroutine_new() is ever called?
>
> I wrote a patch to that effect, but just before sending I wondered
> whether SIGUSR2 cannot be registered by the =E2=80=9Cguest=E2=80=9D in us=
er-mode
> emulation, and whether that would then break coroutines from there on.
>
> (I have no experience dealing with user-mode emulation, but it does look
> like the guest can just register handlers for any signal but SIGSEGV and
> SIGBUS.)

Yes, SIGUSR2 is for the guest in user-emulation mode. OTOH do we
even use the coroutine code in user-emulation mode? Looking at
the meson.build files, we only add the coroutine_*.c to util_ss
if 'have_block', and we set have_block =3D have_system or have_tools.
I think (but have not checked) that that means we will build and
link the object file into the user-mode binaries if you happen
to build them in the same run as system-mode binaries, but won't
build them in if you built the user-mode binaries as a separate
build. Which is odd and probably worth fixing, but does mean we
know that we aren't actually using coroutines in user-mode.
(Also user-mode really means Linux or BSD and I think both of
those have working ucontext.)

thanks
-- PMM

