Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5EA64A2E3
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 15:10:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4jOZ-0002yH-3a; Mon, 12 Dec 2022 09:03:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1p4jOR-0002wY-OV
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 09:02:56 -0500
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1p4jOP-00012w-SP
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 09:02:55 -0500
Received: by mail-lf1-x135.google.com with SMTP id q6so8674910lfm.10
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 06:02:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7nnO+m7d2Tp5prtj23yWaMhueRFkZ9TJoDYNxCgXscc=;
 b=Sri2KdpThFgwjy0pE/lemXauiUNNcxG3pBshP5Mae5muobbVGrCNl/N9JQ3+jsPOHk
 6xk16unq0RxTUgiW1ze9MCyfFJSTGl/ZTX4+KN83SUm224QJ5VniYZKLwNN5ncmQ3Pwy
 ZTNI0AUPGRgZJ9yTHBKfTWguNOAGOPBf5+pUO4uKM5ykhNEpozr2k7WdcGK4cJpz/Klo
 8gc+TxYzATKLtu1own02upyESd/NRuC0YMBMtvWLeKqGNQWHidfaws/1UqpLb9IKmzh7
 pd/M0isq0pHlLbyZpbU1M0VhiyS362k1uINbCjlJRyDRRRghKQsPWpYGU0o+6NXGGlYw
 0ATA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7nnO+m7d2Tp5prtj23yWaMhueRFkZ9TJoDYNxCgXscc=;
 b=utU60AJ2Fjo2DzuclK6H544Fa0G1Z9/CODcgN9ABjRMaUuxUmCR+IihlTyxMhVkp23
 pDSTrIUCmRoDtjomkrw1DysWRlD4wRkIMoaBr9odMB/QnAKUhqKc3LEB1S8rQ8Gzo0d1
 81egaLDDHUbBgjqsV+WPOQMHAHmXXKnTsxgBAXwG/XDdWml7ttiIm6LVHrPdA4Ot9vYU
 ZTN9HmTWn06Lh3q5kMhh0zGt/08xlN39OogE6YgvwSlWcq3sgRtIkEd4Yzua7XTcK2UF
 Pd28rRLTn8uGVJmw7yEzgiMFtzuRZzV2MMcsfhFXBVwVv5Tl/YbQNeZHNQaC/TVwgrZz
 txyw==
X-Gm-Message-State: ANoB5pmMSc0twocvcL12eN5fy7Kn4aQLobb6ftJhGgv6xnDk91aIZ9hq
 ogSdVXR9iyW73elwjcav+oxNazOaUAzjlMj9HTpUPvQa
X-Google-Smtp-Source: AA0mqf6q6TEbQ6zW82cXnOz6mF/R8+ETwd/2ID8TjsTOG4pD857xaIi0uXo2ODjsCj7DG5XAsJWSzilbnkWvkd0AF1w=
X-Received: by 2002:a05:6512:1395:b0:4b5:57fe:44da with SMTP id
 p21-20020a056512139500b004b557fe44damr8383931lfa.362.1670853770871; Mon, 12
 Dec 2022 06:02:50 -0800 (PST)
MIME-Version: 1.0
References: <20221209112409.184703-1-pbonzini@redhat.com>
 <20221209112409.184703-31-pbonzini@redhat.com>
In-Reply-To: <20221209112409.184703-31-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 12 Dec 2022 18:02:38 +0400
Message-ID: <CAJ+F1CJcVTX5DO4Jrs9P7MLL9qQr-Jy3N5LSpPWKWFzyLCgUEg@mail.gmail.com>
Subject: Re: [PATCH 30/30] meson: always log qemu-iotests verbosely
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>, 
 Hanna Reitz <hreitz@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x135.google.com
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

On Fri, Dec 9, 2022 at 3:29 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>

Sounds fine, but I like silence too. Could you give a bit of motivation det=
ails?
thanks!

> ---
>  tests/qemu-iotests/meson.build | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tests/qemu-iotests/meson.build b/tests/qemu-iotests/meson.bu=
ild
> index 583468c5b9b3..3d8637c8f2b6 100644
> --- a/tests/qemu-iotests/meson.build
> +++ b/tests/qemu-iotests/meson.build
> @@ -43,5 +43,6 @@ foreach format, speed: qemu_iotests_formats
>         protocol: 'tap',
>         suite: suites,
>         timeout: 0,
> +       verbose: true,
>         is_parallel: false)
>  endforeach
> --
> 2.38.1
>
>


--=20
Marc-Andr=C3=A9 Lureau

