Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9AE5FC695
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 15:36:41 +0200 (CEST)
Received: from localhost ([::1]:33864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oibua-0004H4-47
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 09:36:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oibom-0000l4-Pb
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 09:30:50 -0400
Received: from forwardcorp1a.mail.yandex.net ([178.154.239.72]:42186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oiboi-0003U5-13
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 09:30:38 -0400
Received: from vla5-b2806cb321eb.qloud-c.yandex.net
 (vla5-b2806cb321eb.qloud-c.yandex.net
 [IPv6:2a02:6b8:c18:3e0d:0:640:b280:6cb3])
 by forwardcorp1a.mail.yandex.net (Yandex) with ESMTP id 0736C5FF71;
 Wed, 12 Oct 2022 16:25:40 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b656::1:1e] (unknown
 [2a02:6b8:b081:b656::1:1e])
 by vla5-b2806cb321eb.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 vm5TXsOHi9-PdO8QF1O; Wed, 12 Oct 2022 16:25:39 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1665581139; bh=bV2N9De+GMarubX2WAXZznM7J2xUFtlnsxSw0TWwyTE=;
 h=In-Reply-To:Cc:Date:References:To:From:Subject:Message-ID;
 b=Nj7VdZN/eXHWgk6rPMDa/OKsSu64pIIgJlylfWBK0xXxmlcSnbHUHPg0O1C+IVLjt
 LEnwgIuBou2D4uBehSJ0Tb5fQu1ayUUzqQof4xrrR2GAaOlP+mvU3c8PxpM7fidszW
 xXc7hIUCjaS3ZTlcDVpP6EkPhMBtbRDJGRPPnkAM=
Authentication-Results: vla5-b2806cb321eb.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <0523918c-1c38-88de-edcb-d04399d634be@yandex-team.ru>
Date: Wed, 12 Oct 2022 16:25:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 00/11] iotests: use vm.cmd()
Content-Language: en-US
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, jsnow@redhat.com
References: <20220606072731.878226-1-vsementsov@yandex-team.ru>
 <7f72fd37-41d7-3b43-70cf-e643dbdb2b7f@yandex-team.ru>
In-Reply-To: <7f72fd37-41d7-3b43-70cf-e643dbdb2b7f@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.72;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1a.mail.yandex.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.528,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

ping

