Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F502304165
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 16:05:38 +0100 (CET)
Received: from localhost ([::1]:46412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4PuT-0003Yd-5q
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 10:05:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l4Pnf-0003lu-5z
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:58:35 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:40146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l4Pnd-0001gi-8h
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:58:34 -0500
Received: by mail-wr1-x430.google.com with SMTP id c12so16812322wrc.7
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 06:58:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=iSFsqH3+jAWKqIg7kZm0YReysM4e1/nWFlIJ0psXCdE=;
 b=KU1hw2BkNbkCFTLoOhf6pfcoqT4ejWrHhsi9ba+mjGEFFMmEfW6pkv2cDTfpLfX2RM
 fxRVfuihjt6qIx4CAGEs8jIZOOD4bc/UNJEDQab2FOyPXh8Gy5K3AP+Kq3QnL3cZW/mm
 YOCk6kUkhF7n5rV3BYLvSEIb6rBYSX5jyFqykXSPKr5BQuknefj6wiV6+0FJkUquLjhh
 YC26Rs44nzJqzkebEen+Q/Jb+4nkhEcvjPMGoHECRAbTNkL++mGoF/0mRkHZGsvgkdAK
 ECn+ABJubcCILvCnIXp86gSP1jN6fWM3LbJg3DpkW5rqYR+R+3Bf8ePDAeNzLetgvl0b
 SH8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=iSFsqH3+jAWKqIg7kZm0YReysM4e1/nWFlIJ0psXCdE=;
 b=pyjEipKDgw83mNzaD1YUSaEaEmOY7YToPtRfsGtiDw2NG4oLdvDrpDhi/jtaRPQWq4
 MEdtaM+Yi9lFc7pNsytV1PuL6gD8UCyYW29piMQd4g4OPntjpiVin6/fWl7dxAvFsGj/
 w3cMQkBQiEtETr9DbiiBWXJ7tv/KHRub0KJ3yQ/4twP1pnGQOpGT4xrtvIFur7vThZoK
 L4+Io3SXmxAbUzjgxsL+pLUPdVMPBr/b6rD0s5Vbcpxu5DZ8zZOFbcHMqUWToJRnh7Zp
 iWsABcP+644Hsi+bnRPvi1PfctRXrrr5pRZSU/wxUsveLghMCfnzNrkmgK/GA9PndULS
 HFOA==
X-Gm-Message-State: AOAM533rVx5JKG7Z2pZ07rWa8co8Sr8uKzC5IbLHwfoH3Buw7ypciDWm
 Z41GZFUIx43Q1uPI5M8Ja+eG2A==
X-Google-Smtp-Source: ABdhPJwIvjeUnaYExvZs7UryBYfk4pL7qv6vJaNm4QpPI8l3M75rLgGHcdpZJoNsh8386GOhp4ghTg==
X-Received: by 2002:adf:ab1d:: with SMTP id q29mr6325447wrc.415.1611673111701; 
 Tue, 26 Jan 2021 06:58:31 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l10sm13193183wro.4.2021.01.26.06.58.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jan 2021 06:58:30 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A470D1FF7E;
 Tue, 26 Jan 2021 14:58:29 +0000 (GMT)
References: <20210122204441.2145197-1-philmd@redhat.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 00/12] buildsys: Do not build various objects if not
 necessary
Date: Tue, 26 Jan 2021 14:57:44 +0000
In-reply-to: <20210122204441.2145197-1-philmd@redhat.com>
Message-ID: <87eei7ycbu.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> In this series we deselect a bunch of features when they
> not required, so less objects are built.
>
> While this reduce pressure on CI and slow systems, this is
> particularly helpful for developers regularly testing multiple
> build configurations.
>
> All CI tests pass:
> https://gitlab.com/philmd/qemu/-/pipelines/245654160
>
> Supersedes: <20210120151916.1167448-1-philmd@redhat.com>

Series looks good to me but I guess you need some sub-system feedback.
I've sent a few more patches that might be worth rolling in to better
handle check-tcg/softfloat.

>
> Philippe Mathieu-Daud=C3=A9 (12):
>   configure: Only check for audio drivers if system-mode is selected
>   tests/meson: Only build softfloat objects if TCG is selected
>   pc-bios/meson: Only install EDK2 blob firmwares with system emulation
>   meson: Do not build optional libraries by default
>   meson: Restrict block subsystem processing
>   meson: Merge trace_events_subdirs array
>   meson: Restrict some trace event directories to user/system emulation
>   meson: Restrict emulation code
>   qapi/meson: Restrict qdev code to system-mode emulation
>   qapi/meson: Remove QMP from user-mode emulation
>   qapi/meson: Restrict system-mode specific modules
>   qapi/meson: Restrict UI module to system emulation and tools
>
>  configure           |  6 +++++
>  meson.build         | 55 ++++++++++++++++++++++++++-------------------
>  stubs/qdev.c        | 23 +++++++++++++++++++
>  MAINTAINERS         |  1 +
>  pc-bios/meson.build |  1 +
>  qapi/meson.build    | 34 +++++++++++++++++++---------
>  stubs/meson.build   |  2 ++
>  tests/meson.build   | 11 +++++++--
>  8 files changed, 97 insertions(+), 36 deletions(-)
>  create mode 100644 stubs/qdev.c


--=20
Alex Benn=C3=A9e

