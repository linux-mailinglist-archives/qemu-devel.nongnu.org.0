Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C521616EBE0
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Feb 2020 17:58:13 +0100 (CET)
Received: from localhost ([::1]:60374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6dXA-0004fI-SA
	for lists+qemu-devel@lfdr.de; Tue, 25 Feb 2020 11:58:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44527)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kchamart@redhat.com>) id 1j6dVf-0003e5-OE
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 11:56:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kchamart@redhat.com>) id 1j6dVe-0002m4-0l
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 11:56:39 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:35005
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kchamart@redhat.com>) id 1j6dVd-0002ls-T1
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 11:56:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582649797;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=noIQUvmu88Gj9chmSxQ6cb8p2IeY9lN+BsMm7RyT4EA=;
 b=h/a22QBtlOs+JfEC92C1SIb+8T8d/54u9hdul8xOrhLHjvvRZs8cgraoeRgQS15qEdjrPH
 m5BLhquJiVjpUgFmfXxDld5HOcowd/5TpZhq5Xd1Vt2RI1vJ2SMcoMsDChK9YtlLeMKNB9
 px5b4XZVPY+OxABStLqzDA8NUf2VtE4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-wdxD5feWMRquyUHk9bQNkA-1; Tue, 25 Feb 2020 11:56:29 -0500
X-MC-Unique: wdxD5feWMRquyUHk9bQNkA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D9BC1005512;
 Tue, 25 Feb 2020 16:56:28 +0000 (UTC)
Received: from paraplu.redhat.com (ovpn-117-203.ams2.redhat.com
 [10.36.117.203])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3525E90519;
 Tue, 25 Feb 2020 16:56:24 +0000 (UTC)
From: Kashyap Chamarthy <kchamart@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 2/2] qemu-cpu-models.rst: Document -noTSX, mds-no, taa-no,
 and tsx-ctrl
Date: Tue, 25 Feb 2020 17:56:18 +0100
Message-Id: <20200225165618.6571-3-kchamart@redhat.com>
In-Reply-To: <20200225165618.6571-1-kchamart@redhat.com>
References: <20200225165618.6571-1-kchamart@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: Peter Maydell <peter.maydell@linaro.org>, berrange@redhat.com,
 Eduardo Habkost <ehabkost@redhat.com>, kchamart@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

- Add the '-noTSX' variants for CascadeLake and SkyLake.

- Document the three MSR bits: 'mds-no', 'taa-no', and 'tsx-ctrl'

  Two confusing things about 'mds-no' (and the first point applies to
  the other two MSRs too):

  (1) The 'mds-no' bit will _not_ show up in the guest's /proc/cpuinfo.
      Rather it is used to fill in the guest's sysfs:

        /sys/devices/system/cpu/vulnerabilities/mds:Not affected

      Paolo confirmed on IRC as such.

  (2) There are _three_ variants[+] of CascadeLake CPUs, with different
      stepping levels: 5, 6, and 7.  To quote wikichip.org[*]:

        "note that while steppings 6 & 7 are fully mitigated, earlier
        stepping 5 is not protected against MSBDS, MLPDS, nor MDSUM"

      The above is also indicated in the Intel's document[+], as
      indicated by "No" under the three columns of MFBDS, MSBDS, and
      MLPDS.

  I've expressed this in the docs without belabouring the details.

      [+] https://software.intel.com/security-software-guidance/insights/pr=
ocessors-affected-microarchitectural-data-sampling
      [*] https://en.wikichip.org/wiki/intel/microarchitectures/cascade_lak=
e#Key_changes_from_Skylake

Signed-off-by: Kashyap Chamarthy <kchamart@redhat.com>
---
v4:
 - Fix two minor rST-related things [pbonzini]
---
 docs/system/qemu-cpu-models.rst | 57 +++++++++++++++++++++++++++++++--
 1 file changed, 55 insertions(+), 2 deletions(-)

