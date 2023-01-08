Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF19D66150C
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Jan 2023 13:29:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEUmv-0006wJ-8S; Sun, 08 Jan 2023 07:28:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pEUmr-0006vM-3m
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 07:28:29 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pEUmo-0005Yk-F1
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 07:28:28 -0500
Received: by mail-ed1-x531.google.com with SMTP id v30so8633874edb.9
 for <qemu-devel@nongnu.org>; Sun, 08 Jan 2023 04:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BMm6iymTV9Z4pxbNpweqUemK91nBoXyJoKEJdwG3uiY=;
 b=fcn7lVI7xoH5w4DzZaKiwTkxRGpogzBTosKbhHvTzByxPeWQzigquv5T09RqjNFm1E
 pNYaBqEl8/OQrIO3NMrzC0vyNZplzi7//z9pqWdt344a7xsj2RS64FzAjs8Vea22ftXm
 IDBkznNAG02fvluVTI9FEtpJ0ECSO+0vY0kPHP/iFCyf76WJP0v4dzu7folAeGuWIZFX
 SqG/+GpWaYhGwA5GksLjiYFQ4BDWJfmXTVrCUsRsYzh+dakl76vovKu/VSekZokWZNgb
 0nym8p0QajSIAL5Q5WtgSqim40W+w4g8va/VdX9uD/55McfdHVCnX8sP9cg51obw5l6o
 ekZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BMm6iymTV9Z4pxbNpweqUemK91nBoXyJoKEJdwG3uiY=;
 b=zk1pRM3kEOXrVnj9q2yehnG3MTo2TtcS4vhcIaR2qRiWL8IimCu//vW27TqqhpV0+9
 EseKAH2Adk7b5QFCp2D8H+J/539cxjzDFzvzZH/+F/CEpuxX7azGEtaFra1ooArZQ4lI
 v/01QDEyMQ7ccGXwzjA9Y1vqtBY0nQIfFld5gv6L4q5MXSLAInEHoPd9nhotP2YeqX2X
 HWHEF7+4j/wH0a2UoeARc7O9XOIGXV+Q0CFz7VkyS5ruTpjt+q58LQSv5PEdMEMLcow2
 HlTIs/H6xgPIkEHXCfgy+3aJ+gPiiBNxTvZDrTJY8knymFaHfj6jP0cc6qNti2haVZYw
 UWaA==
X-Gm-Message-State: AFqh2kpARtg4ZEAE0UT25mv6wnzDOHPBTBo+KnFnVdNsUXRW+ato9uYx
 6lL82/4K0TAS+fGzE6AecKVKk0uISH3NQpMo13VDGdHv
X-Google-Smtp-Source: AMrXdXtPxwLzgioQToWbGIx9b+4qjoK9djVlOwU+D456ljoCKpY20a+yYYaqZFEszaXNMiRQJFq2i0vAqoVKv03Xnak=
X-Received: by 2002:aa7:d584:0:b0:46b:6096:a884 with SMTP id
 r4-20020aa7d584000000b0046b6096a884mr4343047edq.152.1673180903674; Sun, 08
 Jan 2023 04:28:23 -0800 (PST)
MIME-Version: 1.0
References: <20230104220449.41337-1-philmd@linaro.org>
 <20230104220449.41337-15-philmd@linaro.org>
In-Reply-To: <20230104220449.41337-15-philmd@linaro.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 8 Jan 2023 20:28:09 +0800
Message-ID: <CAEUhbmWuU9JHTGoNwMp7wEfFKKXtLbhx-YB9Ch84hg7Y=BBRtg@mail.gmail.com>
Subject: Re: [PATCH 14/20] hw/block: Remove unused pflash_cfi01_register()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x531.google.com
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

On Thu, Jan 5, 2023 at 6:48 AM Philippe Mathieu-Daud=C3=A9 <philmd@linaro.o=
rg> wrote:
>
> We converted all caller of pflash_cfi01_register() by open
> coding a call to pflash_cfi01_create() followed by an explicit
> call to sysbus_mmio_map(); we can now remove it.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/block/pflash_cfi01.c  | 19 -------------------
>  include/hw/block/flash.h |  9 ---------
>  2 files changed, 28 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

