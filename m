Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F11D437D291
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 20:13:11 +0200 (CEST)
Received: from localhost ([::1]:46014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgtM7-0004oP-0v
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 14:13:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgtK4-0002VF-Ef
 for qemu-devel@nongnu.org; Wed, 12 May 2021 14:11:04 -0400
Received: from indium.canonical.com ([91.189.90.7]:33918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgtK1-0006xA-1L
 for qemu-devel@nongnu.org; Wed, 12 May 2021 14:11:04 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lgtJy-0000wf-EN
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 18:10:58 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 4144E2E8187
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 18:10:58 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 May 2021 17:59:48 -0000
From: Thomas Huth <1914282@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: kashyapc melwitt th-huth
X-Launchpad-Bug-Reporter: melanie witt (melwitt)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <161229019609.3949.15746215383583949568.malonedeb@chaenomeles.canonical.com>
Message-Id: <162084238851.7179.16180190649168167266.malone@gac.canonical.com>
Subject: [Bug 1914282] Re: block copy job sometimes hangs on the last block
 for minutes
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="6b3403d85f09252210977b936e821c0b00dbe016"; Instance="production"
X-Launchpad-Hash: 0abf384b65682f16bc3937af26e896bbdaab7d04
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, WEIRD_PORT=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 1914282 <1914282@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently moving its bug tracking to another system.
For this we need to know which bugs are still valid and which could be
closed already. Thus we are setting the bug state to "Incomplete" now.

If the bug has already been fixed in the latest upstream version of QEMU,
then please close this ticket as "Fix released".

If it is not fixed yet and you think that this bug report here is still
valid, then you have two options:

1) If you already have an account on gitlab.com, please open a new ticket
for this problem in our new tracker here:

    https://gitlab.com/qemu-project/qemu/-/issues

and then close this ticket here on Launchpad (or let it expire auto-
matically after 60 days). Please mention the URL of this bug ticket on
Launchpad in the new ticket on GitLab.

2) If you don't have an account on gitlab.com and don't intend to get
one, but still would like to keep this ticket opened, then please switch
the state back to "New" or "Confirmed" within the next 60 days (other-
wise it will get closed as "Expired"). We will then eventually migrate
the ticket automatically to the new system (but you won't be the reporter
of the bug in the new system and thus you won't get notified on changes
anymore).

Thank you and sorry for the inconvenience.


** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1914282

Title:
  block copy job sometimes hangs on the last block for minutes

Status in QEMU:
  Incomplete

