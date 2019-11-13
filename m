Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13592FB32A
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Nov 2019 16:05:46 +0100 (CET)
Received: from localhost ([::1]:46182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iUuDI-0006eY-UY
	for lists+qemu-devel@lfdr.de; Wed, 13 Nov 2019 10:05:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59834)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <sameid@google.com>) id 1iUuBy-0006BR-Ja
 for qemu-devel@nongnu.org; Wed, 13 Nov 2019 10:04:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <sameid@google.com>) id 1iUuBs-0007np-CT
 for qemu-devel@nongnu.org; Wed, 13 Nov 2019 10:04:21 -0500
Received: from mail-qv1-xf41.google.com ([2607:f8b0:4864:20::f41]:36501)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <sameid@google.com>) id 1iUuBs-0007mc-08
 for qemu-devel@nongnu.org; Wed, 13 Nov 2019 10:04:16 -0500
Received: by mail-qv1-xf41.google.com with SMTP id cv8so772765qvb.3
 for <qemu-devel@nongnu.org>; Wed, 13 Nov 2019 07:04:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9BzBQdGpdDldyAJp0pfSmKIoynEYxRw2R3kxt4neugk=;
 b=mt4jMJD6WMdbir6vXTPqHeiy+dzhbI58QNZladSjKT5Kifh/V41EVMEY953FoPwWAp
 AaBWzHiCZNbtMsxbU3jkDNWU3TFolpiMrT0iTeuBn3ER3lgC2ZjO/nTaPQ4HREMVpRtx
 wiS456Wpa7styW9aokGoPMPyGQe+mnvsey6pQMZ/c1FwISFg0k2nZQ0VebRZizJdX7nR
 UM8hZsJ67rsgPhe+ESK3A6OcBLXuLPNDqio6dpWqTyj1zRmWN2amZ7CBHj7vf0kNV0kG
 KXhHmFoOXHHA/+7P4mCkvExvTF1b9+qmuRNjnRa7AYFPoFlhf3waNAuXzclquQidXC33
 abHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9BzBQdGpdDldyAJp0pfSmKIoynEYxRw2R3kxt4neugk=;
 b=FqcZEfZzD1MsbWVcwGRqW+RRsYfn2TneP8bixtsaRwbMtD2/4j6obyuy6MMPLH2l2Q
 gRaVL0hT25Bana5ghnPcFQYt9f9ske2iDZK3AG7O/A5bLEtCk/K6wrwwiZUyNKGLnDCw
 vDon6n/NCTcVnt2h8DddkhrlF96QTveEDq5OQn/e9eWC8CPZNnJCES4xZ1Ci3kH/RmUl
 5ywaTnLYPXJdHPxvUuHHQ3qH7LqEGFe1V8k2O+dJW1QRju7Czn9rK4qmGFWoPxmX+kzv
 cO9LfbkxSnIBFNW3FXXT4IPuozSGdd5Z8K+fEk5yrA6R0LJ/dyrW0kQJmHkX8SJDyb0W
 0mFg==
X-Gm-Message-State: APjAAAW/aDM2tZNauMHmEeJfDDMkNn3qas/ujVEVdz+710AfHg3eTMwZ
 rRFFhf8ghtw3hf1/B+uvzq5OYOloRWX3SwSEh/hXZw==
X-Google-Smtp-Source: APXvYqwwYozt2tyKkgeedoW75m9/KTbcIjod/oR3LCzA7SCU3dcXD1z/skn4fvIOidf34vSYqpSBMw/xIBUyjfCJc+0=
X-Received: by 2002:ad4:4092:: with SMTP id l18mr3085552qvp.114.1573657451648; 
 Wed, 13 Nov 2019 07:04:11 -0800 (PST)
MIME-Version: 1.0
References: <20191113091809.31365-1-kraxel@redhat.com>
 <84d3a1aa-bbb2-d831-0abc-fe1169f8a860@redhat.com>
 <20191113140057.2ocwfa3rqqfkbg3r@sirius.home.kraxel.org>
In-Reply-To: <20191113140057.2ocwfa3rqqfkbg3r@sirius.home.kraxel.org>
From: Sam Eiderman <sameid@google.com>
Date: Wed, 13 Nov 2019 17:03:58 +0200
Message-ID: <CAFr6bUn5W2-w3z4Ty9XD7mh+=kxVq2rQJ3ZUz5nXA13ZdxQtsg@mail.gmail.com>
Subject: Re: [SeaBIOS] Re: [PATCH] ahci: zero-initialize port struct
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Laszlo Ersek <lersek@redhat.com>, seabios@seabios.org, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::f41
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

Does this fix a bug that actually happened?

I just noticed that in my lchs patches I assumed that lchs struct is
zeroed out in all devices (not only ahci):

9caa19be0e53 (geometry: Apply LCHS values for boot devices)

Seems like this is not the case but why only ahci is affected?

The list of devices is at least:

        * ata
        * ahci
        * scsi
            * esp
            * lsi
            * megasas
            * mpt
            * pvscsi
            * virtio
        * virtio-blk

As specified in the commit message.

Also Gerd it seems that my lchs patches were not committed in the
latest submitted version (v4)!!!
The ABI of the fw config key is completely broken.


On Wed, Nov 13, 2019 at 4:02 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> On Wed, Nov 13, 2019 at 10:35:03AM +0100, Laszlo Ersek wrote:
> > On 11/13/19 10:18, Gerd Hoffmann wrote:
> > > Specifically port->driver.lchs needs clearing, otherwise seabios will
> >
> > s/driver/drive/
>
> > Reviewed-by: Laszlo Ersek <lersek@redhat.com>
>
> Typo fixed & pushed.
>
> thanks,
>   Gerd
> _______________________________________________
> SeaBIOS mailing list -- seabios@seabios.org
> To unsubscribe send an email to seabios-leave@seabios.org

