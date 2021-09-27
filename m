Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D684191E3
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 11:57:22 +0200 (CEST)
Received: from localhost ([::1]:57002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUnNx-0007sA-P6
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 05:57:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mUnJq-0005P5-UY; Mon, 27 Sep 2021 05:53:08 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:34263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mUnJl-0004FK-VE; Mon, 27 Sep 2021 05:53:06 -0400
Received: from quad ([82.142.21.142]) by mrelayeu.kundenserver.de (mreue009
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MPooN-1m97pM36t1-00MsvJ; Mon, 27
 Sep 2021 11:52:55 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 1/5] docs/nvdimm: Update nvdimm option value in machine example
Date: Mon, 27 Sep 2021 11:52:48 +0200
Message-Id: <20210927095252.2374148-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210927095252.2374148-1-laurent@vivier.eu>
References: <20210927095252.2374148-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:vesxM4q+sgHgUC2TwP04+wBDR8KZmg33G/WCNn/MaZIrEfaKiGV
 SFjVgMxXWYM3Ncwlf9V1B5ik6dRJeghlUzfNRTS5kRrQm4w9+yhx+FjNe93BCIBLxc1icpg
 WR2aRDjOYYoSfreITMoWmxl3veaX9z6TSzkDxYLMPqxFsCmyt5U0J39/HSdgruJpt4ub3U9
 lBmPOUgMOaVXAjbWEFh0Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:U/NurTZuGC8=:ENnfbLVTKlW93JEfkmUM2+
 EJHyrxx6ImtT2Dd1hINzWMTpDiHEiiQU7W1AZQ6AGCMc4ELLoZUPVvHQIjdsiet7JBS3Mhdoe
 U3LDkoMhdcm+aOhygJEejUjU0GS6topUqmgfwVcsfUWbxfX2ZqB4gE19HATmiXoZtntgsSW7F
 Xt1Zy+EnxX/VWWfMBeLqzWpmg6nVwWZHGvvgw8nGch3967pUw6LPH8uwePqipPBasQ4xNbp/c
 PJ+4v09mMwrHNsCgwkTyuiuv/oBBSn9NkiN5MiQtUWz+MvYT1YfWlncu3HMPYc0Y46RmO9dSt
 UGK6BZ46+YGWA5Tdks5WrBXACs9aImWTtu1EkQ8XpqjfCoob3061I7ijh0OBAR/alU0BzUPUx
 Ssss3RxCuzwkHIh6EzaDeMxJWjq6OYh23t+2pPP5Y0bKhiONFwFYJo31A5XjokoiJzsbXf4VC
 luZbpgWz2A5nD3OqO2cvRgnVm3LdjG2AscuxAUZwKB37XAygmD9Vc2AcBAqJB7CY5i9t+RDLV
 SLq+Vm5SMmJFWVwglNzpxY7ziI7JyTyvlF29qvXPJm9W99TY6APF6KE26iwSu97pc5cnxIeVi
 bjsJrbaFfg+1/8siH9AMrOlvLsfO8UU1LYyK6Gagr3Z/7gReinEm2+Zq86OWrQqMhX9c1Yful
 We5sN4u3J/1vOUDzL773EFGOmYywZCsO/j+HdaHfGOhP17gT95ifi/50lv3SkqVuFzB9zWfWg
 p/R9lfbz/Iu6vqk6xsp/bn3ld/xbcVvwSo2leg==
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>

Update nvdimm option value in example command from "-machine pc,nvdimm"
to "-machine pc,nvdimm=on" as former complains with the below error:

"qemu-system-x86_64: -machine pc,nvdimm: Expected '=' after parameter 'nvdimm'"

Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Message-Id: <20210923103015.135262-1-pankaj.gupta.linux@gmail.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 docs/nvdimm.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/nvdimm.txt b/docs/nvdimm.txt
index 0aae682be3eb..fd7773dc5abb 100644
--- a/docs/nvdimm.txt
+++ b/docs/nvdimm.txt
@@ -15,7 +15,7 @@ backend (i.e. memory-backend-file and memory-backend-ram). A simple
 way to create a vNVDIMM device at startup time is done via the
 following command line options:
 
- -machine pc,nvdimm
+ -machine pc,nvdimm=on
  -m $RAM_SIZE,slots=$N,maxmem=$MAX_SIZE
  -object memory-backend-file,id=mem1,share=on,mem-path=$PATH,size=$NVDIMM_SIZE,readonly=off
  -device nvdimm,id=nvdimm1,memdev=mem1,unarmed=off
-- 
2.31.1


