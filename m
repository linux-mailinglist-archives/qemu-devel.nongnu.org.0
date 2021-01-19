Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E282FB5A6
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 12:23:20 +0100 (CET)
Received: from localhost ([::1]:50200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1p6V-0000PE-HR
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 06:23:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l1p5W-0008Bz-65
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 06:22:18 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:36862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l1p5T-0006dN-Ow
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 06:22:17 -0500
Received: by mail-wr1-x42a.google.com with SMTP id 6so12065103wri.3
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 03:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=8i7AupAwN04AAg5qprKjwd4M+k43O9uU4ZDJ00Siafo=;
 b=EqA+cXG28kuxm6hHVJwqwx7RqqZdFdgpqVYYHnw7BuzFq57MrVA2+yZZH0kt8ATvVA
 pQRTQfGcl/sgaN/ohT3K2rWUNzbBSVQShR6bYX2BFdKNmSxwxEWnpkTiQEg+ZfooVpWW
 KI08OyZDNh5WlDWpBcpPSY/jnrIVDB8q83aZaXKjAu53qunkj8ofC3vOiq0+GzzlNWy7
 jtYA4ir41gsiaTWU2AL9oi13dnuamL/RBjrKx09Sy17Lf5cusFauT/jk0Ft91hICHGbW
 Yrq8Ogdkzig6cJFal+tLmRcTeogoXVLq5WN46CmqDxQlA+d5WgGk4rOV2UCB06xbxttX
 NtEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=8i7AupAwN04AAg5qprKjwd4M+k43O9uU4ZDJ00Siafo=;
 b=HQSg3eYusxHU6MUiUi4TBPY/vJ13SN14QZ4xzb0QXyBO19OZNv6yqwnP3HdQfpPTBk
 vuTLbo/61vCQLBac7+gTslWEdkFSGaKW9Fcqx95JrtwIEAa/pZlDzSrV9MNiEBS18T3s
 QvdXL4Vj4UtWKe5VGACd2HHDQPqoqFMSQozQHdTo4sy4gp65FrHARP5eJXIuPxbF1ra2
 1S93GiGDW0ZeSNxRXQNd8Z0bYZIgTV4d6O/ubUyDDZSwWHVUDfJkT7k98CSIuj2W7g1p
 KYq5133R66ocMzsW0z5NjNs6GORyuiFQZkiW8oLKejauC/kEb2YG3j8eEcNJfnHxs/gX
 tZ9A==
X-Gm-Message-State: AOAM5329+2d5ykFouOmyDP4xybDD0VR/twDXO5FBLouRmnIetekJECmA
 /qi5Z0YfFb+WbNHFGkgxQjnOGg==
X-Google-Smtp-Source: ABdhPJymnOCOrF25u+1g6bmViMjWV97XMGQ/n+mt6WdqxJKURCpRjoyrChHlY3mC2YNEj018NRVJGA==
X-Received: by 2002:adf:df03:: with SMTP id y3mr3916077wrl.102.1611055333361; 
 Tue, 19 Jan 2021 03:22:13 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z8sm3896100wmi.44.2021.01.19.03.22.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 03:22:12 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id ADB1A1FF7E;
 Tue, 19 Jan 2021 11:22:11 +0000 (GMT)
References: <20210119050149.516910-1-f4bug@amsat.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH] tests/docker: Fix _get_so_libs() for docker-binfmt-image
Date: Tue, 19 Jan 2021 11:21:47 +0000
In-reply-to: <20210119050149.516910-1-f4bug@amsat.org>
Message-ID: <87eeihuq70.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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
Cc: Fam Zheng <fam@euphon.net>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> Fix a variable rename mistake from commit 5e33f7fead5:
>
>   Traceback (most recent call last):
>     File "./tests/docker/docker.py", line 710, in <module>
>       sys.exit(main())
>     File "./tests/docker/docker.py", line 706, in main
>       return args.cmdobj.run(args, argv)
>     File "./tests/docker/docker.py", line 489, in run
>       _copy_binary_with_libs(args.include_executable,
>     File "./tests/docker/docker.py", line 149, in _copy_binary_with_libs
>       libs =3D _get_so_libs(src)
>     File "./tests/docker/docker.py", line 123, in _get_so_libs
>       libs.append(s.group(1))
>   NameError: name 's' is not defined
>
> Fixes: 5e33f7fead5 ("tests/docker: better handle symlinked libs")
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> "Tested-by" but apparently not enough... Well actually it was on
> Debian, now using Fedora.

Also we don't notice if we use static binaries (which I do most of the time=
).

Queued to testing/next, thanks.

> ---
>  tests/docker/docker.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/docker/docker.py b/tests/docker/docker.py
> index 884dfeb29c4..0b4f6167b3d 100755
> --- a/tests/docker/docker.py
> +++ b/tests/docker/docker.py
> @@ -120,7 +120,7 @@ def _get_so_libs(executable):
>              search =3D ldd_re.search(line)
>              if search:
>                  try:
> -                    libs.append(s.group(1))
> +                    libs.append(search.group(1))
>                  except IndexError:
>                      pass
>      except subprocess.CalledProcessError:


--=20
Alex Benn=C3=A9e

