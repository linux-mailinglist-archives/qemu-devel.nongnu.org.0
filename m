Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7700030FD6E
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 20:58:38 +0100 (CET)
Received: from localhost ([::1]:46062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7klx-0007Wp-Io
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 14:58:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7kfW-0007pM-Eo
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 14:51:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7kfU-0002fh-9O
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 14:51:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612468315;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DSrGfSFIZlN4upHHx72mJEWu4IFMNAQCvaviPoxmPcw=;
 b=dnMdoafLXfxPUrjLbFjmS1wd7ZHIFTMQgTtoZcjU8tnPsIzzeHlMhUGDnEww0/LpQoezvG
 K7L3EiR68t+7hIETxEBoY09nZ0bqOKUUffZ2OPoDJlCNb0LdB5JOB+/xukG38/DiHplX2u
 4jfsmyuvuEBt7hjgg2CM4DbBQF5kW7M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-573--pJro7LuMwSbGRmEpDtqfg-1; Thu, 04 Feb 2021 14:51:53 -0500
X-MC-Unique: -pJro7LuMwSbGRmEpDtqfg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E364B91270;
 Thu,  4 Feb 2021 19:51:51 +0000 (UTC)
Received: from work-vm (ovpn-114-21.ams2.redhat.com [10.36.114.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 63E9860C05;
 Thu,  4 Feb 2021 19:51:41 +0000 (UTC)
Date: Thu, 4 Feb 2021 19:51:38 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 00/27] migration queue
Message-ID: <20210204195138.GQ3039@work-vm>
References: <20210204163959.377618-1-dgilbert@redhat.com>
 <CAFEAcA--Orfsp_V6PDMW4GcKsZYBJ7rW4V4QsU+ia6BUVdXXug@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA--Orfsp_V6PDMW4GcKsZYBJ7rW4V4QsU+ia6BUVdXXug@mail.gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: gaojinhao@huawei.com, "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 andrey.gruzdev@virtuozzo.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Maydell (peter.maydell@linaro.org) wrote:
> On Thu, 4 Feb 2021 at 17:16, Dr. David Alan Gilbert (git)
> <dgilbert@redhat.com> wrote:
> >
> > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> >
> > The following changes since commit 1ba089f2255bfdb071be3ce6ac6c3069e8012179:
> >
> >   Merge remote-tracking branch 'remotes/armbru/tags/pull-qmp-2021-02-04' into staging (2021-02-04 14:15:35 +0000)
> >
> > are available in the Git repository at:
> >
> >   git://github.com/dagrh/qemu.git tags/pull-migration-20210204a
> >
> > for you to fetch changes up to ef74d46576a9e5aff96f285b74150f341a525688:
> >
> >   migration: introduce snapshot-{save, load, delete} QMP commands (2021-02-04 16:29:03 +0000)
> >
> > ----------------------------------------------------------------
> > Migration pull 2020-02-04
> >
> >  New snapshot features:
> >    a) Andrey's RAM snapshot feature using userfault-wp
> >    b) Dan's native-QMP snapshots
> >
> > Cleanups:
> >    c) Jinhao's memory leeak fixes
> >    d) Wainer's maybe unitialized fix
> >    e) Markus's parameter fixes
> >
> > Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> 
> Fails iotest 267 on ppc64 host:
>   TEST   iotest-qcow2: 267 [fail]

Hmm sorry about that; I'll attack it next week.

Dave

