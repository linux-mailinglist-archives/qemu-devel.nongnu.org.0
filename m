Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B23A6C18F8
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Sep 2019 20:28:17 +0200 (CEST)
Received: from localhost ([::1]:41520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iEdvc-0000P0-6A
	for lists+qemu-devel@lfdr.de; Sun, 29 Sep 2019 14:28:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39054)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@gmail.com>) id 1iEduS-0008Jj-Pk
 for qemu-devel@nongnu.org; Sun, 29 Sep 2019 14:27:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@gmail.com>) id 1iEduR-0007Vh-KO
 for qemu-devel@nongnu.org; Sun, 29 Sep 2019 14:27:04 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:39402)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
 id 1iEduR-0007VI-Bq
 for qemu-devel@nongnu.org; Sun, 29 Sep 2019 14:27:03 -0400
Received: by mail-wm1-x341.google.com with SMTP id v17so10255206wml.4
 for <qemu-devel@nongnu.org>; Sun, 29 Sep 2019 11:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0znAm1APlKwxUYstE+U4yRnhv2z9fuHlNkAgJ+5sYA8=;
 b=vZtuROo90pWHIGOcicMnniEcnvrF0A9KqfbN26sY/SQX/ryMwfpGepPLXNvbXIKpXF
 Rfv+rue/0VEKkHbL9nSQlM9NO+v/l2Fj+b1AkSCGess8HDI1nhXoQOsKJ/DCciDXB+3Y
 rMRmtq8E2dsJN4wOMcuPoar8KcW9aaJn+nrZuKotAzrCQf0l98idhcT9hEenewwgInNt
 WjJ1MfSuWHv/YW59dpO7efYs3uhYYT+dee9RNFKsNPhRBWDx+nBBu/njnJl5Sg4XoJx4
 VpwntqDnDH7UuxQShH8NmzP+g1xp0lquK4Mn2kYaBNEzneCCi3PmvIwKQJB2KeSAu8n6
 kp0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0znAm1APlKwxUYstE+U4yRnhv2z9fuHlNkAgJ+5sYA8=;
 b=mfHVvW3/ATZa7HTHsWtlqbDsE+roJLb6MsJDurJ7oq627wYwSrPLsn3NALDGkHRxZ8
 pgNS0aKQNBoW4iGoT7bCZF6Jy+TgV6lKsZT2zcz2IWUJAYoHrRUrdmfStjpQvtAtv6kZ
 TSQYkq+kjt+WkfyJFKy8Knb9Os+ifg6hJu4Q1zn85LNuj0clGPPDT6h/AdLGPvdJJn/u
 ApHGGiFk686adJ8Fb+T8TCcFM1A6hnEiML+r931m68l4RzwlmxHg7LxeMe7WNyL9UtNw
 fm/wTd2bup+6VEo9Z77qLDmj0WSwLUNiyPELWCXrFMIzP6HNL8wh0vUNHOvp6dBftXr3
 QEpA==
X-Gm-Message-State: APjAAAURpA2TbCHHPpxVygPkdpeLfxppLxB23oqSxuq/kZPfJxbv4PpH
 pLWGzwv5kIOPWQWJJHuL23YA38MdNqIiAnzjoNs=
X-Google-Smtp-Source: APXvYqyVYTNAhuUwQGofUnwuDovsr0dEGwIX1vQhLCGEm29xURMOzciQoXI7PPwDq8cJLEssP6g+J5Z0laNpl5b3PnE=
X-Received: by 2002:a1c:c789:: with SMTP id x131mr14093297wmf.20.1569781621412; 
 Sun, 29 Sep 2019 11:27:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190929181303.19960-1-samuel.thibault@ens-lyon.org>
In-Reply-To: <20190929181303.19960-1-samuel.thibault@ens-lyon.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Sun, 29 Sep 2019 22:26:48 +0400
Message-ID: <CAJ+F1CLgLzo=PJega2gPvuvXFmgTmK19j+TbNC0obiHgADvh1g@mail.gmail.com>
Subject: Re: [PATCH] slirp: Allow non-local DNS address when restrict is off
To: Samuel Thibault <samuel.thibault@ens-lyon.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
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
Cc: Jason Wang <jasowang@redhat.com>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Sep 29, 2019 at 10:13 PM Samuel Thibault
<samuel.thibault@ens-lyon.org> wrote:
>
> This can be used to set a DNS server to be used by the guest which is
> different from the one configured on the host.
>
> This fixes LP 1010484.
>
> Signed-off-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> ---
>  net/slirp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/net/slirp.c b/net/slirp.c
> index f42f496641..4d158b0542 100644
> --- a/net/slirp.c
> +++ b/net/slirp.c
> @@ -456,7 +456,7 @@ static int net_slirp_init(NetClientState *peer, const=
 char *model,
>          error_setg(errp, "Failed to parse DNS");
>          return -1;
>      }
> -    if ((dns.s_addr & mask.s_addr) !=3D net.s_addr) {
> +    if (restricted && (dns.s_addr & mask.s_addr) !=3D net.s_addr) {
>          error_setg(errp, "DNS doesn't belong to network");
>          return -1;
>      }
> --
> 2.23.0
>
>


--=20
Marc-Andr=C3=A9 Lureau

