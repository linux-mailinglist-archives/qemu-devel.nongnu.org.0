Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1AC3AE868
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 13:53:42 +0200 (CEST)
Received: from localhost ([::1]:40868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvIUn-0003Va-7U
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 07:53:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1lvITj-0002gH-4q; Mon, 21 Jun 2021 07:52:35 -0400
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32]:41555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1lvITh-0005jv-59; Mon, 21 Jun 2021 07:52:34 -0400
Received: by mail-io1-xd32.google.com with SMTP id p66so15380413iod.8;
 Mon, 21 Jun 2021 04:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WVtrDg4vCWk1LNY/OEmrjNE7KzUxFQT++2fit6ExOfg=;
 b=cm3FfJpC+eiz/8YGbBJTv8cFXXWdsDIYlYkjcyUOXr0deZxsdBdtqXjZS19CrMMw9r
 Mlji/CzrzEvSKObS92Lwsy3KUCbH40V2g8VeG7vnEhPKkM7FkZj3YvakKkPQGnuDzrvX
 yRARIxh5DJrGOm7iRTLoEylQEjurQ+mScrR/3XbmSu9OwphM9oOO15vPwsCz5KDOMw9M
 b4i+bANxvQJ5dOBWP5zdtmSyCgEmz6FUta6ISRhB6rvPGM0CxSTVZwpOu+IC9mkVYTT/
 XoFzzx/u0YJnh9ykfSxF/zndYVQVh0l1ho4SEr0n2FC1fyYLxGJ7RcAnjUV7bzQUW/gG
 Kg7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WVtrDg4vCWk1LNY/OEmrjNE7KzUxFQT++2fit6ExOfg=;
 b=CiCqc2lXBnZzEVjlQ94IzVSfzKJslReIoKkmpmZHPYZQc1lJNqeMIgpP0h78QVp/UF
 0gJaXVkKdXM+w1hqsxgugokse6LUZq2E1ZSJ1cnK/rpuMMurknLJgTSDQKhDhsTGlrfN
 3O7+CR+G+dMh2pNiaue+e+D9+XoXsgC8XL1g8zlkMrYS95WvmS6N4EPPgiv/k/usrw3c
 0cZPSm1G2XqIYYK2QBSpUSfLfrQbgdcNVyUtS023hrbwPVtFAYi7PoJKhGhzhwvASa5e
 7/Fy5QXy0/f4hYRtMsh6CMJR2Alhh6du3i0D1+LISEs1UobNHp9F1rQ56buyVuQOLgrM
 MvTw==
X-Gm-Message-State: AOAM5300sgGZ5zKPmuVEPd+S0LXLIR/ZrsI+lW7ICEyW0eSUiOBy3PKs
 63ULWa5O1tFBY+JFlTHy6SqKOsos5hvVSKJcpsw=
X-Google-Smtp-Source: ABdhPJzF28VhSMpPURM+eb++2w5TmpnkivL/Pjegk687/7fIOGrCNd6JsjH+jOwmfgsJIXZoOgAT7exTU/xBvEl/aCU=
X-Received: by 2002:a6b:8f83:: with SMTP id
 r125mr19328304iod.123.1624276351683; 
 Mon, 21 Jun 2021 04:52:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210617160520.3694358-1-oro@il.ibm.com>
 <CAOi1vP8JJiupdBCQsfN=KK8j1Q2Bnu059vXS0a1M53QsgY+OFQ@mail.gmail.com>
 <YNBOiU8xPhDO3zae@redhat.com>
 <CAOi1vP8LROnu1_dE28JU17gbOjQW8MiB8L-65Pt0ZWPMZucUUg@mail.gmail.com>
 <YNByJ13sZxM9cv4s@redhat.com>
 <CAOi1vP9_+JVJ1LoueWeLUN5cT49aHJNV+E-mF3Qe6Q9yGDQwOw@mail.gmail.com>
 <YNB3qUgArivWUY/d@redhat.com>
