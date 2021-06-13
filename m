Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D59313A5936
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Jun 2021 17:05:25 +0200 (CEST)
Received: from localhost ([::1]:58796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsRfw-0002sY-TO
	for lists+qemu-devel@lfdr.de; Sun, 13 Jun 2021 11:05:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsReh-00024h-7B
 for qemu-devel@nongnu.org; Sun, 13 Jun 2021 11:04:07 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:34645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsRef-0000Xm-Sg
 for qemu-devel@nongnu.org; Sun, 13 Jun 2021 11:04:06 -0400
Received: by mail-ej1-x634.google.com with SMTP id g8so12205936ejx.1
 for <qemu-devel@nongnu.org>; Sun, 13 Jun 2021 08:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=IO7R1eHy/K0diLvOfu2ZrTk8xrt/k3+tZ9ZsfeWMyrk=;
 b=CS+ERLIv74OSrbH7QoE9pGp1dfz8KGZ91sS5/qXSiyhWFvcs60N4wUcLthjm/Ph3Zj
 WLNnQwP9TBxwETArQq1oi7CiR3s6oXr6JwoA0i+UNhvMwIsYSP0XZdIxHtgcBErPjjXu
 A67vdRlSibNJDV70P71/qGJmVDQmctspazlPCmblOkW2saCip00l77CnplKDYFwBllaO
 N30GujQSOPpS1e2CCftTdRcdFhNDXMDcHGDjN+5uz2/uLEaYgL2rnsZJjCrm/Ot57zWL
 E84y/vZnR9afOOM5oCWGMbiDn2EVi438OPFyLCu8JGLdVJHXcM3GCMd+ak7GPZ5U1w6E
 9PIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IO7R1eHy/K0diLvOfu2ZrTk8xrt/k3+tZ9ZsfeWMyrk=;
 b=ONiTgWTjwVdPto/RSOMbHImGsHKDlSzR8jcONyqG5E90+j4m+qUXMgb15Qj3ZSrn2x
 pqh8KcdjIl0kgCp+IkshhINsIDV/SRmUFvGanD45ip51IXGiEPOLOMpcg0QkDMW3X1d4
 7B0/iwf0FP1OjtKK+/YQxOj5jscAA9CPsEMeoD1XAk9CAGaKG2nFnx38dPqqnP0wDIDO
 gGXhluW/df8JObEg/Pu0Pj2jF9NwzlXwlaNi0Lj296dBKFlwDmtB7p1TxWCIjLBNU9UD
 NtjumjPvTX3e1a+7cDQ1bDfMZaY9Jr9KPnC1H4RojKFjocYF171cgEBJ8E6IOmvD8+Y5
 bPAA==
X-Gm-Message-State: AOAM531YSilG/z3NbogzFPja10LODr+RMfe90wU9p6waSL1AOB2FMjVa
 INMbP9fg6fuUqjfYzpNQzBWhV5FV3BtkjYG/26Yw5XZxeXM=
X-Google-Smtp-Source: ABdhPJz8LQ7+qg8L5g34pHVhVbafJySCAMztD1Han4x4fhvL5RCOBCFf1iqLQJFqrhjSyDSgDLu1H3x1yUDFRyU3FJ0=
X-Received: by 2002:a17:906:5299:: with SMTP id
 c25mr11749359ejm.85.1623596643228; 
 Sun, 13 Jun 2021 08:04:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210613093821.774562-1-elish.jiang@ucloud.cn>
In-Reply-To: <20210613093821.774562-1-elish.jiang@ucloud.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 13 Jun 2021 16:03:29 +0100
Message-ID: <CAFEAcA8OVW=KD+-EK-PV6pYs59eSwJeg=5THtGfpSBUjujbFOQ@mail.gmail.com>
Subject: Re: [PATCH] block: fix build waring
To: Zhiwei Jiang <elish.jiang@ucloud.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 13 Jun 2021 at 15:20, Zhiwei Jiang <elish.jiang@ucloud.cn> wrote:
>
> when i compile this file with some error message
> ../block.c: In function =E2=80=98bdrv_replace_node_common=E2=80=99:
> ../block.c:4903:9: error: =E2=80=98to_cow_parent=E2=80=99 may be used
> uninitialized in this function [-Werror=3Dmaybe-uninitialized]
>          bdrv_remove_filter_or_cow_child(to_cow_parent, tran);
>          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors


Could you provide the compiler version when reporting
fails-to-compile issues, please? (This is useful for us
to get an idea of whether the problem is an old compiler
that's not smart enough to figure out that something's not
used uninitialized, or a new compiler that does more checking.)

thanks
-- PMM

