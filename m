Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B8869E23C
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 15:23:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUTWi-0001BK-5p; Tue, 21 Feb 2023 09:21:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pUTWf-0001AX-4y
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 09:21:49 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pUTWd-0000g3-LJ
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 09:21:48 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 nw10-20020a17090b254a00b00233d7314c1cso5202160pjb.5
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 06:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=EJfbVMQ501XvlczRMJfeAMzE28K4xSrRT8Enr8GaQKs=;
 b=zj7ycWqAeYSlxJpJElcQC6lrjIy59fJ4bPpWEqLES+FpeE7TORB3CCQ4scbPw/GR6l
 5YqjH0UKJAyRngvSQ/iW0N5g63zYvx3SLVGtrTuWI79KNAuE1GeyXi63vU5dhtLp6fWc
 TtBMr5gZuCf/1mpQpyLCdUGDX1uCkxvqfkhPsM8a//QJrHKB6U/ir4i6/Zl0NjO+BTxC
 /iWpIQOBldSka03H3phH00buB5aCFuGcy5m3QI0FDcctN4ra1f7AqfF4hPjgnJpVyXxT
 HJyoh9n8o463UKUarTB4GoemgyjpjSWYMbNuQlJayVDRqSBO1ipE25ZAfUJE1d2fHj/a
 FsLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EJfbVMQ501XvlczRMJfeAMzE28K4xSrRT8Enr8GaQKs=;
 b=jooXH6SFUXQYjsyNNaWLWx0uMtUiPHVI4OsDfs54N5o3KFr76x0b5NJPpeKaXTuIIT
 nyU4njjskHcgMI58Unw8Az7jLJiVRCkLfV/ETbsUd0e4wIhOA3RwbYGnKs9gzcJVP8Oa
 94jNyPwgtDvPK0rLRQqu7ntP80z3vUAX4QM1Isf+iALON5v0LwosuJr3XnktBLKHlaqf
 VIMYv8WIGO4iGolQ/6vNtd++EZxkXBV1GvaxLaRSFqrAvNS3zphUgC3kO8FUGU6WD+QL
 GrN2lV7PjY18nDtqNJqbVq/2xJozTBu4BJNjzVlXM7ccLXidLZMD44JO6gdCdjOon7EY
 87ww==
X-Gm-Message-State: AO0yUKUt34UgZhwNw4lEce1q0WNIz4phePS/6GA5wPh7750+QyHL+k3o
 lkgabloaUhfbSY3dX1iVFB+xwLt/yESTur167Yy6iw==
X-Google-Smtp-Source: AK7set/P5kFez/x1ZgxhYVz0sy1PQKl8X+ARI7Uby+qk1XL6a+ql4zcRNAplYlgpuWEMLDw+sUFqkDetbc4F9HSeNqY=
X-Received: by 2002:a17:90b:5109:b0:233:dcb5:ee15 with SMTP id
 sc9-20020a17090b510900b00233dcb5ee15mr1780257pjb.92.1676989306265; Tue, 21
 Feb 2023 06:21:46 -0800 (PST)
MIME-Version: 1.0
References: <20230217201150.22032-1-farosas@suse.de>
In-Reply-To: <20230217201150.22032-1-farosas@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Feb 2023 14:21:35 +0000
Message-ID: <CAFEAcA-uk7V+Mspo9uZ5W9P9beYNEdhs-VSuOAD6S=5cqtPGew@mail.gmail.com>
Subject: Re: [PATCH v6 00/29] target/arm: Allow CONFIG_TCG=n builds
To: Fabiano Rosas <farosas@suse.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>, 
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 17 Feb 2023 at 20:13, Fabiano Rosas <farosas@suse.de> wrote:
>
> Addressed Peter's comments and dropped the cpregs change which is not
> related to fixing the --disable-tcg build. This unblocks the xenpvh
> series and I can tackle the regs split without holding up the build
> work.

I've applied up to and including
[PATCH v6 15/29] cpu-defs.h: Expose CPUTLBEntryFull to non-TCG code
to target-arm.next, and also
[PATCH v6 25/29] tests/avocado: add machine:none tag to version.py
(and some of the rest were already upstream).

thanks
-- PMM

