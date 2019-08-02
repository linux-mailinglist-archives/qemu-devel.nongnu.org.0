Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 583367EC37
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Aug 2019 07:47:26 +0200 (CEST)
Received: from localhost ([::1]:60502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1htQPV-0002PM-Ix
	for lists+qemu-devel@lfdr.de; Fri, 02 Aug 2019 01:47:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41171)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <renyime@gmail.com>) id 1htQP0-0001zZ-Lr
 for qemu-devel@nongnu.org; Fri, 02 Aug 2019 01:46:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <renyime@gmail.com>) id 1htQOz-0000gy-Fq
 for qemu-devel@nongnu.org; Fri, 02 Aug 2019 01:46:54 -0400
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42]:45446)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <renyime@gmail.com>) id 1htQOz-0000gi-AX
 for qemu-devel@nongnu.org; Fri, 02 Aug 2019 01:46:53 -0400
Received: by mail-io1-xd42.google.com with SMTP id g20so149666813ioc.12
 for <qemu-devel@nongnu.org>; Thu, 01 Aug 2019 22:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UjmKaC7AVxrRFmkBt0DlANxKHegEeTGVVxEOSrp6Tsc=;
 b=tg6NT+YQfaAeeqy8kTrHPTV+RkeqX/l5OAw+AnvYeN8MX0eOmqzJ33/4RfAWiaFAO0
 5+4u0z/Bj2DuRxfc+chbHhibS6o8rryBaHD4KHzHw6ZrO8WfrW1dfNhesslb1dC2gOZ4
 WfHFjairtH20xv4xnjBCeUVjlgF6z9DAJNWenmnmJ3eFuVBCGyHpdcBPM/eWq50iEaQl
 UHciXEyJ4jcGBDWCgfLGeM/zfBBJLajNxVBNL+gkcB20bv36wIpvVArPvsetT9OjjfJJ
 4KoSJQjYfQ962+XzlDZ1jBDQVY2ZXX5vHxMSBFZ7pHGkQLwGIoNH26PznWyHPVGtNBeZ
 0H+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UjmKaC7AVxrRFmkBt0DlANxKHegEeTGVVxEOSrp6Tsc=;
 b=gXIKhy+eQy63bW/R8HUv8VPMwUMIqsMnEOghRerD5bgd2w6kBtsSe8ABUT+8e33Ri9
 TFRsnE5flNQPRhmQELOrPC9Z8eMRfYHZz2ioO00ihKVDe/32va5oh7jWqcND4cZfiiVb
 GIiBCs7WOjJvcI1srLxICxPYfsl2Q7KGvme2mnFCq5lyO6MEMrdTKOR5WQR4y0Xlpf1j
 JFijGjcAZ8XPU3XOshk2RoKrctww+kzHl9aO4KhVIGdEKEUALQ4nazatJIrFAuXpS+dP
 /eVboRgvHm/ahs8fHHl/Pe6xbtcCjxzl+2LW1x3oNvGMuG7avBPk6rZuPDbUrbmr4n6p
 7DWQ==
X-Gm-Message-State: APjAAAUZ5VVsq0AlG/tR1TJH1nDKIjKD0MQG+tKo1FKkUE7SKptf2Wit
 YAT2aTXyEtViL0ysN/Tp5hLe3BLBSe5hDRqB6e8=
X-Google-Smtp-Source: APXvYqzV0oOuB66Zx68V1qjIl9VTm4PTcpsYszB2qXV1EznJQX+a7XWwyqtGbShZTcXNZAezcHBxlGW+kLUMnZhihco=
X-Received: by 2002:a5e:8f42:: with SMTP id x2mr35928744iop.35.1564724812598; 
 Thu, 01 Aug 2019 22:46:52 -0700 (PDT)
MIME-Version: 1.0
References: <1564464992-22305-1-git-send-email-ivanren@tencent.com>
 <20190801022118.GA21992@richard>
 <CA+6E1==Dc5Zac3Q-tt2V2pbq-DofW=AZX6tP1RoDBp4KSNxiKw@mail.gmail.com>
 <20190802004904.GA20638@richard>
In-Reply-To: <20190802004904.GA20638@richard>
From: Ivan Ren <renyime@gmail.com>
Date: Fri, 2 Aug 2019 13:46:41 +0800
Message-ID: <CA+6E1=n-B7u1H_eSn-0FKeg_PuvbkJyxN6u2U37ageZVM7xUkQ@mail.gmail.com>
To: Wei Yang <richardw.yang@linux.intel.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::d42
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.23
Subject: Re: [Qemu-devel] [PATCH] migration: always initial ram_counters for
 a new migration
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
Cc: quintela@redhat.com, qemu-devel@nongnu.org, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>>>>     s->iteration_start_time = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
>>>>+    /*
>>>>+     * Update s->iteration_initial_bytes to match
>>s->iteration_start_time.
>>>>+     */
>>>>+    s->iteration_initial_bytes = migration_total_bytes(s);
>>>
>>>Is this one necessary? We have sent out nothing yet.
>>
>>Yes, currently nothing has been sent yet at this point.
>>
>>Is that better to always match the update of iteration_initial_bytes
>>and iteration_start_time in a explicit way to avoid some potential
missing?
>>
>
>You may get some point. Well after a close look, we may find other
potential
>problem.
>
>1. To be consistency, we need to update iteration_initial_pages too.
>   So my opinion is to wrap the update of these three counters into a
helper
>   function. So each time all of them.
>2. In function ram_get_total_transferred_pages, do we missed multifd_bytes?

In function ram_save_multifd_page, ram pages transferred by multifd threads
is
counted by ram_counters.normal.
You mean other multifd bytes like multifd packet or multifd sync info?

Thanks.

On Fri, Aug 2, 2019 at 8:49 AM Wei Yang <richardw.yang@linux.intel.com>
wrote:

> On Thu, Aug 01, 2019 at 04:10:34PM +0800, Ivan Ren wrote:
> >>>     s->iteration_start_time = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
> >>>+    /*
> >>>+     * Update s->iteration_initial_bytes to match
> >s->iteration_start_time.
> >>>+     */
> >>>+    s->iteration_initial_bytes = migration_total_bytes(s);
> >>
> >>Is this one necessary? We have sent out nothing yet.
> >
> >Yes, currently nothing has been sent yet at this point.
> >
> >Is that better to always match the update of iteration_initial_bytes
> >and iteration_start_time in a explicit way to avoid some potential
> missing?
> >
>
> You may get some point. Well after a close look, we may find other
> potential
> problem.
>
> 1. To be consistency, we need to update iteration_initial_pages too.
>    So my opinion is to wrap the update of these three counters into a
> helper
>    function. So each time all of them.
>
> 2. In function ram_get_total_transferred_pages, do we missed multifd_bytes?
>
> --
> Wei Yang
> Help you, Help me
>
