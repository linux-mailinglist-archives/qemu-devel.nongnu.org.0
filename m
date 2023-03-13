Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B4A6B7946
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 14:44:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbiSy-0005l1-Tk; Mon, 13 Mar 2023 09:43:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pbiSx-0005kt-IS
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 09:43:55 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pbiSv-0001Lb-Sg
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 09:43:55 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 e15-20020a17090ac20f00b0023d1b009f52so1633833pjt.2
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 06:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678715032;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FZJS/XyIxoHsRnjaPL71DbOkYhjrANl+x3jNEbac4T8=;
 b=GXxcNK99F4PHucBAeheCSoOXZua4HQA50xlZjUDfutmmZsMmb4OMUcXME1a9TE4npK
 CuTWje42Kk2jBast6DN8dWcK0uV81aKGWiHnUZYL8yxT5D7jhlO7fsZdVclwSluhTAUn
 JC9sIQ343Vfdip8gnQ/gpLUTHNyhmD2SCg4yH5razl6/363jafEhFqxWWtd2Y3opZMkh
 XQXMGa0ZIkWgj7oVr0l6LE7/kbLLNdlEYYSckbqi8cWjCD6ZTzNWCSNBJXszWsPx/F4g
 Lf/3YjP+ZoZGsHLekxzIC54/lChyrN/PFvVlmJ1tP7x5AU8Svc/HYSyJrN7gewk/Wd2S
 PfBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678715032;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FZJS/XyIxoHsRnjaPL71DbOkYhjrANl+x3jNEbac4T8=;
 b=irTGnEqxlTOepmRp0ZN11W8TfOt/FuLMwSQ1hX13akNWtrrr7BJTbQEdYdH/cp57g4
 eTHNyCcYmOEbXA5SNUCh06j9pcFXUaq1qLSxv1XHXcikoiZMYPacu4DTYb2SZ7jTaih9
 YulBxnsq8yaO7Inx2NfI9Pb04IJAsUCq5Joqk/hBC9gM0zMr/0+Nysp2QYPwdtWvvqiw
 Di6efigtKb/YHg/zY0Wj5gRYb7V2xQ8WoEvuuBjk+qALYU5my7W/ugwsiVYibuOnWf0D
 rdqUPrCKtDPVbTgs9uKqMkJXj9KNwQnvqkCtz4GlcGSP3otRVVX/eU6P6jCRM8OaUVXl
 QeJg==
X-Gm-Message-State: AO0yUKUq33QMVYJqqS+zc7JhW8xzfRdEVltHW1RIjKtJTfIbDe95LHwT
 Tl+o0SDkol6kZu3oPueDn0yPjW/ebjJ33Vh+hI6nNw==
X-Google-Smtp-Source: AK7set/C+qSWU/cQekN6U0Bg3T+auw+UZcqnmG4s9EmoS9bl2BPJpcALsrIOfXjKWClHuOZgfMsKnKz6IXXhJeCHtAE=
X-Received: by 2002:a17:903:2890:b0:1a0:419a:dc31 with SMTP id
 ku16-20020a170903289000b001a0419adc31mr1694694plb.9.1678715032222; Mon, 13
 Mar 2023 06:43:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230313110126.383392-1-marcandre.lureau@redhat.com>
In-Reply-To: <20230313110126.383392-1-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Mar 2023 13:43:40 +0000
Message-ID: <CAFEAcA_VmZP=JSr7i0nMGFXPwUKKNrfajK1ZJ-2nSv0nONGLsw@mail.gmail.com>
Subject: Re: [PULL 00/18] UI patches
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Mon, 13 Mar 2023 at 11:01, <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> The following changes since commit 29c8a9e31a982874ce4e2c15f2bf82d5f8dc35=
17:
>
>   Merge tag 'linux-user-for-8.0-pull-request' of https://gitlab.com/laure=
nt_vivier/qemu into staging (2023-03-12 10:57:00 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/marcandre.lureau/qemu.git tags/display-pull-request
>
> for you to fetch changes up to 8af2d147cad9d150f977191ebef55f4ad6d01560:
>
>   ui/dbus: restrict opengl to gbm-enabled config (2023-03-13 14:58:57 +04=
00)
>
> ----------------------------------------------------------------
> ui: dbus & misc fixes
>

This breaks the avocado vnc tests:
https://gitlab.com/qemu-project/qemu/-/jobs/3922220042
https://gitlab.com/qemu-project/qemu/-/jobs/3922220038
https://gitlab.com/qemu-project/qemu/-/jobs/3922517034

(205/218) tests/avocado/vnc.py:Vnc.test_change_password_requires_a_password=
:
ERROR: ConnectError: Failed to establish session: EOFError\n Exit
code: -11\n Command: ./qemu-system-x86_64 -display none -vga none
-chardev socket,id=3Dmon,fd=3D15 -mon chardev=3Dmon,mode=3Dcontrol -machine
none -nodefaults -S -vnc :0\n Output: \n (0.39 s)
(206/218) tests/avocado/vnc.py:Vnc.test_change_password: ERROR:
ConnectError: Failed to establish session: EOFError\n Exit code: -11\n
Command: ./qemu-system-x86_64 -display none -vga none -chardev
socket,id=3Dmon,fd=3D15 -mon chardev=3Dmon,mode=3Dcontrol -machine none
-nodefaults -S -vnc :0,password=3Don\n Output: \n (0.18 s)
(207/218) tests/avocado/vnc.py:Vnc.test_change_listen: ERROR:
ConnectError: Failed to establish session: EOFError\n Exit code: -11\n
Command: ./qemu-system-x86_64 -display none -vga none -chardev
socket,id=3Dmon,fd=3D15 -mon chardev=3Dmon,mode=3Dcontrol -machine none
-nodefaults -S -vnc 127.0.0.1:26868\n Output: \n (0.18 s)

thanks
-- PMM

