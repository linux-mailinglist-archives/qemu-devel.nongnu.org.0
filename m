Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 365F52CEF5D
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 15:07:32 +0100 (CET)
Received: from localhost ([::1]:60248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klBkA-0001rJ-UP
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 09:07:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cbrowy@avery-design.com>)
 id 1kl3Mi-00017t-VR
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 00:10:44 -0500
Received: from server.avery-design.com ([198.57.169.184]:50422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cbrowy@avery-design.com>)
 id 1kl3Mg-0004V1-LV
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 00:10:44 -0500
Received: from ool-944ab965.dyn.optonline.net ([148.74.185.101]:55168
 helo=[192.168.1.180])
 by server.avery-design.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <cbrowy@avery-design.com>)
 id 1kl3Hh-0006U7-6M; Fri, 04 Dec 2020 05:05:33 +0000
From: Chris Browy <cbrowy@avery-design.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_E6BBA326-1530-4DD0-9E4E-17528A263CDC"
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: [RFC PATCH 00/25] Introduce CXL 2.0 Emulation
Message-Id: <A0F02678-46AD-4AC7-92C3-9BEF3B3284DE@avery-design.com>
Date: Fri, 4 Dec 2020 00:08:13 -0500
To: ben.widawsky@intel.com
X-Mailer: Apple Mail (2.3608.120.23.2.4)
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - server.avery-design.com
X-AntiAbuse: Original Domain - nongnu.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - avery-design.com
X-Get-Message-Sender-Via: server.avery-design.com: authenticated_id:
 cbrowy@avery-design.com
X-Authenticated-Sender: server.avery-design.com: cbrowy@avery-design.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Received-SPF: pass client-ip=198.57.169.184;
 envelope-from=cbrowy@avery-design.com; helo=server.avery-design.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, FAKE_REPLY_B=3.099,
 HTML_MESSAGE=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 04 Dec 2020 09:05:50 -0500
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
Cc: vishal.l.verma@intel.com, dan.j.williams@intel.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Apple-Mail=_E6BBA326-1530-4DD0-9E4E-17528A263CDC
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hi Ben,

Trying to bring up the environment using the latest developments as =
follows:

1. Linux kernel baseline version is cloned using
     git clone =
git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
   Using master branch.  Merged the 9 CXL linux kernel patches manually =
and built kernel

2. QEMU baseline version is cloned using
     git clone https://gitlab.com/bwidawsk/qemu.git =
<https://gitlab.com/bwidawsk/qemu.git>

3. UEFI baseline is cloned using
     git clone https://github.com/tianocore/edk2.git =
<https://github.com/tianocore/edk2.git>
   Using master and built

4. Now can run qemu as follows:
     The qcow2 we use is based on Ubuntu 20.10 with updated with kernel =
from 1) above

     QEMU command:

     sudo qemu-system-x86_64 -nic \
     user,hostfwd=3Dtcp::2222-:22,hostfwd=3Dtcp::1234-:1234 -machine \
     type=3Dpc-q35-4.0,hmat=3Don,accel=3Dkvm -enable-kvm -cpu host -smp =
\
     6,cores=3D6,threads=3D1,sockets=3D1 -m 8G -boot order=3Dd -k =
'en-us' -vga virtio \
     -drive file=3D/home/chris/Downloads/AQCXL/ubuntu_20.qcow,format=3Dqco=
w2 -drive \
     if=3Dpflash,format=3Draw,readonly,file=3D/home/chris/OVMF_CODE.fd \
     -drive if=3Dpflash,format=3Draw,file=3D/home/chris/OVMF_VARS.fd \
     -object =
memory-backend-file,id=3Dcxl-mem1,share,mem-path=3D/tmp/cxl-test/cxl,size=3D=
512M \
     -device =
pxb-cxl,id=3Dcxl.0,bus=3Dpcie.0,bus_nr=3D52,uid=3D0,len-window-base=3D1,\
     window-base[0]=3D0x4c0000000,memdev[0]=3Dcxl-mem1 \
     -device cxl-rp,id=3Drp0,bus=3Dcxl.0,addr=3D0.0,chassis=3D0,slot=3D0 =
 \
     -device cxl-type3,bus=3Drp0,memdev=3Dcxl-mem1,id=3Dcxl-pmem0,size=3D2=
