Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 822906601D9
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 15:14:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDnTv-0003SG-4t; Fri, 06 Jan 2023 09:14:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDnTu-0003S7-18
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 09:14:02 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDnTr-0000TJ-Q3
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 09:14:01 -0500
Received: by mail-pl1-x62b.google.com with SMTP id n4so1798882plp.1
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 06:13:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8x/yXZmJysiSDpKjBMGOXmn6WU3Au/jvSMYI1FBT+ME=;
 b=LAIrgB3KlknVjWBk6eCBcQxTy4XPvIhnKSChHogtJOM0sUn1hgycVw3u1WEOYgoW1z
 eHXTkbIlHDbI9RoD8tcDhGmP2vtjpnBYwgbkonhAARZtXjMrZcYie4KrT7KAzeBS5Mle
 3Aotzxe7s/6vYJ/4yVpQDkUJB1DC1+22bjU0CCD23MmRd3sYWzRECPyThCeuHYlMv5zl
 0c6nAQe8hEH+UFVJT7JzCrWSe+qyH1ho4/Akh+mO1VR4AT59xaz6ZfiMdAcJKqKkLg/Y
 P42OahefjpT/JbqCKKA/it1ctDtNTW1NH4aQO0BwnvTqU+ZLXuxQkCAWIEVhWBOqPEVa
 ogeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8x/yXZmJysiSDpKjBMGOXmn6WU3Au/jvSMYI1FBT+ME=;
 b=l2Ec61ZVPWnAbwzsAfCABWzuFXgto+u6sLY6r2fhAy8qT25T/9CvV5opdzTGWoW4VW
 IUBGnzJSh8PmJV4kzUzNMV97kf9xy1a9+dKgHrrE7MCRBejrxzr+rBdYpXN0xsQL5FKf
 1K1y7qaMXr8gf1mSgfTuftPVYfFD7FZY5Us1Fubm0xy83fEhHpw7A6me39dbcaxLUjQ7
 W0w0ftfBjZrqtcVtVd+bIzQP+al5VPqVP9tMvFFavvgfaKNdCRUMh6fbwI8k/0UgRdj8
 MRJWqwmnLMSpXll7CtrGA1kcyi9KfqJ5b3SIglI/jY/EG06kQH5sTyd4GjgKku1TJGXW
 ipRQ==
X-Gm-Message-State: AFqh2kpn1obuUI8MvupJxhgNkljAp/c3Iol3LTQ/zVw4JFFt59yp6CZh
 6k3CtlbKRB3U0rGG75uKmnDofx+yPTv2y/fjxHhC8w==
X-Google-Smtp-Source: AMrXdXuLSOs738mxWbIz+5qJzjUSZIgNSaCnyE+N3+z9ciN/ufY6Ct/wyOA9NeW9qYDPMNAjrYJVLsQcN8FMu+3Qjdo=
X-Received: by 2002:a17:902:9890:b0:189:b0a3:cf4a with SMTP id
 s16-20020a170902989000b00189b0a3cf4amr2540695plp.60.1673014438031; Fri, 06
 Jan 2023 06:13:58 -0800 (PST)
MIME-Version: 1.0
References: <20230106102018.20520-1-eiakovlev@linux.microsoft.com>
In-Reply-To: <20230106102018.20520-1-eiakovlev@linux.microsoft.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Jan 2023 14:13:46 +0000
Message-ID: <CAFEAcA-z7+X9-c43EmhoRBTrOYC9RtyHc5sgPamGRd_o+-tT_Q@mail.gmail.com>
Subject: Re: [PATCH v2] semihosting: add O_BINARY flag in host_open for NT
 compatibility
To: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
Cc: qemu-devel@nongnu.org, bmeng.cn@gmail.com, philmd@linaro.org, 
 alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62b.google.com
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

On Fri, 6 Jan 2023 at 10:21, Evgeny Iakovlev
<eiakovlev@linux.microsoft.com> wrote:
>
> Windows open(2) implementation opens files in text mode by default and
> needs a Windows-only O_BINARY flag to open files as binary. QEMU already
> knows about that flag in osdep and it is defined to 0 on non-Windows,
> so we can just add it to the host_flags for better compatibility.
>
> Signed-off-by: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> ---
>  semihosting/syscalls.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/semihosting/syscalls.c b/semihosting/syscalls.c
> index 508a0ad88c..b621d78c2d 100644
> --- a/semihosting/syscalls.c
> +++ b/semihosting/syscalls.c
> @@ -253,7 +253,7 @@ static void host_open(CPUState *cs, gdb_syscall_compl=
ete_cb complete,
>  {
>      CPUArchState *env G_GNUC_UNUSED =3D cs->env_ptr;
>      char *p;
> -    int ret, host_flags;
> +    int ret, host_flags =3D O_BINARY;

The semihosting API, at least for Arm, has a modeflags string so the
guest can say whether it wants to open O_BINARY or not:
https://github.com/ARM-software/abi-aa/blob/main/semihosting/semihosting.rs=
t#sys-open-0x01

So we need to plumb that down through the common semihosting code
into this function and set O_BINARY accordingly. Otherwise guest
code that asks for a text-mode file won't get one.

I don't know about other semihosting APIs, so those would need
to be checked to see what they should do.

thanks
-- PMM