Bug description:
  In openstack nova we use the block copy API to copy disks for volume
  swap requests. In our CI gate we observed that sometimes the block
  copy job progress will reach the last or next to last block and hang
  there for  minutes at a time, causing CI jobs to fail as jobs timeout.

  On the client (nova-compute) side, using the python bindings we see
  the following in the openstack nova logs:

  ---------------

  Jan 21 05:31:02.207785 ubuntu-focal-vexxhost-ca-ymq-1-0022641000 nova-
  compute[93823]: DEBUG nova.virt.libvirt.guest [None req-d6170fbb-e023
  -4cdb-93dc-a2e9ae9b0a56 tempest-TestVolumeSwap-1117975117 tempest-
  TestVolumeSwap-1117975117] COPY block job progress, current cursor: 0
  final cursor: 1073741824 {{(pid=3D93823) is_job_complete
  /opt/stack/nova/nova/virt/libvirt/guest.py:873}}

  Jan 21 05:31:55.688227 ubuntu-focal-vexxhost-ca-ymq-1-0022641000 nova-
  compute[93823]: DEBUG nova.virt.libvirt.guest [None req-d6170fbb-e023
  -4cdb-93dc-a2e9ae9b0a56 tempest-TestVolumeSwap-1117975117 tempest-
  TestVolumeSwap-1117975117] COPY block job progress, current cursor:
  1049624576 final cursor: 1073741824 {{(pid=3D93823) is_job_complete
  /opt/stack/nova/nova/virt/libvirt/guest.py:873}}

  [...]

  Jan 21 05:31:55.706698 ubuntu-focal-vexxhost-ca-ymq-1-0022641000 nova-
  compute[93823]: DEBUG nova.virt.libvirt.guest [None req-d6170fbb-e023
  -4cdb-93dc-a2e9ae9b0a56 tempest-TestVolumeSwap-1117975117 tempest-
  TestVolumeSwap-1117975117] COPY block job progress, current cursor:
  1049624576 final cursor: 1073741824 {{(pid=3D93823) is_job_complete
  /opt/stack/nova/nova/virt/libvirt/guest.py:873}}

  Jan 21 05:31:56.175248 ubuntu-focal-vexxhost-ca-ymq-1-0022641000 nova-
  compute[93823]: DEBUG nova.virt.libvirt.guest [None req-d6170fbb-e023
  -4cdb-93dc-a2e9ae9b0a56 tempest-TestVolumeSwap-1117975117 tempest-
  TestVolumeSwap-1117975117] COPY block job progress, current cursor:
  1073741823 final cursor: 1073741824 {{(pid=3D93823) is_job_complete
  /opt/stack/nova/nova/virt/libvirt/guest.py:873}}

  [...]

  ~2.5 minutes later, it's still going at current cursor: 1073741823
  final cursor: 1073741824

  Jan 21 05:34:30.952371 ubuntu-focal-vexxhost-ca-ymq-1-0022641000 nova-
  compute[93823]: DEBUG nova.virt.libvirt.guest [None req-d6170fbb-e023
  -4cdb-93dc-a2e9ae9b0a56 tempest-TestVolumeSwap-1117975117 tempest-
  TestVolumeSwap-1117975117] COPY block job progress, current cursor:
  1073741823 final cursor: 1073741824 {{(pid=3D93823) is_job_complete
  /opt/stack/nova/nova/virt/libvirt/guest.py:873}}

  then current cursor =3D=3D final cursor at 05:34:31.460595

  Jan 21 05:34:31.460595 ubuntu-focal-vexxhost-ca-ymq-1-0022641000 nova-
  compute[93823]: DEBUG nova.virt.libvirt.guest [None req-d6170fbb-e023
  -4cdb-93dc-a2e9ae9b0a56 tempest-TestVolumeSwap-1117975117 tempest-
  TestVolumeSwap-1117975117] COPY block job progress, current cursor:
  1073741824 final cursor: 1073741824 {{(pid=3D93823) is_job_complete
  /opt/stack/nova/nova/virt/libvirt/guest.py:873}}

  ---------------

  In this excerpt the cursor reaches the next to last block at Jan 21
  05:31:56.175248 and hangs there repeating status at the next to last
  block until Jan 21 05:34:30.952371 (~2.5 minutes) and then the job
  shows current cursor =3D=3D final cursor at Jan 21 05:34:31.460595.

  In the corresponding qemu log, we see the block copy job report being
  on the last block for minutes:

  ---------------

  021-01-21 05:31:02.206+0000: 60630: debug : qemuMonitorJSONIOProcessLine:=
220 : Line [{"return": [{"auto-finalize": true, "io-status": "ok", "device"=
: "copy-vdb-libvirt-5-format", "auto-dismiss": false, "busy": true, "len": =
1073741824, "offset": 0, "status": "running", "paused": false, "speed": 0, =
"ready": false, "type": "mirror"}], "id": "libvirt-501"}]
  2021-01-21 05:31:02.206+0000: 60630: info : qemuMonitorJSONIOProcessLine:=
