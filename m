Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B63E35EC6B5
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 16:42:25 +0200 (CEST)
Received: from localhost ([::1]:32888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odBmy-0004s3-RL
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 10:42:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1odAGa-0008Tm-T4
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 09:04:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1odAGX-0002Yn-2n
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 09:04:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664283888;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R/nDiVQA20P7VZph7pRT+g/FUfk+b1+o+fvuh1NkUZU=;
 b=B9lzTyl2awA+36rcJX9M0mrLLjkcCLbQr6npZDJjfHmyFkwGoS/2wFwCn1vTcrWrcNz0wg
 D/XLixhqgs6Nk5ax0JS2IRYdIqcot6ZSL3gxnbS8mazOXJToEDKW8QzJstW4TGO1XjVEza
 gSYs3GhwkIG/blIow6ulSXq11m7LLTE=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-554-kirAf3AKMkGLVzVP4SCoIw-1; Tue, 27 Sep 2022 09:04:47 -0400
X-MC-Unique: kirAf3AKMkGLVzVP4SCoIw-1
Received: by mail-oa1-f71.google.com with SMTP id
 586e51a60fabf-12785ab6ab3so3581228fac.5
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 06:04:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=R/nDiVQA20P7VZph7pRT+g/FUfk+b1+o+fvuh1NkUZU=;
 b=369gqEETEeJqZdaVXC9/lrRifGNu3+HCdFHzHuff626w24r2gieFhgHetarkljSX7+
 47+YAB54c10k+hc1jG18RNJMmPMmvTxDNgUcdqPSGuNbZ6ZBOTc0FzNAV9lv6XJ6ZYqx
 YSwMeE1XJGtIPtH1dRlOG7NKnWqUAhhuaPL81e9Rgzr05B4e9++YiTrQkkwvi+ZZz1IN
 4AxJSRFUssFU8tzWvk5lbKK6SfQGPRzOgj5b6+RB8Z8OIr7DB/Hw2sdbiek06Ccn5e9E
 7OMqY/wHAUhW3f5tj/BozoQaTaJci8r6cAok9sRIPEccL5YbI9LSW7GQHN/KZcHZWVJO
 FchQ==
X-Gm-Message-State: ACrzQf3yS7XH+4I+Mwg7KyLvKnhbY+smJM6clsEXVSfz9zqSfI32s5fr
 74yhKlsJEJHJSNE62T717VXkbUMFlQqAGnoDM7zYE+3NzDcm056IKbgUWYkj3yUI2iC9ZBgrsFR
 sq8d+0oi5O2GqZdkQFOsv8P7Umr0N3pM=
X-Received: by 2002:a05:6870:c1d4:b0:127:ad2c:3d74 with SMTP id
 i20-20020a056870c1d400b00127ad2c3d74mr2179704oad.205.1664283885577; 
 Tue, 27 Sep 2022 06:04:45 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7/ShVe25SRmO5ykQrSsj7gAY8paC+y17VY0v2t55rBEdMDajlg1A638949DsgnyZ+SCcgLgUaxxvyfDUQaJzo=
X-Received: by 2002:a05:6870:c1d4:b0:127:ad2c:3d74 with SMTP id
 i20-20020a056870c1d400b00127ad2c3d74mr2179688oad.205.1664283885302; Tue, 27
 Sep 2022 06:04:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220927122146.2787854-1-stefanb@linux.ibm.com>
In-Reply-To: <20220927122146.2787854-1-stefanb@linux.ibm.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 27 Sep 2022 17:04:33 +0400
Message-ID: <CAMxuvayyxizLFdHgYtjJZ412wUD4hq57NXKxUSHuJMKVGr4EQA@mail.gmail.com>
Subject: Re: [PATCH] docs: Update TPM documentation for usage of a TPM 2
To: Stefan Berger <stefanb@linux.ibm.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, Sep 27, 2022 at 4:21 PM Stefan Berger <stefanb@linux.ibm.com> wrote=
:
>
> Update the TPM documentation for usage of a TPM 2 rather than a TPM 1.2.
> Adjust the command lines and expected outputs inside the VM accordingly.
> Update the command line to start a TPM 2 with swtpm.
>
> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  docs/specs/tpm.rst | 44 ++++++++++++++++++++++++--------------------
>  1 file changed, 24 insertions(+), 20 deletions(-)
>
> diff --git a/docs/specs/tpm.rst b/docs/specs/tpm.rst
> index 3be190343a..535912a92b 100644
> --- a/docs/specs/tpm.rst
> +++ b/docs/specs/tpm.rst
> @@ -250,24 +250,25 @@ hardware TPM ``/dev/tpm0``:
>
>  The following commands should result in similar output inside the VM
>  with a Linux kernel that either has the TPM TIS driver built-in or
> -available as a module:
> +available as a module (assuming a TPM 2 is passed through):
>
>  .. code-block:: console
>
>    # dmesg | grep -i tpm
> -  [    0.711310] tpm_tis 00:06: 1.2 TPM (device=3Did 0x1, rev-id 1)
> -
> -  # dmesg | grep TCPA
> -  [    0.000000] ACPI: TCPA 0x0000000003FFD191C 000032 (v02 BOCHS  \
> -      BXPCTCPA 0000001 BXPC 00000001)
> +  [    0.012560] ACPI: TPM2 0x000000000BFFD1900 00004C (v04 BOCHS  \
> +      BXPC     0000001 BXPC 00000001)
>
>    # ls -l /dev/tpm*
> -  crw-------. 1 root root 10, 224 Jul 11 10:11 /dev/tpm0
> +  crw-rw----. 1 tss root  10,   224 Sep  6 12:36 /dev/tpm0
> +  crw-rw----. 1 tss rss  253, 65536 Sep  6 12:36 /dev/tpmrm0
>
> -  # find /sys/devices/ | grep pcrs$ | xargs cat
> -  PCR-00: 35 4E 3B CE 23 9F 38 59 ...
> +  Starting with Linux 5.12 there are PCR entries for TPM 2 in sysfs:
> +  # find /sys/devices/ -type f | grep pcr-sha
> +  ...
> +  /sys/devices/LNXSYSTEM:00/LNXSYBUS:00/MSFT0101:00/tpm/tpm0/pcr-sha256/=
1
> +  ...
> +  /sys/devices/LNXSYSTEM:00/LNXSYBUS:00/MSFT0101:00/tpm/tpm0/pcr-sha256/=
9
>    ...
> -  PCR-23: 00 00 00 00 00 00 00 00 ...
>
>  The QEMU TPM emulator device
>  ----------------------------
> @@ -304,6 +305,7 @@ a socket interface. They do not need to be run as roo=
t.
>    mkdir /tmp/mytpm1
>    swtpm socket --tpmstate dir=3D/tmp/mytpm1 \
>      --ctrl type=3Dunixio,path=3D/tmp/mytpm1/swtpm-sock \
> +    --tpm2 \
>      --log level=3D20
>
>  Command line to start QEMU with the TPM emulator device communicating
> @@ -365,19 +367,20 @@ available as a module:
>  .. code-block:: console
>
>    # dmesg | grep -i tpm
> -  [    0.711310] tpm_tis 00:06: 1.2 TPM (device=3Did 0x1, rev-id 1)
> -
> -  # dmesg | grep TCPA
> -  [    0.000000] ACPI: TCPA 0x0000000003FFD191C 000032 (v02 BOCHS  \
> -      BXPCTCPA 0000001 BXPC 00000001)
> +  [    0.012560] ACPI: TPM2 0x000000000BFFD1900 00004C (v04 BOCHS  \
> +      BXPC     0000001 BXPC 00000001)
>
>    # ls -l /dev/tpm*
> -  crw-------. 1 root root 10, 224 Jul 11 10:11 /dev/tpm0
> +  crw-rw----. 1 tss root  10,   224 Sep  6 12:36 /dev/tpm0
> +  crw-rw----. 1 tss rss  253, 65536 Sep  6 12:36 /dev/tpmrm0
>
> -  # find /sys/devices/ | grep pcrs$ | xargs cat
> -  PCR-00: 35 4E 3B CE 23 9F 38 59 ...
> +  Starting with Linux 5.12 there are PCR entries for TPM 2 in sysfs:
> +  # find /sys/devices/ -type f | grep pcr-sha
> +  ...
> +  /sys/devices/LNXSYSTEM:00/LNXSYBUS:00/MSFT0101:00/tpm/tpm0/pcr-sha256/=
1
> +  ...
> +  /sys/devices/LNXSYSTEM:00/LNXSYBUS:00/MSFT0101:00/tpm/tpm0/pcr-sha256/=
9
>    ...
> -  PCR-23: 00 00 00 00 00 00 00 00 ...
>
>  Migration with the TPM emulator
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> @@ -398,7 +401,8 @@ In a 1st terminal start an instance of a swtpm using =
the following command:
>    mkdir /tmp/mytpm1
>    swtpm socket --tpmstate dir=3D/tmp/mytpm1 \
>      --ctrl type=3Dunixio,path=3D/tmp/mytpm1/swtpm-sock \
> -    --log level=3D20 --tpm2
> +    --tpm2 \
> +    --log level=3D20
>
>  In a 2nd terminal start the VM:
>
> --
> 2.37.2
>


