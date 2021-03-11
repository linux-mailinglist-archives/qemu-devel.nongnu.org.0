Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C2C337D2D
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 20:06:49 +0100 (CET)
Received: from localhost ([::1]:51208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKQe0-0000Lp-JL
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 14:06:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKQZk-0007MF-OR
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 14:02:24 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:39530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKQZi-0005mO-T0
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 14:02:24 -0500
Received: by mail-ed1-x535.google.com with SMTP id bf3so4422040edb.6
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 11:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8/1PNj1Vli8WWjlAmGN4nSSTwtAD0DKv3QVuweQhcZI=;
 b=zrpCuGBovwSCLP3ixxc234aT0XGB+UaXYatZZ9Fwxkji6enzowffNBhyfCNy79I2YQ
 jQ3/znPX/qfWD2hkHJd+cnuYMX6wcFCUSo2WoDy7slyfkpCImmWPmm9Qvr5TJctxP6bk
 u5g4qiqGAygVxqxjN4/df2hzJEyH29RDY2Gm2eeXtapoUpjfD2rea8DhJbd1KcI6eQqc
 hu3gwEqYcMPrhinxk/rkhroi1ALfwD0oi/kPhRFQCkwq+bZ5lmFmhA+1cqc29yWeecRw
 shTGZ9mjVEhub2AtgQVylBIhsk1DWk6RpwBqjjRk9JLglKTiTL11wHmCyf5VYHnI+s5U
 tnGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8/1PNj1Vli8WWjlAmGN4nSSTwtAD0DKv3QVuweQhcZI=;
 b=nqXL6bm/xuw8XET6kBGAlUexb602976qPiLjYQ0pSBu+Gv/vbToJutxM6tml8VQczp
 umaU+YUrodMy9OlhL233qoWT65+lXyGCk5CLOYxeM8oOtAGUQ4KPChE5YfxHzyORajQP
 V8Bv0JKuV9q6yIXvYPTjDuidboyWbVCTXyIfLLuiDVsy8PkQcKdnRvAK9gcqU+0pQuni
 4iwsPs8fps55UBfLB3VOEKvW3qyB6gXB5LVVYzo8qZqBRjEXDJmbbUUVeUhSQgVcmmW+
 O43hghkgNAutoE/Ppcu1Rolo2oisUwV86K9/XSDEhrFVckaJGyhSDlZusZR9qGXvYQZO
 HUVQ==
X-Gm-Message-State: AOAM532tEUe/rEu56ThdiORE3QeHz2YctAouy8F4sO5iiVQj66kKrYNh
 waata/uLFYcJimCd/0dG+qtN3jHjcbJcNkuNouKt2w==
X-Google-Smtp-Source: ABdhPJxxICil1XQpS8aQek8HHk/EZhcDP0cuFKyMzIb1HnNKLj36KpcKcJPCGxKsMdENERI1k+hpcM0Q+O0X8gA5ykE=
X-Received: by 2002:aa7:c804:: with SMTP id a4mr9873574edt.251.1615489341131; 
 Thu, 11 Mar 2021 11:02:21 -0800 (PST)
MIME-Version: 1.0
References: <20210309155202.1312571-1-eblake@redhat.com>
In-Reply-To: <20210309155202.1312571-1-eblake@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Mar 2021 19:02:02 +0000
Message-ID: <CAFEAcA9dSR_yvsxERtFcC1BApWMH0vqqcn1d89bgW1S_9xmYPQ@mail.gmail.com>
Subject: Re: [PULL 00/17] NBD patches through 2021-03-09
To: Eric Blake <eblake@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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

On Tue, 9 Mar 2021 at 16:23, Eric Blake <eblake@redhat.com> wrote:
>
> The following changes since commit 0436c55edf6b357ff56e2a5bf688df8636f83456:
>
>   Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' into staging (2021-03-08 13:51:41 +0000)
>
> are available in the Git repository at:
>
>   https://repo.or.cz/qemu/ericb.git tags/pull-nbd-2021-03-09
>
> for you to fetch changes up to 1184b411016bce7590723170aa6b5984518707ec:
>
>   block/qcow2: refactor qcow2_update_options_prepare error paths (2021-03-08 16:04:46 -0600)
>
> ----------------------------------------------------------------
> nbd patches for 2021-03-09
>
> - Add Vladimir as NBD co-maintainer
> - Fix reporting of holes in NBD_CMD_BLOCK_STATUS
> - Improve command-line parsing accuracy of large numbers (anything going
> through qemu_strtosz), including the deprecation of hex+suffix
> - Improve some error reporting in the block layer
>
> ----------------------------------------------------------------

This broke the gitlab cross-i386-user job:
https://gitlab.com/qemu-project/qemu/-/jobs/1090685134

ERROR:../tests/test-cutils.c:2290:test_qemu_strtosz_metric: assertion
failed (res == 12345000): (12344999 == 12345000)

Could you have a look, please?

(It's in master anyway, because at the time gitlab CI was lagging
massively and I wasn't waiting around for it to finish before merging.)

thanks
-- PMM

