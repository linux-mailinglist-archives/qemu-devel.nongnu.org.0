Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B662F09CE
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 22:19:24 +0100 (CET)
Received: from localhost ([::1]:50626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyi7P-0001CN-Gw
	for lists+qemu-devel@lfdr.de; Sun, 10 Jan 2021 16:19:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kyi5u-0000OL-6U
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 16:17:50 -0500
Received: from mx2.suse.de ([195.135.220.15]:36008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kyi5r-0002fm-J7
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 16:17:49 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AF064AEFE;
 Sun, 10 Jan 2021 21:17:45 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
Subject: check-tcg HOWTO?
To: Alex Bennee <alex.bennee@linaro.org>
References: <f14c22bf-aecb-3e38-347b-1b9119ad8baa@suse.de>
Message-ID: <1301fc86-b356-b4a8-42c1-bf7705419a5e@suse.de>
Date: Sun, 10 Jan 2021 22:17:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <f14c22bf-aecb-3e38-347b-1b9119ad8baa@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alex,

happy new year,

I am trying to get check-tcg to run reliably,
as I am doing some substantial refactoring of tcg cpu operations, so I need to verify that TCG is fine.

This is an overall getting started question, is there a how-to on how to use check-tcg and how to fix things when things don't go smoothly?

I get different results on different machines for check-tcg, although the runs are containerized,
on one machine the tests for aarch64 tcg are SKIPPED completely (so no errors),

on the other machine I get:

qemu-system-aarch64: terminating on signal 15 from pid 18583 (timeout)
qemu-system-aarch64: terminating on signal 15 from pid 18584 (timeout)
qemu-system-aarch64: terminating on signal 15 from pid 18585 (timeout)
make[2]: *** [../Makefile.target:162: run-hello] Error 124
make[2]: *** Waiting for unfinished jobs....
make[2]: *** [../Makefile.target:162: run-pauth-3] Error 124
make[2]: *** [../Makefile.target:162: run-memory] Error 124

Both are configured with 

configure --enable-tcg

Anything more than V=1 to get more output?
How do I debug and get logs and cores out of containers?

in tests/tcg/ there is:

a README (with no hint unfortunately) ,
Makefile.qemu
Makefile.prereqs
Makefile.target

There are a bunch of variables in these files, which seem to be possible to configure, am I expected to set some of those?

I think that it would be beneficial to have either more documentation or more immediately actionable information out of make check failures;

Any help you could give me to make some progess?

Thanks,

Claudio

