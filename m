Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C99123462EE
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 16:33:41 +0100 (CET)
Received: from localhost ([::1]:48170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOj2K-00013f-Ni
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 11:33:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lOizb-0007g5-Iv
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 11:30:56 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:45980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lOizV-0008Ig-El
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 11:30:51 -0400
Received: by mail-ej1-x635.google.com with SMTP id kt15so18306313ejb.12
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 08:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OPNP+eVNsgSW60FgAwlYi5DQtwoXdW9nwJ3Mh03DF7w=;
 b=yAIJTEzK7i61CSv9i2dyVmTk2VgBWZc5u6oq8+JmILGZ667lA8/3UmPAkOGLv/ZX8a
 wa66SVRO8UdeheTZJ7wjZ1+cz/csTLvQPdB5fJBHtb+9CLWtuKdNq7+DBsgM+7DS6YSk
 VOa/X6QOumWdEPH6VyaTCvwTExF+uy/dUjJNQqmuwIFPS8a7Vo5NbXQlsxDzyhKta11f
 s349lhG7s8wfIxH7xLp5wfa93Xou0yMXidcQO6LuiVL24v5cbucQu7+tFGhj/YJYXKRC
 divus0dAFKM7qVtDCMNn6kQ3BZv57PU2AVJSCffIbqttBf3m3z7X9qa8HUpXE2mxezqN
 1aXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OPNP+eVNsgSW60FgAwlYi5DQtwoXdW9nwJ3Mh03DF7w=;
 b=iP0wBYYDRxYU5lpE9J8E+rjttdmpxkGMKMM+za1dxOfqh/mEkjfWnyt736RwaL27+p
 D4Sz2A8UX82ppfbha4e/zEvuZe0qh0sK+FDUZ9N+t/Ni/UU1A+kq4kgrk4oMKJCpg2kf
 QzI8eAHOxEQihaYkt0ER8XDHVL42PoMFXsa3lLySRjUyeIyq6y8SHuEmB3eWXIpJbiDe
 BPiAyST0JsoidaQe6Pa0z3J4W4fJyjeAIu8AIsUQ6sFYsmWVZeq9deBZ7CFymGZkZGCC
 v1oRzy/s8ox9LdlD53h3Jrr9G8Ev6FyIxB4unOr2vLHBJXZLgjK4xGbw71ZAu/vVGF2v
 XdmQ==
X-Gm-Message-State: AOAM531gQng+NbfDksDREfKRyFTKgEiOu8fu5W8mPQzcVKlfhuvwv5Wy
 zF5ijjm75vDXzTiGUJGCrqkRUQvWG50wVTtc/HbL0A==
X-Google-Smtp-Source: ABdhPJx6Wr8tvKiIClVzs0ZZBFsZPEkHrtXU/5hlxgdoB87kg/utp6XGEDglXdSovDhBmJZWqypTy7UwSX5WDIpk+aA=
X-Received: by 2002:a17:906:bd2:: with SMTP id
 y18mr5555253ejg.482.1616513442701; 
 Tue, 23 Mar 2021 08:30:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210322225907.541943-1-mst@redhat.com>
In-Reply-To: <20210322225907.541943-1-mst@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 23 Mar 2021 15:30:13 +0000
Message-ID: <CAFEAcA-_oas-aWD3PLCao5-X=PsPeHkdjKDaHAPoc5q9vdoSUA@mail.gmail.com>
Subject: Re: [PULL v2 00/19] pc,virtio,pci: fixes, features
To: "Michael S. Tsirkin" <mst@redhat.com>
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 22 Mar 2021 at 22:59, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> Changes from v1:
>     dropped an acpi patch causing regressions reported by clang
>
> The following changes since commit f0f20022a0c744930935fdb7020a8c18347d391a:
>
>   Merge remote-tracking branch 'remotes/thuth-gitlab/tags/pull-request-2021-03-21' into staging (2021-03-22 10:05:45 +0000)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
>
> for you to fetch changes up to d07b22863b8e0981bdc9384a787a703f1fd4ba42:
>
>   acpi: Move setters/getters of oem fields to X86MachineState (2021-03-22 18:58:19 -0400)
>
> ----------------------------------------------------------------
> pc,virtio,pci: fixes, features
>
> Fixes all over the place.
> ACPI index support.
>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

