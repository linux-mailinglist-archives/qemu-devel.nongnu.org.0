Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D01426268D
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Sep 2020 06:59:46 +0200 (CEST)
Received: from localhost ([::1]:44512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFsCv-0002J8-Ld
	for lists+qemu-devel@lfdr.de; Wed, 09 Sep 2020 00:59:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>) id 1kFsCG-0001t5-O0
 for qemu-devel@nongnu.org; Wed, 09 Sep 2020 00:59:04 -0400
Received: from mail-oo1-xc44.google.com ([2607:f8b0:4864:20::c44]:41522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>) id 1kFsCB-0006Zr-S6
 for qemu-devel@nongnu.org; Wed, 09 Sep 2020 00:59:04 -0400
Received: by mail-oo1-xc44.google.com with SMTP id t3so284179ook.8
 for <qemu-devel@nongnu.org>; Tue, 08 Sep 2020 21:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Ay1yzYJscZJKqYcNJ4Izgg3OKWHIzVyyihkmOz7aWzo=;
 b=PHJ02nvtJyL3wSX4Yc8W0jcE/oRFwFJp+8Rxzr3bBnB4Gs2R8bN4VkcgaHMOO2CCyx
 XW0QU1REhVTu01emuC2cqr/Hj+NVNvo4iLQNZljKgZzH3DSkOgIXZ+DdiAnAiD80Cvxz
 dyowFFFF4wUMNno4gkx+9+M2A1/vHa73ftCkU3X18t55qN1pjczv481Ve8iGgt3oZMy6
 xCjWEHw4VfxY7LlxyJtzbRwb0FMkOUHyNgmL3CmZvUhXoayo0XwOmuGMOku67x/0c9B7
 jL6Kv4G2/XNnbDzJe7qJOpTdFpJP4DaP7MQkQmWr8rxpJacET86bDbDJWsClpqseo6om
 PAtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Ay1yzYJscZJKqYcNJ4Izgg3OKWHIzVyyihkmOz7aWzo=;
 b=nLBkfaYt9PY27xQYyjbNr+/xasUPuGIpBIl7kDaHxrj5wnULjqp3E+M3caSdwTnkZu
 k1fzIc2XDpH58VT6Q8XGgLcwyVoDfgI0UZ5nROG7GcXCXSVbDhOexG7DYRoxqegM6j1F
 dtBoxljNXdpp3YLocMMsljzUeCsaUtEnzygb9zBJm3125ljl+0rk2K05+dp17tL4DRM2
 IaQaIwVMwPDfTf/evGuD1/dQ7WhIo6afSa3yD/bWLQR+NnS806+yheyruEiTiz1uZapy
 3//NY5WBFAFp4V6rB8xxBgIByNhfoxeaoR16jtBSQsVQvnZ2VrFUAMB8NaP0HhVaqXTg
 0vfg==
X-Gm-Message-State: AOAM530czM2vuyQ4cSIY+G1UTDEBvFPbsmXh9WqAK+4sYCIs1Og3cx1E
 sGzwuWYnYQkrA0s0HcK3YuLD4uGSohmJhR9azsA=
X-Google-Smtp-Source: ABdhPJyQ0jSzrRgLd2T05F70ygR4IvJsxG2NUyoOn0JyMnrbUab+WB/qWLsZ/3bUVlNiG2kQ1kfyEnXxPesNa8BNKUs=
X-Received: by 2002:a4a:ae4c:: with SMTP id a12mr1533145oon.60.1599627538583; 
 Tue, 08 Sep 2020 21:58:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200908164157.47108-1-liq3ea@163.com>
 <20200908164157.47108-2-liq3ea@163.com>
 <48a99ece-d808-f860-2551-0fec05ec5b01@redhat.com>
 <20200909044856.lvk77pcfvt567ub6@sirius.home.kraxel.org>
In-Reply-To: <20200909044856.lvk77pcfvt567ub6@sirius.home.kraxel.org>
From: Li Qiang <liq3ea@gmail.com>
Date: Wed, 9 Sep 2020 12:58:22 +0800
Message-ID: <CAKXe6S+s-hV2dcK=xVd4jrfNEYH0DvwkAkj5ooyrutA-vGJsdw@mail.gmail.com>
Subject: Re: [RFC 1/4] memory: add memory_region_init_io_with_dev interface
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::c44;
 envelope-from=liq3ea@gmail.com; helo=mail-oo1-xc44.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Li Qiang <liq3ea@163.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Qemu Developers <qemu-devel@nongnu.org>, Alexander Bulekov <alxndr@bu.edu>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Gerd Hoffmann <kraxel@redhat.com> =E4=BA=8E2020=E5=B9=B49=E6=9C=889=E6=97=
=A5=E5=91=A8=E4=B8=89 =E4=B8=8B=E5=8D=8812:49=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, Sep 09, 2020 at 10:15:47AM +0800, Jason Wang wrote:
> >
> > On 2020/9/9 =E4=B8=8A=E5=8D=8812:41, Li Qiang wrote:
> > > Currently the MR is not explicitly connecting with its device instead=
 of
> > > a opaque. In most situation this opaque is the deivce but it is not a=
n
> > > enforcement. This patch adds a DeviceState member of to MemoryRegion
> > > we will use it in later patch.
> >
> >
> > I don't have a deep investigation. But I wonder whether we could make s=
ure
> > of owner instead of adding a new field here.
>
> Should be possible.  There is object_dynamic_cast() which can be used to
> figure whenever a given owner object is a device.
>

I found most caller of 'memory_region_init_io' will set the owner to
the device object.
But some of them will just set it to NULL. Do will have a clear rule
that the device's MR
'owner' should be the device object? If yes, we can use this field.

Thanks,
Li Qiang

> take care,
>   Gerd
>

