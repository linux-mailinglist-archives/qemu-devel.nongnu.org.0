Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BC11FA9BC
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jun 2020 09:10:55 +0200 (CEST)
Received: from localhost ([::1]:46478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jl5kF-0006ZH-1M
	for lists+qemu-devel@lfdr.de; Tue, 16 Jun 2020 03:10:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <coiby.xu@gmail.com>)
 id 1jl5Vs-0007vS-CQ
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 02:56:05 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:41271)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <coiby.xu@gmail.com>)
 id 1jl5Vq-0007Ah-Gb
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 02:56:04 -0400
Received: by mail-pf1-x442.google.com with SMTP id 10so9032847pfx.8
 for <qemu-devel@nongnu.org>; Mon, 15 Jun 2020 23:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=y/pX7qxsLIUajggcY92AZ6bw/n97fJVH1BRi//cWGTk=;
 b=mRJ5AgL4vbvYt7RfCDU3nWhZk9hcH/uBt/51uOyWoRMdt04OwRvWYDGYrx7YvlTjPr
 LIrhltxg9aPEM1k3Rou9SCF3SMiiGdz4MIdaro1k4MrlDIICkCzxo9UDYf4KVG6SMaWU
 NqqD0di+QPoMFRAUz+YabLa5UUBisDY7CVKAHMS3oqkO56n+xjj4+mqscRf5ziIW4TTU
 SHxwNin/1yLDfPmawb2Goqx2f/tZh+GmLTPw1FGa0v/kREkiqUW4YEVIDjDKEtS1T835
 tXh9pTBR7I8Pw61/VmnSP4lc/Xh8t2lkpUMFddfqfYqzZ1oX8EvnfgKrpsZE3tTL81qm
 pvhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=y/pX7qxsLIUajggcY92AZ6bw/n97fJVH1BRi//cWGTk=;
 b=UPWGjdNAaPLpXxv5Fu+a8h7J6gmHyNINOb3llTrvd1VufZagsDJS+BxHKMefnXs2MF
 hFCwXIJf7JLHu3j9wuewK+sDUqCHHfyhINY1qZIbsnMsnPLkpXm+SDLePjATDy7fqOgZ
 8uonVxbJoo0kAuwtZu/GfDvJxBrbVF6uDw0p2ALDQPKnQxcP2Jov/bYnETp4KbdS98ic
 jeMYu8lH1Zba+hji8SR17mTRq4o20nLsyaIMlDbcVNK2MFsuVEdXcJ5kaZcRMQWIXjZV
 DeG9KjnTLpUsyxVkpjL2J91h2hbFIXHL5VBQ5YRv9wQD84BIbNp6rTEpOmZ/JYYPkLn5
 5DPA==
X-Gm-Message-State: AOAM531rgC8431YtHQuwUtsaYpK6NTFjczLsW2N8rDnrDF9J1Boj5IIL
 oENMaCWB+xXTPyXm2ahNOXE=
X-Google-Smtp-Source: ABdhPJwJAWBFuILMRacJrRk2c7CbILeDLnpvAhEZ41CjvVvDRzjNZ/iQ17Nwfe9jmbyjMoE1dnY/uQ==
X-Received: by 2002:a63:ef11:: with SMTP id u17mr990685pgh.249.1592290560871; 
 Mon, 15 Jun 2020 23:56:00 -0700 (PDT)
Received: from localhost ([2001:e42:102:1532:160:16:113:140])
 by smtp.gmail.com with ESMTPSA id gq8sm1447745pjb.14.2020.06.15.23.55.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2020 23:56:00 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date: Tue, 16 Jun 2020 14:55:56 +0800
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH v8 0/4] vhost-user block device backend implementation
Message-ID: <20200616065556.4hy6ufszd474t2o2@r>
References: <20200604233538.256325-1-coiby.xu@gmail.com>
 <20200611123703.jpokj4m75woxt55f@steredhat>
 <20200614184640.ydfsi6dhs5jkhaqx@r>
 <20200615084425.cjqlpazef4644huk@steredhat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20200615084425.cjqlpazef4644huk@steredhat>
Received-SPF: pass client-ip=2607:f8b0:4864:20::442;
 envelope-from=coiby.xu@gmail.com; helo=mail-pf1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: kwolf@redhat.com, bharatlkmlkvm@gmail.com, qemu-devel@nongnu.org,
 stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 15, 2020 at 10:46:10AM +0200, Stefano Garzarella wrote:
