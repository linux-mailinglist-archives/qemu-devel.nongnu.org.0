Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5A16C2B62
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 08:31:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peWRt-0001qr-65; Tue, 21 Mar 2023 03:30:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1peWRr-0001qQ-0g
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 03:30:23 -0400
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1peWRp-00010C-9s
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 03:30:22 -0400
Received: by mail-lf1-x134.google.com with SMTP id j11so17907075lfg.13
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 00:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679383818;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8eBCWRR7DuII9lGMAh5QFvxnApWHfcj3gCzC7x9FHtM=;
 b=afKufYPL1mP7OFFWSP6UD5VXWgKLS93lOC+FTvyCBQMi56Lp6jt7fdms05qrQ37Iyi
 kuNqjuvsnH4iB1z3WK1EFSMwrLT8pJESa1IDhsVEG4NprUW2qaOI63DPBUGainLjWVAg
 DFX/WE/GoNRr3HZxaTzuhRc5PQfLe/gKl1J9K6uBS+Ek/c3WDlDP8olbXJhZUTXihHIu
 VPnjWrVcbiPRQRG9CRhu3GVGQmU/5mDE3n42TH4NSenYnKmJLhDdqfY93+LDxduSAZaE
 dWlrIlO45Y9Z+12xmP8b8zCMozcp4xWDcWN7cPur9RZIfYtkBPCFYYBnivovXE6NJbf8
 pSbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679383818;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8eBCWRR7DuII9lGMAh5QFvxnApWHfcj3gCzC7x9FHtM=;
 b=LZpVPj1Yp0mSIdEi/GS+RrHDoCA1OG1RykMAdYRp/yr22ied2MlKs/QrEZm19FDA1R
 32ZMKvZb/yH84wQbVgRhy5tGfqGMIaafYn0RbnN2VfrWasmg9dfchSzbiK3Dyi8MImtD
 hWlGbrmzGcoUyf7iYMEMv3oXDAeppNIQJ3i/bujUk6uV3GXenAds1C/tgNWOx5RedHHk
 XFVb3Pujs7gWsKnvQZPP124d4RMh/FRLvk8ZxklGOwsmxTEK9x4xQnmcqYH02E8uBeg7
 2SnwtV/ieffSexSRls4YnZpdcXTgL7QfT/cINS5N2+arZffPZr3/gvW0CbfWCMJU88v3
 ZDwg==
X-Gm-Message-State: AO0yUKXvyV3ESPLW5vPo8TUrYeKoO5XDMetLjU6WlPfGZRJhdF7S99M9
 G0TNTKuXmnyW718SoeC8ShG9gizsvvz/NLA4WN6tRVDYurQ=
X-Google-Smtp-Source: AK7set8/uitNLekZgq2IOoYSRgKJ6D9DxQ4pcv9anQ5NUTkBI7c74iqC29xFgxMDT4FaIKYqCC1ObD84/wEcUz9uE+0=
X-Received: by 2002:ac2:41cf:0:b0:4e8:9988:f8ab with SMTP id
 d15-20020ac241cf000000b004e89988f8abmr485429lfi.11.1679383818619; Tue, 21 Mar
 2023 00:30:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230307123027.2485499-1-marcandre.lureau@redhat.com>
In-Reply-To: <20230307123027.2485499-1-marcandre.lureau@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 21 Mar 2023 11:30:06 +0400
Message-ID: <CAJ+F1CKqPfU6_L+LYty-di2BDNMBrHPynOEGc1sTFOH2PgCeBg@mail.gmail.com>
Subject: Re: [PATCH] .editorconfig: set max line at 70 chars for QAPI files
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x134.google.com
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

On Tue, Mar 7, 2023 at 4:32=E2=80=AFPM <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> This seems to be the preferred style.
>
> The EditorConfig property is not supported by all editors:
> https://github.com/editorconfig/editorconfig/wiki/EditorConfig-Properties=
#max_line_length
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  .editorconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/.editorconfig b/.editorconfig
> index 7303759ed7..8c5ebc6a1b 100644
> --- a/.editorconfig
> +++ b/.editorconfig
> @@ -47,3 +47,4 @@ emacs_mode =3D glsl
>  [*.json]
>  indent_style =3D space
>  emacs_mode =3D python
> +max_line_length =3D 70

ack or nack ?

