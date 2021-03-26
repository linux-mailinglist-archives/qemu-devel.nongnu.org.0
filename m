Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A397B34ADEB
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 18:52:43 +0100 (CET)
Received: from localhost ([::1]:55886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPqdW-0000rW-8g
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 13:52:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lPqcG-0000Dw-Oe
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 13:51:24 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:40829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lPqcE-0005Xx-Ab
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 13:51:24 -0400
Received: by mail-ej1-x634.google.com with SMTP id u9so9661893ejj.7
 for <qemu-devel@nongnu.org>; Fri, 26 Mar 2021 10:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1nJ5LMb5TxhqUaIohHVWkExvFWRXOaEff2xeEAhyjv0=;
 b=NuBuBrUSarUu6EMyt1S9wffL51qX2HKkcAhIgG5BkkPU5O3mYLNAUprKt3C5LWQVdD
 UtOdFXQdpm+4VrRGM0B43Ug6dwozs70LYUYpO/6Tl7ExYsikSDB+81APLfN9QKJ7ZzAv
 63jXMUyx2C5RTV1hAs4qi3fTF3xapt03MJ6LfPmmL7YM8q8Pp6yRtkmVfduPn0kDQdxh
 EO4WoL60z0B0U/msgO+5jTyKv16AJLhXLQFXydZOOG3QjGDOOdDhZJ6Xmy0pD6RzMTrO
 NsWiXw53qE4lHF0CDrmZUMkjWAKTPEKSdFCYCsAYkbUYEfaEMvPCVheebuiH9xKkta9i
 qO7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1nJ5LMb5TxhqUaIohHVWkExvFWRXOaEff2xeEAhyjv0=;
 b=ZOzX09b62SIXIfyRz2b2dMXTjtggl75lHDE3Rq/skexuSvHqNmT+b0c3gHd8v+gIdQ
 d8hilHZs5uqoi8FZ2NpbXyB/6htYi2UxQcJ/40Afq8lprwy7yLSgX1VklPaNQ1mUM2GG
 fcYU2IKbXQyz3nVDA0wjK6sYd2GgLvuBCQ2mP6imbtE7joneV5LTFx5v0cacmbHn3qsg
 sPM0FlU21FaFOZMkwezCKtzYDrq2Ekkx24m17RrS4HSDKC7QYC8Lar42R4JieIgpTjT1
 gXQCivvINWMWxrNOrEkQsHt0plwQkuhT58TxyWOD7RearHCG3WmDH2cGC7P/mWsCH2hd
 V+Lw==
X-Gm-Message-State: AOAM530DIFFuhJFIl6Zpk4ayrd6iHVtlNJlNyz3BHR298BwtPxid5E/R
 gnDytKx3iuOBDVHrwpTIe9DZ3tGL6yazs3QwnYuhJQ==
X-Google-Smtp-Source: ABdhPJx8EH3gU2cX1ynNPA+kEi+kjEkEKr1nHd2A7i31PozlZ2hctdyiuOkD9JPp0eZtl6kmkDn0EpVVx1R7teG+d/E=
X-Received: by 2002:a17:907:10ce:: with SMTP id
 rv14mr17043893ejb.56.1616781080646; 
 Fri, 26 Mar 2021 10:51:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210326124932.481942-1-kraxel@redhat.com>
In-Reply-To: <20210326124932.481942-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Mar 2021 17:50:51 +0000
Message-ID: <CAFEAcA-nvyXhqgCjZiAGkZVtM2eOJUwiAc3rMtdytJW7TECkGQ@mail.gmail.com>
Subject: Re: [PULL 0/9] Fixes 20210326 patches
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 qemu-s390x <qemu-s390x@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 26 Mar 2021 at 12:53, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> The following changes since commit 9e2e9fe3df9f539f8b6941ceb96d25355fdae47e:
>
>   Update version for v6.0.0-rc0 release (2021-03-24 19:50:49 +0000)
>
> are available in the Git repository at:
>
>   git://git.kraxel.org/qemu tags/fixes-20210326-pull-request
>
> for you to fetch changes up to db0b034185824ac33e1a85ba62ab2030eb17b00d:
>
>   hw/usb/hcd-ehci: Fix crash when showing help of EHCI devices (2021-03-26 11:10:49 +0100)
>
> ----------------------------------------------------------------
> fixes for usb, virtio-gpu and vhost-gpu
>
> ----------------------------------------------------------------

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

