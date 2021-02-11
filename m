Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F313187D4
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 11:12:01 +0100 (CET)
Received: from localhost ([::1]:33768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA8x6-0001P0-OK
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 05:12:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lA8uI-0007ke-1R
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 05:09:06 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:43206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lA8uG-0004EC-Bl
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 05:09:05 -0500
Received: by mail-ej1-x636.google.com with SMTP id y9so9102241ejp.10
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 02:09:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=oAv7Yr5DG5KFxleejYUuHMP8YqdV5+5CCnYY+rZo42o=;
 b=p8Uad3ZxvcOZfPCOI4Wu46WMwbQisae3kSmG32I8/WWNxe0rcJVwKYr+X2jH5pzdM3
 ynDBrBpRoFGBThKehL1Ve2JnnqtKI4m41K6D0rTSM4hycWQeWcdjyroDTGj9TGH/oPN7
 8P0naXTf0EWCi7m4WE3f0Py2h3VsTLj45+aVNeAab2DjSw73bV0AfLYpIb6bZ8EQNAfc
 hgiug5lqwjG192diJL/uvmoOHYU4ZVzrBCACv2hETcZGd3+lvc//IWS42KjegNkVJaIh
 IKkTpv7WsoOH/DBMZPF+RBJewylX4M8UgjKNscij17bcBu25w3OlOYOxvYbxOEaoUaKI
 +//A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=oAv7Yr5DG5KFxleejYUuHMP8YqdV5+5CCnYY+rZo42o=;
 b=D/4K8ESePMWwb91ghVX8llgqjDAoax3Pe9wlKue3daQBxuuCI1Vw+tZEqaOhqL9f0A
 mPYLc2IG8/RwKzk66w1AcwDqqu3ybncfD6IYHEAcV5hnbS+sHhfi5xy1jAOkV4W5RA8v
 Q1/cku/af3tpw6QE+qkQhGi8TAxLuDsse7UgXZoNa0z1gb2iBvmSw9srk9kf3ya6ajHL
 K6/Tn2qd9SxhIzLRa54+Z3wvNwduGE4+CAK4sy1ICTXR5d1RYGwJgi9LZmYl5AQ1TAX2
 0sJhwt8jQ9zaqmvCULfdDaMuj33iSZnEweptCJDltZ/EgoByCqNnI4+xVAiw26vVotb5
 f6hQ==
X-Gm-Message-State: AOAM533ZV84SuHNfeU1uhHH26xna7glZRHhv+pEuir6vQtonYSxTBBhr
 oo5TYpilLiJYp4LoMh7SfRq7ul+pPVB9OIstNfY=
X-Google-Smtp-Source: ABdhPJxjnb9rnY5uPpFGSPXCOm/f2AsyNDBbe0z78JQiFJBGAUmbgeUqTK6qNefkTzXk+/+qnd0FA4a1jYlVKhe/Q3w=
X-Received: by 2002:a17:906:1be9:: with SMTP id
 t9mr7570995ejg.527.1613038141244; 
 Thu, 11 Feb 2021 02:09:01 -0800 (PST)
MIME-Version: 1.0
References: <20210203172357.1422425-1-crosa@redhat.com>
 <20210203172357.1422425-18-crosa@redhat.com>
In-Reply-To: <20210203172357.1422425-18-crosa@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 11 Feb 2021 14:08:49 +0400
Message-ID: <CAJ+F1C+dUWrcyyN8NsfxROqGELeDH6XdpAvtV8oJsBz+QV-C+g@mail.gmail.com>
Subject: Re: [PATCH 17/22] Acceptance Tests: fix population of public key in
 cloudinit image
To: Cleber Rosa <crosa@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_FILL_THIS_FORM_SHORT=0.01 autolearn=ham autolearn_force=no
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

On Wed, Feb 3, 2021 at 9:40 PM Cleber Rosa <crosa@redhat.com> wrote:
>
> Currently the path of the ssh public key is being set, but its
> content is obviously what's needed.
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> ---
>  tests/acceptance/avocado_qemu/__init__.py | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance=
/avocado_qemu/__init__.py
> index 472088ae7d..8156224625 100644
> --- a/tests/acceptance/avocado_qemu/__init__.py
> +++ b/tests/acceptance/avocado_qemu/__init__.py
> @@ -337,13 +337,15 @@ class LinuxTest(Test, LinuxSSHMixIn):
>          try:
>              cloudinit_iso =3D os.path.join(self.workdir, 'cloudinit.iso'=
)
>              self.phone_home_port =3D network.find_free_port()
> +            with open(ssh_pubkey) as pubkey:
> +                pubkey_content =3D pubkey.read()
>              cloudinit.iso(cloudinit_iso, self.name,
>                            username=3D'root',
>                            password=3D'password',
>                            # QEMU's hard coded usermode router address
>                            phone_home_host=3D'10.0.2.2',
>                            phone_home_port=3Dself.phone_home_port,
> -                          authorized_key=3Dssh_pubkey)
> +                          authorized_key=3Dpubkey_content)
>          except Exception:
>              self.cancel('Failed to prepare the cloudinit image')
>          return cloudinit_iso
> --
> 2.25.4
>
>


--=20
Marc-Andr=C3=A9 Lureau

