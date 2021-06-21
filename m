Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA0C3AE818
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 13:25:57 +0200 (CEST)
Received: from localhost ([::1]:55768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvI3v-0000pq-4D
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 07:25:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1lvI26-0007rB-TL; Mon, 21 Jun 2021 07:24:04 -0400
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135]:35693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1lvI23-0003Ha-K0; Mon, 21 Jun 2021 07:24:02 -0400
Received: by mail-il1-x135.google.com with SMTP id a11so8146671ilf.2;
 Mon, 21 Jun 2021 04:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=TfZ3suaGed8UA3VMDJ39XY59v4FLh9MFZc/XeWiiKGw=;
 b=O7LMY4CivnweXj8UGnWATP8Rwvs93SaY2ghyc80dH6gVt0rlN2eH9l36lj1MWDkfFE
 /Bobk7mNeiCn8Zg62yPRCwgOHv2uf3wCMHkqQwoN+vtXW6OM5HoPcNAIO2nDUm1xI8TX
 YuuCyAXI9IxVF395miBxq3g5rwBed/4eStQkoGG3GTXoPhOBEo3dzsmNlVTSOv/IVvis
 Uuws9rEul6fO2wKiGM/rkrgB/3QuI0s80qXXxua807chXP7HXX/0YPuJjra6dt18De+I
 3zOio2DhB+miwvJNn9cTma2zUFt4kLwAAO5FjB8Gmh/pPYCxb5zH/fmmvxZUe9DLaxxC
 z3Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TfZ3suaGed8UA3VMDJ39XY59v4FLh9MFZc/XeWiiKGw=;
 b=Ro2szc79tIBTMGerUb5O+EoqesmrHqJ7qoLsDagECR0q3xrf08DCbnwCuH4wrosUZh
 FzKf+KmH3VHH14sj7Sk7o1PJEBAupnrUHbbjZbLYq3s9AlN5S+JFZnQL527jBG0Nqn7p
 Qro3mIlcks/1rZ2wHO9VlY7HO2spmgAZFfarZe9Ivdqic1C57XALHTUY9xezw1FARFit
 Of7Hrra+NsAK8AwAgT44gJBNFEvNtm0OoGAbnqUlyPskKQKHaFpfIkHwyHtG4d/auyDJ
 8ErtMB0OBl+Oc3V+f5ppbzK/vVjzbOPXwq4XOnoLO42LpAT9v+29a47QDu5iIlS/Ha0K
 e0yg==
X-Gm-Message-State: AOAM532IDNyu7Cz5cDhe4s1lG27Q+ghQjGa74/8o/ucE3LdYwE5UARti
 biJ33k32EqlZo4a0jWfnrfP9jcV7o1hhsF2j5fc=
X-Google-Smtp-Source: ABdhPJz5jvzAJjkwDqeinTTiyEZLIN9aTz7ovhOLWtlT00kGqJb8vy7vxIfSr64c4+RrtCy+0dGJFi0ZjgMCG36Uga0=
X-Received: by 2002:a92:c0cc:: with SMTP id t12mr7544343ilf.177.1624274637757; 
 Mon, 21 Jun 2021 04:23:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210617160520.3694358-1-oro@il.ibm.com>
 <CAOi1vP8JJiupdBCQsfN=KK8j1Q2Bnu059vXS0a1M53QsgY+OFQ@mail.gmail.com>
 <YNBOiU8xPhDO3zae@redhat.com>
 <CAOi1vP8LROnu1_dE28JU17gbOjQW8MiB8L-65Pt0ZWPMZucUUg@mail.gmail.com>
 <YNByJ13sZxM9cv4s@redhat.com>
In-Reply-To: <YNByJ13sZxM9cv4s@redhat.com>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Mon, 21 Jun 2021 13:23:46 +0200
Message-ID: <CAOi1vP9_+JVJ1LoueWeLUN5cT49aHJNV+E-mF3Qe6Q9yGDQwOw@mail.gmail.com>
Subject: Re: [PATCH] block/rbd: Add support for rbd image encryption
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::135;
 envelope-from=idryomov@gmail.com; helo=mail-il1-x135.google.com
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

