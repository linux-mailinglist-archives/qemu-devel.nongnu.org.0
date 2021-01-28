Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2BF307793
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 15:00:52 +0100 (CET)
Received: from localhost ([::1]:53698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l57qt-0000nV-EM
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 09:00:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l57oe-00088I-Gb
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 08:58:32 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:39057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l57oc-0000ho-CF
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 08:58:32 -0500
Received: by mail-ej1-x631.google.com with SMTP id g3so7886894ejb.6
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 05:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iwMOEzBns7jeQFVIgHNdsutuKOjpYvRGkI+7LFr8Fus=;
 b=BxlUsCYc6uskpNVwJxmF68v9pcu6zTyk3YG05Y6YjIAjgMHuFNMQpK8HK36LcZO1t8
 GetRqS6bqVW4ZyVjKnXg+KSqyGAF6v3UY0y5vPigiXDnm3Ar57GG3BhxYY5GsCEeWkEs
 FpGvHDSYZAY5tMyn1+Ls2R6CmuX0+DSczUhlQAEiB6bSlgjVQbCifM+6sMB7RoqizXF7
 sDcNa8vcqJRz2U5QMq+MQmVq6DfJm3L2jSa+sjALiH3FcGsXLxTu4W82DuOOmUeZ0pE1
 H37S5P8Pz3xgrm9UFW0UmfC/v32u0Dy5ybKDknqVVcG3IzG1L4hwk6vDmSUlT+q6hdec
 LYLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iwMOEzBns7jeQFVIgHNdsutuKOjpYvRGkI+7LFr8Fus=;
 b=E/CEi+xHw4PgG1TdkR8XAu28KuDkW+Q6IS4b4hKMt62j4y1g2rNpT5iqWaBv8VaZ8p
 4ctvaV9rjVScFY5lDTbl35GpWho5zaxuxUIk2ne+owD226HIAaZjrh7j7LWZVbm2KQSI
 foSVN+QBOKU/MwzqYxa4BGUahbXdcQtmV6gDVEnRYu+uMGLQ2JPb00E7Q2SILh/mnTem
 l7qcP108SyMu0MRGDQgeHJ3a92M3Q5Z2iJRhe4fM4mlYPu20u2gW0bN5+tCM7pu+7EWB
 adc5lMUcqYClt0xVl6pA+PKVKIf2CXMy7kvmgqTTQ4oDub3YWba940WBnhQEdgGuAqMF
 VVVA==
X-Gm-Message-State: AOAM531yPDvF+G2F6jzd1tF80SDkLkeNyWmhSMbZMUUMOhwYmNzQHaPZ
 QxiiD7OIFTHPeXP4GmDkR7AQshsLAN+/PV8NjYMFSQ==
X-Google-Smtp-Source: ABdhPJzWYfQ4oABs/n/blpvDNlb5YZ5aWG4Ty+6r+zwaAejmwxPKh0nU1P6Ybp43j1+4Kz2yZ+qIBCkPLU4BvTDBTCw=
X-Received: by 2002:a17:906:2747:: with SMTP id
 a7mr11733128ejd.250.1611842308549; 
 Thu, 28 Jan 2021 05:58:28 -0800 (PST)
MIME-Version: 1.0
References: <20210127195753.59773-1-kwolf@redhat.com>
In-Reply-To: <20210127195753.59773-1-kwolf@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jan 2021 13:58:17 +0000
Message-ID: <CAFEAcA-vKw48x=5N_KQLZZovZFuKxaZ+jWFstm6LzLJaU3dn8w@mail.gmail.com>
Subject: Re: [PULL 0/8] Block layer patches
To: Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 27 Jan 2021 at 19:58, Kevin Wolf <kwolf@redhat.com> wrote:
>
> The following changes since commit bf159f0bdc7b8e7aa8342dedb3829ca744c1b612:
>
>   Merge remote-tracking branch 'remotes/edgar/tags/edgar/xilinx-next-2021-01-27.for-upstream' into staging (2021-01-27 17:40:25 +0000)
>
> are available in the Git repository at:
>
>   git://repo.or.cz/qemu/kevin.git tags/for-upstream
>
> for you to fetch changes up to a44be0334beae3a9affb4a3a92cc6852993d7a84:
>
>   iotests: rename and move 169 and 199 tests (2021-01-27 20:53:14 +0100)
>
> ----------------------------------------------------------------
> Block layer patches:
>
> - Fix crash on write to read-only devices
> - iotests: Rewrite 'check' in Python, get rid of 'groups' and allow
>   non-numeric test case names



Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

