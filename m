Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A7736DB27
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 17:22:12 +0200 (CEST)
Received: from localhost ([::1]:48074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbm0x-0006zG-4t
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 11:22:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lblxM-0005Tz-D8
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 11:18:32 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:43624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lblvl-0001Oq-N3
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 11:18:28 -0400
Received: by mail-ej1-x62e.google.com with SMTP id l4so95149787ejc.10
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 08:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=fbgKVoqPrGeZr09GqzdDJ4xjYjy3lHJup36G5PNONYI=;
 b=Nvy14FBSHik1RreB+ywTb+R9jpiba8wnNe/avsLOXLagvPFC8+ICiAhkyIS3e80Ps7
 u3vMtnkRU30/tBriQ9tbI30eyEJARNduVjz9pJ8Y/B53UKRHpCquciInpitSjYBdtdvh
 Z2sgIEagiqAuKPp/tJO6S0zERkoIU5mYxCaWMXcsvEVhFBz/8I404qPh3wzScy+bNbXR
 ShXWbfz6mWy7VfKoaPLmwlNpeq8kPQYDPej7XISuQ+yrJL6vFVoBmhVtcT+dOO7G2shs
 0IeZU6RU9Kdt83X7oU/TDkBz/41O80eLN5iQ0JF2uGJCHAVW9DEt1CKEZkvVr98Rila7
 V4NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fbgKVoqPrGeZr09GqzdDJ4xjYjy3lHJup36G5PNONYI=;
 b=l6Yr/qOeJHPOLw3IASlErhd7vt0EoJFgzebwSVGCdZbD/1x8kofz95upeL04UX692Z
 Z0rjmoGUCrUw0mRi8tH5p6ZZlzap1Zm3F6BJcRxanqhNT+uvUN7PlkHAM9Y6PRuwraHA
 rtjMhQxLc7kiiZCWVg9oOFbmBoy+h9KsPnPY9AOq51IIHNeu4ntmLbXZeEAI6mU73huR
 YTMoIabdULaPJgNkgKt3cLHAKiElzR63seJKJcKoOcQIYOqOTQyccqIBaDDRLHBqjV+z
 OatBcw+jQzcI3JVrh/kFqXwUp6TAdeM8iAM3f1uCS242/j1K7ddx0hNqxIN8ipJy+9+u
 OPqw==
X-Gm-Message-State: AOAM532tmQ9ireOOD4Nki+rcNLxLGbQtfHH9O4K+iPbpQPZkOmpy6Dwg
 DqnIP4ULynyPbQZb/BYRLYzlJC2Iu39rIPQ5ZHCb+A==
X-Google-Smtp-Source: ABdhPJzvUpMEJV6L2xluw2lFM3Z4rrVgoPDh/VORlyHrc2kgHsy62xr5kwnuI/OraDkOoBbOVpHAiSYNJON0F6MbaHI=
X-Received: by 2002:a17:906:1dd3:: with SMTP id
 v19mr29184372ejh.4.1619623004033; 
 Wed, 28 Apr 2021 08:16:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210428144813.417170-1-philmd@redhat.com>
In-Reply-To: <20210428144813.417170-1-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 28 Apr 2021 16:15:44 +0100
Message-ID: <CAFEAcA9_5C4sLwb-MXwg-yCgN+Esb0mop=baCv5kgoW58UPQzA@mail.gmail.com>
Subject: Re: [PATCH 0/2] virtiofsd: Meson build fixes
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>,
 Connor Kuehl <ckuehl@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, virtio-fs@redhat.com,
 Stefan Hajnoczi <stefanha@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 28 Apr 2021 at 15:53, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> A pair of fixes to allow building virtiofsd without sysemu/tools.
>
> Should this configuration be tested in CI?

Does the configuration make sense to support? I thought
virtiofsd was only of use with system emulation ?

thanks
-- PMM

