Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 516D1DCDF0
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Oct 2019 20:28:51 +0200 (CEST)
Received: from localhost ([::1]:44946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iLWza-0001VV-AY
	for lists+qemu-devel@lfdr.de; Fri, 18 Oct 2019 14:28:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36335)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <scw@google.com>) id 1iLWyE-00011I-0n
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 14:27:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <scw@google.com>) id 1iLWyC-0007RI-S9
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 14:27:25 -0400
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44]:33437)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <scw@google.com>) id 1iLWyC-0007Qs-JC
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 14:27:24 -0400
Received: by mail-io1-xd44.google.com with SMTP id z19so8623121ior.0
 for <qemu-devel@nongnu.org>; Fri, 18 Oct 2019 11:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UkyVTQ/ReoYbIt1oZXb9JLgmG64XBFzbwvBM60gj0hE=;
 b=oIH4/0sbfoZRCBxaF8A5q09Pe/M1RQd7ytRQU2TSfSNzqZGg83TMGaimwjFcORTwRe
 FhSRt37rQE+Dnnp/i42mNsK+M5fieL9PBcRfa4UY0426OpQ3lsdWacH3ZhDmoYZSb+ZU
 g6wUl5ucmS/8RONBparcLcfXtlHAxyC6NptQYNTFmKPd48JrVN2siTK1lgvNwboKn11+
 LCff0dNWN+F0SaeBsZgBG+ns8WZDYC+E3aaDUim/6LVWGNk95DuNaysKebnO9YLJd+MM
 orTfvjE+XRlQdikfdPhRUYtC62sfFIj8NoIuCFnBXrq1jXVqBOph/tX5aoav2aNIt6l+
 +xPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UkyVTQ/ReoYbIt1oZXb9JLgmG64XBFzbwvBM60gj0hE=;
 b=g6PKnAXws3IYGVbI7Z820wJQETVwTkd4Ho3j8Lnm+zxQfu+hQ0Ub5i9Ybnan+PRTNY
 sM+3LrUb0dHjbA8MbBLeCDdeRxBsNSqSf026TPDBMnGzUnDxb/7yOeWAa1lGDTGwkrrQ
 nFytk8SDNrzBvQtjfwO0+0V+pp9kO/OW0oQxIDuXoC73YyhZmZ4tWV1XPhT1gUpeUQee
 IllyLJTTr7LrL+fsGPE7eNmb7Yf01fS7nacHZ6f2lw/vv5MiCXrzm7yarbipD5FQioON
 4aNCA+V8xpyhcAxOk1tv37nU7c3C7b14cuQokAaWxjc7CNz8+zQuxjuiQ3i3tzRlseGT
 o1sg==
X-Gm-Message-State: APjAAAWZN9XbQ9yL9GEt90z5Nv+DJyg1HXezIPpF6dTg+IuykOLz0Y9A
 BEaf7n4SMuNfZL0bZc24OjtGe/gDhjVBhMNicsEAQw==
X-Google-Smtp-Source: APXvYqx7T0kj3QMeXSjGqAWQpd+g0y1LVXlOZIyURy3qhsDqBvy+8JB+zfIz3qbwoybVInXB3NveKP2B6nJWRlnTc2Q=
X-Received: by 2002:a02:4447:: with SMTP id o68mr10362159jaa.137.1571423243025; 
 Fri, 18 Oct 2019 11:27:23 -0700 (PDT)
MIME-Version: 1.0
References: <20191018001920.178283-1-scw@google.com>
 <4b34aa24-8669-7713-84f3-07e9e8400734@vivier.eu>
In-Reply-To: <4b34aa24-8669-7713-84f3-07e9e8400734@vivier.eu>
From: Shu-Chun Weng <scw@google.com>
Date: Fri, 18 Oct 2019 11:27:11 -0700
Message-ID: <CAF3nBxicPpCjTN1M581bbxqT6y7KupG4GW4-4m0v0JkiHR8Yww@mail.gmail.com>
Subject: Re: [PATCH] Fix unsigned integer underflow in fd-trans.c
To: Laurent Vivier <laurent@vivier.eu>
Cc: Riku Voipio <riku.voipio@iki.fi>, qemu-devel@nongnu.org
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="0000000000003c327b0595337c90"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::d44
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000003c327b0595337c90
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

(Re-sending to the list because I forgot to turn off HTML before and
it was bounced.)

That does prevent the integer underflow, but it also changes the
behavior and I don't think the new behavior is desirable.

If the extra payload has a smaller alignment than the header, it makes
sense for the user program to generate a nlmsg_len that is not a
multiple of the alignment. When it's the last entry, the new condition
will it because NLMSG_ALIGN pushes the aligned length over `len`, yet
the single entry processing function won't actually read beyond the
buffer as long as it's bounded by nlmsg_len.

Shu-Chun


