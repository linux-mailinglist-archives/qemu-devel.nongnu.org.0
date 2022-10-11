Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C615FBDE4
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 00:44:26 +0200 (CEST)
Received: from localhost ([::1]:59250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiNz7-00065E-FK
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 18:44:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oiNwo-0001o3-Vi
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 18:42:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oiNwl-0001ca-EV
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 18:42:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665528118;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=i8TTtposSZYQTtB9V6JPIFQIxeYJS2AvR7pe9z9adFg=;
 b=QHaVH29Gh8DNyypWsqHYFsOzHEnSMSmJLDO00pL9uFsDSKH8+sClZxYfEXK1tgpRiizZGi
 6DWyjeKWVnm3U4K/JnKabi0QzKf13/+NPO2YM6/+mI+dR1xYb6g4tZ8CifineuISkP5KEQ
 i4JQrRDveTzgwadsqvKKSpE8Wy2x8HI=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-126-8Ffqk4RbNda3nKuYzlqgQA-1; Tue, 11 Oct 2022 18:41:57 -0400
X-MC-Unique: 8Ffqk4RbNda3nKuYzlqgQA-1
Received: by mail-qk1-f199.google.com with SMTP id
 h9-20020a05620a244900b006ee944ec451so511354qkn.13
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 15:41:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=i8TTtposSZYQTtB9V6JPIFQIxeYJS2AvR7pe9z9adFg=;
 b=fQD6XK7p1w5DqNFPmkjrTKX0v48c/Q9v16qc9dwnXl9B5g/lk5Lpj+ktCMrv/Jw5xz
 Xt7xdWxf3hq30+qyEvPbuOfFdTjtxEeJXNlSG9/3ie+VznglZovVe6/FWaZ8IHFbyYVu
 S9uQliEBmsgSNnWXi5Ym+XfYW65DHUTLR8tYG42BdJyfvAL8eP8uLLeF3g+aQRTttMsX
 Enw6k9f27RPYhS46gYJQup/vf4OK1py3kKHEdfndlgr7m8MQJbBN7e2CcFbOGHqFVZ0T
 y7ZlS8md/rmZD9iocDHjz8qspUAgsn/NaiFejSB384QnGp1jJk2NJL/LMlsX7bG5eVtV
 yJOg==
X-Gm-Message-State: ACrzQf0WACRMsVlzwEyOvF5dOCdbCjQBrCRyUWu+u604mrvOM4K5YsMj
 xxxdgHIVVCHkS7x8KkL7qrlDV9ljE75PpIUFLoSIrkdQ3vRlFcfChn+mRFzxyoToVSIyyjNnj9b
 BYpFtdR+WAgefFC+1YzkrEc2n+d5CL/sDgIBdeo61znvRzPT64juH6m0pG625zCjy
X-Received: by 2002:a05:6214:509a:b0:4b1:b089:366e with SMTP id
 kk26-20020a056214509a00b004b1b089366emr21648838qvb.99.1665528116565; 
 Tue, 11 Oct 2022 15:41:56 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM619v4vDz1stPZUNnMEWKLVrKLZsgU89zS86ukICQmz3yQg9S5JMeRm/+QNvpgiSK050mzMXg==
X-Received: by 2002:a05:6214:509a:b0:4b1:b089:366e with SMTP id
 kk26-20020a056214509a00b004b1b089366emr21648808qvb.99.1665528116267; 
 Tue, 11 Oct 2022 15:41:56 -0700 (PDT)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca. [70.31.27.79])
 by smtp.gmail.com with ESMTPSA id
 h17-20020ac87771000000b0039ad65104fasm4258660qtu.12.2022.10.11.15.41.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 15:41:55 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: peterx@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Yury Kotov <yury-kotov@yandex-team.ru>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PATCH RFC 0/2] qemu-thread: Strict unlock check
Date: Tue, 11 Oct 2022 18:41:52 -0400
Message-Id: <20221011224154.644379-1-peterx@redhat.com>
X-Mailer: git-send-email 2.37.3
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

NOTE: mark patchset RFC because "make check" will easily fail; but I didn't
yet dig into why as I'm not familiar with the code paths that triggers, it
can be bugs hidden or something I missed.  So RFC to just have some thoughts.

The first patch converts the new timedwait to use DEBUG_MUTEX paths too.
IMO this one is pretty much wanted.  The second patch add a strict version
of pthread_mutex_unlock() check by making sure the lock is locked first.

This comes from a debugging of migration code where we have had functions
like:

  /* func() must be with lockA held */
  func() {
    ...
    /* Temporarily release the lock */
    qemu_mutex_unlock(lockA);
    ...
    /* Retake the lock */
    qemu_mutex_lock(lockA);
    ...
  }

Since I found that pthread lib is very "friendly" to unpaired unlock and
just silently ignore it, returning 0 as succeed.  It means when func() is
called without lockA held the unlock() above will be ignored, but the
follow up lock() will be real.  Later it will easily cause deadlock
afterwards in func() above because they just don't pair anymore right after
the one ignored unlock().

Since it's harder to know where should we take the lock, it's still easily
to fail the unlock() upon a lock not being held at all, so it's at least
earlier than the deadlock later on lockA in some other thread.

Patch 2 can also be used to further replace [sg]et_iothread_locked(), I
think, then we need to move the "locked" to be outside DEBUG_MUTEX but only
keep the assert() inside.  But we can discuss that later.

Comments welcomed, thanks.

Peter Xu (2):
  qemu-thread: Enable the new timedwait to use DEBUG_MUTEX too
  qemu-thread: Fail hard for suspecious mutex unlocks

 include/qemu/thread-posix.h |  1 +
 util/qemu-thread-common.h   | 10 ++++++++++
 util/qemu-thread-posix.c    |  4 ++--
 3 files changed, 13 insertions(+), 2 deletions(-)

-- 
2.37.3


