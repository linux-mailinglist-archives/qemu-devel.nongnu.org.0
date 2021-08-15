Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 126F73ECA0E
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Aug 2021 17:48:03 +0200 (CEST)
Received: from localhost ([::1]:37406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFIMk-000881-5H
	for lists+qemu-devel@lfdr.de; Sun, 15 Aug 2021 11:48:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mFIKy-0006fp-Go
 for qemu-devel@nongnu.org; Sun, 15 Aug 2021 11:46:12 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:37724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mFIKw-0000fy-VI
 for qemu-devel@nongnu.org; Sun, 15 Aug 2021 11:46:12 -0400
Received: by mail-ed1-x52d.google.com with SMTP id g21so8921315edw.4
 for <qemu-devel@nongnu.org>; Sun, 15 Aug 2021 08:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d5N9aooJUezJ/SOzDXq/L3R0HwIv3qHHbI6lFRfIlgc=;
 b=OlAnroYiXR9MC/oBd4OiQWenhW4hrO81P7N5DQf4F32x0fPDts3Tpgo/OGbN3y5Xvk
 wbxP4uIviUuxlune16Rx85rK8xRnk7LH/TG9948HePE7niss6jEexzcDOZjNtlzS0Yhe
 tEDrMXGyr87JYIQiPlgx3+jP/JLZtopDypZoQo4p9fV6J67rViSOX4d9/PhnXDlgDJ5F
 VrbrgJLarrJjJJ0tRrGyQNZ6IHiqwn/gHUXQX7S1t/LSBUm4ZJF7oJ1v5g91sa9FA0Qn
 YhjLVV/x/Evr5BOXRK4szuvAc6Dbmb1scXyW89rv6UMMPSjflKsIPbyhmkL472O7bu33
 jVZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d5N9aooJUezJ/SOzDXq/L3R0HwIv3qHHbI6lFRfIlgc=;
 b=SInj03fgI/1veP8KvZApRWH37saLJMspy1N+DcdgT6Q6oBk7Vh704b9cVLN7X6kSgZ
 7UT/0u5bOPadfiTOSTYOibMZo+I10NDW97UHjRmCtesOx1IDoUBlmUvf7R0dO6VeOCB5
 b1B5kshQb6o5wrnKSRl7InFZ5MJ5rYWnYMZwz3RvpAwDqFsiKDFKohKLR52vJQiOkXJb
 /TkyYg7ulT5NXml+WgDvkfDV1AQ12DYGwN5pzT4gFZCiBnHFwOyTstOjeYdWGaHXa57X
 jWb6xnsZV9bUdxTlwqLCHfPgR/D9FaVW3bJe+joMixA9pAUqb7QpORYfWVO5ndiIX7ay
 gS/A==
X-Gm-Message-State: AOAM530trgAPrHQbq9Lky7IxK4gh5b4cOY076/4ShfWl/6r+VOk2+o+z
 BKdy7PAanfy9PlpSU6PD7hxAAPnSXcsz5hA+RUU6qw==
X-Google-Smtp-Source: ABdhPJxdya9c3cmxpUR1aMhb+bC7as7vbgk9O+hIgQCUIe2h1MnYZzxMnweYKJ+AOMh56Wcg2t3URTtcSAQEmZ+Kv0c=
X-Received: by 2002:a50:ff03:: with SMTP id a3mr14795808edu.100.1629042369354; 
 Sun, 15 Aug 2021 08:46:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210811064128.2776317-1-kraxel@redhat.com>
In-Reply-To: <20210811064128.2776317-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 15 Aug 2021 16:45:24 +0100
Message-ID: <CAFEAcA-b1M13+LqDz=YEg14WvYXWXqQ_bXE1-PMPQ52nPDt0Dg@mail.gmail.com>
Subject: Re: [PULL 0/7] Maintainers 20210811 patches
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
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

On Wed, 11 Aug 2021 at 07:44, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> The following changes since commit 703e8cd6189cf699c8d5c094bc68b5f3afa6ad71:
>
>   Update version for v6.1.0-rc3 release (2021-08-10 19:08:09 +0100)
>
> are available in the Git repository at:
>
>   git://git.kraxel.org/qemu tags/maintainers-20210811-pull-request
>
> for you to fetch changes up to a4de5e8a0667e3ee43ca9953ec7fd11ff19f2c92:
>
>   MAINTAINERS: update virtio-gpu entry. (2021-08-11 08:39:16 +0200)
>
> ----------------------------------------------------------------
> MAINTAINERS: update kraxel's entries.
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

