Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 779D0802A2
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Aug 2019 00:19:59 +0200 (CEST)
Received: from localhost ([::1]:37788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1htfu2-0006jS-6O
	for lists+qemu-devel@lfdr.de; Fri, 02 Aug 2019 18:19:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56189)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <marcandre.lureau@gmail.com>) id 1htftH-0006JT-2T
 for qemu-devel@nongnu.org; Fri, 02 Aug 2019 18:19:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@gmail.com>) id 1htftF-0006Nt-5m
 for qemu-devel@nongnu.org; Fri, 02 Aug 2019 18:19:11 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:45619)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
 id 1htftD-0006MT-4u
 for qemu-devel@nongnu.org; Fri, 02 Aug 2019 18:19:09 -0400
Received: by mail-wr1-x444.google.com with SMTP id f9so78599602wre.12
 for <qemu-devel@nongnu.org>; Fri, 02 Aug 2019 15:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=MRp2pXCsWr7h412oTHqX0Wy4CduJAcJgM7131Lh4D5U=;
 b=nPYvlx8gAx/kjdzoYFp3o60h3PwgibOX6SFgZPB0Txi5B05LrRPVDF50eyE9S9SOBX
 wQItEmCIZBKtMHWZEHrzbxlLoqNzjmBSCKcQNdBgDKJL0Sa+8t1vPoCVwyeh+WE/wibH
 1TvzwocDF5hvI92hqzDtQSNqQsxmvixCn6wo8pcGPJW3tnx4PiIqZEENATkp79CRXQtE
 wEZgRmc5EZ7CEFB43aSSX21u7yfLijKPuyotWb05mGZtYh5R5NJsKNd5EgLMiSijmdxh
 PTC3DavgOGMcUC3gADcbxtT3GHtqF8RHQ7BO+yAkOeGjGQcDLZa+4hkDCdA40FWKuxAR
 jJ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MRp2pXCsWr7h412oTHqX0Wy4CduJAcJgM7131Lh4D5U=;
 b=e/HRhVYTt5/oumQ27JWVLf7cFPXNGQgNRc/PLVgzanUdhQO/Cxs33lyTCW7h56KTcs
 XjbIkEfWPGriEHc7V4jo+ObeTazWq0KKv9+SlB4IOS3/WzpzMgNf/7brmIB3qahqZoUZ
 7SkLXGUj6P6rCQACMH/keAOhQUsw+9OVCJgxXwbqTfZsAhPQ7bMcyv5RV11dY2R6kSB2
 fdWcI21dshheTEP8/QZSXiUe8s0hEmilIxCUN+ljBtN3t5napk5AALaMt0IpcN8vyVnU
 Pi3oIQWExuUCTzGWXG/6Nc2TrMydSjmHMhjF5FooUe4MYGvCXNcjFozbn96wRMDFWL0g
 gLdA==
X-Gm-Message-State: APjAAAUJZDhIHD2YIQTniDTtiw1iMWeUiiu7X6kZhQataaGklO/zcS0q
 4aq5q4pLByyYerTyMxdSZBEa0WM3HuAJzGELPYA=
X-Google-Smtp-Source: APXvYqw/eqU3dqJWIjMAi++HyMSo2aB66AV3UBKZyhQ6zw+kRRw2qXY5dIVtNcC2Y1c1s8d+5M0U06W6b2c/Ynp6baU=
X-Received: by 2002:adf:ea8b:: with SMTP id
 s11mr145845713wrm.100.1564784344950; 
 Fri, 02 Aug 2019 15:19:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190802180449.10288-1-philmd@redhat.com>
 <20190802180449.10288-2-philmd@redhat.com>
In-Reply-To: <20190802180449.10288-2-philmd@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Sat, 3 Aug 2019 02:18:53 +0400
Message-ID: <CAJ+F1C+r-7Eaw_MeaJWHyxxPEL3Ag6p13mhdE1+mrCLasXZ-7w@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: Re: [Qemu-devel] [PATCH-for-3.1.1 1/1] Fix heap overflow in
 ip_reass on big packet input
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Jan Kiszka <jan.kiszka@siemens.com>, QEMU <qemu-devel@nongnu.org>,
 Michael Roth <mdroth@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 2, 2019 at 10:09 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> From: Samuel Thibault <samuel.thibault@ens-lyon.org>
>
> When the first fragment does not fit in the preallocated buffer, q will
> already be pointing to the ext buffer, so we mustn't try to update it.
>
> Signed-off-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
> (cherry picked from libslirp commit 126c04acbabd7ad32c2b018fe10dfac2a3bc1=
210)
> Fixes: CVE-2019-14378
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


thanks

> ---
>  slirp/ip_input.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/slirp/ip_input.c b/slirp/ip_input.c
> index 348e1dca5a..07d8808671 100644
> --- a/slirp/ip_input.c
> +++ b/slirp/ip_input.c
> @@ -334,6 +334,8 @@ insert:
>      q =3D fp->frag_link.next;
>         m =3D dtom(slirp, q);
>
> +       int was_ext =3D m->m_flags & M_EXT;
> +
>         q =3D (struct ipasfrag *) q->ipf_next;
>         while (q !=3D (struct ipasfrag*)&fp->frag_link) {
>           struct mbuf *t =3D dtom(slirp, q);
> @@ -356,7 +358,7 @@ insert:
>          * the old buffer (in the mbuf), so we must point ip
>          * into the new buffer.
>          */
> -       if (m->m_flags & M_EXT) {
> +       if (!was_ext && m->m_flags & M_EXT) {
>           int delta =3D (char *)q - m->m_dat;
>           q =3D (struct ipasfrag *)(m->m_ext + delta);
>         }
> --
> 2.20.1
>
>


--=20
Marc-Andr=C3=A9 Lureau

