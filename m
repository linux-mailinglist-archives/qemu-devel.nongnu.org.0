Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BC552B7B1
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 12:24:03 +0200 (CEST)
Received: from localhost ([::1]:43752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrGqX-0007ZV-Us
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 06:24:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nrGnp-0006GQ-1S
 for qemu-devel@nongnu.org; Wed, 18 May 2022 06:21:15 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:46918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nrGnl-0007pH-Qy
 for qemu-devel@nongnu.org; Wed, 18 May 2022 06:21:11 -0400
Received: by mail-ed1-x52a.google.com with SMTP id j28so2318001eda.13
 for <qemu-devel@nongnu.org>; Wed, 18 May 2022 03:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DPb3e/i17yoAtld5HkilF6skfnXQSqI0nofYEVz+dOk=;
 b=hPuJgwLx6bieHZt3F9TRuxl/L2dFry7w0AQUqJR1YoQhPjzbEg8kBnzjlzVqAzC1y/
 Gs4l5blra1kD+4qCqBljb6t+PE/EXOlpppc2IkGF8RbJDAQwFMzgWUgpxBHuPPD0N/y+
 9BKPErtYtfOO1kwQ4gIB9xwbjUNxNYUhB8fRIEIihdYZs8ydf1m4vuOXtKPT6KXtCWBy
 Gd/27asOMOZI4+x6hPA7q+pMK6ip7O0xaKpGgGVqdHhDc6Kc/qMhtMqutboJdPhE/8sl
 c/xzoB4YLpTFRPWn6yCdwYqrYUbDLgc6gZdAcJKcfT0gDjHVDYuDyvJV/XoSmuxo9B1/
 LJVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DPb3e/i17yoAtld5HkilF6skfnXQSqI0nofYEVz+dOk=;
 b=PO5mfC4e1BY72yKpoaI7HzhsTLe7Cq5ht+03rQFl//j0faZFksPhxzIEldhIJZvNCH
 COH4DYDGTnapOyKUG9+J+TVrHdsRxbAer4lg2i9q7HPnzyTagByt5Mo1qn666LmJyz/U
 KJjiEhlMomsKLrxab6jwNLaX4h6ED/7m+gJSqlAl+AyOCynDF5R0oCFNnqyeU2rRXo3d
 j3fh1o35QRJEX8QIdEzjyLwfuhmNrSmT4aSKMTLwUCcwaHl+TE28sUQsJgzwx0dg/TeI
 nqJtEs4q21gxEyiIDv+x8Zs4t5caT6Zw6BYq5BGD+dTWlx8lH5lqh+FzqmUNXHltnvEh
 HHPg==
X-Gm-Message-State: AOAM532EGsUkmQtEdRXABeiYbpoCR5Tg0R150bMm/amFeYR6JLk9CozF
 oJ6GENLPK9VSxFZJXItmcfS9dX9pyG06kdTaoO5Z8w==
X-Google-Smtp-Source: ABdhPJypF2JVbKBsZfQ+faEsNhduc+rGvxpgt2tqraT4XANJDiS3gWBRPWvIiehSfUiiU15lKG0WbgBAk/3rsOND9TU=
X-Received: by 2002:a05:6402:4304:b0:427:cb08:b085 with SMTP id
 m4-20020a056402430400b00427cb08b085mr23711318edc.194.1652869268257; Wed, 18
 May 2022 03:21:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220516152610.1963435-1-imammedo@redhat.com>
 <20220516152610.1963435-31-imammedo@redhat.com>
In-Reply-To: <20220516152610.1963435-31-imammedo@redhat.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Wed, 18 May 2022 15:50:57 +0530
Message-ID: <CAARzgwwk6dCw1KerBpj2yZL3SAPbs6tZ7hrQfPThweGcUNdWOw@mail.gmail.com>
Subject: Re: [PATCH 30/35] tests: acpi: white-list DSDT.tis.tpm2/DSDT.tis.tpm12
 expected blobs
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, mst@redhat.com, minyard@acm.org, 
 stefanb@linux.vnet.ibm.com, marcandre.lureau@redhat.com, kraxel@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::52a;
 envelope-from=ani@anisinha.ca; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 16, 2022 at 8:56 PM Igor Mammedov <imammedo@redhat.com> wrote:
>
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Acked-by: Ani Sinha <ani@anisinha.ca>

> ---
>  tests/qtest/bios-tables-test-allowed-diff.h | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index dfb8523c8b..7b3bf9a207 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1 +1,3 @@
>  /* List of comma-separated changed AML files to ignore */
> +"tests/data/acpi/q35/DSDT.tis.tpm2",
> +"tests/data/acpi/q35/DSDT.tis.tpm12",
> --
> 2.31.1
>