239 : QEMU_MONITOR_RECV_REPLY: mon=3D0x7fd07813ec80 reply=3D{"return": [{"a=
uto-finalize": true, "io-status": "ok", "device": "copy-vdb-libvirt-5-forma=
t", "auto-dismiss": false, "busy": true, "len": 1073741824, "offset": 0, "s=
tatus": "running", "paused": false, "speed": 0, "ready": false, "type": "mi=
rror"}], "id": "libvirt-501"}

  [...]

  len =3D=3D offset at 05:31:56.174

  2021-01-21 05:31:56.174+0000: 60630: debug : qemuMonitorJSONIOProcessLine=
:220 : Line [{"return": [{"auto-finalize": true, "io-status": "ok", "device=
": "copy-vdb-libvirt-5-format", "auto-dismiss": false, "busy": true, "len":=
 1073741824, "offset": 1073741824, "status": "running", "paused": false, "s=
peed": 0, "ready": false, "type": "mirror"}], "id": "libvirt-581"}]
  2021-01-21 05:31:56.174+0000: 60630: info : qemuMonitorJSONIOProcessLine:=
239 : QEMU_MONITOR_RECV_REPLY: mon=3D0x7fd07813ec80 reply=3D{"return": [{"a=
uto-finalize": true, "io-status": "ok", "device": "copy-vdb-libvirt-5-forma=
t", "auto-dismiss": false, "busy": true, "len": 1073741824, "offset": 10737=
41824, "status": "running", "paused": false, "speed": 0, "ready": false, "t=
ype": "mirror"}], "id": "libvirt-581"}

  [...]

  ~2.5 minutes later, still len =3D=3D offset but it's still going

  2021-01-21 05:34:31.459+0000: 60630: debug : qemuMonitorJSONIOProcessLine=
:220 : Line [{"return": [{"auto-finalize": true, "io-status": "ok", "device=
": "copy-vdb-libvirt-5-format", "auto-dismiss": false, "busy": false, "len"=
: 1073741824, "offset": 1073741824, "status": "ready", "paused": false, "sp=
eed": 0, "ready": true, "type": "mirror"}], "id": "libvirt-855"}]
  2021-01-21 05:34:31.459+0000: 60630: info : qemuMonitorJSONIOProcessLine:=
239 : QEMU_MONITOR_RECV_REPLY: mon=3D0x7fd07813ec80 reply=3D{"return": [{"a=
uto-finalize": true, "io-status": "ok", "device": "copy-vdb-libvirt-5-forma=
t", "auto-dismiss": false, "busy": false, "len": 1073741824, "offset": 1073=
741824, "status": "ready", "paused": false, "speed": 0, "ready": true, "typ=
e": "mirror"}], "id": "libvirt-855"}

  and then the job finishes soon after

  2021-01-21 05:34:31.467+0000: 60630: debug :
  qemuProcessHandleJobStatusChange:1002 : job 'copy-vdb-
  libvirt-5-format'(domain: 0x7fd070075720,instance-00000013) state
  changed to 'waiting'(6)

  2021-01-21 05:34:31.467+0000: 60630: debug :
  qemuProcessHandleJobStatusChange:1002 : job 'copy-vdb-
  libvirt-5-format'(domain: 0x7fd070075720,instance-00000013) state
  changed to 'pending'(7)

  2021-01-21 05:34:31.467+0000: 60630: debug :
  qemuProcessHandleJobStatusChange:1002 : job 'copy-vdb-
  libvirt-5-format'(domain: 0x7fd070075720,instance-00000013) state
  changed to 'concluded'(9)

  2021-01-21 05:34:31.468+0000: 60630: debug :
  qemuProcessHandleJobStatusChange:1002 : job 'copy-vdb-
  libvirt-5-format'(domain: 0x7fd070075720,instance-00000013) state
  changed to 'null'(11)

  2021-01-21 05:34:31.468+0000: 60634: debug :
  qemuBlockJobProcessEventConcludedCopyPivot:1221 : copy job 'copy-vdb-
  libvirt-5-format' on VM 'instance-00000013' pivoted

  2021-01-21 05:34:32.292+0000: 60634: debug : qemuDomainObjEndJob:9746
  : Stopping job: modify (async=3Dnone vm=3D0x7fd070075720
  name=3Dinstance-00000013)

  ---------------

  Is this normal for a block copy job to hang on the last block like
  this for minutes at a time? Why doesn't the job close out once offset
  =3D=3D len?

  Thanks for any help you can offer.

  Additional log messages have been pasted here:

  https://pastebin.com/FQRu76Sn

  and for completeness, these logs were taken from the following
  openstack nova gate job:

  https://zuul.opendev.org/t/openstack/build/a078a17aa9924517b329cafc3f54fe=
d4

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1914282/+subscriptions

