Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E94F33A2DD1
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 16:14:08 +0200 (CEST)
Received: from localhost ([::1]:40300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrLRf-0006aG-Uh
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 10:14:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lrLPL-0004hZ-EN
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 10:11:43 -0400
Received: from indium.canonical.com ([91.189.90.7]:59214)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lrLPE-0003MC-PM
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 10:11:43 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lrLP9-0003XS-A8
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 14:11:31 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id EEAD52E825A
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 14:11:25 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Jun 2021 13:59:44 -0000
From: Lee Yarwood <1929710@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=nova; status=New; importance=Medium; assignee=None;
X-Launchpad-Bug-Tags: gate-failure
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: hudson-openstack lyarwood melwitt
X-Launchpad-Bug-Reporter: Lee Yarwood (lyarwood)
X-Launchpad-Bug-Modifier: Lee Yarwood (lyarwood)
References: <162203621182.4387.4299404156046469363.malonedeb@gac.canonical.com>
Message-Id: <162333358438.28173.7908886005390234544.launchpad@wampee.canonical.com>
Subject: [Bug 1929710] Re: virDomainGetBlockJobInfo fails during swap_volume
 as disk '$disk' not found in domain
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="b45bdbe3a00b6b668fa7f2069bd545c35c41f7f4"; Instance="production"
X-Launchpad-Hash: c3834900433f88be2b2957591f5b0da12bd5e180
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -64
X-Spam_score: -6.5
X-Spam_bar: ------
X-Spam_report: (-6.5 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, URI_HEX=0.1 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1929710 <1929710@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** No longer affects: qemu

** Changed in: nova
   Importance: Undecided =3D> Medium

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1929710

Title:
  virDomainGetBlockJobInfo fails during swap_volume as disk '$disk' not
  found in domain

Status in OpenStack Compute (nova):
  New

Bug description:
  Description
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

  The error handling around swap_volume is missing the following failure
  when calling virDomainGetBlockJobInfo() after the entire device is
  detached by QEMU (?) after it encounters a failure during the block
  copy job that at first pauses and then somehow resumes:

  https://8a5fc27780098c5ee1bc-
  3ac81d180a9c011938b2cbb0293272f3.ssl.cf5.rackcdn.com/790660/5/gate
  /nova-next/e915ed4/controller/logs/screen-n-cpu.txt

  May 26 09:49:47.314813 ubuntu-focal-vexxhost-ca-ymq-1-0024823853 nova-com=
pute[114649]: ERROR nova.virt.libvirt.driver [None req-7cfcd661-29d4-4cc3-b=
c54-db0e7fed1a6e tempest-TestVolumeSwap-1841575704 tempest-TestVolumeSwap-1=
841575704-project-admin] Failure rebasing volume /dev/sdb on vdb.: libvirt.=
libvirtError: invalid argument: disk 'vdb' not found in domain
  May 26 09:49:47.314813 ubuntu-focal-vexxhost-ca-ymq-1-0024823853 nova-com=
pute[114649]: ERROR nova.virt.libvirt.driver Traceback (most recent call la=
st):
  May 26 09:49:47.314813 ubuntu-focal-vexxhost-ca-ymq-1-0024823853 nova-com=
pute[114649]: ERROR nova.virt.libvirt.driver   File "/opt/stack/nova/nova/v=
irt/libvirt/driver.py", line 2107, in _swap_volume
  May 26 09:49:47.314813 ubuntu-focal-vexxhost-ca-ymq-1-0024823853 nova-com=
pute[114649]: ERROR nova.virt.libvirt.driver     while not dev.is_job_compl=
ete():
  May 26 09:49:47.314813 ubuntu-focal-vexxhost-ca-ymq-1-0024823853 nova-com=
pute[114649]: ERROR nova.virt.libvirt.driver   File "/opt/stack/nova/nova/v=
irt/libvirt/guest.py", line 800, in is_job_complete
  May 26 09:49:47.314813 ubuntu-focal-vexxhost-ca-ymq-1-0024823853 nova-com=
pute[114649]: ERROR nova.virt.libvirt.driver     status =3D self.get_job_in=
fo()
  May 26 09:49:47.314813 ubuntu-focal-vexxhost-ca-ymq-1-0024823853 nova-com=
pute[114649]: ERROR nova.virt.libvirt.driver   File "/opt/stack/nova/nova/v=
irt/libvirt/guest.py", line 707, in get_job_info
  May 26 09:49:47.314813 ubuntu-focal-vexxhost-ca-ymq-1-0024823853 nova-com=
pute[114649]: ERROR nova.virt.libvirt.driver     status =3D self._guest._do=
main.blockJobInfo(self._disk, flags=3D0)
  May 26 09:49:47.314813 ubuntu-focal-vexxhost-ca-ymq-1-0024823853 nova-com=
pute[114649]: ERROR nova.virt.libvirt.driver   File "/usr/local/lib/python3=
.8/dist-packages/eventlet/tpool.py", line 190, in doit
  May 26 09:49:47.314813 ubuntu-focal-vexxhost-ca-ymq-1-0024823853 nova-com=
pute[114649]: ERROR nova.virt.libvirt.driver     result =3D proxy_call(self=
._autowrap, f, *args, **kwargs)
  May 26 09:49:47.314813 ubuntu-focal-vexxhost-ca-ymq-1-0024823853 nova-com=
pute[114649]: ERROR nova.virt.libvirt.driver   File "/usr/local/lib/python3=
.8/dist-packages/eventlet/tpool.py", line 148, in proxy_call
  May 26 09:49:47.314813 ubuntu-focal-vexxhost-ca-ymq-1-0024823853 nova-com=
pute[114649]: ERROR nova.virt.libvirt.driver     rv =3D execute(f, *args, *=
*kwargs)
  May 26 09:49:47.314813 ubuntu-focal-vexxhost-ca-ymq-1-0024823853 nova-com=
pute[114649]: ERROR nova.virt.libvirt.driver   File "/usr/local/lib/python3=
.8/dist-packages/eventlet/tpool.py", line 129, in execute
  May 26 09:49:47.314813 ubuntu-focal-vexxhost-ca-ymq-1-0024823853 nova-com=
pute[114649]: ERROR nova.virt.libvirt.driver     six.reraise(c, e, tb)
  May 26 09:49:47.314813 ubuntu-focal-vexxhost-ca-ymq-1-0024823853 nova-com=
pute[114649]: ERROR nova.virt.libvirt.driver   File "/usr/local/lib/python3=
.8/dist-packages/six.py", line 719, in reraise
  May 26 09:49:47.314813 ubuntu-focal-vexxhost-ca-ymq-1-0024823853 nova-com=
pute[114649]: ERROR nova.virt.libvirt.driver     raise value
  May 26 09:49:47.314813 ubuntu-focal-vexxhost-ca-ymq-1-0024823853 nova-com=
pute[114649]: ERROR nova.virt.libvirt.driver   File "/usr/local/lib/python3=
.8/dist-packages/eventlet/tpool.py", line 83, in tworker
  May 26 09:49:47.314813 ubuntu-focal-vexxhost-ca-ymq-1-0024823853 nova-com=
pute[114649]: ERROR nova.virt.libvirt.driver     rv =3D meth(*args, **kwarg=
s)
  May 26 09:49:47.314813 ubuntu-focal-vexxhost-ca-ymq-1-0024823853 nova-com=
pute[114649]: ERROR nova.virt.libvirt.driver   File "/usr/local/lib/python3=
.8/dist-packages/libvirt.py", line 985, in blockJobInfo
  May 26 09:49:47.314813 ubuntu-focal-vexxhost-ca-ymq-1-0024823853 nova-com=
pute[114649]: ERROR nova.virt.libvirt.driver     raise libvirtError('virDom=
ainGetBlockJobInfo() failed')
  May 26 09:49:47.314813 ubuntu-focal-vexxhost-ca-ymq-1-0024823853 nova-com=
pute[114649]: ERROR nova.virt.libvirt.driver libvirt.libvirtError: invalid =
argument: disk 'vdb' not found in domain
  May 26 09:49:47.314813 ubuntu-focal-vexxhost-ca-ymq-1-0024823853 nova-com=
pute[114649]: ERROR nova.virt.libvirt.driver

  https://zuul.opendev.org/t/openstack/build/e915ed4aeb9346bba83910bd79e950=
2b/log/controller/logs/libvirt/libvirtd_log.txt

  2021-05-26 09:49:40.189+0000: 79419: info : qemuMonitorSend:993 :
  QEMU_MONITOR_SEND_MSG: mon=3D0x7fc4bc07e7d0 msg=3D{"execute":"blockdev-
  add","arguments":{"node-name":"libvirt-4-format","read-
  only":false,"cache":{"direct":true,"no-
  flush":false},"driver":"raw","file":"libvirt-4-storage"},"id":"libvirt-37=
5"}^M

  2021-05-26 09:49:46.154+0000: 79422: info : qemuMonitorSend:993 :
  QEMU_MONITOR_SEND_MSG: mon=3D0x7fc4bc07e7d0 msg=3D{"execute":"blockdev-
  add","arguments":{"node-name":"libvirt-5-format","read-
  only":false,"cache":{"direct":true,"no-
  flush":false},"driver":"raw","file":"libvirt-5-storage"},"id":"libvirt-37=
9"}^M

  2021-05-26 09:49:46.165+0000: 79422: debug :
  qemuMonitorBlockdevMirror:3112 : jobname=3Dcopy-vdb-libvirt-4-format,
  persistjob=3D1, device=3Dlibvirt-4-format, target=3Dlibvirt-5-format,
  bandwidth=3D0, granularity=3D0, buf_size=3D0, shallow=3D0

  2021-05-26 09:49:46.167+0000: 79417: debug :
  qemuProcessHandleJobStatusChange:1002 : job 'copy-vdb-
  libvirt-4-format'(domain: 0x7fc4b416b0e0,instance-0000000b) state
  changed to 'created'(1)

  2021-05-26 09:49:46.167+0000: 79417: debug :
  qemuProcessHandleJobStatusChange:1002 : job 'copy-vdb-
  libvirt-4-format'(domain: 0x7fc4b416b0e0,instance-0000000b) state
  changed to 'running'(2)

  2021-05-26 09:49:46.763+0000: 79417: debug :
  qemuProcessHandleJobStatusChange:1002 : job 'copy-vdb-
  libvirt-4-format'(domain: 0x7fc4b416b0e0,instance-0000000b) state
  changed to 'paused'(3)

  2021-05-26 09:49:46.763+0000: 79417: debug :
  qemuProcessHandleJobStatusChange:1002 : job 'copy-vdb-
  libvirt-4-format'(domain: 0x7fc4b416b0e0,instance-0000000b) state
  changed to 'running'(2)

  2021-05-26 09:49:46.841+0000: 79417: debug :
  qemuProcessHandleDeviceDeleted:1362 : Device virtio-disk1 removed from
  domain 0x7fc4b416b0e0 instance-0000000b

  2021-05-26 09:49:47.457+0000: 79417: debug :
  qemuProcessHandleJobStatusChange:1002 : job 'copy-vdb-
  libvirt-4-format'(domain: 0x7fc4b416b0e0,instance-0000000b) state
  changed to 'aborting'(8)

  2021-05-26 09:49:47.458+0000: 79417: debug :
  qemuProcessHandleJobStatusChange:1002 : job 'copy-vdb-
  libvirt-4-format'(domain: 0x7fc4b416b0e0,instance-0000000b) state
  changed to 'concluded'(9)

  2021-05-26 09:49:47.459+0000: 79417: debug :
  qemuProcessHandleJobStatusChange:1002 : job 'copy-vdb-
  libvirt-4-format'(domain: 0x7fc4b416b0e0,instance-0000000b) state
  changed to 'null'(11)

  Steps to reproduce
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

  $ cat queries/virDomainGetBlockJobInfo.yaml
  query: >
  =C2=A0message:"virDomainGetBlockJobInfo() failed" AND
  =C2=A0tags:"screen-n-cpu.txt"

  $ elastic-recheck-query queries/virDomainGetBlockJobInfo.yaml
  total hits: 6
  build_branch
  =C2=A0=C2=A0100% master
  build_change
  =C2=A0=C2=A050% 786588
  =C2=A0=C2=A050% 792322
  build_hostids
  =C2=A0=C2=A050% 1b47a855be51bba01ac6d5e6fdc4859bc17ebe2c8faaeb83392f8ff3 =
79fb0487675c0137b7ac30f24b5de71c70afb836e46746de770fa0c0
  =C2=A0=C2=A050% 33381c047c348ffefebf6b10cb7f0473c2359757d0bf11cc101eec54 =
33381c047c348ffefebf6b10cb7f0473c2359757d0bf11cc101eec54
  build_name
  =C2=A0=C2=A0100% nova-next
  build_node
  =C2=A0=C2=A0100% ubuntu-focal
  build_queue
  =C2=A0=C2=A0100% check
  build_status
  =C2=A0=C2=A0100% FAILURE
  build_zuul_url
  =C2=A0=C2=A0100% N/A
  filename
  =C2=A0=C2=A0100% controller/logs/screen-n-cpu.txt
  log_url
  =C2=A0=C2=A050% https://89bc735e8a094e3d60b7-4f6db7cd5400cfa66e1c80fde6bd=
4076.ssl.cf1.rackcdn.com/792322/1/check/nova-next/de697b4/controller/logs/s=
creen-n-cpu.txt
  =C2=A0=C2=A050% https://storage.gra.cloud.ovh.net/v1/AUTH_dcaab5e32b234d5=
6b626f72581e3644c/zuul_opendev_logs_035/786588/6/check/nova-next/0357703/co=
ntroller/logs/screen-n-cpu.txt
  loglevel
  =C2=A0=C2=A0100% ERROR
  module
  =C2=A0=C2=A033% nova.compute.manager
  =C2=A0=C2=A033% nova.virt.libvirt.driver
  =C2=A0=C2=A033% oslo_messaging.rpc.server
  node_provider
  =C2=A0=C2=A050% ovh-bhs1
  =C2=A0=C2=A050% rax-iad
  port
  =C2=A0=C2=A050% 48014
  =C2=A0=C2=A050% 58238
  project
  =C2=A0=C2=A0100% openstack/nova
  syslog_pid
  =C2=A0=C2=A050% 107528
  =C2=A0=C2=A050% 108261
  syslog_program
  =C2=A0=C2=A050% ubuntu-focal-ovh-bhs1-0024748800 nova-compute
  =C2=A0=C2=A050% ubuntu-focal-rax-iad-0024745546 nova-compute
  tags
  =C2=A0=C2=A0100% screen-n-cpu.txt screen oslofmt
  voting
  =C2=A0=C2=A0100% 1
  zuul_attempts
  =C2=A0=C2=A0100% 1
  zuul_executor
  =C2=A0=C2=A050% ze01.opendev.org
  =C2=A0=C2=A050% ze07.opendev.org

  Expected result
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  swap_volume at least fails correctly leaving the original device attached.

  Actual result
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  swap_volume fails and the original device appears detached from the devic=
e.

  Environment
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  1. Exact version of OpenStack you are running. See the following
  =C2=A0=C2=A0list for all releases: http://docs.openstack.org/releases/

  =C2=A0=C2=A0=C2=A0master

  2. Which hypervisor did you use?
  =C2=A0=C2=A0=C2=A0(For example: Libvirt + KVM, Libvirt + XEN, Hyper-V, Po=
werKVM, ...)
  =C2=A0=C2=A0=C2=A0What's the version of that?

  =C2=A0=C2=A0=C2=A0libvirt + QEMU (no KVM in the gate)

  2. Which storage type did you use?
  =C2=A0=C2=A0=C2=A0(For example: Ceph, LVM, GPFS, ...)
  =C2=A0=C2=A0=C2=A0What's the version of that?

  =C2=A0=C2=A0=C2=A0images_type=3Ddefault=3Dqcow2

  3. Which networking type did you use?
  =C2=A0=C2=A0=C2=A0(For example: nova-network, Neutron with OpenVSwitch, .=
..)

  =C2=A0=C2=A0=C2=A0N/A

  Logs & Configs
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

To manage notifications about this bug go to:
https://bugs.launchpad.net/nova/+bug/1929710/+subscriptions