On 9/19/22 20:16, Vladimir Sementsov-Ogievskiy wrote:
> ping
> 
> On 6/6/22 10:27, Vladimir Sementsov-Ogievskiy wrote:
>> Hi all!
>>
>> Let's get rid of pattern
>>
>>      result = self.vm.qmp(...)
>>      self.assert_qmp(result, 'return', {})
>>
>> And switch to just
>>
>>      self.vm.cmd(...)
>>
>> Supersedes: <20220408170214.45585-1-vsementsov@openvz.org>
>>     ([RFC 0/2] introduce QEMUMachind.cmd())
>>
>> Vladimir Sementsov-Ogievskiy (11):
>>    python: rename QEMUMonitorProtocol.cmd() to cmd_raw()
>>    python/qemu: rename command() to cmd()
>>    python/machine.py: upgrade vm.cmd() method
>>    iotests: QemuStorageDaemon: add cmd() method like in QEMUMachine.
>>    iotests: add some missed checks of qmp result
>>    iotests: refactor some common qmp result checks into generic pattern
>>    iotests: drop some occasional semicolons
>>    iotests: drop some extra ** in qmp() call
>>    iotests.py: pause_job(): drop return value
>>    tests/vm/basevm.py: use cmd() instead of qmp()
>>    python: use vm.cmd() instead of vm.qmp() where appropriate
>>
>>   docs/devel/testing.rst                        |  10 +-
>>   python/qemu/machine/machine.py                |  20 +-
>>   python/qemu/qmp/legacy.py                     |  10 +-
>>   python/qemu/qmp/qmp_shell.py                  |  13 +-
>>   python/qemu/utils/qemu_ga_client.py           |   2 +-
>>   python/qemu/utils/qom.py                      |   8 +-
>>   python/qemu/utils/qom_common.py               |   2 +-
>>   python/qemu/utils/qom_fuse.py                 |   6 +-
>>   scripts/cpu-x86-uarch-abi.py                  |   8 +-
>>   scripts/device-crash-test                     |   8 +-
>>   scripts/render_block_graph.py                 |   8 +-
>>   tests/avocado/avocado_qemu/__init__.py        |   4 +-
>>   tests/avocado/cpu_queries.py                  |   4 +-
>>   tests/avocado/hotplug_cpu.py                  |  10 +-
>>   tests/avocado/info_usernet.py                 |   4 +-
>>   tests/avocado/machine_arm_integratorcp.py     |   6 +-
>>   tests/avocado/machine_m68k_nextcube.py        |   4 +-
>>   tests/avocado/machine_mips_malta.py           |   6 +-
>>   tests/avocado/machine_s390_ccw_virtio.py      |  28 +-
>>   tests/avocado/migration.py                    |  10 +-
>>   tests/avocado/pc_cpu_hotplug_props.py         |   2 +-
>>   tests/avocado/version.py                      |   4 +-
>>   tests/avocado/virtio_check_params.py          |   6 +-
>>   tests/avocado/virtio_version.py               |   4 +-
>>   tests/avocado/vnc.py                          |  16 +-
>>   tests/avocado/x86_cpu_model_versions.py       |  10 +-
>>   tests/migration/guestperf/engine.py           | 150 +++---
>>   tests/qemu-iotests/030                        | 168 +++---
>>   tests/qemu-iotests/040                        | 171 +++----
>>   tests/qemu-iotests/041                        | 482 ++++++++----------
>>   tests/qemu-iotests/045                        |  15 +-
>>   tests/qemu-iotests/055                        |  62 +--
>>   tests/qemu-iotests/056                        |  77 ++-
>>   tests/qemu-iotests/093                        |  42 +-
>>   tests/qemu-iotests/118                        | 225 ++++----
>>   tests/qemu-iotests/124                        | 102 ++--
>>   tests/qemu-iotests/129                        |  14 +-
>>   tests/qemu-iotests/132                        |   5 +-
>>   tests/qemu-iotests/139                        |  45 +-
>>   tests/qemu-iotests/147                        |  30 +-
>>   tests/qemu-iotests/151                        |  56 +-
>>   tests/qemu-iotests/152                        |   8 +-
>>   tests/qemu-iotests/155                        |  55 +-
>>   tests/qemu-iotests/165                        |   8 +-
>>   tests/qemu-iotests/196                        |   3 +-
>>   tests/qemu-iotests/205                        |   6 +-
>>   tests/qemu-iotests/218                        | 105 ++--
>>   tests/qemu-iotests/245                        | 245 ++++-----
>>   tests/qemu-iotests/256                        |  34 +-
>>   tests/qemu-iotests/257                        |  36 +-
>>   tests/qemu-iotests/264                        |  31 +-
>>   tests/qemu-iotests/281                        |  21 +-
>>   tests/qemu-iotests/295                        |  16 +-
>>   tests/qemu-iotests/296                        |  21 +-
>>   tests/qemu-iotests/298                        |  13 +-
>>   tests/qemu-iotests/300                        |  54 +-
>>   tests/qemu-iotests/iotests.py                 |  18 +-
>>   .../tests/export-incoming-iothread            |   6 +-
>>   .../qemu-iotests/tests/graph-changes-while-io |   6 +-
>>   tests/qemu-iotests/tests/image-fleecing       |   3 +-
>>   .../tests/migrate-bitmaps-postcopy-test       |  31 +-
>>   tests/qemu-iotests/tests/migrate-bitmaps-test |  45 +-
>>   .../qemu-iotests/tests/migrate-during-backup  |  41 +-
>>   .../qemu-iotests/tests/migration-permissions  |   9 +-
>>   .../tests/mirror-ready-cancel-error           |  74 ++-
>>   tests/qemu-iotests/tests/mirror-top-perms     |  16 +-
>>   tests/qemu-iotests/tests/nbd-multiconn        |  12 +-
>>   tests/qemu-iotests/tests/reopen-file          |   3 +-
>>   .../qemu-iotests/tests/stream-error-on-reset  |   6 +-
>>   tests/vm/basevm.py                            |   4 +-
>>   70 files changed, 1174 insertions(+), 1613 deletions(-)
>>
> 
> 

-- 
Best regards,
Vladimir


