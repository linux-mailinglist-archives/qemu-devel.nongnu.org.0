Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A86397306
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Aug 2019 09:08:09 +0200 (CEST)
Received: from localhost ([::1]:44374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0Kj2-000885-5a
	for lists+qemu-devel@lfdr.de; Wed, 21 Aug 2019 03:08:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40232)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@gmail.com>) id 1i0Kha-0007fY-4w
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 03:06:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@gmail.com>) id 1i0KhY-0005M3-PZ
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 03:06:38 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:36135)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
 id 1i0KhY-0005L7-HC
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 03:06:36 -0400
Received: by mail-wr1-x436.google.com with SMTP id r3so947690wrt.3
 for <qemu-devel@nongnu.org>; Wed, 21 Aug 2019 00:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=K3ZcHeR0fCcY+QJXVdDsc1wM6iYLSy+1SZ8zgBaJ7SA=;
 b=d5wkHxt/JWQwsbWmZj8cWWLWGPFiW+M8RBGOV+6TQwrMor6HAmve7JavuCAsVrsx0Y
 1mzNi6lF2psyrH6geeXMtAkSi6dx0JOQybE8KDKTSBo9z2uZJKtvcDx8ctBa8LEuZc3p
 2AK//skrJ3GEb2924kU+NivVaaZWGrjiIfD3iaqZyeKi2g9/H80jqaPc6cJP9JQq5svK
 BUqadGdIwxwxF+S/dHe92YE4FJ2GOaWTiYo2z9iT0ONZ9WeVd2FSHKCwmZpFPQhRMt3d
 u950o3MUDZ2c5COtZOOibSDcZcFZhku36DVwtxeRJRqqEgEtQQNsPbLiIdEzGt5zY+j9
 vjag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=K3ZcHeR0fCcY+QJXVdDsc1wM6iYLSy+1SZ8zgBaJ7SA=;
 b=EZtXxLbxXNs4CRz+y3URxkiz0jM4Id3SfsTVNmYlhDtMWl84Xq6SAkFuDdsDURbckm
 1WU5LPIPiuZFzTN9IybaObhnk6pVcVBN0BrMMYzx2VKqIuCkqQ2oBrk2Blkej+FsDOdJ
 eKg73vZjzVOjtaMZtdyrRI6EIjo3gjYsoZF7Rf+pXHYIDdF8uuUbWYeP5SMPGxdB7+QY
 LC03S8Z8oFY0IqYGDYjFKQCa/lvMxGecW8muWuR59fHzzhdC1OmWI+CzOHNzh99MrSFl
 w1ZIBM4U2+vVBuea6gHN8nabgB6Ic/JrVVY1mpegKKst0w4lixQykeD5m4KdSedsWfus
 +TEA==
X-Gm-Message-State: APjAAAUTQEy7ovPwi1ezV8c/MDhbtp2MQMur0U6ivLpGlrvQa8pYnnwj
 xamPXWH8vgMowgkTHdbKQL0cOQxivZSQTgolIeM=
X-Google-Smtp-Source: APXvYqxKKztdqd0y7CE1CxmOnhQ7ixNNfB9Mk5pLzwdHwuCKed+pNGBDS7bXUzPVy8hyoSB5wM+qJa0sZOoDqYYIHvo=
X-Received: by 2002:a05:6000:1284:: with SMTP id
 f4mr5047671wrx.89.1566371194372; 
 Wed, 21 Aug 2019 00:06:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190819105753.30913-1-alex.bennee@linaro.org>
In-Reply-To: <20190819105753.30913-1-alex.bennee@linaro.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 21 Aug 2019 11:06:22 +0400
Message-ID: <CAJ+F1CL=qQ6JDFUKo5r2TJHh2WAMHPz7+=fUhZ5NiRFW8otP9Q@mail.gmail.com>
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::436
Subject: Re: [Qemu-devel] [Webpage PATCH] add support page
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
Cc: QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 19, 2019 at 2:58 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>
> This is intended to be a useful page we can link to in the banner of
> the IRC channel explaining the various support options someone might
> have.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

May be you should remove "bug reporting" and "contact" sections from
README, and link to this file instead?

anyway lgtm,
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> ---
>  support.md | 37 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 support.md
>
> diff --git a/support.md b/support.md
> new file mode 100644
> index 0000000..b9f4aa6
> --- /dev/null
> +++ b/support.md
> @@ -0,0 +1,37 @@
> +---
> +title: Support
> +permalink: /support/
> +---
> +
> +If you have a support question that is not answered by our
> +[documentation](/documentation) you have a number of options available
> +to you.
> +
> +If the question is specifically about the integration of QEMU with the
> +rest of your distribution you may be better served by asking through
> +your distribution's support channels. This includes questions about a
> +specifically packaged versions of QEMU. The developers are generally
> +concerned with the latest release and the current state of the [master
> +branch](https://git.qemu.org/?p=3Dqemu.git).
> +
> +Questions about complex configurations of networking and storage are
> +usually met with a recommendation to use management tool like
> +[virt-manager](https://virt-manager.org/) from the [libvirt
> +project](https://libvirt.org/) to configure and run QEMU.
> +
> +* There is a
> +[qemu-discuss@nongnu.org](https://lists.nongnu.org/mailman/listinfo/qemu=
-discuss)
> +mailing list for user focused questions<br>
> +If your question is more technical or architecture specific you may
> +want to send your question to another of [QEMU's mailing
> +lists](https://wiki.qemu.org/MailingLists)
> +
> +* A lot of developers hang around on IRC (network: irc.oftc.net,
> +channel #qemu)<br> QEMU developers tend to hold normal office hours
> +and are distributed around the world. Please be patient as you may
> +have to wait some time for a response. If you can't leave IRC open and
> +wait you may be better served by a mailing list.
> +
> +* If you think you have found a bug you can report it on [our bug
> +  tracker](https://bugs.launchpad.net/qemu/)<br>
> +Please see our guide on [how to report a bug](/contribute/report-a-bug/)
> --
> 2.20.1
>
>


--=20
Marc-Andr=C3=A9 Lureau

