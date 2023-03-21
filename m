Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2EC26C2C35
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 09:22:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peXGT-0003Tx-1r; Tue, 21 Mar 2023 04:22:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1peXGQ-0003Sy-91
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 04:22:38 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1peXGO-0006KY-2S
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 04:22:37 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 bg16-20020a05600c3c9000b003eb34e21bdfso10590065wmb.0
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 01:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112; t=1679386953;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CZPABWh82cjNog4VM0HrA5YkX7FOdNCyGEQna9XQgFU=;
 b=EGbb1RFaKuGBLX9YnqSgq+C7QqTKARIR0g4h6CNWzW4OOUi0SsKr4/+heqpHDNkDy0
 9/76KSycLj6M90QVLpMGlXFMt3K3Sxm7T6F6q+Bc42StzMruteO0TlfJcf2VdHxAGBtH
 d+lP5zDTM3unVjnqG/h5wbvynxQotCn7cNvZYa1bvS2YtmnRREKTzTRd5FuP9WPfpNhz
 VzfaSOGOOQYmv5pYB21GMFZXgRPHgpQGvfHs1IdQxQ55nBg9jKRUTTVo7RAzArd3wae8
 431/8CnwrO6PlmdVGwCKs4cOpesUL1OTzk/y2KcOZaBrCTDYnsC8EB+6yE4AR5zMnUJl
 OE9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679386953;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CZPABWh82cjNog4VM0HrA5YkX7FOdNCyGEQna9XQgFU=;
 b=REqFbSFdzGJ4DSWIqtGCIKPY5F09JbFRgn5OqGYy21IMKIv9a+G5mYZk0uTO5o6wa+
 QFjhhL9OfNPwYl1c1Mp89N0Tmut+uH9+/GB1+zXzZVtmATNl3DLIW0Tl0arty7lNb0Tu
 /3VdGu85w4N/8+gE+9QxKxOEg7/uScAdVT2aX3gFAnE2yvN2jfnVnZkams0FqbgF4EO+
 7A1mLFHyYkq2yOGQ/cVE3Lxhrt31rvHUoa1/88BThIYNUlMAWl/qnEpMSBDR2dPGx2IH
 au5O0FT+ilH8EnTKZ5WzfFdq5b0OhZLh8y7JRYCdukn5M+0/1iefaqAHpi9EQf/ccM31
 ndAQ==
X-Gm-Message-State: AO0yUKVxYR81sw9yU0XyMo2CuHbxrRELM1Txr0f+TAxhFC6SHlVfrpKa
 hBIqgtE7ruBZ+I8qKqhi59A3nb7Nj8VHUjZsnOjmbt7Tz4VIwqDYDzI=
X-Google-Smtp-Source: AK7set92ZpVWP5JssJ0FYvaPKRUXqrwz/lbGfDNh3MAPxAQVSw6F/2TxiBg+kgG3j+btJ+uYgK7A9y3yTlke5Bz2x/4=
X-Received: by 2002:a05:600c:2109:b0:3ed:aa86:58fa with SMTP id
 u9-20020a05600c210900b003edaa8658famr519206wml.6.1679386953186; Tue, 21 Mar
 2023 01:22:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230320093847.539751-1-kraxel@redhat.com>
 <20230320093847.539751-3-kraxel@redhat.com>
In-Reply-To: <20230320093847.539751-3-kraxel@redhat.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Tue, 21 Mar 2023 13:52:22 +0530
Message-ID: <CAARzgwwjguG-teRcv2jEB+McZgkcmF6ji7WisagEV+LdvfT4OA@mail.gmail.com>
Subject: Re: [PULL 2/6] bios-tables-test: use 128M numa nodes on aarch64
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2a00:1450:4864:20::32c;
 envelope-from=ani@anisinha.ca; helo=mail-wm1-x32c.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Mar 20, 2023 at 3:08=E2=80=AFPM Gerd Hoffmann <kraxel@redhat.com> w=
rote:
>
> Recent edk2 versions don't boot with very small numa nodes.
> Bump the size from 64M to 128M.

Can you please add the ASL diff between the binary blobs as a result
of the change?
Otherwise.

>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Ani Sinha <ani@anisinha.ca>

> ---
>  tests/qtest/bios-tables-test.c         |   6 +++---
>  tests/data/acpi/virt/SRAT.acpihmatvirt | Bin 240 -> 240 bytes
>  tests/data/acpi/virt/SSDT.memhp        | Bin 1817 -> 1817 bytes
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-tes=
t.c
> index 76d510091177..873358943784 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -1679,9 +1679,9 @@ static void test_acpi_virt_tcg_acpi_hmat(void)
>      test_acpi_one(" -machine hmat=3Don"
>                    " -cpu cortex-a57"
>                    " -smp 4,sockets=3D2"
> -                  " -m 256M"
> -                  " -object memory-backend-ram,size=3D64M,id=3Dram0"
> -                  " -object memory-backend-ram,size=3D64M,id=3Dram1"
> +                  " -m 384M"
> +                  " -object memory-backend-ram,size=3D128M,id=3Dram0"
> +                  " -object memory-backend-ram,size=3D128M,id=3Dram1"
>                    " -object memory-backend-ram,size=3D128M,id=3Dram2"
>                    " -numa node,nodeid=3D0,memdev=3Dram0"
>                    " -numa node,nodeid=3D1,memdev=3Dram1"
> diff --git a/tests/data/acpi/virt/SRAT.acpihmatvirt b/tests/data/acpi/vir=
t/SRAT.acpihmatvirt
> index 691ef56e34bc84509270db316d908f5979c209bb..6fe55dd7d07fef0f8fe16a209=
e96a89dd48ca240 100644
> GIT binary patch
> delta 67
> zcmeys_<@ltILI;N0|NsC^R$Uvjf@-<d*mlxmepX?U;>JPK>(EIfYJ<%Fb0qY0P4I6
> AJ^%m!
>
> delta 59
> zcmeys_<@ltILI;N0|NsC^Qwtljf^Z4d*l^dfLst@flv$#j4%d}X4GJsxL6ecZ+{66
>
> diff --git a/tests/data/acpi/virt/SSDT.memhp b/tests/data/acpi/virt/SSDT.=
memhp
> index 2fcfc5fda955dc4ba78a5f4116eed99ec7202fbd..ef93c44464f1fe38f7e5babd5=
d67f345cc6363a6 100644
> GIT binary patch
> delta 22
> dcmbQqH<OPmIM^jblAVEpap^`bUUsI7&Hz1t1wsG-
>
> delta 22
> dcmbQqH<OPmIM^jblAVEpv2i08FFVs$X8=3D5?1wsG-
>
> --
> 2.39.2
>

