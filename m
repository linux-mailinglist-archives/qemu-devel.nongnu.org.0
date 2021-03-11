Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8DFC337552
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 15:20:16 +0100 (CET)
Received: from localhost ([::1]:43972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKMAh-0007d2-VX
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 09:20:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKLoG-0003eT-H1
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 08:57:05 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:40873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKLoE-0003pD-O6
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 08:57:04 -0500
Received: by mail-ed1-x52f.google.com with SMTP id i61so2869210edd.7
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 05:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=lt6W0DL25DD4fkY17KrpKAIssrwOr6WNuWnERU+QiP8=;
 b=fDwET5KODp1CoibrKFi/XJurFuwznITo4nV125xWZWtPcacxt5iQn4bbtL+ngWmnu1
 yrxeUi3zFo/D+NpPUx8yWf2RZUM8c48khKoLbZeDppnBN3MNUesCBbYaLq8b5NSygVVS
 7PUCD6eH+Ifce0ZSGRT8W/a5pRhH3CKFxt5TZgNN3WI26dvTkzDlCK6brsamx6mWV0/G
 sckbp+cpXU//XGsySJ21q9Kda2viputltVZwom+ilqLjLVMG71UGVVEchIO2D5WegMkV
 /RbQp6EDLtlpHSK5qjUo9dTcq/arhtOjA+eINtyfk85OYGTkANnuizO+7A39SVNb0yvU
 S1Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lt6W0DL25DD4fkY17KrpKAIssrwOr6WNuWnERU+QiP8=;
 b=lejNom8Ve8HoxxL3VNnuL17Pv6T65Jf78GtZFk6U9rplo5+VvkAK9mfuruhgOSK5IU
 KV2qG/f/SOzJBtoYBP65O0XovwbmOESd5YyGCttLeSk8I+JB+m8HX0HRR6L6HYEvpA5q
 VQULh5jz/7dGFeCxrZs8+HSoduAMcnX9ZbqqQx+T6NaLQBhvt94WUJz61rLrzGgxR2p/
 64CQ/ZIctM9LtXWiynkMnMZLBpyb8w8TMmGYZoH/XF7S2YOIoEoFwE9VlZ8/3/dJh713
 jiYo4dIU/gFJCtCL6RxFGV+LdBFNug+lduViLh3PS8cyGuyH+3iyQnUYxqu5W7YJcxH7
 riug==
X-Gm-Message-State: AOAM531Kt+2PMDjeQC3Gibuzlzr0LMfUbNr4I3RMjq4GsGqIGH5YjPmf
 kl0pbNBaGI+CsYHe9I9uAzKAC7fWMKE25w7DJxZ/ug==
X-Google-Smtp-Source: ABdhPJz3O/psFDbeFPugVfxZVzrIhj5xssYiFjimKc4EPDkYBFvH+LMd5fsyEFAiKAyqchGGSrSTz3c24193eii5U/A=
X-Received: by 2002:aa7:c3cd:: with SMTP id l13mr8508581edr.52.1615471021014; 
 Thu, 11 Mar 2021 05:57:01 -0800 (PST)
MIME-Version: 1.0
References: <20210309131641.2709380-1-clg@kaod.org>
In-Reply-To: <20210309131641.2709380-1-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Mar 2021 13:56:42 +0000
Message-ID: <CAFEAcA8fXS2xEhE60qDDXHhicOVJJyKax+erKJ2Ks64TDP09uA@mail.gmail.com>
Subject: Re: [PULL 0/7] aspeed queue
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 9 Mar 2021 at 13:16, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The following changes since commit 229a834518b950d56fd1bc94923276504d0ee9=
d4:
>
>   Merge remote-tracking branch 'remotes/philmd-gitlab/tags/renesas-202103=
06' into staging (2021-03-08 15:45:48 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/legoater/qemu/ tags/pull-aspeed-20210309
>
> for you to fetch changes up to c59f781e3bcca4a80aef5d229488fd45dbfdbd9a:
>
>   hw/misc: Model KCS devices in the Aspeed LPC controller (2021-03-09 12:=
01:28 +0100)
>
> ----------------------------------------------------------------
> Aspeed patches :
>
> * New model for the Aspeed LPC controller
> * Misc cleanups
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

