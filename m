Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD9C2D7F94
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 20:46:00 +0100 (CET)
Received: from localhost ([::1]:40916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knoMZ-00050f-0s
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 14:45:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kno7W-0005SU-01
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 14:30:31 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:39522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kno7N-00061Q-Oq
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 14:30:24 -0500
Received: by mail-ed1-x52f.google.com with SMTP id c7so10538984edv.6
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 11:30:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2sXiQzY3g2kkOPZT43nKC33mpGZN7Se++G/lFgMjc+4=;
 b=AQCZz8+XtQiGJtisJAkT8f6YKaTB9+cCyjFra1AsUDZsJ7bzM+iTpxsH8n+Zc5ftWk
 S+S3cYrwXx9gsBANPrkODZep9lw70e1Svp0FRhBiwa7qYflrg8EPB+YPD6hSju6XWIXj
 zToup0DcIxA7l9Cc04kvj2UPJJZhbbAVg2onm9h0ytxuTnydXcaepHtktJqG3E1/LxOv
 mWry1vtv1rmmz9OahqKJ2UudS3knmmoiaCBB5Y75Y87hWx0JLzcO4vfy6KskMnOcQnQP
 F+QlCynBcDHy5LKj5inu/JSoP/hPgZ4DQOauN+jCjRr1vPD4NwfkN2Zql5OVp3UXY7x6
 fAkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2sXiQzY3g2kkOPZT43nKC33mpGZN7Se++G/lFgMjc+4=;
 b=nCb6R8XXKZZl/yxUJ4mfa5hQK1/RLTtx0gYA81SSJ6V94uavVnunGTSKgFTjTJ//mX
 tUs/AL8SydYKsKdgrIEuiHrxOHxWcSyq1Z7I/4RsIgSWQqRg9WkwAUXn4Ioc2KuSq15i
 zEqs5qKYC1YghvJ78sVdjF+bYt5n6pDXi4bdov1aCiX4KW1GvAbk2+OSeHyzoy0TJP1X
 qnD4BS+UA8e08B5WcCUq7bVN3tczdaFzlwi04URHcOYlMEp+8Jrchtagx64aGZAZW4pv
 F0aFVBsQsNagl4IFnFHEWcQ6ubJ6pLb+Eo4o7UcfJiu6qoo6JDaOLXhc1kjRRBdAiD4K
 mKJQ==
X-Gm-Message-State: AOAM532IkECEjFvhhHMUB+niWqNsmTtfTKX+H9IGNX8rzUAuK6odu6ak
 hVvd1FwL+FtRO4at6hquT5NveCznRF6OXzBTyZfr7A==
X-Google-Smtp-Source: ABdhPJykev2YV/fGoFPrU1b5TqH5SxZ6wZ5dbUpl9+faRZhFxxCnQRi/7D+I8MR3zeel8Vqzm7R4PCRxQPyvI9j9FyE=
X-Received: by 2002:a05:6402:1383:: with SMTP id
 b3mr13174132edv.100.1607715011067; 
 Fri, 11 Dec 2020 11:30:11 -0800 (PST)
MIME-Version: 1.0
References: <20201211091250.1415-1-kraxel@redhat.com>
In-Reply-To: <20201211091250.1415-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 11 Dec 2020 19:30:00 +0000
Message-ID: <CAFEAcA-f3zQ-8JEYZO=oW1MuOboz9rP2OuBm1OhkE6ukwhxv1g@mail.gmail.com>
Subject: Re: [PULL 0/8] Ui 20201211 patches
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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

On Fri, 11 Dec 2020 at 09:16, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> The following changes since commit 2ecfc0657afa5d29a373271b342f704a1a3c6737:
>
>   Merge remote-tracking branch 'remotes/armbru/tags/pull-misc-2020-12-10' into staging (2020-12-10 17:01:05 +0000)
>
> are available in the Git repository at:
>
>   git://git.kraxel.org/qemu tags/ui-20201211-pull-request
>
> for you to fetch changes up to 2951106143f6cf20b3a0e4f2078721503fe6418a:
>
>   sdl2: Add extra mouse buttons (2020-12-11 08:06:40 +0100)
>
> ----------------------------------------------------------------
> ui/console ui_info tweaks.
> ui/vnc: alpha cursor support.
> ui/vnc: locking fixes.
> ui/sdl: add extra mouse buttons.
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

