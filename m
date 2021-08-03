Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B98773DEFCC
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 16:14:43 +0200 (CEST)
Received: from localhost ([::1]:37716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAvBq-0005uN-RQ
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 10:14:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <axelheider@gmx.de>) id 1mAvAG-0004Jl-FD
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 10:13:04 -0400
Received: from mout.gmx.net ([212.227.15.15]:45661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <axelheider@gmx.de>) id 1mAvAE-0000x6-Ia
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 10:13:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1627999980;
 bh=9OlRgmlcKY8XjurtnOe2rb1crKk7d11kHL8HhfPq2Q4=;
 h=X-UI-Sender-Class:To:From:Subject:Date;
 b=dLymtkLKqYk9vzcnQAtMyWdMKpSGgwkKh4qGJlbcQOvyuVTaCSwNBBOkU16O9fV/8
 o9hnFe1aN+bWNZLHY0N24eVQU7iWxfbKV7QjNgUP94TWgStGtapKkKLnY8QccBcMQn
 BEvsTAdxELnliyH+nWRR3+0DhQLOL5kVOQ1Hdwss=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.82.103] ([87.129.254.130]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mel7v-1ml4rR2Ion-00alEn for
 <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 16:13:00 +0200
To: qemu-devel@nongnu.org
From: Axel Heider <axelheider@gmx.de>
Subject: [PATCH 2/2] doc: Remove trailing spaces
Message-ID: <005fe0a5-10cd-aa47-d649-0a296283a4eb@gmx.de>
Date: Tue, 3 Aug 2021 16:13:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:b4WbRz0qUbWFMGsQrqFfME/7dOCi4QnMds383bODo7npl054O8d
 JqB2dvFBYm10DfCiL3K9gGMl04dd9rBXbGtI7BEZQuJg84tCiFrjCVL7T/eAurfstiTKyMi
 R5N0lADntrCZ23PxgcQm46YyuAX9/5JBVQd51rI5WGCzUDV7gTXL9tI6ii8M9cq/mKE1ZUx
 NKUK/+IRRGjlBLT0NvCZA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZEli7tUzZFQ=:dpAFYNNLySso7P88crn7g7
 aPeITpVhXsPQvHPmeVohuaThvgpeKjxyy53ok0FlnmzPbHx/XPpxud6YZr0gp2vFIXwsJclfu
 5OTdcte24SmHyvoJX/MaE3G1CYEjvoxa4XkmvZ8Qh3NM9Svh1MbMQYu2EGLfVXf+V9NDbBD/T
 B3gtcW7L3Xi+eb8aF1quPUwG2T/DAyqwnyzCslYdvcBIXqVrS/s00JqitzMgWSkOTEqKdaZtZ
 9yRw9/nPezkbbCjI7A/Xe7PdpkkLH4pZr6Fx1C+YgkNWpNdhXW8oDovgrda8evDkFn1N26THH
 wgdjPk21ZQJe5W28rTjpJjnC6sNegvIjaDQXeqrAe8CSw2VuzvYUPKuGr54amD7ol+fOJBVCp
 d7eptusImGzmZCwE/fXpMVyKKKaQ6BoDIqeLN7IEObFXFgJ+ra3ghVuIuglrruDkgkAXzFkh4
 0izo18QOnIzYr1KzJjwPDJ3s77Mt0NlLX3GQ1lrytxr+pdtMvD89d/PvSM7ToAALzASD0rh8Z
 31apn66vuMj51fn/JNfWezRErYggYDv7tnnSg4G8O3ZUVIToIXSeu5rZ4lCEBIIZeRi7szJLn
 FBl0OShUaZF1/WjhV0rmzOHqm74U+zPPLoDD9oup1VIEIQvDg8lyCw5IMUgnwg23RSDG/E+Ia
 hTHNaYTQ4lqMrWatpF7NuagmVHEcl3WcbhfQ5ruauV8TNVaGmDLEkUNE99ITsOqXJSsC23mo7
 psiLLacK0HlZK/BsksctlXgpSGKPpda/fzPhUyrUmjqEWY1cNCaSFnh5sJfFusGTX4GWsDn6S
 JJKGCOK3ovxuZsM2DOD/neBQB4PTKOj/ruL+W3f1dwMCrzs69A26dXt/WCdaVlZllUgIwCZdF
 e9LLUGTVCE23I3YoWPL9O9yvMyFPBRVeD4kB5rkfyw+LpNIXZVeNC9PEP9Tnm+kj0mI4IlDl/
 pyJQZ53+m7Qe8Vx9uH1G+/OPnREgwcNmszEuPpDxyaS22vHDWR3fZTUfJGfyno6hCB+JPBsBr
 dNYQeBiFh80Hfx52gfY27evF3P3g7OrOJvmOuhpMga0rWjI73YE/TBD3oDyyrpkKEC5/JZSGO
 KnmczMnJPI/AedKhDxT1UcjVQLlkaEpUV0I
Received-SPF: pass client-ip=212.227.15.15; envelope-from=axelheider@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Axel Heider <axelheider@gmx.de>
=2D--
  qemu-options.hx | 30 +++++++++++++++---------------
  1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index e3f256fa72..ed91246114 100644
=2D-- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -244,15 +244,15 @@ DEF("numa", HAS_ARG, QEMU_OPTION_numa,
      QEMU_ARCH_ALL)
  SRST
  ``-numa node[,mem=3Dsize][,cpus=3Dfirstcpu[-lastcpu]][,nodeid=3Dnode][,i=
nitiator=3Dinitiator]``
-  \
+  \
  ``-numa node[,memdev=3Did][,cpus=3Dfirstcpu[-lastcpu]][,nodeid=3Dnode][,=
initiator=3Dinitiator]``
    \
  ``-numa dist,src=3Dsource,dst=3Ddestination,val=3Ddistance``
-  \
+  \
  ``-numa cpu,node-id=3Dnode[,socket-id=3Dx][,core-id=3Dy][,thread-id=3Dz]=
``
-  \
+  \
  ``-numa hmat-lb,initiator=3Dnode,target=3Dnode,hierarchy=3Dhierarchy,dat=
a-type=3Dtpye[,latency=3Dlat][,bandwidth=3Dbw]``
-  \
+  \
  ``-numa hmat-cache,node-id=3Dnode,size=3Dsize,level=3Dlevel[,associativi=
ty=3Dstr][,policy=3Dstr][,line=3Dsize]``
      Define a NUMA node and assign RAM and VCPUs to it. Set the NUMA
      distance from a source node to a destination node. Set the ACPI
@@ -447,7 +447,7 @@ DEF("global", HAS_ARG, QEMU_OPTION_global,
      QEMU_ARCH_ALL)
  SRST
  ``-global driver.prop=3Dvalue``
-  \
+  \
  ``-global driver=3Ddriver,property=3Dproperty,value=3Dvalue``
      Set default value of driver's property prop to value, e.g.:

@@ -1026,9 +1026,9 @@ SRST
  ``-hda file``
    \
  ``-hdb file``
-  \
+  \
  ``-hdc file``
-  \
+  \
  ``-hdd file``
      Use file as hard disk 0, 1, 2 or 3 image (see the :ref:`disk images`
      chapter in the System Emulation Users Guide).
@@ -1518,7 +1518,7 @@ DEF("fsdev", HAS_ARG, QEMU_OPTION_fsdev,

  SRST
  ``-fsdev local,id=3Did,path=3Dpath,security_model=3Dsecurity_model [,wri=
teout=3Dwriteout][,readonly=3Don][,fmode=3Dfmode][,dmode=3Ddmode] [,thrott=
ling.option=3Dvalue[,throttling.option=3Dvalue[,...]]]``
-  \
+  \
  ``-fsdev proxy,id=3Did,socket=3Dsocket[,writeout=3Dwriteout][,readonly=
=3Don]``
    \
  ``-fsdev proxy,id=3Did,sock_fd=3Dsock_fd[,writeout=3Dwriteout][,readonly=
=3Don]``
@@ -1639,9 +1639,9 @@ DEF("virtfs", HAS_ARG, QEMU_OPTION_virtfs,

  SRST
  ``-virtfs local,path=3Dpath,mount_tag=3Dmount_tag ,security_model=3Dsecu=
rity_model[,writeout=3Dwriteout][,readonly=3Don] [,fmode=3Dfmode][,dmode=
=3Ddmode][,multidevs=3Dmultidevs]``
-  \
+  \
  ``-virtfs proxy,socket=3Dsocket,mount_tag=3Dmount_tag [,writeout=3Dwrite=
out][,readonly=3Don]``
-  \
+  \
  ``-virtfs proxy,sock_fd=3Dsock_fd,mount_tag=3Dmount_tag [,writeout=3Dwri=
teout][,readonly=3Don]``
    \
  ``-virtfs synth,mount_tag=3Dmount_tag``
@@ -3873,10 +3873,10 @@ DEF("mon", HAS_ARG, QEMU_OPTION_mon, \
      "-mon [chardev=3D]name[,mode=3Dreadline|control][,pretty[=3Don|off]]=
\n", QEMU_ARCH_ALL)
  SRST
  ``-mon [chardev=3D]name[,mode=3Dreadline|control][,pretty[=3Don|off]]``
-    Setup monitor on chardev name. ``mode=3Dcontrol`` configures
+    Setup monitor on chardev name. ``mode=3Dcontrol`` configures
      a QMP monitor (a JSON RPC-style protocol) and it is not the
      same as HMP, the human monitor that has a "(qemu)" prompt.
-    ``pretty`` is only valid when ``mode=3Dcontrol``,
+    ``pretty`` is only valid when ``mode=3Dcontrol``,
      turning on JSON pretty printing to ease
      human reading and debugging.
  ERST
@@ -3937,7 +3937,7 @@ DEF("overcommit", HAS_ARG, QEMU_OPTION_overcommit,
      QEMU_ARCH_ALL)
  SRST
  ``-overcommit mem-lock=3Don|off``
-  \
+  \
  ``-overcommit cpu-pm=3Don|off``
      Run qemu with hints about host resource overcommit. The default is
      to assume that host overcommits all resources.
@@ -4323,7 +4323,7 @@ DEF("incoming", HAS_ARG, QEMU_OPTION_incoming, \
      QEMU_ARCH_ALL)
  SRST
  ``-incoming tcp:[host]:port[,to=3Dmaxport][,ipv4=3Don|off][,ipv6=3Don|of=
f]``
-  \
+  \
  ``-incoming rdma:host:port[,ipv4=3Don|off][,ipv6=3Don|off]``
      Prepare for incoming migration, listen on a given tcp port.

@@ -5072,7 +5072,7 @@ SRST
                 [...]

      ``-object secret,id=3Did,data=3Dstring,format=3Draw|base64[,keyid=3D=
secretid,iv=3Dstring]``
-      \
+      \
      ``-object secret,id=3Did,file=3Dfilename,format=3Draw|base64[,keyid=
=3Dsecretid,iv=3Dstring]``
          Defines a secret to store a password, encryption key, or some
          other sensitive data. The sensitive data can either be passed
=2D-
2.17.1

