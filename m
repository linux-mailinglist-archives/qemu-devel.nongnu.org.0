Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EED731A748
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 23:05:49 +0100 (CET)
Received: from localhost ([::1]:59758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAgZP-0003CM-Ab
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 17:05:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAgUp-0001cp-Cu
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 17:01:03 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:46657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAgUn-0006Ga-8I
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 17:01:03 -0500
Received: by mail-wr1-x434.google.com with SMTP id t15so892249wrx.13
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 14:01:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=+UVjKz39BOObg3jPEaqGsMchgperkA9OXDxRXNbKUWE=;
 b=isF850+IbJ9CHtjX9KDzp/MaBCaAAzYpXq+gTq/AVg97n8mCNUL+DwBawBtJFBh2m/
 cKqloxdLtfciHeZ8kFY8JDP74NwB7hjCjIyE27X4r3KL9v2wwHQ46Jhi3mrg/qayYKEJ
 aSHP4UJbpqx5XqZ5Kogc26CjbSxMKka+e+zRzctpnNlHX7IbuzC2f6WeVUSXM0fVHdNV
 YAO7/oNe12r4MxtfqUyTnDv3QK/NCSCphUJq18SZJf+2BozJ4q5ZG0q74wSIxAOEELXR
 wsDti6C+W1fmKqLOQbMXQIOXRRhdQ4uAKeEJ1tw+AEUfVnsvNE4VSrWHFcvrbzpDr0wy
 pIbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=+UVjKz39BOObg3jPEaqGsMchgperkA9OXDxRXNbKUWE=;
 b=lUHERSnh+D+qXs/zxaYlGLgkgpDunzJxtYZ3elJaNFHtYnhIlKWF+qFs5bC0g4jnEW
 HtsUn6h+0b8LYdRtGW70o7uwa8zvK7ASffNsfGfWd/cGc8N3EOaSjxmzDF3xZOZULTn7
 o+mlxl/o+8d4xi9SvXr9jau1qIwkKw0BDf7dYax15hlLL7G3Q9KUYfZU2VYWc6/0ZeIx
 8HCaKjtFQGcdXG1G7KtqUSi413tJpxkHjMlxbKPqbokqkZUxSf8oemBnF0RlnV6z8wZx
 hNqDKQZjdqJJSKF+3QZfB2moFkJxaUMNeJMmRFH7tCnei1/Zp5HQAeFXv58PjwIH1sBA
 zSYw==
X-Gm-Message-State: AOAM533uTTcU1w7OUGu+xOvsbCsSnuHSnXoL4q5zqKUheL9QBfx5r5z9
 iUNy2DJ6znlpnJ9xoQiloe29WQ==
X-Google-Smtp-Source: ABdhPJxVx+GCMHVFZVPJMLDXNA9VYlPEO+rB3isC3StPsYSzj3z5cVvmCQ3bCifI9rxXLaJ2hAN+WA==
X-Received: by 2002:adf:d0c3:: with SMTP id z3mr4545076wrh.56.1613167259655;
 Fri, 12 Feb 2021 14:00:59 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j15sm13803776wrw.9.2021.02.12.14.00.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Feb 2021 14:00:58 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CAA1D1FF7E;
 Fri, 12 Feb 2021 22:00:57 +0000 (GMT)
References: <20210212151649.252440-1-mreitz@redhat.com>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH] virtiofs_submounts.py test: Note on vmlinuz param
Date: Fri, 12 Feb 2021 22:00:45 +0000
In-reply-to: <20210212151649.252440-1-mreitz@redhat.com>
Message-ID: <87pn15x7xi.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Max Reitz <mreitz@redhat.com> writes:

> From the cancel message, it is not entirely clear why this parameter is
> mandatory now, or that it will be optional in the future.  Add such a
> more detailed explanation as a comment in the test source file.
>
> Suggested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Max Reitz <mreitz@redhat.com>


Thanks!

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
> I=E2=80=99ve uploaded a build of Linux 5.10 here:
>   https://xanclic.moe/linux-5.10
>
> But I=E2=80=99ve decided against mentioning it in this new comment or the=
 cancel
> message, because, well, it=E2=80=99s my private server and I have limited
> bandwidth.
> ---
>  tests/acceptance/virtiofs_submounts.py | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/tests/acceptance/virtiofs_submounts.py b/tests/acceptance/vi=
rtiofs_submounts.py
> index 949ca87a83..9a69b6b17b 100644
> --- a/tests/acceptance/virtiofs_submounts.py
> +++ b/tests/acceptance/virtiofs_submounts.py
> @@ -228,6 +228,18 @@ class VirtiofsSubmountsTest(BootLinux):
>      def setUp(self):
>          vmlinuz =3D self.params.get('vmlinuz')
>          if vmlinuz is None:
> +            """
> +            The Linux kernel supports FUSE auto-submounts only as of 5.1=
0.
> +            boot_linux.py currently provides Fedora 31, whose kernel is =
too
> +            old, so this test cannot pass with the on-image kernel (you =
are
> +            welcome to try, hence the option to force such a test with
> +            -p vmlinuz=3D'').  Therefore, for now the user must provide a
> +            sufficiently new custom kernel, or effectively explicitly
> +            request failure with -p vmlinuz=3D''.
> +            Once an image with a sufficiently new kernel is available
> +            (probably Fedora 34), we can make -p vmlinuz=3D'' the defaul=
t, so
> +            that this parameter no longer needs to be specified.
> +            """
>              self.cancel('vmlinuz parameter not set; you must point it to=
 a '
>                          'Linux kernel binary to test (to run this test w=
ith ' \
>                          'the on-image kernel, set it to an empty string)=
')


--=20
Alex Benn=C3=A9e

