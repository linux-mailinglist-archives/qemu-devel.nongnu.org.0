Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 385793AC69E
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 10:56:42 +0200 (CEST)
Received: from localhost ([::1]:43112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luAIq-0006Fk-Py
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 04:56:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1luAGr-0004pV-4G
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 04:54:37 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:46677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1luAGl-0005M9-1i
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 04:54:36 -0400
Received: by mail-ej1-x62f.google.com with SMTP id he7so14625950ejc.13
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 01:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7gOp/KG5bjBXORqbZnNTsiaDAfBgd2+pjFkcPcCVNNE=;
 b=Zytyaaohz+aifKQVlkQrK8M+Mn8VYc+pVM18H7x0YFeO5xIdwUYhJxAOgXJXlGb3Li
 lrA1zErfd0MbhTFLFamKT2utDgBwOOnS0ydf6KZW734dLGVFuYttuI2AzNSso2OeciYD
 xeQRXdrJwrkJSYD3MZXE3LyTI/DrKzZ+pLeQ0NfSe+t+Sk9aJ20H87KuqikYDTANS/kH
 yqLHM1aq/TPRUJU2br+UibTw5ZGiyP9NZf5mg01Tbpc4phia2Bupiw+zFh3xC+jbUUar
 RaSPA5FkpXPdLE4Zx0BWnzRtvTI6PyXgLVn3cKtWXyJBClvmFDDOIgb6+jxPeqs/lyVo
 /74A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7gOp/KG5bjBXORqbZnNTsiaDAfBgd2+pjFkcPcCVNNE=;
 b=gCX4jRch7ZEnEgcuqSaNy1XFxbBftODkcrKqO8VEzqK6OpqtWqG5+Y002OvLkfCi0f
 hHsQKMqgoHcIZ9RmVJWVx77ft3rA3l832f6JTielbRjspZi0E/yfPqzpHOklIiCCkeoH
 RjcZW2vMehatSiArQZM3pcKv8rmeNfDAmdpYBQh8wPYr8EzjHMIPY37GLcD9aTjyYsHH
 tGrRDAtZ7+BeqEU7TtQrN/AwOdV7EPAY7TJ+qOwVPhwi3tsAgm5rA+CC4UODI3EqSHvk
 TMmQFVSaj2XbjOodAPB5NVLGztGCgJX3N09GOvJKboGepUf/fkLi89G5s14GEZeK5yT5
 +W6g==
X-Gm-Message-State: AOAM532vcW5pbAeoYTqdp/VrmiY9yluS5v7OcbAt0w/Ks8cPU7/uRWrJ
 ck2RFZAcMNhC++kWxc92RCkX40iMxOpy6lMejc4VoQ==
X-Google-Smtp-Source: ABdhPJwP4Ez+D7urSex1iSy3I/ZCiDhDyWespCq91V6uA2icG0VHvzJPapjQ7FR1hXJTU1Ecx96v7H/lrDSxor2Sct4=
X-Received: by 2002:a17:906:4759:: with SMTP id
 j25mr2037098ejs.4.1624006469388; 
 Fri, 18 Jun 2021 01:54:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210617093134.900014-1-pbonzini@redhat.com>
In-Reply-To: <20210617093134.900014-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Jun 2021 09:53:54 +0100
Message-ID: <CAFEAcA-ApakXmhJbh4pRdqbOK4hYQ9gJV+oTad1C_PPotC3bmA@mail.gmail.com>
Subject: Re: [PULL 00/45] Memory, i386, compilation,
 bugfix changes for 2021-06-17
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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

On Thu, 17 Jun 2021 at 10:36, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit 1ea06abceec61b6f3ab33dadb0510b6e09fb61e2:
>
>   Merge remote-tracking branch 'remotes/berrange-gitlab/tags/misc-fixes-pull-request' into staging (2021-06-14 15:59:13 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to f51f8e3591393f7f274e1435ac22188e2dafdfe8:
>
>   configure: Remove probe for _Static_assert (2021-06-16 15:03:26 +0200)
>
> ----------------------------------------------------------------
> * avoid deprecation warnings for SASL on macOS 10.11 or newer
> * fix -readconfig when config blocks have an id (like [chardev "qmp"])
> * Error* initialization fixes
> * Improvements to ESP emulation (Mark)
> * Allow creating noreserve memory backends (David)
> * Improvements to query-memdev (David)
> * Bump compiler to C11 (Richard)
> * First round of SVM fixes from GSoC project (Lara)


Applied, thanks. (Richard sent his C11 set as a separate pull,
but git seems to have coped with the merge.)

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