On Fri, Oct 18, 2019 at 12:26 AM Laurent Vivier <laurent@vivier.eu> wrote:
>
> Le 18/10/2019 =C3=A0 02:19, Shu-Chun Weng a =C3=A9crit :
> > In any of these `*_for_each_*` functions, the last entry in the buffer =
(so the
> > "remaining length in the buffer" `len` is equal to the length of the
> > entry `nlmsg_len`/`nla_len`/etc) has size that is not a multiple of the
> > alignment, the aligned lengths `*_ALIGN(*_len)` will be greater than `l=
en`.
> > Since `len` is unsigned (`size_t`), it underflows and the loop will rea=
d
> > pass the buffer.
> >
> > This may manifest as random EINVAL or EOPNOTSUPP error on IO or network
> > system calls.
> >
> > Signed-off-by: Shu-Chun Weng <scw@google.com>
> > ---
> >  linux-user/fd-trans.c | 51 +++++++++++++++++++++++++++++++++----------
> >  1 file changed, 40 insertions(+), 11 deletions(-)
> >
> > diff --git a/linux-user/fd-trans.c b/linux-user/fd-trans.c
> > index 60077ce531..9b92386abf 100644
> > --- a/linux-user/fd-trans.c
> > +++ b/linux-user/fd-trans.c
> > @@ -279,6 +279,7 @@ static abi_long host_to_target_for_each_nlmsg(struc=
t nlmsghdr *nlh,
> >                                                         (struct nlmsghd=
r *))
> >  {
> >      uint32_t nlmsg_len;
> > +    uint32_t aligned_nlmsg_len;
> >      abi_long ret;
> >
> >      while (len > sizeof(struct nlmsghdr)) {
> > @@ -312,8 +313,13 @@ static abi_long host_to_target_for_each_nlmsg(stru=
ct nlmsghdr *nlh,
> >              break;
> >          }
> >          tswap_nlmsghdr(nlh);
> > -        len -=3D NLMSG_ALIGN(nlmsg_len);
> > -        nlh =3D (struct nlmsghdr *)(((char*)nlh) + NLMSG_ALIGN(nlmsg_l=
en));
> > +
> > +        aligned_nlmsg_len =3D NLMSG_ALIGN(nlmsg_len);
> > +        if (aligned_nlmsg_len >=3D len) {
> > +            break;
> > +        }
> > +        len -=3D aligned_nlmsg_len;
> > +        nlh =3D (struct nlmsghdr *)(((char*)nlh) + aligned_nlmsg_len);
> >      }
> >      return 0;
> >  }
>
> Nice catch.
>
> But the first "if" in the loop is already here for that, we only need to
> fix it with something like that in all the for_each functions:
>
> @@ -285,7 +285,7 @@ static abi_long host_to_target_for_each_nlmsg(struct
> nlmsghdr *nlh,
>
>          nlmsg_len =3D nlh->nlmsg_len;
>          if (nlmsg_len < sizeof(struct nlmsghdr) ||
> -            nlmsg_len > len) {
> +            NLMSG_ALIGN(nlmsg_len) > len) {
>              break;
>          }
>
> Thanks,
> Laurent
>

--0000000000003c327b0595337c90
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIS4QYJKoZIhvcNAQcCoIIS0jCCEs4CAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
ghBHMIIEXDCCA0SgAwIBAgIOSBtqDm4P/739RPqw/wcwDQYJKoZIhvcNAQELBQAwZDELMAkGA1UE
BhMCQkUxGTAXBgNVBAoTEEdsb2JhbFNpZ24gbnYtc2ExOjA4BgNVBAMTMUdsb2JhbFNpZ24gUGVy
c29uYWxTaWduIFBhcnRuZXJzIENBIC0gU0hBMjU2IC0gRzIwHhcNMTYwNjE1MDAwMDAwWhcNMjEw
NjE1MDAwMDAwWjBMMQswCQYDVQQGEwJCRTEZMBcGA1UEChMQR2xvYmFsU2lnbiBudi1zYTEiMCAG
A1UEAxMZR2xvYmFsU2lnbiBIViBTL01JTUUgQ0EgMTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCC
AQoCggEBALR23lKtjlZW/17kthzYcMHHKFgywfc4vLIjfq42NmMWbXkNUabIgS8KX4PnIFsTlD6F
GO2fqnsTygvYPFBSMX4OCFtJXoikP2CQlEvO7WooyE94tqmqD+w0YtyP2IB5j4KvOIeNv1Gbnnes
BIUWLFxs1ERvYDhmk+OrvW7Vd8ZfpRJj71Rb+QQsUpkyTySaqALXnyztTDp1L5d1bABJN/bJbEU3
Hf5FLrANmognIu+Npty6GrA6p3yKELzTsilOFmYNWg7L838NS2JbFOndl+ce89gM36CW7vyhszi6
6LqqzJL8MsmkP53GGhf11YMP9EkmawYouMDP/PwQYhIiUO0CAwEAAaOCASIwggEeMA4GA1UdDwEB
/wQEAwIBBjAdBgNVHSUEFjAUBggrBgEFBQcDAgYIKwYBBQUHAwQwEgYDVR0TAQH/BAgwBgEB/wIB
ADAdBgNVHQ4EFgQUyzgSsMeZwHiSjLMhleb0JmLA4D8wHwYDVR0jBBgwFoAUJiSSix/TRK+xsBtt
r+500ox4AAMwSwYDVR0fBEQwQjBAoD6gPIY6aHR0cDovL2NybC5nbG9iYWxzaWduLmNvbS9ncy9n
c3BlcnNvbmFsc2lnbnB0bnJzc2hhMmcyLmNybDBMBgNVHSAERTBDMEEGCSsGAQQBoDIBKDA0MDIG
CCsGAQUFBwIBFiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzANBgkqhkiG
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
--0000000000003c327b0595337c90--

