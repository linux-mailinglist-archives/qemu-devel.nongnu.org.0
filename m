Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCAE30DCAA
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 15:25:51 +0100 (CET)
Received: from localhost ([::1]:46800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7J6M-0004lu-CG
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 09:25:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1l7J1g-00013w-Ng
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 09:21:02 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:45383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1l7J1e-0006e4-Ci
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 09:21:00 -0500
Received: by mail-ej1-x62e.google.com with SMTP id b9so16445313ejy.12
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 06:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=oZXmHXPKRQPkkVVEwF1v0rwvOkiLp2UgVkqNPckmFcE=;
 b=maZi5Oay8BVvh+ILdq3A5SZ2oOFRrcTjESOEVYtC6sPAwRBndO2S2fSoyzbTgun2I1
 ORlbbDhceyZNZjOZwuW4J6V5WkfI1jxZVQCM0MHeduix2LQg9/rp5rX+Mab6v8yWXRpg
 vE+bJlmXbius1qxrAoZ4EFYvT54VNR229ZTTuWit5rjWjjtrwY9D8tR1VmInY29sEoLD
 i5ztztX1fowObdphgYKqUU7Mi4mJFyYLDjkbDnhIx1dPsREosxfNGejrP7ZzawaHE977
 LrKomVaEgGoNqh98hJ4W4ZB641+CBCdN8y2/8ri7XBN1Lny9D8MdywqYrbN8PTxjgMUa
 RqyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=oZXmHXPKRQPkkVVEwF1v0rwvOkiLp2UgVkqNPckmFcE=;
 b=EJTa2YnGfvtkwq0NsdzQz6e7ZI3qpyH2l5/PVhTMJwIgjpVgnPqVLuG9H/AeAaOYzy
 O/MaiwMnWAPOXZ3TqrpOVYS3OzPJeSDO0QjQoGL1ix2lb0zBHzTy2E6v+HBJqDvqbKVA
 2oy6JLQyqRCS8c0+1otiYoPe86pWvMk6cmD1j1UrTNyyj/VvfONNzfk3txrSZ6pVPwdn
 PpnsK7VgK00yLw3vAVTd06+TRuagclImxXykNyViw7kf2ZX5MmUvdLPPd3hPRLe4P+el
 o2XkP+nGJ4RjxbKwQNRf4S/4mtH8p8RPYyK1kwmCJU+E0C7DSEJ3zOcVAkwpFQX3vts6
 /vHg==
X-Gm-Message-State: AOAM5305EzXohpzSwLIKBiTOfx+opdg53cVsuZipOBmychbmKs7cOoxR
 EGxKIVpZZJEZmmeOI4COuzQ51hFKNE1/rLTJZO4=
X-Google-Smtp-Source: ABdhPJy/2vfuq+0FlYdc1Q3hnScY1n5zAZbDvdFx6RQk0OsZOsfVsMMYnzd5QXgkCfeUCSGs5XMLi/dQ/u4GqY6m4mA=
X-Received: by 2002:a17:906:798:: with SMTP id
 l24mr3496555ejc.92.1612362056088; 
 Wed, 03 Feb 2021 06:20:56 -0800 (PST)
MIME-Version: 1.0
References: <20210202142625.609070-1-marcandre.lureau@redhat.com>
 <20210202142625.609070-21-marcandre.lureau@redhat.com>
 <20210203113840.5d5hwphdyicomel2@sirius.home.kraxel.org>
 <CAJ+F1C+TJ1f4-=83s4tj0b6-D8y2s0ADry=10GuSj372eFfDXw@mail.gmail.com>
 <20210203141631.sacrgywaw636m2fs@sirius.home.kraxel.org>
In-Reply-To: <20210203141631.sacrgywaw636m2fs@sirius.home.kraxel.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 3 Feb 2021 18:20:44 +0400
Message-ID: <CAJ+F1CKWbhj8yMk7_gh3f5R7kJ_GWd26sPQHfM5kt6jyi7wLxw@mail.gmail.com>
Subject: Re: [PATCH 20/20] RFC: tests: add some virtio-gpu & vhost-user-gpu
 acceptance test
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: QEMU <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Wed, Feb 3, 2021 at 6:16 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> > > [ queued whole series + some other pending ui/vga bits, kicked CI, le=
ts
> > >   see how it is going.  I suspect I'll have to drop this patch though=
. ]
> > >
> >
> > Yes, Cleber was going to take a look, and perhaps send another avocado
> > series I could take some inspiration from.
>
> Doesn't look too bad, gitlab passed, cirrus still running.
>
> So include it?  Or do you want send an improved non-rfc version anyway?
>

If it passes it all (including Peter's gate), it's good to go I would
think. Easier to improve based on something that is known to work.



--=20
Marc-Andr=C3=A9 Lureau

