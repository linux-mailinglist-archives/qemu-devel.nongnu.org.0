Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6EBE84FF0
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Aug 2019 17:31:37 +0200 (CEST)
Received: from localhost ([::1]:42606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hvNua-0004Po-M3
	for lists+qemu-devel@lfdr.de; Wed, 07 Aug 2019 11:31:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54287)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hvNsr-0003S9-EJ
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 11:29:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hvNsq-0003vu-Ft
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 11:29:49 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:45993)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hvNsq-0003vK-9n
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 11:29:48 -0400
Received: by mail-ot1-x343.google.com with SMTP id x21so12598471otq.12
 for <qemu-devel@nongnu.org>; Wed, 07 Aug 2019 08:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yMsieLqwqdlIND1Ne1OG/KGvtJnV0/Iki6Rpdgsvs1M=;
 b=WSko8JabmfPMK1q8/FwWDmsr3Ln3t6hpurlZGEGmzH2S5TZ9qgBAxUEfxO3ofzOqKr
 8smCs6UjCNgkMpEa96jQFHmb+Ywca3TJQNZPLzLQq8IlDL/viPUp7/nuD5Qvfejpk6bG
 lsAckyzUkSOOHjeVO0OdL8fGD7BA0n6peBrXgWp0nKe70tfyFzLoooOAgD2cGrSVl2ec
 iLaUa4ew2b+bJmSjGXZgiYUKsqKADVQc7t3amAkD7n7wEFIZxDpjQi8mCbumhFp6qYQU
 RtDbZ/bApyzdHBMc1NtdNja60OuimrdrFJjR10OGrfYnsBHBGkvTiC93own6tyDlVGt7
 2h1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yMsieLqwqdlIND1Ne1OG/KGvtJnV0/Iki6Rpdgsvs1M=;
 b=AU1coQApxau4ZNf1z4drOnOYCx7DrownmZNsQytRGSbzcwgfwGBLGPVIsEVUzrSM97
 I9t5PWTjKWX0GuqdYTMPw5IyTdg9fzvrRgcVP55Le6D7frgkh4ZIeJwyjNuGhOMFH72t
 ZSxNhaudGKPx+4RTVz1qlJg/HsPwZ6IqOGU8t+kPjzrPO5V7eLgVCH7vqhaaFsJnQxvt
 /agkDTB5POWm90mnrcpzu3+6VHIBZRCy18ohc541KsYElCSUpeP6152o02PQUcVFIJ9u
 UuBArQ6uEiChH5qq/pLCyTrT7y6ksktdiFkd3Cs6fdQ7KJI+/5R52eM6pqRYFEiDx4Vx
 zy4Q==
X-Gm-Message-State: APjAAAWFDUb+7Amdo/40xT/eh279rOuPqI5Rv5SfLqIfPiVvHToSYbiH
 Ie97SdkkBUSERri9/UksAAuXVc9WhcKnmk4Pv76kcg==
X-Google-Smtp-Source: APXvYqwdg5VbdA2hhxjpizORMBQMiXS1ADnDhJriemaICsYXzaUOFMK3zEK94IfV3f5cD2HfNVF69ukyWhV0ZSC/ipI=
X-Received: by 2002:a6b:5103:: with SMTP id f3mr9718926iob.142.1565191787480; 
 Wed, 07 Aug 2019 08:29:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190729145654.14644-1-damien.hedde@greensocs.com>
 <20190729145654.14644-29-damien.hedde@greensocs.com>
In-Reply-To: <20190729145654.14644-29-damien.hedde@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 7 Aug 2019 16:29:36 +0100
Message-ID: <CAFEAcA-1njp77xVH5jk50hiUCwHhoJ9skWPBARD4_uYiT=dVTQ@mail.gmail.com>
To: Damien Hedde <damien.hedde@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-devel] [PATCH v3 28/33] qdev: Remove unused deprecated
 reset functions
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
Cc: Fam Zheng <fam@euphon.net>, Collin Walling <walling@linux.ibm.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Edgar Iglesias <edgar.iglesias@xilinx.com>, Hannes Reinecke <hare@suse.com>,
 Qemu-block <qemu-block@nongnu.org>, David Hildenbrand <david@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-s390x <qemu-s390x@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Daniel P. Berrange" <berrange@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Mark Burton <mark.burton@greensocs.com>, qemu-ppc <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 29 Jul 2019 at 15:59, Damien Hedde <damien.hedde@greensocs.com> wrote:
>
> Remove the functions now they are unused:
> + device_legacy_reset
> + qdev_reset_all[_fn]
> + qbus_reset_all[_fn]
>
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

