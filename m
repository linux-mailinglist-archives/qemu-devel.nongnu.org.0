Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E419758C9D5
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 15:55:57 +0200 (CEST)
Received: from localhost ([::1]:60370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL3Eb-0001kM-6u
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 09:55:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oL3Bk-0005Wd-4H
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 09:53:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oL3Bc-00039G-Fi
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 09:52:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659966771;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FqXR7eSctheUx+N6KV3b21mRaJX/5P+gQKTWvxU8aq0=;
 b=EAQ5a3FNADwN1USFagUO/xtQHSBFGWTIIxtWWwlHfyCqHZZpI2C/RV/zCIPQSoDpQYWtLZ
 2WHmBUk4MpasoGZ4DlBkdpKRtNzeOswIuS4pAWuS22vZYs645XhpjXN65i21YlfmUbgeeA
 GivesWDTKTlkTA2dlR5bUBkBOV3voLQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612-AAnq5JKVMOCpxdPyiMyf6A-1; Mon, 08 Aug 2022 09:52:48 -0400
X-MC-Unique: AAnq5JKVMOCpxdPyiMyf6A-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DDC97380670E;
 Mon,  8 Aug 2022 13:52:47 +0000 (UTC)
Received: from localhost (unknown [10.39.194.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 58FB3492C3B;
 Mon,  8 Aug 2022 13:52:47 +0000 (UTC)
Date: Sat, 6 Aug 2022 08:50:37 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, hare@suse.de,
 dmitry.fomichev@wdc.com, Kevin Wolf <kwolf@redhat.com>,
 damien.lemoal@opensource.wdc.com, Eric Blake <eblake@redhat.com>,
 Fam Zheng <fam@euphon.net>, Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v6 3/8] file-posix: introduce get_sysfs_str_val for
 device zoned model
Message-ID: <Yu5jnXJG3PBWcrYg@fedora>
References: <20220805075751.77499-1-faithilikerun@gmail.com>
 <20220805075751.77499-4-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="m/coXIUlsirrHAWX"
Content-Disposition: inline
In-Reply-To: <20220805075751.77499-4-faithilikerun@gmail.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--m/coXIUlsirrHAWX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 05, 2022 at 03:57:46PM +0800, Sam Li wrote:
> Use sysfs attribute files to get the string value of device
> zoned model. Then get_sysfs_zoned_model can convert it to
> BlockZoneModel type in QEMU.
>=20
> Signed-off-by: Sam Li <faithilikerun@gmail.com>
> Reviewed-by: Hannes Reinecke <hare@suse.de>
> ---
>  block/file-posix.c               | 70 ++++++++++++++++++++++++++++++++
>  include/block/block_int-common.h |  3 ++
>  2 files changed, 73 insertions(+)
>=20
> diff --git a/block/file-posix.c b/block/file-posix.c
> index a40eab64a2..4785203eea 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -1264,6 +1264,68 @@ out:
>  #endif
>  }
> =20
> +/*
> + * Convert the zoned attribute file in sysfs to internal value.
> + */
> +static int get_sysfs_str_val(int fd, struct stat *st,
> +                              const char *attribute,
> +                              char **val) {

The fd argument is unused and can be dropped.

> +#ifdef CONFIG_LINUX
> +    char *buf =3D NULL;
> +    g_autofree char *sysfspath =3D NULL;
> +    int ret;
> +    size_t len;
> +
> +    if (!S_ISBLK(st->st_mode)) {
> +        return -ENOTSUP;
> +    }
> +
> +    sysfspath =3D g_strdup_printf("/sys/dev/block/%u:%u/queue/%s",
> +                                major(st->st_rdev), minor(st->st_rdev),
> +                                attribute);
> +    ret =3D g_file_get_contents(sysfspath, &buf, &len, NULL);
> +    if (ret =3D=3D -1) {
> +        ret =3D -errno;

g_file_get_contents() does not set errno. You can either pass in a
GError and report the message string by converting it into a QEMU Error
object (grep for g_file_get_contents() to see example), or you can
return a fixed error code like -ENOENT.

> +        return ret;
> +    }
> +
> +    /* The file is ended with '\n' */
> +    if (buf[len - 1] =3D=3D '\n') {
> +        buf[len - 1] =3D '\0';
> +    }
> +
> +    if (!strncpy(*val, buf, len)) {
> +        ret =3D -errno;
> +        return ret;
> +    }
> +    g_free(buf);

buf is not necessary. val can be passed directly to g_file_get_contents().

> +    return 0;
> +#else
> +    return -ENOTSUP;
> +#endif
> +}

Now get_sysfs_long_val() can be written using get_sysfs_str_val():

  static long get_sysfs_long_val(struct stat *st, const char *attribute)
  {
      g_autofree char *str =3D NULL;
      const char *end;
      long val;
      int ret;

      ret =3D get_sysfs_str_val(st, attribute, &str);
      if (ret < 0) {
          return ret;
      }

      ret =3D qemu_strtol(str, &end, 10, &val);
      if (ret =3D=3D 0 && end && *end =3D=3D '\0') {
          ret =3D val;
      }
      return ret;
  }

The get_sysfs_long_val() patch can be moved after the
get_sysfs_str_val() patch.

> +
> +static int get_sysfs_zoned_model(int fd, struct stat *st,
> +                                 BlockZoneModel *zoned) {
> +    g_autofree char *val =3D NULL;
> +    val =3D g_malloc(32);
> +    get_sysfs_str_val(fd, st, "zoned", &val);

Once get_sysfs_str_val() passes val through to g_get_file_contents() the
caller will no longer have to g_malloc() val themselves.

--m/coXIUlsirrHAWX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmLuY50ACgkQnKSrs4Gr
c8jHzgf/fZ8RKoQrSkTRwLPb1GTfXa+IAzT8mNbeNWvPYO6avdM5MhCpZ49kFoAH
Ehe2Io/1XAKDEHwIDzDHEELdb2ZDE2uWy6RTNbfvi+kUXUZ1LP8xUybFP4/AHp78
ppSFI/8tgWvXdLYnVeHHmjdcZT4hXO8ceeGbcSAC4raGZZ+b9iO9pw5GVqcEnIEI
+f7goqG+zzuDpVjk5sMyDNmCj3wNXKHg9bEQkHIAcG/88SQ6E0dyBL9dIKhNbeDg
SaI3BXNF4lyCBUwoNHQSVPl7PS0DWeQKD41jlWstbIMUUjyY8xaLXnWQ2QfG02/y
wCJzmmHYmGXSy52INDKDqWUC8zqwmA==
=pDAs
-----END PGP SIGNATURE-----

--m/coXIUlsirrHAWX--


