Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 475606D3FB2
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 11:06:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjG7R-0000zJ-4o; Mon, 03 Apr 2023 05:04:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maverickk1778@gmail.com>)
 id 1pjG7L-0000yv-99
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 05:04:47 -0400
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maverickk1778@gmail.com>)
 id 1pjG7J-0001sM-9h
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 05:04:47 -0400
Received: by mail-il1-x12e.google.com with SMTP id n11so1884021ilj.9
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 02:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680512683;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=1KRJ06UP8WcUlaJV//ul06eZlAExICLRlAexusOtxpI=;
 b=LS8Wf54LPY9nGn+I0Kp/9gBxz4mV919SpPmrJbuD3EYHApZ7kjxlej3toLr7qaIVAi
 CIioAR0inysaMbkEvxD5GuouRCUA3nf4jzak5AyMFn3QQFWlwtfajy3TYAssoIebDU9L
 Ic/HyA3iKi3/RGl5qBqZxVM/DUyBj69IGKBVurMqIpAJl18daxuhnlsBiJ9HZ07ELwvm
 q5TYTADapBiJ0M6FPpFw0JVoLqd62rB5XsXorX5dU61p/pXDjY1g0BaUoSSOx/OsADf8
 Tia0V7EncOwkLVpWNKEZUCDFxaZCYHNrUv07FFSej5CNAo0bh9DQIavQPvHK/shpgWVl
 Sfww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680512683;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1KRJ06UP8WcUlaJV//ul06eZlAExICLRlAexusOtxpI=;
 b=tNPDd20tX51i26Sbw7qQ+9nb7x6fLy161MYOwLsoBZCQM83g/87IEuBRGV1TkqKarD
 jPZ6Hx2IasdOQhFT5cjHECT8Ckgj/dCaGyOBSQjVElAG5sk5fahoqXxWXfl0aGGtvfPT
 HZnzCL2IvlK4ExCZ3dQ9nXkr8DToinSJvaFm35PoXN6ZUuOuzWIF0OKmN0WBHkzZLhn3
 ou3xk6OsypLnDhCL1Y3M/Q2jc7uLb2AAmjVD1J+XRUEtjNzE/Y14CxPK5Vh7hFdR0Qb9
 T4hRWDJc8qBxJN/ccA8ojoEtoJar8TRd+fVwsUk0OfF2WIRKYxeQZDjBzRuEKBCch7yx
 0GGQ==
X-Gm-Message-State: AAQBX9c2NucmGn8vEnCAh/HOCGNHS+xwddr5UiIDt8FQ8jX6aTPl3dPG
 XHaXV9BwOhr99D7vGci2TN3jMdurESLYfDC6tWon0IkQNy0=
X-Google-Smtp-Source: AKy350b5e0ZaD5eRM97tgnetj4K9cQenv6OjsgAbon9RJ15jrNRcjhRCgYXxOFkb/fyk/J+Q/Gol/X4K4EOVRLifJBs=
X-Received: by 2002:a05:6e02:1486:b0:313:c399:73c8 with SMTP id
 n6-20020a056e02148600b00313c39973c8mr18565795ilk.4.1680512682773; Mon, 03 Apr
 2023 02:04:42 -0700 (PDT)
MIME-Version: 1.0
From: Maverickk 78 <maverickk1778@gmail.com>
Date: Mon, 3 Apr 2023 14:34:33 +0530
Message-ID: <CALfBBTuGSPYE_HV1ns_9T_Ud3BEAajhN2ivMCJ37f+hC1XOy+w@mail.gmail.com>
Subject: property 'cxl-type3.size' not found
To: qemu-devel <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000007f50c105f86ad968"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12e;
 envelope-from=maverickk1778@gmail.com; helo=mail-il1-x12e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--0000000000007f50c105f86ad968
Content-Type: text/plain; charset="UTF-8"

Hello,

I am trying qemu-system-aarch64 & cxl configuration listed in

https://www.qemu.org/docs/master/system/devices/cxl.html

qemu-system-aarch64 -M virt,gic-version=3,cxl=on -m 4g,maxmem=8G,slots=8
-cpu max \
...
-object
memory-backend-file,id=cxl-mem0,share=on,mem-path=/tmp/cxltest.raw,size=256M
\
-object
memory-backend-file,id=cxl-mem1,share=on,mem-path=/tmp/cxltest1.raw,size=256M
\
-object
memory-backend-file,id=cxl-mem2,share=on,mem-path=/tmp/cxltest2.raw,size=256M
\
-object
memory-backend-file,id=cxl-mem3,share=on,mem-path=/tmp/cxltest3.raw,size=256M
\
-object
memory-backend-file,id=cxl-lsa0,share=on,mem-path=/tmp/lsa0.raw,size=256M \
-object
memory-backend-file,id=cxl-lsa1,share=on,mem-path=/tmp/lsa1.raw,size=256M \
-object
memory-backend-file,id=cxl-lsa2,share=on,mem-path=/tmp/lsa2.raw,size=256M \
-object
memory-backend-file,id=cxl-lsa3,share=on,mem-path=/tmp/lsa3.raw,size=256M \
-device pxb-cxl,bus_nr=12,bus=pcie.0,id=cxl.1 \
-device cxl-rp,port=0,bus=cxl.1,id=root_port0,chassis=0,slot=0 \
-device cxl-rp,port=1,bus=cxl.1,id=root_port1,chassis=0,slot=1 \
-device cxl-upstream,bus=root_port0,id=us0 \
-device cxl-downstream,port=0,bus=us0,id=swport0,chassis=0,slot=4 \
-device
cxl-type3,bus=swport0,memdev=cxl-mem0,lsa=cxl-lsa0,id=cxl-pmem0,size=256M \
-device cxl-downstream,port=1,bus=us0,id=swport1,chassis=0,slot=5 \
-device
cxl-type3,bus=swport1,memdev=cxl-mem1,lsa=cxl-lsa1,id=cxl-pmem1,size=256M \
-device cxl-downstream,port=2,bus=us0,id=swport2,chassis=0,slot=6 \
-device
cxl-type3,bus=swport2,memdev=cxl-mem2,lsa=cxl-lsa2,id=cxl-pmem2,size=256M \
-device cxl-downstream,port=3,bus=us0,id=swport3,chassis=0,slot=7 \
-device
cxl-type3,bus=swport3,memdev=cxl-mem3,lsa=cxl-lsa3,id=cxl-pmem3,size=256M \
-M
cxl-fmw.0.targets.0=cxl.1,cxl-fmw.0.size=4G,cxl-fmw.0.interleave-granularity=4k



