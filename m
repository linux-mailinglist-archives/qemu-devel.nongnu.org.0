Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F4A3DD464
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 12:57:06 +0200 (CEST)
Received: from localhost ([::1]:53830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAVd3-0001b2-8H
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 06:57:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mAVbs-0000KN-GF
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 06:55:52 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:33577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mAVbr-00032D-4F
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 06:55:52 -0400
Received: by mail-wr1-x432.google.com with SMTP id k4so10139481wrc.0
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 03:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=etUrZVvw++lfezbwTA3TYBdAE8sYD9f206rDQ0ldgfA=;
 b=xH6ZN7E/g/45ZWGY8FxFWFFxoSYWA8+BGf0M3fSzeG3y4EVn0z175ayqoUMRIjskZk
 29JKUoPs8NtsXvsSF+JQ0Wp2KtHzZvZIgMAhttNoM+QHJHx4WGt80Sz7egJl+HsUr0ub
 FtBwsbOK9aUYS4rxiJ7tQpVs3GyfVYTlmubPRzHW/g+HXcYX5+9nG9YX9ABQTdCxtJw+
 3dASuSmVngRpEmvcPdeYBPgItAAlJwuvhUahRYX5YQdSkEBVemERDh+QxxsyxjyT4i2k
 doG2Kp7hXIlO+lPJZ11MztEw33+Ph0nMDirwEymsWiFYAsT2aqksQnbDay3KPIz6g/DF
 2p5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=etUrZVvw++lfezbwTA3TYBdAE8sYD9f206rDQ0ldgfA=;
 b=A1MrS2L9fL/8CXg3Mv7XIACX+/eNu/JO+ewNblqJdY7H1mcU9tF5M97tJXmG7QtMSG
 lhy7D95lVzKJ0JRGGCjNzbcrjJbmuRNq1O3P0c+9lz60dOKJnlvcuIFz2wll61mDJjuW
 9nxhPHgUbLJCMtibOzn3H/SASCsZGaJd+6VNLVgq8AvNXo1C0qjCqErRUWBFvz7unfhv
 46hoezN3f3YCr0eOS5jwpjNiuYnTITS0yKjKC6qxdZDOz7rnVEG3Nkphi4TNHqWSwcoK
 96D/UUMHZcPMnBgRKuU7sR1adtZttCvEy/v6GcZmCtJqXvXMQXHTIzhOoaSMEUPR6Jn/
 Sc1w==
X-Gm-Message-State: AOAM533Y5BixAs1K43lYaY7qp9Ls3Vtjo3TbyaWP5ZtSpyw6twBY/i4F
 fQ5F3lNLN0zbv6NqRMSnK5y7pQ==
X-Google-Smtp-Source: ABdhPJxjSiBzLXY0BcI+aHeiCAgojTz0u3UfZTWymHmJOaexcTcmP+C4zl/iWuFE4j4WoQywd31bPA==
X-Received: by 2002:adf:f590:: with SMTP id f16mr16359077wro.162.1627901749765; 
 Mon, 02 Aug 2021 03:55:49 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 18sm3491528wmo.2.2021.08.02.03.55.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 03:55:48 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5C6F31FF96;
 Mon,  2 Aug 2021 11:55:48 +0100 (BST)
References: <20210730135817.17816-1-ma.mandourr@gmail.com>
 <20210730135817.17816-14-ma.mandourr@gmail.com>
User-agent: mu4e 1.6.1; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [PATCH v4 13/13] docs/deprecated: deprecate passing plugin args
 through `arg=`
Date: Mon, 02 Aug 2021 11:53:49 +0100
In-reply-to: <20210730135817.17816-14-ma.mandourr@gmail.com>
Message-ID: <87h7g8glor.fsf@linaro.org>
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
Cc: "reviewer:Incompatible changes" <libvir-list@redhat.com>, cota@braap.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Mahmoud Mandour <ma.mandourr@gmail.com> writes:

> Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
> ---
>  docs/system/deprecated.rst | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
> index e2e0090878..7ae6f1f727 100644
> --- a/docs/system/deprecated.rst
> +++ b/docs/system/deprecated.rst
> @@ -126,6 +126,13 @@ other options have been processed.  This will either=
 have no effect (if
>  if they were not given.  The property is therefore useless and should no=
t be
>  specified.
>=20=20
> +Plugin argument passing through ``arg=3D<string>`` (since 6.1)
> +''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> +
> +Passing TCG plugins arguments through ``arg=3D`` is redundant is makes t=
he
> +command-line less readable, especially when the argument itself consist =
of a
> +name and a value, e.g. ``-plugin plugin_name,arg=3D"arg_name=3Darg_value=
"``.
> +Therefore, the usage of ``arg`` is redundant.

We should probably also mention that single word arguments are treated
as booleans and prefer the flag=3Don form. Anyway:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