> QEMU          --
> "/home/pm215/qemu/build/all/tests/qemu-iotests/../../qemu-system-ppc64"
> -nodefaults -display none -accel q
> test
> QEMU_IMG      -- "/home/pm215/qemu/build/all/tests/qemu-iotests/../../qemu-img"
> QEMU_IO       --
> "/home/pm215/qemu/build/all/tests/qemu-iotests/../../qemu-io" --cache
> writeback --aio threads -f qcow2
> QEMU_NBD      -- "/home/pm215/qemu/build/all/tests/qemu-iotests/../../qemu-nbd"
> IMGFMT        -- qcow2
> IMGPROTO      -- file
> PLATFORM      -- Linux/ppc64 gcc1-power7.osuosl.org 3.10.0-862.14.4.el7.ppc64
> TEST_DIR      -- /home/pm215/qemu/build/all/tests/qemu-iotests/scratch
> SOCK_DIR      -- /tmp/tmpea7m6_b4
> SOCKET_SCM_HELPER --
> /home/pm215/qemu/build/all/tests/qemu-iotests/socket_scm_helper
> --- /home/pm215/qemu/tests/qemu-iotests/267.out
> +++ 267.out.bad
> @@ -36,7 +36,9 @@
>  ID        TAG               VM SIZE                DATE     VM CLOCK     ICOUNT
>  --        snap0                SIZE yyyy-mm-dd hh:mm:ss 00:00:00.000
>  (qemu) loadvm snap0
> -(qemu) quit
> +./common.rc: line 163: 24600 Segmentation fault      ( if [ -n
> "${QEMU_NEED_PID}" ]; then
> +    echo $BASHPID > "${QEMU_TEST_DIR}/qemu-${_QEMU_HANDLE}.pid";
> +fi; VALGRIND_QEMU="${VALGRIND_QEMU_VM}" _qemu_proc_exec
> "${VALGRIND_LOGFILE}" "$QEMU_PROG" $QEMU_OPTIONS "$@" )
> 
>  Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134217728
>  Testing: -drive driver=IMGFMT,file=TEST_DIR/t.IMGFMT,if=none -device
> virtio-blk,drive=none0
> @@ -47,7 +49,9 @@
>  ID        TAG               VM SIZE                DATE     VM CLOCK     ICOUNT
>  --        snap0                SIZE yyyy-mm-dd hh:mm:ss 00:00:00.000
>  (qemu) loadvm snap0
> -(qemu) quit
> +./common.rc: line 163: 24653 Segmentation fault      ( if [ -n
> "${QEMU_NEED_PID}" ]; then
> +    echo $BASHPID > "${QEMU_TEST_DIR}/qemu-${_QEMU_HANDLE}.pid";
> +fi; VALGRIND_QEMU="${VALGRIND_QEMU_VM}" _qemu_proc_exec
> "${VALGRIND_LOGFILE}" "$QEMU_PROG" $QEMU_OPTIONS "$@" )
> 
> 
>  === -drive if=virtio ===
> @@ -72,7 +76,9 @@
>  ID        TAG               VM SIZE                DATE     VM CLOCK     ICOUNT
>  --        snap0                SIZE yyyy-mm-dd hh:mm:ss 00:00:00.000
>  (qemu) loadvm snap0
> -(qemu) quit
> +./common.rc: line 163: 24760 Segmentation fault      ( if [ -n
> "${QEMU_NEED_PID}" ]; then
> +    echo $BASHPID > "${QEMU_TEST_DIR}/qemu-${_QEMU_HANDLE}.pid";
> +fi; VALGRIND_QEMU="${VALGRIND_QEMU_VM}" _qemu_proc_exec
> "${VALGRIND_LOGFILE}" "$QEMU_PROG" $QEMU_OPTIONS "$@" )
> 
> 
>  === Simple -blockdev ===
> @@ -97,7 +103,9 @@
>  ID        TAG               VM SIZE                DATE     VM CLOCK     ICOUNT
>  --        snap0                SIZE yyyy-mm-dd hh:mm:ss 00:00:00.000
>  (qemu) loadvm snap0
> -(qemu) quit
> +./common.rc: line 163: 24866 Segmentation fault      ( if [ -n
> "${QEMU_NEED_PID}" ]; then
> +    echo $BASHPID > "${QEMU_TEST_DIR}/qemu-${_QEMU_HANDLE}.pid";
> +fi; VALGRIND_QEMU="${VALGRIND_QEMU_VM}" _qemu_proc_exec
> "${VALGRIND_LOGFILE}" "$QEMU_PROG" $QEMU_OPTIONS "$@" )
> 
>  Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134217728
>  Testing: -blockdev
> driver=file,filename=TEST_DIR/t.IMGFMT,node-name=file -blockdev
> driver=raw,file=file,node-name=raw -blockdev
> driver=IMGFMT,file=raw,node-name=fmt
> @@ -108,7 +116,9 @@
>  ID        TAG               VM SIZE                DATE     VM CLOCK     ICOUNT
>  --        snap0                SIZE yyyy-mm-dd hh:mm:ss 00:00:00.000
>  (qemu) loadvm snap0
> -(qemu) quit
> +./common.rc: line 163: 24919 Segmentation fault      ( if [ -n
> "${QEMU_NEED_PID}" ]; then
> +    echo $BASHPID > "${QEMU_TEST_DIR}/qemu-${_QEMU_HANDLE}.pid";
> +fi; VALGRIND_QEMU="${VALGRIND_QEMU_VM}" _qemu_proc_exec
> "${VALGRIND_LOGFILE}" "$QEMU_PROG" $QEMU_OPTIONS "$@" )
> 
> 
>  === -blockdev with a filter on top ===
> @@ -122,7 +132,9 @@
>  ID        TAG               VM SIZE                DATE     VM CLOCK     ICOUNT
>  --        snap0                SIZE yyyy-mm-dd hh:mm:ss 00:00:00.000
>  (qemu) loadvm snap0
> -(qemu) quit
> +./common.rc: line 163: 24972 Segmentation fault      ( if [ -n
> "${QEMU_NEED_PID}" ]; then
> +    echo $BASHPID > "${QEMU_TEST_DIR}/qemu-${_QEMU_HANDLE}.pid";
> +fi; VALGRIND_QEMU="${VALGRIND_QEMU_VM}" _qemu_proc_exec
> "${VALGRIND_LOGFILE}" "$QEMU_PROG" $QEMU_OPTIONS "$@" )
> 
> 
>  === -blockdev with a backing file ===
> @@ -137,7 +149,9 @@
>  ID        TAG               VM SIZE                DATE     VM CLOCK     ICOUNT
>  --        snap0                SIZE yyyy-mm-dd hh:mm:ss 00:00:00.000
>  (qemu) loadvm snap0
> -(qemu) quit
> +./common.rc: line 163: 25056 Segmentation fault      ( if [ -n
> "${QEMU_NEED_PID}" ]; then
> +    echo $BASHPID > "${QEMU_TEST_DIR}/qemu-${_QEMU_HANDLE}.pid";
> +fi; VALGRIND_QEMU="${VALGRIND_QEMU_VM}" _qemu_proc_exec
> "${VALGRIND_LOGFILE}" "$QEMU_PROG" $QEMU_OPTIONS "$@" )
> 
>  Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134217728
> backing_file=TEST_DIR/t.IMGFMT.base backing_fmt=IMGFMT
>  Testing: -blockdev
> driver=file,filename=TEST_DIR/t.IMGFMT.base,node-name=backing-file
> -blockdev driver=IMGFMT,file=backing-file,node-name=backing-fmt
> -blockdev driver=file,filename=TEST_DIR/t.IMGFMT,node-name=file
> -blockdev driver=IMGFMT,file=file,backing=backing-fmt,node-name=fmt
> @@ -148,7 +162,9 @@
>  ID        TAG               VM SIZE                DATE     VM CLOCK     ICOUNT
>  --        snap0                SIZE yyyy-mm-dd hh:mm:ss 00:00:00.000
>  (qemu) loadvm snap0
> -(qemu) quit
> +./common.rc: line 163: 25109 Segmentation fault      ( if [ -n
> "${QEMU_NEED_PID}" ]; then
> +    echo $BASHPID > "${QEMU_TEST_DIR}/qemu-${_QEMU_HANDLE}.pid";
> +fi; VALGRIND_QEMU="${VALGRIND_QEMU_VM}" _qemu_proc_exec
> "${VALGRIND_LOGFILE}" "$QEMU_PROG" $QEMU_OPTIONS "$@" )
> 
>  Internal snapshots on overlay:
>  Snapshot list:
> @@ -169,7 +185,9 @@
>  ID        TAG               VM SIZE                DATE     VM CLOCK     ICOUNT
>  --        snap0                SIZE yyyy-mm-dd hh:mm:ss 00:00:00.000
>  (qemu) loadvm snap0
> -(qemu) quit
> +./common.rc: line 163: 25179 Segmentation fault      ( if [ -n
> "${QEMU_NEED_PID}" ]; then
> +    echo $BASHPID > "${QEMU_TEST_DIR}/qemu-${_QEMU_HANDLE}.pid";
> +fi; VALGRIND_QEMU="${VALGRIND_QEMU_VM}" _qemu_proc_exec
> "${VALGRIND_LOGFILE}" "$QEMU_PROG" $QEMU_OPTIONS "$@" )
> 
>  Internal snapshots on overlay:
>  Snapshot list:
>   TEST   iotest-qcow2: 268
> 
> 
> thanks
> -- PMM
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


