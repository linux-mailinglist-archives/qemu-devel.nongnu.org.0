Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F2D5FB245
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 14:18:08 +0200 (CEST)
Received: from localhost ([::1]:41324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiED0-0008Ut-TW
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 08:18:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oiCZy-0006bW-VM
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:33:43 -0400
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31]:46057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oiCZw-0005wr-AW
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:33:42 -0400
Received: by mail-qv1-xf31.google.com with SMTP id g9so8643065qvo.12
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 03:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dmxOmnrCLrbMam8M1xeuWJQjek5QMLJr12uO3vcJwpk=;
 b=EGCdm8i5GewtaSn2KvjAJeZGnTKefV/jCs2+dhTyYjAwidElkDMmRXq/8mgVP3qX/J
 fBa+uyXBJNi4uEuhypy0UhwoGFb+3fiokVwQKs5PipiVriDnh1C6ZD9vkJS9NI35pL5w
 0KMBYD5V8uR99vm/d/sPRQBeN7d/ypyPwWCuovCXTP0wLunV7L15ZOa4t5tVdgejGqXG
 4kWbggrUPgcx2Wma57y6bhXMPHJmfQCldrpMyrCnprJPm7JjGtpYJha2KyOMCaehFQ5y
 3R+HGZv1aPeT045ydjGSoKoQhhha744xXZSRktsd0hU/+2HEkehs8z7ekyPOFWlprLHA
 L28Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dmxOmnrCLrbMam8M1xeuWJQjek5QMLJr12uO3vcJwpk=;
 b=u3WD+yPWwBkdNJwc4fb5n6g17KS2jSootDr+T9ZTo4TUvTBBIUFu8Fgp1EOH82woob
 OjHQ+YKwLYzDSGgP1MDLWryKhxl/Og9MQ7WiQZpx4loS9z+1AtD2BhCExJYby4m+LRlS
 CrsgmaYBa5/qmxTGdZl7B6AONjVi4NLCpJhOxo63a1yirBJiprJsIZ7OEv4dfPq4Ekd8
 ueyrof9/Tleawt5CtFIIWTSvSxMqXokh0X70UhUaXSyDlcq7ugyfJFDD5m2J3rNYRtpm
 ZV999ZL9SuWWxiwzZCNojJkgVmPh37XQ/flp+dw3czfU4yggX/gq3Pz3XAvYHP1vf8PD
 KIww==
X-Gm-Message-State: ACrzQf0tPUrOrT41jMe9HSCucaxuLIRKtCuHVaPzhJAuwqu1etGxmB99
 8TI6B5E4RIBH0askOo8ClCIYvFEwHx5QMMr/t4LnpAh9YvM=
X-Google-Smtp-Source: AMsMyM5g4KxPuJ9jWPZHmiCxiL9X3tEnsTs1AleMI8DkQhcjuAMiwDpBBCOv7PxeondGGSwIodi2n4PAtaXUWeZWutQ=
X-Received: by 2002:a05:6214:20a7:b0:4b1:7c4f:a218 with SMTP id
 7-20020a05621420a700b004b17c4fa218mr18286963qvd.85.1665484417552; Tue, 11 Oct
 2022 03:33:37 -0700 (PDT)
MIME-Version: 1.0
References: <20221011090835.3534934-1-marcandre.lureau@redhat.com>
In-Reply-To: <20221011090835.3534934-1-marcandre.lureau@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 11 Oct 2022 18:33:26 +0800
Message-ID: <CAEUhbmWNkLbt7ik2REQ4w+2FRCAr9NwFm+aGw85LHAzbQ9-n6Q@mail.gmail.com>
Subject: Re: [PATCH v4] win32: set threads name
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, bin.meng@windriver.com, 
 richard.henderson@linaro.org, Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::f31;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qv1-xf31.google.com
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

On Tue, Oct 11, 2022 at 5:29 PM <marcandre.lureau@redhat.com> wrote:
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
> Acked-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  util/qemu-thread-win32.c | 55 ++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 53 insertions(+), 2 deletions(-)
>
> diff --git a/util/qemu-thread-win32.c b/util/qemu-thread-win32.c
> index a2d5a6e825..b20bfa9c1f 100644
> --- a/util/qemu-thread-win32.c
> +++ b/util/qemu-thread-win32.c
> @@ -19,12 +19,39 @@
>
>  static bool name_threads;
>
> +typedef HRESULT (WINAPI *pSetThreadDescription) (HANDLE hThread,
> +                                                 PCWSTR lpThreadDescript=
ion);
> +static pSetThreadDescription SetThreadDescriptionFunc;
> +static HMODULE kernel32_module;
> +
> +static bool load_set_thread_description(void)
> +{
> +    static gsize _init_once =3D 0;
> +
> +    if (g_once_init_enter(&_init_once)) {
> +        kernel32_module =3D LoadLibrary("kernel32.dll");
> +        if (kernel32_module) {
> +            SetThreadDescriptionFunc =3D
> +                (pSetThreadDescription)GetProcAddress(kernel32_module,
> +                                                      "SetThreadDescript=
ion");
> +            if (!SetThreadDescriptionFunc) {
> +                FreeLibrary(kernel32_module);
> +            }
> +        }
> +        g_once_init_leave(&_init_once, 1);
> +    }
> +
> +    return !!SetThreadDescriptionFunc;
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
> @@ -400,6 +427,26 @@ void *qemu_thread_join(QemuThread *thread)
>      return ret;
>  }
>
> +static bool

This is still not fixed

> +set_thread_description(HANDLE h, const char *name)
> +{
> +  HRESULT hr;

and the 4 spaces here ...

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
> @@ -423,7 +470,11 @@ void qemu_thread_create(QemuThread *thread, const ch=
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