>On Mon, Jun 15, 2020 at 02:46:40AM +0800, Coiby Xu wrote:
>> Hi Stefano Garzarella,
>>
>> On Thu, Jun 11, 2020 at 02:37:03PM +0200, Stefano Garzarella wrote:
>> > Hi Coiby Xu,
>> >
>> > On Fri, Jun 05, 2020 at 07:35:34AM +0800, Coiby Xu wrote:
>> > > v8
>> > >  - re-try connecting to socket server to fix asan error
>> > >  - fix license naming issue
>> > >
>> > > v7
>> > >  - fix docker-test-debug@fedora errors by freeing malloced memory
>> > >
>> > > v6
>> > >  - add missing license header and include guard
>> > >  - vhost-user server only serve one client one time
>> > >  - fix a bug in custom vu_message_read
>> > >  - using qemu-storage-daemon to start vhost-user-blk-server
>> > >  - a bug fix to pass docker-test-clang@ubuntu
>> > >
>> > > v5:
>> > >  * re-use vu_kick_cb in libvhost-user
>> > >  * keeping processing VhostUserMsg in the same coroutine until there is
>> > >    detachment/attachment of AIOContext
>> > >  * Spawn separate coroutine for each VuVirtqElement
>> > >  * Other changes including relocating vhost-user-blk-server.c, coding
>> > >    style etc.
>> > >
>> > > v4:
>> > >  * add object properties in class_init
>> > >  * relocate vhost-user-blk-test
>> > >  * other changes including using SocketAddress, coding style, etc.
>> > >
>> > > v3:
>> > >  * separate generic vhost-user-server code from vhost-user-blk-server
>> > >    code
>> > >  * re-write vu_message_read and kick hander function as coroutines to
>> > >    directly call blk_co_preadv, blk_co_pwritev, etc.
>> > >  * add aio_context notifier functions to support multi-threading model
>> > >  * other fixes regarding coding style, warning report, etc.
>> > >
>> > > v2:
>> > >  * Only enable this feature for Linux because eventfd is a Linux-specific
>> > >    feature
>> > >
>> > >
>> > > This patch series is an implementation of vhost-user block device
>> > > backend server, thanks to Stefan and Kevin's guidance.
>> > >
>> > > Vhost-user block device backend server is a UserCreatable object and can be
>> > > started using object_add,
>> > >
>> > >  (qemu) object_add vhost-user-blk-server,id=ID,unix-socket=/tmp/vhost-user-blk_vhost.socket,node-name=DRIVE_NAME,writable=off,blk-size=512
>> > >  (qemu) object_del ID
>> > >
>> > > or appending the "-object" option when starting QEMU,
>> > >
>> > >   $ -object vhost-user-blk-server,id=disk,unix-socket=/tmp/vhost-user-blk_vhost.socket,node-name=DRIVE_NAME,writable=off,blk-size=512
>> > >
>> > > Then vhost-user client can connect to the server backend.
>> > > For example, QEMU could act as a client,
>> > >
>> > >   $ -m 256 -object memory-backend-memfd,id=mem,size=256M,share=on -numa node,memdev=mem -chardev socket,id=char1,path=/tmp/vhost-user-blk_vhost.socket -device vhost-user-blk-pci,id=blk0,chardev=char1
>> > >
>> > > And guest OS could access this vhost-user block device after mounting it.
>> > >
>> > > Coiby Xu (4):
>> > >   Allow vu_message_read to be replaced
>> > >   generic vhost user server
>> > >   vhost-user block device backend server
>> > >   new qTest case to test the vhost-user-blk-server
>> > >
>> > >  block/Makefile.objs                        |   1 +
>> > >  block/export/vhost-user-blk-server.c       | 716 ++++++++++++++++++++
>> > >  block/export/vhost-user-blk-server.h       |  34 +
>> > >  contrib/libvhost-user/libvhost-user-glib.c |   2 +-
>> > >  contrib/libvhost-user/libvhost-user.c      |  11 +-
>> > >  contrib/libvhost-user/libvhost-user.h      |  21 +
>> > >  softmmu/vl.c                               |   4 +
>> > >  tests/Makefile.include                     |   3 +-
>> > >  tests/qtest/Makefile.include               |   2 +
>> > >  tests/qtest/libqos/vhost-user-blk.c        | 130 ++++
>> > >  tests/qtest/libqos/vhost-user-blk.h        |  44 ++
>> > >  tests/qtest/libqtest.c                     |  54 +-
>> > >  tests/qtest/libqtest.h                     |  38 ++
>> > >  tests/qtest/vhost-user-blk-test.c          | 737 +++++++++++++++++++++
>> > >  tests/vhost-user-bridge.c                  |   2 +
>> > >  tools/virtiofsd/fuse_virtio.c              |   4 +-
>> > >  util/Makefile.objs                         |   1 +
>> > >  util/vhost-user-server.c                   | 406 ++++++++++++
>> > >  util/vhost-user-server.h                   |  59 ++
>> > >  19 files changed, 2229 insertions(+), 40 deletions(-)
>> > >  create mode 100644 block/export/vhost-user-blk-server.c
>> > >  create mode 100644 block/export/vhost-user-blk-server.h
>> > >  create mode 100644 tests/qtest/libqos/vhost-user-blk.c
>> > >  create mode 100644 tests/qtest/libqos/vhost-user-blk.h
>> > >  create mode 100644 tests/qtest/vhost-user-blk-test.c
>> > >  create mode 100644 util/vhost-user-server.c
>> > >  create mode 100644 util/vhost-user-server.h
>> > >
>> >
>> > Should we add an entry in the MAINTAINERS file for some of the new files?
>> > (e.g. util/vhost-user-server.*)
>>
>> Yes, please. Thank you!
>
>I think the best thing should be to edit MAINTAINERS in this series,
>since you're adding new files, but I don't know who will maintain them ;-)

Thank you for the explanation! I thought the MAINTAINERS file is supposed
to be treated in a special way:)

--
Best regards,
Coiby

