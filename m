Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB622FB64D
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 14:19:41 +0100 (CET)
Received: from localhost ([::1]:37610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1qv6-0007b0-2s
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 08:19:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1qoV-0004WI-Gw
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 08:12:51 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:34917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1qoT-0007Yj-SD
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 08:12:51 -0500
Received: by mail-ej1-x62a.google.com with SMTP id ox12so4104933ejb.2
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 05:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OF1OcULnC9JD3i+IY/R5amBIa9VpKRrlKuB92/HsGQk=;
 b=qbN/4LqLQeCIF8mhH0Jv5c9DD/H/U/VgIeZvIL42Do+g1UioL7NTsEZmUh0R2KTXRR
 /CXCTBkofH5Ju/YzdGDnDJBr1OgUq+bfjx0IejAl3KuTuIfoPTTuZCBUx61mWj6D2vFo
 V27Ns0Ao/z5dS6agtNUZ9MLfR5i9K1gRRieYrs0zvPJLLGB0hqSn+j8Sucwbg5SYz/oG
 oIxIXKDVgVjqulkyGxnWTwY32iAvd1dvykioNsi7k6KayGoPFrHA5CUfdKdBNLfZ/DHf
 gT6vdpU7ItHjv79fxO51+6m+taWF0mHUOv46vIxv0zg4jDNH30YnLbITBsX0J6rMACv7
 frsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OF1OcULnC9JD3i+IY/R5amBIa9VpKRrlKuB92/HsGQk=;
 b=XFU/zuPNMUqXNI9WJsSjAW/UqG8egrUWbRgU8/I+1z7uAkqlJ9qZzfIpCg2ogdEAch
 6hNzrb9iSxzZuUE+sJD911zzmxKMlN0yxV9wUTDiJBKttLJfYAnnAPfCCmLgJscP2TZs
 w0XWLHQaVNGcVOQB2M9j//gVaWjZimljqZ/uvkpf7r5J4pFQ1NVwCwritFOYOaW01Rfd
 DXiaa3Jd/lmw4EEWmBsS/gVZbq8Ap+8EzdnOoecz+D71Vs58i1qyg192I3NDYEP35S97
 ncSaQz1+4cV8PQDM0iarS6xIlnsK1zJPWFewUHLwiagRb1VAslA73kcgSov6IgvC7uSV
 zJqQ==
X-Gm-Message-State: AOAM531MJvYtvIXLW8E6zlnXN9ZRsJUUi2wtleg6IEh3rXI4NGpow+l/
 zq+o+RUuqv23LJ2ZBO/A4ucec7a0HOkGTMNBISbPag==
X-Google-Smtp-Source: ABdhPJy9uS8ads1qC6A2k27701JVK32qmwQ8/W2cf1o9DktDQzhyaYj5AQ4v0ZwzrlL7cWUDMrsnnacviZ2vJNKHqJc=
X-Received: by 2002:a17:906:2747:: with SMTP id
 a7mr3025502ejd.250.1611061968325; 
 Tue, 19 Jan 2021 05:12:48 -0800 (PST)
MIME-Version: 1.0
References: <1610735646-13313-1-git-send-email-mihai.carabas@oracle.com>
 <1610735646-13313-2-git-send-email-mihai.carabas@oracle.com>
In-Reply-To: <1610735646-13313-2-git-send-email-mihai.carabas@oracle.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jan 2021 13:12:37 +0000
Message-ID: <CAFEAcA-J77g9s2pbhXKHhnnqfs2L_WuLdNB_5D=G5WOo0PdcAQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] hw/misc/pvpanic: split-out generic and bus dependent
 code
To: Mihai Carabas <mihai.carabas@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 15 Jan 2021 at 19:21, Mihai Carabas <mihai.carabas@oracle.com> wrote:
>
> To ease the PCI device addition in next patches, split the code as follows:
> - generic code (read/write/setup) is being kept in pvpanic.c
> - ISA dependent code moved to pvpanic-isa.c
>
> Also, rename:
> - ISA_PVPANIC_DEVICE -> PVPANIC_ISA_DEVICE.
> - TYPE_PVPANIC -> TYPE_PVPANIC_ISA.
> - MemoryRegion io -> mr.
> - pvpanic_ioport_* in pvpanic_*.
>
> Update the build system with the new files and config structure.
>
> Signed-off-by: Mihai Carabas <mihai.carabas@oracle.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

