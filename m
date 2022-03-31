Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 637144ED9AB
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 14:33:27 +0200 (CEST)
Received: from localhost ([::1]:48140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZtzS-0003XA-1T
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 08:33:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nZtu3-0000vy-Hz
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 08:27:51 -0400
Received: from [2607:f8b0:4864:20::1129] (port=44309
 helo=mail-yw1-x1129.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nZttz-0000Zb-PE
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 08:27:48 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-2eafabbc80aso36281647b3.11
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 05:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8M8WV7OCxFfAxCR+JybsA7NGqE2IdJcuU5mjyXBf0u8=;
 b=cwa692OKLPUrfYhxrEXiED4CopaJ6ldiMrE1bGZY6DxhWiTWTb6RXODjentWeR3pi9
 dMa1JjBCSL/bhkNVsokpuKPcGCC+sWhRyB3yLGyREKLMZNxvZ4U6D5chCX6rYsEgxjQH
 0VTW9KqsdVXBOBspasYrh4ub3tvRyC0VPRVbsSD+DhCuLXSnIFXV4emD2pIaLW+ZXv9X
 2lU8c0dEpLSzRg6X4R74tqU4la7HH50qZyxmohNY3RsljSUCkxqtqWZZ+fyhT26pHylC
 NlBwmWKd0IahEQNSZAhzTZag9sSY7qy4TGuVBu6wpbYs5I/KPENLw+w9nAODI3ZGHC4Q
 BUkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8M8WV7OCxFfAxCR+JybsA7NGqE2IdJcuU5mjyXBf0u8=;
 b=CRtnpW5xHaqHZ3u7q3EXqxG07CvRaksWtyZ3BPt02EZ+5znOWccgfYn8De3zvG2uAi
 52ca6Ib9E335z/zhVwyaOrQ8Au7ky+FipMvkfgyACPvU7G81a8hZLNoJHs78RL1cKx8H
 77TdXngh7+m9ZQ7WYoTLniOUcKN7//AvYGtonORE4l2rUmzm8YXrdOumLUnGBqt0g1/7
 4QUcPF/mHcEN0TA5y6hUokjrQIHTPXps4+jWVS3CpBhi1LD+Ehci4BElxDxKAFsZCD/3
 XmQnueKwz0wof1dqst0fTCzva4Palt+8YiwyjmRhv2wW9IOBtEwfydmIncjGvmHG9z3T
 w2xg==
X-Gm-Message-State: AOAM531SLAYDANRZbWiP3Uvz5EBL/Y+XmuZAbMCzRKXoFrNlzP6JkDLh
 BcioMXyYSSmHw7K3rdOCRAWhbgV1TVqaUQ6n3oLUsQ==
X-Google-Smtp-Source: ABdhPJySBIGXja5aCDOQQJns0V19YWptSFEPgxudjrL4rr81yE4jUuDCQ2tojsv8jw9PwfN0K/4JLQg4FiRTJrTx2Zc=
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr4672159ywb.257.1648729666766; Thu, 31 Mar
 2022 05:27:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220331122652.188700-1-berrange@redhat.com>
In-Reply-To: <20220331122652.188700-1-berrange@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 31 Mar 2022 13:27:35 +0100
Message-ID: <CAFEAcA99U6RaM_mh4C-mY1RcEzyJ-+oYED0K5iPQrHCp4D5bHQ@mail.gmail.com>
Subject: Re: [PATCH] hw/char: fix qcode array bounds check in ESCC impl
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1129
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 31 Mar 2022 at 13:27, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
>
> There was an off-by-1 in the qcode conversion array bounds
> check.
>
> Fixes: e709a61a8fe1076a487376fd657544418a38ba06
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  hw/char/escc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/char/escc.c b/hw/char/escc.c
> index 8755d8d34f..17a908c59b 100644
> --- a/hw/char/escc.c
> +++ b/hw/char/escc.c
> @@ -828,7 +828,7 @@ static void sunkbd_handle_event(DeviceState *dev, Qem=
uConsole *src,
>          }
>      }
>
> -    if (qcode > qemu_input_map_qcode_to_sun_len) {
> +    if (qcode >=3D qemu_input_map_qcode_to_sun_len) {
>          return;
>      }

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

