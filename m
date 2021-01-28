Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B8B307DCD
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 19:22:07 +0100 (CET)
Received: from localhost ([::1]:37584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Bvi-0004Zm-6L
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 13:22:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5BtH-000324-3o
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 13:19:37 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:35055)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5Bt7-0005Bp-Rz
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 13:19:34 -0500
Received: by mail-ed1-x533.google.com with SMTP id j13so7753115edp.2
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 10:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nmsMT2EZ3Lq9TKEGm1Rkp5MyPybTPY0Qo2pBUJr8C1E=;
 b=qJBlBOyGeKfg7fcHY8lywVku0V77kya4X74sC/p0UIwtXdU91R4ZmMyTr0+Ql3vtMX
 eOaCXtxJ8ODSV8hcFu0WUJMXu1jLWTecLZya83S0r4eKkIuro2xEVfFGNclJQdab7c7V
 hijUSV5+Skq3iM9DspMETyBxfZ/GBxfBH2QJvmPCRrS9gBObJXI98aKqp13UNXHqBUtG
 4nBznYsLKpWP6111BqwRFSylYRR3Piq85QKFv/fpcvTFZVvVl/UOt9BYUl8MsnKaFV0v
 0iqKxdueqAPu+2LmCYYTQAeh2AyX4zffoJx/TxOcJ+JkgKGxFhHFrKmDvVC9C2jidN1o
 h9mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nmsMT2EZ3Lq9TKEGm1Rkp5MyPybTPY0Qo2pBUJr8C1E=;
 b=hgels0n7jSgW0E+i30EPI9XIC+43n7x1B6GKsYi716juHQ/sfdgVnyn1+rQR9jiB1N
 nLnxrCY+eUhwjqqjC9QrDsiNF2nKByokL0jAaC2Q5DRB5XcRc6npPcGK7622r0tlStO/
 MLaubgakQlgiWflstC1gQ139kzcn6lrVwV+DEJtDHRf+IUpVtR1N7nvtqZYTM/lagO/v
 Msude+hLOIKSigZcV5PHekWwt3PW+Cx737qTk9U0jbZXf8GgSsZ9kxcyL1Yq+aOJQxku
 iY5x2RMiJS+iombz9Zmn/sx0Rop2Z3es3BmEB3B+LAqkcqCTiFeHhI6r9L60sJT9Z886
 /CIQ==
X-Gm-Message-State: AOAM530OIoLAPI0KACGIbiLvMjhY84Gj4vjWhc51g5INFsQV/5HJSnR4
 S6rqAl9+2pCIYLbVGv8YYgljshdE8ZXghBYXcBLuYA==
X-Google-Smtp-Source: ABdhPJzmlLO0cc5sf6v4G+ejIFEUkhbsi7gOGML7fk7ltKaAuncrjqCIznV0nRU3kKWJfHMFqQ1ll5RswkL9CQvGnLw=
X-Received: by 2002:a05:6402:5107:: with SMTP id
 m7mr990177edd.52.1611857963887; 
 Thu, 28 Jan 2021 10:19:23 -0800 (PST)
MIME-Version: 1.0
References: <20210127195753.59773-1-kwolf@redhat.com>
In-Reply-To: <20210127195753.59773-1-kwolf@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jan 2021 18:19:11 +0000
Message-ID: <CAFEAcA_3Tcyx5WJazSx2kMxaipAm8B4t2nivKoyVwr53Yd-iDw@mail.gmail.com>
Subject: Re: [PULL 0/8] Block layer patches
To: Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
>
> ----------------------------------------------------------------

I somehow failed to notice before applying this, but this
breaks 'make check' on the netbsd and freebsd VMs.

As usual the build log is pretty opaque, but this looks like the
probable culprit:

env: python3: No such file or directory
gmake: *** [/home/qemu/qemu-test.nU2bcG/src/tests/Makefile.include:144:
check-block] Error 1

The python in the netbsd VM is /usr/pkg/bin/python3.7. Something
seems to be ignoring the --python= passed into our configure
and assuming that "python3" is always a valid executable.

thanks
-- PMM

