Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B571E40DCB5
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 16:31:13 +0200 (CEST)
Received: from localhost ([::1]:41860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQsPw-0005Vt-OR
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 10:31:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQsNU-000363-23
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 10:28:40 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:33703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQsNP-0001tf-Cn
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 10:28:38 -0400
Received: by mail-wr1-x436.google.com with SMTP id t18so9893153wrb.0
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 07:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ba1O+f/83faIa3lp8tzrq8FFYyFvNaAuLEnaxTOIN7g=;
 b=S16uPinMJySp8KZgQQiZ44XUS6xNfJJ3pppHh/fyYXQ5EhRxxB/nhGsjTTTpBrgp5e
 lFBorx9Ky6/t/xiehm6UfxgjTZ7nAa6uwRxfRNbGAXmiP5LS/vy7l3Nko7TQNLgFQTMQ
 EgGzY15xkfUkXc3gMZIPlgF/VuJzxYokayCQdRicVkDrJ0qZA40WOdFJ9Q1578GAUDvd
 bnjw4Z7Y8pWaU31N/evwa6sel8M9G88NgN+Z9YBRhxJeVYAOBBh9a0WkUEM/JfUTBbTI
 8ZjiQax7U3pXHd1lzUsYwD23Sl/HY+66I8I57I9PRE2PxxKPg1cRRqVXpa3r/dHgrjpz
 PKnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ba1O+f/83faIa3lp8tzrq8FFYyFvNaAuLEnaxTOIN7g=;
 b=KvYBXt36O3xLM3wdElJqnv41W16NpAfCrx7qZUj51IMXQI4c4vPWuQZSWUf8r3G43G
 xLy04BnElz+8d2TK/lSJBD2Tp/4aHEpHYLHhLtHS/RMva/Uzhry6sSwUf32Wpq2EYKyU
 sWZQA0Be9V7h/unwF2vkcW1Ffr+tL3QxLYmvpgrrgDMrD1eqsadBNQDbhk5vnv/w4dbY
 9W/EbAG7F2Euu97fZ8oHoT+EnJpYF7PKADBjcK+RkSWF4T0xVWUrkeXxdGT2XqUoSv5y
 mhUvSoX+5z4YljTJ8b4/G89OQGvwesB7ZEiS4Fisj+bvgBpmFMsSW05iIcyu15XDbyFx
 T5rg==
X-Gm-Message-State: AOAM533PPpfr7tkG3o1yG8Ye3s+4Qy7ga4IHV+4AvVIxqmaHGxYRk6Eh
 5GOqbwgXqSWQ7x6FIsDcy1mzVK83wau8v4+131qDaw==
X-Google-Smtp-Source: ABdhPJxC+/Ye4d3Vm+lmTFkqPzU6pSl/J9lVipe1sSYdncQKSTA+UplxmeOVD3+ypT9kGaMX4OvfF6/a6TTTkkAArIs=
X-Received: by 2002:adf:f185:: with SMTP id h5mr6539599wro.302.1631802512590; 
 Thu, 16 Sep 2021 07:28:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210916055623.1846418-1-kraxel@redhat.com>
In-Reply-To: <20210916055623.1846418-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Sep 2021 15:27:41 +0100
Message-ID: <CAFEAcA-FmswPAPfb+gh6jtNp8Q2Ud=tB6iO70B_q1XXejJfUpA@mail.gmail.com>
Subject: Re: [PULL 0/6] Vga 20210916 patches
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 16 Sept 2021 at 06:58, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> The following changes since commit 831aaf24967a49d7750090b9dcfd6bf356f16529:
>
>   Merge remote-tracking branch 'remotes/marcandre/tags/misc-pull-request' into staging (2021-09-14 18:14:56 +0100)
>
> are available in the Git repository at:
>
>   git://git.kraxel.org/qemu tags/vga-20210916-pull-request
>
> for you to fetch changes up to b3a5dfdea99da55fdc70538eeeb2227ebe6d6a5f:
>
>   virtio-gpu: Add gl_flushed callback (2021-09-15 08:42:00 +0200)
>
> ----------------------------------------------------------------
> virtio-gpu + ui: fence syncronization.
> qxl: unbreak live migration.
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.2
for any user-visible changes.

-- PMM

