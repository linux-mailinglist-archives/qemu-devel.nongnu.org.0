Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 653B152CD7A
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 09:49:48 +0200 (CEST)
Received: from localhost ([::1]:43734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrauo-00040A-Gx
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 03:49:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nrarj-0001ti-A1
 for qemu-devel@nongnu.org; Thu, 19 May 2022 03:46:36 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:38516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nrarY-0000zN-SG
 for qemu-devel@nongnu.org; Thu, 19 May 2022 03:46:35 -0400
Received: by mail-ej1-x634.google.com with SMTP id n10so8260918ejk.5
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 00:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ivVXQrHKKQjbYAgPZaJWdmkvg33LDhHIDhSoq6p1i6c=;
 b=qeCcrDabD4OVIOivQtBoCWhAkG0wAc3jk3jia30MnzuKA25M5lJrJfpWXqGg+IJRvE
 gDmfUaSR0haeWo+HsWu2GkWjnTY0uVj2Qc/gtvVqGVDJhVJZbVZHl31IKjw08EXBza2U
 Ae6fuZDJedr3njMuVUYo6w+jrgZcewZxhtv/pWSmHcdynAvRKXagVfdp1uQZM9DmE0Bh
 iFxzie0j7f8yyJAi3LwGu5wnvV1hTKF2Bkz7qk3DtBpK4gy4iMGRmTLZnJDvMdQsScLw
 zWYRNShGenHvabX1qDjjhbT5Q+CHyGpwB9Le/j78Ba0Jn8GQGnOKjeTkVQun04DEUc5a
 ivoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ivVXQrHKKQjbYAgPZaJWdmkvg33LDhHIDhSoq6p1i6c=;
 b=k3QvMhmCwiLC/Xq0rf3ONJ2KPlz/w4xBwRB33nc3GoMyLL9LLVFqNQ8cIoIBU0Zohk
 1ZSopvrXh0eSXf3ehjytC23leMruAvAZIOJDY5WLM2Y0NSVYT+Uaao2rES47ksrTz9x8
 fpjJj2YJ5dFFpe0P8oPvP9Dqkhvq9orCgyA+HR3f+uWSb9UAVGaLyH1LR9XuHAAJpVhd
 4UiN/JzB+ElaegsiyZqundXzKK/bluJcWC10OzSRiHf2NQfH+TV4QWyJHFq2mdjC+7uD
 hRIOHzv0X+FW+Ar1HJrYDW5EqlFchVnSCO6Up/zaXdBCDuYSqmUMOujthZFQiEV0kAUx
 GImA==
X-Gm-Message-State: AOAM531DvVn3da0vmp4YIxh7rq/jkQFJ9e+rKvGf+pIXWLE3hJ5Ooyu4
 3eEelq5kINSq15aHHIVYsdgCizsqF0HJ1c3pPlP6dw==
X-Google-Smtp-Source: ABdhPJxg228Ip6gGf2hJ67U/a2AcnBP/vJJo7ABaVTNszlhznilm/pY1tpbRTozl+RAVCUoGsl8vxAmq6uaKF3eGoWw=
X-Received: by 2002:a17:907:94cf:b0:6f5:942:5db7 with SMTP id
 dn15-20020a17090794cf00b006f509425db7mr2946401ejc.625.1652946383229; Thu, 19
 May 2022 00:46:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220518110839.8681-1-mark.cave-ayland@ilande.co.uk>
 <20220518110839.8681-5-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220518110839.8681-5-mark.cave-ayland@ilande.co.uk>
From: Ani Sinha <ani@anisinha.ca>
Date: Thu, 19 May 2022 13:16:12 +0530
Message-ID: <CAARzgwz-nrnHrdS312QJGd7TSeOx7dDgLH50_7hy2b1FcsZRhg@mail.gmail.com>
Subject: Re: [PATCH 4/6] tests/acpi: virt: allow VIOT acpi table changes
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: mst@redhat.com, imammedo@redhat.com, jean-philippe@linaro.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::634;
 envelope-from=ani@anisinha.ca; helo=mail-ej1-x634.google.com
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

On Wed, May 18, 2022 at 4:39 PM Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Acked-by: Ani Sinha <ani@anisinha.ca>

> ---
>  tests/qtest/bios-tables-test-allowed-diff.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index dfb8523c8b..8367ffe1d4 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1 +1,2 @@
>  /* List of comma-separated changed AML files to ignore */
> +"tests/data/acpi/virt/VIOT",
> --
> 2.20.1
>

