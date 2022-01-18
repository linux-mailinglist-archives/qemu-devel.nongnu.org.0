Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5411F4930E2
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 23:35:52 +0100 (CET)
Received: from localhost ([::1]:56462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9x4x-0005gJ-Eb
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 17:35:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n9wwe-0005yq-CK
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 17:27:16 -0500
Received: from [2a00:1450:4864:20::32d] (port=33598
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n9wwb-0003ID-Or
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 17:27:16 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 o7-20020a05600c510700b00347e10f66d1so3265052wms.0
 for <qemu-devel@nongnu.org>; Tue, 18 Jan 2022 14:27:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=eXGKeSZFt1Gwyymw77YKL+K8bC7WKQGkhhBfiy+Ne/o=;
 b=N6rinpjZWoTrg/C9GbFVCI0hulO/thnstAwI9qIIIhXX38bzYZDAZZDF4zUloEB20o
 IPb4UqhLFyjf8fan71iVl56ytlXreAEUrjRqS+J+bx9MFsHXRa6H5O3Sf0be+tOVBVX6
 GGmafFv+aNliPE8WMF5yc+6EHPhMaXlO0iAUvZTtes3tHRNslsRPk7ZgoEJSQ5azrRDQ
 6fQ9AvS1nlSJzZtGKbPD6xwk4bJIHTHD0KxpVcLGlvN2VGpz3BTfrBs470P89bIoM4XM
 Xwz2i3EauaPzDO3HUnIsxyjmF8A8Zl2XhBVOBA3luz3Z/PF6l6hQacu8lW3YLCp4UM3i
 81hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=eXGKeSZFt1Gwyymw77YKL+K8bC7WKQGkhhBfiy+Ne/o=;
 b=eVOVdSuEiHNBL+NUWUiQS2+oB30HVmmXTgPKSLO1PqaSqObB42vuuOv45y1TMtokt1
 qXAiK9L3RoFfkR6pQIbKnl2rA0XlkgHBEdkUWOgOy1LQjHP7LBDkcQG2+WZZefaJKS4c
 GZHXvJU6H8t3aqi1bkWwZIBUNegaL+8ZzpBTEIb9T3z/yyQNYfSIb0qBcxpKRTnNQF6X
 C+lCCo5EdidKt+Wdo/TZFgu/qq5nyU5s+8o6xZyrEoJmgm5pfB+P4pk6FHhYALL4xDDT
 8hnLdfUcnAv57HzyKKHSoHA7voP/qvMhtS8wThgD/G0/Unmrh+rJEJVZ4CccVuMUgUmH
 ayuQ==
X-Gm-Message-State: AOAM532nV/r46w7Gb8d3ffyAfuyIzJGZCTRRf+vKDNb5MXyFlYKkk09Q
 TCwHsf7+vCxdqFiGJm0TwPwIpCRYfq5Pj7xc86kHAw==
X-Google-Smtp-Source: ABdhPJyNsDdDvE8Dp7ZsoTBMoq/0Pi6eMqbddSY1tdTlpEEpcwu7/3vbJNkJq4WXQ2G83cFTTHCYovXEmyfS0WGSB3Y=
X-Received: by 2002:adf:e907:: with SMTP id f7mr26052413wrm.319.1642544831513; 
 Tue, 18 Jan 2022 14:27:11 -0800 (PST)
MIME-Version: 1.0
References: <20220118130730.1927983-1-clg@kaod.org>
In-Reply-To: <20220118130730.1927983-1-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Jan 2022 22:27:00 +0000
Message-ID: <CAFEAcA-Mt5uEDn4BUO4LVmhopOLp6BxVv_Zk6eAEJEzZJDmExg@mail.gmail.com>
Subject: Re: [PULL 00/31] ppc queue
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 18 Jan 2022 at 13:07, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The following changes since commit 6621441db50d5bae7e34dbd04bf3c57a27a71b=
32:
>
>   Merge remote-tracking branch 'remotes/mcayland/tags/qemu-openbios-20220=
115' into staging (2022-01-16 20:12:23 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/legoater/qemu/ tags/pull-ppc-20220118
>
> for you to fetch changes up to ba49190107ee9803fb2f336b15283b457384b178:
>
>   ppc/pnv: Remove PHB4 version property (2022-01-18 12:56:31 +0100)
>
> ----------------------------------------------------------------
> ppc 7.0 queue:
>
> * More documentation updates (Leonardo)
> * Fixes for the 7448 CPU (Fabiano and Cedric)
> * Final removal of 403 CPUs and the .load_state_old handler (Cedric)
> * More cleanups of PHB4 models (Daniel and Cedric)
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

