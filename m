Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33CD763A2DC
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 09:25:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozZSF-0002Lu-CW; Mon, 28 Nov 2022 03:25:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1ozZRy-0002K8-T9
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 03:25:14 -0500
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1ozZRx-0003Hk-6N
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 03:25:14 -0500
Received: by mail-lj1-x232.google.com with SMTP id l8so12213527ljh.13
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 00:25:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9VXoPe+c1Dtp1bbVtRbqjzL0X44srU0wmRv4mEEQMAk=;
 b=UzUj6nAn/itqmaOgKxkwfZVO0s7O5HTczLSbvb5Aww2xfonqCcZenv0ELUbykdOfLm
 UPr+vhlb/z/hEAp6w2lx9ozG9SboJEk0ruYiNdibeA90Vtag2syH9XVnsZBEDGXrIoju
 CsAvO7ELPZt/7L9ZfzlOFdTs0x1vNvSNTdWfOjwyQUZtwGL/jKi63ayCjuLMzcfymWKO
 Z9k0NXe4sWH7wped4AE/qaMEno1gARmevRqoKQeaetjNjiOnLWe//GE++JaLevuF3Ehm
 TZVFozWMFJdabPr4UBieuGlkJNLfOusjqTiNMbTptxBm7FIMu5Iw1QXEB7IWdjvr4Ya+
 qXsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9VXoPe+c1Dtp1bbVtRbqjzL0X44srU0wmRv4mEEQMAk=;
 b=8BpJP1CkA2Fu2/eHpzcPVCId1gy05nULxMG9UCjuYhk90bAOjwmNQfAx79/YwYsNw/
 xnGmlUgEJxeaCyzr1JOO0yyx+BvzKhF+XASOpalRg/EX5VC5iqEHQzif4KH0v8u2FEQS
 GxGxAIvlz2oyXnTYCUoe7CNShhI6JnmhqW2x+g53U2e8s274Gpm/0yXlFpMntvPqU01J
 0Ay9KjHrxhw6sfGvsb0VSgzn+w97iMWZTIPX6TX1zO2inxLZAoM9HzDtUHQOD08mACiY
 9mFa8kbDgdgCZoBQyhE0868wCJiq+l/0Ijw7R7c80Ch70nczvfJ7GPEAlDD8Bdljxq1n
 oyeQ==
X-Gm-Message-State: ANoB5pkuw9TZ3ThDL0a0RX2omSWSYcXi4Ojf8bXqbmWJ/0ps3wb0UNLf
 rvQVEyCcezTJuG5OaQ+fKhSoRWmjI14TVcvw5mM=
X-Google-Smtp-Source: AA0mqf6oCF1q1qqDR9XSzrCQ0cLL5L9PeimOZClDyltYJYq1WkhQJS+8zCjdb7nEzpVMJAKU1GttkL2fIV9BRI6JSNs=
X-Received: by 2002:a05:651c:1954:b0:277:43c4:a864 with SMTP id
 bs20-20020a05651c195400b0027743c4a864mr14972559ljb.463.1669623910718; Mon, 28
 Nov 2022 00:25:10 -0800 (PST)
MIME-Version: 1.0
References: <20221125154030.42108-1-philmd@linaro.org>
 <20221125154030.42108-2-philmd@linaro.org>
In-Reply-To: <20221125154030.42108-2-philmd@linaro.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 28 Nov 2022 12:24:59 +0400
Message-ID: <CAJ+F1CJUa0g6iAyO+MFp3AwCiLdmycHtHQevmXaMYs-h6BAWhg@mail.gmail.com>
Subject: Re: [RFC PATCH-for-7.2 1/4] hw/display/qxl: Have qxl_log_command
 Return early if no log_cmd handler
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Mauro Matteo Cascella <mcascell@redhat.com>, 
 Gerd Hoffmann <kraxel@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::232;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x232.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Hi

On Fri, Nov 25, 2022 at 7:41 PM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> Only 3 command types are logged: no need to call qxl_phys2virt()
> for the other types.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/display/qxl-logger.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/hw/display/qxl-logger.c b/hw/display/qxl-logger.c
> index 68bfa47568..1bcf803db6 100644
> --- a/hw/display/qxl-logger.c
> +++ b/hw/display/qxl-logger.c
> @@ -247,6 +247,16 @@ int qxl_log_command(PCIQXLDevice *qxl, const char *r=
ing, QXLCommandExt *ext)
>              qxl_name(qxl_type, ext->cmd.type),
>              compat ? "(compat)" : "");
>
> +    switch (ext->cmd.type) {
> +    case QXL_CMD_DRAW:
> +        break;
> +    case QXL_CMD_SURFACE:
> +        break;
> +    case QXL_CMD_CURSOR:
> +        break;
> +    default:
> +        goto out;
> +    }

That's a quite verbose way to repeat the case list below. Furthermore,
it shouldn't hurt to call qxl_phys2virt() next.


>      data =3D qxl_phys2virt(qxl, ext->cmd.data, ext->group_id);

But I understand better the change looking at patch 3, where you
introduce the size argument. Maybe mention the coming change in the
commit message?


Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

>      if (!data) {
>          return 1;
> @@ -269,6 +279,7 @@ int qxl_log_command(PCIQXLDevice *qxl, const char *ri=
ng, QXLCommandExt *ext)
>          qxl_log_cmd_cursor(qxl, data, ext->group_id);
>          break;
>      }
> +out:
>      fprintf(stderr, "\n");
>      return 0;
>  }
> --
> 2.38.1
>
>


--
Marc-Andr=C3=A9 Lureau

