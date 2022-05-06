Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3766451D1F4
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 09:07:49 +0200 (CEST)
Received: from localhost ([::1]:41986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nms44-0005Y0-2J
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 03:07:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nms2J-0003zy-QB
 for qemu-devel@nongnu.org; Fri, 06 May 2022 03:05:59 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136]:41650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nms2I-0005zq-1a
 for qemu-devel@nongnu.org; Fri, 06 May 2022 03:05:59 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-2ebf4b91212so71678237b3.8
 for <qemu-devel@nongnu.org>; Fri, 06 May 2022 00:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6k5O5PrdIhh5yPLPgaP+qzQ+ykAItWXap7rod1P59yw=;
 b=kXITT23f70f7zN/wlhpIErThKju+AaDnit2T5BjFZqB4VcklqvhSo6GWPPHIyLAlpO
 jLW8+cjyE9O7NG7t3X808gNLuJGijYyZFUw3SRZGa43xGfr6TyFUzZpOCNSiX4GW/v7O
 OkE9GlC//KyhPPqkiUr8ypo36Cemk34tMIAIAuTEV1+Yoa8mydzv8JKP/JQJi1WuXjeE
 5BOiRTkMlhuM/cR3qzJT6nMCONv7Lc2z+MRtTpPGpPMz9MzCqnUyrF6GCOQUXIgA/jL6
 Bgsg98bqGjhRnrBhcKvblOgPBpozjnKtz0MFnx39HeZ3HZuRBUXIjO+JqQLTG3rFUeYQ
 D1fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6k5O5PrdIhh5yPLPgaP+qzQ+ykAItWXap7rod1P59yw=;
 b=ftAiUJu6q5YyipcBEgU8gXmAIbXNfhfxhb44ahsTPdDfO8Y5JMTKPnVzdjRy2h1HxM
 ZqBg6atQblLCVY7nM0EKRt8H+Dq8X2vZJ+Q41GUE7yREA5Esg/b9OJ9F4LUNFlpFfpCo
 5hvbd95nSIaMFRX3VbKrVkTbNTF4HqJx6ZBYV4UyAR2tKj+4fJjIN+JvjB5E/dFowo7a
 rqRvboLjVAuAaY08cyW++PU4sOM+gQfKjBoBGJVY7jvHKBXru8NqgkGYjSpCKHjJshSH
 zXXTqrT7lKS3n4dD4aTFYPPJGdRoE4U/fBJ2T4ciBqZwv9cUk//opQ+eIsv56e2mlolT
 OfLQ==
X-Gm-Message-State: AOAM530HO6iyxgliFuaBLoiE62pthpKtx5V98LTfCBNA2kpNpnT+YPV0
 yPWkRoLjlUgHILlO+Fs+dFOVMxZM3fHZKMYa4Xw=
X-Google-Smtp-Source: ABdhPJymDwpQ+H65jkTVeVx6r/C5ztrsuY/AKslIipJM3bNZtPTvSON3ZDOdwY8Dgniycae2fiEPkU+r3yBBvBHbRj0=
X-Received: by 2002:a05:690c:102:b0:2ef:48d8:24c3 with SMTP id
 bd2-20020a05690c010200b002ef48d824c3mr1495938ywb.153.1651820756765; Fri, 06
 May 2022 00:05:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220324134812.541274-1-bmeng.cn@gmail.com>
 <CAEUhbmVUqSghy+HE9p2qg1bJXYHBjy83jowesA_Zx383JrO7CQ@mail.gmail.com>
 <CAEUhbmVrvzvvNeKJvT5saPbXDoEnHdZcZyuNTmt4R=YzOs1R2A@mail.gmail.com>
 <CAEUhbmUDqwtXiEioBuSOi6ZyVNKnJgjYZAPTubGx+McbMFwZKA@mail.gmail.com>
 <CAEUhbmXuYt2KqKtrvMRoR2acFaweO3zVGa4+tyoxMnSc-kg11Q@mail.gmail.com>
 <CAEUhbmV2SH80i2vCato_2qRGeDCqeDqVp1m0Lc_SrJLGhZK-jw@mail.gmail.com>
In-Reply-To: <CAEUhbmV2SH80i2vCato_2qRGeDCqeDqVp1m0Lc_SrJLGhZK-jw@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 6 May 2022 15:05:45 +0800
Message-ID: <CAEUhbmVxfbrkw3ZvzOb3gVm-c_5KU_B_UiT42m+bgVQdPPJtLQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] hw/core: Sync uboot_image.h from U-Boot v2022.01
To: Peter Maydell <peter.maydell@linaro.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Thomas Huth <thuth@redhat.com>
Cc: Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yw1-x1136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

+more

On Tue, May 3, 2022 at 11:44 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Thu, Apr 28, 2022 at 4:43 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > On Fri, Apr 22, 2022 at 11:00 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> > >
> > > +Richard
> > >
> > > On Wed, Apr 20, 2022 at 4:16 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> > > >
> > > > On Tue, Apr 12, 2022 at 9:11 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> > > > >
> > > > > On Thu, Mar 24, 2022 at 9:48 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> > > > > >
> > > > > > From: Bin Meng <bin.meng@windriver.com>
> > > > > >
> > > > > > Sync uboot_image.h from upstream U-Boot v2022.01 release [1].
> > > > > >
> > > > > > [1] https://source.denx.de/u-boot/u-boot/-/blob/v2022.01/include/image.h
> > > > > >
> > > > > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > > > > > ---
> > > > > >
> > > > > > (no changes since v1)
> > > > > >
> > > > > >  hw/core/uboot_image.h | 213 ++++++++++++++++++++++++++++--------------
> > > > > >  1 file changed, 142 insertions(+), 71 deletions(-)
> > > > > >
> > > > >
> > > > > Ping?
> > > >
> > > > Ping?
> > >
> > > Richard, is that you to pick up this series?
> > >
> >
> > Ping?
>
> Ping? Can you please indicate who is the right person to pick up this
> series? Thanks.
>

I pinged several times, but there's radio silence, sigh. Can you
please let me know who is supposed to pick up this series?

Regards,
Bin

