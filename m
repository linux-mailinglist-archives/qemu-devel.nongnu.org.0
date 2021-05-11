Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E7D37A0FC
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 09:40:58 +0200 (CEST)
Received: from localhost ([::1]:36274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgN0j-0003Tl-8Z
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 03:40:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgMy7-0000l7-Va
 for qemu-devel@nongnu.org; Tue, 11 May 2021 03:38:15 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:36663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgMy6-0004Cl-12
 for qemu-devel@nongnu.org; Tue, 11 May 2021 03:38:15 -0400
Received: by mail-ej1-x635.google.com with SMTP id j10so1255537ejb.3
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 00:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=N0KurLwbIuhFNtP4x20Z6sHUEPDrPzYwY48qrdjg8Y4=;
 b=Ii6erZIr3neQ9LlsPlCYAjnOlTHiC7RyvNdrB4KbSLvsOWOZuAi2D7SRqNvGw8D978
 SU8xNzAJOYs3bmJXWKGWCQSJk4/GrIIYgM6jGzWqvJ5KqLdFH5vx5GChsctyZmO24ZZn
 cusDoqU1xVNfnlIKCvSvshs1MV6vNr1IAzwVCKYgTIspSP68b8KwIkVe0J7Lx5GqqlW2
 bC8r6vbRlyFRisCPvonGFc0kMAT0mZbzELZqaDcExJsiLPooKM+KLHWPvdZ3tXZQCXo2
 C8sORgWMWVRliVg/ey+P5VXE+MsSyD3AxW951SeDKZSuWnU5+rN9x1bGINm/Z/Uw31pt
 CoOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N0KurLwbIuhFNtP4x20Z6sHUEPDrPzYwY48qrdjg8Y4=;
 b=U2DEANUUX4wj35qtyRIOK93rjN/B1/hA5owm1TMZlFOQ7IgNc/WYpWkWRq8t6MjryX
 Qjcs3VQj+ehhFDBLZHQZqVj3aw+nKTQ6MDyDWIE5brPnn5SPsmAXPlE0o7N5K2e7nbOg
 dFbgsEcfsiPeoxDNqdi3ywNrqcsJs9ScKcYUXZiSurMHVRbjOBknalr6qAuKWCX+iAQg
 IXdO7zzIbqZsG4hsXk6lva2+WYYcO0TkypjGhdjKy3Fs7I83gqEpsvtcRU9Gbsmzw2m+
 B265BBirn1Atsg1O0O2JosRPJ0QuuHX7aUR4fUqckbhHsRdFzOT54KWh+TtejHUryp+c
 Lpog==
X-Gm-Message-State: AOAM531IT3gRGW1+a5/0lhyYY81Z5YYwVhubYp8DopWJbfoGSxhjoVLQ
 Z9nj2lij78T11pI5vW6V+jbLw3ksyyzdhy595XoBQQ==
X-Google-Smtp-Source: ABdhPJxu+JujYhRHdzR+ihPDmGd3VYL8/lQ3ESuck+IGYFSn1GCUZeZrYruCb1gdaKUMAHi8j+8agzEF1mQIT3RV/JQ=
X-Received: by 2002:a17:907:3d90:: with SMTP id
 he16mr3047562ejc.4.1620718691583; 
 Tue, 11 May 2021 00:38:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210505130716.1128420-1-kraxel@redhat.com>
In-Reply-To: <20210505130716.1128420-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 May 2021 08:36:59 +0100
Message-ID: <CAFEAcA-ubu7+UiWX6-xsxRF1xS+8WyDsb1vHPkMvwZENK5qfrw@mail.gmail.com>
Subject: Re: [PULL 0/6] Usb 20210505 patches
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 5 May 2021 at 14:09, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> The following changes since commit 15106f7dc3290ff3254611f265849a314a93eb0e:
>
>   Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-hex-20210502' into staging (2021-05-02 16:23:05 +0100)
>
> are available in the Git repository at:
>
>   git://git.kraxel.org/qemu tags/usb-20210505-pull-request
>
> for you to fetch changes up to 05a40b172e4d691371534828078be47e7fff524c:
>
>   usb: limit combined packets to 1 MiB (CVE-2021-3527) (2021-05-05 15:06:01 +0200)
>
> ----------------------------------------------------------------
> usb: fix some memory allocation issues (CVE-2021-3527).
> usb: add stubs, allow building without usb subsystem.
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

