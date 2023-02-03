Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 357C96897DA
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 12:39:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNuP0-0002Uc-6F; Fri, 03 Feb 2023 06:38:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNuOw-00029d-WD
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 06:38:43 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNuOt-0001Pc-NA
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 06:38:42 -0500
Received: by mail-pf1-x42c.google.com with SMTP id 203so3347175pfx.6
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 03:38:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VPD7V+KyEAzCsUjhERtTeI+99lerqoilvBDQoa41FOo=;
 b=vzn0/sBIjRNFZ9VSKwn7LjE4Uj4abAM4+yW8cXAvmnE1knW+ZnZywVyoo1ADW0q5C2
 3Sn3jKcEjL7LAzv59/+dpHSmMNVeEgseA85dY52LQ23DbHUQR1PLTQTVg9ZJOnKGEI6o
 xCfGhZ0Io+OMTseMQ/UNTjIwwtQ7h+9EaEm6UCAiw2aNudevALOUy6bLJ+Ptp8Dnm3Uc
 OAYh+npCe/yA69Img27ilB6fEEXRPHwiVn/odTHhjKxa0fR3BG08RYhyfn/gysyAqHZE
 KF08PPCfVt982Wk1OMwE0TTQykDhH4U/QrMSLvmTAbTjpGQz+vdegXCnPWkmieAUgEFq
 0zkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VPD7V+KyEAzCsUjhERtTeI+99lerqoilvBDQoa41FOo=;
 b=UrlIYYhkTxxpop4XYAwxA/aGZWVDDAogk0wfzUbHP3GvzHcIic2n6KffSP74rCYOsC
 3mpoq62dyHlEt1DYY45j5IML6hu1WuhRgwlH1GfoRo+U/r/ORrr8KKKrNl8mj0aPYjI4
 4OGh8KHiXvP47JzklTAoWaw2bKNCpNwWvNXorC99L7XG2q1R8gIWTpGm29B2Ivizndep
 NbSDfYigcfLm13IdXVz0VyiIBWw6x8/59Kfri5djH59oNx0tbi66I1r5s7li0ZtbL/BO
 mm2Vq10G2dyUa5liqabf/CW7Vw350IZhAiPxR1NojIblOVXBS+1GbXQaV5K90kaI7uE9
 kHUA==
X-Gm-Message-State: AO0yUKXmtXjTujmZFOo7kzPuDeIziD4jJNM/4e2VlXP8yd/3icc+NKjY
 9fl6aNqCOBf/sDYFhfe2WpFOfeQHlKdYHculXisTvQ==
X-Google-Smtp-Source: AK7set/9OVlX+Rz/+1Qsa2CQTazLsAnE0N9vN0a4r15D9l1060Dsbydbl7K+EwHpWD4BsKFEAaRu/wIdUY4RcUBkK+g=
X-Received: by 2002:a63:1a51:0:b0:4da:e1c7:99be with SMTP id
 a17-20020a631a51000000b004dae1c799bemr1608672pgm.37.1675424318167; Fri, 03
 Feb 2023 03:38:38 -0800 (PST)
MIME-Version: 1.0
References: <167398464577.10345.18365355650640365165-0@git.sr.ht>
In-Reply-To: <167398464577.10345.18365355650640365165-0@git.sr.ht>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Feb 2023 11:38:26 +0000
Message-ID: <CAFEAcA82V7ctOWGcqWFB5A220rUUX8VnB2G_x6vOOmhC9kCFBA@mail.gmail.com>
Subject: Re: [PATCH qemu v2 0/3] ARM: Add support for V8M special registers in
 GDB stub
To: "~dreiss-meta" <dreiss@meta.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Tue, 17 Jan 2023 at 19:44, ~dreiss-meta <dreiss-meta@git.sr.ht> wrote:
>
> Patch 1/3 was already accepted, but it seems is not in master yet.
>
> Comments addressed in patches 2 and 3.
> Let me know if you'd like me to split out a separate commit
> for renaming arm_v7m_get_sp_ptr.

Hi; these patches look good to me. If you could respin
to fix the thing RTH pointed out about using NULL instead
of "" for "not present" then I'll take them.

thanks
-- PMM

