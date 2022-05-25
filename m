Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (unknown [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BFC533D11
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 14:58:58 +0200 (CEST)
Received: from localhost ([::1]:50466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntqaz-0000Q6-JE
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 08:58:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1ntqUk-0002sf-2B
 for qemu-devel@nongnu.org; Wed, 25 May 2022 08:52:11 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:34448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1ntqUf-00025m-6q
 for qemu-devel@nongnu.org; Wed, 25 May 2022 08:52:06 -0400
Received: by mail-ed1-x52a.google.com with SMTP id o28so68474edi.1
 for <qemu-devel@nongnu.org>; Wed, 25 May 2022 05:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jJoXS4QbTqY+6Ytj1ko3ad/fgmxmK4IBIn+8+xdwW2Q=;
 b=LMbeFYYi83I6V7ixPr6WpqPsufujm8BryySMBwbZOd2kTTWTyWfEO8K5DI1HbbLvZu
 obf4u1YGKQVgg0SdvImuT/Nvep1VnmZ2p4AhVOOHp2MP2Q5zqhpK51kRAnE6BRedFhZx
 5ngvW1LSuceJ7CEatTM6pZTDUPjKrb8BTH+HHeI2NRM9Ilt4g2RSp1MgHJgW3H/aqCNk
 7gNnRyKTCw+SylHm0VsHrqxdcoB1xkLgRPLCyOOA3rjf/klhxu8mFXyn6cVBzNW8uLjJ
 45NlchWsrNLP7hpVArR205NqUNFIyszJYDwdesMZMvPi0bVtzIk7CLQA4f9PP1GjdKn/
 zm+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jJoXS4QbTqY+6Ytj1ko3ad/fgmxmK4IBIn+8+xdwW2Q=;
 b=XbVVXhCRfyA10ifIwTMTBtPnld0XvPOgA90lPcEIf4pRWlw72Lp3aKA1eGUdOdasCc
 6nPiyezxsuRTMmmb5FnFFdlx8S40xo9HehmFMVsFc1FSgcylp96xf81SKyoy8jvjpLAc
 wSomAQL0UGq9f/euRCB9a4Kg+CTLmqtsRSYiXL6D50m88rpjVqYZacw7dfMpZ6oEdM81
 KTYDrqyGCGKOnYoMT93YL3BSNQanTe69dLfjCNyKb/xg0NX70nNb4PNoSPxH0DUGsD1L
 9qw4cNI2Mmk04tXs5o7J5edizb5y8POBUxy60dQfOMHoGNI+YhDFS0jerdG4WCwt48gn
 m7lg==
X-Gm-Message-State: AOAM531xSGZnR/sWICOR/kL44WiABcZ8hvJJ3Qy6dFgxBFS5KdU+i0em
 NMd34Bynshy5T2JcRk+YrFF+G2BQ4V6BoT3Hr8cG
X-Google-Smtp-Source: ABdhPJwOSbdIt18QPElQsh9Qu2fFbH9O87pydoB99kkgnwBgJPYwVPU+UaeskWrn53Wq6f+teCFPXCnJrs1+vv17v7Y=
X-Received: by 2002:a50:d0da:0:b0:42b:cfa8:f1ce with SMTP id
 g26-20020a50d0da000000b0042bcfa8f1cemr1120090edf.365.1653483122490; Wed, 25
 May 2022 05:52:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220523084611.91-1-xieyongji@bytedance.com>
 <Yo4MyKif+2a5Cnw+@stefanha-x1.localdomain>
In-Reply-To: <Yo4MyKif+2a5Cnw+@stefanha-x1.localdomain>
From: Yongji Xie <xieyongji@bytedance.com>
Date: Wed, 25 May 2022 20:52:48 +0800
Message-ID: <CACycT3tC-6Cw_eX8tzi=04-7ZpJQKXou=HXDBn3jEBFqjasFTA@mail.gmail.com>
Subject: Re: [PATCH v6 0/8] Support exporting BDSs via VDUSE
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 mreitz@redhat.com, 
 mlureau@redhat.com, jsnow@redhat.com, Eric Blake <eblake@redhat.com>, 
 Coiby.Xu@gmail.com, hreitz@redhat.com, qemu-block@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=xieyongji@bytedance.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 25, 2022 at 7:02 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> On Mon, May 23, 2022 at 04:46:03PM +0800, Xie Yongji wrote:
> > Hi all,
> >
> > Last few months ago, VDUSE (vDPA Device in Userspace) [1] has
> > been merged into Linux kernel as a framework that make it
> > possible to emulate a vDPA device in userspace. This series
> > aimed at implementing a VDUSE block backend based on the
> > qemu-storage-daemon infrastructure.
> >
> > To support that, we firstly introduce a VDUSE library as a
> > subproject (like what libvhost-user does) to help implementing
> > VDUSE backends in QEMU. Then a VDUSE block export is implemented
> > based on this library. At last, we add resize and reconnect support
> > to the VDUSE block export and VDUSE library.
> >
> > Now this series is based on Stefan's patch [2]. And since we don't
> > support vdpa-blk in QEMU currently, the VM case is tested with my
> > previous patchset [3].
> >
> > [1] https://www.kernel.org/doc/html/latest/userspace-api/vduse.html
> > [2] https://lore.kernel.org/all/20220518130945.2657905-1-stefanha@redhat.com/
> > [3] https://www.mail-archive.com/qemu-devel@nongnu.org/msg797569.html
> >
> > Please review, thanks!
>
> Thanks, applied to my block tree:
> https://gitlab.com/stefanha/qemu/commits/block
>
> Successfully manually tested on Linux 5.17.6.
>
> Please send a follow-up patch that adds a tests/qemu-iotests/ test case
> that launches qemu-storage-daemon with a vduse-blk export, writes a
> pattern to the disk, and reads the pattern back to verify it. An
> automated test will prevent bitrot.
>

Will do it.

> I am sending a follow-up patch with documentation so users can discover
> and learn how to use this new feature.
>

OK.

Thanks,
Yongji