diff --git a/docs/system/qemu-cpu-models.rst b/docs/system/qemu-cpu-models.=
rst
index 2bf635ecab..6ad572c509 100644
--- a/docs/system/qemu-cpu-models.rst
+++ b/docs/system/qemu-cpu-models.rst
@@ -61,10 +61,15 @@ mixture of host CPU models between machines, if live mi=
gration
 compatibility is required, use the newest CPU model that is compatible
 across all desired hosts.
=20
-``Skylake-Server``, ``Skylake-Server-IBRS``
+``Cascadelake-Server``, ``Cascadelake-Server-noTSX``
+    Intel Xeon Processor (Cascade Lake, 2019), with "stepping" levels 6
+    or 7 only.  (The Cascade Lake Xeon processor with *stepping 5 is
+    vulnerable to MDS variants*.)
+
+``Skylake-Server``, ``Skylake-Server-IBRS``, ``Skylake-Server-IBRS-noTSX``
     Intel Xeon Processor (Skylake, 2016)
=20
-``Skylake-Client``, ``Skylake-Client-IBRS``
+``Skylake-Client``, ``Skylake-Client-IBRS``, ``Skylake-Client-noTSX-IBRS}`=
`
     Intel Core Processor (Skylake, 2015)
=20
 ``Broadwell``, ``Broadwell-IBRS``, ``Broadwell-noTSX``, ``Broadwell-noTSX-=
IBRS``
@@ -160,6 +165,54 @@ features are included if using "Host passthrough" or "=
Host model".
   Requires the host CPU microcode to support this feature before it
   can be used for guest CPUs.
=20
+``mds-no``
+  Recommended to inform the guest OS that the host is *not* vulnerable
+  to any of the MDS variants ([MFBDS] CVE-2018-12130, [MLPDS]
+  CVE-2018-12127, [MSBDS] CVE-2018-12126).
+
+  This is an MSR (Model-Specific Register) feature rather than a CPUID fea=
ture,
+  so it will not appear in the Linux ``/proc/cpuinfo`` in the host or
+  guest.  Instead, the host kernel uses it to populate the MDS
+  vulnerability file in ``sysfs``.
+
+  So it should only be enabled for VMs if the host reports @code{Not
+  affected} in the ``/sys/devices/system/cpu/vulnerabilities/mds`` file.
+
+``taa-no``
+  Recommended to inform that the guest that the host is ``not``
+  vulnerable to CVE-2019-11135, TSX Asynchronous Abort (TAA).
+
+  This too is an MSR feature, so it does not show up in the Linux
+  ``/proc/cpuinfo`` in the host or guest.
+
+  It should only be enabled for VMs if the host reports ``Not affected``
+  in the ``/sys/devices/system/cpu/vulnerabilities/tsx_async_abort``
+  file.
+
+``tsx-ctrl``
+  Recommended to inform the guest that it can disable the Intel TSX
+  (Transactional Synchronization Extensions) feature; or, if the
+  processor is vulnerable, use the Intel VERW instruction (a
+  processor-level instruction that performs checks on memory access) as
+  a mitigation for the TAA vulnerability.  (For details, refer to
+  Intel's `deep dive into MDS
+  <https://software.intel.com/security-software-guidance/insights/deep-div=
e-intel-analysis-microarchitectural-data-sampling>`_.)
+
+  Expose this to the guest OS if and only if: (a) the host has TSX
+  enabled; *and* (b) the guest has ``rtm`` CPU flag enabled.
+
+  By disabling TSX, KVM-based guests can avoid paying the price of
+  mitigating TSX-based attacks.
+
+  Note that ``tsx-ctrl`` too is an MSR feature, so it does not show
+  up in the Linux ``/proc/cpuinfo`` in the host or guest.
+
+  To validate that Intel TSX is indeed disabled for the guest, there are
+  two ways: (a) check for the *absence* of ``rtm`` in the guest's
+  ``/proc/cpuinfo``; or (b) the
+  ``/sys/devices/system/cpu/vulnerabilities/tsx_async_abort`` file in
+  the guest should report ``Mitigation: TSX disabled``.
+
=20
 Preferred CPU models for AMD x86 hosts
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--=20
2.21.0


