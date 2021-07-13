Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5D63C72A6
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 16:51:59 +0200 (CEST)
Received: from localhost ([::1]:40886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3JlO-00089L-Vw
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 10:51:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1m3Jkd-0007RN-IV
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 10:51:11 -0400
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b]:35692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1m3Jka-0003dv-W8
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 10:51:11 -0400
Received: by mail-qt1-x82b.google.com with SMTP id g12so16807323qtb.2
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 07:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=DQjogmnX0g2KYVgabU+naVGuMf6sZxL1Pv7AfmC/VuI=;
 b=VFfDzIng9cu39RmvzKt4mRFU3pHagnm3tPOeV4kDJok4J2Sy71l/v2xK5mrHPWi6ls
 zqx18r/Djb5CpHuUCiZ7yYBDuWLjJWfxBIz0DYYAW7RBtfrZ1wyBMDukFXXSrZr/2Ipw
 8r6mwgz38pavHsnw9/dYhV41Q4IzvZMzzq0rTk/wVwuU1yO74SWjCK+Wu7OCh16fzdhQ
 VL0OydW4zLF5ul71OBl0G/39jamagNq/IArL299Vs3hnkkFXOHW3l2wHE7h2ql6CJDJS
 OTC2xNMuh/ictdKf+HoCcs9b/PRMAroYzX85UH9fp4Dlyk/7VSo5IQdSL4zDbh+oR/4v
 ZZJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=DQjogmnX0g2KYVgabU+naVGuMf6sZxL1Pv7AfmC/VuI=;
 b=nfRzmh9i8up0iLNQmdYmi5imFeE3Yo0u9U/gUQa473yk4ClqBX0P9ixGRcyVD58I3z
 gK0nnmRNG8m7aJf3XogQoczYANv83cErrJN7h/03e4uQ4VwaFsM+PJdUj2O1Fk9ooB3X
 1k4Jkwh1mfQoXE43Ylh2KKZVvha2ETK75jYbnLVVIYgY2STt6eZpENtKnQnuKrfSxQs2
 hxHZoU+2tASxsMv+YtB0lVe12uBTcgJgL/d8jLsaGVFTaBFjyVt+Lw306w6qz1flbG5v
 AqTAurBcuqbb7Tbd29FrysDGx7gIRmZY2yYHxTbORk0ecuGVB1I945uqI/MApUBGQL9W
 OpBw==
X-Gm-Message-State: AOAM533pvqrA87FQsJL7A5OuVsAerR1ctISqi0CwIINXiQCYA2J1FPXl
 LrVPEEMSSma5x5RnuAoUPac=
X-Google-Smtp-Source: ABdhPJxeWdAPu/oHWdWWQ62lzg8TOi+Va4U8PplUntLbJfhD10CCDqinBW1ILICQfYkrS8SZcL7xrQ==
X-Received: by 2002:ac8:5a13:: with SMTP id n19mr1315325qta.49.1626187868038; 
 Tue, 13 Jul 2021 07:51:08 -0700 (PDT)
Received: from [192.168.0.6] (d149-67-175-105.try.wideopenwest.com.
 [67.149.105.175])
 by smtp.gmail.com with ESMTPSA id q206sm8129485qka.19.2021.07.13.07.51.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 13 Jul 2021 07:51:07 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: usb-host device not working
From: Programmingkid <programmingkidx@gmail.com>
In-Reply-To: <7E422E91-63A4-4D36-B5FF-7FD2181FB845@gmail.com>
Date: Tue, 13 Jul 2021 10:51:06 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <909C5402-0B86-4ABE-8D9C-D9B80347B024@gmail.com>
References: <7E422E91-63A4-4D36-B5FF-7FD2181FB845@gmail.com>
To: Gerd Hoffmann <kraxel@redhat.com>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Received-SPF: pass client-ip=2607:f8b0:4864:20::82b;
 envelope-from=programmingkidx@gmail.com; helo=mail-qt1-x82b.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU devel list <qemu-devel@nongnu.org>, Howard Spoelstra <hsp.cat7@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Jul 13, 2021, at 10:49 AM, Programmingkid =
<programmingkidx@gmail.com> wrote:
>=20
> I have been having problems with using host USB devices lately. I use =
to be able to use host USB devices but can't currently. After doing some =
git bisecting I found it was this patch that causes this issue:
>=20
> commit 627302afb2f85cdd4b59595361876487aef19b7a (refs/bisect/bad)
> Author: Gerd Hoffmann <kraxel@redhat.com>
> Date:   Thu Jun 24 12:38:35 2021 +0200
>=20
>    usb: build usb-host as module
>=20
>    Drop one more shared library dependency (libusb) from core qemu.
>=20
>    Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
>    Reviewed-by: Jose R. Ziviani <jziviani@suse.de>
>    Message-Id: <20210624103836.2382472-34-kraxel@redhat.com>
>    Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>=20
> I build QEMU like this:
>=20
> ./configure --target-list=3Di386-softmmu --enable-libusb && make -j 9
>=20
> This command use to work but fails now with the above commit:
>=20
> qemu-system-i386 -usb -device =
usb-host,vendorid=3D0x093a,productid=3D0x2510
>=20
> I think this is a bug with the commit. Any suggestions?
>=20
> Thank you.

Forgot to mention this issue is observed on Mac OS 11.1.=

