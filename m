Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13EC14CFC37
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 12:05:32 +0100 (CET)
Received: from localhost ([::1]:43098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRBBD-0001Bc-5e
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 06:05:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nRAYG-0002P8-Rw
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:25:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nRAYD-0006Lz-AK
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:25:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646648711;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=I/kuhsJnyxLeuInGI+da93uygZWhfsYFvzlOApsO5nQ=;
 b=FWgECdl2cMr8m5QzVu2Ec9bdGPc+TJGW8gSCeAhZPBiZ9ka24phc4EptU6t0MhhynwGbEM
 8bJis38Ilgdzz8/+M3vBh7DPXpIFnrnj5ajXdhesUrlZgJ7xLTkBbHG6f4lpFHJ1DbGWP9
 9QpjUvUwJryUX9DZgVO8F57/9xPiHyw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-437-2N45WTNWPxqW5XHxYII5LQ-1; Mon, 07 Mar 2022 05:25:05 -0500
X-MC-Unique: 2N45WTNWPxqW5XHxYII5LQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3C9C21091DA0;
 Mon,  7 Mar 2022 10:25:04 +0000 (UTC)
Received: from localhost (unknown [10.39.193.253])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C789223084;
 Mon,  7 Mar 2022 10:25:03 +0000 (UTC)
Date: Thu, 3 Mar 2022 11:22:32 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: gdb@sourceware.org
Subject: How to backtrace an separate stack?
Message-ID: <YiCk+NNtAGQPhyK5@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="0fNpZF+k2+fElUIy"
Content-Disposition: inline
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: tom@tromey.com, qemu-devel@nongnu.org, pedro@palves.net,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--0fNpZF+k2+fElUIy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,
The QEMU emulator uses coroutines with separate stacks. It can be
challenging to debug coroutines that have yielded because GDB is not
aware of them (no thread is currently executing them).

QEMU has a GDB Python script that helps. It "creates" a stack frame for
a given coroutine by temporarily setting register values and then using
the "bt" command. This works on a live process under ptrace control but
not for coredumps where registers can't be set.

Here is the script (or see the bottom of this email for an inline copy
of the relevant code):
https://gitlab.com/qemu-project/qemu/-/blob/master/scripts/qemugdb/coroutine.py

I hoped that "select-frame address ADDRESS" could be used instead so
this would work on coredumps too. Unfortunately "select-frame" only
searches stack frames that GDB is already aware of, so it cannot be used
to backtrace coroutine stacks.

Is there a way to backtrace a stack at an arbitrary address in GDB?

Thanks,
Stefan
---
def get_jmpbuf_regs(jmpbuf):
    JB_RBX  = 0
    JB_RBP  = 1
    JB_R12  = 2
    JB_R13  = 3
    JB_R14  = 4
    JB_R15  = 5
    JB_RSP  = 6
    JB_PC   = 7

    pointer_guard = get_glibc_pointer_guard()
    return {'rbx': jmpbuf[JB_RBX],
        'rbp': glibc_ptr_demangle(jmpbuf[JB_RBP], pointer_guard),
        'rsp': glibc_ptr_demangle(jmpbuf[JB_RSP], pointer_guard),
        'r12': jmpbuf[JB_R12],
        'r13': jmpbuf[JB_R13],
        'r14': jmpbuf[JB_R14],
        'r15': jmpbuf[JB_R15],
        'rip': glibc_ptr_demangle(jmpbuf[JB_PC], pointer_guard) }

def bt_jmpbuf(jmpbuf):
    '''Backtrace a jmpbuf'''
    regs = get_jmpbuf_regs(jmpbuf)
    old = dict()

    # remember current stack frame and select the topmost
    # so that register modifications don't wreck it
    selected_frame = gdb.selected_frame()
    gdb.newest_frame().select()

    for i in regs:
        old[i] = gdb.parse_and_eval('(uint64_t)$%s' % i)

    for i in regs:
        gdb.execute('set $%s = %s' % (i, regs[i]))

    gdb.execute('bt')

    for i in regs:
        gdb.execute('set $%s = %s' % (i, old[i]))

    selected_frame.select()

--0fNpZF+k2+fElUIy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIgpPgACgkQnKSrs4Gr
c8h8tAf+LNiry146W1h/E7+CBkKhBnlSnQM3dcKLQo7h2Anmx27SQviuw1Hwsp5g
spjRrxm/+yYhMne5q1BIYJ9KwzWvNsiJqAxbuBImfIaiVdiCqmLFen3UGL1cQScI
u7yIpAtjhXbjoihK00J6FKZL05+pXxRNr9xiMULQMUusp1e7Wlj7Q5BL+PhNdArI
WiSsApoO7UgtqYVnL4WytCZgN+zjFZJxVv8cv3pnEIcTDvQ4ET10ptGXWt0Xh0xq
L2NsPtnU3RRo/8MfpuXd7NbaLTFupyCcJyLwVLmD5QlXjEvKiJ8GrFrbU2Etufw5
OhS6eyAySHjtviovarRM8oS+mrZIgA==
=HGXE
-----END PGP SIGNATURE-----

--0fNpZF+k2+fElUIy--


