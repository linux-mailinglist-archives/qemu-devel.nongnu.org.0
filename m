Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F6A38E4A0
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 12:54:06 +0200 (CEST)
Received: from localhost ([::1]:35834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ll8Dl-0004HE-Sq
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 06:54:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ll8Cy-0003Id-Pn
 for qemu-devel@nongnu.org; Mon, 24 May 2021 06:53:16 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:41603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ll8Cv-0001i5-Dm
 for qemu-devel@nongnu.org; Mon, 24 May 2021 06:53:16 -0400
Received: by mail-wr1-x432.google.com with SMTP id d11so28033565wrw.8
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 03:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=9WcsJPFSbla0JKCdCVdKpFTlBZFtneTKNTCsLjvUIIk=;
 b=D8g6IyoT+2XgFU+lbwm3Fz7xe8bDBFY0K3lxW3s7Yc6KlhS46j5GKdW3krhLC2OEmQ
 /vQvmytO47XhUxKkI2jnLB2TR7y8s9tnZyALfanGMpvjLenD6uTtsJWtN6f6EhBdHK1S
 7mO15ke1Ri3yb/euM85s80UitCo0w2TL1+22tEKnB+qm3FRfNi2+9rVVmowIBau8VO7Z
 x0vlz250atWnWR/7DR2ZCsH8P3sEStpS66WYg4l65Lfdo0YaU/uotQ6JtNIyom0u+3Hd
 K8oBCQ6aCPHYNXL+dGrbWR0dNZBFol3I1brwP/zx+o9s0rcQWd3xeyxA6bXxDzuQgk7U
 zE5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=9WcsJPFSbla0JKCdCVdKpFTlBZFtneTKNTCsLjvUIIk=;
 b=I/f1nPJ/zJm3VOrFmLPOZV0k42g1kWAIgVt0TojNjHXOzYLuqRb47LIX0xuqtl19G2
 64S6LamrrEoEywAksXztl/KyLQmmzYhAqGlNNeml3Cam5JHELqd6ASFLvKqf2yKPtnON
 FD9IoBLdqGq28/mCJn02YwkmveEGy/WkBoqi2xP7NXKoEw/SFTOhxNAc8m6IbctZrYxH
 /XfULOx5/owe2PSmdWW77dcmu20/MYMBi6k1pVjPPTciQAJk94lOKlXhGkhkF2Gb/Cv0
 5iF1WIShSLS5iwgr3iMlVFyvXDwP3oirAQEBuC5kqlwaDWo6QodDgPaqRWX2jtfSkP8g
 d2Ag==
X-Gm-Message-State: AOAM531bIwjrrnujMzfwla/iTVLkivs0rZRnXSCSm0OomfqgN10vvdGf
 ZQAO5a6kJroEZW/593Yw5ASdRg==
X-Google-Smtp-Source: ABdhPJyBM/YwnidbWW4sOhVFGlWOf6uqfidxSDslxolPBSVEgfQ7Q6nBj4GXeP3y9d324LQpIdmvXA==
X-Received: by 2002:a5d:50cf:: with SMTP id f15mr6472346wrt.287.1621853591301; 
 Mon, 24 May 2021 03:53:11 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a23sm11442577wrc.22.2021.05.24.03.53.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 03:53:10 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 64DB41FF7E;
 Mon, 24 May 2021 11:53:09 +0100 (BST)
References: <20210524045412.15152-1-yamamoto@midokura.com>
 <20210524045412.15152-2-yamamoto@midokura.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: YAMAMOTO Takashi <yamamoto@midokura.com>
Subject: Re: [PATCH 1/5] linux-user: handle /proc/self/exe for execve
Date: Mon, 24 May 2021 11:50:18 +0100
In-reply-to: <20210524045412.15152-2-yamamoto@midokura.com>
Message-ID: <87tums4d4a.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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
Cc: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


YAMAMOTO Takashi <yamamoto@midokura.com> writes:

> It seems somehow common to execve /proc/self/exe in docker
> or golang community these days.
> At least, moby "reexec" and runc "libcontainer" do that.
>
> Signed-off-by: YAMAMOTO Takashi <yamamoto@midokura.com>
> ---
>  linux-user/syscall.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index c9f812091c..a2b03ecb8b 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -8470,6 +8470,7 @@ static abi_long do_syscall1(void *cpu_env, int num,=
 abi_long arg1,
>  #endif
>      case TARGET_NR_execve:
>          {
> +            const char *path;
>              char **argp, **envp;
>              int argc, envc;
>              abi_ulong gp;
> @@ -8537,7 +8538,11 @@ static abi_long do_syscall1(void *cpu_env, int num=
, abi_long arg1,
>               * before the execve completes and makes it the other
>               * program's problem.
>               */
> -            ret =3D get_errno(safe_execve(p, argp, envp));
> +            path =3D p;
> +            if (is_proc_myself(path, "exe")) {
> +                path =3D exec_path;
> +            }

This still relies on binfmt_misc kicking in to ensure the binary is
re-executed with qemu right?

> +            ret =3D get_errno(safe_execve(path, argp, envp));
>              unlock_user(p, arg1, 0);
>=20=20
>              goto execve_end;


--=20
Alex Benn=C3=A9e

