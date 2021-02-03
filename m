Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9826830E3AF
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 20:59:39 +0100 (CET)
Received: from localhost ([::1]:36634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7OJM-0001If-S2
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 14:59:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l7Nwd-0003Zc-N4
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 14:36:13 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:43842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l7NwW-0007WK-SH
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 14:36:07 -0500
Received: by mail-ed1-x531.google.com with SMTP id i5so1020495edu.10
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 11:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aQ00JpduJGsbCkaV7/Kg9/XcOy4RxIZbLVBVL9ajeFI=;
 b=JcE9xAer2ThmwUniENjRk2BK8J2xRz02b9MaRUNXede461vvCiqDTsz/0gL4F76ELc
 RaUiKvpgL19d1sujmiPVRlEHRNeATkvvNI7TgYqECa3GONIxrAJYZH3qRSJhg7qjfYdg
 ulKQ/wVKKIjt36TSv3/XQWODzIBVOwX1MzgqO6QB7Gmaz/36OahYznlwCqWTmy9AIaPj
 /MyAFJcnOjQ0ckxP+Z1HhGSbnA8r00APufPeuTpuRWYnRE4gs3dM2h0ozAGeL0PsIYcp
 ZL/modhLspdCudXoVaxbzdiBgZgVM+8v67M56tjZDvGqyyI3ABnw8g/u/VXWvNHJT2Jb
 mIBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aQ00JpduJGsbCkaV7/Kg9/XcOy4RxIZbLVBVL9ajeFI=;
 b=E4sFc88Xh5m1IyQL/UyozX0ZqwrqwTm4dLijXGLQOTk750KIAgJGBpYzn7swnlZQ+A
 zo5yiGmgdwOoWAG8zl7UFdbj3ZJaMROt3upLFIy4T0XHh/gLDgcNZozNzkQhMMRgEO3v
 scQzBhzO0kZXnWgiWLM9fCWrveLV3u//nSraLnGITcfN86NcyCQj2YIOpzyeEZzmVvSi
 jLkmyHKLluhJfsKP9kvGi/bNdAO2IZS4WjmxfIZbcLz8ePQYb3LhqPFAtJXCY6TmcRha
 mrKPDhADlsRfYKRD4krZMUKAjeq33KXw+x7nxhmJDvTVQOkLKEP9DOe9H2uhmDPzeYDo
 J3PA==
X-Gm-Message-State: AOAM532MAtl8DPnQ0ge511sNSZVRiXe/1uAU0c2t1dJHxelx9gNNtUfN
 xgMUL0M4kvv8NBZJI3dkfR6PAxrKhGIkNHQ0r6EjBg==
X-Google-Smtp-Source: ABdhPJyJfDwldVSO4aKKegh/bM+FabMKJphNNY0Far7+mrBeF5lN21BpMA5t2FR3jtJuKh/rfI/+JAdRf3LjN2sQi1Y=
X-Received: by 2002:a05:6402:3494:: with SMTP id
 v20mr4808908edc.146.1612380955197; 
 Wed, 03 Feb 2021 11:35:55 -0800 (PST)
MIME-Version: 1.0
References: <20210203142436.703098-1-eblake@redhat.com>
In-Reply-To: <20210203142436.703098-1-eblake@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 3 Feb 2021 19:35:44 +0000
Message-ID: <CAFEAcA_eYB=0-xiRxHYpr_+s_nES7r8jM8BL9vuh9QF-JgqvWQ@mail.gmail.com>
Subject: Re: [PULL v2 00/20] NBD patches for 2021-02-02
To: Eric Blake <eblake@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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

On Wed, 3 Feb 2021 at 14:28, Eric Blake <eblake@redhat.com> wrote:
>
> The following changes since commit 8360ebeb4f4a707984cafd1a22c049ec82ddcb4c:
>
>   Merge remote-tracking branch 'remotes/ehabkost-gl/tags/machine-next-pull-request' into staging (2021-02-03 09:54:21 +0000)
>
> are available in the Git repository at:
>
>   https://repo.or.cz/qemu/ericb.git tags/pull-nbd-2021-02-02-v2
>
> for you to fetch changes up to 5082fc82a6bc3fc06a04be47d39777c7cff61e5b:
>
>   nbd: make nbd_read* return -EIO on error (2021-02-03 08:17:12 -0600)
>
> v2: fix accidental inclusion of .rej file from merge resolution
> [only affected patches re-sent]
>
> ----------------------------------------------------------------
> nbd patches for 2021-02-02
>
> - more cleanup from iotest python conversion
> - progress towards consistent use of signed 64-bit types through block layer
> - fix some crashes related to NBD reconnect
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

