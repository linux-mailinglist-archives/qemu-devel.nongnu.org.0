Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6217519125D
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Mar 2020 15:03:55 +0100 (CET)
Received: from localhost ([::1]:49358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jGk9q-0001tj-Eu
	for lists+qemu-devel@lfdr.de; Tue, 24 Mar 2020 10:03:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53948)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@gmail.com>) id 1jGk6t-0006OF-6w
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 10:00:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@gmail.com>) id 1jGk6r-0003A3-Sn
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 10:00:51 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:43164)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
 id 1jGk6r-000378-Hy
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 10:00:49 -0400
Received: by mail-wr1-x442.google.com with SMTP id b2so21536581wrj.10
 for <qemu-devel@nongnu.org>; Tue, 24 Mar 2020 07:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=oA87LdByI1t1kq/WX0xC589ZuYMC+J0mRq0TmiO06aI=;
 b=nFp1VbCzf4M0AiGMR3P1dI4DofN5Zj8RwsnW8+379fAhHhINB26OnboqxP08lzm9cU
 V5V+KcnO0QYBefZ7TTmjjd3caTE9ieMtzrCqfdTU3dWSRvg00VzmmENlxr8BJLFaBCWu
 IBgEph/iQFabu/cyZ413SfZ4AGgyfWmznJl7lzY/u2CI1jclaq5s+q9VVBwzS7t2cLF7
 5efVYdzFcNw8z4kMQUwa/ekNlEsvx6bZBqlJjRUtZcxmaQwkBjmAjyP4Lw9qv2Y9Tw3I
 gp6NDr/h/HBZFy3MjGTwRx4OfTUDslZooLJw0/RhTKAXvqbquUan8MQaqPyLVKgYTDiT
 LVJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=oA87LdByI1t1kq/WX0xC589ZuYMC+J0mRq0TmiO06aI=;
 b=pgjLI4/G7VcgkZB2E1yda/bNOkUlRgb9Otz7t+7MrvKi1NlD8BMyRpumQsVoSCjnGx
 Sg2GVUzZeYGdvwyOP9Us8jUl3ab7YTufmkMcqk89t8bL7y5Ry3b35GZl2q6Jl6tAGWLa
 JHIKTL4TE7QLVKVP/evlmVkkUIf8QBARmWk8dVs2RIgkBBpL/pTXccnIgLuZ75OQ2hE5
 aFOAzytK9KxzSmV7Hto8IfDgz2Od6v5udufBEz2DGEWCv67uIiacDQKfUPCROWQaBWFv
 R1gX3ChHChThj5ufitMyLS776I/MkE1oFqrqGHItSw0r3m6C81aLaU8G4gqOfqN1ZTVy
 vNkg==
X-Gm-Message-State: ANhLgQ2rYxw4n6KVFYyIW8IXAx40EvKKcLqm878v7FZh4RfQJ/0YHFdV
 rYDrqQ6HjCuNvQf/LwqxrH7Doi7jZOrnWt+2zTU=
X-Google-Smtp-Source: ADFU+vvbtovOWhFLMaHEQQ1mOuM6n2eLsXU0JbbniHOfPIBEjZSV8wu5TIbbFSrpMPAQzDwN15EvHh/VyX8NbebKu1Y=
X-Received: by 2002:a5d:62c9:: with SMTP id o9mr38041536wrv.2.1585058447716;
 Tue, 24 Mar 2020 07:00:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200311170417.13415-1-basil@daynix.com>
 <20200311170417.13415-2-basil@daynix.com>
 <7d6f3f43-73c6-8500-6680-05ec059fd5ed@redhat.com>
In-Reply-To: <7d6f3f43-73c6-8500-6680-05ec059fd5ed@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 24 Mar 2020 15:00:35 +0100
Message-ID: <CAJ+F1CJtMsXHGQAKS-FjFM-1i445uV7P0BfYCJ78d7TasUL+Ww@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] qga: Installer: Wait for installation to finish
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
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
Cc: Yan Vugenfirer <yan@daynix.com>, Basil Salman <basil@daynix.com>,
 QEMU <qemu-devel@nongnu.org>, Michael Roth <mdroth@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Tue, Mar 24, 2020 at 2:13 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Hi Basil,
>
> On 3/11/20 6:04 PM, Basil Salman wrote:
> > Installation might fail if we don't wait for the provider
> > unregisteration process to finish.
> >
> > Signed-off-by: Sameeh Jubran <sjubran@redhat.com>
> > Signed-off-by: Basil Salman <basil@daynix.com>
> > ---
> >   qga/installer/qemu-ga.wxs | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/qga/installer/qemu-ga.wxs b/qga/installer/qemu-ga.wxs
> > index 64bf90bd85..f6781752e6 100644
> > --- a/qga/installer/qemu-ga.wxs
> > +++ b/qga/installer/qemu-ga.wxs
> > @@ -81,7 +81,7 @@
> >                 Arguments=3D"-d --retry-path"
> >                 >
> >               </ServiceInstall>
> > -            <ServiceControl Id=3D"StartService" Start=3D"install" Stop=
=3D"both" Remove=3D"uninstall" Name=3D"QEMU-GA" Wait=3D"no" />
> > +            <ServiceControl Id=3D"StartService" Start=3D"install" Stop=
=3D"both" Remove=3D"uninstall" Name=3D"QEMU-GA" Wait=3D"yes" />
>
> As 'yes' is the default, can you simply remove 'Wait=3D"no"'?

It looks like wixl doesn't follow the WiX default value though.

tools/wixl/msi.vala:
574                 (Wait !=3D null && !rec.set_int (5, Wait ? 1 : 0)) ||

>
> >             </Component>
> >             <?ifdef var.InstallVss?>
> >             <Component Id=3D"qga_vss_dll" Guid=3D"{CB19C453-FABB-4BB1-A=
BAB-6B74F687BFBB}">
> >
>
>


--=20
Marc-Andr=C3=A9 Lureau

