Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0103576DF
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 23:32:48 +0200 (CEST)
Received: from localhost ([::1]:34436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUFn6-0006g1-1P
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 17:32:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lUFlI-0005TL-D0
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 17:30:56 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:46624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lUFlG-0003v8-Qm
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 17:30:56 -0400
Received: by mail-wr1-x432.google.com with SMTP id a12so9688149wrq.13
 for <qemu-devel@nongnu.org>; Wed, 07 Apr 2021 14:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=UVlJAUtgQxoqGlMuMmdx7EYsfQAB6u0qqJyv7UaK2PI=;
 b=Bz2DWYU+jvVXXvdMymUQlR0e8QGX6tcBUpBR+t6zj1UgFSYeoMRvthA/IHiqnVRFYS
 ENz+pxZ5/+11NBGrv4BfIorvkV13QxTMeT4PwbA5BxCdDhL+Z4YSq0bStriUAG+vOebu
 i1czUdC/ruE7OruSOU/KVBB6a5LzWiXkHwvq4LI7PikhgnZZ/tSmHVxY1E+pzuRZBuU3
 KVfvebJjc76ckdShTrxL1b5zYq9iR6k2mrEU01ERsijcxKLlRCeVjWC1ja9Zl9BliV3/
 k2vvyTvBTD3kpDTqphD4u03OFAQzNQNyQF3jfJPqUQLBWIH7GHkidJjzj2Les8eN8qML
 vAuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=UVlJAUtgQxoqGlMuMmdx7EYsfQAB6u0qqJyv7UaK2PI=;
 b=XzAKDNQ2COCKj0xkMomDyB0OZho9XsXfkCSWeSZXkMpLavKqu8uXTK90ttzuA+B4ZZ
 nhy7FXA/rpFZD1Yezh5ulrPTm4jTbd1SvAeAUsBfef2KadZ916PsQDwp2nt/grp6MLDM
 De+5pnRCSWMU+n8GZ2ZkXct4G85U0aksPd/u/amEAEjD786ZBVos9dnJ95nC/qyn8WnL
 Ewcsd3S/fDDz23OItNuvT/HljTAFYmjUiUUktZrJ+jMwvPbKiCKz9dIdKE3mltzrjL6a
 9+ilLAgpCXn2bvsN/MU+v7y8a/oUHSgJgiwspzlDErRqN9FEYZQ/vwV402YfucTtnun8
 HKDA==
X-Gm-Message-State: AOAM530VxRQHdDSKD7uimvRS1Y6V046paDnILj5WZJhtc346x/p51A68
 vPh83TSB19zOHuorhIo/K8jMfw==
X-Google-Smtp-Source: ABdhPJx6INQK8bRxqIaH+3QgEfJuHPuyDrJetnfy4e6umKXej7U9RBrjXyyJnUoKbTGAc7d5YdNLUQ==
X-Received: by 2002:a5d:5046:: with SMTP id h6mr6667449wrt.265.1617831053073; 
 Wed, 07 Apr 2021 14:30:53 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r128sm3395692wma.26.2021.04.07.14.30.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Apr 2021 14:30:51 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3B4D71FF7E;
 Wed,  7 Apr 2021 22:30:51 +0100 (BST)
References: <161713286145.25906.15042270704525675392.malonedeb@wampee.canonical.com>
 <161782908442.29743.17585290508436200821.malone@gac.canonical.com>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Bug 1921948 <1921948@bugs.launchpad.net>
Subject: Re: [Bug 1921948] Re: MTE tags not checked properly for unaligned
 accesses at EL1
Date: Wed, 07 Apr 2021 22:29:51 +0100
In-reply-to: <161782908442.29743.17585290508436200821.malone@gac.canonical.com>
Message-ID: <874kghvl2s.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Andrey Konovalov <1921948@bugs.launchpad.net> writes:

> Is this with QEMU master without the patches mentioned in this bug?

This is with Richard's latest series.

>
> Which kernel version do you use?

v5.11

> Could you share your kernel config?

We are just testing with Richard's config and eliminating compiler
shenanigans now.


--=20
Alex Benn=C3=A9e

