Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C39373C5DC8
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 15:53:33 +0200 (CEST)
Received: from localhost ([::1]:36036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2wNI-0004cf-Se
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 09:53:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m2vrh-0001Nh-FW
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 09:20:53 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:46025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m2vrf-0006Zs-9v
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 09:20:53 -0400
Received: by mail-ej1-x632.google.com with SMTP id dt7so4735614ejc.12
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 06:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HQeYeez/e9xBkVfSDATvSpwnyq9O90AoobrkYhA5ojo=;
 b=O8yywF9JY87ybhNrqjpQU/sQZ+wk+1sv/d4OiIrivfheU9fE+qqyRWsCk5tV4uyRzB
 KML0nqAClGSg5L2CCfukHfuyIaNeGve1qsHTwZk1gdR/cwhHFHFDXCi04GfKKVyfG8pU
 82UHSJJAArycOpoHsayWlJJLzelqn2T38TUtekRIXf/detYg0q2bdh7K41vYOkoPUWHR
 VY8F7uA4Aw0utYilrKdFzsl8DDccn0jhoPcf2OOCynyo7WKzNOYQwMlL5y1L1V14LShu
 f6fetJ7b0v4UJoYWUqwCqKKyN9W7CnvQ3WPxbtjYEbWIfRy6+XnaFPO3BPka+JvbShIj
 5hNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HQeYeez/e9xBkVfSDATvSpwnyq9O90AoobrkYhA5ojo=;
 b=IXyOpNjfVPUPxQV7zZl5e2W4WdABbakIW2e3B6+8GSRcrf2y0DHX/Z7qvz4RDIat9i
 eFK/UgceZ3ygS3jcT99zpHgfVo+ubmyhKG6RKRvBr/WSn2sGe8T5tOntRPwao0bj//2z
 wNAhuES3lkAPH7eIX+5gALmkgaAuo+0EkiOjJDvEkxupWxLGA18eM9Wo6rVdCRKmgfTG
 sRLNuDoi3J71yuhvANrRoyQYDbf378HGCoZJ8YfvNY43ugvLs3N28e4XDYoKIFgXQFye
 yX+st/LWp0HpHE5F60HxSPNsAJqgG46jyUxRIB+wLZR6VwaxbRxztt/y/iohMybeKyiY
 bDnw==
X-Gm-Message-State: AOAM530T2+4IxtfoESyDUsq68E22xMVKyu5U0bl/1Tg93zhQEkdhXN7w
 93IqFvteUVo+otMnN9SKQYmJ1JT4JrlYXkfY+ePMIQ==
X-Google-Smtp-Source: ABdhPJybQGljxLUWoK1eWfUAphCiYCDzkrzuGc0nb7V7kW4tAOwKIYq2tksIBoCKqd6+hUrlG11ICliVH/2RS/q5XNU=
X-Received: by 2002:a17:907:3e02:: with SMTP id
 hp2mr51982536ejc.4.1626096049429; 
 Mon, 12 Jul 2021 06:20:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210711171506.39375-1-stefanb@linux.vnet.ibm.com>
In-Reply-To: <20210711171506.39375-1-stefanb@linux.vnet.ibm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 12 Jul 2021 14:20:09 +0100
Message-ID: <CAFEAcA-xRDY2_YhSeVp=yO3CXB8DbqcPBHAVnHTuL37FTOg0zg@mail.gmail.com>
Subject: Re: [PULL 0/9] Merge tpm 2021/07/11 v1
To: Stefan Berger <stefanb@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 11 Jul 2021 at 18:15, Stefan Berger <stefanb@linux.vnet.ibm.com> wrote:
>
> This series extends TPM-related ACPI test cases to also verify the TPM 1.2
> ACPI table 'TCPA'.
>
>    Stefan
>
> The following changes since commit 9db3065c62a983286d06c207f4981408cf42184d:
>
>   Merge remote-tracking branch 'remotes/vivier2/tags/linux-user-for-6.1-pull-request' into staging (2021-07-08 16:30:18 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/stefanberger/qemu-tpm.git tags/pull-tpm-2021-07-11-1
>
> for you to fetch changes up to a1b5cc4a84164bc36d355853a11b706ed52bce15:
>
>   tests: acpi: tpm1.2: Add expected TPM 1.2 ACPI blobs (2021-07-09 09:13:16 -0400)
>
> ----------------------------------------------------------------
> Stefan Berger (9):
>       tests: Rename TestState to TPMTestState
>       tests: Add tpm_version field to TPMTestState and fill it
>       tests: acpi: Prepare for renaming of TPM2 related ACPI files
>       tests: Add suffix 'tpm2' or 'tpm12' to ACPI table files
>       tests: acpi: tpm2: Add the renamed ACPI files and drop old ones
>       tests: tpm: Create TPM 1.2 response in TPM emulator
>       tests: acpi: prepare for new TPM 1.2 related tables
>       tests: acpi: Add test cases for TPM 1.2 with TCPA table
>       tests: acpi: tpm1.2: Add expected TPM 1.2 ACPI blobs

Hi; this fails some of the gitlab CI jobs, specifically the
build-without-default-features and build-disabled jobs:

https://gitlab.com/qemu-project/qemu/-/jobs/1416896806
https://gitlab.com/qemu-project/qemu/-/jobs/1416896861

In file included from ../tests/qtest/bios-tables-test.c:65:
../tests/qtest/tpm-emu.h:41:21: error: field 'tpm_version' has incomplete type
41 | enum TPMVersion tpm_version;
| ^~~~~~~~~~~
../tests/qtest/bios-tables-test.c:1095:62: error: parameter 4
('tpm_version') has incomplete type
1095 | uint64_t base, enum TPMVersion tpm_version)
| ~~~~~~~~~~~~~~~~^~~~~~~~~~~
../tests/qtest/bios-tables-test.c:1094:13: error: function declaration
isn't a prototype [-Werror=strict-prototypes]
1094 | static void test_acpi_tcg_tpm(const char *machine, const char *tpm_if,
| ^~~~~~~~~~~~~~~~~
../tests/qtest/bios-tables-test.c: In function 'test_acpi_q35_tcg_tpm2_tis':
../tests/qtest/bios-tables-test.c:1150:49: error: 'TPM_VERSION_2_0'
undeclared (first use in this function); did you mean
'GLIB_VERSION_2_30'?
1150 | test_acpi_tcg_tpm("q35", "tis", 0xFED40000, TPM_VERSION_2_0);
| ^~~~~~~~~~~~~~~
| GLIB_VERSION_2_30
../tests/qtest/bios-tables-test.c:1150:49: note: each undeclared
identifier is reported only once for each function it appears in
../tests/qtest/bios-tables-test.c: In function 'test_acpi_q35_tcg_tpm12_tis':
../tests/qtest/bios-tables-test.c:1155:49: error: 'TPM_VERSION_1_2'
undeclared (first use in this function); did you mean
'GLIB_VERSION_2_26'?
1155 | test_acpi_tcg_tpm("q35", "tis", 0xFED40000, TPM_VERSION_1_2);
| ^~~~~~~~~~~~~~~
| GLIB_VERSION_2_26
cc1: all warnings being treated as errors

etc


Perhaps the tests meson.build is not disabling building of
TPM-related parts of the tests when TPM is disabled ?

thanks
-- PMM