In-Reply-To: <YNB3qUgArivWUY/d@redhat.com>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Mon, 21 Jun 2021 13:52:20 +0200
Message-ID: <CAOi1vP_uqwca1P+P6DrwD7dZuff9_SpWWX=AjuELBrgaavAjnw@mail.gmail.com>
Subject: Re: [PATCH] block/rbd: Add support for rbd image encryption
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d32;
 envelope-from=idryomov@gmail.com; helo=mail-io1-xd32.google.com
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Mykola Golub <to.my.trociny@gmail.com>, Or Ozeri <oro@il.ibm.com>,
 Danny Harnik <dannyh@il.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 21, 2021 at 1:27 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> On Mon, Jun 21, 2021 at 01:23:46PM +0200, Ilya Dryomov wrote:
> > On Mon, Jun 21, 2021 at 1:04 PM Daniel P. Berrang=C3=A9 <berrange@redha=
t.com> wrote:
> > >
> > > On Mon, Jun 21, 2021 at 12:59:37PM +0200, Ilya Dryomov wrote:
> > > > On Mon, Jun 21, 2021 at 10:32 AM Daniel P. Berrang=C3=A9 <berrange@=
redhat.com> wrote:
> > > > >
> > > > > On Sat, Jun 19, 2021 at 09:44:32PM +0200, Ilya Dryomov wrote:
> > > > > > On Thu, Jun 17, 2021 at 6:05 PM Or Ozeri <oro@il.ibm.com> wrote=
:
> > > > > > >
> > > > > > > Starting from ceph Pacific, RBD has built-in support for imag=
e-level encryption.
> > > > > > > Currently supported formats are LUKS version 1 and 2.
> > > > > > >
> > > > > > > There are 2 new relevant librbd APIs for controlling encrypti=
on, both expect an
> > > > > > > open image context:
> > > > > > >
> > > > > > > rbd_encryption_format: formats an image (i.e. writes the LUKS=
 header)
