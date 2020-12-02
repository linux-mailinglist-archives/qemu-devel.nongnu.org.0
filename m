Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCAE2CC64A
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 20:11:31 +0100 (CET)
Received: from localhost ([::1]:57990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkXXG-00015h-H3
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 14:11:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kkXVO-000879-6Z
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 14:09:35 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:51926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kkXVL-0005we-LF
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 14:09:33 -0500
Received: by mail-wm1-x344.google.com with SMTP id v14so10403196wml.1
 for <qemu-devel@nongnu.org>; Wed, 02 Dec 2020 11:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=B4t4TI0qXKkqgd2iArksmnrI7I1RNnZLp3j4t9M9PKE=;
 b=YCbFjt3+lNewQ2kG4oSPjpMXuwB5LvuTLAkyMIO8QPLgvgKbZwSvcR0BWeMwZx/hlH
 bkeyqlH+NyXX9Bi7YUo0iQ891rdbCSW12ngDjJyeSbumRaK9ayUa9kZhd61O+3TbxMKN
 V2vsXWrDw+RY6b2bpR+0XNvM9YZykgMzKNwd55Ck546u1K0JqZVrZJyd+BvQEISezGDu
 mJdxub7wJMGw8GuEzSD2gXRoaO6VBeN0AFd2Ix0bNLYnlRCkb4LZW0rmeuCvIw901cew
 w6ZXT2dhgJjwbw8oXkMcP2fsI5mQOqC6qcVZQpo4OS26m2SUBu9X7fawTlOzCidHgUmB
 v09Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=B4t4TI0qXKkqgd2iArksmnrI7I1RNnZLp3j4t9M9PKE=;
 b=c8B4Hms5453VwzyGyqPR1T+ck1WGy4mj8AZaAxEVR030jE3/DUWfeqjbAfP1+zTplM
 DwNsQM21dk58egSmw82oBgFc79FuUc/P6+yRT3HT0kV+Y9j72Y9r0BAbD2FNtVMzenkX
 MLwSItp7xGJfeQ+7IONc8nvvJD2or0CHV/lb4IOKs/G87aaKVW9kBks+1jeJSjrzsHg6
 +ZHAK92dmxOZFCgH0Lu6u/8SqB70BIJ94LUjhsr4BQUt9roLEaqWEWsh57XAbjwjLumV
 EEVqguJX9gJvL8y+3cKzOsVVNlX2eQ4t9vrRqgO4LBXp94O/PeB2IxMnW7x2MwaF9r6b
 PEyA==
X-Gm-Message-State: AOAM531UvXfnhfwHHKxj5FWRLlwtpmjaqUHuc/kgws6f38UsU5pA+Ol6
 if1CwhNrztzus5mta5DDsYOxRA==
X-Google-Smtp-Source: ABdhPJwqM7brAzebZh2xWEeLjv6inOTzG9KpeZ9tXIL+dRdTiJwi4W33uwqIJtjfnto03ZVkaZQvng==
X-Received: by 2002:a7b:c198:: with SMTP id y24mr4644512wmi.151.1606936169494; 
 Wed, 02 Dec 2020 11:09:29 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f199sm3069034wme.15.2020.12.02.11.09.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Dec 2020 11:09:28 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2CEC01FF7E;
 Wed,  2 Dec 2020 19:09:27 +0000 (GMT)
References: <20201202153827.17446-1-alex.bennee@linaro.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: Re: [RFC PATCH] configure: add --without-default-features
In-reply-to: <20201202153827.17446-1-alex.bennee@linaro.org>
Date: Wed, 02 Dec 2020 19:09:27 +0000
Message-ID: <87k0u0rpnc.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x344.google.com
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
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> By default QEMU enables a lot of features if it can probe and find the
> support libraries. It also enables a bunch of features by default.
> This patch adds the ability to build --without-default-features which
> can be paired with a --without-default-devices for a barely functional
> build.
>
> The main use case for this is testing our build assumptions and for
> minimising the amount of stuff you build if you just want to test a
> particular feature on your relatively slow emulated test system.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  configure | 161 ++++++++++++++++++++++++++++++------------------------
>  1 file changed, 89 insertions(+), 72 deletions(-)
>
> diff --git a/configure b/configure
> index 18c26e0389..23fa6f9421 100755
> --- a/configure
> +++ b/configure
<snip>
> -oss_lib=3D""
> +oss_lib=3D"$default_feature"
<snip>

As oss_lib gets passed bare as the library to use this bit needs to be drop=
ped.

--=20
Alex Benn=C3=A9e

