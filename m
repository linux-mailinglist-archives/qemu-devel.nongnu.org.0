Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5444F6381
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 17:37:49 +0200 (CEST)
Received: from localhost ([::1]:54182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nc7jA-0007oa-Pj
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 11:37:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nc7g9-0004qR-QG
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 11:34:41 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:34515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nc7g8-0002HE-2r
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 11:34:41 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 p26-20020a05600c1d9a00b0038ccbff1951so2972638wms.1
 for <qemu-devel@nongnu.org>; Wed, 06 Apr 2022 08:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=JbzERS2liECfc8QLpKsSYmRGQq/cS1dOCgRupNktEqM=;
 b=L8sB++DgM3Wn0Z9CnwF9V93xC4zeQJ1yhqFsC80iRz09WdEmlUZGVseq4V/HMqMiTr
 xYcU94gEPNpDO69kBPBk/ktWcI4kkR3zmB8HhN/EG54lavP8WlDNPQEWyKtX07kliafc
 fdt1dQlwNDVTBjDfIg6ZjMWpnDMXvW0Ghdt24p1THcuoDCG5Zj0GycTR2qylafMq6FZh
 S5xyG2OR7D3MlWvJms+1/Aqf/SSrnHEys0wDDZHO5S3UFwDV/rbmb1frUIl39QLzvhnl
 Mg+wm1mUVpwQxGRqSAkekY6itl8NFTSrsoscPrWPue6fhWr0jVuTEgI30l0ACbRIHk2k
 KDew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JbzERS2liECfc8QLpKsSYmRGQq/cS1dOCgRupNktEqM=;
 b=aaFgKbVoch+7mPozyVo68gnPkyY0UpWoF1+Eb7OhonjbSjk0ccAsi28qBImq+0Q0zL
 HjMqC68t3Ew3DtqoFBTdosSofFVGLFv3If4Bkt17wPnlQlcAXV5uyRZZl+PlqPYxXnt9
 xlIpKJORgZXXaiPL/dcYYlnoE2617cL9/sg9U61jjH80nKN9CQV6JBS6YicaEO8JuOC5
 h3N7OZCZjyzKkAqtH3dv21wrRY6JI0Z+LBjK42e8SVqeMeFEKN4TNFiYlM6WexCXrSUQ
 FNRibg1gi2jrg/TbpAXm2gme9IwpuYEAw0VmK2xNapurIWvwqJNUMkj4fqJAyIXYSKcp
 s1WA==
X-Gm-Message-State: AOAM533x+T3J+dDf0yDbGGEzGSh8uY8HEP7aHJF6SGZGjcoaW7WvE1PZ
 PdGni2pUVAjHxLnplQQGlmAusYj1h/Q=
X-Google-Smtp-Source: ABdhPJyd57k51SwSU9lu7xqPwlCMd9UQKWqfOBWNVol6KaMmggn4eDxqvzX3TIxHWhPKmaycd67K+A==
X-Received: by 2002:a05:600c:d8:b0:38e:785a:2fc7 with SMTP id
 u24-20020a05600c00d800b0038e785a2fc7mr8105301wmm.59.1649259278439; 
 Wed, 06 Apr 2022 08:34:38 -0700 (PDT)
Received: from localhost (109.9.90.146.dyn.plus.net. [146.90.9.109])
 by smtp.gmail.com with ESMTPSA id
 p8-20020a5d59a8000000b00204178688d3sm17127194wrr.100.2022.04.06.08.34.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 08:34:37 -0700 (PDT)
Date: Wed, 6 Apr 2022 16:34:36 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Guo Zhi <qtxuning1999@sjtu.edu.cn>
Subject: Re: [PATCH v1] configure: judge build dir permission
Message-ID: <Yk2zDBemx2i5yfT8@stefanha-x1.localdomain>
References: <20220405134819.3644952-1-qtxuning1999@sjtu.edu.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="QAjzjwl5I3pRRS1Z"
Content-Disposition: inline
In-Reply-To: <20220405134819.3644952-1-qtxuning1999@sjtu.edu.cn>
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=stefanha@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--QAjzjwl5I3pRRS1Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 05, 2022 at 09:48:20PM +0800, Guo Zhi wrote:
> If this patch is applied, issue:
>=20
> https://gitlab.com/qemu-project/qemu/-/issues/321
>=20
> can be closed.
>=20
> Signed-off-by: Guo Zhi <qtxuning1999@sjtu.edu.cn>
> ---
>  configure | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/configure b/configure
> index 7c08c18358..9cfa78efd2 100755
> --- a/configure
> +++ b/configure
> @@ -24,7 +24,13 @@ then
>      then
>          if test -f $MARKER
>          then
> -           rm -rf build
> +            if test -w $MARKER
> +            then
> +                rm -rf build
> +            else
> +                echo "ERROR: ./build dir already exists and can not be r=
emoved due to permission"
> +                exit 1
> +            fi

Other cases where "rm -rf build" fails are ignored. The script will keep
running and produce confusing output.

Maybe the script should check if rm(1) failed so that all possible cases
where the build directory is broken produce reasonable error messages?

Then there is also no need to check $MARKER explicitly.

Stefan

--QAjzjwl5I3pRRS1Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJNswwACgkQnKSrs4Gr
c8jIoQf/bB2S1jeJngcAjmBAYJh6nzl/kEVUxUQw+ssPlVtQhtKdG6tHm4tWMcq/
Rf9xoYmLnx2v6B7ibUQ7BjN/TutrAW9zX8nuuHCLhwzSa9e+O9NdT+lnXZ4sNaa7
MOBK57vOLHWdkkKb3n3ZRaNPQPiQ7/gei7EPIOQnv15U+6ydhjjKKdzZLoj8o9GV
NjW2Z9euMLKLv9sOzReoqkstBYRqwhj4iuF2LetwCF2hvKPmtkgf2/8EuNlrqOVc
Dk3qjMfPYUtiCd4Z78c3bF2KLTE8zqfqv+96jfD6sj+97z2tmIgvzmrbfclm4uzG
ROMTHJz2nKAntH64NfO+XY36uwY6YQ==
=98Yy
-----END PGP SIGNATURE-----

--QAjzjwl5I3pRRS1Z--

