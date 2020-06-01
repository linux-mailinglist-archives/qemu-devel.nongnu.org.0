Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2C51EA3C5
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Jun 2020 14:22:21 +0200 (CEST)
Received: from localhost ([::1]:46778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jfjSO-0004fN-K7
	for lists+qemu-devel@lfdr.de; Mon, 01 Jun 2020 08:22:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jfjQx-0003QN-Jm
 for qemu-devel@nongnu.org; Mon, 01 Jun 2020 08:20:53 -0400
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333]:33351)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jfjQw-0008QH-Du
 for qemu-devel@nongnu.org; Mon, 01 Jun 2020 08:20:51 -0400
Received: by mail-ot1-x333.google.com with SMTP id v17so7826495ote.0
 for <qemu-devel@nongnu.org>; Mon, 01 Jun 2020 05:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=46L4UkwAn6aAj+zmeQQFs/p3FOsUUtQrsp2kjpU03ww=;
 b=TOOdbpdiomXtuIrjkUQ3IPpLtEDLEbPOOApYDH08hcT2rginG8IcAVaLyAUzvTr7UI
 1U/jM+1eAhkJMQF3dUZQSQeHwlDWXfH7QEi4Cn0xrZGvtYAAPsDOvHtzV+Uh9Ccaasmu
 f4vEbfwmvLcM4rn/B1vfbxLpGHz5ODz2rGJYw+h3Pdzp2pITnf+UF3P65bR4HbqbPvhV
 sq5N82x1UJvsNrWTPhk7+h8vPQtqr4gia7QEm9+QG22gkmX8/gAM5Ao5rVpckxCrZlHF
 r5DpKy5zCLiVm+82ONUDWTTAh9+Hm1O6FteAkPNDp7jBWVMmvcmZ4F56wxyqpx5lPAM2
 bmOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=46L4UkwAn6aAj+zmeQQFs/p3FOsUUtQrsp2kjpU03ww=;
 b=hRFQ/DpRgXBkHShA1lS+CorV62cHt5AQ/gyk9kqQ7hYUUytN0p2mFeFPtPhgwKs8E0
 /nWk5ywB86k0ibYmmBMymTVAMUQsMMU1+QUxlcFYEz0N2zdncMM5Pu0nfqmUWZ10KkfT
 UQA0Qfn7aKbhwZhVpFqWx4mFT/GW1vaXJCs6uzd81dJi+Hyht9Yyq1k+X0bX1o3D2IQD
 4I3VsYB3jgqL1Lghy/38YDrln5+MVyVVpb0W/ElRE1IJxpeQw4DZfci2V1QkfDx1YNTR
 kVUW1MnuaitsQ8v9mtfmdncrq9J6uQteRy2Ugcizw08ZvGFoSqc/e633FhztSwDNk8FX
 vMBg==
X-Gm-Message-State: AOAM532zqmnyXjMtuywJgoN+FGDIh78/f4kyNKGisSqj3bItCrjPiQPM
 dn0vL2pWRth9Mm2OAuMKrKoOWZ3JUdPb8n3teTPtYg==
X-Google-Smtp-Source: ABdhPJxW/N8ny36PBbGC/9Q4eld3etByWhQCYjhjNUq/06fhWmnA8emOb0u4SOrv1RhQHQISmxdRXefyN2tY1buonYI=
X-Received: by 2002:a9d:3623:: with SMTP id w32mr16218547otb.91.1591014049267; 
 Mon, 01 Jun 2020 05:20:49 -0700 (PDT)
MIME-Version: 1.0
References: <1591013898-23391-1-git-send-email-aleksandar.qemu.devel@gmail.com>
In-Reply-To: <1591013898-23391-1-git-send-email-aleksandar.qemu.devel@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Jun 2020 13:20:38 +0100
Message-ID: <CAFEAcA-Z6bcXW3nAqnv+CCTqy1JhZjdqJcdwHApFuUejutH+BA@mail.gmail.com>
Subject: Re: [PULL 0/6] MIPS queue for June 1st, 2020
To: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x333.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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

On Mon, 1 Jun 2020 at 13:18, Aleksandar Markovic
<aleksandar.qemu.devel@gmail.com> wrote:
>
> The following changes since commit 4ec2a1f53e8aaa22924614b64dde97321126943e:
>
>   Merge remote-tracking branch 'remotes/huth-gitlab/tags/pull-request-2020-05-30' into staging (2020-05-31 20:43:45 +0100)
>
> are available in the git repository at:
>
>   https://github.com/AMarkovic/qemu
>
> for you to fetch changes up to a08d60bc6c2b6469368fff3d38dd5ddd16dd36be:
>
>   hw/mips: fuloong2e: Set preferred page size to 16KB (2020-06-01 13:28:21 +0200)

Hi; something seems to have gone wrong with your pullreq: it is
missing the tag name after the git repository URL...

thanks
-- PMM

