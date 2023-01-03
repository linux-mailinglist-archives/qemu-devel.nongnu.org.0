Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3683565C0E6
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 14:35:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pChRf-0007Bm-UU; Tue, 03 Jan 2023 08:35:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pChRZ-00077I-R4
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 08:35:09 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pChRX-00069D-3m
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 08:35:05 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 a11-20020a17090a740b00b00223f7eba2c4so3347174pjg.5
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 05:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nktRPSZnjgDiIc0n0U2+nXqIBd00RqrbCP05qSZT7f4=;
 b=KpC1aTffotRgfFnwc6ylftlWxDML8m9lMhAtw7vmD4lllvuREFyz8ULxT7EUoPjBtC
 qA2E/+7Zj79eBQsKcE+81aBf0wXiNTNqY82aGt9ZP9cLShcR4Wd36sVlvX8EhsPZdN3Z
 yPtLB0p9ZOl1ovvh24SMecr+tvCO70cJgrMqSvno5hJEJxKpP1PHyyNOFZ+SQTSwhRqP
 So730ccBouTqtYN3PuWde2wjvyKrkh2hc8ZIfYwY/wenwCC2XclMfwFI9m8EdXI+E8Aj
 A5TyjZwkQtV2eGkdzmu07tcxSZyfz3y/gVy/bHbievP9R2lHDmtSE+ioSx8M/dxVq/Xm
 v6aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nktRPSZnjgDiIc0n0U2+nXqIBd00RqrbCP05qSZT7f4=;
 b=wgatUANSJA0SSKosdgwq1nPb/Rz+6xYEFkExfAFGam90Ur9WAV3Y5mLKqtrWjJ7oKe
 PZVNYuG7CJQqqt0Dj/zTsBkPvYS1xlrjQnonS8gSIYZ5Q253+ikb/LUpVjsU/Z/9uAiJ
 WCzgtmzdbBvduGhTGPC2MURq5cKzxo+GyXVDIXEbNJW/j/WlxT/DCClKWcyzOLGQ4xt1
 VSPyG/MPugx5EgkOTD1/Ec6DFLxQkaozA/LBIXYGr6vghF3QceEdn4qNpODGGQec5ixd
 /mu1cSsgAyLV1oTYzntwJY3hpD3/B7f9hkzfmy61nTuovSNziM4mPlMZS+LgA1DtKS5y
 sqog==
X-Gm-Message-State: AFqh2krgZp2pZTIrau5TwlOGoCcfgFyJIFEZC3/XwdukPHms3RBCz8V6
 XA6TDQwNPkYe2C4W1YRHin2ObBExkPJvphY4vfYFHQ==
X-Google-Smtp-Source: AMrXdXujPhzQm/BVd1q7XmtjLY7E4HHCdbybUlKQtzogKyjk9dRoohmsQrUmrUZqV54k1wnFm00zPwbjx3GM5dX5jAk=
X-Received: by 2002:a17:90a:348d:b0:219:94b2:2004 with SMTP id
 p13-20020a17090a348d00b0021994b22004mr3138585pjb.215.1672752900014; Tue, 03
 Jan 2023 05:35:00 -0800 (PST)
MIME-Version: 1.0
References: <20221221180141.839616-1-pbonzini@redhat.com>
In-Reply-To: <20221221180141.839616-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Jan 2023 13:34:48 +0000
Message-ID: <CAFEAcA8=9Mwsm2z0wd_+ibQUg7pyWxC=i0wVReOGyzvsttq=1g@mail.gmail.com>
Subject: Re: [PULL 00/24] QEMU patches for 2022-12-21
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1034.google.com
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

On Wed, 21 Dec 2022 at 18:02, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit d038d2645acabf6f52fd61baeaa021c3ebe97714:
>
>   Merge tag 'for-upstream' of https://repo.or.cz/qemu/kevin into staging (2022-12-16 13:26:09 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to 4a4c1382c8c3fe6e25c782bfda5de753ced3f6a1:
>
>   i386: SGX: remove deprecated member of SGXInfo (2022-12-20 15:45:45 +0100)
>
> ----------------------------------------------------------------
> * Atomic memslot updates for KVM (Emanuele, David)
> * Always send errors to logfile when daemonized (Greg)
> * Add support for IDE CompactFlash card (Lubomir)
> * First round of build system cleanups (myself)
> * First round of feature removals (myself)
> * Reduce "qemu/accel.h" inclusion (Philippe)

Hi; this fails to build on the centos-stream-8-x86_64 job:
https://gitlab.com/qemu-project/qemu/-/jobs/3513705785

ERROR: unknown option --enable-trace-backend=dtrace

thanks
-- PMM