On Mon, Jun 21, 2021 at 1:04 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> On Mon, Jun 21, 2021 at 12:59:37PM +0200, Ilya Dryomov wrote:
> > On Mon, Jun 21, 2021 at 10:32 AM Daniel P. Berrang=C3=A9 <berrange@redh=
at.com> wrote:
> > >
> > > On Sat, Jun 19, 2021 at 09:44:32PM +0200, Ilya Dryomov wrote:
> > > > On Thu, Jun 17, 2021 at 6:05 PM Or Ozeri <oro@il.ibm.com> wrote:
> > > > >
> > > > > Starting from ceph Pacific, RBD has built-in support for image-le=
vel encryption.
> > > > > Currently supported formats are LUKS version 1 and 2.
> > > > >
> > > > > There are 2 new relevant librbd APIs for controlling encryption, =
both expect an
> > > > > open image context:
> > > > >
> > > > > rbd_encryption_format: formats an image (i.e. writes the LUKS hea=
der)
> > > > > rbd_encryption_load: loads encryptor/decryptor to the image IO st=
ack
> > > > >
> > > > > This commit extends the qemu rbd driver API to support the above.
> > > > >
> > > > > Signed-off-by: Or Ozeri <oro@il.ibm.com>
> > > > > ---
> > > > >  block/raw-format.c   |   7 +
> > > > >  block/rbd.c          | 371 +++++++++++++++++++++++++++++++++++++=
+++++-
> > > > >  qapi/block-core.json | 110 ++++++++++++-
> > > > >  3 files changed, 482 insertions(+), 6 deletions(-)
> > >
> > >
> > > > > diff --git a/block/rbd.c b/block/rbd.c
> > > > > index f098a89c7b..183b17cd84 100644
> > > > > --- a/block/rbd.c
> > > > > +++ b/block/rbd.c
> > > > > @@ -73,6 +73,18 @@
> > > > >  #define LIBRBD_USE_IOVEC 0
> > > > >  #endif
> > > > >
> > > > > +#define RBD_ENCRYPTION_LUKS_HEADER_VERIFICATION_LEN 8
> > > > > +
> > > > > +static const char rbd_luks_header_verification[
> > > > > +        RBD_ENCRYPTION_LUKS_HEADER_VERIFICATION_LEN] =3D {
> > > > > +    'L', 'U', 'K', 'S', 0xBA, 0xBE, 0, 1
> > > > > +};
> > > > > +
> > > > > +static const char rbd_luks2_header_verification[
> > > > > +        RBD_ENCRYPTION_LUKS_HEADER_VERIFICATION_LEN] =3D {
> > > > > +    'L', 'U', 'K', 'S', 0xBA, 0xBE, 0, 2
> > > > > +};
> > > > > +
> > > > >  typedef enum {
> > > > >      RBD_AIO_READ,
> > > > >      RBD_AIO_WRITE,
> > > > > @@ -341,6 +353,206 @@ static void qemu_rbd_memset(RADOSCB *rcb, i=
nt64_t offs)
> > > > >      }
> > > > >  }
> > > > >
> > > > > +#ifdef LIBRBD_SUPPORTS_ENCRYPTION
> > > > > +static int qemu_rbd_convert_luks_options(
> > > > > +        RbdEncryptionOptionsLUKSBase *luks_opts,
> > > > > +        char **passphrase,
> > > > > +        Error **errp)
> > > > > +{
> > > > > +    int r =3D 0;
> > > > > +
> > > > > +    if (!luks_opts->has_key_secret) {
> > > > > +        r =3D -EINVAL;
> > > > > +        error_setg_errno(errp, -r, "missing encrypt.key-secret")=
;
> > > > > +        return r;
> > > > > +    }
> > > >
> > > > Why is key-secret optional?
> > >
> > > It doesn't look like it is handled correctly here, but we need to
> > > be able to run 'qemu-img info <volume>' and get information back
> > > on the size of the image, and whether or not it is encrypted,
> > > without having to supply a passphrase upfront. So it is right that
> > > key-secret be optional, but also we shouldn't return an fatal
> > > error like this.
> >
> > Hi Daniel,
> >
> > The key-secret lives inside RbdEncryptionOptions (or
> > RbdEncryptionCreateOptions) which are already optional:
> >
> >     '*encrypt': 'RbdEncryptionOptions'
> >
> >     '*encrypt' :        'RbdEncryptionCreateOptions'
> >
> > The image is opened as usual and then, if "encrypt" is specified,
> > the encryption profile is loaded (or created and laid down).  It does
> > not make sense to attempt to load or create the encryption profile
> > without the passphrase -- it would always fail.
>
> Ah, that sounds like it is probably ok then.
>
>
> > > Only if BDRV_O_NO_IO is NOT set, should this error be reported
> > >
> > >
> > >
> > >
> > > > >  static int64_t qemu_rbd_getlength(BlockDriverState *bs)
> > > > >  {
> > > > >      BDRVRBDState *s =3D bs->opaque;
> > > > > @@ -1243,6 +1589,22 @@ static QemuOptsList qemu_rbd_create_opts =
=3D {
> > > > >              .type =3D QEMU_OPT_STRING,
> > > > >              .help =3D "ID of secret providing the password",
> > > > >          },
> > > > > +        {
> > > > > +            .name =3D "encrypt.format",
> > > > > +            .type =3D QEMU_OPT_STRING,
> > > > > +            .help =3D "Encrypt the image, format choices: 'luks'=
, 'luks2'",
> > > >
> > > > I think it should be "luks1" and "luks2" to match rbd/librbd.h and
> > > > "rbd encryption format" command.
> > >
> > > No, it should stay "luks" not "luks1", to match the existing QEMU
> > > terminology for its LUKS v1 encryption support.
> >
> > If you insist on following the QEMU nomenclature here it's fine with
> > me but I want to point out that encryption-formatted clones won't be
> > interoperable with QEMU LUKS driver or dm-crypt so making the names
> > match QEMU instead of librbd and rbd CLI seems a bit misleading.
>
> In what way is it not interoperable ?
>
> If we don't specify any 'encrypt' option, does the guest see the
> raw LUKS header + payload, or is the header completely hidden
> and only ever accessible RBD ?

I think it would see the LUKS header but wouldn't be able to open the
LUKS container or do anything else that requires the passphrase.

>
>
> > > > > +##
> > > > > +# @RbdEncryptionCreateOptionsLUKSBase:
> > > > > +#
> > > > > +# @cipher-alg: The encryption algorithm
> > > > > +#
> > > > > +# Since: 6.1
> > > > > +##
> > > > > +{ 'struct': 'RbdEncryptionCreateOptionsLUKSBase',
> > > > > +  'base': 'RbdEncryptionOptionsLUKSBase',
> > > > > +  'data': { '*cipher-alg': 'QCryptoCipherAlgorithm'}}
> > > >
> > > > Why QCryptoCipherAlgorithm instead of just enumerating the two
> > > > algorithms that librbd supports?  An early failure when parsing
> > > > seems better than failing in qemu_rbd_convert_luks_create_options()
> > > > and having to clean up the newly created image.
> > >
> > > We don't want to duplicate algorithm names that already have
> > > a defined enum data type.
> >
> > Did you see my other comment on this?  Quoting it just in case:
> >
> >     > ... QCryptoCipherAlgorithm is a set of 12 algorithms of
> >     > which librbd supports only two.  On top of that, e.g. "aes-256" f=
or
> >     > librbd really means "aes-256" + "xts" + "plain64" -- it bundles
> >     > QCryptoCipherAlgorithm, QCryptoCipherMode and QCryptoIVGenAlgorit=
hm
> >     > with the latter two being hard-coded.
> >
> > This is not a big deal, but I just don't see how confusing everyone
> > who introspects the QAPI into thinking that all these algorithms are
> > supported (and forgoing an early parsing failure as a side effect) is
> > worth avoiding a trivial [ 'aes-128', 'aes-256' ] definition here.
>
> Even for the existing LUKS code in QEMU there is no guarantee that the
> impl supports all the ciphers listed in the enum. You can't rely on the
> introspection to that degree.

I see, that makes it clearer.

Thanks,

                Ilya

