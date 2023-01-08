Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B09666150F
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Jan 2023 13:29:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEUms-0006ve-Mq; Sun, 08 Jan 2023 07:28:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pEUmp-0006v6-Rg
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 07:28:27 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pEUmn-0005Xr-UM
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 07:28:27 -0500
Received: by mail-ed1-x534.google.com with SMTP id x10so5760457edd.10
 for <qemu-devel@nongnu.org>; Sun, 08 Jan 2023 04:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xTEnBvbKcdkdOvCfsCpTkHu+J5BIWgLSUSr0sDhyje0=;
 b=cLo72VljxtNmZSHNg7n9OEySww3pJUgdYMvWsMh+rLkUCEzPB/PP0d2vhwZplV4zGF
 2xzMJtGRmkeMfWIca1GudlWAzP8sKxn0JulimokEYfYNDVxJs0r4Ao6lvHuS8IH/gDpT
 DgtaWRJ+ZJSE8K6Ntv7R3cFuwiS/vclP4bOhLGYMvh73uhtyl8gs5nj/5KQqQ0ON2qeB
 0EfSuhVoa3RpigLwsF54v/yXx2dtIJpZ5AJyuYJiVhpE7NNenhjKq8HCRP71RDEOjqPA
 P5IUGxokUYNgZOiWqb/WneOjyViE8gD7VwAdi0cD2O49nBHVBZCkCbmO+rbnjEcgvDRE
 gDHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xTEnBvbKcdkdOvCfsCpTkHu+J5BIWgLSUSr0sDhyje0=;
 b=rtIomPoeM2p4s7bwYxq3Yl0WK8Xd+82HHBFh3UDsYWtAcURrOlBM2iEm6rBIYzdaik
 xEMm19vxmog55meWf9Z6oz1EJ47dHcRM4A/2gym2Lrzkw90/LlUcdomnRixyqOF0Lq9H
 JM8uau0YsQh5uHfJrXkzt9XZkAAWqOjyeSuKDwWTO6vvGSBEmB86orF5SQwsfjUnfLqg
 p0l3OD5ezVACOw6prcNwwopiVojaWCSPcoTBHxiaC6kiRfWzziH2c5yEhnffYr46s2WD
 IOu6o1up9lR5Z/47f/AEo1mmpxZ50Xl48YB3WUmU+z7SK9BXJErlPH5CnJoLXmu8LWEt
 e+Lg==
X-Gm-Message-State: AFqh2kpdtOmhedA8NHWV1fkBGGlvLtmR5wNCCawxdBM9qw9YlA/I3tta
 8syIXpgulkHf4KHWlgQBf5cN9sw8SMls5MYhk3W4anT/
X-Google-Smtp-Source: AMrXdXuOx/wNWKPNv/zNP2VITnaN8eX81zTTTv4ZJJ8qE+aqn256ymrzBLWMJJ/lg21yzkdRolFVDgn8dXsktd1vRlo=
X-Received: by 2002:a05:6402:2a06:b0:496:a74d:b752 with SMTP id
 ey6-20020a0564022a0600b00496a74db752mr650557edb.318.1673180897684; Sun, 08
 Jan 2023 04:28:17 -0800 (PST)
MIME-Version: 1.0
References: <20230104220449.41337-1-philmd@linaro.org>
 <20230104220449.41337-13-philmd@linaro.org>
In-Reply-To: <20230104220449.41337-13-philmd@linaro.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 8 Jan 2023 20:28:03 +0800
Message-ID: <CAEUhbmV-7CFcF1ZQ1KQy4zxjw1fjx7ea=7SWp1hSs3c2z7Dy0g@mail.gmail.com>
Subject: Re: [PATCH 12/20] hw/mips: Open-code pflash_cfi01_register()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x534.google.com
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

On Thu, Jan 5, 2023 at 6:51 AM Philippe Mathieu-Daud=C3=A9 <philmd@linaro.o=
rg> wrote:
>
> pflash_cfi01_register() hides an implicit sysbus mapping of
> MMIO region #0. This is not practical in a heterogeneous world
> where multiple cores use different address spaces. In order to
> remove to remove pflash_cfi01_register() from the pflash API,

same comments in previous patches

> open-code it as a qdev creation call followed by an explicit
> sysbus mapping.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/mips/malta.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

