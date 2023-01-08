Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CC166151C
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Jan 2023 13:36:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEUtM-0002ob-G2; Sun, 08 Jan 2023 07:35:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pEUtC-0002lT-AV
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 07:35:06 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pEUtA-0006rQ-6W
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 07:35:01 -0500
Received: by mail-ed1-x52e.google.com with SMTP id c34so8749249edf.0
 for <qemu-devel@nongnu.org>; Sun, 08 Jan 2023 04:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/f7kCjPHOUpRuXYmQ0EU3zgf8zSFVJAzP5yC0TbxnFc=;
 b=bneLTKlpHWZ3XkEeTifc1Fy5xBLWeEN8DiLix8A/WqV1v9lWCpZA9+yV3v79p8C7gm
 EMul+bFWaRBJGhxSyHwonwSUsMzylJ+OOYNtp6CXbI0UFiECx4hiAixSyttES/+gegRp
 2WrIoXVY6V6KS4r1MBgLSEYarZRZIjm5PvNX57vTU95+klI2Yfu5i8exB05eomU6LgBk
 BcQmDv2YvFbgfT4JYMh7/g5zyE6b3TQ7SAgtC44W2jc0+z+mSlkbFHaJYY+jDlBthyj6
 10B4gKY0V2VpF4C24kfJuuEtExvY3v82o0c2ujIDo2jL8FRGCsvxeh6cs+m0jmZ91mYc
 0pTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/f7kCjPHOUpRuXYmQ0EU3zgf8zSFVJAzP5yC0TbxnFc=;
 b=puZntABqGPICrJ+N5fUeDXvulY3A4Xg5T0u4QC545WBkDdcf7JV3rN8YJxLMuVAyhO
 cSQOQ/IGgxoNSXI5PBEmkXcXe5o59VSWE/48uJvCfdwYnWoj745bKB2bDlw74bl522+p
 WFAx7lzs9aVhnHIb9zqoc3bEp3G3hf/FL3ISL6wrVQlSZUY2Xi7jgfA6j5WXZ887C6Ak
 kG4FEraPkxFHPUzPrGzVgcrtkhYbYg/fS1FJ1tncMq/mxk2wBSTBnpfia4UnKCbIQCOW
 NH04X2OMqx5q51VegbE0o630a52MHOHe5SCn35W0h02f+pmKtyyeL53N+/8Jnm0r4I7M
 bJqw==
X-Gm-Message-State: AFqh2koQ7ThNgdu2RfbloajH+sw7Mj5K0g8kKkADBQfg5zMa3qUF7Ltj
 mNmsNtXmm5uC06PtSSRYjL5lvtRoTGrsh1lTMQmoseQZ
X-Google-Smtp-Source: AMrXdXswafi3sFpy8cn59TX1WIW91ukh9Vro+fdEjVdsff4w26IDs5fYZRJhVrosRKj7n3KcoJ4cNDkRmR2dKWuCmw8=
X-Received: by 2002:aa7:d584:0:b0:46b:6096:a884 with SMTP id
 r4-20020aa7d584000000b0046b6096a884mr4344080edq.152.1673181298900; Sun, 08
 Jan 2023 04:34:58 -0800 (PST)
MIME-Version: 1.0
References: <20230104220449.41337-1-philmd@linaro.org>
 <20230104220449.41337-20-philmd@linaro.org>
In-Reply-To: <20230104220449.41337-20-philmd@linaro.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 8 Jan 2023 20:34:46 +0800
Message-ID: <CAEUhbmVbS-F3sc5faOfdC2sTh00K2BU0r5cS_UD0UCbnwe-XVQ@mail.gmail.com>
Subject: Re: [PATCH 19/20] hw/block: Remove unused pflash_cfi02_register()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x52e.google.com
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

On Thu, Jan 5, 2023 at 6:28 AM Philippe Mathieu-Daud=C3=A9 <philmd@linaro.o=
rg> wrote:
>
> We converted all caller of pflash_cfi02_register() by open
> coding a call to pflash_cfi02_create() followed by an explicit
> call to sysbus_mmio_map(); we can now remove it.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/block/pflash_cfi02.c  | 22 ----------------------
>  include/hw/block/flash.h | 12 ------------
>  2 files changed, 34 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

