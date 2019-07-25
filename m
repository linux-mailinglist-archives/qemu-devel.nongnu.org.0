Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE92A74C8A
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jul 2019 13:09:26 +0200 (CEST)
Received: from localhost ([::1]:58682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hqbck-0002Uz-5z
	for lists+qemu-devel@lfdr.de; Thu, 25 Jul 2019 07:09:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44873)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <marcandre.lureau@gmail.com>) id 1hqbcY-0001yb-14
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 07:09:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@gmail.com>) id 1hqbcW-0003zm-QY
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 07:09:13 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:53987)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
 id 1hqbcV-0003xJ-JG
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 07:09:11 -0400
Received: by mail-wm1-x344.google.com with SMTP id x15so44600684wmj.3
 for <qemu-devel@nongnu.org>; Thu, 25 Jul 2019 04:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=nURVAk7tRwzExEWzf9nIIAmGUOzTRwK7HUy4OebGY3o=;
 b=ATPi11RXvjE8wKK8K8416U85jsVWcAXlxwxOleSJt1A1j0EL3Q/6R0poo1wfmMRrvJ
 pIrF3c4gUVruJ9RfX7JSWv+thdccKK+D3rPZZpKmiAhUtq3jcgSyHVoUTNogp3cjou/j
 dZ1rI4HPXUv75z1pUu7xg+m5L54O2aNGIoa/YrU+tZaBXr7fAJMENPfvV6+tDy7R36n5
 0xEsEQxFeDe3MAp0kVnVEr/97XidbN7l0TFcg2hPxATSePML583fQSSQ1NRM7HD/3u1V
 +eBanMGG2FW0kqy0ygezelfz/0moarKiqi+jmMQkvMwlNgUcRsESDdanpvWNGyFP70Rk
 TRpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nURVAk7tRwzExEWzf9nIIAmGUOzTRwK7HUy4OebGY3o=;
 b=Tu2hO11gNfefSWxPFZQ/t/P9oSejProb2P+t7XSjBVwxpXMmiG3I/SzSpT8FpLk/VD
 78vj12uFDruZaOvw+uEiwWB7/zB6XzvpHKoj6l43R512h6X8QnflY7NYFT3pQIoLhK2i
 BvV2dZU1BOiKYH7xJVXbw89wSsOFQML6qchj5RlGrpS9D9SeR3q4XhNoVzRa6qgQ4O1+
 wm2lEHBQGpfOsLMeCRTYEtZlS4NTVyVvsEQDZ17chUz1MdbO4sJXNy+xlV/kB7RDGER2
 /8HkVbtsNiBBbsJP8507MzbMpy2gzVYWjXV4Pe6Df9lsKVcN3Gy2wlPeduQjP89TIjTQ
 xxNQ==
X-Gm-Message-State: APjAAAXSq90dL9ZTfud2SUiAm7EDnGnXlnXvdCH1UQq2/6GzAEMHDm5c
 qDnVqkFhcvll+rLcjEer6CxE3rh7kKPNbqVaT+8=
X-Google-Smtp-Source: APXvYqw5UwSUPvee4mLHujcSU6xBcbffz3A+Qavo/+CDLnHVSUbe2Qv8xrSOyxmylATDiRpwcCnkPhDtC1LAfXL8sHE=
X-Received: by 2002:a05:600c:206:: with SMTP id
 6mr53986790wmi.91.1564052949231; 
 Thu, 25 Jul 2019 04:09:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190725105842.872625-1-stefanb@linux.vnet.ibm.com>
 <20190725105842.872625-3-stefanb@linux.vnet.ibm.com>
In-Reply-To: <20190725105842.872625-3-stefanb@linux.vnet.ibm.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 25 Jul 2019 15:08:57 +0400
Message-ID: <CAJ+F1CKdMR_ab=cz9RKsTUZQ5ioQp0=fSiqTOZcuVDiyZMZgWw@mail.gmail.com>
To: Stefan Berger <stefanb@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::344
Subject: Re: [Qemu-devel] [PATCH 2/2] tpm_emulator: Translate TPM error
 codes to strings
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
Cc: QEMU <qemu-devel@nongnu.org>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Thu, Jul 25, 2019 at 2:58 PM Stefan Berger
<stefanb@linux.vnet.ibm.com> wrote:
>
> Implement a function to translate TPM error codes to strings so that
> at least the most common error codes can be translated to human
> readable strings.
>
> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> ---
>  hw/tpm/tpm_emulator.c | 50 ++++++++++++++++++++++++++++++++++---------
>  1 file changed, 40 insertions(+), 10 deletions(-)
>
> diff --git a/hw/tpm/tpm_emulator.c b/hw/tpm/tpm_emulator.c
> index 1288cbcb8d..186dde0838 100644
> --- a/hw/tpm/tpm_emulator.c
> +++ b/hw/tpm/tpm_emulator.c
> @@ -82,6 +82,30 @@ typedef struct TPMEmulator {
>      TPMBlobBuffers state_blobs;
>  } TPMEmulator;
>
> +struct tpm_error {
> +    uint32_t tpm_result;
> +    const char *string;
> +};
> +
> +static const struct tpm_error tpm_errors[] =3D {
> +    {  9 , "operation failed" },
> +    {  32, "encryption error" },
> +    {  33, "decryption error" },
> +    /* TPM 2 codes */
> +    { 0x101, "operation failed" },
> +};

