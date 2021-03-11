Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 008AF33739A
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 14:19:36 +0100 (CET)
Received: from localhost ([::1]:42098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKLDz-00011s-24
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 08:19:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKLCP-000065-GK
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 08:17:57 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:35631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKLCN-0007kt-HY
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 08:17:57 -0500
Received: by mail-ed1-x52f.google.com with SMTP id dm8so2696201edb.2
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 05:17:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=82Fq3ANnZ7FDeJV4ftQb0Bhb3Lo0p10QDVCrvWXGqx8=;
 b=FO+3VnI34h/JVgDcE8sagTcwjZUMDclsOZbaSWfZE4o2+j095UemeX3tJ5DSBrjm5Z
 q8lN9V613Bx0CrQU4AavNt3dTH+v5XdGLZ4ORmcAIJlCrlUQDTyYDYPCHn725mo9tS3j
 UP+yFYXNkdojvF+aEvGTficy3I5gHUm3GKO/gkI5ehh8Dq3l5zcJzUQFBeahsVwBKR0v
 j4l2hi9wriOxs5K5J1wyHj2HFFk5M2Wo0h17pBH2mjayxzfW1Z06HB9iui+5We7NTurN
 1dQ05hb8yW7Dau/Cv7rdjWuVx4M5DN+un/C/bMqDx2nM+A9iVI33HPjrUWsvo2nunEl/
 ddJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=82Fq3ANnZ7FDeJV4ftQb0Bhb3Lo0p10QDVCrvWXGqx8=;
 b=D1521RcZhSSml0nMLUzuIxl/xRC2vS++KRkI3QiX6j1wuuFjuhKMbuiqxyOhFlCOE6
 0bBdt4UNxeJB+SZezlyGdlE9Hm0FqYQrh6W3fhI6IK0uO0E7n2h21rPhRZiNpBaBHlat
 K2VSFtmgav3kD/YUsLqzmdnA/9463px1euanjDbX29QtZ2WasCXtLUFWTmLKh+bVB3sk
 6wS3PO5Bse6K87B66stHyXmVQ6+U7oz0X9aE7kHiv0VsvGcv3WAUEgU6pex1TsAnXK6c
 kOpJ8UOhtWUXmPKr20Vs1nySG0c/cyCE9LCtbcC0Lem9Iybed53/AZQQI0A/cfz1j1R+
 /P3g==
X-Gm-Message-State: AOAM531AAaxL5v7cWHyZKOFUawZ/g++nXzLwu0q6JZHzYc4eR+ySHSnz
 nOixOnj6j8oQCvI6BPLP6HOZw2u3RjX+3G+AtY5FHoJrm4w=
X-Google-Smtp-Source: ABdhPJyOC35VSju2hJVtROrz+1QPSq7+DU8daF7vmMTpCFGLGe/LyndAuodqmDSfmHC2AaQBie7pCHkoIHwmosMmTCU=
X-Received: by 2002:a50:d307:: with SMTP id g7mr8458928edh.204.1615468673371; 
 Thu, 11 Mar 2021 05:17:53 -0800 (PST)
MIME-Version: 1.0
References: <b9b0e381-c045-bab1-eea7-b8112526e5e8@c-sky.com>
 <CAFEAcA_jnLzZN-nA+Cf_HwGjxvOaxUzZ44LYxqpcmw=3eAU6qg@mail.gmail.com>
 <3edf7903-94a7-c16e-2b9e-644e1a41a77d@c-sky.com>
In-Reply-To: <3edf7903-94a7-c16e-2b9e-644e1a41a77d@c-sky.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Mar 2021 13:17:34 +0000
Message-ID: <CAFEAcA8UqE65Qxy=c53CCPdYnVrwvBZGxU9SH9qk7Q6vGKDgyg@mail.gmail.com>
Subject: Re: Question about edge-triggered interrupt
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 11 Mar 2021 at 12:59, LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
> From the specification, I find that software will not clean the pending bit on interrupt controller via a register write.
>
> "When a vectored interrupt is selected and serviced, the hardware will automatically clear the
>
> corresponding pending bit in edge-triggered mode. In this case, software does not need to clear
>
> pending bit at all in the service routine."
>
> Hardware can always select a pending interrupt as it is cycle-driven. But QEMU is event-driven.
> I don't know if there is a chance to select other pending interrupts after serving the selected interrupt.

Something must change that the hardware (and thus the model) can use to
determine that it needs to do something else. The interrupt controller
must be able to tell when the interrupt is "selected and serviced"
somehow.

thanks
-- PMM