56M  2>&1 | tee -a \
     /home/chris/Downloads/AQCXL/log/qemu.log

   The qemu options are derived from looking at the =
tests/qtests/cxl-test.c
   along with the -hmat=3Don which seemed to make sense.

   The system boots and lspci -vvv shows the CXL device is enumerated.  =
But
   no DOE capability register for CDAT access though (see below).  =
Otherwise the
   DVSEC registers are present.

   acpidump indicates the CXL0 and CXLM devices but no SRAT or HMAT =
tables are
   in the dump which is curious.


35:00.0 Memory controller [0502]: Intel Corporation Device 0d93 (rev 01) =
(prog-if 10)
    Subsystem: Red Hat, Inc. Device 1100
    Physical Slot: 0
    Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- =
Stepping- SERR- FastB2B- DisINTx-
    Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort- =
<TAbort- <MAbort- >SERR- <PERR- INTx-
    Latency: 0
    Region 0: Memory at c0a00000 (64-bit, non-prefetchable) [size=3D64K]
    Region 2: Memory at c0a10000 (64-bit, non-prefetchable) [size=3D4K]
    Capabilities: [80] Express (v2) Endpoint, MSI 00
        DevCap: MaxPayload 128 bytes, PhantFunc 0, Latency L0s <64ns, L1 =
<1us
            ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset- =
SlotPowerLimit 0.000W
        DevCtl: CorrErr- NonFatalErr- FatalErr- UnsupReq-
            RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
            MaxPayload 128 bytes, MaxReadReq 128 bytes
        DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr- =
TransPend-
        LnkCap: Port #0, Speed 2.5GT/s, Width x1, ASPM L0s, Exit Latency =
L0s <64ns
            ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp-
        LnkCtl: ASPM Disabled; RCB 64 bytes Disabled- CommClk-
            ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
        LnkSta: Speed 2.5GT/s (ok), Width x1 (ok)
            TrErr- Train- SlotClk- DLActive+ BWMgmt- ABWMgmt-
        DevCap2: Completion Timeout: Not Supported, TimeoutDis-, =
NROPrPrP-, LTR-
             10BitTagComp-, 10BitTagReq-, OBFF Not Supported, ExtFmt+, =
EETLPPrefix+, MaxEETLPPrefixes 4
               EmergencyPowerReduction Not Supported, =
EmergencyPowerReductionInit-
             FRS-, TPHComp-, ExtTPHComp-
             AtomicOpsCap: 32bit- 64bit- 128bitCAS-
        DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR-, =
OBFF Disabled
             AtomicOpsCtl: ReqEn-
        LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance- SpeedDis-
             Transmit Margin: Normal Operating Range, =
EnterModifiedCompliance- ComplianceSOS-
             Compliance De-emphasis: -6dB
        LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete-, =
EqualizationPhase1-
             EqualizationPhase2-, EqualizationPhase3-, =
LinkEqualizationRequest-
    Capabilities: [100 v1] Designated Vendor-Specific <?>
    Capabilities: [138 v1] Designated Vendor-Specific <?>
    Kernel driver in use: cxl_mem

Questions/Comments:
-------------------
1. Linux
  a. Is there a gitlab for the linux kernel patches for CXL?  This would
     facilitate review and code modifications.

2. UEFI (edk2 from tianocore)
  a. seems to only support CXL 1.1 which means only method #1 (Device
     option ROM) of Coherent Device Attribute Table_1.02 spec
     for CDAT handling is possible now.

     Does device option ROM need to be added to QEMU CXL setup?

     Can we add a CXL 1.1 emulated device?

  b. lspci doesn=E2=80=99t show the existence of the DOE extended =