> > > > > > > rbd_encryption_load: loads encryptor/decryptor to the image I=
O stack
> > > > > > >
> > > > > > > This commit extends the qemu rbd driver API to support the ab=
ove.
> > > > > > >
> > > > > > > Signed-off-by: Or Ozeri <oro@il.ibm.com>
> > > > > > > ---
> > > > > > >  block/raw-format.c   |   7 +
> > > > > > >  block/rbd.c          | 371 +++++++++++++++++++++++++++++++++=
+++++++++-
> > > > > > >  qapi/block-core.json | 110 ++++++++++++-
> > > > > > >  3 files changed, 482 insertions(+), 6 deletions(-)
> > > > >
> > > > >
> > > > > > > diff --git a/block/rbd.c b/block/rbd.c
> > > > > > > index f098a89c7b..183b17cd84 100644
> > > > > > > --- a/block/rbd.c
> > > > > > > +++ b/block/rbd.c
> > > > > > > @@ -73,6 +73,18 @@
> > > > > > >  #define LIBRBD_USE_IOVEC 0
> > > > > > >  #endif
> > > > > > >
> > > > > > > +#define RBD_ENCRYPTION_LUKS_HEADER_VERIFICATION_LEN 8
> > > > > > > +
> > > > > > > +static const char rbd_luks_header_verification[
> > > > > > > +        RBD_ENCRYPTION_LUKS_HEADER_VERIFICATION_LEN] =3D {
> > > > > > > +    'L', 'U', 'K', 'S', 0xBA, 0xBE, 0, 1
> > > > > > > +};
> > > > > > > +
> > > > > > > +static const char rbd_luks2_header_verification[
> > > > > > > +        RBD_ENCRYPTION_LUKS_HEADER_VERIFICATION_LEN] =3D {
> > > > > > > +    'L', 'U', 'K', 'S', 0xBA, 0xBE, 0, 2
> > > > > > > +};
> > > > > > > +
> > > > > > >  typedef enum {
> > > > > > >      RBD_AIO_READ,
> > > > > > >      RBD_AIO_WRITE,
> > > > > > > @@ -341,6 +353,206 @@ static void qemu_rbd_memset(RADOSCB *rc=
b, int64_t offs)
> > > > > > >      }
> > > > > > >  }
> > > > > > >
> > > > > > > +#ifdef LIBRBD_SUPPORTS_ENCRYPTION
> > > > > > > +static int qemu_rbd_convert_luks_options(
> > > > > > > +        RbdEncryptionOptionsLUKSBase *luks_opts,
> > > > > > > +        char **passphrase,
> > > > > > > +        Error **errp)
> > > > > > > +{
> > > > > > > +    int r =3D 0;
> > > > > > > +
> > > > > > > +    if (!luks_opts->has_key_secret) {
> > > > > > > +        r =3D -EINVAL;
> > > > > > > +        error_setg_errno(errp, -r, "missing encrypt.key-secr=
et");
> > > > > > > +        return r;
> > > > > > > +    }
> > > > > >
> > > > > > Why is key-secret optional?
> > > > >
> > > > > It doesn't look like it is handled correctly here, but we need to
> > > > > be able to run 'qemu-img info <volume>' and get information back
> > > > > on the size of the image, and whether or not it is encrypted,
> > > > > without having to supply a passphrase upfront. So it is right tha=
t
> > > > > key-secret be optional, but also we shouldn't return an fatal
> > > > > error like this.
> > > >
> > > > Hi Daniel,
> > > >
> > > > The key-secret lives inside RbdEncryptionOptions (or
> > > > RbdEncryptionCreateOptions) which are already optional:
> > > >
> > > >     '*encrypt': 'RbdEncryptionOptions'
> > > >
> > > >     '*encrypt' :        'RbdEncryptionCreateOptions'
> > > >
> > > > The image is opened as usual and then, if "encrypt" is specified,
> > > > the encryption profile is loaded (or created and laid down).  It do=
es
> > > > not make sense to attempt to load or create the encryption profile
> > > > without the passphrase -- it would always fail.
> > >
> > > Ah, that sounds like it is probably ok then.
> > >
> > >
> > > > > Only if BDRV_O_NO_IO is NOT set, should this error be reported
> > > > >
> > > > >
> > > > >
> > > > >
> > > > > > >  static int64_t qemu_rbd_getlength(BlockDriverState *bs)
> > > > > > >  {
> > > > > > >      BDRVRBDState *s =3D bs->opaque;
> > > > > > > @@ -1243,6 +1589,22 @@ static QemuOptsList qemu_rbd_create_op=
ts =3D {
> > > > > > >              .type =3D QEMU_OPT_STRING,
> > > > > > >              .help =3D "ID of secret providing the password",
> > > > > > >          },
> > > > > > > +        {
> > > > > > > +            .name =3D "encrypt.format",
> > > > > > > +            .type =3D QEMU_OPT_STRING,
> > > > > > > +            .help =3D "Encrypt the image, format choices: 'l=
uks', 'luks2'",
> > > > > >
> > > > > > I think it should be "luks1" and "luks2" to match rbd/librbd.h =
and
> > > > > > "rbd encryption format" command.
> > > > >
> > > > > No, it should stay "luks" not "luks1", to match the existing QEMU
> > > > > terminology for its LUKS v1 encryption support.
> > > >
> > > > If you insist on following the QEMU nomenclature here it's fine wit=
h
> > > > me but I want to point out that encryption-formatted clones won't b=
e
> > > > interoperable with QEMU LUKS driver or dm-crypt so making the names
> > > > match QEMU instead of librbd and rbd CLI seems a bit misleading.
> > >
> > > In what way is it not interoperable ?
> > >
> > > If we don't specify any 'encrypt' option, does the guest see the
> > > raw LUKS header + payload, or is the header completely hidden
> > > and only ever accessible RBD ?
> >
> > I think it would see the LUKS header but wouldn't be able to open the
> > LUKS container or do anything else that requires the passphrase.
>
> Hmm, that probably means that QEMU's existing general "luks" driver
> could be layered on top of an encrypted RBD volume too, at least for
> a v1 format. QEMU doesn't support the v2 format at this time.

Yes, as long as the image is not an encryption-formatted clone.  This
was one of the design goals.

>
> I wonder what the tradeoffs are in choosing between RBD's builtin
> LUKS vs QEMU's LUKS driver.

Thin-provisioned COW clones: getting rid of a major obstacle that an
RBD clone must be encrypted with same key as its parent.  The only way
to avoid that today is to basically replace a thin clone with a thick
copy.

>
> RBD's builtin LUKS will do decrypt on the client host I presume ?
> Is it a pure userspace impl in terms of crypto ?

Yes, on the client.  Pure userspace (openssl) at this point.

Thanks,

                Ilya

