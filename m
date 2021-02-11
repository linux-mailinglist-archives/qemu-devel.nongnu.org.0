Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B383F318825
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 11:29:32 +0100 (CET)
Received: from localhost ([::1]:44038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA9E3-0001TY-PA
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 05:29:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lA90t-0004qa-Sq
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 05:16:01 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:38754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lA90j-0007Iz-Kp
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 05:15:55 -0500
Received: by mail-ej1-x634.google.com with SMTP id bl23so9199362ejb.5
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 02:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=W/NrdEkrajUT+xUYtZsSnwBrWIo47zHkgOLLW6QjTHI=;
 b=IaJ/lmCDGBOFeJonbAeePLlmv4W2IRvCcrkIBl/ZU3xtC+Q0jdENteYsTTApyw/sDx
 1+zv9eKUy11el8v/BxSF6HlkkZFD/hD0I488JQmeE6Rk04AEGv9ECqTjyARqaXqtcJwT
 xzJGytHdN13vQnTOwJsACWKifxED/2S8RCPFEnJayDuZ9XiUIKPAcKQ+aX4YP6N2+Eya
 kvv5t/g83Z9WnRzyPRFY3Broqut1iVKVsxs4Tiv3Cs2xyOCJFHyblddFSm3i8W4lyxt+
 JjOsQ61f626qx5SEfw637xlLqre9jEa+s+YC4sKcaN3I0F8wPgo4KrrbjiWZNCIxJF5j
 xg2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=W/NrdEkrajUT+xUYtZsSnwBrWIo47zHkgOLLW6QjTHI=;
 b=VjL23yBFxu9MxsHUnRBIEtAlPHZR66S3I5ZOct+gW6W00q+0kfrcE3FVpR/Am/px4w
 qSP9nfQYez8pioJ6UvJW8tSuMArbFOVl1aSrvj8PNZcqJYSsVj60xXuAI8P0LbqULyLh
 EQOIDUqjCseTT8Lm+NciwqE2I31jPihNUlREL5xMR2IgtPRqfCBqeQV6txAS3txVZFzX
 zEwHrMATwY9ae+/OOHLMYweTw48MHTGi7/MgVS5HFXldZTs4CxMC+noolubZic0SZOFF
 DmmSILnryvh3ITMP1p6G3GqGTd/DHixZQACmqtIZXZF0YRySlde8W1v9JyU7ADXRwVRo
 KqRw==
X-Gm-Message-State: AOAM532XQR2BhC3WZQx+gSuyk7fghc+yjl1Axx5lDvVDTftpQSZiYGVe
 HIKjNWj7/OiUg+JFIovKDfADEa8HHADhEAtjAHs=
X-Google-Smtp-Source: ABdhPJwc2PMj2bTpjafd0R5DqWeLDaNwVOtE4GpM4sH2O2G8bkTrD7QiH0IhgRHZoyz01XHbLjday6rh6zkFRUkd8+s=
X-Received: by 2002:a17:906:3885:: with SMTP id
 q5mr7801935ejd.105.1613038544211; 
 Thu, 11 Feb 2021 02:15:44 -0800 (PST)
MIME-Version: 1.0
References: <20210203172357.1422425-1-crosa@redhat.com>
 <20210203172357.1422425-19-crosa@redhat.com>
In-Reply-To: <20210203172357.1422425-19-crosa@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 11 Feb 2021 14:15:32 +0400
Message-ID: <CAJ+F1C+sB1+K47C-m74AX4OR0U-MgO-XXyOz4V3W2=TwE2VUQg@mail.gmail.com>
Subject: Re: [PATCH 18/22] Acceptance Tests: set up existing ssh keys by
 default
To: Cleber Rosa <crosa@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Beraldo Leal <bleal@redhat.com>, John Snow <jsnow@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Eric Auger <eauger@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Max Reitz <mreitz@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Wed, Feb 3, 2021 at 10:07 PM Cleber Rosa <crosa@redhat.com> wrote:
>
> It's questionable wether it's necessary to create one brand new pair

whether

> for each test.  It's not questionable that it takes less time and
> resources to just use the keys available at "tests/keys" that exist
> for that exact reason.
>
> If a location for the public key is not given explicitly, the
> LinuxTest will now set up the existing pair of keys as the default.
> This removes the need for a lot of boiler plate code.

boilerplate

>
> To avoid the ssh client from erroring on permission issues, a
> directory with restricive permissions is created for the private key.

restrictive

> This should still be a lot cheaper than creating a new key.
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> ---
>  tests/acceptance/avocado_qemu/__init__.py | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance=
/avocado_qemu/__init__.py
> index 8156224625..5f4dd6b9ec 100644
> --- a/tests/acceptance/avocado_qemu/__init__.py
> +++ b/tests/acceptance/avocado_qemu/__init__.py
> @@ -11,6 +11,7 @@
>  import logging
>  import os
>  import re
> +import shutil
>  import sys
>  import uuid
>  import tempfile
> @@ -301,8 +302,21 @@ class LinuxTest(Test, LinuxSSHMixIn):
>          self.vm.add_args('-smp', '2')
>          self.vm.add_args('-m', '1024')
>          self.set_up_boot()
> +        if ssh_pubkey is None:
> +            ssh_pubkey, self.ssh_key =3D self.set_up_existing_ssh_keys()
>          self.set_up_cloudinit(ssh_pubkey)
>
> +    def set_up_existing_ssh_keys(self):
> +        ssh_public_key =3D os.path.join(SOURCE_DIR, 'tests', 'keys', 'id=
_rsa.pub')
> +        source_private_key =3D os.path.join(SOURCE_DIR, 'tests', 'keys',=
 'id_rsa')
> +        ssh_dir =3D os.path.join(self.workdir, '.ssh')
> +        os.mkdir(ssh_dir, mode=3D0o700)
> +        ssh_private_key =3D os.path.join(ssh_dir,
> +                                       os.path.basename(source_private_k=
ey))
> +        shutil.copyfile(source_private_key, ssh_private_key)
> +        os.chmod(ssh_private_key, 0o600)
> +        return (ssh_public_key, ssh_private_key)
> +
>      def download_boot(self):
>          self.log.debug('Looking for and selecting a qemu-img binary to b=
e '
>                         'used to create the bootable snapshot image')
> --
> 2.25.4
>
>


--=20
Marc-Andr=C3=A9 Lureau

