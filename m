Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E221F57EB
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Jun 2020 17:36:21 +0200 (CEST)
Received: from localhost ([::1]:36878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jj2m3-0007Bf-Vk
	for lists+qemu-devel@lfdr.de; Wed, 10 Jun 2020 11:36:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sameid@google.com>) id 1jj2g0-0007zk-1g
 for qemu-devel@nongnu.org; Wed, 10 Jun 2020 11:30:04 -0400
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729]:42931)
 by eggs.gnu.org with esmtps (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sameid@google.com>) id 1jj2fx-0004yB-R0
 for qemu-devel@nongnu.org; Wed, 10 Jun 2020 11:30:03 -0400
Received: by mail-qk1-x729.google.com with SMTP id l17so2376658qki.9
 for <qemu-devel@nongnu.org>; Wed, 10 Jun 2020 08:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ndvidIUQSZvMwZIRRbyQTMcuLeR3hqcYRGnjxqdbXGs=;
 b=dOpWqLrM9dEb32DrpMYF+jzjipyN6OscXdVE2DHdNOFkrjxKHTuBKfvMTni87jgrt+
 GnCjMI5SudlJlqIpYcYppEJrESv8h7A4D/nmgGiqGXpomH+XIJY/iG+tIhOtKwz1Tezn
 KU95j3HMHls1GdLJz1udEErmoge5CL0otk3iGFUHVtzjeWXQavWix+Oy07GKmBp2khug
 ekVcN9MGyjQdwwR4TgVFyeWvwkyF8wUlZIk2sUTFmllsDVMmdH7NpWXtRoS2x8JRwth8
 fdS7TVWson8GRdeUQQ/7MeOfYg87XW81+HwHGXrQrkGAToV0WhddFsZHQM0iJxSkHQwB
 B+MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ndvidIUQSZvMwZIRRbyQTMcuLeR3hqcYRGnjxqdbXGs=;
 b=KcO1yaV3MJIGshc5xplXGHFOWeq3+Elgden4MQx/unQd+Z6zwrumPomlJPjXMUmac6
 1fSHnluKwrBtrSL9wbIDBVUWNhmI24tlTqWvTztZjznp8otV18YsmXwmSW85HVJ4pK4d
 NHFKu045vydWn7d0TCn71ZqyhT7xE2EMy2vrjhbs8XuO+2z41WPzzdioPNagRLquSekt
 6Fm/JD6W6z8KLMWalgJqvh8a60+3qyIHbpz2EaSS1wPD6wjhxywqXcIqp2zYpVW7e4rX
 JdaMaLMl72Mlt4qBpagvd+uqxf1zcBTZIA0VRD/3jA03H9j9/zty2WJkc+GbeortvmtC
 UAYQ==
X-Gm-Message-State: AOAM531vZy8zKverNahbvldqRsI7Q+1wk21y6RT9F+TeAW3I55x5G63s
 Ha8b+4lODR7lfCwzN+KGLGV5Jh/bZUIhZcDooGVP9A==
X-Google-Smtp-Source: ABdhPJymnnHIRObDYaAkF5Bvl4znFceQXVw+DPqzwX1B9iFFX/7N8k9lvrHs25UKCPGMjypOCMw/8wwI8EWm+wMWdZs=
X-Received: by 2002:a37:7902:: with SMTP id u2mr3636598qkc.53.1591802984925;
 Wed, 10 Jun 2020 08:29:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAFr6bU=LjeW5_eGtwL38cher2TM52skohuANNXN9EpO+mA-z8Q@mail.gmail.com>
 <m2imfz877v.fsf@dme.org>
 <CAFr6bUk5LrEL8BPXYkNOqj_jsbxHBfbj_NYryUjszMtG89L+2w@mail.gmail.com>
 <20200610140620.GE6947@linux.fritz.box>
 <CAFr6bU=aD=AXnoR-qSdQtQC690FYFqFsDRHHGxdUDkTh2ho1cA@mail.gmail.com>
In-Reply-To: <CAFr6bU=aD=AXnoR-qSdQtQC690FYFqFsDRHHGxdUDkTh2ho1cA@mail.gmail.com>
From: Sam Eiderman <sameid@google.com>
Date: Wed, 10 Jun 2020 18:29:33 +0300
Message-ID: <CAFr6bUksp1Nm4nL69na5WDj6A5iXzwcc4K3=JNnyP4xZ+HKJHA@mail.gmail.com>
Subject: Re: Clarification regarding new qemu-img convert --target-is-zero flag
To: Kevin Wolf <kwolf@redhat.com>
Cc: David Edmondson <dme@dme.org>, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, eblake@redhat.com,
 Max Reitz <mreitz@redhat.com>, Tony Zhang <tzz@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::729;
 envelope-from=sameid@google.com; helo=mail-qk1-x729.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -185
X-Spam_score: -18.6
X-Spam_bar: ------------------
X-Spam_report: (-18.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=_AUTOLEARN
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Excuse me,

Vladimir already pointed out in the first comment that it will skip
writing real zeroes later.

Sam

On Wed, Jun 10, 2020 at 6:26 PM Sam Eiderman <sameid@google.com> wrote:
>
> Thanks for the clarification Kevin,
>
> Well first I want to discuss unallocated blocks.
> From my understanding operating systems do not rely on disks to be
> zero initialized, on the contrary, physical disks usually contain
> garbage.
> So an unallocated block should never be treated as zero by any real
> world application.
>
> Now assuming that I only care about the allocated content of the
> disks, I would like to save io/time zeroing out unallocated blocks.
>
> A real world example would be flushing a 500GB vmdk on a real SSD
> disk, if the vmdk contained only 2GB of data, no point in writing
> 498GB of zeroes to that SSD - reducing its lifespan for nothing.
>
> Now from what I understand --target-is-zero will give me this behavior
> even though that I really use it as a "--skip-prezeroing-target"
> (sorry for the bad name)
> (This is only true if later *allocated zeroes* are indeed copied correctly)
>
> Sam
>
> On Wed, Jun 10, 2020 at 5:06 PM Kevin Wolf <kwolf@redhat.com> wrote:
> >
> > Am 10.06.2020 um 14:19 hat Sam Eiderman geschrieben:
> > > Thanks David,
> > >
> > > Yes, I imaging the following use case:
> > >
> > > disk.vmdk is a 50 GB disk that contains 12 MB binary of zeroes in its beginning.
> > > /dev/sda is a raw disk containing garbage
> > >
> > > I invoke:
> > > qemu-img convert disk.vmdk -O raw /dev/sda
> > >
> > > Required output:
> > > The first 12 MB of /dev/sda contain zeros, the rest garbage, qemu-img
> > > finishes fast.
> > >
> > > Kevin, from what I understood from you, this is the default behavior.
> >
> > Sorry, I misunderstood what you want. qemu-img will write zeros to all
> > unallocated parts, too. If it didn't do that, the resulting image on
> > /dev/sda wouldn't be a copy of disk.vmdk.
> >
> > As the metadata (which blocks are allocated) cannot be preserved in raw
> > images, you wouldn't be able to tell which part of the image contains
> > valid data and which part needs to be interpreted as zeros even though
> > it contains random garbage.
> >
> > What is your use case for this result where the actual virtual disk
> > content is mixed with garbage?
> >
> > Kevin
> >

