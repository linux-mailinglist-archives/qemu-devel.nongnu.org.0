Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84290302685
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 15:54:04 +0100 (CET)
Received: from localhost ([::1]:32904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l43Fj-0000yJ-7n
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 09:54:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l43E9-0008KL-Ph
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 09:52:27 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:52277)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l43E5-0005pr-Ji
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 09:52:25 -0500
Received: by mail-wm1-x32a.google.com with SMTP id m187so11141406wme.2
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 06:52:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=pP2d/CxU6Fm4SJOOhY323kT6MmrxyIazX+ILLpnLwzA=;
 b=rsfczxhZ8erRLcSOe7jym5r5T2hhVfWtQ024+LJMnbN38/aqrTFy3ZLIcj/rjxOCpP
 xc80QPbC4T+K33S1AUYbh1ZblBGRRuf75U236kY2K4kw214FIHqbNC3io9ECg03O91fc
 Yan18ka6HDkVrzBpNEmLWSc6HaQsKR5DaElGaYUTzl/3PtKhLJHb0pcX36OnxbxSHhDi
 QSejWrHbjwuL1ZuGVxR19oe4CWwfYmF4bOYpUAm4+nlpdGjeUuaiJxMyg2e/finDBy6y
 FdEZKAFakKGlebFphfAOfPMsx8JTC4yGsnRX/Y+xKZ8p+3KLVZ0uuwIuVOVAa+jzx+63
 qDZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=pP2d/CxU6Fm4SJOOhY323kT6MmrxyIazX+ILLpnLwzA=;
 b=HQuY6z70myni8L33DpQvlTfMrJ2BAoHu/bmiZINFEUwumuSF3O+I77BySqYUMznCBY
 1dyljdlX6c/K1cDutSrNWZsZqFc8oE3NijWqi2F75Qn3adZrTJTEmlB0wOZoHDQdU9L9
 zWTBZkm21dFgnO8HE5CE0JqLBnD+S9TrUJGk0IWMAeJfY88VZwPKbP5mHIxSZCeePP9x
 GrCqcIZ3ROe6LY2DqNxBR9yNUpEMG+5MHOxWHQAGvNLdQtnlFzqk+YZEh0UxMJnEs31f
 ulJy5RRZg8Z2g5T0+XpJDXV/oQ4QzdVUqBRbL2zW2iLaXOpNtq8LOftHdukhIA0fyL+m
 i/Lw==
X-Gm-Message-State: AOAM532EE4s9R8VhUG44ZAaNWpSQCpa8ovJWovojACOT9RvwqI4iayPY
 FnkMSQWMH7bju8fb+NIIUiKhvA==
X-Google-Smtp-Source: ABdhPJzUdR7UY7lg0QjKJjNyCMz0+0qlmqEPmTBrbt7IJPa2/EzI7srG0it5qVQAkQwrMs4kSJcXoA==
X-Received: by 2002:a05:600c:2281:: with SMTP id
 1mr500996wmf.150.1611586339097; 
 Mon, 25 Jan 2021 06:52:19 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d5sm20794861wrs.21.2021.01.25.06.52.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 06:52:17 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D9B0A1FF7E;
 Mon, 25 Jan 2021 14:52:16 +0000 (GMT)
References: <20210122204441.2145197-1-philmd@redhat.com>
 <20210122204441.2145197-2-philmd@redhat.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 01/12] configure: Only check for audio drivers if
 system-mode is selected
Date: Mon, 25 Jan 2021 14:52:13 +0000
In-reply-to: <20210122204441.2145197-2-philmd@redhat.com>
Message-ID: <87ft2pkr1b.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Acked-by: Gerd Hoffmann <kraxel@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  configure | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/configure b/configure
> index 6f6a319c2f6..a4476d457e0 100755
> --- a/configure
> +++ b/configure
> @@ -2324,6 +2324,12 @@ if test -z "$want_tools"; then
>      fi
>  fi
>=20=20
> +##########################################
> +# Disable features only meaningful for system-mode emulation
> +if test "$softmmu" =3D "no"; then
> +    audio_drv_list=3D""
> +fi
> +
>  ##########################################
>  # Some versions of Mac OS X incorrectly define SIZE_MAX
>  cat > $TMPC << EOF


--=20
Alex Benn=C3=A9e

