Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE43686065
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 08:14:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pN5yJ-0003ID-2w; Wed, 01 Feb 2023 00:47:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1pN5y9-0003H0-DS; Wed, 01 Feb 2023 00:47:45 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1pN5wm-0006XB-Tv; Wed, 01 Feb 2023 00:47:41 -0500
Received: by mail-ej1-x635.google.com with SMTP id bk15so48084803ejb.9;
 Tue, 31 Jan 2023 21:46:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WnIT0gyJ7a7z0k/MzNTbP6PIX/2r5Z1ysnVnvNAbbrg=;
 b=OsJhzbwcPKDe8FG2pykn1jG8whalvpwo2YfR87t0zkhrYrr86Olw7a8/BvdrSqQ0oD
 2HV2WTB/2IrTyBAl7MOiYaQbTLEczRQfGUZXoVEHsXImcv1pmlw/P9+A68YR42E48SLV
 vunyTmFOCLrc7Tl84YUm5LWbGAzoSIdSCBhAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WnIT0gyJ7a7z0k/MzNTbP6PIX/2r5Z1ysnVnvNAbbrg=;
 b=IKC5qpoWozQpvb/BfWqIvu+u94dg1UmnVXVmAmcOdfTXtUA7m+kTlFuckOitHoY8kg
 z8plnncKrm0Hrzfqj5O8XO2vOU4aWUDI5YMSVVkXQwyD2XuLSfmiXOHtREa0glcA9P0v
 ZJivc7Sx9QSl+Q9Y3DM4EIn2KqwHi8va/iWDZWN2lLdO/l7zJZsI5QQQDVZSNQTSlQC7
 0ZujbCvpqzcwyESt73a/TCJlDw3TIPGDhzZol8PORxrokRenuK+7fagj2vypsw3n3zU6
 cwcdr35A8GTsWwa1j4VNL7MXyrY7lvGeh88BSOIEVlmDJZtPOgeOVWIxm96IR1twUbEX
 CVOw==
X-Gm-Message-State: AO0yUKUvrdYSB2TiAjH/8ZTKVxlPE03ekiKWjdOXgeCGXMVLGrdJWyKl
 rIxxbFPjVLH9hnABq7QVTPZ5dgqvjrKe/OSOSyf/S2sq
X-Google-Smtp-Source: AK7set9FcbzThg/7R/HM/0n0mCd1jEOgszkhi/+W/e0WsnMOx7KFW5vmmrSliR2VxIqA0wnKCuSxdmExlBl2NqsFk50=
X-Received: by 2002:a17:906:e2d8:b0:88a:119:4d98 with SMTP id
 gr24-20020a170906e2d800b0088a01194d98mr285640ejb.111.1675230367114; Tue, 31
 Jan 2023 21:46:07 -0800 (PST)
MIME-Version: 1.0
References: <20230119123449.531826-1-clg@kaod.org>
 <20230119123449.531826-10-clg@kaod.org>
In-Reply-To: <20230119123449.531826-10-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 1 Feb 2023 05:45:54 +0000
Message-ID: <CACPK8XeiDT9N9RbdEat4WyC=HPyTuNL+1-oM9WLBCgETUxkvTA@mail.gmail.com>
Subject: Re: [PATCH 09/25] hw/core/loader: Remove declarations of
 option_rom_has_mr/rom_file_has_mr
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Eduardo Habkost <ehabkost@redhat.com>, Marcel Apfelbaum <marcel@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=joel.stan@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Thu, 19 Jan 2023 at 12:37, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> These globals were moved to MachineClass by commit 71ae9e94d9 ("pc: Move
> option_rom_has_mr/rom_file_has_mr globals to MachineClass"). Finish clean=
up.
>
> Cc: Eduardo Habkost <ehabkost@redhat.com>
> Cc: Marcel Apfelbaum <marcel@redhat.com>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  include/hw/loader.h | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/include/hw/loader.h b/include/hw/loader.h
> index 70248e0da7..1384796a4b 100644
> --- a/include/hw/loader.h
> +++ b/include/hw/loader.h
> @@ -251,9 +251,6 @@ void pstrcpy_targphys(const char *name,
>                        hwaddr dest, int buf_size,
>                        const char *source);
>
> -extern bool option_rom_has_mr;
> -extern bool rom_file_has_mr;
> -
>  ssize_t rom_add_file(const char *file, const char *fw_dir,
>                       hwaddr addr, int32_t bootindex,
>                       bool option_rom, MemoryRegion *mr, AddressSpace *as=
);
> --
> 2.39.0
>
>

