Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDACF5BF0F4
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 01:16:56 +0200 (CEST)
Received: from localhost ([::1]:50460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oamU3-0005Vo-4n
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 19:16:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oahwZ-0006Op-FL
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 14:26:07 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d]:34486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oahwX-0003di-EX
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 14:26:02 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id 198so4678246ybc.1
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 11:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=4GgTJJRXFNB7SKLN84+ypWHoChMUk955bLTZw/0qUyo=;
 b=Nl93HozZGynHPc78EvsIaC4oBztbX83nRBZooddNMwAe8PgtcVuWhB2Y0yIfqa+/gk
 /DVeIdWz2Bq2qBMmVL4l727yo7JJref2LzXbubnGUthzBV9v8xHSRnm20UGIm4V0qDZA
 t9NW3AHImPuMP7cH+v26YUMdOo0jAVKvyJbm3psbMz7kr4Hs8s5IyizTfLfyZevJ4V8V
 m4ANotGucnv9xVy5akpWgOeH8iM3WatNljU+MD9fL3DBayOr6RhQ3g7OqqCraEia/28O
 3X67/JpATIR+SWwWZOg33H4n00lXJ6WVujJSlz+GZqqcrRCziUOpaBkUqxYaZNtZq/cv
 nvtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=4GgTJJRXFNB7SKLN84+ypWHoChMUk955bLTZw/0qUyo=;
 b=nmBvv7S9twyftllWJ93GxiI/7oZHMV9lbSKnEs4Ekisuv6pDlzVNGVY8aEyQgrcKHy
 yBcY30pIn9jS7sN+j+zW/mlQGX6PFsyB3vvBt25QZP1TaCadPMrJZrge2tHfK7y/xDSo
 tkWX45LYd8UxBYMYZGfhSJibHL/dDxYDo5kS/VGnZYx9j/pxoG6XhrAXpofcN8L6zNOj
 DRhV9wcNfPor0ymdoTsn+6cGsFyX8EJ2m6PK3hrrql83Hhm4KfWWCFCoEjt3wZgx16zT
 bV62pTJ90EFtBrdXOO3DZOFUtt9No+q6MuRPyxWNYrUgYF72TqWOBS40r/Cy58gyPd6q
 TdFQ==
X-Gm-Message-State: ACrzQf08WqSJ2K4jr8GOBG29Xk0TBKiTXvXIOSs/8rAEptawmTKqzzQg
 Oud2dHhHxXo1Qcx1Qxmn6npTnoBD3nIA6VM/o9M=
X-Google-Smtp-Source: AMsMyM5YHt8kdaeqHBWJRyyEmVYtD65I9xG/cRfk0b09skP27YZHrFdL5PHCV3qOa39WCdfVRAuZJNv5b7/9H/O371c=
X-Received: by 2002:a25:230c:0:b0:6ae:ef02:fafc with SMTP id
 j12-20020a25230c000000b006aeef02fafcmr20408938ybj.58.1663698360135; Tue, 20
 Sep 2022 11:26:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220802095010.3330793-1-alex.bennee@linaro.org>
 <87czbvzu9e.fsf@linaro.org> <YyibNC4CbniKUTmi@fedora>
 <8735cm9t6j.fsf@linaro.org>
In-Reply-To: <8735cm9t6j.fsf@linaro.org>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Tue, 20 Sep 2022 14:25:48 -0400
Message-ID: <CAJSP0QXN4Sn6rXpZ3rEiPHGQqpgx2bOMX_t0byx+0icBhMNinA@mail.gmail.com>
Subject: Re: [PATCH v4 for 7.2 00/22] virtio-gpio and various virtio cleanups
To: mst@redhat.com
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 slp@redhat.com, marcandre.lureau@redhat.com, mathieu.poirier@linaro.org, 
 viresh.kumar@linaro.org, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb2d.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 20 Sept 2022 at 10:18, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>
>
> Stefan Hajnoczi <stefanha@redhat.com> writes:
>
> > [[PGP Signed Part:Undecided]]
> > On Fri, Sep 16, 2022 at 07:51:40AM +0100, Alex Benn=C3=A9e wrote:
> >>
> >> Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:
> >>
> >> > Hi,
> >> >
> >> > This is an update to the previous series which fixes the last few
> >> > niggling CI failures I was seeing.
> >> >
> >> >    Subject: [PATCH v3 for 7.2 00/21] virtio-gpio and various virtio =
cleanups
> >> >    Date: Tue, 26 Jul 2022 20:21:29 +0100
> >> >    Message-Id: <20220726192150.2435175-1-alex.bennee@linaro.org>
> >> >
> >> > The CI failures were tricky to track down because they didn't occur
> >> > locally but after patching to dump backtraces they all seem to invol=
ve
> >> > updates to virtio_set_status() as the machine was torn down. I think
> >> > patch that switches all users to use virtio_device_started() along
> >> > with consistent checking of vhost_dev->started stops this from
> >> > happening. The clean-up seems worthwhile in reducing boilerplate
> >> > anyway.
> >> >
> >> > The following patches still need review:
> >> >
> >> >   - tests/qtest: enable tests for virtio-gpio
> >> >   - tests/qtest: add a get_features op to vhost-user-test
> >> >   - tests/qtest: implement stub for VHOST_USER_GET_CONFIG
> >> >   - tests/qtest: add assert to catch bad features
> >> >   - tests/qtest: plain g_assert for VHOST_USER_F_PROTOCOL_FEATURES
> >> >   - tests/qtest: catch unhandled vhost-user messages
> >> >   - tests/qtest: use qos_printf instead of g_test_message
> >> >   - tests/qtest: pass stdout/stderr down to subtests
> >> >   - hw/virtio: move vhd->started check into helper and add FIXME
> >> >   - hw/virtio: move vm_running check to virtio_device_started
> >> >   - hw/virtio: add some vhost-user trace events
> >> >   - hw/virtio: log potentially buggy guest drivers
> >> >   - hw/virtio: fix some coding style issues
> >> >   - include/hw: document vhost_dev feature life-cycle
> >> >   - include/hw/virtio: more comment for VIRTIO_F_BAD_FEATURE
> >> >   - hw/virtio: fix vhost_user_read tracepoint
> >> >   - hw/virtio: handle un-configured shutdown in virtio-pci
> >> >   - hw/virtio: gracefully handle unset vhost_dev vdev
> >> >   - hw/virtio: incorporate backend features in features
> >> <snip>
> >>
> >> Ping?
> >
> > Who are you pinging?
> >
> > Only qemu-devel is on To and there are a bunch of people on Cc.
>
> Well I guess MST is the maintainer for the sub-system but I was hoping
> other virtio contributors had some sort of view. The process of
> up-streaming a simple vhost-user stub has flushed out all sorts of
> stuff.

Okay, moving MST to To in case it helps get his attention.

Thanks,
Stefan

