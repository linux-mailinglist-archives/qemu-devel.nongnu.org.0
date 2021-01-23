Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D698301483
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 11:27:23 +0100 (CET)
Received: from localhost ([::1]:45370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3G8Y-0000Qf-5R
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 05:27:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1l3G7d-00089o-3r
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 05:26:25 -0500
Received: from mail.weilnetz.de ([37.120.169.71]:43618
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1l3G7a-0004bt-S0
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 05:26:24 -0500
Received: from edv-macbook-pro.fritz.box (p5b1511bf.dip0.t-ipconnect.de
 [91.21.17.191])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 3B404DA1468;
 Sat, 23 Jan 2021 11:26:19 +0100 (CET)
To: Wataru Ashihara <wataash@wataash.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210110162739.858087-1-f4bug@amsat.org>
 <20210110162739.858087-3-f4bug@amsat.org>
 <78a9718b-dec0-cc31-7ada-e815d9022e65@redhat.com>
 <20210121103250.GH3125227@redhat.com>
 <b1309c5e-69f2-0c4d-eefc-9023e906694d@amsat.org>
 <20210121112154.GJ3125227@redhat.com>
 <e46b9117-59ed-cfb8-303b-1a5a013c4cc8@amsat.org>
 <20210121120241.GK3125227@redhat.com>
 <97b12e1b-e570-bd4d-5484-376f3fe6f7dc@amsat.org>
 <ada021e4-b6e5-e720-bcfb-c078488c835c@wataash.com>
From: Stefan Weil <sw@weilnetz.de>
Subject: Re: [RFC PATCH 2/2] gitlab-ci: Add a job building TCI with Clang
Message-ID: <7e423408-b0e9-2c32-b88b-eb579dd273c5@weilnetz.de>
Date: Sat, 23 Jan 2021 11:26:22 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <ada021e4-b6e5-e720-bcfb-c078488c835c@wataash.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.221,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 23.01.21 um 09:59 schrieb Wataru Ashihara:

> Actually I use TCI also on macOS. Like the use case quoted by Philippe,=

> there're even other reasons to use TCI:
>
> 1. Learning TCG ops.
> 2. Debugging QEMU with gdb. e.g. diagnose codegen or stepping into
>     helper functions from tci.c:tcg_qemu_tb_exec().
> 3. Guest instruction tracing. TCI is faster than TCG or KVM when tracin=
g
>     the guest ops [1]. I guess qira is using TCI for this reason [2].
>
> [1]: https://twitter.com/wata_ash/status/1352899988032942080
> [2]: https://github.com/geohot/qira/blob/v1.3/tracers/qemu_build.sh#L55=



Yes, TCI can help a lot for debugging, especially also when porting TCG=20
to a new host architecture.

If we had binaries which can switch from native to interpreted TCG, it=20
could also be a reference implementation used for unit tests, comparing=20
the results for each TCG opcode.

Using TCI with profiling like gprof is useful to count the frequency of=20
the different TCG opcodes in practical scenarios and can be used to=20
detect bottlenecks (and less frequent or unused opcodes) for native TCG, =

too.

Stefan




