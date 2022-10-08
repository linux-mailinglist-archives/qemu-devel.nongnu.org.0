Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 278D65F826A
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Oct 2022 04:26:58 +0200 (CEST)
Received: from localhost ([::1]:42598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogzYG-0001mN-R7
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 22:26:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ogzWr-0000Ev-Qv
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 22:25:31 -0400
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35]:45726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ogzWp-00036m-VP
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 22:25:29 -0400
Received: by mail-qv1-xf35.google.com with SMTP id g9so4141759qvo.12
 for <qemu-devel@nongnu.org>; Fri, 07 Oct 2022 19:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YlBlKJF4zS8NCDyARqEk8ISaXjvLqhrg+Vbejq1RG3Q=;
 b=VdYxG93iSHIUw4o7DlsOA9eVhkXoMFP242ZKVx9jQY2h8tt4dv/fHignYHQjsTjPAb
 k7ecAzkpe+57hWBOplMN/GPthTLlBcmpd/F28ZKMAgt23gW9ky0eFy8jwzGeeB9yJ2F3
 /uhC5Om5fUkYy6EpsAcWAr8ODLeva6/3/wknKyqVIbDDwxPsK6XbiRSWBOWIJNScw9wu
 e1LNICUM0HRDqod76OFVDCMPCehfD85hIRael/ftpKks0CgFH33Wl7+v77DXN1gP6DBm
 KlVX3Z+fPXovHVJ5f5JxRd5zABbBvvymZwmBo7RjrGm4vTLoqBI9yCaj6GfQFl7vcD67
 9OxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YlBlKJF4zS8NCDyARqEk8ISaXjvLqhrg+Vbejq1RG3Q=;
 b=lJFV0ABBZBOvRJc3YGT7X3RC2SIYbQIr3Pf9pD96RATg/UDXJgFl7/3GytDxPujWwJ
 ZW/hdtpa9iQj55F5TbscKby4ZcJX2j1DXYoQC45Bcw4Wmg7RmY6IpMWeWOgjWXvqSxXf
 a6P9tRkD7RvViv0xwV7et+45AcSay4smLHBYobHBrcZEI+QekTSsRESC4rsAkSm2ssl0
 EpAqa1hnv7vIPmB/mCc/SshEr0ut3Z7kP9WJlV7z7QYrY+aRxaa12GY4pIdT+jGP/34I
 TYfmAus8Efrf4ttd6ZJxBYTH2KbV6nqQ+FNE53Yv8qksykaSUGbEd7k094Bd9vmAYSuY
 qP2w==
X-Gm-Message-State: ACrzQf3Y0lfJeHuwXZKArXJnYV+7ern9JH6Yu2BvIBHBuJnFOouw6RoA
 bXBn6WM5+HPZZH5Ri9+q6JCFyLX1b4krzbPmBAU=
X-Google-Smtp-Source: AMsMyM7dpWf3uVQ4x3/uQTdpD0tMoodk+gFbj8Dqc790VAI8qIzg7W+n8MD38DWY+LmUz/KwDjYL9IsP1ydXXpoM3F8=
X-Received: by 2002:a0c:f2c6:0:b0:4b1:79bb:77a9 with SMTP id
 c6-20020a0cf2c6000000b004b179bb77a9mr6447529qvm.51.1665195926862; Fri, 07 Oct
 2022 19:25:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220930140354.1684652-1-marcandre.lureau@redhat.com>
In-Reply-To: <20220930140354.1684652-1-marcandre.lureau@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 8 Oct 2022 10:25:15 +0800
Message-ID: <CAEUhbmVLK7vNa=wKiM=tRNeZ+bOZrA4T=Ex_67UCGoK0g4aGEQ@mail.gmail.com>
Subject: Re: [PATCH v3] win32: set threads name
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, bin.meng@windriver.com, 
 richard.henderson@linaro.org, Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::f35;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qv1-xf35.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 30, 2022 at 10:19 PM <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> As described in:
> https://learn.microsoft.com/en-us/visualstudio/debugger/how-to-set-a-thre=
ad-name-in-native-code?view=3Dvs-2022
>
> SetThreadDescription() is available since Windows 10, version 1607 and
> in some versions only by "Run Time Dynamic Linking". Its declaration is
> not yet in mingw, so we lookup the function the same way glib does.
>
> Tested with Visual Studio Community 2022 debugger.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  util/qemu-thread-win32.c | 56 ++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 54 insertions(+), 2 deletions(-)
>
> diff --git a/util/qemu-thread-win32.c b/util/qemu-thread-win32.c
> index a2d5a6e825..90c9fa614b 100644
> --- a/util/qemu-thread-win32.c
> +++ b/util/qemu-thread-win32.c
> @@ -19,12 +19,40 @@
>
>  static bool name_threads;
>
> +typedef HRESULT (WINAPI *pSetThreadDescription) (HANDLE hThread,
> +                                                 PCWSTR lpThreadDescript=
ion);
> +static pSetThreadDescription SetThreadDescriptionFunc =3D NULL;
> +static HMODULE kernel32_module =3D NULL;

nits: the NULL assignment to the static variables is not necessary

> +
> +static bool

nits: incorrect style, should be in the same line with below

> +load_set_thread_description(void)
> +{
> +  static gsize _init_once =3D 0;

nits: the spaces should be 4 instead of 2, please fix this globally in
this patch

> +
> +  if (g_once_init_enter(&_init_once)) {
> +      kernel32_module =3D LoadLibraryW(L"kernel32.dll");

nits: use LoadLibrary() and let the compiler to decide which function to us=
e?

> +      if (kernel32_module) {
> +          SetThreadDescriptionFunc =3D
> +              (pSetThreadDescription)GetProcAddress(kernel32_module,
> +                                                    "SetThreadDescriptio=
n");
> +          if (!SetThreadDescriptionFunc) {
> +              FreeLibrary(kernel32_module);
> +          }
> +      }
> +      g_once_init_leave(&_init_once, 1);
> +  }
> +
> +  return !!SetThreadDescriptionFunc;
> +}
> +
>  void qemu_thread_naming(bool enable)
>  {
> -    /* But note we don't actually name them on Windows yet */
>      name_threads =3D enable;
>
> -    fprintf(stderr, "qemu: thread naming not supported on this host\n");
> +    if (enable && !load_set_thread_description()) {
> +        fprintf(stderr, "qemu: thread naming not supported on this host\=
n");
> +        name_threads =3D false;
> +    }
>  }
>
>  static void error_exit(int err, const char *msg)
> @@ -400,6 +428,26 @@ void *qemu_thread_join(QemuThread *thread)
>      return ret;
>  }
>
> +static bool
> +set_thread_description(HANDLE h, const char *name)
> +{
> +  HRESULT hr;
> +  g_autofree wchar_t *namew =3D NULL;
> +
> +  if (!load_set_thread_description()) {
> +      return false;
> +  }
> +
> +  namew =3D g_utf8_to_utf16(name, -1, NULL, NULL, NULL);
> +  if (!namew) {
> +      return false;
> +  }
> +
> +  hr =3D SetThreadDescriptionFunc(h, namew);
> +
> +  return SUCCEEDED(hr);
> +}
> +
>  void qemu_thread_create(QemuThread *thread, const char *name,
>                         void *(*start_routine)(void *),
>                         void *arg, int mode)
> @@ -423,7 +471,11 @@ void qemu_thread_create(QemuThread *thread, const ch=
ar *name,
>      if (!hThread) {
>          error_exit(GetLastError(), __func__);
>      }
> +    if (name_threads && name && !set_thread_description(hThread, name)) =
{
> +        fprintf(stderr, "qemu: failed to set thread description: %s\n", =
name);
> +    }
>      CloseHandle(hThread);
> +
>      thread->data =3D data;
>  }
>

Regards,
Bin

