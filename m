Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 774F06675F1
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 15:27:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFyXx-0007ul-MP; Thu, 12 Jan 2023 09:27:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1pFyXv-0007u5-Uf; Thu, 12 Jan 2023 09:27:11 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1pFyXu-0001js-B5; Thu, 12 Jan 2023 09:27:11 -0500
Received: by mail-ed1-x52c.google.com with SMTP id s5so27024600edc.12;
 Thu, 12 Jan 2023 06:27:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1OC/Fd/GCY90FbRJPMUAtUPNz1PyDA5uGo4tD4C0yjc=;
 b=a5DXKE6nkbAF7uk2ZjLqgJB/zCN3QosXWKtB2VacLyMRWC6iwl8S3EjzSv9jNCcxG4
 4XQ5cHCCtLAr0/Pa1bpkIuBvvbVGdTPKden8oecoOeRz5qwXLeJoI9r5Aymp/GY47vw3
 LRNoQ7aeFttJaIVfvTUr9PyexrxfJYYX2OAbw3AuHM42l9iI8H/zNwiqighqPgIaG4Hd
 /d+bvfUg7t0OaM7aGBc36GHG2vuzmLGD4s2l29M9iU8DbT/UA1QbYYJ1dN8p3/OEpUWd
 gNJcffklUO+jgTpHZthtlXE2cMWoo1C06kpgs4pz/LP8g8CwBYByae63ITx+MvcWRPW/
 wfEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1OC/Fd/GCY90FbRJPMUAtUPNz1PyDA5uGo4tD4C0yjc=;
 b=qyqV8z2yCULwk+Jx9vvra2BnjkB4qmf1x34seDcwFDnjGQLm2E+wjfgAACaEHH7SWg
 So5J+25YKROUERZZOqXkusazPhQttekZCsHvmvJgbJbHiKilr/bDgBZF9Nfu8/ImevoJ
 4aUIdsJCNR5RwSybT2DfyDTDTgpbgW1XJwfnSi5QKhx4XVpokxRCfp7CyBzz4vRBAj8m
 syZiISBsF02mw5RkilpVwwF6w+N1F5pCbbnxrxmT/uKABz4ukN5s5cFWGyGLZQRF97AO
 WCG74swF2xWdX5xsJsPPBtwDTMZDuW+bBQ+xcDSr55U0FoqSP+zPUap1L1lrW8THQvMK
 ZgOQ==
X-Gm-Message-State: AFqh2krVIm3sDNYxsAyolm+FrTK4xz3SFst1hUcOn+xYAWVdCcz+ADmv
 43fG9pD5gqmp9kGgsmrrF3L74e8zVAqkqrgToU8=
X-Google-Smtp-Source: AMrXdXsm8XbD27JAkBEgMlcIfvqV9xXmh+vvKLUPqIXL4449Q1Jlh/rUXXcmsGIQKdX+AJ57weM5ILRUVrT1ws3CxRA=
X-Received: by 2002:aa7:cf87:0:b0:498:dfe5:49aa with SMTP id
 z7-20020aa7cf87000000b00498dfe549aamr1436224edx.398.1673533628366; Thu, 12
 Jan 2023 06:27:08 -0800 (PST)
MIME-Version: 1.0
References: <20221120102836.3174090-1-oro@il.ibm.com>
 <20221120102836.3174090-2-oro@il.ibm.com>
 <Y7/+d3Zr9ncvCZuV@redhat.com>
In-Reply-To: <Y7/+d3Zr9ncvCZuV@redhat.com>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Thu, 12 Jan 2023 15:26:56 +0100
Message-ID: <CAOi1vP8viVkV=asKs0RVq6bxc-9-sxCxF0aNjxFecEnLxuw=yg@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] block/rbd: encryption nit fixes
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Or Ozeri <oro@il.ibm.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org, 
 dannyh@il.ibm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=idryomov@gmail.com; helo=mail-ed1-x52c.google.com
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

On Thu, Jan 12, 2023 at 1:35 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> On Sun, Nov 20, 2022 at 04:28:34AM -0600, Or Ozeri wrote:
> > Add const modifier to passphrases,
> > and remove redundant stack variable passphrase_len.
> >
> > Signed-off-by: Or Ozeri <oro@il.ibm.com>
> > ---
> >  block/rbd.c | 24 ++++++++++--------------
> >  1 file changed, 10 insertions(+), 14 deletions(-)
> >
> > diff --git a/block/rbd.c b/block/rbd.c
> > index f826410f40..e575105e6d 100644
> > --- a/block/rbd.c
> > +++ b/block/rbd.c
> > @@ -330,7 +330,7 @@ static int qemu_rbd_set_keypairs(rados_t cluster, c=
onst char *keypairs_json,
> >  #ifdef LIBRBD_SUPPORTS_ENCRYPTION
> >  static int qemu_rbd_convert_luks_options(
> >          RbdEncryptionOptionsLUKSBase *luks_opts,
> > -        char **passphrase,
> > +        const char **passphrase,
> >          size_t *passphrase_len,
> >          Error **errp)
> >  {
> > @@ -341,7 +341,7 @@ static int qemu_rbd_convert_luks_options(
> >  static int qemu_rbd_convert_luks_create_options(
> >          RbdEncryptionCreateOptionsLUKSBase *luks_opts,
> >          rbd_encryption_algorithm_t *alg,
> > -        char **passphrase,
> > +        const char **passphrase,
> >          size_t *passphrase_len,
> >          Error **errp)
> >  {
> > @@ -384,8 +384,7 @@ static int qemu_rbd_encryption_format(rbd_image_t i=
mage,
> >                                        Error **errp)
> >  {
> >      int r =3D 0;
> > -    g_autofree char *passphrase =3D NULL;
> > -    size_t passphrase_len;
> > +    g_autofree const char *passphrase =3D NULL;
>
> This looks wierd.  If it is as const string, why are
> we free'ing it ?  Either want g_autofree, or const,
> but not both.

Just curious, is it a requirement imposed by g_autofree?  Otherwise
pointer constness and pointee lifetime are completely orthogonal and
freeing (or, in this case, wanting to auto-free) an object referred to
by a const pointer seems perfectly fine to me.

Thanks,

                Ilya

