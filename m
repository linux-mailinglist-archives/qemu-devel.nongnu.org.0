Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE6B69935A
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 12:41:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pScdR-000802-6A; Thu, 16 Feb 2023 06:41:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pScdP-0007zg-U1
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 06:41:07 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pScdO-0000zi-0T
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 06:41:07 -0500
Received: by mail-pj1-x102a.google.com with SMTP id mg23so1650305pjb.0
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 03:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HcDU0QdDBp6Yu8TjFSb3VmDDKlCY+rGLjdYpbDC/h1Q=;
 b=nWxQNRUADSRrTp10zKdldphEMLCx+zS3gH4e3q/aVxeOW/9OaGMeNWh07jHq14aRgw
 6sOvq6u+xvxPeYHta9pQxQjD9z+ZaCinL0defWRx2jpCywuC8oSqYgY61XMU01YM4MB8
 WvdHjFgFwEuIuP6OqPkaTE8SLmrmxXECj2GP01cLrZbWlpjQHYnJULMXuCX3WXDPJguJ
 OHCwk8eYJcwAE07fY1TDOalYtMstM9Dr+vx5d3RVSN4k8fSiD9GNZiSj1EyoWLPusyn8
 4mugDd95LDrs0Yl/hPko7nuC/0s4YIIKks6Rpxh4C5waGUazeafo0Kg6acx3uAEnLgS8
 wV6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HcDU0QdDBp6Yu8TjFSb3VmDDKlCY+rGLjdYpbDC/h1Q=;
 b=FrWMlSSdrbVfIY2W8KVeZ1JFpR+yMgEUFGNna57+fpLbO6Ta71iy69O188AO+tQoCS
 S1A8JTkR1QGUCjwouZoledfALvscEwcx9qIuVnG974a7hVOL3t3rW9dgQuEFgkaMBNrV
 6yvJSWnFOcFtQgBc/7XK2rv/84kP+64HgKAUGRPzyl5bqjBVHfyGOMXnJVgkAImx7T2V
 uBLI8Lb/UkfBQ7wJzwMI9THv6ATlnAGzNTkCKwBVxLiPbXmhGgjMsSZE19c9HF2nDsk+
 CtmTInfELaQIz0eXCnVls5BJXjdZ9TReHIcpnNrRG0NRIk0FSmPCqCK8fkvPQZCC+AtO
 fBTQ==
X-Gm-Message-State: AO0yUKXAR5N2SrIBSGmNcO3yxjJCV4MwxMWXaQ3Q0KMo/inTt3VM/3XA
 CL2YYwuz6hKrJx3a4/Qe0UjNsfZA8XYDKUzrjE2hSg==
X-Google-Smtp-Source: AK7set/Ce+HDTeH8BnNWuaA0z4ErlysWxitsd7W3p0Zr9P5tvLcAMCSm2qVpXytfqmUYmKNQEk4Mtoq6cACl1C11GRM=
X-Received: by 2002:a17:90b:5109:b0:233:dcb5:ee15 with SMTP id
 sc9-20020a17090b510900b00233dcb5ee15mr523032pjb.92.1676547664551; Thu, 16 Feb
 2023 03:41:04 -0800 (PST)
MIME-Version: 1.0
References: <20230203134433.31513-1-cohuck@redhat.com>
In-Reply-To: <20230203134433.31513-1-cohuck@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Feb 2023 11:40:53 +0000
Message-ID: <CAFEAcA_QiVe=ZZ1VTVwUiGh6EL8F7qXT=3dnEb+xzUZORO_4Dw@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] arm: enable MTE for QEMU + kvm
To: Cornelia Huck <cohuck@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org, kvm@vger.kernel.org, Eric Auger <eauger@redhat.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Gavin Shan <gshan@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102a.google.com
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

On Fri, 3 Feb 2023 at 13:44, Cornelia Huck <cohuck@redhat.com> wrote:
>
> Respin of my kvm mte series; tested via check + check-tcg and on FVP.

I've taken patch 1 into target-arm.next since it's a simple
cleanup.

thanks
-- PMM

