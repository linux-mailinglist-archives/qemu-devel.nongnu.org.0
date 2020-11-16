Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 829502B4D35
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 18:37:43 +0100 (CET)
Received: from localhost ([::1]:59666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keiRi-0008VN-CW
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 12:37:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1keiOX-0007Bj-MJ; Mon, 16 Nov 2020 12:34:25 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:51168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1keiOU-0003cY-Fy; Mon, 16 Nov 2020 12:34:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:To:From;
 bh=VPMWOa4Czlj8P/8UvGWeNJW3gFfhVQSDtVKdIR3DFTk=; 
 b=Bdlzi6k9+bUbx6vFTdfVqLCkD1Oa/tVGdmFvnqJXOkSyOeJ4ChMnzTT+fOgPXFKF0+xaJaTEbmO8pPdxWYZT5twIPtIcu2QarFbaNE1Wpb57hz4r7TqliziLzZWNpwAum9xTF52NgPv3vCmQdCffpPUJvMs6UX5yEsAXwKW5gXKk3CM+FubrqnoODs8lK76shDFT/93DJGTqWOnlyCZtaFVLE5RHKRnC/roV7OYDlyIjCglQyPrCPtWiUBKKcpaLhcFu+UdQYSdkANDl/m6+1ukHVUMu4xpfQEPZoPB1+5rH51oYmcn+gi4k33YCC50P5SLW9IZrVMFvUbADgudFpw==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1keiOP-0004eq-2C; Mon, 16 Nov 2020 18:34:17 +0100
Received: from berto by mail.igalia.com with local (Exim)
 id 1keiOO-0000jw-PU; Mon, 16 Nov 2020 18:34:16 +0100
From: Alberto Garcia <berto@igalia.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Subject: Re: iotest 030 still occasionally intermittently failing
In-Reply-To: <CAFEAcA8OqZe9MYmp=B023bTqatP-KcoGsh_vQ4OZ=a=jh09wcQ@mail.gmail.com>
References: <CAFEAcA8OqZe9MYmp=B023bTqatP-KcoGsh_vQ4OZ=a=jh09wcQ@mail.gmail.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Mon, 16 Nov 2020 18:34:16 +0100
Message-ID: <w51tutpp5nr.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 12:34:18
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon 16 Nov 2020 05:16:35 PM CET, Peter Maydell wrote:
> Just saw this on a test run on the OpenBSD VM build-and-test,
> so this test is still intermittently failing...
>
>
>   TEST    iotest-qcow2: 030 [fail]
> QEMU          --
> "/home/qemu/qemu-test.h37iBt/build/tests/qemu-iotests/../../qemu-system-aarch64"
> -nodefaults -display none -accel qtest -machine virt
> QEMU_IMG      --
> "/home/qemu/qemu-test.h37iBt/build/tests/qemu-iotests/../../qemu-img"
> QEMU_IO       --
> "/home/qemu/qemu-test.h37iBt/build/tests/qemu-iotests/../../qemu-io"
> --cache writeback --aio threads -f qcow2
> QEMU_NBD      --
> "/home/qemu/qemu-test.h37iBt/build/tests/qemu-iotests/../../qemu-nbd"
> IMGFMT        -- qcow2 (compat=1.1)
> IMGPROTO      -- file
> PLATFORM      -- OpenBSD/amd64 openbsd 6.8
> TEST_DIR      -- /home/qemu/qemu-test.h37iBt/build/tests/qemu-iotests/scratch
> SOCK_DIR      -- /tmp/tmp.XpU6JjBMml
> SOCKET_SCM_HELPER --
>
> --- /home/qemu/qemu-test.h37iBt/src/tests/qemu-iotests/030.out  Mon
> Nov 16 15:33:05 2020
> +++ /home/qemu/qemu-test.h37iBt/build/tests/qemu-iotests/030.out.bad
>  Mon Nov 16 16:03:42 2020
> @@ -1,5 +1,47 @@
> -...........................
> +WARNING:qemu.machine:qemu received signal 6; command:

Do you know if there is a core dump or stack trace available ?

Berto

