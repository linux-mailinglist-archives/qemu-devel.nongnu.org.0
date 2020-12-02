Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCE82CBAAA
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 11:41:30 +0100 (CET)
Received: from localhost ([::1]:35610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkPZh-0000D3-Av
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 05:41:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kkOV7-0005XK-4R
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 04:32:41 -0500
Received: from mx2.suse.de ([195.135.220.15]:46202)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kkOV5-0005Ri-D8
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 04:32:40 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2120BACC2;
 Wed,  2 Dec 2020 09:32:35 +0000 (UTC)
To: Alex Bennee <alex.bennee@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
Subject: check-tcg errors (build-user, build-user-plugins) again
Message-ID: <f14c22bf-aecb-3e38-347b-1b9119ad8baa@suse.de>
Date: Wed, 2 Dec 2020 10:32:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alex and all,

when trying to use check-tcg (master), I am getting often these errors:

$ ../configure --disable-system --disable-tools

$ make -j12 check-tcg

ERRO[0000] cannot find mappings for user claudio: No subgid ranges found for group "claudio" in /etc/subgid 
ERRO[0000] cannot find mappings for user claudio: No subgid ranges found for group "claudio" in /etc/subgid 
ERRO[0000] cannot find mappings for user claudio: No subgid ranges found for group "claudio" in /etc/subgid 
Trying to pull registry.gitlab.com/qemu-project/qemu/qemu/debian11...
Trying to pull registry.gitlab.com/qemu-project/qemu/qemu/fedora-cris-cross...
Trying to pull registry.gitlab.com/qemu-project/qemu/qemu/debian10...
ERRO[0000] cannot find mappings for user claudio: No subgid ranges found for group "claudio" in /etc/subgid 

[...]
  TEST    linux-test on x86_64
timeout: failed to run command ‘/home/claudio/git/qemu/build/qemu-x86_64’timeout: : No such file or directoryfailed to run command ‘/home/claudio/git/qemu/build/qemu-x86_64’

[...]


Is there some pre-configuration on the host necessary to be able to run check-tcg?

I see these errors in gitlab also for

build-user
build-user-plugin

Maybe this is what Philippe mentioned before though, that this is expected at the moment due to a temporary Meson shortcoming?

Ciao,

Claudio


-- 
Claudio Fontana
Engineering Manager Virtualization, SUSE Labs Core

SUSE Software Solutions Italy Srl

