Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 822823E5A9C
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 15:02:46 +0200 (CEST)
Received: from localhost ([::1]:52380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDRP3-0002IT-Hi
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 09:02:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mDRN5-0001QO-NP
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 09:00:43 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:38664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mDRN2-0006cP-OY
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 09:00:43 -0400
Received: by mail-ej1-x636.google.com with SMTP id z20so12525702ejf.5
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 06:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=szosml7fRYxx1yqYgcZ+we+MCCEcBoKWpKJgWToya+E=;
 b=wOFvucFwTdPeEGl57Jj1AdxDzP3OdZeHS0qNGp62qejuqZVezhbO+ma2d/fBeKZ6wx
 5zsfTLJwlKomT04/jFt1M99i4a1s3LNkibXXrCyM4ID35UEoHRHPG3Z+KVrGKkBIn2Rd
 xQJQkAGxDRbxyQm8odmkSgC7fwHRNqRQ6h7J5kRJ1HyfypBUAOUoHjuy0fALQRHS4SKP
 6xvsqa03Qms7nF9JtS/rbLNeTbZVkGSAROKEFN0EOEadiOUBdK9lZYAldqltLrQ+jaiz
 D8RdhMz8MasC/2gd1FoWNuguJkBsAzdbkLz16oHnEtbpCHt4EdszKUWFH+ZPlUTLv8A8
 rwdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=szosml7fRYxx1yqYgcZ+we+MCCEcBoKWpKJgWToya+E=;
 b=mmUi5RcYWqtj3rDs+Bpt2syvVmOpTT90WXnEy2EvIWcMwyo3LPQSWD9z7I3orwF70P
 Zetu8ZtLTDNOsdd6b/YnyfYyTYtWfb/zQilgTXSOCC3LQrLo3sfBdvArcLDAPMKzFS85
 jb26wgAgFhBOcl+RoFWaVaf76twA/pSVEcq2NG/XaI2gNJWnVadfMMjfniWvQBeRpmI/
 BahroReQLVoXf7VyQcNdMqfcNWbBLqgQXDgd+G6psxUqwah5t+MqqmBXYaKhRVlP9acl
 1NXV+bQSZzvcqLQQOR8XLJLMfQf4dEOXmXzd+hi88QyaUX6c6OhZNr0RVnzJyevTZ4lr
 uVmg==
X-Gm-Message-State: AOAM533oiltRX96nlnqumcBTUv6OsWSX4qzdf3lDMQtuCSXxGMvYhxfC
 JGsk/gHqwmHYR3DbQWxESnG/6Rv9ljfXhdIwQA70Tg==
X-Google-Smtp-Source: ABdhPJwm0G8YenjfFVrZPdbgFZ7kbEdgRHPSWk0mtenAQFJD09s/v82rJedDnUkoyUbREU5TaF/2lsYoD6RL3AcNQrs=
X-Received: by 2002:a17:906:6b90:: with SMTP id
 l16mr27696863ejr.85.1628600436140; 
 Tue, 10 Aug 2021 06:00:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210810013922.215443-1-michael.roth@amd.com>
In-Reply-To: <20210810013922.215443-1-michael.roth@amd.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Aug 2021 13:59:51 +0100
Message-ID: <CAFEAcA_naDsJUojmW2Qb8rbZ=tCU-Sd4Xr31sTpYS4pHE+9ygg@mail.gmail.com>
Subject: Re: [PULL for-6.1 0/1] qemu-ga patch queue for hard-freeze/rc3
To: Michael Roth <michael.roth@amd.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
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

On Tue, 10 Aug 2021 at 02:43, Michael Roth <michael.roth@amd.com> wrote:
>
> Hi Peter,
>
> This is a single fix for a potentially recurring memory leak in the guest
> agent. If you don't think it is rc3 material I can save it for 6.2, but if
> possible this would be good to have in.
>
> The following changes since commit dee64246ded3aa7dbada68b96ce1c64e5bea327d:
>
>   Merge remote-tracking branch 'remotes/vivier2/tags/linux-user-for-6.1-pull-request' into staging (2021-08-06 10:28:33 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/mdroth/qemu.git tags/qga-pull-2021-08-09-tag
>
> for you to fetch changes up to 057489dd1586612b99b4b98d211bf7f0a9d6f0e4:
>
>   qga: fix leak of base64 decoded data on command error (2021-08-09 20:18:43 -0500)
>
> ----------------------------------------------------------------
> qemu-ga patch queue for hard-freeze
>
> * fix memory leak in guest_exec
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