I hit this following error
qemu-system-aarch64: -device
cxl-type3,bus=swport0,memdev=cxl-mem0,lsa=cxl-lsa0,id=cxl-pmem0,size=256M:
property 'cxl-type3.size' not found


Any clue if I am missing something?


Regards

--0000000000007f50c105f86ad968
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<br><br>I am trying qemu-system-aarch64 &amp; cxl co=
nfiguration listed in<br><br><a href=3D"https://www.qemu.org/docs/master/sy=
stem/devices/cxl.html">https://www.qemu.org/docs/master/system/devices/cxl.=
html</a><br><br>qemu-system-aarch64 -M virt,gic-version=3D3,cxl=3Don -m 4g,=
maxmem=3D8G,slots=3D8 -cpu max \<br>...<br>-object memory-backend-file,id=
=3Dcxl-mem0,share=3Don,mem-path=3D/tmp/cxltest.raw,size=3D256M \<br>-object=
 memory-backend-file,id=3Dcxl-mem1,share=3Don,mem-path=3D/tmp/cxltest1.raw,=
size=3D256M \<br>-object memory-backend-file,id=3Dcxl-mem2,share=3Don,mem-p=
ath=3D/tmp/cxltest2.raw,size=3D256M \<br>-object memory-backend-file,id=3Dc=
xl-mem3,share=3Don,mem-path=3D/tmp/cxltest3.raw,size=3D256M \<br>-object me=
mory-backend-file,id=3Dcxl-lsa0,share=3Don,mem-path=3D/tmp/lsa0.raw,size=3D=
256M \<br>-object memory-backend-file,id=3Dcxl-lsa1,share=3Don,mem-path=3D/=
tmp/lsa1.raw,size=3D256M \<br>-object memory-backend-file,id=3Dcxl-lsa2,sha=
re=3Don,mem-path=3D/tmp/lsa2.raw,size=3D256M \<br>-object memory-backend-fi=
le,id=3Dcxl-lsa3,share=3Don,mem-path=3D/tmp/lsa3.raw,size=3D256M \<br>-devi=
ce pxb-cxl,bus_nr=3D12,bus=3Dpcie.0,id=3Dcxl.1 \<br>-device cxl-rp,port=3D0=
,bus=3Dcxl.1,id=3Droot_port0,chassis=3D0,slot=3D0 \<br>-device cxl-rp,port=
=3D1,bus=3Dcxl.1,id=3Droot_port1,chassis=3D0,slot=3D1 \<br>-device cxl-upst=
ream,bus=3Droot_port0,id=3Dus0 \<br>-device cxl-downstream,port=3D0,bus=3Du=
s0,id=3Dswport0,chassis=3D0,slot=3D4 \<br>-device cxl-type3,bus=3Dswport0,m=
emdev=3Dcxl-mem0,lsa=3Dcxl-lsa0,id=3Dcxl-pmem0,size=3D256M \<br>-device cxl=
-downstream,port=3D1,bus=3Dus0,id=3Dswport1,chassis=3D0,slot=3D5 \<br>-devi=
ce cxl-type3,bus=3Dswport1,memdev=3Dcxl-mem1,lsa=3Dcxl-lsa1,id=3Dcxl-pmem1,=
size=3D256M \<br>-device cxl-downstream,port=3D2,bus=3Dus0,id=3Dswport2,cha=
ssis=3D0,slot=3D6 \<br>-device cxl-type3,bus=3Dswport2,memdev=3Dcxl-mem2,ls=
a=3Dcxl-lsa2,id=3Dcxl-pmem2,size=3D256M \<br>-device cxl-downstream,port=3D=
3,bus=3Dus0,id=3Dswport3,chassis=3D0,slot=3D7 \<br>-device cxl-type3,bus=3D=
swport3,memdev=3Dcxl-mem3,lsa=3Dcxl-lsa3,id=3Dcxl-pmem3,size=3D256M \<br>-M=
 cxl-fmw.0.targets.0=3Dcxl.1,cxl-fmw.0.size=3D4G,cxl-fmw.0.interleave-granu=
larity=3D4k<br><br><br><br>I hit this following error<br>qemu-system-aarch6=
4: -device cxl-type3,bus=3Dswport0,memdev=3Dcxl-mem0,lsa=3Dcxl-lsa0,id=3Dcx=
l-pmem0,size=3D256M: property &#39;cxl-type3.size&#39; not found<br><br><br=
>Any clue if I am missing something?<br><br><br>Regards<br><br><br><br></di=
v>

--0000000000007f50c105f86ad968--