capability register
     in the CXL CT3D (needed to support method #2).  Are there more =
patches?

3. Do you have example user programs to share or better yet the CXL 2.0
   Sec 14.3.6.1 Application Layer/ Transaction layer test for CXL.mem?

4. What are the userspace system APIs for targeting CXL HDM address =
domain?
   Usually you can mmap a SPA if you know how to look it up.


Best Regards,
Chris Browy


--Apple-Mail=_E6BBA326-1530-4DD0-9E4E-17528A263CDC
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><div =
style=3D"font-family: -webkit-standard;" class=3D"">Hi Ben,</div><div =
style=3D"font-family: -webkit-standard;" class=3D""><br =
class=3D""></div><div style=3D"font-family: -webkit-standard;" =
class=3D"">Trying to bring up the environment using the latest =
developments as follows:</div><div style=3D"font-family: =
-webkit-standard;" class=3D""><br class=3D""></div><div =
style=3D"font-family: -webkit-standard;" class=3D"">1. Linux kernel =
baseline version is cloned using</div><div style=3D"font-family: =
-webkit-standard;" class=3D"">&nbsp;&nbsp;&nbsp;&nbsp; git clone <a =
href=3D"git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git" =
class=3D"">git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git<=
/a></div><div style=3D"font-family: -webkit-standard;" =
class=3D"">&nbsp;&nbsp; Using master branch.&nbsp;&nbsp;Merged the 9 CXL =
linux kernel patches manually and built kernel</div><div =
style=3D"font-family: -webkit-standard;" class=3D""><br =
class=3D""></div><div style=3D"font-family: -webkit-standard;" =
class=3D"">2. QEMU baseline version is cloned using</div><div =
style=3D"font-family: -webkit-standard;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp; git clone&nbsp;<a =
href=3D"https://gitlab.com/bwidawsk/qemu.git" =
class=3D"">https://gitlab.com/bwidawsk/qemu.git</a></div><div =
style=3D"font-family: -webkit-standard;" class=3D""><br =
class=3D""></div><div style=3D"font-family: -webkit-standard;" =
class=3D"">3. UEFI baseline is cloned using</div><div =
style=3D"font-family: -webkit-standard;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp; git clone&nbsp;<a =
href=3D"https://github.com/tianocore/edk2.git" =
class=3D"">https://github.com/tianocore/edk2.git</a></div><div =
style=3D"font-family: -webkit-standard;" class=3D"">&nbsp;&nbsp; Using =
master and built</div><div style=3D"font-family: -webkit-standard;" =
class=3D""><br class=3D""></div><div style=3D"font-family: =
-webkit-standard;" class=3D"">4. Now can run qemu as follows:</div><div =
style=3D"font-family: -webkit-standard;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp; The qcow2 we use is based on Ubuntu =
20.10 with updated with kernel from 1) above</div><div =
style=3D"font-family: -webkit-standard;" class=3D""><br =
class=3D""></div><div style=3D"font-family: -webkit-standard;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp; QEMU command:</div><div =
style=3D"font-family: -webkit-standard;" class=3D""><br =
class=3D""></div><div style=3D"font-family: -webkit-standard;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp; sudo qemu-system-x86_64 -nic =
\</div><div style=3D"font-family: -webkit-standard;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp; =
user,hostfwd=3Dtcp::2222-:22,hostfwd=3Dtcp::1234-:1234 -machine =
\</div><div style=3D"font-family: -webkit-standard;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp; type=3Dpc-q35-4.0,hmat=3Don,accel=3Dkv=
m -enable-kvm -cpu host -smp \</div><div style=3D"font-family: =
-webkit-standard;" class=3D"">&nbsp;&nbsp;&nbsp;&nbsp; =
6,cores=3D6,threads=3D1,sockets=3D1 -m 8G -boot order=3Dd -k 'en-us' =
-vga virtio \</div><div style=3D"font-family: -webkit-standard;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp; -drive =
file=3D/home/chris/Downloads/AQCXL/ubuntu_20.qcow,format=3Dqcow2 -drive =
\</div><div style=3D"font-family: -webkit-standard;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp; =
if=3Dpflash,format=3Draw,readonly,file=3D/home/chris/OVMF_CODE.fd =
\</div><div style=3D"font-family: -webkit-standard;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp; -drive =
if=3Dpflash,format=3Draw,file=3D/home/chris/OVMF_VARS.fd \</div><div =
style=3D"font-family: -webkit-standard;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp; -object =
memory-backend-file,id=3Dcxl-mem1,share,mem-path=3D/tmp/cxl-test/cxl,size=3D=
512M \</div><div style=3D"font-family: -webkit-standard;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp; -device =
pxb-cxl,id=3Dcxl.0,bus=3Dpcie.0,bus_nr=3D52,uid=3D0,len-window-base=3D1,\<=
/div><div style=3D"font-family: -webkit-standard;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp; =
window-base[0]=3D0x4c0000000,memdev[0]=3Dcxl-mem1 \</div><div =
style=3D"font-family: -webkit-standard;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp; -device =
cxl-rp,id=3Drp0,bus=3Dcxl.0,addr=3D0.0,chassis=3D0,slot=3D0&nbsp;&nbsp;\</=
div><div style=3D"font-family: -webkit-standard;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp; -device =
cxl-type3,bus=3Drp0,memdev=3Dcxl-mem1,id=3Dcxl-pmem0,size=3D256M&nbsp;&nbs=
p;2&gt;&amp;1 | tee -a \</div><div style=3D"font-family: =
-webkit-standard;" class=3D"">&nbsp;&nbsp;&nbsp;&nbsp; =
/home/chris/Downloads/AQCXL/log/qemu.log</div><div style=3D"font-family: =
-webkit-standard;" class=3D""><br class=3D""></div><div =
style=3D"font-family: -webkit-standard;" class=3D"">&nbsp;&nbsp; The =
qemu options are derived from looking at the =
tests/qtests/cxl-test.c</div><div style=3D"font-family: =
-webkit-standard;" class=3D"">&nbsp;&nbsp; along with the -hmat=3Don =
which seemed to make sense.</div><div style=3D"font-family: =
-webkit-standard;" class=3D""><br class=3D""></div><div =
style=3D"font-family: -webkit-standard;" class=3D"">&nbsp;&nbsp; The =
system boots and lspci -vvv shows the CXL device is =
enumerated.&nbsp;&nbsp;But</div><div style=3D"font-family: =
-webkit-standard;" class=3D"">&nbsp;&nbsp; no DOE capability register =
for CDAT access though (see below).&nbsp;&nbsp;Otherwise the</div><div =
style=3D"font-family: -webkit-standard;" class=3D"">&nbsp;&nbsp; DVSEC =
registers are present.</div><div style=3D"font-family: =
-webkit-standard;" class=3D""><br class=3D""></div><div =
style=3D"font-family: -webkit-standard;" class=3D"">&nbsp;&nbsp; =
acpidump indicates the CXL0 and CXLM devices but no SRAT or HMAT tables =
are</div><div style=3D"font-family: -webkit-standard;" =
class=3D"">&nbsp;&nbsp; in the dump which is curious.</div><div =
style=3D"font-family: -webkit-standard;" class=3D""><br =
class=3D""></div><div style=3D"font-family: -webkit-standard;" =
class=3D""><br class=3D""></div><div style=3D"font-family: =
-webkit-standard;" class=3D"">35:00.0 Memory controller [0502]: Intel =
Corporation Device 0d93 (rev 01) (prog-if 10)</div><div =
style=3D"font-family: -webkit-standard;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;Subsystem: Red Hat, Inc. Device =
1100</div><div style=3D"font-family: -webkit-standard;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;Physical Slot: 0</div><div =
style=3D"font-family: -webkit-standard;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;Control: I/O+ Mem+ BusMaster+ =
SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- =
DisINTx-</div><div style=3D"font-family: -webkit-standard;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;Status: Cap+ 66MHz- UDF- FastB2B- =
ParErr- DEVSEL=3Dfast &gt;TAbort- &lt;TAbort- &lt;MAbort- &gt;SERR- =
&lt;PERR- INTx-</div><div style=3D"font-family: -webkit-standard;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;Latency: 0</div><div =
style=3D"font-family: -webkit-standard;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;Region 0: Memory at c0a00000 (64-bit, =
non-prefetchable) [size=3D64K]</div><div style=3D"font-family: =
-webkit-standard;" class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;Region 2: Memory =
at c0a10000 (64-bit, non-prefetchable) [size=3D4K]</div><div =
style=3D"font-family: -webkit-standard;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;Capabilities: [80] Express (v2) =
Endpoint, MSI 00</div><div style=3D"font-family: -webkit-standard;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;DevCap: =
MaxPayload 128 bytes, PhantFunc 0, Latency L0s &lt;64ns, L1 =
&lt;1us</div><div style=3D"font-family: -webkit-standard;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset- SlotPowerLimit =
0.000W</div><div style=3D"font-family: -webkit-standard;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;DevCtl: =
CorrErr- NonFatalErr- FatalErr- UnsupReq-</div><div style=3D"font-family: =
-webkit-standard;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-</div><div =
style=3D"font-family: -webkit-standard;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;MaxPayload 128 bytes, MaxReadReq 128 bytes</div><div =
style=3D"font-family: -webkit-standard;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;DevSta: =
CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr- TransPend-</div><div =
style=3D"font-family: -webkit-standard;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;LnkCap: Port =
#0, Speed 2.5GT/s, Width x1, ASPM L0s, Exit Latency L0s =
&lt;64ns</div><div style=3D"font-family: -webkit-standard;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp-</div><div =
style=3D"font-family: -webkit-standard;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;LnkCtl: ASPM =
Disabled; RCB 64 bytes Disabled- CommClk-</div><div style=3D"font-family: =
-webkit-standard;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-</div><div =
style=3D"font-family: -webkit-standard;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;LnkSta: Speed =
2.5GT/s (ok), Width x1 (ok)</div><div style=3D"font-family: =
-webkit-standard;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;TrErr- Train- SlotClk- DLActive+ BWMgmt- ABWMgmt-</div><div =
style=3D"font-family: -webkit-standard;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;DevCap2: =
Completion Timeout: Not Supported, TimeoutDis-, NROPrPrP-, =
LTR-</div><div style=3D"font-family: -webkit-standard;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; 10BitTagComp-, 10BitTagReq-, OBFF Not Supported, ExtFmt+, =
EETLPPrefix+, MaxEETLPPrefixes 4</div><div style=3D"font-family: =
-webkit-standard;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; EmergencyPowerReduction Not Supported, =
EmergencyPowerReductionInit-</div><div style=3D"font-family: =
-webkit-standard;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; FRS-, TPHComp-, ExtTPHComp-</div><div style=3D"font-family: =
-webkit-standard;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; AtomicOpsCap: 32bit- 64bit- 128bitCAS-</div><div =
style=3D"font-family: -webkit-standard;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;DevCtl2: =
Completion Timeout: 50us to 50ms, TimeoutDis-, LTR-, OBFF =
Disabled</div><div style=3D"font-family: -webkit-standard;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; AtomicOpsCtl: ReqEn-</div><div style=3D"font-family: =
-webkit-standard;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;LnkCtl2: =
Target Link Speed: 2.5GT/s, EnterCompliance- SpeedDis-</div><div =
style=3D"font-family: -webkit-standard;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; Transmit Margin: Normal Operating Range, =
EnterModifiedCompliance- ComplianceSOS-</div><div style=3D"font-family: =
-webkit-standard;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; Compliance De-emphasis: -6dB</div><div style=3D"font-family: =
-webkit-standard;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;LnkSta2: =
Current De-emphasis Level: -6dB, EqualizationComplete-, =
EqualizationPhase1-</div><div style=3D"font-family: -webkit-standard;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; EqualizationPhase2-, EqualizationPhase3-, =
LinkEqualizationRequest-</div><div style=3D"font-family: =
-webkit-standard;" class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;Capabilities: [100 =
v1] Designated Vendor-Specific &lt;?&gt;</div><div style=3D"font-family: =
-webkit-standard;" class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;Capabilities: [138 =
v1] Designated Vendor-Specific &lt;?&gt;</div><div style=3D"font-family: =
-webkit-standard;" class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;Kernel driver in =
use: cxl_mem</div><div style=3D"font-family: -webkit-standard;" =
class=3D""><br class=3D""></div><div style=3D"font-family: =
-webkit-standard;" class=3D"">Questions/Comments:</div><div =
style=3D"font-family: -webkit-standard;" =
class=3D"">-------------------</div><div style=3D"font-family: =
-webkit-standard;" class=3D"">1. Linux</div><div style=3D"font-family: =
-webkit-standard;" class=3D"">&nbsp;&nbsp;a. Is there a gitlab for the =
linux kernel patches for CXL?&nbsp;&nbsp;This would</div><div =
style=3D"font-family: -webkit-standard;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp; facilitate review and code =
modifications.</div><div style=3D"font-family: -webkit-standard;" =
class=3D""><br class=3D""></div><div style=3D"font-family: =
-webkit-standard;" class=3D"">2. UEFI (edk2 from tianocore)</div><div =
style=3D"font-family: -webkit-standard;" class=3D"">&nbsp;&nbsp;a. seems =
to only support CXL 1.1 which means only method #1 (Device</div><div =
style=3D"font-family: -webkit-standard;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp; option ROM) of Coherent Device =
Attribute Table_1.02 spec</div><div style=3D"font-family: =
-webkit-standard;" class=3D"">&nbsp;&nbsp;&nbsp;&nbsp; for CDAT handling =
is possible now.</div><div style=3D"font-family: -webkit-standard;" =
class=3D""><br class=3D""></div><div style=3D"font-family: =
-webkit-standard;" class=3D"">&nbsp;&nbsp;&nbsp;&nbsp; Does device =
option ROM need to be added to QEMU CXL setup?</div><div =
style=3D"font-family: -webkit-standard;" class=3D""><br =
class=3D""></div><div style=3D"font-family: -webkit-standard;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp; Can we add a CXL 1.1 emulated =
device?</div><div style=3D"font-family: -webkit-standard;" class=3D""><br =
class=3D""></div><div style=3D"font-family: -webkit-standard;" =
class=3D"">&nbsp;&nbsp;b. lspci doesn=E2=80=99t show the existence of =
the DOE extended capability register</div><div style=3D"font-family: =
-webkit-standard;" class=3D"">&nbsp;&nbsp;&nbsp;&nbsp; in the CXL CT3D =
(needed to support method #2).&nbsp;&nbsp;Are there more =
patches?</div><div style=3D"font-family: -webkit-standard;" class=3D""><br=
 class=3D""></div><div style=3D"font-family: -webkit-standard;" =
class=3D"">3. Do you have example user programs to share or better yet =
the CXL 2.0</div><div style=3D"font-family: -webkit-standard;" =
class=3D"">&nbsp;&nbsp; Sec 14.3.6.1 Application Layer/ Transaction =
layer test for CXL.mem?</div><div style=3D"font-family: =
-webkit-standard;" class=3D""><br class=3D""></div><div =
style=3D"font-family: -webkit-standard;" class=3D"">4. What are the =
userspace system APIs for targeting CXL HDM address domain?</div><div =
style=3D"font-family: -webkit-standard;" class=3D"">&nbsp;&nbsp; Usually =
you can mmap a SPA if you know how to look it up.</div><div =
style=3D"font-family: -webkit-standard;" class=3D""><br =
class=3D""></div><div style=3D"font-family: -webkit-standard;" =
class=3D""><br class=3D""></div><div style=3D"font-family: =
-webkit-standard;" class=3D"">Best Regards,</div><div =
style=3D"font-family: -webkit-standard;" class=3D"">Chris =
Browy</div><div class=3D""><br class=3D""></div></body></html>=

--Apple-Mail=_E6BBA326-1530-4DD0-9E4E-17528A263CDC--

