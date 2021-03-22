Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A78C344BFA
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 17:43:42 +0100 (CET)
Received: from localhost ([::1]:54248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lONeV-0004Ax-TY
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 12:43:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lONcT-0003d9-1M
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 12:41:33 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:45928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lONcR-0005YE-8C
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 12:41:32 -0400
Received: by mail-ej1-x62d.google.com with SMTP id kt15so12884161ejb.12
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 09:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KKnArI1U2HNpN5mvBSLrlBtPCLQ1fTcocY1T1zIVTvM=;
 b=ViDhACT+OsTj50jD+7HPBbfQnBQx19W82kL/cjUv+XIr8Il5jKihxQtCFbAFist8OJ
 1iqIYI1A4PLMSp59KRTl/L7DdnTF+kpS1/hQPN1TlpVhuVO/l8GhUN+Dv14dqZJrrTFV
 YrPi1A4wEeYntueqCAdVCu94yJaYplvYi1WIZyqQwJJehONnciyxbPr6kkCoDbr7/hWk
 KZz3ykPE2zFVxchpRBEyB/JTsczbpewhKEhDAlPxmmNLCL/dhQxVECw+HtYhM4geA3+Q
 PYISMmgw0hugq7sEXZ79ZcZ75Mzl2oRTdBynTvQv3fEECEX28wF9iDlh4ABN1kxUi7uZ
 wu2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KKnArI1U2HNpN5mvBSLrlBtPCLQ1fTcocY1T1zIVTvM=;
 b=V8xs8lacd8nIZxLxrdyft9fxjPZUmdQlO4gVO/XqLXlh+EJ2P6xq3v8BAKKonlPfj/
 0qY3ruVIpvqFC1bh44JeDfU5nOoeQToNh34gE3OTAGs1Oi6yBW9EqPPER4vnfDuLXFu0
 SaCcTPKfLifBJCPEd8pgHqj+lJZPmCJPOP2p0LBSIufQeyWRYICcH7G6dS5DAjUlzvTN
 qgupWfz2T/lnG7D95tQHvXUBkf3RR4WYWYWs0njhqS85cgxsbNjAKa6H9H9nYp4LX+FT
 qafEEg2kQ5qX9GK1TmLHGhZ0JCWZZzmFl9Uf7iDh80trJS/pgSSg7RWyqsk79+nh2ZiO
 xVlg==
X-Gm-Message-State: AOAM530vqmcPjx5kqEg6l3Hl2575at4n/twc7KQvGCvyjdHYqVt4jN+Z
 PVt4UZmcuv64h5OUjhE9mkX7V1+5iSQsf4VnIpRdUw==
X-Google-Smtp-Source: ABdhPJyF8iFyOkz0PYUvm/vpjtICmGZfDKbqeYxOUjILDrX6yaBflSMGUNctlb8sJZ24KeKgR98dvSPzvgcDDAs7p/Y=
X-Received: by 2002:a17:906:8a65:: with SMTP id
 hy5mr716825ejc.250.1616431289256; 
 Mon, 22 Mar 2021 09:41:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210322154417.524229-1-mst@redhat.com>
In-Reply-To: <20210322154417.524229-1-mst@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 22 Mar 2021 16:41:01 +0000
Message-ID: <CAFEAcA9xniNP73rbFLc_eUB2vi2N71vM2xKRMzqGWjXLEeLVag@mail.gmail.com>
Subject: Re: [PULL 00/20] pc,virtio,pci: fixes, features
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
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

On Mon, 22 Mar 2021 at 15:44, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> The following changes since commit f0f20022a0c744930935fdb7020a8c18347d391a:
>
>   Merge remote-tracking branch 'remotes/thuth-gitlab/tags/pull-request-2021-03-21' into staging (2021-03-22 10:05:45 +0000)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
>
> for you to fetch changes up to 5971d4a968d51a80daaad53ddaec2b285115af62:
>
>   acpi: Move setters/getters of oem fields to X86MachineState (2021-03-22 11:39:02 -0400)
>
> ----------------------------------------------------------------
> pc,virtio,pci: fixes, features
>
> Fixes all over the place.
> ACPI index support.
>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>

This triggers a new clang runtime sanitizer warning:

MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
QTEST_QEMU_IMG=./qemu-img
G_TEST_DBUS_DAEMON=/home/petmay01/linaro/qemu-for-merges/tests/dbus-vmstate-daemon.sh
QTEST_QEMU_BINARY=./qemu-system-mips64el tests/qtest/qom-test --tap -k
PASS 1 qtest-mips64el/qom-test /mips64el/qom/loongson3-virt
PASS 2 qtest-mips64el/qom-test /mips64el/qom/none
PASS 3 qtest-mips64el/qom-test /mips64el/qom/magnum
PASS 4 qtest-mips64el/qom-test /mips64el/qom/mipssim
PASS 5 qtest-mips64el/qom-test /mips64el/qom/malta
../../hw/pci/pci.c:252:30: runtime error: shift exponent -1 is negative
PASS 6 qtest-mips64el/qom-test /mips64el/qom/fuloong2e
PASS 7 qtest-mips64el/qom-test /mips64el/qom/boston
PASS 8 qtest-mips64el/qom-test /mips64el/qom/pica61

and similarly for eg

MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
QTEST_QEMU_IMG=./qemu-img
G_TEST_DBUS_DAEMON=/home/petmay01/linaro/qemu-for-merges/tests/dbus-vmstate-daemon.sh
QTEST_QEMU_BINARY=./qemu-system-mips64el tests/qtest/endianness-test
--tap -k
../../hw/pci/pci.c:252:30: runtime error: shift exponent -1 is negative
PASS 1 qtest-mips64el/endianness-test /mips64el/endianness/fuloong2e
../../hw/pci/pci.c:252:30: runtime error: shift exponent -1 is negative
PASS 2 qtest-mips64el/endianness-test /mips64el/endianness/split/fuloong2e
../../hw/pci/pci.c:252:30: runtime error: shift exponent -1 is negative
PASS 3 qtest-mips64el/endianness-test /mips64el/endianness/combine/fuloong2e

thanks
-- PMM

