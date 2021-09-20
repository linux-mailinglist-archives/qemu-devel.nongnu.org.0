Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 536904112B0
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 12:11:51 +0200 (CEST)
Received: from localhost ([::1]:38834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSGH8-0000bv-E5
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 06:11:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSGEF-0007Y0-Ge
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 06:08:51 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:41803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSGED-0003c5-RH
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 06:08:51 -0400
Received: by mail-wr1-x432.google.com with SMTP id w29so27970901wra.8
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 03:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZdxdGJcblalaRPkJXQ7NBX+OdPj/4c57d9k86FRl1X8=;
 b=LambHiU4IJP9cWDXB1xs8Vlw+EVMVj5ZrxfFsJ5MYwo+udrx3yBM2YjLwzL0VRH6vR
 X56evmrtwuhR7M8I+fblEcAfkNK49KiQMNUQAYrvBipllHraGT7tORJ9dJkLx7Kg745u
 2O+ZXQO8fwa8pi4kdZVjXw2esam1c6P1QOqgdU44RNBuYRG2cbCXJoeb45tS/XE2043L
 h2SafA/60LASpp8WoHqvD/HSbhLkmJPKSqP01cG5H7ZNDVfa45OLAasnqgDGrF+XWG4m
 r+RbyPMtqXj76UymsykGQ1B9IQeGo74N8A/Ygymfu6gWmZ27EKt/AgNfQt9JdZAu3y9A
 jw+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZdxdGJcblalaRPkJXQ7NBX+OdPj/4c57d9k86FRl1X8=;
 b=o1bm3nTiG5hdcWVoXwLILCuSHkwxmAe3DsKxJLCycKrNXpRZuSLz9ULJSDlYx0Ev6D
 sIs4+9BajE3k4kcViTMBG5EHdHy/rFLmKAW9eJ9F0qjQKibUZEe3jTLuOtMZtsoR1x5m
 kJKd53lemedK7jNVF1d340BA5SHBwfuJle+hEW3URQFtnTKopzzycRqzXiiv7TyONkcP
 DMIiAX2PZipnPBi/Bx1mQaRR29spMpbi0nOfJzBs3Km5a7sBWR25GEqiX/PqlJ+Dkdd6
 B53AbvsYj+gdTArU2wywDewuccf/spK1Fif+IwMnDSuxehRMRFkAfbgVgyyEhiPvByWJ
 YznA==
X-Gm-Message-State: AOAM532zHrmjqPbE5D7oWYGBz5YhJ+Ase3tdkbxP+yfVh4C96DUsm4bR
 sme9hS7f2DmoJgiYgbmcEWlZosIq+NjvpOoJG4gQAQ==
X-Google-Smtp-Source: ABdhPJysqtg+okEMIGMF0XFYPL585lE6sc2M3sH9yy2K2bi95Irmaq0t3P2y2poJmpqu55Takl9Y0rJPnONARnLau7Y=
X-Received: by 2002:a7b:c0c5:: with SMTP id s5mr28989612wmh.126.1632132528377; 
 Mon, 20 Sep 2021 03:08:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210916153025.1944763-1-richard.henderson@linaro.org>
In-Reply-To: <20210916153025.1944763-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Sep 2021 11:07:56 +0100
Message-ID: <CAFEAcA9XxgFYj6jzNGEhgMHhB2UQF_X3ZLigu4sRPrR3Zfj8sg@mail.gmail.com>
Subject: Re: [PULL 00/35] tcg patch queue
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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

On Thu, 16 Sept 2021 at 16:30, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The following changes since commit 57b6f58c1d0df757c9311496c32d502925056894:
>
>   Merge remote-tracking branch 'remotes/hreitz/tags/pull-block-2021-09-15' into staging (2021-09-15 18:55:59 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20210916
>
> for you to fetch changes up to 50febfe212f24a9b91b4224d03f653415fddf8e1:
>
>   tcg/mips: Drop special alignment for code_gen_buffer (2021-09-16 09:37:39 -0400)
>
> ----------------------------------------------------------------
> Restrict cpu_has_work to sysemu, and move to AccelOpsClass.
> Move cpu_signal_handler declaration out of target/.
> Misc tcg/mips/ cleanups.
>

This seems to result in a failure on the s390x all-linux-static
CI job:
https://gitlab.com/qemu-project/qemu/-/jobs/1604251543
due to a core dump running the 'trap' test.

The 'check-acceptance' job also hits a timeout on the emcraft_sf2
test:
https://gitlab.com/qemu-project/qemu/-/jobs/1604251596


-- PMM

