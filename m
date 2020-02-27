Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75617172901
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Feb 2020 20:57:21 +0100 (CET)
Received: from localhost ([::1]:37552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j7PHc-00089X-IM
	for lists+qemu-devel@lfdr.de; Thu, 27 Feb 2020 14:57:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51004)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j7PGq-0007hv-GQ
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 14:56:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j7PGp-0004GJ-8u
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 14:56:32 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:42624)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j7PGp-0004G5-3U
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 14:56:31 -0500
Received: by mail-ot1-x341.google.com with SMTP id 66so345134otd.9
 for <qemu-devel@nongnu.org>; Thu, 27 Feb 2020 11:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tOGfRx1VQZ8hzZFqM5uiScInP12M9f5YygMjv1KTZA8=;
 b=jA7bcHoQqbraZXZRYO9qFIHfnAg0lGjItoglpppOBRK6FaRfJiatENgY8Yzq/gVLqF
 o1Qdg7j1Zds1ExgxYAEJ89DyZzg58JXDPzGffQ4yF9AcObVZBa5nckORHIcvFngZV13o
 kO/kja0DEXV3fkTL474qvTZOdLSAks8X0WBPNC8Kr3nzVpC84KRf/Aqn5FI/P6Bm632r
 IxCr5DOQwCcpUkfx5Ifp5CJ78CeLYfCTS3uimNiXDQsjc87f7Lqf8iMTFFk33Y6sYLUi
 QI7pBMlMIx8bIk50dmzOx9y3GqSXvZhLlP0Vg3aqvmNGcxQGA7WDCyjDe4IcKjwOVy0c
 Z8ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tOGfRx1VQZ8hzZFqM5uiScInP12M9f5YygMjv1KTZA8=;
 b=najgthNbPfl/ZZO/kbZuFkVjX6nDz7jXRth/5E9i/iazwns/YD45c8zAuXJLLj79XA
 mKH/fHYVvLmlLArWIW7qGogFgZK8Il7opQqzqEgq4c/fCQpBg1yDqEAGr3u3xv8c2dwB
 9dA6FMVL9MbW0QFMRnOqWdabPcnqAFLKZNaAMddCQu7dZOmK1BN67xwduIutx1QxBxuh
 xDEZbp1TztJysMrneT5c5DqCNry7+PYuFmW2rM6BiPcUtaYRA7Co+s2MtlQfohuwAyis
 oJ/J4+TLFMEi9S2logyKT3PlDUjguDDqXWbbDCun/hGe6dUqqMgxp41sizp5puOjxFQm
 uH2Q==
X-Gm-Message-State: APjAAAX1kw0HlyMI4IJUach7lXY/U50nM1JI1wlMX/uxNvCR0UkqP7bB
 FglB1sgGI4hjYjQ+vBnSYDwSfZhtUIxwJfnG9M+r5A==
X-Google-Smtp-Source: APXvYqzRLDwVpIFfkrWtWe8anmWzpj+cNXim5+SN12tbaWAtTZKwpijI72X7ohQvXAVgMDL+Hai5XLaQCS+UClrKYvo=
X-Received: by 2002:a05:6830:1184:: with SMTP id
 u4mr403121otq.221.1582833390236; 
 Thu, 27 Feb 2020 11:56:30 -0800 (PST)
MIME-Version: 1.0
References: <20200226090010.708934-1-mst@redhat.com>
 <20200227035423-mutt-send-email-mst@kernel.org>
In-Reply-To: <20200227035423-mutt-send-email-mst@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Feb 2020 19:56:19 +0000
Message-ID: <CAFEAcA9j7aYyJ0yLRd5+=urdBgvE6U+w-6fzRfsWfscagU1HoA@mail.gmail.com>
Subject: Re: [PULL v2 00/30] virtio, pc: fixes, features
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
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

On Thu, 27 Feb 2020 at 08:55, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Wed, Feb 26, 2020 at 04:01:02AM -0500, Michael S. Tsirkin wrote:
> > changes from v1:
> >     dropped vhost changes, hope this fixes build on Mac OS.
> >
> > The following changes since commit 9a8abceb5f01d1066d3a1ac5a33aabcbaeec1860:
> >
> >   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-docs-20200225' into staging (2020-02-25 11:03:47 +0000)
> >
> > are available in the Git repository at:
> >
> >   git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
> >
> > for you to fetch changes up to deec824070e408b936e02883a1e2cb5af92448d0:
>
> I updated one of the commit logs to include CC stable, so the new
> hash is: b844a4c77b618acfba6b3f4ce12d2ad709f99279


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.0
for any user-visible changes.

-- PMM

