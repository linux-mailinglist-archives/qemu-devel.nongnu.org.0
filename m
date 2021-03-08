Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A02330BF7
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 12:09:29 +0100 (CET)
Received: from localhost ([::1]:34042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJDlQ-0003PT-Ok
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 06:09:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lJDkd-0002vj-Ju
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 06:08:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lJDka-0006i1-Eq
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 06:08:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615201715;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VqwZflqFUOlkwipyVSKl8WLssk5OmxlGvZCc1vsmHxU=;
 b=al5IwY8b5shdAI9BZ1UlrPalQtHMUgdv57gZUR8Nrm0szmSs6u9/xM4afXRVz434Fia+XY
 jgGKgCKUDE1ai7pVxo25dJP7sk768ZQQVquWacXRNGGJyKsB7aII+xZ4N/HFwVvLVGbG+W
 fmKcA2JZT4quwRmHrsKvEyJF/zeFQXM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-489-n8ZAm_7RP_iKC3_4-lCDEQ-1; Mon, 08 Mar 2021 06:08:32 -0500
X-MC-Unique: n8ZAm_7RP_iKC3_4-lCDEQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B7134EC1BA;
 Mon,  8 Mar 2021 11:08:31 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-112-100.ams2.redhat.com [10.36.112.100])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A0DC55C72F;
 Mon,  8 Mar 2021 11:08:30 +0000 (UTC)
Date: Mon, 8 Mar 2021 12:08:29 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 00/31] Block layer patches
Message-ID: <20210308110829.GB7021@merkur.fritz.box>
References: <20210305165454.356840-1-kwolf@redhat.com>
 <CAFEAcA8=jkCWw=NAJy5Zd5Rx4=QJPHX_cppHwz3b2TLgPUgWqw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8=jkCWw=NAJy5Zd5Rx4=QJPHX_cppHwz3b2TLgPUgWqw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: stefanha@redhat.com, QEMU Developers <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 06.03.2021 um 12:22 hat Peter Maydell geschrieben:
> On Fri, 5 Mar 2021 at 16:55, Kevin Wolf <kwolf@redhat.com> wrote:
> >
> > The following changes since commit 9a7beaad3dbba982f7a461d676b55a5c3851d312:
> >
> >   Merge remote-tracking branch 'remotes/alistair/tags/pull-riscv-to-apply-20210304' into staging (2021-03-05 10:47:46 +0000)
> >
> > are available in the Git repository at:
> >
> >   git://repo.or.cz/qemu/kevin.git tags/for-upstream
> >
> > for you to fetch changes up to 67bedc3aed5c455b629c2cb5f523b536c46adff9:
> >
> >   docs: qsd: Explain --export nbd,name=... default (2021-03-05 17:09:46 +0100)
> >
> > ----------------------------------------------------------------
> > Block layer patches:
> >
> > - qemu-storage-daemon: add --pidfile option
> > - qemu-storage-daemon: CLI error messages include the option name now
> > - vhost-user-blk export: Misc fixes, added test cases
> > - docs: Improvements for qemu-storage-daemon documentation
> > - parallels: load bitmap extension
> > - backup-top: Don't crash on post-finalize accesses
> > - iotests improvements
> 
> This failed some of the gitlab CI jobs, like this:
> 
> https://gitlab.com/qemu-project/qemu/-/jobs/1077335781
> 
> Running test qtest-x86_64/test-hmp
> Running test qtest-x86_64/qos-test
> qemu-storage-daemon: vu_panic: Not implemented: memfd support is missing
> qemu-storage-daemon: vu_panic: Failed to alloc vhost inflight area
> qemu-system-x86_64: Failed to write msg. Wrote -1 instead of 20.
> qemu-system-x86_64: vhost_set_features failed: Invalid argument (22)
> qemu-system-x86_64: Error starting vhost: 22
> qemu-system-x86_64: vhost-user-blk: vhost start failed: Invalid argument
> **
> ERROR:../tests/qtest/libqos/virtio.c:228:qvirtio_wait_used_elem:
> assertion failed: (g_get_monotonic_time() - start_time <= timeout_us)
> ERROR qtest-x86_64/qos-test - Bail out!
> ERROR:../tests/qtest/libqos/virtio.c:228:qvirtio_wait_used_elem:
> assertion failed: (g_get_monotonic_time() - start_time <= timeout_us)
> make: *** [run-test-159] Error 1
> 
> I guess some test or other is assuming the presence of
> a host feature that isn't guaranteed to be there ?

Stefan, can you have a look? This is from the new vhost-user-blk test
cases from your series.

If the fix isn't trivial, I'll resubmit v2 today with just the test case
dropped and then we can add it later.

Kevin


