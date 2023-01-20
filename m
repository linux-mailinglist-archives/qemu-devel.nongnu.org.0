Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 217B7675634
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 14:58:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIrts-0002w3-Ca; Fri, 20 Jan 2023 08:57:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pIrtp-0002vm-Km
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 08:57:45 -0500
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pIrtn-0001wB-Rf
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 08:57:45 -0500
Received: by mail-lj1-x232.google.com with SMTP id g14so5548164ljh.10
 for <qemu-devel@nongnu.org>; Fri, 20 Jan 2023 05:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b/7sFd6VDVQhwp/xKcD7Q2EGoMsjI9O6ASOhgtMRfCw=;
 b=ARl4+Mo1zcBNUt8kY8EQ0Ttijbf0yrPSbT5Dk8K2fCIsPIxCP+R+bQAXjgut3eEabl
 3+Q5fZ68LMU0h0F9a+FEaZawSIXIf/Nwx6NvVgGVXA1JYxWmlQ0m5D9rmh0hi77o77kr
 ZADLmkCFniQhqTp+GuzTSz69kd2He8knBT0NJvD08afE9JTYmrNiOQcPkPe974yE9hHK
 jogOMMaqjSiMZh/fAtsVyXkN+VXCN0YPworV6UlQ9XGCcbb69DNNFF5AJqkUVRYu//zt
 Hy22y9gfWos0jYJOE3rACuEl3vsWRwOB3e0Du4Hyx0WlaWcElt7SafP7ItHoLEzkXW0N
 U7/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b/7sFd6VDVQhwp/xKcD7Q2EGoMsjI9O6ASOhgtMRfCw=;
 b=QFDvX7XV1O//qUaXFKz9WLtTRt8S7t9UVS4TsK8opNls9n3mNoRDImWx6NmstuWpLJ
 Qxlmsu+qpJAjSuC9tSI20YDDJDoJP49/IIYKjDJcnvLWm+pX33/ORnzJ1VvRRcReUzh3
 5taGTaF4aD+W2mfwFz8XnGsshT/PSxnCt71h1mxAFhNpJysdbZ4bfs6t5yKodYNqS+8F
 xSdd/XxrTgCsYa4pPyRYxj7WPTmTK4iqm4Je2wCdh1jcnueYjlE90Si1gEqIf9wl2LaI
 FZy0nji3x9heGnB7syfU244cf8wiu5zIvhjHDP3RNBdKSF3NIIMYsfngfnZtYCD8zARc
 0DQw==
X-Gm-Message-State: AFqh2kruJRQex4eeDpp6sgTVOxx9w9Lfo/Gn/GoZXoGSXv70NWJ21odN
 NrfQ1Z7laBwU/ZUJ76hfjLLVqjaRaDm2bSJFjqo=
X-Google-Smtp-Source: AMrXdXtFwXK2rF4TzRI36cKo4aoIBrPNu9hDxrp5pEHK4W2RHUvgnLwE6jCPfs5Q/k9MLdTdcUoTNH4FncdEBnhu2po=
X-Received: by 2002:a2e:9395:0:b0:28b:7934:e2dc with SMTP id
 g21-20020a2e9395000000b0028b7934e2dcmr644816ljh.267.1674223061154; Fri, 20
 Jan 2023 05:57:41 -0800 (PST)
MIME-Version: 1.0
References: <c2246b1a-51b3-2843-5164-c424c571874f@redhat.com>
 <CAJ+F1C+EC-tgDOyX5e56utKdUz-DXMMtwrtVyKXT2Jj4r43OCA@mail.gmail.com>
 <839268cb-b65c-68d6-1294-47548ed383b1@redhat.com>
In-Reply-To: <839268cb-b65c-68d6-1294-47548ed383b1@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 20 Jan 2023 17:57:29 +0400
Message-ID: <CAJ+F1CJteJ665MLSUhWg-p9=tH6B7w-m=pop+o9ktGffxCiZaA@mail.gmail.com>
Subject: Re: MSYS2 and libfdt
To: Thomas Huth <thuth@redhat.com>
Cc: Bin Meng <bin.meng@windriver.com>, Stefan Weil <sw@weilnetz.de>, 
 QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::232;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x232.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Hi Thomas

On Fri, Jan 20, 2023 at 12:31 PM Thomas Huth <thuth@redhat.com> wrote:
>
> On 19/01/2023 09.56, Marc-Andr=C3=A9 Lureau wrote:
> > Hi
> >
> > On Thu, Jan 19, 2023 at 12:31 PM Thomas Huth <thuth@redhat.com> wrote:
> >>
> >>
> >>    Hi all,
> >>
> >> in some spare minutes, I started playing with a patch to try to remove=
 the
> >> dtc submodule from the QEMU git repository - according to
> >> https://repology.org/project/dtc/versions our supported build platform=
s
> >> should now all provide the minimum required version.
> >>
> >> However, I'm hitting a problem with Windows / MSYS2 in the CI jobs: Th=
e
> >> libfdt is packaged as part of the dtc package there:
> >>
> >>    https://packages.msys2.org/package/dtc
> >>
> >> ... meaning that it is added with a usr/include and usr/lib path prefi=
x
> >> instead of mingw64/include and mingw64/lib like other packages are usi=
ng
> >> (see e.g.
> >> https://packages.msys2.org/package/mingw-w64-x86_64-zlib?repo=3Dmingw6=
4). Thus
> >> the compiler does not find the library there. Also there does not seem=
 to be
> >> a difference between a i686 (32-bit) and x86_64 (64-bit) variant avail=
able
> >> here? Does anybody know how libfdt is supposed to be used with MSYS2 ?
> >
> > The msys environment is a bit special, it's not an environment for a
> > particular build target, my understanding is that it holds common
> > files/tools.
> >
> > dtc should be added to https://github.com/msys2/MINGW-packages for it
> > to be available as a target dependency.
>
> Do you have already any experience in requesting a new package there? Cou=
ld
> you maybe do it? ... since I don't have a proper MinGW installation here,=
 it
> would be very cumbersome for me right now.
>

Here you go (although let see what CI has to say):
https://github.com/msys2/MINGW-packages/pull/15168

The msys2 maintainers are usually very quick and helpful, in my experience.

(I sometime use a windev evaluation VM, that I import with the help of
https://github.com/elmarco/virt-install-windev)

--=20
Marc-Andr=C3=A9 Lureau

