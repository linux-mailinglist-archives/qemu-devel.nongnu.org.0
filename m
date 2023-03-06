Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B796AC426
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 15:57:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZCGu-00085m-F0; Mon, 06 Mar 2023 09:57:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pZCGs-00085G-SJ
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 09:57:02 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pZCGr-0002RR-8C
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 09:57:02 -0500
Received: by mail-ed1-x52d.google.com with SMTP id x3so39630038edb.10
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 06:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678114619;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o8XieM+3B8oYNHiOOICsrIsH3Z6lSjmzLwnBnrG0WZY=;
 b=LkyvjeeZwBAHD+IEmGKM4gjp7rxoZUsLVOc18OcmXcMfe19G0lecS1maYteUN7GZCo
 ODCX/E2nYDeZVpVlg7NtQEcTRb03QfigJ2PgKkl19su3LQ2mC0eeA1Tfa1ixQj0YlmK4
 BqG8dWO0pwkY8czfOURQKm5I638KHkbg38QI4ONmaOjQPxCeRq7i7KINW5k8G37Z7A7W
 ZONONLvN72S+ksOtPfGmH668YnXJ0yQ19IpsVC46y+cv8/XDU3xBLMl0Ipe/ZEEMefr7
 Id5INMhTYA0WAFwtKkBymMXZpFdS5W6Eo1p1VnXc7wHBcdg7EMGO9d2HxD9hPEgIaGmh
 dTmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678114619;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o8XieM+3B8oYNHiOOICsrIsH3Z6lSjmzLwnBnrG0WZY=;
 b=am4o4+LR+/Fl/0ExPcFBSwjIzZaVbRGjNiLl6vGw47nbjol+C+o2KW28ZoOfFfsuKV
 XBUybB8iAXveKhu+PVSyy4MvyjQ1XGmwOgSx1mlr6xZlL0CUpx4VvJ3IMqIKbI7nO50R
 pXMHlJXJTvTj2+MbnteWii0/I+1g/iywEtHIUNO2paw+V12WPgzv0UhQHabGzmt5nupF
 gBqVzzTx5pko4ajaFUMe47nTKoJqPK85jlu1VPiGTvXQvloWMXbfKhJzOIr+2gyaGtgG
 sMVLIYjK1WhMgimu/tmwQj3p6tK4SuYBSpo4rLvaVvOoHC3c2TxJbMvhUU7De+s69T/7
 ylMQ==
X-Gm-Message-State: AO0yUKUToGu8Ghcv+b54tM9fnhC/ZyyTuzdBVfL5Z7axPXEihhI6cDUa
 eiEBzppIjIzC7vbL2LxybiGsUhTyckkX6AedOsI=
X-Google-Smtp-Source: AK7set9os4OesC27es0/nHaS3k82IRQ0rf9AtRewjNhAVadK4nq8/onADC3WDfg1gyRG/HqcVoQ3usNsDlkmo6uVENw=
X-Received: by 2002:a17:907:1045:b0:8b1:30eb:9dba with SMTP id
 oy5-20020a170907104500b008b130eb9dbamr4850388ejb.6.1678114619238; Mon, 06 Mar
 2023 06:56:59 -0800 (PST)
MIME-Version: 1.0
References: <20230220100815.1624266-1-bin.meng@windriver.com>
 <5311946.tteGgEznqY@silver>
In-Reply-To: <5311946.tteGgEznqY@silver>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 6 Mar 2023 22:56:49 +0800
Message-ID: <CAEUhbmXaq=TJ8U+a9xkohacP8OfZyGkuZKxwffrqNKdYE0=OOw@mail.gmail.com>
Subject: Re: [PATCH v5 00/16] hw/9pfs: Add 9pfs support for Windows
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Mon, Mar 6, 2023 at 10:15=E2=80=AFPM Christian Schoenebeck
<qemu_oss@crudebyte.com> wrote:
>
> On Monday, February 20, 2023 11:07:59 AM CET Bin Meng wrote:
> > At present there is no Windows support for 9p file system.
> > This series adds initial Windows support for 9p file system.
> >
> > 'local' file system backend driver is supported on Windows,
> > including open, read, write, close, rename, remove, etc.
> > All security models are supported. The mapped (mapped-xattr)
> > security model is implemented using NTFS Alternate Data Stream
> > (ADS) so the 9p export path shall be on an NTFS partition.
> >
> > 'synth' driver is adapted for Windows too so that we can now
> > run qtests on Windows for 9p related regression testing.
> >
> > Example command line to test:
> >   "-fsdev local,path=3Dc:\msys64,security_model=3Dmapped,id=3Dp9 -devic=
e
> virtio-9p-pci,fsdev=3Dp9,mount_tag=3Dp9fs"
> >
> > Changes in v5:
> > - rework Windows specific xxxdir() APIs implementation
>
> I didn't have the chance to look at this v5 yet.
>
> In general it would help for review to point out in the cover letter whic=
h
> patch(es) have changed, what decisions you have made and why.
>
> In this case I guess that's patch 4.
>

Yes, it's patch 4, and v5 is reworked following your comments
regarding patch 4 of v4.

Regards,
Bin

