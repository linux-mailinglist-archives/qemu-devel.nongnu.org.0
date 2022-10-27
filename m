Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB20560FC1E
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 17:37:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo4rh-000697-Sj; Thu, 27 Oct 2022 11:32:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oo4rb-0005wD-KA
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 11:32:14 -0400
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oo4rN-00072n-Qs
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 11:32:11 -0400
Received: by mail-qt1-x829.google.com with SMTP id bb5so1364438qtb.11
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 08:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lnuBXb4qCtJog5W3rh/ExwfT7IvuOooiaHZqyx4K6oc=;
 b=PvS1ZuSu/AAWE0tRa3hXiWpcd4R02AZFrbuSnKYncSQUMtXMJ0nBLViAc4yb5bhC/x
 6auX8yIjD3iNMWjXNLgoweWcZxPrjr5mdqqnT09dbiw+G7Kz/h8f62jS/jCfniHmkZoo
 NW8YG2q1sPLLsMdRJ7wjXJSRyKi/MZEbMWL+QYcSlbBWvPD1ewrc7qmE5HbFHjL6H5Fc
 BIL5Ckqj8c2aG1/HXT5w+xIGtnLIi/2e2yxuBResPB6MJa9in8fP5Amx3lfjJvEzLUhn
 01Wen4x9A2XllaQfMh1nqvGV5ncHcr5nsK3p61+i6fGCc2RMlwzBTXscFHob8kgkRism
 8j3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lnuBXb4qCtJog5W3rh/ExwfT7IvuOooiaHZqyx4K6oc=;
 b=yq/T0Pix1Tpa+l512VO32P4x5sHwJ1/qU8+4xte3JY01exgtdMWPvF0d3Ee8xmhlpe
 043gA4HSux4gys6ZEivUp/H6IPNdJqOBZn7eI+SiLd+WQVFTU2Ta8ltBg3KU2hcbnGUi
 OwWBxQDPelY+x6RPURXmjnG/0s/RO/V/n/hKwMrMs5LwusPONqKIUpfhvvSxzjDGXJxz
 cQpVaeX98YIky98ZqJDYs9Gz3ElCYJiOIRVzl5riXeYm72qYghkc2b13fBqii0hXxu77
 2XLWJRWzB/8Q7efuHWKVJpDBu2UkM10Gd+W6Ux73NmssRQzsVe/OnpWhPcGAFfOV+4oh
 xQdA==
X-Gm-Message-State: ACrzQf0wYyMwrtDU2nDh5Y6L1d2n/aI4FB2bsmgI0zICO0HjQlE2Mr4v
 y0in/ElvRaEWLLjaCJQCTdDGqtle9aTj7inXlLEPPw==
X-Google-Smtp-Source: AMsMyM4NTbJCbKsBK53OVgCgTrdQwGtJ/Gp74rpfUbFde/7/aEUnQuL4lR0HVVdFBiATAcFS0Jyeyyhkj0OzRfuml6o=
X-Received: by 2002:a05:622a:58d:b0:39c:e0d5:1338 with SMTP id
 c13-20020a05622a058d00b0039ce0d51338mr42152183qtb.591.1666884716307; Thu, 27
 Oct 2022 08:31:56 -0700 (PDT)
MIME-Version: 1.0
References: <20221027151135.496368-1-mst@redhat.com>
In-Reply-To: <20221027151135.496368-1-mst@redhat.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Thu, 27 Oct 2022 21:01:45 +0530
Message-ID: <CAARzgwxJxBjJrQ=CyvdDuAD8DtSnhfvDBsz8GRTcRL4SFiwZFg@mail.gmail.com>
Subject: Re: [PATCH] bios-tables-test: do not ignore allowed diff list
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2607:f8b0:4864:20::829;
 envelope-from=ani@anisinha.ca; helo=mail-qt1-x829.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Oct 27, 2022 at 8:41 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> we had such a beautiful structure for updating
> expected files, designed to keep bisect working.
> It turns out that we ignored the result of
> the allow list checks unless all tables matched
> anyway.


Doh! Seems the bug is present from the beginning?

>
> Sigh.
>
> Let's at least make it work going forward.
>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Fixes: df7cafdeb68b6572fa81 ("bios-tables-test: list all tables that differ")

other than that,
Reviewed-by: Ani Sinha <ani@anisinha.ca>




> ---
>  tests/qtest/bios-tables-test.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index e6096e7f73..a72f6ca326 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -458,7 +458,7 @@ static void test_acpi_asl(test_data *data)
>                  "for instructions on how to update expected files.\n",
>                  exp_sdt->aml, sdt->aml_file, exp_sdt->aml_file);
>
> -        all_tables_match = all_tables_match &&
> +        all_tables_match = all_tables_match ||
>              test_acpi_find_diff_allowed(exp_sdt);
>
>          /*
> --
> MST
>

