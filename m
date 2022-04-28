Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52139513B20
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 19:53:34 +0200 (CEST)
Received: from localhost ([::1]:52782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk8Ka-0004jo-OJ
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 13:53:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1nk8Jg-0003zL-Mj
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 13:52:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1nk8Je-0000Ww-NM
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 13:52:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651168354;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xRH594n2toiXl/WXKPP0hoJCfhJKDG36D+R/5Z41icY=;
 b=UVgkflkzaWgORnQUBLNnQbYO/22GE6oPi061A8qG8k1wZvfXvGTCiUtEUt3/r5Eh6A7pZU
 uP3jL2mdB3aGsQCHv/qDBOnVdDP2ddKpftjxM5KcFr+iGED1tMx08bJGcN3r3JR/wDiOuD
 2uUw0xwiJsq2518UfflZ/gkQ82wbKk4=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-352-ubo9QdoxOZeMG3Vroiaq0w-1; Thu, 28 Apr 2022 13:52:24 -0400
X-MC-Unique: ubo9QdoxOZeMG3Vroiaq0w-1
Received: by mail-lf1-f70.google.com with SMTP id
 h4-20020a0565123c8400b00471f8c2a09eso2328065lfv.10
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 10:52:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xRH594n2toiXl/WXKPP0hoJCfhJKDG36D+R/5Z41icY=;
 b=TTA7NgY4sPgapVg0d43+E6aq1GCKjCLi9hD3VVOHHfalivV6vKWljaW8FY16KG9yVh
 9R7qA49+Y7mbuk24WoOHYEVXpX6xH+7AAqHKeopjdU0npJ21LS5DPrXPXRT7Wv/lYGXU
 tnN3F6rvcYsbto3g6Lubmg1LcYiATemomW/K6ckqrhIsxpjq65coAfNa/Tpyo4HfDR1q
 +VaArXwNGSMfWZ2N/12w8tMvNWkECnwVoHAwK9Y8mOJrtlm4kkVKamS+85hU1EaznDxL
 2xGReoeNS9dqMKxwVN1dDPqX87GsSFGOp5oLRrTUHbNEM5hj7pfirVX6ZWpciSXBp3Fp
 OaoQ==
X-Gm-Message-State: AOAM531dD5veQN0bxj3Z0ozqMM9XGFmBfT2s4+qeF/+Vkc3GTtK9xYVT
 u0OsNEYHFcTD3ceWL8bfJCaNtAACVawYWxcqIC8ioa0MnsX0k4JG3WC7XagPX8ngYN+YfJFYbKh
 B20EtZA1i59eM5Cpvpi1Lp1kHqjd+rC8=
X-Received: by 2002:a2e:a7cf:0:b0:24f:2bec:b2f9 with SMTP id
 x15-20020a2ea7cf000000b0024f2becb2f9mr5489229ljp.472.1651168343141; 
 Thu, 28 Apr 2022 10:52:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw5wftmJqLipsl8k3zKekOtLDNwrbWk5GlmZ0V4HoZnSi1V1x+KhjL/JZu6wAicRew7/jJ5YsnTfVeAaEf5p6g=
X-Received: by 2002:a2e:a7cf:0:b0:24f:2bec:b2f9 with SMTP id
 x15-20020a2ea7cf000000b0024f2becb2f9mr5489197ljp.472.1651168342685; Thu, 28
 Apr 2022 10:52:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220426230654.637939-1-leobras@redhat.com>
 <Ymqf7OCUyhWges/Z@work-vm>
In-Reply-To: <Ymqf7OCUyhWges/Z@work-vm>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Thu, 28 Apr 2022 14:52:11 -0300
Message-ID: <CAJ6HWG6034SXO_9dtXV4=17oeHWotmz=Z_gmOtKFstpiSBOibQ@mail.gmail.com>
Subject: Re: [PATCH v10 0/7] MSG_ZEROCOPY + multifd
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Xu <peterx@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 28, 2022 at 11:08 AM Dr. David Alan Gilbert
<dgilbert@redhat.com> wrote:
>
> * Leonardo Bras (leobras@redhat.com) wrote:
> > This patch series intends to enable MSG_ZEROCOPY in QIOChannel, and mak=
e
> > use of it for multifd migration performance improvement, by reducing cp=
u
> > usage.
> >
> > Patch #1 creates new callbacks for QIOChannel, allowing the implementat=
ion
> > of zero copy writing.
> >
> > Patch #2 implements io_writev flags and io_flush() on QIOChannelSocket,
> > making use of MSG_ZEROCOPY on Linux.
> >
> > Patch #3 adds a "zero_copy_send" migration property, only available wit=
h
> > CONFIG_LINUX, and compiled-out in any other architectures.
> > This migration property has to be enabled before multifd migration star=
ts.
> >
> > Patch #4 adds a helper function that allows to see if TLS is going to b=
e used.
> > This helper will be later used in patch #5.
> >
> > Patch #5 changes multifd_send_sync_main() so it returns int instead of =
void.
> > The return value is used to understand if any error happened in the fun=
ction,
> > allowing migration to possible fail earlier.
> >
> > Patch #6 implements an workaround: The behavior introduced in d48c3a044=
5 is
> > hard to deal with in zerocopy, so a workaround is introduced to send th=
e
> > header in a different syscall, without MSG_ZEROCOPY.
> >
> > Patch #7 Makes use of QIOChannelSocket zero_copy implementation on
> > nocomp multifd migration.
>
> Queued.
>
> > Results:
> > In preliminary tests, the resource usage of __sys_sendmsg() reduced 15 =
times,
> > and the overall migration took 13-22% less time, based in synthetic cpu
> > workload.
> >
> > In further tests, it was noted that, on multifd migration with 8 channe=
ls:
> > - On idle hosts, migration time reduced in 10% to 21%.
> > - On hosts busy with heavy cpu stress (1 stress thread per cpu, but
> >   not cpu-pinned) migration time reduced in ~25% by enabling zero-copy.
> > - On hosts with heavy cpu-pinned workloads (1 stress thread per cpu,
> >   cpu-pinned), migration time reducted in ~66% by enabling zero-copy.
>
> Nice.
>
> > Above tests setup:
> > - Sending and Receiving hosts:
> >   - CPU : Intel(R) Xeon(R) Platinum 8276L CPU @ 2.20GHz (448 CPUS)
> >   - Network card: E810-C (100Gbps)
> >   - >1TB RAM
> >   - QEMU: Upstream master branch + This patchset
> >   - Linux: Upstream v5.15
>
> That configuration is particularly interesting because while it's a big
> machine with lots of cores, the individual cores are clocked relatively
> slowly; also having lots of cores probably means they're all fighting
> over memory bandwidth, so the less copies the better.
>
> Dave
>

Thanks Dave!

Best regards,
Leo

> > - VM configuration:
> >   - 28 VCPUs
> >   - 512GB RAM
> >
> >
> > ---
> > Changes since v9:
> > - Patch #6 got simplified and improved (thanks Daniel)
> > - Patch #7 got better comments (thanks Peter Xu)
> >
> > Changes since v8:
> > - Inserted two new patches #5 & #6, previous patch #5 is now #7.
> > - Workaround an optimization introduced in d48c3a0445
> > - Removed unnecessary assert in qio_channel_writev_full_all
> >
> > Changes since v7:
> > - Migration property renamed from zero-copy to zero-copy-send
> > - A few early tests added to help misconfigurations to fail earlier
> > - qio_channel_full*_flags() renamed back to qio_channel_full*()
> > - multifd_send_sync_main() reverted back to not receiving a flag,
> >   so it always sync zero-copy when enabled.
> > - Improve code quality on a few points
> >
> > Changes since v6:
> > - Remove io_writev_zero_copy(), and makes use of io_writev() new flags
> >   to achieve the same results.
> > - Rename io_flush_zero_copy() to io_flush()
> > - Previous patch #2 became too small, so it was squashed in previous
> >   patch #3 (now patch #2)
> >
> > Changes since v5:
> > - flush_zero_copy now returns -1 on fail, 0 on success, and 1 when all
> >   processed writes were not able to use zerocopy in kernel.
> > - qio_channel_socket_poll() removed, using qio_channel_wait() instead
> > - ENOBUFS is now processed inside qio_channel_socket_writev_flags()
> > - Most zerocopy parameter validation moved to migrate_params_check(),
> >   leaving only feature test to socket_outgoing_migration() callback
> > - Naming went from *zerocopy to *zero_copy or *zero-copy, due to QAPI/Q=
MP
> >   preferences
> > - Improved docs
> >
> > Changes since v4:
> > - 3 patches got splitted in 6
> > - Flush is used for syncing after each iteration, instead of only at th=
e end
> > - If zerocopy is not available, fail in connect instead of failing on w=
rite
> > - 'multifd-zerocopy' property renamed to 'zerocopy'
> > - Fail migrations that don't support zerocopy, if it's enabled.
> > - Instead of checking for zerocopy at each write, save the flags in
> >   MultiFDSendParams->write_flags and use them on write
> > - Reorganized flag usage in QIOChannelSocket
> > - A lot of typos fixed
> > - More doc on buffer restrictions
> >
> > Changes since v3:
> > - QIOChannel interface names changed from io_async_{writev,flush} to
> >   io_{writev,flush}_zerocopy
> > - Instead of falling back in case zerocopy is not implemented, return
> >   error and abort operation.
> > - Flush now waits as long as needed, or return error in case anything
> >   goes wrong, aborting the operation.
> > - Zerocopy is now conditional in multifd, being set by parameter
> >   multifd-zerocopy
> > - Moves zerocopy_flush to multifd_send_sync_main() from multifd_save_cl=
eanup
> >   so migration can abort if flush goes wrong.
> > - Several other small improvements
> >
> > Changes since v2:
> > - Patch #1: One more fallback
> > - Patch #2: Fall back to sync if fails to lock buffer memory in MSG_ZER=
OCOPY send.
> >
> > Changes since v1:
> > - Reimplemented the patchset using async_write + async_flush approach.
> > - Implemented a flush to be able to tell whenever all data was written.
> >
> > Leonardo Bras (7):
> >   QIOChannel: Add flags on io_writev and introduce io_flush callback
> >   QIOChannelSocket: Implement io_writev zero copy flag & io_flush for
> >     CONFIG_LINUX
> >   migration: Add zero-copy-send parameter for QMP/HMP for Linux
> >   migration: Add migrate_use_tls() helper
> >   multifd: multifd_send_sync_main now returns negative on error
> >   multifd: Send header packet without flags if zero-copy-send is enable=
d
> >   multifd: Implement zero copy write in multifd migration
> >     (multifd-zero-copy)
> >
> >  qapi/migration.json                 |  24 ++++++
> >  include/io/channel-socket.h         |   2 +
> >  include/io/channel.h                |  38 +++++++++-
> >  migration/migration.h               |   6 ++
> >  migration/multifd.h                 |   4 +-
> >  chardev/char-io.c                   |   2 +-
> >  hw/remote/mpqemu-link.c             |   2 +-
> >  io/channel-buffer.c                 |   1 +
> >  io/channel-command.c                |   1 +
> >  io/channel-file.c                   |   1 +
> >  io/channel-socket.c                 | 110 +++++++++++++++++++++++++++-
> >  io/channel-tls.c                    |   1 +
> >  io/channel-websock.c                |   1 +
> >  io/channel.c                        |  49 ++++++++++---
> >  migration/channel.c                 |   3 +-
> >  migration/migration.c               |  52 ++++++++++++-
> >  migration/multifd.c                 |  75 +++++++++++++++----
> >  migration/ram.c                     |  29 ++++++--
> >  migration/rdma.c                    |   1 +
> >  migration/socket.c                  |  12 ++-
> >  monitor/hmp-cmds.c                  |   6 ++
> >  scsi/pr-manager-helper.c            |   2 +-
> >  tests/unit/test-io-channel-socket.c |   1 +
> >  23 files changed, 379 insertions(+), 44 deletions(-)
> >
> > --
> > 2.36.0
> >
> > From c6fda6f8fb29ceeaf4d36f3787b85196e9bb281f Mon Sep 17 00:00:00 2001
> > From: Leonardo Bras <leobras@redhat.com>
> > Date: Mon, 25 Apr 2022 17:45:14 -0300
> > MIME-Version: 1.0
> > Content-Type: text/plain; charset=3DUTF-8
> > Content-Transfer-Encoding: 8bit
> > To: "Marc-Andr=C3=A9 Lureau" <marcandre.lureau@redhat.com>,Paolo Bonzin=
i <pbonzini@redhat.com>,Elena Ufimtseva <elena.ufimtseva@oracle.com>,Jagann=
athan Raman <jag.raman@oracle.com>,John G Johnson <john.g.johnson@oracle.co=
m>,"Daniel P. Berrang=C3=A9" <berrange@redhat.com>,Juan Quintela <quintela@=
redhat.com>,"Dr. David Alan Gilbert" <dgilbert@redhat.com>,Eric Blake <ebla=
ke@redhat.com>,Markus Armbruster <armbru@redhat.com>,Fam Zheng <fam@euphon.=
net>,Peter Xu <peterx@redhat.com>
> > Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
> >
> >
> > Leonardo Bras (7):
> >   QIOChannel: Add flags on io_writev and introduce io_flush callback
> >   QIOChannelSocket: Implement io_writev zero copy flag & io_flush for
> >     CONFIG_LINUX
> >   migration: Add zero-copy-send parameter for QMP/HMP for Linux
> >   migration: Add migrate_use_tls() helper
> >   multifd: multifd_send_sync_main now returns negative on error
> >   multifd: Send header packet without flags if zero-copy-send is enable=
d
> >   multifd: Implement zero copy write in multifd migration
> >     (multifd-zero-copy)
> >
> >  qapi/migration.json                 |  24 ++++++
> >  include/io/channel-socket.h         |   2 +
> >  include/io/channel.h                |  38 +++++++++-
> >  migration/migration.h               |   6 ++
> >  migration/multifd.h                 |   4 +-
> >  chardev/char-io.c                   |   2 +-
> >  hw/remote/mpqemu-link.c             |   2 +-
> >  io/channel-buffer.c                 |   1 +
> >  io/channel-command.c                |   1 +
> >  io/channel-file.c                   |   1 +
> >  io/channel-socket.c                 | 110 +++++++++++++++++++++++++++-
> >  io/channel-tls.c                    |   1 +
> >  io/channel-websock.c                |   1 +
> >  io/channel.c                        |  49 ++++++++++---
> >  migration/channel.c                 |   3 +-
> >  migration/migration.c               |  52 ++++++++++++-
> >  migration/multifd.c                 |  72 +++++++++++++++---
> >  migration/ram.c                     |  29 ++++++--
> >  migration/rdma.c                    |   1 +
> >  migration/socket.c                  |  12 ++-
> >  monitor/hmp-cmds.c                  |   6 ++
> >  scsi/pr-manager-helper.c            |   2 +-
> >  tests/unit/test-io-channel-socket.c |   1 +
> >  23 files changed, 377 insertions(+), 43 deletions(-)
> >
> > --
> > 2.36.0
> >
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
>


