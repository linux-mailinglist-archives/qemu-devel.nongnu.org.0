Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 032CC6947D0
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 15:18:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRZeH-0001We-7h; Mon, 13 Feb 2023 09:17:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pRZe8-0001V4-De
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 09:17:32 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pRZe6-0000T6-PA
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 09:17:32 -0500
Received: by mail-pl1-x62b.google.com with SMTP id o8so11258621pls.11
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 06:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9KxabtV8Gxta25OgC2D6SS7uLMr9UtHR7eB3HWJjlbE=;
 b=aFq96rao8X/Yiroe/6r3zOWASKc1b6mWcASe6E/G8+ZKRiJjRasU7jzeO2kxtadwri
 MQ2xiGTymNBE5J8wfTmtH4LTR5IP2Y7TjAU8VodzM3wUdN8e/195ItwqfS65zLQ/ugr3
 9I4rgW7es36VL412GAJ/ylWx8k0kc1rK3Eb/M5YNAtTQf9Mwq2X7FNRPttMQNKyJTeOO
 RQY91eGF5UDwbeXrDU5vn8yzc5qtwgrnNvYcuSZg8fqCUyOg8EuJgNtXh26Q4rXapuWw
 XBpcX2gF6XE+LqmoWVZIGa9ZNZnPgjbuTdi9e6ePylWXn1gHleputKOIq+ebObF0g785
 +L8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9KxabtV8Gxta25OgC2D6SS7uLMr9UtHR7eB3HWJjlbE=;
 b=UpLf1zHbv8kLaVZ4xvkXScxGrjh6DTcKBs7MJSr0NvezwDj9jhGzNSf/2liVuL7xy+
 GIrLe1Z+oLLmYIWaNIleEfaDK47/iVp1XjaAHog/4Io8WpwSLcKJIYx9ktGpZghP7qGZ
 bRWeRJN4qqkZM3smI1tQreMJ6rzvHa8YuMWgCmXWMWy0mw9TbTdF55ZoUw80GMUsy3Ts
 vhe1BETDK/kaj0OHgvUvDjNoQfR1XeStzmEAh1tkP5Lr+Bw03iWNuw4XPMmJkdC37VmW
 /Fn8IF7NxnI7hO84r0BDiBHScNQxfvDcx0EFk2UkE0qHv+5TWnFm6BEUE0CgENKWyWkI
 6wiw==
X-Gm-Message-State: AO0yUKWGkxkPLXlSguJXJyEHTfrxnefCRFRnj/+En8bS1x9ERAzOzmd8
 MImtMnZyf/ybcoQ7ilv/TR9eXnWgOSvc9P423GFVTw==
X-Google-Smtp-Source: AK7set84uOX6lkHYj1JRMvvFpgKFSNkez2K6MuhdS/elvMz+u7N6gQ+j7ymKR+7pQe0UwcN+SOHzY6nqvx7muQnFe2c=
X-Received: by 2002:a17:902:8d8e:b0:19a:8a3c:c6ea with SMTP id
 v14-20020a1709028d8e00b0019a8a3cc6eamr1439721plo.33.1676297849288; Mon, 13
 Feb 2023 06:17:29 -0800 (PST)
MIME-Version: 1.0
References: <20230213025150.71537-1-quintela@redhat.com>
In-Reply-To: <20230213025150.71537-1-quintela@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Feb 2023 14:17:18 +0000
Message-ID: <CAFEAcA9+CdnP_ZTO+WtCqCjm8FSPsRSU82R0mUzZz7Ya3H0Paw@mail.gmail.com>
Subject: Re: [PULL 00/22] Migration 20230213 patches
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, kvm@vger.kernel.org, 
 "Michael S. Tsirkin" <mst@redhat.com>, Li Xiaohui <xiaohli@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62b.google.com
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

On Mon, 13 Feb 2023 at 02:52, Juan Quintela <quintela@redhat.com> wrote:
>
> The following changes since commit 3b33ae48ec28e1e0d1bc28a85c7423724bcb1a2c:
>
>   Merge tag 'block-pull-request' of https://gitlab.com/stefanha/qemu into staging (2023-02-09 15:29:14 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/juan.quintela/qemu.git tags/migration-20230213-pull-request
>
> for you to fetch changes up to 7b548761e5d084f2fc0fc4badebab227b51a8a84:
>
>   ram: Document migration ram flags (2023-02-13 03:45:47 +0100)
>
> ----------------------------------------------------------------
> Migration Pull request (take3)
>
> Hi
>
> In this PULL request:
> - Added to leonardo fixes:
> Fixes: b5eea99ec2 ("migration: Add yank feature")
> Reported-by: Li Xiaohui <xiaohli@redhat.com>
>
> Please apply.


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

