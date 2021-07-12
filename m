Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B50B3C5CEA
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 15:04:25 +0200 (CEST)
Received: from localhost ([::1]:52576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2vbk-0000VD-82
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 09:04:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m2vXL-0005sG-Lb
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 08:59:55 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:41546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m2vXK-0003xy-16
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 08:59:51 -0400
Received: by mail-wr1-x431.google.com with SMTP id k4so19181651wrc.8
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 05:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=nYgPWz63U65U6Pss2CyZAjYQ+n6yRgASvG+P2MtDFPc=;
 b=pcL9I9PH4CDNEhIe/d9mQ4/OLpO7G4HVsMCOyLNQ+3jcA3nAGzfnGFO3SM445qvUxy
 ly+wTs1mrcp1FBhKx/JF30j7XRGYyrOU418sv4QVO8EZbBXFqal9bl342A+Zsu8IX0af
 ejoauAOxuaIrJXJxR+11zA3A2UHyVm2pfvqsoT9AHP8XqcuyuCRJ2Z/P1bwdE616O0XL
 ntGWnXLzeHyKMP3H2DYJ3+5L6arsn8JHIdaTCIQLhGLqOnjvLSz0FilLRNoG/LmSbik6
 hS9xjD39bCKZs3VbsNvgX3MGuvOEL2AYvw7GxY59/LLmR8xerzYh7APaWNrQ+7uK+KfI
 vkQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=nYgPWz63U65U6Pss2CyZAjYQ+n6yRgASvG+P2MtDFPc=;
 b=bAv4cE2noswQtM4XpOUrOihFWSEfQPBxnEio4z5XViZdqPgI7Yio7Q2EoS+r1DeevS
 TieoWZ/qPX3T8u1t0gVSzAZOdUpwO7DVaDUA9hDrmBL1gI88A2/ulxAH1/BDz7IZNEik
 8+vGz7WPeS9ArBXZvd6I6XKJ85fTzw4l7wKGqVxKhINKlfFjze+17rpXf+Ej/3+mO2tL
 YLi3sqCJ2E6LBYUnD/1boTCj/HpCqRPnNlYuethSCDuRr0z6tGrQkNps65kOfYtrfkCw
 U7+0lRM+p0NgN5mutR4u3Vg1QxslDtmiUjs8Uoz4iXm+kLpNsk1vKbZQpdR7Y5YlvnzM
 wdzA==
X-Gm-Message-State: AOAM533l8IKoPKkP5XCATKijhLG1xBeeqg8KxfJ0ymllg05uOeICjqsN
 wu6kn+WZ2RvS9jquLEfJU00gsw==
X-Google-Smtp-Source: ABdhPJxtm4prWBOU2OJv77dE8AtVYZtIEYWnxdcB9eoBuP3pCin7iLFerXmbvFMirAhm0k6lFLYqKw==
X-Received: by 2002:a5d:6849:: with SMTP id o9mr21592989wrw.250.1626094788777; 
 Mon, 12 Jul 2021 05:59:48 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w22sm20082294wmc.4.2021.07.12.05.59.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 05:59:48 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7ABD01FF7E;
 Mon, 12 Jul 2021 13:59:47 +0100 (BST)
References: <20210712122653.11354-1-alex.bennee@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: Re: [PULL for 6.1 00/40] testing and plugin updates
Date: Mon, 12 Jul 2021 13:56:28 +0100
In-reply-to: <20210712122653.11354-1-alex.bennee@linaro.org>
Message-ID: <87im1fvgak.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> The following changes since commit 86108e23d798bcd3fce35ad271b198f8a86117=
46:
>
>   Merge remote-tracking branch 'remotes/vivier2/tags/trivial-branch-for-6=
.1-pull-request' into staging (2021-07-11 18:49:25 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/stsquad/qemu.git tags/pull-testing-and-plugins-12072=
1-1
>
> for you to fetch changes up to 88e5a469c820b6242e280d0a7e8128371f535bcc:
>
>   MAINTAINERS: Added myself as a reviewer for TCG Plugins (2021-07-12
>   11:10:14 +0100)

I'm sending a v2 (pull-testing-and-plugins-120721-2) of the PR which is
re-based and applies to fixes from Paolo. Just running it through CI now
but if you want to take the v2 tag now you can.

--=20
Alex Benn=C3=A9e

