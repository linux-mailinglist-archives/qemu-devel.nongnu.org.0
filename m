Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B928730EFA
	for <lists+qemu-devel@lfdr.de>; Fri, 31 May 2019 15:39:07 +0200 (CEST)
Received: from localhost ([127.0.0.1]:43653 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hWhkQ-0003EY-F1
	for lists+qemu-devel@lfdr.de; Fri, 31 May 2019 09:39:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60751)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1hWhib-0002Ps-UG
	for qemu-devel@nongnu.org; Fri, 31 May 2019 09:37:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1hWhia-0000jS-UQ
	for qemu-devel@nongnu.org; Fri, 31 May 2019 09:37:13 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:43685)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
	id 1hWhia-0000iR-M6
	for qemu-devel@nongnu.org; Fri, 31 May 2019 09:37:12 -0400
Received: by mail-wr1-x442.google.com with SMTP id m6so864415wrj.10
	for <qemu-devel@nongnu.org>; Fri, 31 May 2019 06:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=references:user-agent:from:to:cc:subject:in-reply-to:date
	:message-id:mime-version:content-transfer-encoding;
	bh=onMviO6dy63F+CsaIk1EvspAijF4lWoYXbklFzDhi2A=;
	b=N/uy0S+cLEdXTO7bAEv+Ilmk+xmzMvF7HtP8qYEX7ZZIpvTWFyimXFjHf4oVy2+ue1
	Lfc8RkH0v1bd2h5rOVlQ0P+DfJ2fEnXIJoftqn+hPrUtenz33AaEyeXvm51KKfpHFERZ
	KB0DjT/KKDBQ8BUPXNRxOQUkrGl3fgPg9XRkyAZVW8re2qMUbt+DgTW1wm9OTOkfVj3o
	GTz/DRMmk5rFXE0WmpC9I7QJGpWwet2tie8OMQaiDQwynFpOr779uaGV6ax2N3AdZCjK
	l0UFaBWLOyhJN8T8xiLEebMjmKRWGTaE80VMtv3Pnfo55Xmv/sBg3L3phLuFkePmINz1
	hEpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:references:user-agent:from:to:cc:subject
	:in-reply-to:date:message-id:mime-version:content-transfer-encoding;
	bh=onMviO6dy63F+CsaIk1EvspAijF4lWoYXbklFzDhi2A=;
	b=bImQKCqqtLVek32gV0jsAspyizQm0ey5FQQEqgRMiqbB9hUH6CCw5VEk81KgRJP3I+
	GP4SFgiFwrL/k8FRHoVugGiS2roguk0bqLm765/XLP4AHvILKdmTlrY9/2pkScTkYFO2
	7I8ipLCEP13oNOH1e5Bsz16bp11MLEi8xjagPx0MGc3hRORRWhJEJsnjPpDjoWVMrOGd
	AqPMgNzrSTnoxpFnTVSGGHodN5a6LX3MNcOi8+euCXivA5o/F8bdlAncM+FlzpBvXQxZ
	eUjKpKd8o1TMjl3kErZYMatQblPWwYt1x3jSgcjy1MbkAZTr4pXdcTgPerdGYyW8ZlT6
	MiIA==
X-Gm-Message-State: APjAAAV8E2DLBjaXJf2jD1ft/w9uWKS7IBgJnR1q3aRoCkwE2yh7Vz+f
	qABSD3yWbcxGf0ttdhgZ90h7Hg==
X-Google-Smtp-Source: APXvYqxSYn9SqHFndOkFZXKui7QJ0Cw7VTv17WhQFnP1eG7KZjPAsWPxVlpREQh1m9qGQDKmvq2t/A==
X-Received: by 2002:adf:e8cb:: with SMTP id k11mr6550785wrn.244.1559309831335; 
	Fri, 31 May 2019 06:37:11 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id
	b69sm1647862wme.44.2019.05.31.06.37.09
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 31 May 2019 06:37:09 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 066691FF87;
	Fri, 31 May 2019 14:37:09 +0100 (BST)
References: <20190529064148.19856-1-arilou@gmail.com>
	<20190529064148.19856-9-arilou@gmail.com>
User-agent: mu4e 1.3.2; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Jon Doron <arilou@gmail.com>
In-reply-to: <20190529064148.19856-9-arilou@gmail.com>
Date: Fri, 31 May 2019 14:37:08 +0100
Message-ID: <87zhn2924b.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: Re: [Qemu-devel] [PATCH v12 08/20] gdbstub: Implement set register
 (P pkt) with new infra
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Jon Doron <arilou@gmail.com> writes:

> Signed-off-by: Jon Doron <arilou@gmail.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  gdbstub.c | 39 ++++++++++++++++++++++++++++++---------
>  1 file changed, 30 insertions(+), 9 deletions(-)
>
> diff --git a/gdbstub.c b/gdbstub.c
> index 572222bfa4..fc9526b3f5 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -1651,6 +1651,27 @@ static void handle_remove_bp(GdbCmdContext *gdb_ct=
x, void *user_ctx)
>      put_packet(gdb_ctx->s, "E22");
>  }
>
> +static void handle_set_reg(GdbCmdContext *gdb_ctx, void *user_ctx)
> +{
> +    int reg_size;
> +
> +    if (!gdb_has_xml) {
> +        put_packet(gdb_ctx->s, "E00");
> +        return;
> +    }
> +
> +    if (gdb_ctx->num_params !=3D 2) {
> +        put_packet(gdb_ctx->s, "E22");
> +        return;
> +    }
> +
> +    reg_size =3D strlen(gdb_ctx->params[1].data) / 2;
> +    hextomem(gdb_ctx->mem_buf, gdb_ctx->params[1].data, reg_size);
> +    gdb_write_register(gdb_ctx->s->g_cpu, gdb_ctx->mem_buf,
> +                       gdb_ctx->params[0].val_ull);
> +    put_packet(gdb_ctx->s, "OK");
> +}
> +
>  static int gdb_handle_packet(GDBState *s, const char *line_buf)
>  {
>      CPUState *cpu;
> @@ -1895,15 +1916,15 @@ static int gdb_handle_packet(GDBState *s, const c=
har *line_buf)
>          }
>          break;
>      case 'P':
> -        if (!gdb_has_xml)
> -            goto unknown_command;
> -        addr =3D strtoull(p, (char **)&p, 16);
> -        if (*p =3D=3D '=3D')
> -            p++;
> -        reg_size =3D strlen(p) / 2;
> -        hextomem(mem_buf, p, reg_size);
> -        gdb_write_register(s->g_cpu, mem_buf, addr);
> -        put_packet(s, "OK");
> +        {
> +            static const GdbCmdParseEntry set_reg_cmd_desc =3D {
> +                .handler =3D handle_set_reg,
> +                .cmd =3D "P",
> +                .cmd_startswith =3D 1,
> +                .schema =3D "L?s0"
> +            };
> +            cmd_parser =3D &set_reg_cmd_desc;
> +        }
>          break;
>      case 'Z':
>          {


--
Alex Benn=C3=A9e

