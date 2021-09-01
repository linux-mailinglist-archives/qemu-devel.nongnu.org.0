Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7573FD8F9
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 13:46:41 +0200 (CEST)
Received: from localhost ([::1]:50056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLOhU-0007Sq-14
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 07:46:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLOZN-00020G-Se
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 07:38:17 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:41712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLOZJ-0004Ut-3C
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 07:38:16 -0400
Received: by mail-wr1-x42a.google.com with SMTP id u9so3983812wrg.8
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 04:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5LafdwHLeYyptb/m9RT9R4UWp5QMx5HeqJsiCNp0vNU=;
 b=UQ0FUEplIKJfNhYJ1gr2+jFb+vOfm/uQwmZS03VNp17q8ebh+XC+NKiVT3FpgQ4d3H
 id947aepSClkY5PMMXjfzz8HUByxJ359ZYTp+JM/7CXE7AFBa4m39fJBXQaozBEyqqNY
 hA3m10RBDZTLlqvz9wxJRQXipPb7TdBRKDg7hSzMG+kyrUmjtT9esscXLWU60q9XvInS
 yA82WNery0BwjIy1enH8aXBbPCPisy89en+BqD6WEbVQDZT79f0C7/ADBX74hdK+nzAz
 W3DjSAlWG9TjGBFa9nNZNtjaKvMonlENUKeIQunKG951ZZ2U1RiWGFEtXjzA0+F5/UU3
 3Z0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5LafdwHLeYyptb/m9RT9R4UWp5QMx5HeqJsiCNp0vNU=;
 b=koVZoNQ7fZddWsspOy46hEMEHk8tEWhcdNBJAZ+LmT5MgGr0wDpU+EZlCXZ5JyJ97L
 vUYnI0jS6WkeCMISpKuMDZWfZ5dWd5KTikgIxBzqsV4RhSYtW3pOE4q/BIoZ3jeuejZI
 T5FW0g8uyogYj+p3LJAy3MJD4KsVakPqEyJrYp2Df7FSyPl4urGs5Vqno0MmK5ca+MTI
 q9I+A2+hrNqvVRPUPcEgaPZt5uOrZ9k2EAGj+GdxFSwNjfpj21Rh+ciXf6PoNiYH++PF
 UyP9PcTIlKNCle3am2AO4icpTtNfuplRGmGWXlwO+0dfU96YYR6oClfFcx9JRsbfTZla
 dk0g==
X-Gm-Message-State: AOAM530OkKNtWWN6mzVnt060GNsL6B4kukKPX419WnJs5ycG6wzFH9G+
 SrnV8UcwkH9nfu8CQ6X0mwbq95voqtAm3BhI1qefyg==
X-Google-Smtp-Source: ABdhPJwEk3eGeXZ9TbuZDe4pD+TklxX3B7brX3bjHzAUQjSja42uW/DL4sk/iCfI7ACaO+7TQwfdmWagKNqL2aJV4o4=
X-Received: by 2002:adf:f50a:: with SMTP id q10mr36883264wro.271.1630496290772; 
 Wed, 01 Sep 2021 04:38:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210901041903.3111086-1-kraxel@redhat.com>
In-Reply-To: <20210901041903.3111086-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 1 Sep 2021 12:37:22 +0100
Message-ID: <CAFEAcA_m-VnCXi4KxsFkVSmN-V2d6QBbe=6LKnp-9so3sB-EzQ@mail.gmail.com>
Subject: Re: [PULL 0/6] Vga 20210901 patches
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 1 Sept 2021 at 05:19, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> The following changes since commit ad22d0583300df420819e6c89b1c022b998fac8a:
>
>   Merge remote-tracking branch 'remotes/dg-gitlab/tags/ppc-for-6.2-20210827' into staging (2021-08-27 11:34:12 +0100)
>
> are available in the Git repository at:
>
>   git://git.kraxel.org/qemu tags/vga-20210901-pull-request
>
> for you to fetch changes up to 01f750f5fef1afd8f6abc0548910f87d473e26d5:
>
>   hw/display/artist: Fix bug in coordinate extraction in artist_vram_read() and artist_vram_write() (2021-08-31 14:38:53 +0200)
>
> ----------------------------------------------------------------
> vga: misc fixes and cleanups.
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.2
for any user-visible changes.

-- PMM

