Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F148F6523F3
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 16:50:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7erR-0004Qu-1A; Tue, 20 Dec 2022 10:48:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p7eqm-0004KX-Le
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 10:48:20 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p7eqf-0005xh-Gr
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 10:48:15 -0500
Received: by mail-pf1-x42a.google.com with SMTP id x66so8784706pfx.3
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 07:48:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zrmmls3sAWqwVFmhx2BSQWclMKMNgLbqjoKnsVs4SU0=;
 b=hAruqmH/zbukb0JJn3O8hM6OJa/CNfS9kZo4kXxsjBNzrZcnxBBvs/LIXFoCFndd8w
 lQnNjpmpO+8v1L5l2iLZJ981qjVND0ifnKYu7mjdIKEU2G7x+fUNYhOc7OZlAnHDegLt
 bH7BHqGhmoLdWA3G1NJ6+D+ZYrugrH+ULHmn6qqEIBTWYVW/DJINqhpsQ2O8jzZY7hlw
 Ydub+EI+Vb6FO6TeUFhPB2c/JhvcXjPUzS1R9JcMtvGKQpSnOA5froAppPcFsNdqxxFE
 JkQiv0qTtdc1WowaUGjAOWu8qZ2UiU67IqVDdZ8K5Z83d/B5WjhzW6SQpscIDMCGpaX1
 HmWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zrmmls3sAWqwVFmhx2BSQWclMKMNgLbqjoKnsVs4SU0=;
 b=f55nhwnt2QO/PvLSrk5ntVvPrfjvLbxbo18W/JRMq+yHCgnwMs/pOKD4j2dgYU6BMy
 pkJCyMBFaNwgyH+wmXPL9FGQYoda6Iecnhks0g+4E3mWxXmPIToHdX8M9NJ8bn36X7TL
 x6XwZafUoUw6B2B8cGS+GWtf/Iv28bxstisnt6vvY6KHWsI+BoL52siIdR20YHFrAjXC
 uxh1YNwL3Aqx4GNsZZfTCubJdWCQyFuBiGVyGQsBsB38EASoisAAMbJVOjhb3tL79Lxm
 04SCADsrFIZgwPvgMpxYu6s1yvIcAL/rpH6vGYp3rcgphL7KfN89nkVLBq247mXbMfMU
 xorQ==
X-Gm-Message-State: ANoB5pmsoykPAEtvosTAsYMsmVSgBsbWmJMsIQ+w/FI6DqN73HbmHK17
 4dryT3/f7hiIeQCklS8HEE0gqMExc4UPuvXEww+NiA==
X-Google-Smtp-Source: AA0mqf7776XKcmRkbE4pcDpILR2y2zG9lZR8r0QRspbgUGgUjuYuiHePBEUSBl42EUVhiC6T8vcUoXedV7b52O92hNE=
X-Received: by 2002:a63:c149:0:b0:477:86c1:640f with SMTP id
 p9-20020a63c149000000b0047786c1640fmr2448223pgi.231.1671551287869; Tue, 20
 Dec 2022 07:48:07 -0800 (PST)
MIME-Version: 1.0
References: <20221220144219.25254-1-philmd@linaro.org>
 <20221220144219.25254-3-philmd@linaro.org>
In-Reply-To: <20221220144219.25254-3-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Dec 2022 15:47:56 +0000
Message-ID: <CAFEAcA--drO58jSz5LeXzrc3pqpZgLwXh4KyocXBP3cgnTX-pA@mail.gmail.com>
Subject: Re: [PATCH 2/2] linux-user/signal: Silent -Winitializer-overrides
 warnings
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42a.google.com
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

On Tue, 20 Dec 2022 at 14:43, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> The target SIGIOT signal is sometimes aliased with SIGABRT,
> producing the following warning when compiling with -Wextra:
>
>   ../linux-user/signal.c:57:9: warning: initializer overrides prior initi=
alization of this subobject [-Winitializer-overrides]
>           MAKE_SIGNAL_LIST
>           ^~~~~~~~~~~~~~~~
>   ../linux-user/signal-common.h:165:9: note: expanded from macro 'MAKE_SI=
GNAL_LIST'
>           MAKE_SIG_ENTRY_SIGIOT
>           ^~~~~~~~~~~~~~~~~~~~~
>   ../linux-user/signal-common.h:128:41: note: expanded from macro 'MAKE_S=
IG_ENTRY_SIGIOT'
>   #define MAKE_SIG_ENTRY_SIGIOT           MAKE_SIG_ENTRY(SIGIOT)
>                                           ^~~~~~~~~~~~~~~~~~~~~~
>   ../linux-user/signal.c:56:41: note: expanded from macro 'MAKE_SIG_ENTRY=
'
>   #define MAKE_SIG_ENTRY(sig)     [sig] =3D TARGET_##sig,
>                                           ^~~~~~~~~~~~
>   <scratch space>:81:1: note: expanded from here
>   TARGET_SIGIOT
>   ^~~~~~~~~~~~~
>   ../linux-user/sh4/../generic/signal.h:26:34: note: expanded from macro =
'TARGET_SIGIOT'
>   #define TARGET_SIGIOT            6
>                                    ^
>   <scratch space>:55:1: note: expanded from here
>   TARGET_SIGABRT
>   ^~~~~~~~~~~~~~
>   ../linux-user/sh4/../generic/signal.h:25:34: note: expanded from macro =
'TARGET_SIGABRT'
>   #define TARGET_SIGABRT           6
>                                    ^
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  linux-user/signal-common.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/linux-user/signal-common.h b/linux-user/signal-common.h
> index 3e2dc604c2..a168ea4851 100644
> --- a/linux-user/signal-common.h
> +++ b/linux-user/signal-common.h
> @@ -124,7 +124,7 @@ static inline void finish_sigsuspend_mask(int ret)
>  #define MAKE_SIG_ENTRY_SIGSTKFLT
>  #endif
>
> -#if defined(SIGIOT) && defined(TARGET_SIGIOT)
> +#if defined(SIGIOT) && defined(TARGET_SIGIOT) && TARGET_SIGABRT !=3D TAR=
GET_SIGIOT
>  #define MAKE_SIG_ENTRY_SIGIOT           MAKE_SIG_ENTRY(SIGIOT)
>  #else
>  #define MAKE_SIG_ENTRY_SIGIOT

This suppresses the array entry in the case where TARGET_SIGABRT =3D=3D
TARGET_SIGIOT,
but the compiler error is I think complaining about the case where
host SIGABRT =3D=3D SIGIOT.

The MAKE_SIG_ENTRY macros are used to construct both the host-to-target sig=
nal
table in signal.c and also a target-signal-to-string table in strace.c;
so whether you want to check "target signals the same?" or "host signals
the same?" to suppress the overriding entry varies depending on which table=
.

However, this is all a bit moot because:
 (1) we deliberately do not enable the -Winitializer-overrides
     warning, because it produces false positives on the various
     cases where we want to use the coding pattern "initialize a range
     first, then override some specific members within it"
 (2) There is no Linux architecture where SIGIOT is not a synonym
     for SIGABRT, so the right thing to do here is just to
     delete MAKE_SIG_ENTRY_SIGIOT entirely.

thanks
-- PMM