Wouldn't those codes be better defined in tpm_ioctl.h?

> +
> +static const char *tpm_emulator_strerror(uint32_t tpm_result)
> +{
> +    size_t i;
> +
> +    for (i =3D 0; i < ARRAY_SIZE(tpm_errors); i++) {
> +        if (tpm_errors[i].tpm_result =3D=3D tpm_result) {
> +            return tpm_errors[i].string;
> +        }
> +    }
> +    return "";
> +}
>
>  static int tpm_emulator_ctrlcmd(TPMEmulator *tpm, unsigned long cmd, voi=
d *msg,
>                                  size_t msg_len_in, size_t msg_len_out)
> @@ -264,7 +288,8 @@ static int tpm_emulator_stop_tpm(TPMBackend *tb)
>
>      res =3D be32_to_cpu(res);
>      if (res) {
> -        error_report("tpm-emulator: TPM result for CMD_STOP: 0x%x", res)=
;
> +        error_report("tpm-emulator: TPM result for CMD_STOP: 0x%x %s", r=
es,
> +                     tpm_emulator_strerror(res));
>          return -1;
>      }
>
> @@ -293,8 +318,9 @@ static int tpm_emulator_set_buffer_size(TPMBackend *t=
b,
>
>      psbs.u.resp.tpm_result =3D be32_to_cpu(psbs.u.resp.tpm_result);
>      if (psbs.u.resp.tpm_result !=3D 0) {
> -        error_report("tpm-emulator: TPM result for set buffer size : 0x%=
x",
> -                     psbs.u.resp.tpm_result);
> +        error_report("tpm-emulator: TPM result for set buffer size : 0x%=
x %s",
> +                     psbs.u.resp.tpm_result,
> +                     tpm_emulator_strerror(psbs.u.resp.tpm_result));
>          return -1;
>      }
>
> @@ -339,7 +365,8 @@ static int tpm_emulator_startup_tpm_resume(TPMBackend=
 *tb, size_t buffersize,
>
>      res =3D be32_to_cpu(init.u.resp.tpm_result);
>      if (res) {
> -        error_report("tpm-emulator: TPM result for CMD_INIT: 0x%x", res)=
;
> +        error_report("tpm-emulator: TPM result for CMD_INIT: 0x%x %s", r=
es,
> +                     tpm_emulator_strerror(res));
>          goto err_exit;
>      }
>      return 0;
> @@ -399,8 +426,9 @@ static int tpm_emulator_reset_tpm_established_flag(TP=
MBackend *tb,
>
>      res =3D be32_to_cpu(reset_est.u.resp.tpm_result);
>      if (res) {
> -        error_report("tpm-emulator: TPM result for rest establixhed flag=
: 0x%x",
> -                     res);
> +        error_report(
> +            "tpm-emulator: TPM result for rest establixhed flag: 0x%x %s=
",
> +            res, tpm_emulator_strerror(res));
>          return -1;
>      }
>
> @@ -638,7 +666,8 @@ static int tpm_emulator_get_state_blob(TPMEmulator *t=
pm_emu,
>      res =3D be32_to_cpu(pgs.u.resp.tpm_result);
>      if (res !=3D 0 && (res & 0x800) =3D=3D 0) {
>          error_report("tpm-emulator: Getting the stateblob (type %d) fail=
ed "
> -                     "with a TPM error 0x%x", type, res);
> +                     "with a TPM error 0x%x %s", type, res,
> +                     tpm_emulator_strerror(res));
>          return -1;
>      }
>
> @@ -758,7 +787,8 @@ static int tpm_emulator_set_state_blob(TPMEmulator *t=
pm_emu,
>      tpm_result =3D be32_to_cpu(pss.u.resp.tpm_result);
>      if (tpm_result !=3D 0) {
>          error_report("tpm-emulator: Setting the stateblob (type %d) fail=
ed "
> -                     "with a TPM error 0x%x", type, tpm_result);
> +                     "with a TPM error 0x%x %s", type, tpm_result,
> +                     tpm_emulator_strerror(tpm_result));
>          return -1;
>      }
>
> @@ -888,8 +918,8 @@ static void tpm_emulator_shutdown(TPMEmulator *tpm_em=
u)
>          error_report("tpm-emulator: Could not cleanly shutdown the TPM: =
%s",
>                       strerror(errno));
>      } else if (res !=3D 0) {
> -        error_report("tpm-emulator: TPM result for sutdown: 0x%x",
> -                     be32_to_cpu(res));
> +        error_report("tpm-emulator: TPM result for shutdown: 0x%x %s",
> +                     be32_to_cpu(res), tpm_emulator_strerror(be32_to_cpu=
(res)));
>      }
>  }

lgtm

>
> --
> 2.20.1
>


--=20
Marc-Andr=C3=A9 Lureau

