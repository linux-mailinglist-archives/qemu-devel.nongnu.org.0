Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC07103E8D
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Nov 2019 16:29:39 +0100 (CET)
Received: from localhost ([::1]:59348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iXRvF-0003fR-OR
	for lists+qemu-devel@lfdr.de; Wed, 20 Nov 2019 10:29:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34154)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlureau@redhat.com>) id 1iXRs1-00088L-GT
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 10:26:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlureau@redhat.com>) id 1iXRs0-0007C5-Dp
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 10:26:17 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:55914
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlureau@redhat.com>) id 1iXRs0-0007Bu-9p
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 10:26:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574263575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UU+UI2P8kLFMywmsiVyG++O4p2hl0m7GnatrLRH30XQ=;
 b=ZMr9UDR6SC5j75ZnSODGn3aCiZQFfiK++0gNOgYBd6lUGko+WV/qqV0djiLiqmb3LIbbuu
 e2Nfr8qV28fUXWuYpr1BhmuC8PT/AtVCqRxvUKThHgxI+ZiIb468pL3Nt7dP7ioLTOAgIp
 iXcB/835qJyhiWgfoZopj+mxrYACgaw=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238-TFTnw-aFM7WV57pBQjzttA-1; Wed, 20 Nov 2019 10:26:14 -0500
Received: by mail-ot1-f72.google.com with SMTP id 109so14178547otv.1
 for <qemu-devel@nongnu.org>; Wed, 20 Nov 2019 07:26:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=UU+UI2P8kLFMywmsiVyG++O4p2hl0m7GnatrLRH30XQ=;
 b=s0A2fzXoU+60J9T4KwKqxcLAqNfedmlzhk9MVJainmAXWsqy7FvLqp7K3Ac/XPyT5y
 JFHpr8L2oyWs3evLJ4JL+pq2rumq8+YlQo/4j0MbOIv/skpCrjbosYJi94CeIipr8paJ
 nq94pT0NFqlrUYnxqWH2/tnSgLGlcFgwgPSrVGxscFvJS3rjbaviFwPR/kGmeaV6Cbxz
 z5urs53Vv4z6xO9rk4OG6M4uK3UputU4zq3e9xEUN555w1zXwE9wiYVJG4k+6Y2ZeXU2
 S03V4nWfdF4brFeoJ+WgGM3uH/fXNIuERtGAuXukBdjzXP5hBcjE5zYI7Kz4RpBMkL0f
 uKfQ==
X-Gm-Message-State: APjAAAUAxZz7MRs9blby2dJJSz6Cb83djQhCoNM38VrXa5dUoQxGjsrb
 EdJ2ojubo34pgPXR3vYJY9Pdw07f08Bnxj4Z6WWVHw8MoBokVqNdlbPSaPeC/trtce75wHS60za
 qPbEONjaoSB125m+TPu9ktZvEH9n4Shc=
X-Received: by 2002:a05:6830:164a:: with SMTP id
 h10mr2386759otr.62.1574263573601; 
 Wed, 20 Nov 2019 07:26:13 -0800 (PST)
X-Google-Smtp-Source: APXvYqzShYtb+TsfLwXwI25JiJEYfOzbS74Sau5xOqn3iHn9MRawd59v6FScEBFCF962lkazjTjQYdF5vHJIj4qPIXc=
X-Received: by 2002:a05:6830:164a:: with SMTP id
 h10mr2386733otr.62.1574263573285; 
 Wed, 20 Nov 2019 07:26:13 -0800 (PST)
MIME-Version: 1.0
References: <20191120152400.26012-1-marcandre.lureau@redhat.com>
In-Reply-To: <20191120152400.26012-1-marcandre.lureau@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 20 Nov 2019 19:26:02 +0400
Message-ID: <CAMxuvay6QD53A2QWe2eidAmYk40JgjsoWR30mSuFDCLOC9nWJg@mail.gmail.com>
Subject: Re: [PATCH v6 00/37] Clean-ups: qom-ify serial and remove
 QDEV_PROP_PTR
To: qemu-devel <qemu-devel@nongnu.org>
X-MC-Unique: TFTnw-aFM7WV57pBQjzttA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 20, 2019 at 7:24 PM Marc-Andr=C3=A9 Lureau
<marcandre.lureau@redhat.com> wrote:
>
> Hi,
>
> QDEV_PROP_PTR is marked in multiple places as "FIXME/TODO/remove
> me". In most cases, it can be easily replaced with QDEV_PROP_LINK when
> the pointer points to an Object.
>
> There are a few places where such substitution isn't possible. For
> those places, it seems reasonable to use a specific setter method
> instead, and keep the user_creatable =3D false. In other places,
> proper usage of qdev or other facilies is the solution.
>
> The serial code wasn't converted to qdev, which makes it a bit more
> archaic to deal with. Let's convert it first, so we can more easily
> embed it from other devices, and re-export some properties and drop
> QDEV_PROP_PTR usage.
>
> v4: (after Peter & Philippe reviews)

Please ignore that cover letter, resending with v4 in subject (let's
see how patchew handle that!).


