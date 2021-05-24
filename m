Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3081038E4B7
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 13:02:22 +0200 (CEST)
Received: from localhost ([::1]:51432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ll8Lk-00073G-GM
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 07:02:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ll8Ia-00013d-7u
 for qemu-devel@nongnu.org; Mon, 24 May 2021 06:59:07 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:56128)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ll8IY-0005QG-Eo
 for qemu-devel@nongnu.org; Mon, 24 May 2021 06:59:03 -0400
Received: by mail-wm1-x330.google.com with SMTP id b7so14079508wmh.5
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 03:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=cDEIfkafjx4IZTot/ktVccJL84I6JOZoa78xuqljIF8=;
 b=SQUSvAAY6wiWMyvhOLGIuBRqEH+nfVVUrDr/C8fy7ahX5/T1v2lE0qFWEr7nH8FHpP
 vi/jCgszl9wj55LguytFm2/xJ5eSNnscaLbmWd9emcVFa7jAC5j9Fa5fO93xnVnB6AnJ
 E0oEzP3XOoOgFGysby9tiEuZuI0GmbBhWdbUpAvCZVO6Oi0LUmwCORKXsJbmX+wuEIFK
 zVFP+4471D8VaHT8CRRCIdY810oEauStdFnMEbae1dOPCFtsJnL4mJ9tViwhiu94n/MM
 2iUPbPTmgVvtnWrol9jajG6+Hvvm8xNRiTcrfyzauvsJZs4OlXFvGfpTzEcUa5kJaMBB
 U1qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=cDEIfkafjx4IZTot/ktVccJL84I6JOZoa78xuqljIF8=;
 b=SilC0eIPQJqMjqsut9BYXB6ARJy9kY6FSmYRCT10VhtMX3Jy5m0iY/UT4ScWeUEjkg
 MAIPzdZqPfbI3B8wcRtkxlc8lTJsheAxJVi1oq1j3ktXrkFO0mtcrLXfTrZ3sL1sWbzO
 7Fkpx/sW/vpalvKvwnV6NdvsyodNhjTgiwjc/lzPRyDHhrfCcbnuZixUoVstcPVFkJeA
 jyiR4e7flct9E1tMceHZpQqsQXZ6v2yIepROffRGTrWbR4KE1Bfxbch7FHkIBqKbEQxG
 f23qp5eWHsu84Ml6f4HX0p9bL66nhiEh7iIJmUJ7zvR17Ew2Cd8WOKMfGb96V3sXfUff
 6yrQ==
X-Gm-Message-State: AOAM533wLJlh1H6VGkUEn0Ts1mp+Zv8eM22diY+bcbB5l/2TUTt6Phca
 ZpNL9envWF4Bh1iNtz6y+Ba2XA==
X-Google-Smtp-Source: ABdhPJzZ1hw7CJLPPZts4skYWhladVSWL+lFnnxlMNwhZqUEAfqrWm/SIUrmGWIjSW5QRL1qGDmmlQ==
X-Received: by 2002:a7b:c7ca:: with SMTP id z10mr19692528wmk.185.1621853940789; 
 Mon, 24 May 2021 03:59:00 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k132sm7809344wma.34.2021.05.24.03.58.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 03:59:00 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4A44C1FF7E;
 Mon, 24 May 2021 11:58:59 +0100 (BST)
References: <20210524045412.15152-1-yamamoto@midokura.com>
 <20210524045412.15152-3-yamamoto@midokura.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: YAMAMOTO Takashi <yamamoto@midokura.com>
Subject: Re: [PATCH 2/5] linux-uesr: make exec_path realpath
Date: Mon, 24 May 2021 11:55:41 +0100
In-reply-to: <20210524045412.15152-3-yamamoto@midokura.com>
Message-ID: <87r1hw4cuk.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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

> Otherwise, it can be easily fooled by the user app using chdir().
>
> Signed-off-by: YAMAMOTO Takashi <yamamoto@midokura.com>
> ---
>  linux-user/main.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/linux-user/main.c b/linux-user/main.c
> index 4dfc47ad3b..1f9f4e3820 100644
> --- a/linux-user/main.c
> +++ b/linux-user/main.c
> @@ -55,6 +55,7 @@
>  #endif
>=20=20
>  char *exec_path;
> +char exec_path_store[PATH_MAX];

Is there any point in keeping this as a static path rather than just
allocating it off the heap?

>=20=20
>  int singlestep;
>  static const char *argv0;
> @@ -610,7 +611,10 @@ static int parse_args(int argc, char **argv)
>          exit(EXIT_FAILURE);
>      }
>=20=20
> -    exec_path =3D argv[optind];
> +    exec_path =3D realpath(argv[optind], exec_path_store);
> +    if (exec_path =3D=3D NULL) {
> +        exec_path =3D argv[optind];
> +    }

  exec_path =3D realpath(argv[optind], NULL)
  exec_path =3D exec_path ? exec_path : argv[optind];

what situations would we expect realpath to fail and in those cases is
sticking to argv[optind] safe?

>=20=20
>      return optind;
>  }


--=20
Alex Benn=C3=A9e

