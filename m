Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8943B3AC8F2
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 12:37:21 +0200 (CEST)
Received: from localhost ([::1]:39286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luBsG-0007kx-He
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 06:37:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1luBpQ-0003FG-91; Fri, 18 Jun 2021 06:34:25 -0400
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a]:44874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1luBpN-0005qY-Po; Fri, 18 Jun 2021 06:34:24 -0400
Received: by mail-io1-xd2a.google.com with SMTP id q3so6498462iop.11;
 Fri, 18 Jun 2021 03:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QUKZxCSnrKBjR+cTFMIsiWmnWnqPVLhnCBXX+CvZD7I=;
 b=qQpkz8RHCk6pnGvLakjxzTFbvqedjmn9IfHBwj4NWW/G5b9+mW37pNeNS1S1P2vMAp
 nV+EjCLZjdWfmogM3/rUk3beg0Ds5N40JnI4qHeAoJIvwZPXtiGCdD3i42zfJL/cnOuf
 NZgAe8cv3T5lS+UqSgAWoFpTloBUQXQl4PZqN/evEaZTR5HRKQWnfnoS3b/LV2aDxKM9
 C0JfSur63zZ1tWYovPAoH0ECxzQIZKiEJt7IRh2EtQGzUklwtjttcT4wORLv2PavKs4L
 yikG1tCCNW+VKucXskeoM19lH09EpZksyfqzS86vh8Wf/O7szYtvwvdkJisRYMPatW95
 j4yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QUKZxCSnrKBjR+cTFMIsiWmnWnqPVLhnCBXX+CvZD7I=;
 b=PWkA5jmU2jSIWI59a9GxsR8zRidhNfCtkKANtnBaDgzfpPpEbFsF61BILY/Jn9ySvq
 Sn6oJ87UZUIn4zW//uBPTiOchL/qsjtnnWxcEKDS8G8e5Is9YF0RhDg8+M+D5xW9i5aS
 Ksoyl3RLf80hBKDhPxdjo9sJMlNKhjOKV6TtwF1xoCorAkS6izUkYtIwD4IAzrdpvYoU
 zYvwwtZYuzsuaMIW8LQQE/3VJ579CBHP/Rj2uCEzm3gUf/EFAvcJa/8aSxmPTw2XIysb
 wCFn06edpiY7dfDFCOfezHPLj7K/e2JSzopEecw56aXjUC4188z45gXnQQ9dJ28GcqWR
 1FGA==
X-Gm-Message-State: AOAM532sQ0jSMJDkd1Z517LkatXrsy08ly8pJGcDOnZI6RvJLQQ7CtXP
 pHVgx06OB+jiI7u3SWWxp+nC8W7id29IKZWQkCQ=
X-Google-Smtp-Source: ABdhPJyNpSSoY7fbaY3RAAsD/tZIIXcUxhqNLP8o5JHVoVyF0bRqJMhZPZBvCWgwzfI07lpLg+ill+huxnl1HgoWNeI=
X-Received: by 2002:a05:6638:267:: with SMTP id
 x7mr2733260jaq.51.1624012459596; 
 Fri, 18 Jun 2021 03:34:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210519142359.23083-1-pl@kamp.de>
 <20210519142359.23083-6-pl@kamp.de>
 <CAOi1vP8AFWaS7Qwu8DVQP0EGZh48CcsrYnTfCWU2J6ZctGA2EQ@mail.gmail.com>
 <99aaf586-5555-8c45-08c8-e50e3b5919de@kamp.de>
In-Reply-To: <99aaf586-5555-8c45-08c8-e50e3b5919de@kamp.de>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Fri, 18 Jun 2021 12:34:10 +0200
Message-ID: <CAOi1vP8PAMttja8vWvxkWX-Wn4co5tu6kORKXSHGbwTMzFzMdA@mail.gmail.com>
Subject: Re: [PATCH V3 5/6] block/rbd: add write zeroes support
To: Peter Lieven <pl@kamp.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=idryomov@gmail.com; helo=mail-io1-xd2a.google.com
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
Cc: kwolf@redhat.com, berrange@redhat.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, ct@flyingcircus.io, Paolo Bonzini <pbonzini@redhat.com>,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 18, 2021 at 11:00 AM Peter Lieven <pl@kamp.de> wrote:
>
> Am 16.06.21 um 14:34 schrieb Ilya Dryomov:
> > On Wed, May 19, 2021 at 4:28 PM Peter Lieven <pl@kamp.de> wrote:
> >> Signed-off-by: Peter Lieven <pl@kamp.de>
> >> ---
> >>  block/rbd.c | 37 ++++++++++++++++++++++++++++++++++++-
> >>  1 file changed, 36 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/block/rbd.c b/block/rbd.c
> >> index 0d8612a988..ee13f08a74 100644
> >> --- a/block/rbd.c
> >> +++ b/block/rbd.c
> >> @@ -63,7 +63,8 @@ typedef enum {
> >>      RBD_AIO_READ,
> >>      RBD_AIO_WRITE,
> >>      RBD_AIO_DISCARD,
> >> -    RBD_AIO_FLUSH
> >> +    RBD_AIO_FLUSH,
> >> +    RBD_AIO_WRITE_ZEROES
> >>  } RBDAIOCmd;
> >>
> >>  typedef struct BDRVRBDState {
> >> @@ -705,6 +706,10 @@ static int qemu_rbd_open(BlockDriverState *bs, QDict *options, int flags,
> >>          }
> >>      }
> >>
> >> +#ifdef LIBRBD_SUPPORTS_WRITE_ZEROES
> >> +    bs->supported_zero_flags = BDRV_REQ_MAY_UNMAP;
> > I wonder if we should also set BDRV_REQ_NO_FALLBACK here since librbd
> > does not really have a notion of non-efficient explicit zeroing.
>
>
> This is only true if thick provisioning is supported which is in Octopus onwards, right?

Since Pacific, I think.

>
> So it would only be correct to set this if thick provisioning is supported otherwise we could
>
> fail with ENOTSUP and then qemu emulates the zeroing with plain writes.

I actually had a question about that.  Why are you returning ENOTSUP
in case BDRV_REQ_MAY_UNMAP is not specified and that can't be fulfilled
because librbd is too old for RBD_WRITE_ZEROES_FLAG_THICK_PROVISION?

My understanding has always been that BDRV_REQ_MAY_UNMAP is just
a hint.  Deallocating if BDRV_REQ_MAY_UNMAP is specified is not nice
but should be perfectly acceptable.  It is certainly better than
returning ENOTSUP, particularly if ENOTSUP causes Qemu to do plain
zeroing.

Thanks,

                Ilya

