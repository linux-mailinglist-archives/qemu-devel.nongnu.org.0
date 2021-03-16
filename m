Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B9F33DFE1
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 22:09:00 +0100 (CET)
Received: from localhost ([::1]:57904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMGvz-00024f-VG
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 17:08:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMGv4-0001M9-Oj
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 17:08:03 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:34795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMGuy-0008CO-4x
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 17:08:02 -0400
Received: by mail-ed1-x532.google.com with SMTP id y6so23193565eds.1
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 14:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dYl+82++qJ9fpvLH2b4uQJwGbZUzfsmZWCBCL65LmVk=;
 b=Quwqy6c3+WpzssNmZWB3WdDPkhNGCWpG8EHupbF2qn6M2gKPBpZE3tvqXQ8yZvkzKV
 c0JQLQ9oKwosT+jSDkO6cFFyoEJ2ZGEm9seCmZIJzK9M1jXnOH3oFUjSm4UzMNrMM+Cs
 Dx9AnHihTkAQKx1wlNe8maUuACHdU5aLiKXJcUMcxteFYqoF3ljRRLX5bOA2nFLkyn7Z
 TrDIb5zVcatC3FYH86gMB5QUiFOsm9p2NZuK+zzqzyQxtaNeUMZi6KTc09dFw/M7Ecbs
 IJNbUi4PyUynC+sylVI646di78DVuO9D9EmlNfROREel5KlkLkncSzgboN3Lubor0F4H
 Txsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dYl+82++qJ9fpvLH2b4uQJwGbZUzfsmZWCBCL65LmVk=;
 b=Mo0wmN1bVa4ZZzd+qeqTzG8vknm6h2pPq6bcbKi85oRMF2EExksfipQL8gpePx11Oj
 zAJcz6lB99FfiqI1tFM/cEbb32HDbjBrmh/SH8+yY1xmlfiDTdeTnR2e82DBPq+cabBI
 Pqmx25qSvtfV9fLPCSb24u9m004h2ZAmo45vUJJpJpKK1ygveEGkuEUStPOOlSbNgFFU
 iLgEPERtLlugkqmpdMCsb0y4+XRgMER0RquY0lkToSz39+DAnR7CziYV5XTpruTCO7x3
 8JwjSwIggG/+15HWbzpx7wIZLbK2lTOAAgIQVw/0fCgs4hvBcHbnYCJ+kGTGJQN6eA3Q
 HLWA==
X-Gm-Message-State: AOAM532lIbdHd/fDyZlNXRZMDo9biJrk9hXNho+/KT/60Os/K3SaQI1x
 iI/6SPs2Pw5bZ2iDImqroYmZeaVT0ifJo9k+vr4Cow==
X-Google-Smtp-Source: ABdhPJwiQg0y2yBiEom8xbG2f81GpsJPsFi/6nwWGo7M1ryEcFnBu+Sk1c3n2m5j/RRN+5siSxaOmrPE2ylPaHkWar0=
X-Received: by 2002:a05:6402:4244:: with SMTP id
 g4mr26762672edb.204.1615928873320; 
 Tue, 16 Mar 2021 14:07:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210315180240.1597240-1-kraxel@redhat.com>
In-Reply-To: <20210315180240.1597240-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Mar 2021 21:07:30 +0000
Message-ID: <CAFEAcA9exJHrkku3gU39Y_O1NRyXUEMJJP+CEUhpgg0ysTZT6w@mail.gmail.com>
Subject: Re: [PULL 00/13] Usb 20210315 patches
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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
Cc: Libvirt <libvir-list@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 15 Mar 2021 at 18:26, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> The following changes since commit 6157b0e19721aadb4c7fdcfe57b2924af6144b14:
>
>   Merge remote-tracking branch 'remotes/vivier2/tags/linux-user-for-6.0-pull-=
> request' into staging (2021-03-14 17:47:49 +0000)
>
> are available in the Git repository at:
>
>   git://git.kraxel.org/qemu tags/usb-20210315-pull-request
>
> for you to fetch changes up to 39912c14da07a2dbc73854addcfa0a42596340ac:
>
>   usb/storage: clear csw on reset (2021-03-15 17:01:17 +0100)
>
> ----------------------------------------------------------------
> usb: -usbdevice cleanup and un-deprecation.
> usb: split usb-storage.
> usb: misc fixes and cleanups.
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

