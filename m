Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7275D375BAE
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 21:25:40 +0200 (CEST)
Received: from localhost ([::1]:51526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lejcx-0002sp-HD
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 15:25:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lejaA-0001UQ-Pa
 for qemu-devel@nongnu.org; Thu, 06 May 2021 15:22:48 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:37516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1leja2-0001sh-TN
 for qemu-devel@nongnu.org; Thu, 06 May 2021 15:22:44 -0400
Received: by mail-wr1-x436.google.com with SMTP id z6so6777389wrm.4
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 12:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=OcGko0AZpfeOMrm5jT5N9J347dkqKIUp28FiXKFtwdk=;
 b=fELVnzK2+xFRsnRGPh//ft7E2TmxIFR18SqhN97yrkYySqfxwRVM7nMPS1kmx9/BX/
 d8lCU2LfQu25BYAvEswZgx22e/LoyRz6+EIYTY4eU4ShXsZS/nYDa5+gP/KWIDKszo/c
 M0WLyrc3i91S1+Dy53iMsyCIuA2sDNPcVDcPjPC7qyxyKhKP25ltlUClufgWfb8yGrCk
 nuYBeT2/NCmJpSWDs9bpLugSq6FqorqXdwEsuh+hTexVA3ScBlU6LaLTbyHaC3qGg09f
 eP09zF4EfJaaw1dnt1Ubroq5jzpysEQSFMaOeh6uqcEe9kqH31NAzOmISGT8QpyI/XLS
 P2nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=OcGko0AZpfeOMrm5jT5N9J347dkqKIUp28FiXKFtwdk=;
 b=gWIqpHuiwJV7dd5VfkPQVar/3YcL/f2jOp6inGfAMzQMtQofINKhj6d+cmefRrokkL
 InF2dqrSCO80xFBLXJ4XSQh+b8/G3ZfZu5r6gw7nsKolVT8kqk9x9nTet2uno186Z4Pu
 9nAujcziHvR5XYFKrsvcXJXH0/mS2hWhsebQX7pzAKLTcpPk2yJ04hOVUWwWWu2iebHP
 RgcNYnzqeIkE26fUTiCdqju3df9luV4WOwHSejllQPLvwhLRBv9X7eCp3tNb752sLRsk
 x0rqT0JFElsKYKdHb/RMKmzvz+STaaPKnWTOmyu4e85Uog/KqtiWg8wSL5DhltP1QUMK
 RDyA==
X-Gm-Message-State: AOAM532xmoVJ7OxcAoRBHpmv7OeHK7ff77zooQhVYRqt05WOW+YL6O0w
 cJ0RSAKvqABlsLOOwkJeN83A4g==
X-Google-Smtp-Source: ABdhPJz7hohkJdA1qQSV8cIlvzUqbOP6alUWSu9tndMQ8CfhwlXE/7/aWSvUceGtoPB3tbC5F9TWzw==
X-Received: by 2002:a5d:6648:: with SMTP id f8mr7554311wrw.396.1620328955527; 
 Thu, 06 May 2021 12:22:35 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t7sm5572382wrw.60.2021.05.06.12.22.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 May 2021 12:22:34 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 811051FF7E;
 Thu,  6 May 2021 20:22:33 +0100 (BST)
References: <20210506133758.1749233-1-philmd@redhat.com>
 <20210506133758.1749233-8-philmd@redhat.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 7/9] gdbstub: Replace alloca() + memset(0) by g_new0()
Date: Thu, 06 May 2021 20:22:01 +0100
In-reply-to: <20210506133758.1749233-8-philmd@redhat.com>
Message-ID: <87v97vmzuu.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kvm@vger.kernel.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> The ALLOCA(3) man-page mentions its "use is discouraged".
>
> Replace the alloca() and memset(0) calls by g_new0().
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Please see:

  Subject: [ALT PATCH] gdbstub: Replace GdbCmdContext with plain g_array()
  Date: Thu,  6 May 2021 17:07:41 +0100
  Message-Id: <20210506160741.9841-1-alex.bennee@linaro.org>

which also includes elements of 6/9 which can be kept split off.

> ---
>  gdbstub.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/gdbstub.c b/gdbstub.c
> index 7cee2fb0f1f..666053bf590 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -1487,14 +1487,13 @@ static int process_string_cmd(void *user_ctx, con=
st char *data,
>          if (cmd->schema) {
>              int schema_len =3D strlen(cmd->schema);
>              int max_num_params =3D schema_len / 2;
> +            g_autofree GdbCmdVariant *params =3D NULL;
>=20=20
>              if (schema_len % 2) {
>                  return -2;
>              }
>=20=20
> -            gdb_ctx.params =3D (GdbCmdVariant *)alloca(sizeof(*gdb_ctx.p=
arams)
> -                                                     * max_num_params);
> -            memset(gdb_ctx.params, 0, sizeof(*gdb_ctx.params) * max_num_=
params);
> +            gdb_ctx.params =3D params =3D g_new0(GdbCmdVariant, max_num_=
params);
>=20=20
>              if (cmd_parse_params(&data[strlen(cmd->cmd)], cmd->schema,
>                                   gdb_ctx.params, &gdb_ctx.num_params)) {


--=20
Alex Benn=C3=A9e

