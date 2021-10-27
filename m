Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A4C43CD5C
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 17:18:16 +0200 (CEST)
Received: from localhost ([::1]:54564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfkgy-0006Ke-0q
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 11:18:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arun.kka@samsung.com>)
 id 1mfbdA-0002iH-L2
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 01:37:44 -0400
Received: from mailout4.samsung.com ([203.254.224.34]:61892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arun.kka@samsung.com>)
 id 1mfbd3-0002k8-Et
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 01:37:44 -0400
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20211027053724epoutp0448ec73c77727721688b6f545a53f9f3a~xzIzQL0k61379413794epoutp04o
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 05:37:24 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20211027053724epoutp0448ec73c77727721688b6f545a53f9f3a~xzIzQL0k61379413794epoutp04o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1635313044;
 bh=gtiR3EPWMHo6cVaXCglwJpr5+UdpWLlKZLzqhe8tRwQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=rklycZZioesOmMNI6aW/J4SHqGNiAJvcjCiLlRffbyrHSpbUMzpNzqPa6I4ulCVXS
 Wv3dl64R4wMNetJuDA02aL/CfhTFR7T2yPWlX+c9vUMFsfRbLBAN9af6GqnyGrtBQ1
 U39h0Sf6k3K/bW4z8+EQ+NKczxTy+8c54R94GwLU=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTP id
 20211027053724epcas5p21fee699d6f3e39ad1af0c9de40a1dd67~xzIy1hZm31535615356epcas5p2t;
 Wed, 27 Oct 2021 05:37:24 +0000 (GMT)
Received: from epsmges5p1new.samsung.com (unknown [182.195.38.180]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4HfHWW3th6z4x9QW; Wed, 27 Oct
 2021 05:37:11 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
 epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 DF.5B.06423.385E8716; Wed, 27 Oct 2021 14:37:07 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
 20211027053640epcas5p18d4d8a13d7f3fbf07d2df00ed0274796~xzIKBYS8F2353623536epcas5p1D;
 Wed, 27 Oct 2021 05:36:40 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20211027053640epsmtrp203951a02e54dfab95754c18378ad5beb~xzIKAUdM_1927019270epsmtrp2G;
 Wed, 27 Oct 2021 05:36:40 +0000 (GMT)
X-AuditID: b6c32a49-b13ff70000001917-87-6178e5838aac
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 A7.86.08738.865E8716; Wed, 27 Oct 2021 14:36:40 +0900 (KST)
Received: from test.sa.corp.samsungelectronics.net (unknown [107.108.56.58])
 by epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20211027053637epsmtip2f8a8e2123087dbb61a18aee5ad568d75~xzIG1z2DU2211522115epsmtip2h;
 Wed, 27 Oct 2021 05:36:37 +0000 (GMT)
Date: Wed, 27 Oct 2021 11:06:21 +0530
From: Arun Kumar Kashinath Agasar <arun.kka@samsung.com>
To: Padmakar Kalghatgi <p.kalghatgi@samsung.com>
Subject: Re: [RFC PATCH: v4 2/2] separate utility for nvme-mi
Message-ID: <20211027053621.GC2177@test.sa.corp.samsungelectronics.net>
MIME-Version: 1.0
In-Reply-To: <20211026131358.GA23684@test.sa.corp.samsungelectronics.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrHJsWRmVeSWpSXmKPExsWy7bCmum7z04pEg5WrWS3efn3AZnFl/3lG
 i/0Hv7FaPL7zmd1i6Xx9i5ONe1gtJh26xmix5GKqxZoXyhbzbilbXP/5iN3iypRFzBaz3rWz
 WRzv3cFi8XrSf1aLm81P2RwEPH6ca2fzOLfjPLvHplWdbB5Prm1m8ni/7yqbR9+WVYwBbFHZ
 NhmpiSmpRQqpecn5KZl56bZK3sHxzvGmZgaGuoaWFuZKCnmJuam2Si4+AbpumTlAVysplCXm
 lAKFAhKLi5X07WyK8ktLUhUy8otLbJVSC1JyCkwK9IoTc4tL89L18lJLrAwNDIxMgQoTsjOm
 bm5nK3gzm7PiyuyNTA2Ma96wdTFyckgImEhsvTmTvYuRi0NIYDejxIxny5ghnE+MEp2PprFA
 OJ8ZJaY//csE0/Jh43Koll2MEnv7OlkhnEYmifN9bUAZDg4WAVWJ1ZMUQRrYBCwk5i34ChYW
 ETCQaN0TClLOLHCTSWLHrkuMIDXCArYST349B1vAK+Aucbn3PiuELShxcuYTFhCbU8BT4taa
 brB6UQEViSknt7GBDJIQOMEh8X7fIqjrXCR6F59lh7CFJV4d3wJlS0l8frcXqqGdUeLAtnNM
 EM4URonlG69CddtLXNwD8SezQIbEzY8ToeKyElNPrYOK80n0/n4CFeeV2DEPxlaSuLf1J9Q2
 CYk5V74zgrwsIeAhceuOJjyErny8zziBUX4Wku9mIVkHYVtJdH5oYp0F1M4sIC2x/B8HhKkp
 sX6X/gJG1lWMkqkFxbnpqcWmBYZ5qeXwSE/Oz93ECE7YWp47GO8++KB3iJGJg/EQowQHs5II
 7+V55YlCvCmJlVWpRfnxRaU5qcWHGE2BkTWRWUo0OR+YM/JK4g1NLA1MzMzMTCyNzQyVxHlP
 i2YnCgmkJ5akZqemFqQWwfQxcXBKNTDlOlVUTbytm1zdqhN97dePgLbjl0+Fuf5WNuIxTrvt
 +XpxfHCM9LGd8X+3JLx2T5vU8ztiX/Dua2wXhXv/mLsVXNLs4Wh0cz83ibeprq/z5BPd1V91
 ZklwqKmt8I+4HiKiIFxXvOairbXvxPNG/+7d29uooBfFdTieuWOxesOypfMXzL/cZcQq9PXp
 ZYv1vdLT9SZa8OSpK/rqTe7WvPfw3QFZvlN73+/xNlhwv3nmlAdWBRe3LaoIkfH/XrFZpr3r
 9eWeu5IKHVXnEn9H9YgdYjFezj0v2FWQJa52Xc3rzTE/Z9Q1J7LOui0q9GiG4U6rnSt+yy1d
 qs+TzvHma+mX+e622m7Twuce55a6f0iJpTgj0VCLuag4EQC61w3ZYQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupjkeLIzCtJLcpLzFFi42LZdlhJXjfjaUWiwetDUhZvvz5gs7iy/zyj
 xf6D31gtHt/5zG6xdL6+xcnGPawWkw5dY7RYcjHVYs0LZYt5t5Qtrv98xG5xZcoiZotZ79rZ
 LI737mCxeD3pP6vFzeanbA4CHj/OtbN5nNtxnt1j06pONo8n1zYzebzfd5XNo2/LKsYAtigu
 m5TUnMyy1CJ9uwSujN7+V0wFc2ZyVvz7+YyxgfHHS7YuRk4OCQETiQ8bl7N3MXJxCAnsYJSY
 23GcFSIhIfHjyzdGCFtYYuW/51BF/xklfhz5AFTEwcEioCqxepIiSA2bgIXEvAVf2UHCIgIG
 Eq17QkHKmQVuM0nc2nOOBaRGWMBW4smv50wgNq+Au8Tl3vusEDMbmSS23PnCDpEQlDg58wlY
 A7OAmcS8zQ+ZQYYyC0hLLP/HARLmFPCUuLWmG+w2UQEViSknt7FNYBSchaR7FpLuWQjdCxiZ
 VzFKphYU56bnFhsWGOWllusVJ+YWl+al6yXn525iBEeZltYOxj2rPugdYmTiYDzEKMHBrCTC
 e3leeaIQb0piZVVqUX58UWlOavEhRmkOFiVx3gtdJ+OFBNITS1KzU1MLUotgskwcnFINTImS
 GfvNGf2LZtW8lxLPMst6rXWnSfdTIF96dz7j2n1S74SfL1yklOGQ/cY9xPDg9ZcedybP7Xm2
 Tv3vktNWUWekBELjZmq9+rNUqOeXnijjbq3FG21eycbu81pcK8n49sgUUb99vsIF9w4JcX36
 kelUun/Ch6WbPOzVNn546Nw7tfJQtNrzhXe7P2Z6t3hYLjq6aJVUdKAJ46mfyZuv23pdV5kw
 YbKl6ueLAnu23y9a1Zw3w6xbrNyiREvX2NCyXvPcu72nso822b20etW6jWmyE+OZAs/aZ44q
 BuZbWU4+M8mYJLu2Rtxao+B9v/jvhuVer1vLvHJ3TeQ4cdy/r18jIrPn+vQ/PKsOz42WUGIp
 zkg01GIuKk4EAFB+kTUhAwAA
X-CMS-MailID: 20211027053640epcas5p18d4d8a13d7f3fbf07d2df00ed0274796
X-Msg-Generator: CA
Content-Type: multipart/mixed;
 boundary="----aHyYs37HgbwNH3LE6ZzmTfiBsTB6hVarzLo_OvI4GdRlgC_p=_5a2ea_"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210803080737epcas5p1c9bd6ecde8700d1194748533a3812db6
References: <CGME20210803080737epcas5p1c9bd6ecde8700d1194748533a3812db6@epcas5p1.samsung.com>
 <1627975487-1640-1-git-send-email-p.kalghatgi@samsung.com>
 <YVPtogzu2OSh/1yK@apples.localdomain>
 <20211026131358.GA23684@test.sa.corp.samsungelectronics.net>
Received-SPF: pass client-ip=203.254.224.34; envelope-from=arun.kka@samsung.com;
 helo=mailout4.samsung.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 27 Oct 2021 10:28:03 -0400
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
Cc: fam@euphon.net, kwolf@redhat.com, jg123.choi@samsung.com,
 qemu-block@nongnu.org, k.jensen@samsung.com, d.palani@samsung.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, kbusch@kernel.org,
 u.kishore@samsung.com, stefanha@redhat.com, Klaus Jensen <its@irrelevant.dk>,
 javier.gonz@samsung.com, prakash.v@samsung.com, mohit.kap@samsung.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

------aHyYs37HgbwNH3LE6ZzmTfiBsTB6hVarzLo_OvI4GdRlgC_p=_5a2ea_
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Disposition: inline

This patch separates out the mi plugin from nvme-cli tool
and I have created a stand alone utility to test the mi 
functionalities. 

As mentioned in the QEMU patch, commands will be sent to
emulated mi device in QEMU and response will be recieved 
from another i2c slave which has been added newly. The 
i2c address for emulated mi device and the new i2c slave
is 0x15 and 0x16 respectively.

   The patch is as below:
=======================================================

diff --git
a/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/Documentation/nvme-mi-chspoll.txt
b/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/Documentation/nvme-mi-chspoll.txt
new file mode 100644
index 0000000..61cd36e
--- /dev/null
+++
b/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/Documentation/nvme-mi-chspoll.txt
@@ -0,0 +1,36 @@
+nvme-mi-chspoll(1)
+==================
+
+NAME
+----
+nvme-mi-chspoll - NVMe MI Controller Health Status Poll Command
+
+SYNOPSIS
+--------
+[verse]
+'nvme mi chspoll' [--cdw0=<NUM>, -c <NUM>]
+				   [--cdw1=<NUM>, -d <NUM>]
+
+DESCRIPTION
+-----------
+For the NVMe-MI device given, issues the Controller Health Status Poll
command with the
+requested dwords. The command requests health status data for the
controller requested.
+
+OPTIONS
+-c <NUM>::
+--cdw0=<NUM>::
+	DWord 0 for Controller Health Status Poll.
+
+-d <NUM>::
+--cdw1=<NUM>::
+	DWord 1 for Controller Health Status Poll.
+
+
+EXAMPLES
+--------
+* Send a Controller Health Status Poll command to get
+health attributes for the controller:
++
+---------------------------
+# nvme mi chspoll -c 0 -d 0
+---------------------------
diff --git
a/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/Documentation/nvme-mi-configget.txt
b/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/Documentation/nvme-mi-configget.txt
new file mode 100644
index 0000000..0ccfad1
--- /dev/null
+++
b/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/Documentation/nvme-mi-configget.txt
@@ -0,0 +1,46 @@
+nvme-mi-configget(1)
+=======================
+
+NAME
+----
+nvme-mi-configget - NVMe MI Configuration GET
+
+SYNOPSIS
+--------
+[verse]
+'configget' [--configid=<NUM>, -c <NUM>]
+				   [--portid=<NUM>, -p <NUM>]
+
+DESCRIPTION
+-----------
+For the NVMe-MI device given, issues the Configuration GET command with
the
+requested action. The command allows the requester to read the current 
+configuration of a responder.
+
+OPTIONS
+-c <NUM>::
+--configid=<NUM>::
+	Configuration Identifier.
+
+-p <NUM>::
+--portid=<NUM>::
+	Port Identifier.
+
+EXAMPLES
+--------
+* Send a Configuration GET command to get
+current frequency of the SMBus port specified:
++
+-------------------------------------
+# readnvmemids -c 1 -p 0
+-------------------------------------
++
+
+* Send a Configuration GET command to get
+current MCTP Transmission unit of the 
+port specified:
++
+-------------------------------------
+# nvme mi readnvmemids -c 3 -p 0
+-------------------------------------
+
diff --git
a/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/Documentation/nvme-mi-configset.txt
b/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/Documentation/nvme-mi-configset.txt
new file mode 100644
index 0000000..5912c68
--- /dev/null
+++
b/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/Documentation/nvme-mi-configset.txt
@@ -0,0 +1,56 @@
+nvme-mi-configset(1)
+=======================
+
+NAME
+----
+nvme-mi-configset - NVMe MI Configuration Set
+
+SYNOPSIS
+--------
+[verse]
+'configset' [--configid=<NUM>, -c <NUM>]
+			[--portid=<NUM>, -p <NUM>]
+            [--smbusfreq=<NUM>, -f <NUM>]
+            [--mctpunitsz=<NUM>, -s <NUM>]
+
+DESCRIPTION
+-----------
+For the NVMe-MI device given, issues the Configuration Set command with
the
+requested action. The command allows the requester to modify the
current 
+configuration of a responder.
+
+OPTIONS
+-c <NUM>::
+--configid=<NUM>::
+	Configuration Identifier.
+
+-p <NUM>::
+--portid=<NUM>::
+	Port Identifier.
+
+-f <NUM>::
+--smbusfreq=<NUM>::
+    SMBus frequency.
+
+-s <NUM>::
+--mctpunitsz=<NUM>::
+	MCTP Transmission Unit Size.
+
+EXAMPLES
+--------
+* Send a Configuration Set command to set
+new frequency for the SMBus port specified:
++
+-------------------------------------
+# configset -c 1 -p 0 -f 100 -s 0
+-------------------------------------
++
+
+* Send a Configuration Set command to set
+ the new MCTP Transmission unit of the 
+port specified:
++
+-------------------------------------
+# nvme mi readnvmemids -c 3 -p 0 -f 0 -s 68
+-------------------------------------
+
diff --git
a/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/Documentation/nvme-mi-getfeature.txt
b/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/Documentation/nvme-mi-getfeature.txt
new file mode 100644
index 0000000..7893aca
--- /dev/null
+++
b/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/Documentation/nvme-mi-getfeature.txt
@@ -0,0 +1,53 @@
+nvme-mi-getfeature(1)
+==================
+
+NAME
+----
+nvme-mi-getfeature - GET Features Command
+
+SYNOPSIS
+--------
+[verse]
+'getfeature' [--namespace_id=<NUM>, -n <NUM>]
+			 [--feature_id=<NUM>, -f <NUM>]
+			 [--sel=<NUM>, -s <NUM>]
+			 [--data_len=<NUM>, -l <NUM>]
+			 [--cdw11=<NUM>, -c <NUM>]
+
+DESCRIPTION
+-----------
+The GET Features Command retrievs the attributes
+of the Feature specified.
+
+OPTIONS
+-n <NUM>::
+--namespace_id=<NUM>::
+	Namesapce Identifier.
+
+-f <NUM>::
+--feature_id=<NUM>::
+	Feature Identifier.
+
+-s <NUM>::
+--sel=<NUM>::
+	Select.
+
+-l <NUM>::
+--data_len=<NUM>::
+	Data Length.
+
+-c <NUM>::
+--cdw11=<NUM>::
+	Command Dword.
+
+
+EXAMPLES
+--------
+* Send a GET Feature command to get
+attributes of feature specified:
++
+----------------------
+# getfeature -n 0 -f 0 -s 0 -l 0 -c 0
+----------------------
++
+
diff --git
a/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/Documentation/nvme-mi-getlog.txt
b/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/Documentation/nvme-mi-getlog.txt
new file mode 100644
index 0000000..c470d22
--- /dev/null
+++
b/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/Documentation/nvme-mi-getlog.txt
@@ -0,0 +1,56 @@
+nvme-mi-getlog(1)
+==================
+
+NAME
+----
+nvme-mi-getlog - GET Log Page command
+
+SYNOPSIS
+--------
+[verse]
+'getlog' [--log_id=<NUM>, -i <NUM>]
+         [--log_len=<NUM>, -l <NUM>]
+         [--lpo=<NUM>, -o <NUM>]
+         [--lsp=<NUM>, -s <NUM>]
+         [--rae=<NUM>, -r <NUM>]
+         [--uuid_index=<NUM>, -U <NUM>]
+
+DESCRIPTION
+-----------
+The command returns the data buffer 
+containing the log page requested.
+
+OPTIONS
+-i <NUM>::
+--log_id=<NUM>::
+	Log Identifier.
+
+-l <NUM>::
+--log_len=<NUM>::
+	Log Length.
+
+-o <NUM>::
+--lpo=<NUM>::
+	Log Page Offset.
+
+-s <NUM>::
+--lsp=<NUM>::
+	Log Specific Field.
+
+-r <NUM>::
+--rae=<NUM>::
+	Retain Asynchronous Event.
+
+-U <NUM>::
+--uuid_index=<NUM>::
+    UUID Index.
+
+EXAMPLES
+--------
+* Send a GET Log command to get
+log page of specified page:
++
+----------------------
+# getlog -i 255 -l 0 -o 0 -s 0 -r 0 -U 0
+----------------------
+
diff --git
a/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/Documentation/nvme-mi-identify.txt
b/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/Documentation/nvme-mi-identify.txt
new file mode 100644
index 0000000..878d977
--- /dev/null
+++
b/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/Documentation/nvme-mi-identify.txt
@@ -0,0 +1,38 @@
+nvme-mi-identify(1)
+==================
+
+NAME
+----
+nvme-mi-identify - Identify command
+
+SYNOPSIS
+--------
+[verse]
+'identify' [--cns=<NUM>, -c <NUM>]
+		   [--cntid=<NUM>, -C <NUM>]
+
+DESCRIPTION
+-----------
+The command requests information about the NVM 
+Subsystem, controller or namespace.
+
+OPTIONS
+-c <NUM>::
+--cns=<NUM>::
+	Controller or Namespace structure.
+
+-C <NUM>::
+--cntid=<NUM>::
+	Controller Identifier.
+
+
+EXAMPLES
+--------
+* Send a Identify command to get Identify 
+Namesapce Data Structe for the specified 
+NSID:
++
+----------------------
+# identify -c 0 -C 0
+----------------------
+
diff --git
a/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/Documentation/nvme-mi-readnvmemids.txt
b/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/Documentation/nvme-mi-readnvmemids.txt
new file mode 100644
index 0000000..68d8add
--- /dev/null
+++
b/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/Documentation/nvme-mi-readnvmemids.txt
@@ -0,0 +1,51 @@
+nvme-mi-readnvmemids(1)
+=======================
+
+NAME
+----
+nvme-mi-readnvmemids - Read NVMe MI Data Structure command
+
+SYNOPSIS
+--------
+[verse]
+'nvme mi readnvmemids' [--ctrlid=<NUM>, -c <NUM>]
+				   [--portid=<NUM>, -p <NUM>]
+				   [--dtyp=<NUM>, -d <NUM>]
+
+DESCRIPTION
+-----------
+For the NVMe-MI device given, issues the ReadNVMe MI Data Structure
command with the
+requested action. The command requests data related to NVM Subsystem,
the Management
+Endpoint or the NVM Controllers.
+
+OPTIONS
+-c <NUM>::
+--ctrlid=<NUM>::
+	Controller Identifier.
+
+-p <NUM>::
+--portid=<NUM>::
+	Port Identifier.
+
+-d <NUM>::
+--dtyp=<NUM>::
+	Data Structure Type.
+
+
+EXAMPLES
+--------
+* Send a Read NVMe MI Data Structure command to get
+NVM Subsystem Information:
++
+-------------------------------------
+# nvme mi readnvmemids -c 0 -p 0 -d 0
+-------------------------------------
++
+
+* Send a Read NVMe MI Data Structure command to get
+NVM Subsystem Information:
++
+-------------------------------------
+# nvme mi readnvmemids -c 0 -p 0 -d 4
+-------------------------------------
+
diff --git
a/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/Documentation/nvme-mi-shspoll.txt
b/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/Documentation/nvme-mi-shspoll.txt
new file mode 100644
index 0000000..50cb280
--- /dev/null
+++
b/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/Documentation/nvme-mi-shspoll.txt
@@ -0,0 +1,43 @@
+nvme-mi-shspoll(1)
+==================
+
+NAME
+----
+nvme-mi-shspoll - NVMe MI Subsystem Health Status Poll Command
+
+SYNOPSIS
+--------
+[verse]
+'nvme mi shspoll' [--ctrlid=<NUM>, -c <NUM>]
+
+DESCRIPTION
+-----------
+For the NVMe-MI device given, issues the Subsystem Health Status Poll
command.
+The command requests Health status such as composite temprature, Smart
warnings
+and Percentage life used etc for the NVM Subsystem.
+
+OPTIONS
+-c <NUM>::
+--cs=<NUM>::
+	Clear Status.
+
+EXAMPLES
+--------
+* Send a NVM Subsystem Health Status Poll command to get
+health attributes for the NVM Subsystem:
++
+----------------------
+# nvme mi shspoll -c 0
+----------------------
++
+
+* Send a NVM Subsystem Health Status Poll command to get
+health attributes for the NVM Subsystem:
++
+----------------------
+# nvme mi shspoll -c 1
+----------------------
+
+NVME
+----
+Part of nvme-cli
diff --git
a/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/Documentation/nvme-mi-vpdread.txt
b/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/Documentation/nvme-mi-vpdread.txt
new file mode 100644
index 0000000..4336b36
--- /dev/null
+++
b/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/Documentation/nvme-mi-vpdread.txt
@@ -0,0 +1,40 @@
+nvme-mi-vpdread(1)
+==================
+
+NAME
+----
+nvme-mi-vpdread - NVMe MI VPD Read
+
+SYNOPSIS
+--------
+[verse]
+'vpdread' [--dofst=<NUM>, -o <NUM>]
+		  [--dlen=<NUM>,  -l <NUM>]
+		  [--data=<FILE>, -d <FILE>]
+
+DESCRIPTION
+-----------
+For the NVMe-MI device given, issues the VPD Read command with the
+requested action.The command is used to get vital product data.
+
+OPTIONS
+-o <NUM>::
+--dofst=<NUM>::
+	Data offset.
+
+-l <NUM>::
+--dlen=<NUM>::
+	Data length.
+
+-d <FILE>::
+--data=<FILE>::
+	Data filename.
+
+EXAMPLES
+--------
+* Send a VPD Read command to get 
+vital product data.
++
+----------------------
+# vpdread -o 0 -l 100 -d "filepath" 
+----------------------
diff --git
a/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/Documentation/nvme-mi-vpdwrite.txt
b/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/Documentation/nvme-mi-vpdwrite.txt
new file mode 100644
index 0000000..5f61235
--- /dev/null
+++
b/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/Documentation/nvme-mi-vpdwrite.txt
@@ -0,0 +1,40 @@
+nvme-mi-vpdwrite(1)
+==================
+
+NAME
+----
+nvme-mi-vpdwrite - NVMe MI VPD Write
+
+SYNOPSIS
+--------
+[verse]
+'vpdwrite' [--dofst=<NUM>, -o <NUM>]
+		  [--dlen=<NUM>,  -l <NUM>]
+		  [--data=<FILE>, -d <FILE>]
+
+DESCRIPTION
+-----------
+For the NVMe-MI device given, issues the VPD Write command with the
+requested action. The command is used to update vital product data.
+
+OPTIONS
+-o <NUM>::
+--dofst=<NUM>::
+	Data offset.
+
+-l <NUM>::
+--dlen=<NUM>::
+	Data length.
+
+-d <FILE>::
+--data=<FILE>::
+	Data filename.
+
+EXAMPLES
+--------
+* Send a VPD Read command to update
+vital product data.
++
+----------------------
+# vpdread -o 0 -l 0 -d "filepath" 
+----------------------
diff --git
a/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/Makefile
b/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/Makefile
new file mode 100644
index 0000000..166f619
--- /dev/null
+++ b/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/Makefile
@@ -0,0 +1,55 @@
+CFLAGS ?= -O2 -g -Wall -Werror
+override CFLAGS += -std=gnu99 -I.
+override CPPFLAGS += -D_GNU_SOURCE -D__CHECK_ENDIAN__
+NVME-MI = nvme-mi
+INSTALL ?= install
+
+INC=-Iutil
+
+AUTHOR=Arun Kumar Kashinath Agasar <arun.kka@samsung.com>
+
+ifneq ($(findstring $(MAKEFLAGS),s),s)
+ifndef V
+	QUIET_CC	= @echo '   ' CC $@;
+endif
+endif
+
+default: $(NVME-MI)
+
+NVME_DPKG_VERSION=1~`lsb_release -sc`
+
+OBJS := plugin.o \
+
+UTIL_OBJS := util/argconfig.o util/suffix.o\
+
+
+MI_OBJS :=					\
+	mi/mi-util/hal/mi-nvme-hal-main.o 		\
+	mi/mi-util/hal/mi-nvme-qemu/mi-nvme-qemu.o \
+	mi/mi-util/mi-nvme-util-base.o			\
+	mi/mi-util/mi-nvme-util-crc.o 			\
+	mi/mi-util/mi-nvme-util-tool.o 			\
+	mi/mi-nvme-cmd.o
+
+nvme-mi: mi_nvme.c mi_nvme.h $(OBJS) $(MI_OBJS) $(UTIL_OBJS)
+	$(QUIET_CC)$(CC) $(CPPFLAGS) $(CFLAGS) $(INC) $< -o $(NVME-MI)
$(OBJS) $(MI_OBJS) $(UTIL_OBJS) $(LDFLAGS)
+
+verify-no-dep: mi_nvme.c mi_nvme.h $(OBJS) $(UTIL_OBJS)
+	$(QUIET_CC)$(CC) $(CPPFLAGS) $(CFLAGS) $(INC) $< -o $@ $(OBJS)
$(UTIL_OBJS) $(LDFLAGS)
+
+nvme-mi.o: mi_nvme.c mi_nvme.h util/argconfig.h util/suffix.h
+	$(QUIET_CC)$(CC) $(CPPFLAGS) $(CFLAGS) $(INC) -c $<
+
+%.o: %.c %.h mi_nvme.h util/argconfig.h
+	$(QUIET_CC)$(CC) $(CPPFLAGS) $(CFLAGS) $(INC) -o $@ -c $<
+
+%.o: %.c mi_nvme.h util/argconfig.h
+	$(QUIET_CC)$(CC) $(CPPFLAGS) $(CFLAGS) $(INC) -o $@ -c $<
+
+doc: $(NVME-MI)
+	$(MAKE) -C Documentation
+
+all: doc
+
+clean:
+	$(RM) $(NVME-MI) $(MI_OBJS) $(UTIL_OBJS) *~ a.out *.tar*
nvme.spec version control nvme-*.deb 70-nvmf-autoconnect.conf
diff --git a/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/cmd.h
b/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/cmd.h
new file mode 100644
index 0000000..cd1183a
--- /dev/null
+++ b/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/cmd.h
@@ -0,0 +1,10 @@
+#ifndef _CMD_H
+#define _CMD_H
+
+#undef PLUGIN
+#define PLUGIN(n, c)
+
+#undef COMMAND_LIST
+#define COMMAND_LIST(args...)
+
+#endif
diff --git
a/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/cmd_handler.h
b/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/cmd_handler.h
new file mode 100644
index 0000000..c5cfceb
--- /dev/null
+++ b/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/cmd_handler.h
@@ -0,0 +1,109 @@
+/*
+ * Stage 1
+ *
+ * Define function prototypes.
+ */
+
+#undef NAME
+#define NAME(n, d, v)
+
+#undef ENTRY
+#define ENTRY(n, h, f, ...) \
+static int f(int argc, char **argv, struct command *command,  \
+    struct plugin *plugin);
+
+#undef COMMAND_LIST
+#define COMMAND_LIST(args...) args
+
+#undef PLUGIN
+#define PLUGIN(name, cmds) cmds
+
+#include CMD_INCLUDE(CMD_INC_FILE)
+
+/*
+ * Stage 2
+ *
+ * Define command structures.
+ */
+
+#undef NAME
+#define NAME(n, d, v)
+
+#undef ENTRY_W_ALIAS
+#define ENTRY_W_ALIAS(n, h, f, a)   \
+static struct command f ## _cmd = { \
+    .name = n,          \
+    .help = h,          \
+    .fn = f,            \
+    .alias = a,         \
+};
+
+#undef ENTRY_WO_ALIAS
+#define ENTRY_WO_ALIAS(n, h, f)     \
+    ENTRY_W_ALIAS(n, h, f, NULL)
+
+#undef ENTRY_SEL
+#define ENTRY_SEL(n, h, f, a, CMD, ...) CMD
+
+#undef ENTRY
+#define ENTRY(...)     \
+    ENTRY_SEL(__VA_ARGS__, ENTRY_W_ALIAS, ENTRY_WO_ALIAS)(__VA_ARGS__)
+
+#undef COMMAND_LIST
+#define COMMAND_LIST(args...) args
+
+#undef PLUGIN
+#define PLUGIN(name, cmds) cmds
+
+#include CMD_INCLUDE(CMD_INC_FILE)
+
+/*
+ * Stage 3
+ *
+ * Generate list of commands for the plugin.
+ */
+
+#undef NAME
+#define NAME(n, d, v)
+
+#undef ENTRY
+#define ENTRY(n, h, f, ...) &f ## _cmd,
+
+#undef COMMAND_LIST
+#define COMMAND_LIST(args...)           \
+static struct command *commands[] = {   \
+    args                                \
+    NULL,                               \
+};
+
+#undef PLUGIN
+#define PLUGIN(name, cmds) cmds
+
+#include CMD_INCLUDE(CMD_INC_FILE)
+
+/*
+ * Stage 4
+ *
+ * Define and register plugin
+ */
+
+#undef NAME
+#define NAME(n, d, v) .name = n, .desc = d, .version = v,
+
+#undef COMMAND_LIST
+#define COMMAND_LIST(args...)
+
+#undef PLUGIN
+#define PLUGIN(name, cmds)              \
+static struct plugin plugin = {         \
+    name                                \
+    .commands = commands                \
+};                                      \
+   \
+static void init(void) __attribute__((constructor));    \
+static void init(void)                                  \
+{                                                       \
+    register_extension(&plugin);                        \
+}
+
+#include CMD_INCLUDE(CMD_INC_FILE)
diff --git
a/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/define_cmd.h
b/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/define_cmd.h
new file mode 100644
index 0000000..7379f5e
--- /dev/null
+++ b/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/define_cmd.h
@@ -0,0 +1,19 @@
+#ifdef CREATE_CMD
+#undef CREATE_CMD
+
+
+#define __stringify_1(x...) #x
+#define __stringify(x...)  __stringify_1(x)
+#define __CMD_INCLUDE(cmd) __stringify(cmd.h)
+#define CMD_INCLUDE(cmd) __CMD_INCLUDE(cmd)
+
+#define CMD_HEADER_MULTI_READ
+
+#include CMD_INCLUDE(CMD_INC_FILE)
+
+#include "cmd_handler.h"
+
+#undef CMD_HEADER_MULTI_READ
+
+#define CREATE_CMD
+#endif
diff --git
a/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/mi/mi-nvme-cmd.c
b/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/mi/mi-nvme-cmd.c
new file mode 100644
index 0000000..8852004
--- /dev/null
+++
b/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/mi/mi-nvme-cmd.c
@@ -0,0 +1,126 @@
+/*
+ * Copyright (C) 2021 Samsung Electronics Inc. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License version
+ * 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ *
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+ * mi-nvme-cmd.c - Implementation of NVMe Management Interface commands
in Nvme
+ *
+ * Developer: Mohit Kapoor <mohit.kap@samsung.com>
+ */
+
+#include "mi-nvme-cmd.h"
+
+uint32_t gettransmissionunitsize()
+{
+    return MCTP_TRANS_UNIT_SIZE_VAL_DEF;
+}
+
+int executecommand(__u8 *cmdobj)
+{
+    struct nvme_mi_message message;
+    memset(&message, 0, sizeof(struct nvme_mi_message));
+    nvme_mi_admin_message adminmessage;
+    memset(&adminmessage, 0, sizeof(nvme_mi_admin_message));
+    bool ret = false;
+    uint32_t RequestDataSize = 0;
+    struct gencmd_nvmemi *micmd;
+    struct gencmd_nvmemi_admin *miadmincmd;
+    uint32_t uiMCTP_TUS = gettransmissionunitsize();
+
+    ret = initialize(uiMCTP_TUS);
+    if (ret == false) {
+        return -1;
+    }
+
+    streply.length = 0;
+    streply.errorcode = 0;
+    memset(streply.replybuf, 0, sizeof(streply.replybuf));
+    memcpy(&message.msgPld, cmdobj, sizeof(struct nvme_mi_message) -
8);
+
+    /*Check if the incoming command is an MI/MI-Admin Command*/
+    if (message.msgPld.nvme_mi_message_header & 0x1000) {
+        miadmincmd = (struct gencmd_nvmemi_admin *)cmdobj;
+        memcpy(&adminmessage.msgPld, cmdobj,
sizeof(nvme_mi_admin_message) - 8);
+        if (miadmincmd->buf != NULL) {
+            adminmessage.msgPld.buffer = miadmincmd->buf;
+        }
+        ret = execute_nvme_mi_admin_command(adminmessage, &(streply),
+            REPLY_BUFFER_SIZE, miadmincmd->dlen);
+    } else if (message.msgPld.nvme_mi_message_header & 0x800) {
+        micmd = (struct gencmd_nvmemi *)cmdobj;
+        if (micmd->buf != NULL) {
+            message.msgPld.buffer = micmd->buf;
+        }
+        ret = execute_nvme_mi_command(message, &(streply),
+            REPLY_BUFFER_SIZE, RequestDataSize);
+    }
+
+    if (!ret) {
+        return -1;
+    } else {
+        return 0;
+    }
+}
+
+int getresponsedata(uint8_t *buf, uint32_t size, bool ismicmd)
+{
+    uint32_t offset = 0;
+    uint32_t length = gettransmissionunitsize() - NVME_MI_HEADER_SIZE;
+    uint32_t bytesread = 0;
+
+    if (buf == NULL) {
+        printf("Error : getresponsedata input buf is NULL\n");
+        return -1;
+    }
+
+    if (ismicmd == true) {
+        offset = MCTP_PKT_HDR_SIZE + NVME_MI_STATUS_SIZE +
+            NVME_MI_HEADER_SIZE;
+        length = gettransmissionunitsize() - NVME_MI_HEADER_SIZE -
+            NVME_MI_STATUS_SIZE;
+        streply.length = streply.length -  NVME_MI_HEADER_SIZE -
+            NVME_MI_STATUS_SIZE - CRC_SIZE;
+    } else {
+        offset = MCTP_PKT_HDR_SIZE + NVME_MI_STATUS_SIZE +
+            NVME_MI_HEADER_SIZE + CQENTRY_SIZE;
+        length = gettransmissionunitsize() - NVME_MI_HEADER_SIZE -
+            NVME_MI_STATUS_SIZE - CQENTRY_SIZE;
+        streply.length = streply.length - NVME_MI_HEADER_SIZE -
+            NVME_MI_STATUS_SIZE - CRC_SIZE - CQENTRY_SIZE;
+    }
+
+    if (length > size) {
+        length = size;
+    }
+
+    while (bytesread < streply.length) {
+        memcpy(buf + bytesread, streply.replybuf + offset, length);
+        offset += length + MCTP_PKT_HDR_SIZE;
+        bytesread += length;
+
+        if (bytesread + gettransmissionunitsize() > streply.length) {
+            length = streply.length - bytesread;
+        } else {
+            length = gettransmissionunitsize();
+        }
+    }
+    return 0;
+}
+
+int getresponsemessage(uint8_t *buf, uint32_t size)
+{
+    if (buf == NULL) {
+        return -1;
+    } else {
+        memcpy(buf, streply.replybuf + MCTP_PKT_HDR_SIZE, size);
+        return 0;
+    }
+}
diff --git
a/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/mi/mi-nvme-cmd.h
b/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/mi/mi-nvme-cmd.h
new file mode 100644
index 0000000..dafe8a6
--- /dev/null
+++
b/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/mi/mi-nvme-cmd.h
@@ -0,0 +1,33 @@
+/*
+ * Copyright (C) 2021 Samsung Electronics Inc. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License version
+ * 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ *
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+ * mi-nvme-cmd.h - Implementation of NVMe Management Interface commands
in Nvme
+ *
+ * Developer: Mohit Kapoor <mohit.kap@samsung.com>
+ */
+
+#ifndef _MI_NVME__CMD_H_
+#define _MI_NVME_CMD_H_
+
+#include "mi-nvme-struct.h"
+#include "mi-util/mi-nvme-util-base.h"
+#include "mi-util/mi-nvme-util-tool.h"
+
+reply_buffer_struct streply;
+
+uint32_t gettransmissionunitsize();
+int executecommand(__u8 *cmdobj);
+int getresponsedata(uint8_t *buf, uint32_t size, bool flagmi);
+int getresponsemessage(uint8_t *buf, uint32_t size);
+
+#endif
diff --git
a/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/mi/mi-nvme-struct.h
b/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/mi/mi-nvme-struct.h
new file mode 100644
index 0000000..b8eea2f
--- /dev/null
+++
b/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/mi/mi-nvme-struct.h
@@ -0,0 +1,279 @@
+/*
+ * Copyright (C) 2021 Samsung Electronics Inc. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License version
+ * 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ *
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+ * mi-nvme-struct.h - Implementation of NVMe Management Interface
commands in NVMe.
+ * This file contains required header and response structures for MI
commands.
+ *
+ * Developer: Mohit Kapoor <mohit.kap@samsung.com>
+              Arun Kumar Kashinath Agasar <arun.kka@samsung.com>
+ */
+
+#ifndef _MI_NVME__HEADER_H_
+#define _MI_NVME_HEADER_H_
+
+#include <stdint.h>
+#include <stdbool.h>
+#include <string.h>
+#include <unistd.h>
+#include <stdio.h>
+#include <linux/types.h>
+
+#define MCTP_PKT_HDR_SIZE 8
+#define NVME_MI_HEADER_SIZE 4
+#define NVME_MI_STATUS_SIZE 4
+#define CQENTRY_SIZE 12
+#define MCTP_TRANS_UNIT_SIZE_VAL_DEF 64
+
+enum nvmemi_opcode {
+    nvmemi_cmd_readnvmemids = 0x00,
+    nvmemi_cmd_subsyshealthstpoll = 0x01,
+    nvmemi_cmd_chsp = 0x02,
+    nvmemi_cmd_configset = 0x03,
+    nvmemi_cmd_configget = 0x04,
+    nvmemi_cmd_vpdread = 0x05,
+    nvmemi_cmd_vpdwrite = 0x06
+};
+
+typedef enum _MI_COMMAND_TYPE {
+    COMMAND_TYPE_MI,
+    COMMAND_TYPE_MI_ADMIN
+} MI_COMMAND_TYPE;
+
+enum CONFIGURATION_IDENTIFIER {
+    RESERVED,
+    SMBUS_I2C_FREQ,
+    HEALTH_STATUS_CHG,
+    MCTP_TRANS_UNIT_SIZE,
+};
+
+struct nvmemi_message_header_struct {
+    uint32_t message_type:7;
+    uint32_t ic:1;
+    uint32_t csi:1;
+    uint32_t reserved:2;
+    uint32_t nmimt:4;
+    uint32_t ror:1;
+    uint32_t reserved1:16;
+};
+
+/*Generic command Structure for NVMe MI Commands*/
+struct gencmd_nvmemi {
+    struct nvmemi_message_header_struct msg_header;
+    uint8_t opcode;
+    uint8_t reserved0;
+    uint8_t reserved1;
+    uint8_t reserved2;
+    uint32_t cdw0;
+    uint32_t cdw1;
+    uint8_t *buf;
+    uint32_t mic;
+};
+
+/*Generic command Structure for NVMe MI Admin Commands*/
+struct gencmd_nvmemi_admin {
+    struct nvmemi_message_header_struct msg_header;
+    uint8_t opcode;
+    uint8_t cflgs;
+    uint16_t ctlid;
+    uint32_t nsid;
+    uint32_t cdw2;
+    uint32_t cdw3;
+    uint32_t cdw4;
+    uint32_t cdw5;
+    uint32_t dofst;
+    uint32_t dlen;
+    uint32_t cdw8;
+    uint32_t cdw9;
+    uint32_t cdw10;
+    uint32_t cdw11;
+    uint32_t cdw12;
+    uint32_t cdw13;
+    uint32_t cdw14;
+    uint32_t cdw15;
+    uint8_t *buf;
+    uint32_t mic;
+};
+
+struct admin_cmd_resp_dw3 {
+    uint16_t cid;
+    uint16_t p:1;
+    uint16_t sc:8;
+    uint16_t sct:3;
+    uint16_t crd:2;
+    uint16_t m:1;
+    uint16_t dnr:1;
+};
+
+struct nvme_admin_cmd_resp_status {
+    uint8_t msg_type:7;
+    uint8_t ic:1;
+
+    uint8_t csi:1;
+    uint8_t reserved:2;
+    uint8_t nvme_mi_msg_type:4;
+    uint8_t ror:1;
+
+    uint16_t reserved1;
+
+    uint32_t status:8;
+    uint32_t nvme_mgmt_response:24;
+
+    uint32_t cqdw0;
+    uint32_t cqdw1;
+    struct admin_cmd_resp_dw3 cqdw3;
+};
+
+struct nvme_mi_cmd_resp {
+    uint8_t msg_type:7;
+    uint8_t ic:1;
+
+    uint8_t csi:1;
+    uint8_t reserved:2;
+    uint8_t nvme_mi_msg_type:4;
+    uint8_t ror:1;
+
+    uint16_t reserved1;
+
+    uint32_t status:8;
+    uint32_t nvme_mgmt_response:24;
+};
+
+struct read_nvme_mi_data_struct_resp {
+    uint16_t resp_data_len;
+    uint8_t reserved;
+};
+
+struct smbus_i2c_freq_cfgget_resp {
+    uint8_t smbus_i2c_freq:4;
+    uint8_t reserved1:4;
+    uint16_t reserved2;
+};
+
+struct mctp_tus_cfgget_resp {
+    uint16_t mctp_trans_unit_size;
+    uint8_t reserved;
+};
+
+struct nvme_subsys_info_data {
+    uint8_t nump;
+    uint8_t mjr;
+    uint8_t mnr;
+    uint8_t reserved[29];
+};
+
+struct option_sup_cmd_struct {
+    uint8_t cmdtype;
+    uint8_t opc;
+};
+
+struct option_sup_cmd_list_struct {
+    uint16_t numcmd;
+    struct option_sup_cmd_struct cmdstruct[2047];
+};
+
+struct nss_status_struct {
+    uint8_t reserved:2;
+    uint8_t port1_pla:1;
+    uint8_t port2_pla:1;
+    uint8_t reset_not_req:1;
+    uint8_t drive_func:1;
+    uint8_t reserved1:2;
+};
+
+struct comp_ctrl_status_struct {
+    uint16_t ready:1;
+    uint16_t cfs:1;
+    uint16_t shn_sts:2;
+    uint16_t nssr_occured:1;
+    uint16_t ceco:1;
+    uint16_t nsac:1;
+    uint16_t fwact:1;
+    uint16_t cs_ch:1;
+    uint16_t ctc:1;
+    uint16_t percentage_used:1;
+    uint16_t available_spare:1;
+    uint16_t critical_warning:1;
+    uint16_t reserved:3;
+};
+
+struct nvm_subsys_health_struct {
+    struct nss_status_struct nss_status;
+    uint8_t smart_warnings;
+    uint8_t composite_temp;
+    uint8_t per_drv_life_used;
+    struct comp_ctrl_status_struct  comp_ctrl_status;
+    uint16_t reserved;
+};
+
+struct ctrl_health_status_poll_resp {
+    __u16 reserved;
+    __u8 rent;
+};
+
+struct cwarn_struct {
+    __u8 spare_thresh : 1;
+    __u8 temp_above_or_under_thresh : 1;
+    __u8 rel_degraded : 1;
+    __u8 read_only : 1;
+    __u8 vol_mem_bup_fail : 1;
+    __u8 reserved : 3;
+};
+
+struct csts_struct {
+    __u16 rdy : 1;
+    __u16 cfs : 1;
+    __u16 shst : 2;
+    __u16 nssro : 1;
+    __u16 en : 1;
+    __u16 nssac : 1;
+    __u16 fwact : 1;
+    __u16 reserved : 8;
+};
+
+struct ctrl_health_data {
+    __u16 ctlid;
+    struct csts_struct csts;
+    __u16 ctemp;
+    __u8 pdlu;
+    __u8 spare;
+    struct cwarn_struct cwarn;
+    __u8 reserved[7];
+};
+
+struct log_page_error_info {
+    uint64_t errcnt;
+    uint16_t subqid;
+    uint16_t cid;
+    uint16_t statusfield;
+    uint8_t perr_loc_byte;
+    uint8_t perr_loc_bit:3;
+    uint8_t perr_loc_res:5;
+    uint64_t lba;
+    uint32_t ns;
+    uint8_t vsinfoavl;
+    uint8_t reserved[35];
+};
+
+struct getf_temp_thres {
+    uint16_t tmpth;
+    uint16_t tmpsel:4;
+    uint16_t thsel:2;
+    uint16_t reserved:10;
+};
+
+struct getf_no_queues {
+    uint16_t nsqa;
+    uint16_t ncqa;
+};
+
+#endif
diff --git
a/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/mi/mi-util/hal/mi-nvme-hal-main.c
b/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/mi/mi-util/hal/mi-nvme-hal-main.c
new file mode 100644
index 0000000..b94a394
--- /dev/null
+++
b/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/mi/mi-util/hal/mi-nvme-hal-main.c
@@ -0,0 +1,59 @@
+/*
+ * Copyright (C) 2021 Samsung Electronics Inc. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License version
+ * 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ *
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+ * mi-nvme-hal-main.c - Implementation of HAL Layer for supporting
Multiple
+ * Sideband Hardware(s) for NVMe Management Interface command support
+ *
+ * Developer: Mohit Kapoor <mohit.kap@samsung.com>
+ */
+
+#include "mi-nvme-hal-main.h"
+
+struct hal_entry *objHAL;
+
+struct hal_entry objHAL_QEMU = {
+    .hal_open = qemu_mi_open,
+    .hal_close = qemu_mi_close,
+    .hal_i2c_write = qemu_mi_write,
+    .hal_i2c_read = qemu_mi_read
+};
+
+void setsidebandinterface(SidebandInterface interface)
+{
+    sbInterface = interface;
+}
+
+SidebandInterface getsidebandinterface()
+{
+    return sbInterface;
+}
+
+int identifyhardware()
+{
+    int result = 0;
+    objHAL = NULL;
+    switch (getsidebandinterface()) {
+    case qemu_nvme_mi:
+        printf("Assigning QEMU HAL Object\n");
+        objHAL = &objHAL_QEMU;
+        break;
+    default:
+        break;
+    }
+
+    if (objHAL == NULL) {
+        printf("Unable to allocate Hardware Functions.\n");
+        result = -1;
+    }
+    return result;
+}
diff --git
a/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/mi/mi-util/hal/mi-nvme-hal-main.h
b/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/mi/mi-util/hal/mi-nvme-hal-main.h
new file mode 100644
index 0000000..ceafde8
--- /dev/null
+++
b/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/mi/mi-util/hal/mi-nvme-hal-main.h
@@ -0,0 +1,40 @@
+/*
+ * Copyright (C) 2021 Samsung Electronics Inc. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License version
+ * 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ *
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+ * mi-nvme-hal-main.h - Implementation of HAL Layer for supporting
Multiple
+ * Sideband Hardware(s) for NVMe Management Interface command support
+ *
+ * Developer: Mohit Kapoor <mohit.kap@samsung.com>
+ */
+
+#include <stdint.h>
+#include "mi-nvme-qemu/mi-nvme-qemu.h"
+
+typedef enum _SidebandInterface {
+    qemu_nvme_mi
+} SidebandInterface;
+
+SidebandInterface sbInterface;
+
+struct hal_entry {
+    int (*hal_open)(void);
+    int (*hal_close)(void);
+    int (*hal_i2c_write)(uint8_t *data_out, uint16_t num_bytes);
+    int (*hal_i2c_read)(uint8_t *data_in, uint16_t num_bytes);
+};
+
+extern struct hal_entry *objHAL;
+
+int identifyhardware();
+void setsidebandinterface(SidebandInterface interface);
+SidebandInterface getsidebandinterface();
diff --git
a/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/mi/mi-util/hal/mi-nvme-qemu/mi-nvme-qemu.c
b/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/mi/mi-util/hal/mi-nvme-qemu/mi-nvme-qemu.c
new file mode 100644
index 0000000..e3478b8
--- /dev/null
+++
b/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/mi/mi-util/hal/mi-nvme-qemu/mi-nvme-qemu.c
@@ -0,0 +1,113 @@
+/*
+ * Copyright (C) 2021 Samsung Electronics Inc. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License version
+ * 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ *
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+ * mi-nvme-qemu.c - Implementation of QEMU HAL Layer for
+ * for NVMe Management Interface command support via QEMU
+ *
+ * Developer: Mohit Kapoor <mohit.kap@samsung.com>
+ */
+
+#include "mi-nvme-qemu.h"
+#include <errno.h>
+#include <fcntl.h>
+#include <sys/ioctl.h>
+#include <linux/i2c.h>
+#include <linux/i2c-dev.h>
+
+int qemu_mi_read(uint8_t *data_in, uint16_t num_bytes)
+{
+    struct i2c_smbus_ioctl_data args;
+    union i2c_smbus_data data;
+    args.read_write = I2C_SMBUS_READ;
+    args.size = I2C_SMBUS_BYTE;
+    args.data = &data;
+    int retry = 0;
+    int status = 0;
+    do {
+        if (ioctl(i2cfrd, I2C_SMBUS, &args) < 0) {
+            printf("read ioctl failed %d\n", errno);
+        }
+        usleep(200000);
+        retry++;
+        if (retry == 10) {
+            printf("retry #%d\n", retry);
+            status = -1;
+            break;
+        }
+    } while ((data.byte & 0xFF) == -1);
+
+    if (status != -1) {
+        data_in[0] = data.byte & 0xFF;
+        for (int i = 1; i < num_bytes; i++)  {
+            if (ioctl(i2cfrd, I2C_SMBUS, &args) < 0) {
+                printf("read ioctl failed = %d\n", errno);
+                return -1;
+            } else {
+                data_in[i] = data.byte & 0xFF;
+            }
+        }
+    }
+    return status;
+}
+
+int qemu_mi_write(uint8_t *data_out, uint16_t num_bytes)
+{
+    struct i2c_smbus_ioctl_data args;
+    args.read_write = I2C_SMBUS_WRITE;
+    args.size = I2C_SMBUS_BYTE;
+    args.data = NULL;
+    data_out[2] = QEMU_SMBUS_ADDRESS_READ << 1;
+    for (int i = 0; i < num_bytes; i++) {
+        args.command = data_out[i];
+        if (ioctl(i2cfwr, I2C_SMBUS, &args) < 0) {
+            printf("write ioctl failed %d\n", errno);
+            return -1;
+        }
+    }
+    return num_bytes;
+}
+
+int qemu_mi_open()
+{
+    char i2cbus[256];
+    strcpy(i2cbus, "/dev/i2c-");
+    strcat(i2cbus, QEMU_I2C_BUS_NUM);
+
+    i2cfwr = open(i2cbus, O_RDWR | O_SYNC);
+    if (ioctl(i2cfwr, I2C_SLAVE, QEMU_SMBUS_ADDRESS_WRITE) < 0) {
+        printf("write ioctl failed = %d\n", errno);
+        return -1;
+    }
+    i2cfrd = open(i2cbus, O_RDWR | O_SYNC);
+    if (ioctl(i2cfrd,I2C_SLAVE, QEMU_SMBUS_ADDRESS_READ) < 0) {
+       printf("read ioctl failed = %d\n", errno);
+       return -1;
+    }
+    return 1;
+}
+
+int qemu_mi_close()
+{
+    if (i2cfwr != -1) {
+        printf("Closing i2c device handle : 0x%x\n", i2cfwr);
+        close(i2cfwr);
+        i2cfwr = -1;
+    }
+    if (i2cfrd != -1) {
+        printf("Closing i2c device handle : 0x%x\n", i2cfrd);
+        close(i2cfrd);
+        i2cfrd = -1;
+    }
+
+    return -1;
+}
diff --git
a/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/mi/mi-util/hal/mi-nvme-qemu/mi-nvme-qemu.h
b/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/mi/mi-util/hal/mi-nvme-qemu/mi-nvme-qemu.h
new file mode 100644
index 0000000..ce1b7a5
--- /dev/null
+++
b/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/mi/mi-util/hal/mi-nvme-qemu/mi-nvme-qemu.h
@@ -0,0 +1,35 @@
+/*
+ * Copyright (C) 2021 Samsung Electronics Inc. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License version
+ * 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ *
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+ * mi-nvme-qemu.h - Implementation of QEMU HAL Layer for
+ * for NVMe Management Interface command support via QEMU
+ *
+ * Developer: Mohit Kapoor <mohit.kap@samsung.com>
+ */
+
+#include <stdint.h>
+#include <sys/socket.h>
+#include <linux/vm_sockets.h>
+#include <stdio.h>
+#include <string.h>
+#include <unistd.h>
+#define QEMU_SMBUS_ADDRESS_WRITE 0x15
+#define QEMU_SMBUS_ADDRESS_READ 0x16
+#define QEMU_I2C_BUS_NUM  "0"
+
+int i2cfwr, i2cfrd;
+
+int qemu_mi_open();
+int qemu_mi_close();
+int qemu_mi_read(uint8_t *data_in, uint16_t num_bytes);
+int qemu_mi_write(uint8_t *data_out, uint16_t num_bytes);
diff --git
a/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/mi/mi-util/mi-nvme-util-base.c
b/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/mi/mi-util/mi-nvme-util-base.c
new file mode 100644
index 0000000..f2844a6
--- /dev/null
+++
b/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/mi/mi-util/mi-nvme-util-base.c
@@ -0,0 +1,336 @@
+/*
+ * Copyright (C) 2021 Samsung Electronics Inc. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License version
+ * 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ *
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+ * mi-nvme-util-base.c - Implementation of NVMe Management Interface
commands in Nvme
+ *
+ * Developer: Mohit Kapoor <mohit.kap@samsung.com>
+ */
+
+#include "mi-nvme-util-master.h"
+
+void print_mctp_packet(mctp_i2c_header *m)
+{
+    printf("\t\t\t Destination Addr    : 0x%02X (7-bit: 0x%02x)\n",
+        m->destAddr, m->destAddr >> 1);
+    printf("\t\t\t Source      Addr    : 0x%02X (7-bit: 0x%02x)\n",
+        m->srcAddr & 0xFE, m->srcAddr >> 1);
+    printf("\t\t\t Byte Count          : 0x%02X (%d dec)\n",
+        m->byteCnt, m->byteCnt);
+    printf("\t\t\t MCTP Header Version : %d\n", m->headerVer & 0xF);
+    printf("\t\t\t Destination Endpoint: 0x%02X\n", m->destEID);
+    printf("\t\t\t Source      Endpoint: 0x%02X\n", m->srcEID);
+    printf("\t\t\t Message Tag         : 0x%X\n", m->pktCtrl &
+        MCTP_CTRL_PKT_MSGTAG_MASK);
+    printf("\t\t\t MCTP Pkt Seq Num    : %d\n", (m->pktCtrl &
+        MCTP_CTRL_PKT_PKTSEQ_MASK) >> MCTP_CTRL_PKT_PKTSEQ_SHIFT);
+    printf("\t\t\t Packet Control bits : SOM(%d), EOM(%d), TO(%d)\n",
+        (m->pktCtrl & MCTP_CTRL_PKT_SOM) >> MCTP_CTRL_PKT_SOM_SHIFT,
+        (m->pktCtrl & MCTP_CTRL_PKT_EOM) >> MCTP_CTRL_PKT_EOM_SHIFT,
+        (m->pktCtrl & MCTP_CTRL_PKT_TO) >> MCTP_CTRL_PKT_TO_SHIFT);
+}
+
+void format_base_pkt(mctp_message_t *m)
+{
+    /* Prepare the I2C header */
+    m->i2cHdr.cmdCode = MCTP_CMD_CODE;
+    m->i2cHdr.headerVer = MCTP_HEADER_VER;
+    m->i2cHdr.destEID = MCTP_EID_DESTINATION;
+    m->i2cHdr.srcEID = MCTP_EID_SOURCE;
+    m->i2cHdr.pktCtrl = MCTP_CTRL_MSGTAG(3) | MCTP_CTRL_PKT_SOM |
+        MCTP_CTRL_PKT_EOM | MCTP_CTRL_PKT_TO | 1;
+}
+
+int rcv_pkt(void *inp_parm)
+{
+    unsigned int status = 0;
+    uint8_t eom = 0;
+    mctp_i2c_header mctp_hdr;
+    rcv_parm_t *rcv_parm = (rcv_parm_t *)inp_parm;
+
+    printf("Getting Data from the device.\n");
+
+    rcv_parm->buf_size = 0;
+    memset(&mctp_hdr, 0, sizeof(mctp_i2c_header));
+    uint32_t bytesread = 0;
+    while (!eom) {
+        uint8_t buf[8];
+        /*Reading first 8 bytes of header info*/
+        int ret = objHAL->hal_i2c_read(buf, 8);
+        if (ret == -1) {
+            printf("Unable to receive MI response header from
device.\n");
+            status = -1;
+            break;
+        }
+        mctp_hdr.byteCnt = buf[2];
+        eom = (buf[7] & 0x40) >> 6;
+        printf("Header info received from device:\n");
+        print_mctp_packet((mctp_i2c_header *)buf);
+
+        /*copy header info to response buffer*/
+        memcpy(rcv_parm->buffer + bytesread, buf, 8);
+        bytesread += 8;
+
+        /*Reading the data sent in next transaction*/
+        /* ignore the PEC value as well, thats why 
+           we do mctp_hdr.byteCnt - 6 */ 
+        ret = objHAL->hal_i2c_read(rcv_parm->buffer + bytesread,
+            mctp_hdr.byteCnt - 5);
+        if (ret == -1) {
+            printf("Unable to receive data from the device.\n");
+            status = -1;
+            break;
+        }
+        printf("Data Received from Device:\n");
+        rcv_parm->buf_size += mctp_hdr.byteCnt - 6;
+        bytesread += mctp_hdr.byteCnt - 6;
+    }
+
+    *(rcv_parm->ret_bytes) = rcv_parm->buf_size;
+    return status;
+}
+
+int xmit_pkt(__u8 *buffer)
+{
+    mctp_message_t *message = NULL;
+    __u8 *p = NULL;
+    __u32 mtu = mctp_tus;
+    __u32 bytesleft = 0;
+    int ret = -1;
+
+    message = (mctp_message_t *)buffer;
+    bytesleft = TotalByteCount - 5;
+    /* Append PEC byte to the end of the packet */
+    p = buffer + TotalByteCount + 3;
+    message->i2cHdr.byteCnt = TotalByteCount;
+    *p = Calc_Crc8((__u8 *)buffer, TotalByteCount + 3);
+
+    if ((sys_cfg.sys_flags | SYS_FLAG_PEC_OVERRIDE) &&
+        (sys_cfg.peccode == 1))
+    {
+        *p ^= *buffer;
+    }
+
+    usleep(10);
+
+    print_mctp_packet(&message->i2cHdr);
+
+    if (bytesleft) {
+        if ((sys_cfg.sys_flags & SYS_FLAG_PEC_OVERRIDE) &&
+            (sys_cfg.peccode == 0)) {
+            ret = send_data(TotalByteCount + 2,
+                (__u8 *)&message->i2cHdr.cmdCode);
+        } else {
+            ret = send_data(TotalByteCount + 3,
+                (__u8 *)&message->i2cHdr.cmdCode);
+        }
+    } else {
+        bool isStart = true;
+        __u32 counter = 0;
+        do {
+            mctp_message_t msg_in_chunks;
+            __u8 *buffer_in_chunks;
+
+            buffer_in_chunks = (__u8 *)&msg_in_chunks;
+
+            memcpy(&msg_in_chunks, message, MCTP_HEADER_SIZE);
+            msg_in_chunks.i2cHdr.byteCnt = mtu + 5;
+
+            msg_in_chunks.i2cHdr.pktCtrl &= 0x0F;
+            msg_in_chunks.i2cHdr.pktCtrl |= ((counter % 4) << 4);
+
+            if (isStart == true) {
+                msg_in_chunks.i2cHdr.pktCtrl |= 0x80; /*Start of
message*/
+                memcpy(&msg_in_chunks.msgHdr, buffer +
+                    MCTP_HEADER_SIZE + (mtu * counter), mtu);
+                isStart = false;
+            } else if (bytesleft <= mtu) {
+                msg_in_chunks.i2cHdr.pktCtrl |= 0x40; /*End of
message*/
+                msg_in_chunks.i2cHdr.byteCnt = bytesleft + 5;
+                memcpy(&msg_in_chunks.msgHdr, buffer +
+                    MCTP_HEADER_SIZE + (mtu * counter), bytesleft);
+            } else {
+                msg_in_chunks.i2cHdr.byteCnt =
BYTE_COUNT_WHEN_DATA_EXCEEDS_MTU;
+                memcpy(&msg_in_chunks.msgHdr, buffer +
+                    MCTP_HEADER_SIZE + (mtu * counter), mtu);
+            }
+
+            p = buffer_in_chunks + msg_in_chunks.i2cHdr.byteCnt + 3;
+            *p = Calc_Crc8((__u8 *)buffer_in_chunks,
+                msg_in_chunks.i2cHdr.byteCnt + 3);
+
+            if ((sys_cfg.sys_flags | SYS_FLAG_PEC_OVERRIDE) &&
+            (sys_cfg.peccode == 1)) {
+                *p ^= *buffer_in_chunks;
+            }
+
+            if ((sys_cfg.sys_flags & SYS_FLAG_PEC_OVERRIDE) &&
+            (sys_cfg.peccode == 0)) {
+                ret = send_data(msg_in_chunks.i2cHdr.byteCnt + 2,
+                    (__u8 *)&msg_in_chunks.i2cHdr.cmdCode);
+                if (ret == -1) {
+                    break;
+                }
+            } else {
+                ret = send_data(msg_in_chunks.i2cHdr.byteCnt + 3,
+                    (__u8 *)&msg_in_chunks.i2cHdr.cmdCode);
+                if (ret == -1) {
+                    break;
+                }
+            }
+
+            bytesleft -= mtu;
+            counter++;
+        } while (bytesleft > 0);
+    }
+    return ret;
+}
+
+bool mi_pkt_transaction(__u8 *TxBuf, __u8 *RxBuf, __u16 Rxbuf_size)
+{
+    reply_buffer_struct *stReplyStruct;
+    stReplyStruct = (reply_buffer_struct *)RxBuf;
+
+    rcv_parm_t rcv_parm;
+    rcv_parm.buf_size = Rxbuf_size;
+    rcv_parm.buffer = stReplyStruct->replybuf;
+    rcv_parm.ret_bytes = &stReplyStruct->length;
+    rcv_parm.errcode = &stReplyStruct->errorcode;
+
+    int ret = xmit_pkt(TxBuf);
+    if (ret == -1) {
+        printf("Unable to send command to device.\n");
+        return false;
+    }
+    sleep(1);
+    ret = rcv_pkt(&rcv_parm);
+    if (ret == -1) {
+        printf("Unable to receive receive response from device.\n");
+        return false;
+    }
+    return true;
+}
+
+bool execute_nvme_mi_command(struct nvme_mi_message message,
+    reply_buffer_struct *stReply, int replysize, int RequestDataSize)
+{
+    uint8_t *buffer  = NULL;
+    uint32_t size_of_message = 0;
+    uint32_t crc = 0;
+    bool ret = false;
+
+    format_base_pkt((mctp_message_t *)&message);
+
+    sys_cfg.sys_flags |= SYS_FLAG_NVME_MI;
+
+    if (message.msgPld.buffer == NULL) {
+        size_of_message = sizeof(struct nvme_mi_message) -
+             SIZE_OF_BUFFER_ADDRESS;
+        buffer = (uint8_t *)malloc(size_of_message + 1);
+        TotalByteCount = size_of_message - 3;
+
+        /*Copy the contents of message apart from buffer, as it is
NULL*/
+        if (buffer != NULL) {
+            memcpy(buffer, &message, OFST_TILL_BUFFER_NVME_MI_CMD);
+        }
+    } else if (message.msgPld.opcode == 06) {   /*Check for VPD Write*/
+        size_of_message = sizeof(struct nvme_mi_message) -
SIZE_OF_BUFFER_ADDRESS;
+        int buffer_len = message.msgPld.dword1 & 0xFFFF;
+
+        size_of_message += buffer_len;
+        TotalByteCount = size_of_message - 3;
+
+        buffer = (uint8_t *)malloc(size_of_message + 1);
+        if (buffer != NULL) {
+            memcpy(buffer, &message, OFST_TILL_BUFFER_NVME_MI_CMD);
+            memcpy(buffer + OFST_TILL_BUFFER_NVME_MI_CMD,
+                message.msgPld.buffer, buffer_len);
+        }
+
+    } else {
+            size_of_message = sizeof(struct nvme_mi_message) -
+            SIZE_OF_BUFFER_ADDRESS + RequestDataSize;
+            /*Add one for the PEC byte*/
+            buffer = (uint8_t *)malloc(size_of_message + 1);
+
+            TotalByteCount = size_of_message - 3;
+            if (buffer != NULL) {
+                memcpy(buffer, &message, OFST_TILL_BUFFER_NVME_MI_CMD);
+                memcpy(buffer + OFST_TILL_BUFFER_NVME_MI_CMD,
+                    message.msgPld.buffer, RequestDataSize);
+            }
+    }
+
+    if (buffer != NULL) {
+        crc = GenerateCRC(buffer + MCTP_HEADER_SIZE, size_of_message -
+        MCTP_HEADER_SIZE - CRC_SIZE);
+        memcpy(buffer + size_of_message - CRC_SIZE, &crc , CRC_SIZE);
+        ret = mi_pkt_transaction(buffer, (__u8 *)stReply, replysize);
+        if (buffer != NULL) {
+            free(buffer);
+            buffer = NULL;
+        }
+    }
+
+    return ret;
+}
+
+bool execute_nvme_mi_admin_command(nvme_mi_admin_message message,
+    reply_buffer_struct *stReply, int replysize, int RequestDataSize)
+{
+    uint8_t *buffer  = NULL;
+    uint32_t size_of_message = 0;
+    uint32_t crc = 0;
+    bool ret = false;
+
+    format_base_pkt((mctp_message_t *)&message);
+
+    if (message.msgPld.buffer == NULL) {
+        size_of_message = sizeof(nvme_mi_admin_message) -
+        SIZE_OF_BUFFER_ADDRESS;
+        buffer = (uint8_t *)malloc(size_of_message + 1);
+        TotalByteCount = size_of_message - 3;
+
+        if (buffer != NULL) {
+            memcpy(buffer, &message,
OFST_TILL_BUFFER_NVME_MI_ADMIN_CMD);
+            memcpy(buffer + OFST_TILL_BUFFER_NVME_MI_ADMIN_CMD,
+            (char *)&message + OFST_TILL_BUFFER_NVME_MI_ADMIN_CMD +
+            SIZE_OF_BUFFER_ADDRESS, SIZE_OF_MIC);
+        }
+    } else {
+        size_of_message = sizeof(nvme_mi_admin_message) -
+            SIZE_OF_BUFFER_ADDRESS + RequestDataSize;
+        buffer = (uint8_t *)malloc(size_of_message + 1);
+        printf("sz = %d, req_data_size = %d\n", size_of_message,
RequestDataSize);
+        printf("ofst = %d\n", OFST_TILL_BUFFER_NVME_MI_ADMIN_CMD);
+        TotalByteCount = size_of_message - 3;
+        if (buffer != NULL) {
+            memcpy(buffer, &message,
OFST_TILL_BUFFER_NVME_MI_ADMIN_CMD);
+            memcpy(buffer + OFST_TILL_BUFFER_NVME_MI_ADMIN_CMD,
+                message.msgPld.buffer, RequestDataSize);
+        }
+    }
+
+    if (buffer != NULL) {
+        crc = GenerateCRC(buffer + MCTP_HEADER_SIZE,
+            size_of_message - MCTP_HEADER_SIZE - CRC_SIZE);
+        memcpy(buffer + size_of_message - CRC_SIZE, &crc, CRC_SIZE);
+        ret = mi_pkt_transaction(buffer, (__u8 *)stReply, replysize);
+    }
+
+    if (buffer != NULL) {
+        free(buffer);
+        buffer = NULL;
+    }
+
+    return ret;
+}
diff --git
a/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/mi/mi-util/mi-nvme-util-base.h
b/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/mi/mi-util/mi-nvme-util-base.h
new file mode 100644
index 0000000..005aa45
--- /dev/null
+++
b/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/mi/mi-util/mi-nvme-util-base.h
@@ -0,0 +1,200 @@
+/*
+ * Copyright (C) 2021 Samsung Electronics Inc. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License version
+ * 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ *
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+ * mi-nvme-util-base.h - Implementation of NVMe Management Interface
commands in Nvme
+ *
+ * Developer: Mohit Kapoor <mohit.kap@samsung.com>
+ */
+
+#ifndef __MI_NVME_UTIL_BASE_H__
+#define __MI_NVME_UTIL_BASE_H__
+
+#include <pthread.h>
+#include <linux/types.h>
+
+#define MCTP_CMD_CODE                       0x0F
+#define MCTP_HEADER_VER                     0x1
+
+#define MCTP_EID_DESTINATION                0x00
+#define MCTP_EID_SOURCE                     0x00
+
+/* Byte 7 Packet Control Bits */
+#define MCTP_CTRL_PKT_MSGTAG_MASK 0x07
+#define MCTP_CTRL_PKT_TO 0x08
+#define MCTP_CTRL_PKT_TO_SHIFT 3
+#define MCTP_CTRL_PKT_PKTSEQ_MASK 0x30
+#define MCTP_CTRL_PKT_PKTSEQ_SHIFT 4
+#define MCTP_CTRL_PKT_EOM 0x40
+#define MCTP_CTRL_PKT_EOM_SHIFT 6
+#define MCTP_CTRL_PKT_SOM 0x80
+#define MCTP_CTRL_PKT_SOM_SHIFT 7
+#define MCTP_CTRL_MSGTAG(x) (x & MCTP_CTRL_PKT_MSGTAG_MASK)
+#define MCTP_CTRL_PKTSEQ(x) ((x << MCTP_CTRL_PKT_PKTSEQ_SHIFT) &
MCTP_CTRL_PKT_PKTSEQ_MASK)
+
+#define VDM_ARG_COUNT 20
+#define SIZE_OF_BUFFER_ADDRESS 8
+#define SIZE_OF_32_BUFFER_ADDRESS 4
+#define OFST_TILL_BUFFER_NVME_MI_ADMIN_CMD 76
+#define OFST_TILL_BUFFER_NVME_MI_CMD 24
+#define SIZE_OF_MIC 4
+#define MCTP_HEADER_SIZE 8
+#define CRC_SIZE 4
+#define BYTE_COUNT_WHEN_DATA_EXCEEDS_MTU 69
+#define REPLY_BUFFER_SIZE 5120
+#define REPLAY_BUFFER_SIZE 5120
+#define REPLAY_RESPONSE_MESSAGE_SIZE 20
+
+#define PACKED
+#pragma pack(push, 1)
+
+typedef struct _mctp_i2c_header {
+    __u8                 destAddr;
+    __u8                 cmdCode;
+    __u8                 byteCnt;
+    __u8                 srcAddr;
+    __u8                 headerVer;
+    __u8                 destEID;
+    __u8                 srcEID;
+    /* Byte 3 for msgTag(2:0), TO(3), pktSeq(5:4), EOM(6), SOM(7) */
+    __u8                 pktCtrl;
+} mctp_i2c_header;
+
+typedef struct _mctp_msg_header_t {
+    __u8                 msgTpe;
+    union {
+        struct {
+            /* Byte for InstID(4:0), D(6), Rq(7) fields */
+            __u8    InstCde;
+            __u8    cmdCode;
+            __u8    OpCpl;
+        } ctrMsg;
+    } msgReqRsp;
+} mctp_msg_header_t;
+
+typedef struct mctp_msg_payload_ {
+    union {
+        struct {
+            __u8        EID_status;
+            __u8        EP_Type;
+            __u8        Misc;
+            __u8        byte[((VDM_ARG_COUNT * 4) + 13)];
+        } baseCtrl;
+    } dataPld;
+} mctp_msg_payload_t;
+
+typedef struct mctp_message_ {
+    mctp_i2c_header  i2cHdr;
+    mctp_msg_header_t  msgHdr;
+    mctp_msg_payload_t msgPld;
+    __u32 pad[1];
+} mctp_message_t;
+
+typedef struct _message_header {
+    __u8 messsage_type:7;
+    __u8 ic:1;
+    __u8 instance_id:5;
+    __u8 rsvd:1;
+    __u8 d:1;
+    __u8 rq:1;
+    __u8 command_code;
+} message_header;
+
+typedef struct _nvme_mi_mctp_cmd_pld {
+    message_header nvme_mi_message_header;
+    __u8 *buffer;
+} nvme_mi_mctp_cmd_pld;
+
+typedef struct _mctp_command_packet {
+    mctp_i2c_header  i2cHdr;
+    nvme_mi_mctp_cmd_pld msgPld;
+} mctp_command_packet;
+
+typedef struct _mctp_command_reply_packet {
+    mctp_i2c_header  i2cHdr;
+    nvme_mi_mctp_cmd_pld msgPld;
+} mctp_command_reply_packet;
+
+struct nvme_mi_mctp_message_pld {
+    __u32 nvme_mi_message_header;
+    __u8 opcode;
+    __u8 reserved0;
+    __u8 reserved1;
+    __u8 reserved2;
+    __u32 dword0;
+    __u32 dword1;
+    __u8 *buffer;
+    __u32 mic;
+} __attribute__((packed));
+
+typedef struct _nvme_mi_Admin_message_pld {
+    __u32 nvme_mi_message_header;
+    __u8 opcode;
+    __u8 cflgs;
+    __u16 ctlid;
+    __u32 cdw1;
+    __u32 cdw2;
+    __u32 cdw3;
+    __u32 cdw4;
+    __u32 cdw5;
+    __u32 dofst;
+    __u32 dlen;
+    __u32 cdw8;
+    __u32 cdw9;
+    __u32 cdw10;
+    __u32 cdw11;
+    __u32 cdw12;
+    __u32 cdw13;
+    __u32 cdw14;
+    __u32 cdw15;
+    __u8 *buffer;
+    __u32 mic;
+} nvme_mi_admin_message_pld;
+
+struct nvme_mi_message {
+    mctp_i2c_header i2cHdr;
+    struct nvme_mi_mctp_message_pld msgPld;
+} __attribute__((packed));
+
+typedef struct _nvme_mi_admin_message {
+    mctp_i2c_header i2cHdr;
+    nvme_mi_admin_message_pld msgPld;
+} nvme_mi_admin_message;
+
+typedef struct _rcv_parm_t {
+    __u16 buf_size;
+    __u8 *buffer;
+    __u32 *ret_bytes;
+    __u32 *errcode;
+} rcv_parm_t;
+
+typedef struct _reply_buffer_struct {
+    __u8 replybuf[REPLY_BUFFER_SIZE];
+    __u32 length;
+    __u32 errorcode;
+} reply_buffer_struct;
+
+#pragma pack(pop)
+#undef PACKED
+
+__u32 TotalByteCount;
+
+void format_base_pkt(mctp_message_t *m);
+int rcv_pkt(void *inp_parm);
+int xmit_pkt(__u8 *buffer);
+bool mi_pkt_transaction(__u8 *TxBuf, __u8 *RxBuf, __u16 Rxbuf_size);
+bool execute_nvme_mi_command(struct nvme_mi_message message,
+    reply_buffer_struct *stReply, int replysize, int RequestDataSize);
+bool execute_nvme_mi_admin_command(nvme_mi_admin_message message,
+    reply_buffer_struct *stReply, int replysize, int RequestDataSize);
+
+#endif
diff --git
a/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/mi/mi-util/mi-nvme-util-crc.c
b/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/mi/mi-util/mi-nvme-util-crc.c
new file mode 100644
index 0000000..c4a2bde
--- /dev/null
+++
b/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/mi/mi-util/mi-nvme-util-crc.c
@@ -0,0 +1,89 @@
+/*
+ * Copyright (C) 2021 Samsung Electronics Inc. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License version
+ * 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ *
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+ * mi-nvme-util-crc.c - Implementation of NVMe Management Interface
commands in Nvme
+ *
+ * Developer: Mohit Kapoor <mohit.kap@samsung.com>
+ */
+
+#include "mi-nvme-util-master.h"
+
+static __u8 crc8(__u8 crc, __u8 crc_data)
+{
+    __u8 i = 0, data = 0;
+    data = crc ^ crc_data;
+
+    for (i = 0; i < 8; i++) {
+        if ((data & 0x80) != 0) {
+            data <<= 1;
+            data ^= 0x07;
+        } else {
+            data <<= 1;
+        }
+    }
+    return data;
+}
+
+__u8 Calc_Crc8(__u8 *Buffer, __u8 byte_cnt)
+{
+    __u8 crc = 0, *p;
+    int i;
+    p = Buffer;
+
+    for (i = 0; i < byte_cnt; i++) {
+        crc = crc8(crc, *p++);
+    }
+    return crc;
+}
+
+uint32_t GenerateCRC(uint8_t *message, uint32_t length)
+{
+    if (message != NULL) {
+        uint32_t crc = Calc_Crc32(0x1EDC6F41, -1, message, length);
+        printf("Generated CRC32 : %"PRIx32"\n", crc);
+        return crc;
+    }
+    return 0;
+}
+
+void gen_crc_table(uint32_t poly)
+{
+  register uint16_t i = 0, j = 0;
+  register uint32_t crc_accum = 0;
+
+  for (i = 0;  i < 256;  i++) {
+    crc_accum = ((uint32_t)i << 24);
+    for (j = 0;  j < 8;  j++) {
+        if (crc_accum & 0x80000000L) {
+            crc_accum = (crc_accum << 1) ^ poly;
+        } else {
+            crc_accum = (crc_accum << 1);
+        }
+    }
+    crc_table[i] = crc_accum;
+  }
+}
+
+uint32_t Calc_Crc32(uint32_t poly, uint32_t crc_accum,
+    uint8_t *data_blk_ptr, uint32_t data_blk_size)
+{
+    register uint32_t i = 0, j = 0;
+    gen_crc_table(poly);
+
+    for (j = 0; j < data_blk_size; j++) {
+        i = ((int) (crc_accum >> 24) ^ *data_blk_ptr++) & 0xFF;
+        crc_accum = (crc_accum << 8) ^ crc_table[i];
+    }
+    crc_accum = ~crc_accum;
+    return crc_accum;
+}
diff --git
a/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/mi/mi-util/mi-nvme-util-crc.h
b/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/mi/mi-util/mi-nvme-util-crc.h
new file mode 100644
index 0000000..f919fdc
--- /dev/null
+++
b/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/mi/mi-util/mi-nvme-util-crc.h
@@ -0,0 +1,33 @@
+/*
+ * Copyright (C) 2021 Samsung Electronics Inc. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License version
+ * 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ *
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+ * mi-nvme-util-crc.h - Implementation of NVMe Management Interface
commands in Nvme
+ *
+ * Developer: Mohit Kapoor <mohit.kap@samsung.com>
+ */
+
+#ifndef __MI_NVME_UTIL_CRC_H__
+#define __MI_NVME_UTIL_CRC_H__
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <inttypes.h>
+
+uint32_t crc_table[256];
+
+uint32_t GenerateCRC(uint8_t *message, uint32_t length);
+void gen_crc_table();
+uint32_t Calc_Crc32(uint32_t poly, uint32_t crc_accum, uint8_t
*message, uint32_t size);
+__u8 Calc_Crc8(__u8 *Buffer, __u8 byte_cnt);
+
+#endif
diff --git
a/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/mi/mi-util/mi-nvme-util-master.h
b/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/mi/mi-util/mi-nvme-util-master.h
new file mode 100644
index 0000000..d52b153
--- /dev/null
+++
b/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/mi/mi-util/mi-nvme-util-master.h
@@ -0,0 +1,34 @@
+/*
+ * Copyright (C) 2021 Samsung Electronics Inc. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License version
+ * 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ *
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+ * mi-nvme-util-master.h - Implementation of NVMe Management Interface
commands in Nvme
+ *
+ * Developer: Mohit Kapoor <mohit.kap@samsung.com>
+ */
+
+#ifndef __MI_NVME_UTIL_MASTER_H__
+#define __MI_NVME_UTIL_MASTER_H__
+#include <linux/types.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <stddef.h>
+#include <stdbool.h>
+#include <ctype.h>
+#include <sys/stat.h>
+#include "hal/mi-nvme-hal-main.h"
+#include "mi-nvme-util-tool.h"
+#include "mi-nvme-util-base.h"
+#include "mi-nvme-util-crc.h"
+
+#endif
diff --git
a/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/mi/mi-util/mi-nvme-util-tool.c
b/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/mi/mi-util/mi-nvme-util-tool.c
new file mode 100644
index 0000000..b6f2ac3
--- /dev/null
+++
b/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/mi/mi-util/mi-nvme-util-tool.c
@@ -0,0 +1,107 @@
+/*
+ * Copyright (C) 2021 Samsung Electronics Inc. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License version
+ * 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ *
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+ * mi-nvme-util-tool.c - Implementation of NVMe Management Interface
commands in Nvme
+ *
+ * Developer: Mohit Kapoor <mohit.kap@samsung.com>
+ */
+
+#include "mi-nvme-util-master.h"
+
+bool initialize(__u32 uiMCTP_TUS)
+{
+    bool retval = false;
+    memset(&sys_cfg, 0, sizeof(system_cfg_t));
+    state_dev = false;
+    hardware_init = false;
+    mctp_tus = 0;
+    TotalByteCount = 0;
+
+    mctp_tus = uiMCTP_TUS;
+    if (!hardware_init) {
+        int ret = identifyhardware();
+        if (ret == -1) {
+            printf("Initialiation Failed.\n");
+            return false;
+        }
+        hardware_init = true;
+    }
+
+    retval = open_device();
+    if (retval == false) {
+        printf("open device Failed!\n");
+        return false;
+    }
+
+    return retval;
+}
+
+int send_data(__u16 num_write, __u8 *data_out)
+{
+    int count = 0;
+
+    printf("\nData being written to the device, byte count = 0x%X:\n",
num_write);
+    count = objHAL->hal_i2c_write(data_out, num_write);
+    usleep(10);
+
+    if (count < 0) {
+        printf("Error in sending data\n");
+        return -1;
+    }
+    printf("Number of bytes written to the device 0x%02x(%d)\n", count,
count);
+    return count;
+}
+
+bool open_device()
+{
+    int status = -1, i = 0;
+
+    if (!state_dev) {
+        for (i = 0; i < MAX_OPEN_RETRY; i++) {
+            status = objHAL->hal_open();
+            if (status < 0) {
+                printf("Unable to open device\n");
+            } else {
+                break;
+            }
+        }
+
+        if (status <= 0) {
+            printf("Unable to open device on port %d\n",
sys_cfg.aport);
+            return false;
+        }
+        state_dev = true;
+    }
+    return true;
+}
+
+bool close_device()
+{
+    int status = -1, i = 0;
+
+    if (state_dev) {
+        for (i = 0; i < MAX_CLOSE_RETRY; i++) {
+            status = objHAL->hal_close();
+            if (status == -1) {
+                break;
+            }
+        }
+
+        if (status != -1) {
+            printf("Device handle close unsuccessful!\n");
+            return false;
+        }
+        state_dev = false;
+    }
+    return true;
+}
diff --git
a/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/mi/mi-util/mi-nvme-util-tool.h
b/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/mi/mi-util/mi-nvme-util-tool.h
new file mode 100644
index 0000000..901bc9c
--- /dev/null
+++
b/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/mi/mi-util/mi-nvme-util-tool.h
@@ -0,0 +1,56 @@
+/*
+ * Copyright (C) 2021 Samsung Electronics Inc. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License version
+ * 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ *
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+ * mi-nvme-util-tool.h - Implementation of NVMe Management Interface
commands in Nvme
+ *
+ * Developer: Mohit Kapoor <mohit.kap@samsung.com>
+ */
+
+#include "mi-nvme-util-base.h"
+
+#ifndef __MI_NVME_UTIL_TOOL_H__
+#define __MI_NVME_UTIL_TOOL_H__
+
+#define SYS_FLAG_PEC_OVERRIDE 0x00000400
+#define SYS_FLAG_NVME_MI 0x00010000
+#define MAX_OPEN_RETRY 10
+#define MAX_CLOSE_RETRY 5
+
+typedef struct _system_cfg_t {
+    __u32 sys_flags;
+    __u32 verbose_level;
+    __u32 op_state;
+
+    int phandle;
+    int dhandle;
+    __u16 iport;
+    __u16 aport;
+    __u16 dport;
+
+    __u8 taddr;
+    __u8 saddr;
+
+    __u8 peccode;
+} system_cfg_t;
+
+__u32 mctp_tus;
+system_cfg_t sys_cfg;
+bool state_dev;
+bool hardware_init;
+
+bool initialize(__u32 uiMCTP_TUS);
+int send_data(__u16 num_write, __u8 *data_out);
+bool open_device();
+bool close_device();
+
+#endif
diff --git
a/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/mi_nvme.c
b/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/mi_nvme.c
new file mode 100644
index 0000000..87f9f4c
--- /dev/null
+++ b/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/mi_nvme.c
@@ -0,0 +1,1323 @@
+/*
+ * Copyright (C) 2021 Samsung Electronics Inc. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License version
+ * 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ *
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+ * mi_nvme.c - Implementation of NVMe Management Interface commands in
NVMe.
+ * This file contains the MI command implementation for the plugin
+ *
+ * Developer: Mohit Kapoor <mohit.kap@samsung.com>
+ *            Arun Kumar Kashinath Agasar <arun.kka@samsung.com>
+ */
+
+#include <fcntl.h>
+#include <errno.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <unistd.h>
+#include <inttypes.h>
+#include <locale.h>
+#include <asm/byteorder.h>
+
+#include "util/argconfig.h"
+#include "util/suffix.h"
+
+#define CREATE_CMD
+#include <time.h>
+#include "mi_nvme.h"
+#include "mi/mi-nvme-cmd.h"
+#include "mi/mi-util/hal/mi-nvme-hal-main.h"
+
+static struct plugin builtin = {
+    .commands = commands,
+    .name = NULL,
+    .desc = NULL,
+    .next = NULL,
+    .tail = &builtin,
+};
+
+static struct program nvme = {
+    .name = "nvme-mi",
+    .version = "1.1",
+    .usage = "<command> [<device>] [<args>]",
+    .desc = "The '<device>' may be either an NVMe character "\
+        "device (ex: /dev/nvme0) or an nvme block device "\
+        "(ex: /dev/nvme0n1).",
+    .extensions = &builtin,
+};
+
+
+void register_extension(struct plugin *plugin)
+{
+    plugin->parent = &nvme;
+    nvme.extensions->tail->next = plugin;
+    nvme.extensions->tail = plugin;
+}
+
+void cleanup_nvmemi()
+{
+    bool ret = close_device();
+    if (ret == false) {
+        printf("Error : Close device Failed!\n");
+    }
+}
+
+static void nvme_show_id_ns(struct nvme_id_ns ns, __u32 nsid)
+{
+
+    __u32 i = 0;
+    printf("NVME Identify Namespace %d:\n", nsid);
+
+    printf("nsze    : %llx\n", __le64_to_cpu(ns.nsze));
+    printf("ncap    : %llx\n", __le64_to_cpu(ns.ncap));
+    printf("nuse    : %llx\n", __le64_to_cpu(ns.nuse));
+    printf("nsfeat  : %#x\n", ns.nsfeat);
+    printf("nlbaf   : %d\n", ns.nlbaf);
+    printf("flbas   : %#x\n", ns.flbas);
+    printf("mc      : %#x\n", ns.mc);
+    printf("dpc     : %#x\n", ns.dpc);
+    printf("dps     : %#x\n", ns.dps);
+    printf("nmic    : %#x\n", ns.nmic);
+    printf("rescap  : %#x\n", ns.rescap);
+    printf("fpi     : %#x\n", ns.fpi);
+    printf("dlfeat  : %d\n", ns.dlfeat);
+    printf("nawun   : %d\n", __le16_to_cpu(ns.nawun));
+    printf("nawupf  : %d\n", __le16_to_cpu(ns.nawupf));
+    printf("nacwu   : %d\n", __le16_to_cpu(ns.nacwu));
+    printf("nabsn   : %d\n", __le16_to_cpu(ns.nabsn));
+    printf("nabo    : %d\n", __le16_to_cpu(ns.nabo));
+    printf("nabspf  : %d\n", __le16_to_cpu(ns.nabspf));
+    printf("noiob   : %d\n", __le16_to_cpu(ns.noiob));
+    if (ns.nsfeat & 0x10) {
+        printf("npwg    : %u\n", __le16_to_cpu(ns.npwg));
+        printf("npwa    : %u\n", __le16_to_cpu(ns.npwa));
+        printf("npdg    : %u\n", __le16_to_cpu(ns.npdg));
+        printf("npda    : %u\n", __le16_to_cpu(ns.npda));
+        printf("nows    : %u\n", __le16_to_cpu(ns.nows));
+    }
+    printf("mssrl   : %u\n", __le16_to_cpu(ns.mssrl));
+    printf("mcl     : %d\n", __le32_to_cpu(ns.mcl));
+    printf("msrc    : %u\n", ns.msrc);
+    printf("anagrpid: %u\n", __le32_to_cpu(ns.anagrpid));
+    printf("nsattr  : %u\n", ns.nsattr);
+    printf("nvmsetid: %d\n", __le16_to_cpu(ns.nvmsetid));
+    printf("endgid  : %d\n", __le16_to_cpu(ns.endgid));
+
+    printf("nguid   : ");
+    for (i = 0; i < 16; i++) {
+        printf("%02x", ns.nguid[i]);
+    }
+    printf("\n");
+
+    printf("eui64   : ");
+    for (i = 0; i < 8; i++) {
+        printf("%02x", ns.eui64[i]);
+    }
+    printf("\n");
+
+    for (i = 0; i <= ns.nlbaf; i++) {
+        printf("lbaf %2d : ms:%-3d lbads:%-2d rp:%#x %s\n", i,
+            __le16_to_cpu(ns.lbaf[i].ms), ns.lbaf[i].ds,
+            ns.lbaf[i].rp,
+            i == (ns.flbas & 0xf) ? "(in use)" : "");
+    }
+}
+static void nvme_show_id_ctrl(struct nvme_id_ctrl ctrl)
+{
+        printf("NVME Identify Control__ler:\n");
+    printf("vid       : %#x\n", __le16_to_cpu(ctrl.vid));
+    printf("ssvid     : %#x\n", __le16_to_cpu(ctrl.ssvid));
+    printf("sn        : %-.*s\n", (int)sizeof(ctrl.sn), ctrl.sn);
+    printf("mn        : %-.*s\n", (int)sizeof(ctrl.mn), ctrl.mn);
+    printf("fr        : %-.*s\n", (int)sizeof(ctrl.fr), ctrl.fr);
+    printf("rab       : %d\n", ctrl.rab);
+    printf("ieee      : %02x%02x%02x\n",
+        ctrl.ieee[2], ctrl.ieee[1], ctrl.ieee[0]);
+    printf("cmic      : %#x\n", ctrl.cmic);
+    printf("mdts      : %d\n", ctrl.mdts);
+    printf("cntlid    : %#x\n", __le16_to_cpu(ctrl.cntlid));
+    printf("ver       : %#x\n", __le32_to_cpu(ctrl.ver));
+    printf("rtd3r     : %#x\n", __le32_to_cpu(ctrl.rtd3r));
+    printf("rtd3e     : %#x\n", __le32_to_cpu(ctrl.rtd3e));
+    printf("oaes      : %#x\n", __le32_to_cpu(ctrl.oaes));
+    printf("ctratt    : %#x\n", __le32_to_cpu(ctrl.ctratt));
+    printf("rrls      : %#x\n", __le16_to_cpu(ctrl.rrls));
+    printf("cntrltype : %d\n", ctrl.cntrltype);
+    printf("fguid     : %-.*s\n", (int)sizeof(ctrl.fguid), ctrl.fguid);
+    printf("crdt1     : %u\n", __le16_to_cpu(ctrl.crdt1));
+    printf("crdt2     : %u\n", __le16_to_cpu(ctrl.crdt2));
+    printf("crdt3     : %u\n", __le16_to_cpu(ctrl.crdt3));
+    printf("nvmsr     : %u\n", ctrl.nvmsr);
+    printf("vwci      : %u\n", ctrl.vwci);
+    printf("mec       : %u\n", ctrl.mec);
+    printf("oacs      : %#x\n", __le16_to_cpu(ctrl.oacs));
+    printf("acl       : %d\n", ctrl.acl);
+    printf("aerl      : %d\n", ctrl.aerl);
+    printf("frmw      : %#x\n", ctrl.frmw);
+    printf("lpa       : %#x\n", ctrl.lpa);
+    printf("elpe      : %d\n", ctrl.elpe);
+    printf("npss      : %d\n", ctrl.npss);
+    printf("avscc     : %#x\n", ctrl.avscc);
+    printf("apsta     : %#x\n", ctrl.apsta);
+    printf("wctemp    : %d\n", __le16_to_cpu(ctrl.wctemp));
+    printf("cctemp    : %d\n", __le16_to_cpu(ctrl.cctemp));
+    printf("mtfa      : %d\n", __le16_to_cpu(ctrl.mtfa));
+    printf("hmpre     : %d\n", __le32_to_cpu(ctrl.hmpre));
+    printf("hmmin     : %d\n", __le32_to_cpu(ctrl.hmmin));
+    printf("rpmbs     : %#x\n", __le32_to_cpu(ctrl.rpmbs));
+    printf("edstt     : %d\n", __le16_to_cpu(ctrl.edstt));
+    printf("dsto      : %d\n", ctrl.dsto);
+    printf("fwug      : %d\n", ctrl.fwug);
+    printf("kas       : %d\n", __le16_to_cpu(ctrl.kas));
+    printf("hctma     : %#x\n", __le16_to_cpu(ctrl.hctma));
+    printf("mntmt     : %d\n", __le16_to_cpu(ctrl.mntmt));
+    printf("mxtmt     : %d\n", __le16_to_cpu(ctrl.mxtmt));
+    printf("sanicap   : %#x\n", __le32_to_cpu(ctrl.sanicap));
+    printf("hmminds   : %d\n", __le32_to_cpu(ctrl.hmminds));
+    printf("hmmaxd    : %d\n", __le16_to_cpu(ctrl.hmmaxd));
+    printf("nsetidmax : %d\n", __le16_to_cpu(ctrl.nsetidmax));
+    printf("endgidmax : %d\n", __le16_to_cpu(ctrl.endgidmax));
+    printf("anatt     : %d\n", ctrl.anatt);
+    printf("anacap    : %d\n", ctrl.anacap);
+    printf("anagrpmax : %d\n", ctrl.anagrpmax);
+    printf("nanagrpid : %d\n", __le32_to_cpu(ctrl.nanagrpid));
+    printf("pels      : %d\n", __le32_to_cpu(ctrl.pels));
+    printf("domainid  : %d\n", __le16_to_cpu(ctrl.domainid));
+    printf("sqes      : %#x\n", ctrl.sqes);
+    printf("cqes      : %#x\n", ctrl.cqes);
+    printf("maxcmd    : %d\n", __le16_to_cpu(ctrl.maxcmd));
+    printf("nn        : %d\n", __le32_to_cpu(ctrl.nn));
+    printf("oncs      : %#x\n", __le16_to_cpu(ctrl.oncs));
+    printf("fuses     : %#x\n", __le16_to_cpu(ctrl.fuses));
+    printf("fna       : %#x\n", ctrl.fna);
+    printf("vwc       : %#x\n", ctrl.vwc);
+    printf("awun      : %d\n", __le16_to_cpu(ctrl.awun));
+    printf("awupf     : %d\n", __le16_to_cpu(ctrl.awupf));
+    printf("icsvscc     : %d\n", ctrl.icsvscc);
+    printf("nwpc      : %d\n", ctrl.nwpc);
+    printf("acwu      : %d\n", __le16_to_cpu(ctrl.acwu));
+    printf("ocfs      : %#x\n", __le16_to_cpu(ctrl.ocfs));
+    printf("sgls      : %#x\n", __le32_to_cpu(ctrl.sgls));
+    printf("mnan      : %d\n", __le32_to_cpu(ctrl.mnan));
+    printf("maxcna    : %d\n", __le32_to_cpu(ctrl.maxcna));
+    printf("subnqn    : %-.*s\n", (int)sizeof(ctrl.subnqn),
ctrl.subnqn);
+    printf("ioccsz    : %d\n", __le32_to_cpu(ctrl.ioccsz));
+    printf("iorcsz    : %d\n", __le32_to_cpu(ctrl.iorcsz));
+    printf("icdoff    : %d\n", __le16_to_cpu(ctrl.icdoff));
+    printf("fcatt     : %#x\n", ctrl.fcatt);
+    printf("msdbd     : %d\n", ctrl.msdbd);
+    printf("ofcs      : %d\n", __le16_to_cpu(ctrl.ofcs));
+}
+
+int parse_and_open_nvmemi(int argc, char **argv, const char *desc,
+    const struct argconfig_commandline_options *opts)
+{
+    int ret = 0;
+    ret = argconfig_parse(argc, argv, desc, opts);
+    if (ret < 0) {
+        return ret;
+    }
+
+    printf("Setting Sideband Interface to QEMU MI\n");
+    setsidebandinterface(qemu_nvme_mi);
+
+    return ret;
+}
+
+void msg_header_nvmemi(struct nvmemi_message_header_struct *str,
+    MI_COMMAND_TYPE cmdtype)
+{
+    if (cmdtype == COMMAND_TYPE_MI) {
+        str->message_type = 4;
+        str->ic = 1;
+        str->csi = 0;
+        str->reserved = 0;
+        str->nmimt = 1;
+        str->ror = 0;
+        str->reserved1 = 0;
+    } else if (cmdtype == COMMAND_TYPE_MI_ADMIN) {
+        str->message_type = 4;
+        str->ic = 1;
+        str->csi = 0;
+        str->reserved = 0;
+        str->nmimt = 2;
+        str->ror = 0;
+        str->reserved1 = 0;
+    }
+}
+
+void gencmd_nvmemi_init(struct gencmd_nvmemi *cmd,
+    struct nvmemi_message_header_struct str, __u32 opc, __u32 cdw0,
__u32 cdw1)
+{
+    cmd->msg_header = str;
+    cmd->opcode = opc;
+    cmd->reserved0 = 0;
+    cmd->reserved1 = 0;
+    cmd->reserved2 = 0;
+    cmd->cdw0 = cdw0;
+    cmd->cdw1 = cdw1;
+    cmd->buf = NULL;
+    cmd->mic = 0;
+}
+static int nvmemi_cmd_response(struct nvme_mi_cmd_resp *resp)
+{
+    int ret = -1;
+    ret = getresponsemessage((__u8 *)resp, sizeof(struct
nvme_mi_cmd_resp));
+    if (ret == -1) {
+        printf("Unable to fetch Management Response\n");
+    }
+    return ret;
+}
+
+static int nvmemi_readnvmemids(__u16 ctrlid, __u8 portid, __u8 dtyp)
+{
+    int retval = 0;
+    __u32 cdw0 = ctrlid | portid << 16 | dtyp << 24;
+    __u32 cdw1 = 0;
+
+    struct nvmemi_message_header_struct str;
+    msg_header_nvmemi(&str, COMMAND_TYPE_MI);
+
+    struct gencmd_nvmemi cmd;
+    gencmd_nvmemi_init(&cmd, str, nvmemi_cmd_readnvmemids, cdw0, cdw1);
+
+    /*Sending Command*/
+    retval = executecommand((__u8 *)&cmd);
+    if (retval == -1) {
+        return retval;
+    }
+
+    /*Checking Response*/
+    struct read_nvme_mi_data_struct_resp readNVMeDS = {};
+    struct nvme_mi_cmd_resp resp = {};
+
+    retval = nvmemi_cmd_response(&resp);
+    if (retval == -1) {
+        return retval;
+    }
+
+    /*Copy the Management Response*/
+    uint64_t address = (uint64_t)&resp;
+    memcpy(&readNVMeDS, (void *)(address + 5),
+        sizeof(struct read_nvme_mi_data_struct_resp));
+
+    if (readNVMeDS.resp_data_len == 0) {
+        printf("Response data length is 0 in NVMe Management
Response!\n");
+        return -1;
+    }
+
+    __u8 *Respbuffer = (__u8 *)malloc(readNVMeDS.resp_data_len);
+    if (Respbuffer == NULL) {
+        printf("Memory allocation error.\n");
+        return -1;
+    }
+
+    retval = getresponsedata(Respbuffer, readNVMeDS.resp_data_len,
true);
+    if (retval == -1) {
+        printf("Error : Failed to get command response!\n");
+        return retval;
+    }
+
+    if (dtyp == 0x0) {
+        struct nvme_subsys_info_data NVMeSubsysInfoDS = {};
+        memcpy(&NVMeSubsysInfoDS, Respbuffer,
readNVMeDS.resp_data_len);
+
+        printf("NVMe-MI Major Version Number = %u\n",
NVMeSubsysInfoDS.mjr);
+        printf("NVMe-MI Minor Version Number = %u\n",
NVMeSubsysInfoDS.mnr);
+        printf("Number of Ports = %u\n", NVMeSubsysInfoDS.nump);
+    } else if (dtyp == 0x4) {
+        struct option_sup_cmd_list_struct opCommandList = {};
+        memcpy(&opCommandList, Respbuffer, readNVMeDS.resp_data_len);
+
+        printf("Number of commands = %u\n", opCommandList.numcmd);
+    }
+
+    if (Respbuffer != NULL) {
+        free(Respbuffer);
+        Respbuffer = NULL;
+    }
+
+    return retval;
+}
+
+static int readnvmemids(int argc, char **argv, struct command *cmd,
+    struct plugin *plugin)
+{
+    const char *desc = "Read NVMe MI Data Structure";
+    const char *ctrlid = "Controller Identifier";
+    const char *portid = "Port Identifier";
+    const char *dtyp = "Data Structure Type";
+
+    int retval;
+    int err = -1;
+
+    struct config {
+        __u16 ctrlid;
+        __u8 portid;
+        __u8 dtyp;
+    };
+
+    struct config cfg;
+
+    OPT_ARGS(opts) = {
+        OPT_SHRT("ctrlid", 'c', &cfg.ctrlid, ctrlid),
+        OPT_BYTE("portid", 'p', &cfg.portid, portid),
+        OPT_BYTE("dtyp", 'd', &cfg.dtyp, dtyp),
+        OPT_END()
+    };
+
+    retval = parse_and_open_nvmemi(argc, argv, desc, opts);
+    if (retval < 0) {
+        printf("parse_and_open_nvmemi failed!\n");
+        return errno;
+    }
+
+    printf("Issuing readnvmemids Command, ctrlid:%"PRIx16" portid:%d
dtyp:%d\n",
+            (uint16_t)cfg.ctrlid, cfg.portid, cfg.dtyp);
+    err = nvmemi_readnvmemids(cfg.ctrlid, cfg.portid, cfg.dtyp);
+    if (!err) {
+        printf("readnvmemids: Success\n");
+    } else if (err > 0) {
+        printf("readnvmemids: Fail, ctrlid:%"PRIx16" portid:%d
dtyp:%d\n",
+            (uint16_t)cfg.ctrlid, cfg.portid, cfg.dtyp);
+    }
+
+    cleanup_nvmemi();
+    return err;
+}
+
+static int nvmemi_shspoll(__u8 cs)
+{
+    int retval = 0;
+    __u32 Reserved = 0;
+    __u32 cdw0 = Reserved | cs << 31;
+
+    struct nvmemi_message_header_struct str;
+    msg_header_nvmemi(&str, COMMAND_TYPE_MI);
+
+    struct gencmd_nvmemi cmd;
+    gencmd_nvmemi_init(&cmd, str, nvmemi_cmd_subsyshealthstpoll, cdw0,
0);
+
+    /*Sending Command*/
+    retval = executecommand((__u8 *)&cmd);
+    if (retval == -1) {
+        return retval;
+    }
+
+    /*Checking Response*/
+    struct nvm_subsys_health_struct subsysStruct = {};
+    uint16_t sizetocopy = sizeof(struct nvm_subsys_health_struct);
+
+    __u8 *Respbuffer = (__u8 *)malloc(sizetocopy);
+
+    if (Respbuffer == NULL) {
+        printf("Memory allocation error.\n");
+        return -1;
+    }
+
+    retval = getresponsedata(Respbuffer, sizetocopy, true);
+    if (retval == -1) {
+        printf("Error : Failed to get response data for the
command!\n");
+        return retval;
+    }
+
+    memcpy(&subsysStruct, Respbuffer, sizetocopy);
+
+    printf("**********COMMAND RESPONSE START**********\n");
+    printf("SMART Warnings = %u\n", subsysStruct.smart_warnings);
+    printf("Composite Temprature = %u\n", subsysStruct.composite_temp);
+    printf("Percentage Drive Life Used = %u\n",
subsysStruct.per_drv_life_used);
+    printf("**********COMMAND RESPONSE END**********\n");
+
+    if (Respbuffer != NULL) {
+        free(Respbuffer);
+        Respbuffer = NULL;
+    }
+
+    return retval;
+}
+
+static int shspoll(int argc, char **argv, struct command *cmd,
+    struct plugin *plugin)
+{
+    const char *desc = "NVM Subsystem Health Status Poll";
+    const char *cs = "Clear Status";
+
+    int retval;
+    int err = -1;
+
+    struct config {
+        __u8 cs;
+    };
+
+    struct config cfg;
+
+    OPT_ARGS(opts) = {
+        OPT_SHRT("cs", 'c', &cfg.cs, cs),
+        OPT_END()
+    };
+
+    retval = parse_and_open_nvmemi(argc, argv, desc, opts);
+    if (retval < 0) {
+        printf("parse_and_open_nvmemi failed!\n");
+        return errno;
+    }
+
+    printf("Issuing Subsystem Health Status Poll Command,
cs:%"PRIx8"\n",
+            (uint8_t)cfg.cs);
+    err = nvmemi_shspoll(cfg.cs);
+    if (!err) {
+        printf("NVM Subsystem Health Status Poll: Success\n");
+    } else if (err > 0) {
+        printf("NVM Subsystem Health Status Poll Fail,
ctrlid:%"PRIx8"\n",
+            (uint8_t)cfg.cs);
+    }
+
+    cleanup_nvmemi();
+    return err;
+}
+
+static int nvmemi_chspoll(__u32 cdw0, __u32 cdw1)
+{
+    int retval = 0;
+    struct nvmemi_message_header_struct str;
+    msg_header_nvmemi(&str, COMMAND_TYPE_MI);
+
+    struct gencmd_nvmemi cmd;
+    gencmd_nvmemi_init(&cmd, str, nvmemi_cmd_chsp, cdw0, cdw1);
+
+    /*Sending Command*/
+    retval = executecommand((__u8 *)&cmd);
+    if (retval == -1) {
+        return retval;
+    }
+
+    /*Checking Response*/
+    struct ctrl_health_status_poll_resp mgmtresp = {};
+    struct nvme_mi_cmd_resp resp = {};
+
+    retval = nvmemi_cmd_response(&resp);
+    if (retval == -1) {
+        return retval;
+    }
+
+    /*Copy the Management Response*/
+    uint64_t address = (uint64_t)&resp;
+    memcpy(&mgmtresp, (void *)(address + 5),
+        sizeof(struct ctrl_health_status_poll_resp));
+
+    if (mgmtresp.rent == 0) {
+        printf("The number of Response Entries is zero!\n");
+        return -1;
+    }
+
+    __u8 *Respbuffer = (__u8 *)malloc(mgmtresp.rent * \
+    sizeof(struct ctrl_health_data));
+    if (Respbuffer == NULL) {
+        printf("Memory allocation error.\n");
+        return -1;
+    }
+
+    retval = getresponsedata(Respbuffer,
+    mgmtresp.rent * sizeof(struct ctrl_health_data), true);
+    if (retval == -1) {
+        printf("Error : Failed to get command response!\n");
+        return retval;
+    }
+
+    struct ctrl_health_data chds = {};
+    memcpy(&chds, Respbuffer, sizeof(struct ctrl_health_data));
+
+    printf("Controller Identifier = %u\n", chds.ctlid);
+    printf("Composite Temprature = %u\n", chds.ctemp);
+    printf("Percentage Used = %u\n", chds.pdlu);
+    printf("Available Space = %u\n", chds.spare);
+
+    if (Respbuffer != NULL) {
+        free(Respbuffer);
+        Respbuffer = NULL;
+    }
+
+    return retval;
+}
+
+static int chspoll(int argc, char **argv, struct command *cmd,
+    struct plugin *plugin)
+{
+    const char *desc = "NVM Controller Health Status Poll";
+    const char *cdw0 = "Command DWORD0 Value";
+    const char *cdw1 = "Command DWORD1 Value";
+
+    int retval;
+    int err = -1;
+
+    struct config {
+        __u32 cdw0;
+        __u32 cdw1;
+    };
+
+    struct config cfg;
+
+    OPT_ARGS(opts) = {
+        OPT_SHRT("cdw0", 'c', &cfg.cdw0, cdw0),
+        OPT_SHRT("cdw1", 'd', &cfg.cdw1, cdw1),
+        OPT_END()
+    };
+
+    retval = parse_and_open_nvmemi(argc, argv, desc, opts);
+    if (retval < 0) {
+        printf("parse_and_open_nvmemi failed!\n");
+        return errno;
+    }
+
+    printf("Issuing Controller Health Status Poll Command, cdw0 : \
+         %"PRIx32" cdw1 : %"PRIx32"\n", cfg.cdw0, cfg.cdw1);
+
+    err = nvmemi_chspoll(cfg.cdw0, cfg.cdw1);
+    if (!err) {
+        printf("Controller Health Status Poll: Success\n");
+    } else if (err > 0) {
+        printf("Controller Health Status Poll Failed!\n");
+    }
+
+    cleanup_nvmemi();
+    return err;
+}
+
+static int nvmemi_configget(__u8 configid, __u8 portid)
+{
+    int retval = 0;
+    __u32 cdw0 = configid | portid << 24;
+    __u32 cdw1 = 0;
+
+    struct nvmemi_message_header_struct str;
+    msg_header_nvmemi(&str, COMMAND_TYPE_MI);
+
+    struct gencmd_nvmemi cmd;
+    gencmd_nvmemi_init(&cmd, str, nvmemi_cmd_configget, cdw0, cdw1);
+
+    /*Sending Command*/
+    retval = executecommand((__u8 *)&cmd);
+    if (retval == -1) {
+        return retval;
+    }
+
+    /*Checking Response*/
+    struct nvme_mi_cmd_resp resp = {};
+
+    retval = nvmemi_cmd_response(&resp);
+    if (retval == -1) {
+        return retval;
+    }
+
+
+    uint64_t address = (uint64_t)&resp;
+
+    if (configid == SMBUS_I2C_FREQ) {
+        struct smbus_i2c_freq_cfgget_resp mgmt_resp = {};
+        memcpy(&mgmt_resp, (void *)(address + 5),
+            sizeof(struct smbus_i2c_freq_cfgget_resp));
+        printf("SMBus frequency:%d\n", mgmt_resp.smbus_i2c_freq);
+    } else if (configid == MCTP_TRANS_UNIT_SIZE) {
+        struct mctp_tus_cfgget_resp mgmt_resp = {};
+        memcpy(&mgmt_resp, (void *)(address + 5),
+            sizeof(struct mctp_tus_cfgget_resp));
+        printf("MCTP Transmission unit size:%d\n" ,
+            mgmt_resp.mctp_trans_unit_size);
+    }
+
+    cleanup_nvmemi();
+    return retval;
+}
+
+static int configget(int argc, char **argv, struct command *cmd,
+    struct plugin *plugin)
+{
+    const char *desc = "Configuration Get";
+    const char *configid = "Configuration Identifier";
+    const char *portid = "Port Identifier";
+
+    int retval;
+    int err = -1;
+
+    struct config {
+        __u8 configid;
+        __u8 portid;
+    };
+
+    struct config cfg;
+
+    OPT_ARGS(opts) = {
+        OPT_BYTE("configid", 'c', &cfg.configid, configid),
+        OPT_BYTE("portid", 'p', &cfg.portid, portid),
+        OPT_END()
+    };
+
+    retval = parse_and_open_nvmemi(argc, argv, desc, opts);
+    if (retval < 0) {
+        printf("parse_and_open_nvmemi failed!\n");
+        return errno;
+    }
+
+    printf("Issuing Configuration Get  Command, configid:%d\t
portid:%d\n",
+            cfg.configid, cfg.portid);
+    err = nvmemi_configget(cfg.configid, cfg.portid);
+    return err;
+}
+
+static int nvmemi_configset(__u8 configid, __u8 portid, __u8 smbusfreq,
+    __u16 mctpunitsz)
+{
+    int retval = 0;
+    __u32 cdw0 = 0;
+    __u32 cdw1 = 0;
+
+    if (configid == SMBUS_I2C_FREQ) {
+        cdw0 = configid | smbusfreq << 8 | portid << 24;
+        cdw1 = 0;
+    } else if (configid == MCTP_TRANS_UNIT_SIZE) {
+        cdw0 = configid | portid << 24;
+        cdw1 = mctpunitsz;
+    }
+
+    struct nvmemi_message_header_struct str;
+    msg_header_nvmemi(&str, COMMAND_TYPE_MI);
+
+    struct gencmd_nvmemi cmd;
+    gencmd_nvmemi_init(&cmd, str, nvmemi_cmd_configset, cdw0, cdw1);
+
+    /*Sending Command*/
+    retval = executecommand((__u8 *)&cmd);
+    if (retval == -1) {
+        return retval;
+    }
+
+    cleanup_nvmemi();
+    return retval;
+}
+
+static int configset(int argc, char **argv, struct command *cmd,
+    struct plugin *plugin)
+{
+    const char *desc = "Configuration Set";
+    const char *configid = "Configuration Identifier";
+    const char *portid = "Port Identifier";
+    const char *smbusfreq = "SMBus I2C frequency";
+    const char *mctpunitsz = "MCTP Transmission Unit Size";
+
+    int retval;
+    int err = -1;
+
+    struct config {
+        __u8 configid;
+        __u8 portid;
+        __u8 smbusfreq;
+        __u16 mctpunitsz;
+    };
+
+    struct config cfg;
+
+    OPT_ARGS(opts) = {
+        OPT_BYTE("configid", 'c', &cfg.configid, configid),
+        OPT_BYTE("portid", 'p', &cfg.portid, portid),
+        OPT_BYTE("smbusfreq", 'f', &cfg.smbusfreq, smbusfreq),
+        OPT_BYTE("mctpunitsz", 's', &cfg.mctpunitsz, mctpunitsz),
+        OPT_END()
+    };
+
+    retval = parse_and_open_nvmemi(argc, argv, desc, opts);
+    if (retval < 0) {
+        printf("parse_and_open_nvmemi failed!\n");
+        return errno;
+    }
+
+    printf("Issuing Configuration Set Command \
+    configid:%d portid:%d smbusfreq:%d mctpunitsz:%d\n",
+        cfg.configid, cfg.portid, cfg.smbusfreq, cfg.mctpunitsz);
+    err = nvmemi_configset(cfg.configid, cfg.portid,
+        cfg.smbusfreq, cfg.mctpunitsz);
+    return err;
+}
+
+static int nvmemi_vpdread(__u16 dofst, __u16 dlen, char *file)
+{
+    int retval = 0;
+    __u32 cdw0 = dofst;
+    __u32 cdw1 = dlen;
+
+    struct nvmemi_message_header_struct str;
+    msg_header_nvmemi(&str, COMMAND_TYPE_MI);
+
+    struct gencmd_nvmemi cmd;
+    gencmd_nvmemi_init(&cmd, str, nvmemi_cmd_vpdread, cdw0, cdw1);
+
+    /*Sending Command*/
+    retval = executecommand((__u8 *)&cmd);
+    if (retval == -1) {
+        return retval;
+    }
+
+    /*Checking Response*/
+    struct nvme_mi_cmd_resp resp = {};
+
+    retval = nvmemi_cmd_response(&resp);
+    if (retval == -1) {
+        return retval;
+    }
+
+    int dfd = -1;
+    int opcode = 2;
+    int flags = opcode & 1 ? O_RDONLY : O_WRONLY | O_CREAT;
+    int mode = S_IRUSR | S_IWUSR | S_IRGRP | S_IWGRP | S_IROTH;
+    uint64_t address = (uint64_t)&resp;
+
+    if (strlen(file)) {
+        dfd = open(file, flags, mode);
+        if (dfd < 0) {
+            printf("Failed to open the file\n");
+        } else {
+            printf("Open successful\n");
+        }
+    }
+
+    int sz = write(dfd, (void *)(address + 8), dlen);
+    if (sz < 0) {
+        printf("Failed to write\n");
+    }
+
+    cleanup_nvmemi();
+    return retval;
+}
+
+static int vpdread(int argc, char **argv, struct command *cmd,
+    struct plugin *plugin)
+{
+    const char *desc = "VPD Read";
+    const char *dofst = "Data Offset";
+    const char *dlen = "Data Length";
+    const char *data = "Response Data";
+
+    int retval;
+    int err = -1;
+
+    struct config {
+        __u16 dofst;
+        __u16 dlen;
+        char *data;
+    };
+
+    struct config cfg;
+
+    OPT_ARGS(opts) = {
+        OPT_SHRT("dofst", 'o', &cfg.dofst, dofst),
+        OPT_SHRT("dlen", 'l', &cfg.dlen, dlen),
+        OPT_FILE("data", 'd', &cfg.data, data),
+        OPT_END()
+    };
+
+    retval = parse_and_open_nvmemi(argc, argv, desc, opts);
+    if (retval < 0) {
+        printf("parse_and_open_nvmemi failed!\n");
+        return errno;
+    }
+
+    printf("Issuing VPD Read Command, dofst:%d\t dlen:%d\n",
+            cfg.dofst, cfg.dlen);
+    err = nvmemi_vpdread(cfg.dofst, cfg.dlen, cfg.data);
+    return err;
+}
+
+static int nvmemi_vpdwrite(__u16 dofst, __u16 dlen, char *req_data)
+{
+    int retval = 0;
+    __u32 cdw0 = dofst;
+    __u32 cdw1 = dlen;
+
+    struct nvmemi_message_header_struct str;
+    msg_header_nvmemi(&str, COMMAND_TYPE_MI);
+
+    struct gencmd_nvmemi cmd = {
+        .msg_header = str,
+        .opcode = nvmemi_cmd_vpdread,
+        .reserved0 = 0,
+        .reserved1 = 0,
+        .reserved2 = 0,
+        .cdw0 = cdw0,
+        .cdw1 = cdw1,
+        .buf = (uint8_t *)req_data,
+        .mic = 0
+    };
+
+    /*Sending Command*/
+    retval = executecommand((__u8 *)&cmd);
+    if (retval == -1) {
+        return retval;
+    }
+
+    cleanup_nvmemi();
+    return retval;
+}
+
+static int vpdwrite(int argc, char **argv, struct command *cmd,
+    struct plugin *plugin)
+{
+    const char *desc = "VPD Write";
+    const char *dofst = "Data Offset";
+    const char *dlen = "Data Length";
+    const char *data = "Request Data";
+
+    int retval;
+    int err = -1;
+    int dfd = -1;
+    int opcode = 1;
+    int flags = opcode & 1 ? O_RDONLY : O_WRONLY | O_CREAT;
+    int mode = S_IRUSR | S_IWUSR | S_IRGRP | S_IWGRP | S_IROTH;
+
+    struct config {
+        __u16 dofst;
+        __u16 dlen;
+        char *data;
+    };
+
+    struct config cfg = {
+        .data = "",
+    };
+
+    OPT_ARGS(opts) = {
+        OPT_SHRT("dofst", 'o', &cfg.dofst, dofst),
+        OPT_SHRT("dlen", 'l', &cfg.dlen, dlen),
+        OPT_FILE("data", 'd', &cfg.data, data),
+        OPT_END()
+    };
+
+    retval = parse_and_open_nvmemi(argc, argv, desc, opts);
+    if (retval < 0) {
+        printf("parse_and_open_nvmemi failed!\n");
+        return errno;
+    }
+
+    if (strlen(cfg.data)) {
+        dfd = open(cfg.data, flags, mode);
+        if (dfd < 0) {
+            printf("Failed to open the file\n");
+        } else {
+            printf("Open successful\n");
+        }
+    }
+    char req_data[cfg.dlen];
+    int sz = read(dfd, req_data, cfg.dlen);
+    if (sz < 0) {
+        printf("Failed to read\n");
+    }
+    printf("Issuing VPD Write Command, dofst:%d\t dlen:%d\n",
+        cfg.dofst, cfg.dlen);
+    err = nvmemi_vpdwrite(cfg.dofst, cfg.dlen, req_data);
+    return err;
+}
+
+static int nvmemi_id(__u8 cns, __u16 cntid, __u16 nsid)
+{
+    __u32 data_len = 0;
+    int retval = 0;
+    __u32 cdw10 = 0;
+    cdw10 = cns | cntid << 16;
+
+    struct nvmemi_message_header_struct str;
+    msg_header_nvmemi(&str, COMMAND_TYPE_MI_ADMIN);
+
+    if (cns == NVME_ID_CNS_NS) {
+        data_len = sizeof(struct nvme_id_ns);
+    } else if (cns == NVME_ID_CNS_CTRL) {
+        data_len = sizeof(struct nvme_id_ctrl);
+    }
+
+    struct gencmd_nvmemi_admin cmd = {
+        .msg_header = str,
+        .opcode = NVME_ADMIN_IDENTIFY,
+        .cflgs = 0x3,
+        .ctlid = 0,
+        .nsid = nsid,
+        .cdw2 = 0,
+        .cdw3 = 0,
+        .cdw4 = 0,
+        .cdw5 = 0,
+        .dofst = 0,
+        .dlen = data_len,
+        .cdw8 = 0,
+        .cdw9 = 0,
+        .cdw10 = cdw10,
+        .cdw11 = 0,
+        .cdw12 = 0,
+        .cdw13 = 0,
+        .cdw14 = 0,
+        .cdw15 = 0,
+        .buf = NULL,
+        .mic = 0
+    };
+    /*Sending Command*/
+    retval = executecommand((__u8 *)&cmd);
+    if (retval == -1) {
+        return retval;
+    }
+
+    __u8 *Respbuffer = (__u8 *)malloc(data_len);
+    if (Respbuffer == NULL) {
+        printf("Memory allocation error.\n");
+        return -1;
+    }
+    memset(Respbuffer, 0, data_len);
+
+    retval = getresponsedata(Respbuffer, data_len, false);
+    if (retval == -1) {
+        printf("Error : Failed to get command response!\n");
+        return retval;
+    }
+
+    if (cns == NVME_ID_CNS_NS) {
+        struct nvme_id_ns idns = {};
+        memcpy(&idns, Respbuffer, 4096);
+        nvme_show_id_ns(idns, nsid);
+    } else if (cns == NVME_ID_CNS_CTRL) {
+        struct nvme_id_ctrl idctrl = {};
+        memcpy(&idctrl, Respbuffer, sizeof(struct nvme_id_ctrl));
+        nvme_show_id_ctrl(idctrl);
+    }
+
+    if (Respbuffer != NULL) {
+        free(Respbuffer);
+        Respbuffer = NULL;
+    }
+
+    return retval;
+}
+
+static int identify(int argc, char **argv, struct command *cmd,
+    struct plugin *plugin)
+{
+    const char *desc = "Identify Command";
+    char *cns = "Controller or Namespace Structure";
+    const char *cntid = "Controller Identifier";
+    const char *nsid = "Namespace ID";
+
+    struct config {
+        __u8 cns;
+        __u16 cntid;
+        __u16 nsid;
+    };
+    struct config cfg;
+
+    OPT_ARGS(opts) = {
+        OPT_SHRT("cns", 'c', &cfg.cns, cns),
+        OPT_BYTE("cntid", 'C', &cfg.cntid, cntid),
+        OPT_BYTE("nsid", 'i', &cfg.nsid, nsid),
+        OPT_END()
+    };
+
+    int retval = -1;
+    retval = parse_and_open_nvmemi(argc, argv, desc, opts);
+    if (retval < 0) {
+        printf("parse_and_open_nvmemi failed!\n");
+        return errno;
+    }
+
+    retval = nvmemi_id(cfg.cns, cfg.cntid, cfg.nsid);
+    if (!retval) {
+        printf("identify: Success\n");
+    } else if (retval > 0) {
+        printf("identify: Failed\n");
+    }
+
+    cleanup_nvmemi();
+    return retval;
+}
+
+static int nvmemi_getlog(__u8 log_id, __u8 lsp, __u64 lpo,
+                 __u16 lsi, bool rae, __u8 uuid_ix, __u32 data_len)
+{
+    __u32 numd = (data_len >> 2) - 1;
+    __u16 numdu = numd >> 16, numdl = numd & 0xffff;
+    __u32 cdw10 = log_id | (numdl << 16) | (rae ? 1 << 15 : 0) | lsp <<
8;
+    int retval = 0;
+
+    struct nvmemi_message_header_struct str;
+    msg_header_nvmemi(&str, COMMAND_TYPE_MI_ADMIN);
+
+    struct gencmd_nvmemi_admin cmd = {
+        .msg_header = str,
+        .opcode = NVME_ADMIN_GET_LOG_PAGE,
+        .cflgs = 0x3,
+        .ctlid = 0,
+        .nsid = 0,
+        .cdw2 = 0,
+        .cdw3 = 0,
+        .cdw4 = 0,
+        .cdw5 = 0,
+        .dofst = 0,
+        .dlen = data_len,
+        .cdw8 = 0,
+        .cdw9 = 0,
+        .cdw10 = cdw10,
+        .cdw11 = numdu | (lsi << 16),
+        .cdw12 = lpo & 0xffffffff,
+        .cdw13 = lpo >> 32,
+        .cdw14 = uuid_ix,
+        .cdw15 = 0,
+        .buf = NULL,
+        .mic = 0
+    };
+
+    /*Sending Command*/
+    retval = executecommand((__u8 *)&cmd);
+    if (retval == -1) {
+        return retval;
+    }
+
+    __u8 *Respbuffer = (__u8 *)malloc(data_len);
+    if (Respbuffer == NULL) {
+        printf("Memory allocation error.\n");
+        return -1;
+    }
+
+    retval = getresponsedata(Respbuffer, data_len, false);
+    if (retval == -1) {
+        printf("Error : Failed to get command response!\n");
+        return retval;
+    }
+
+    printf("sizeof logpage error info : 0x%lx\n",
+        sizeof(struct log_page_error_info));
+    if (log_id == 0x1) {
+        struct log_page_error_info resp = {};
+        memcpy(&resp, Respbuffer, sizeof(struct log_page_error_info));
+        printf("Error Count = %"PRIx64"\n", resp.errcnt);
+        printf("Submission Queue ID = %"PRIx16"\n", resp.subqid);
+        printf("Command ID = %"PRIx16"\n", resp.cid);
+        printf("Status Field = %"PRIx16"\n", resp.cid);
+        printf("LBA = %"PRIx64"\n", resp.lba);
+        printf("Namespace = %"PRIx32"\n", resp.ns);
+        printf("Vendor Specific Information Available = %"PRIx8"\n",
resp.ns);
+    }
+
+    if (Respbuffer != NULL) {
+        free(Respbuffer);
+        Respbuffer = NULL;
+    }
+
+    return retval;
+}
+
+static int getlog(int argc, char **argv, struct command *cmd,
+    struct plugin *plugin)
+{
+    const char *desc = "NVMe Get Log Page command via Sideband";
+    const char *log_id = "identifier of log to retrieve";
+    const char *log_len = "how many bytes to retrieve";
+    const char *lsp = "log specific field";
+    const char *lpo = "log page offset specifies the location within \
+    a log page from where to start returning data";
+    const char *rae = "retain an asynchronous event";
+    const char *uuid_index = "UUID index";
+    int retval = 0;
+
+    struct config {
+        __u8  log_id;
+        __u32 log_len;
+        __u64 lpo;
+        __u8  lsp;
+        __u8  uuid_index;
+        int   rae;
+    };
+
+    struct config cfg = {
+        .log_id       = 0xff,
+        .log_len      = 0,
+        .lpo          = NVME_NO_LOG_LPO,
+        .lsp          = NVME_NO_LOG_LSP,
+        .rae          = 0,
+        .uuid_index   = 0,
+    };
+
+    OPT_ARGS(opts) = {
+        OPT_UINT("log-id",       'i', &cfg.log_id,       log_id),
+        OPT_UINT("log-len",      'l', &cfg.log_len,      log_len),
+        OPT_LONG("lpo",          'o', &cfg.lpo,          lpo),
+        OPT_BYTE("lsp",          's', &cfg.lsp,          lsp),
+        OPT_FLAG("rae",          'r', &cfg.rae,          rae),
+        OPT_BYTE("uuid-index",   'U', &cfg.uuid_index,   uuid_index),
+        OPT_END()
+    };
+
+    retval = parse_and_open_nvmemi(argc, argv, desc, opts);
+    if (retval < 0) {
+        printf("parse_and_open_nvmemi failed!\n");
+        return errno;
+    }
+
+    retval = nvmemi_getlog(cfg.log_id,
+                     cfg.lsp, cfg.lpo, 0, cfg.rae,
+                     cfg.uuid_index, cfg.log_len);
+    if (!retval) {
+        printf("Get Log Page: Success\n");
+    } else if (retval > 0) {
+        printf("Get Log Page: Failed\n");
+    }
+
+    cleanup_nvmemi();
+    return retval;
+}
+
+static int nvmemi_getfeature(__u8 fid, __u8 sel, __u32 cdw11,
+    __u32 data_len)
+{
+    __u32 cdw10 = fid | sel << 8;
+    int retval = 0;
+
+    struct nvmemi_message_header_struct str;
+    msg_header_nvmemi(&str, COMMAND_TYPE_MI_ADMIN);
+
+    struct gencmd_nvmemi_admin cmd = {
+        .msg_header = str,
+        .opcode = NVME_ADMIN_GET_FEATURES,
+        .cflgs = 0x3,
+        .ctlid = 0,
+        .nsid = 0,
+        .cdw2 = 0,
+        .cdw3 = 0,
+        .cdw4 = 0,
+        .cdw5 = 0,
+        .dofst = 0,
+        .dlen = data_len,
+        .cdw8 = 0,
+        .cdw9 = 0,
+        .cdw10 = cdw10,
+        .cdw11 = cdw11,
+        .cdw12 = 0,
+        .cdw13 = 0,
+        .cdw14 = 0,
+        .cdw15 = 0,
+        .buf = NULL,
+        .mic = 0
+    };
+
+    /*Sending Command*/
+    retval = executecommand((__u8 *)&cmd);
+    if (retval == -1) {
+        return retval;
+    }
+
+    __u8 *Respbuffer = (__u8 *)malloc(data_len);
+    if (Respbuffer == NULL) {
+        printf("Memory allocation error.\n");
+        return -1;
+    }
+
+    retval = getresponsedata(Respbuffer, data_len, false);
+    if (retval == -1) {
+        printf("Error : Failed to get command response!\n");
+        return retval;
+    }
+
+    if (fid == NVME_FEAT_TEMP_THRESH) {
+        struct getf_temp_thres resp = {};
+        memcpy(&resp, Respbuffer, sizeof(struct getf_temp_thres));
+        printf("Temprature Threshold = %"PRIx16"\n", resp.tmpth);
+        printf("Threshold Temprature Select = %"PRIx16"\n",
resp.tmpsel);
+        printf("Threshold Type Select = %"PRIx16"\n", resp.thsel);
+    } else if (fid == NVME_FEAT_NUM_QUEUES) {
+        struct getf_no_queues resp = {};
+        memcpy(&resp, Respbuffer, sizeof(struct getf_no_queues));
+        printf("Number of I/O Submission Queues Requested = \
+        %"PRIx16"\n", resp.nsqa);
+        printf("Number of I/O Completion Queues Requested = \
+        %"PRIx16"\n", resp.ncqa);
+    }
+
+    if (Respbuffer != NULL) {
+        free(Respbuffer);
+        Respbuffer = NULL;
+    }
+
+    return retval;
+}
+
+static int getfeature(int argc, char **argv, struct command *cmd,
+    struct plugin *plugin)
+{
+    const char *desc = "NVMe Get Features Command via Sideband
Interface.";
+    const char *namespace_id = "identifier of desired namespace";
+    const char *feature_id = "feature identifier";
+    const char *sel = "[0-3]: current/default/saved/supported";
+    const char *data_len = "buffer len if data is returned \
+    through host memory buffer";
+    const char *cdw11 = "dword 11 for interrupt vector config";
+
+    int retval = 0;
+
+    struct config {
+        __u32 namespace_id;
+        __u8  feature_id;
+        __u8  sel;
+        __u32 cdw11;
+        __u32 data_len;
+    };
+
+    struct config cfg = {
+        .namespace_id = 0,
+        .feature_id   = 0,
+        .sel          = 0,
+        .cdw11        = 0,
+        .data_len     = 0,
+    };
+
+    OPT_ARGS(opts) = {
+        OPT_UINT("namespace-id",  'n', &cfg.namespace_id,
namespace_id),
+        OPT_UINT("feature-id",    'f', &cfg.feature_id,
feature_id),
+        OPT_BYTE("sel",           's', &cfg.sel,            sel),
+        OPT_UINT("data-len",      'l', &cfg.data_len,       data_len),
+        OPT_UINT("cdw11",         'c', &cfg.cdw11,          cdw11),
+        OPT_END()
+    };
+
+    retval = parse_and_open_nvmemi(argc, argv, desc, opts);
+    if (retval < 0) {
+        printf("parse_and_open_nvmemi failed!\n");
+        return errno;
+    }
+
+    retval = nvmemi_getfeature(cfg.feature_id,
+                     cfg.sel, cfg.cdw11, cfg.data_len);
+    if (!retval) {
+        printf("Get Log Page: Success\n");
+    } else if (retval > 0) {
+        printf("Get Log Page: Failed\n");
+    }
+
+    cleanup_nvmemi();
+    return retval;
+}
+
+int main(int argc, char **argv)
+{
+    int err;
+
+    nvme.extensions->parent = &nvme;
+    if (argc < 2) {
+        general_help(&builtin);
+        return 0;
+    }
+    setlocale(LC_ALL, "");
+
+    err = handle_plugin(argc - 1, &argv[1], nvme.extensions);
+    if (err == -ENOTTY) {
+        general_help(&builtin);
+    }
+    return err;
+}
diff --git
a/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/mi_nvme.h
b/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/mi_nvme.h
new file mode 100644
index 0000000..9bc2c8e
--- /dev/null
+++ b/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/mi_nvme.h
@@ -0,0 +1,232 @@
+/*
+ * Copyright (C) 2021 Samsung Electronics Inc. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License version
+ * 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ *
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+ * mi_nvme.h - Implementation of NVMe Management Interface commands in
Nvme
+ *
+ * Developer: Mohit Kapoor <mohit.kap@samsung.com>
+ *            Arun Kumar Kashinath Agasar <arun.kka@samsung.com>
+ */
+
+#undef CMD_INC_FILE
+#define CMD_INC_FILE mi_nvme
+
+#if !defined(MI) || defined(CMD_HEADER_MULTI_READ)
+#define MI
+
+#define NVME_FEAT_NUM_QUEUES      0x7
+#define NVME_FEAT_TEMP_THRESH     0x1
+#define NVME_ADMIN_GET_LOG_PAGE   0x2
+#define NVME_ADMIN_GET_FEATURES   0xA
+#define NVME_NO_LOG_LSP           0x0
+#define NVME_NO_LOG_LPO           0x0
+#define NVME_ADMIN_IDENTIFY       0x06
+#define NVME_ID_CNS_NS            0x00
+#define NVME_ID_CNS_CTRL          0x01
+#include "cmd.h"
+#include "plugin.h"
+#include <linux/types.h>
+
+
+    COMMAND_LIST(
+        ENTRY("readnvmemids", "nvme-mi : Read NVMe-MI Data Structure",
+              readnvmemids)
+        ENTRY("shspoll", "nvme-mi : NVM Subsystem Health Status Poll",
shspoll)
+        ENTRY("chspoll", "nvme-mi : Controller Health Status Poll",
chspoll)
+        ENTRY("configget", "nvme-mi : Configuration Get", configget)
+        ENTRY("configset", "nvme-mi : Configuration Set", configset)
+        ENTRY("vpdread", "nvme-mi : VPD Read", vpdread)
+        ENTRY("vpdwrite", "nvme-mi : VPD Write", vpdwrite)
+        ENTRY("identify", "nvme-mi-admin : Identify", identify)
+        ENTRY("getlogpage", "nvme-mi-admin : Get Log Page", getlog)
+        ENTRY("getfeatures", "nvme-mi-admin : Get Features",
getfeature)
+    );
+
+
+#endif
+
+#include "define_cmd.h"
+
+#ifndef STRUCT_H
+#define STRUCT_H
+enum nvme_print_flags {
+    NORMAL  = 0,
+    VERBOSE = 1 << 0,   /* verbosely decode complex values for humans
*/
+    JSON    = 1 << 1,   /* display in json format */
+    VS  = 1 << 2,   /* hex dump vendor specific data areas */
+    BINARY  = 1 << 3,   /* binary dump raw bytes */
+};
+
+struct nvme_id_power_state {
+    __le16          max_power;  /* centiwatts */
+    __u8            rsvd2;
+    __u8            flags;
+    __le32          entry_lat;  /* microseconds */
+    __le32          exit_lat;   /* microseconds */
+    __u8            read_tput;
+    __u8            read_lat;
+    __u8            write_tput;
+    __u8            write_lat;
+    __le16          idle_power;
+    __u8            idle_scale;
+    __u8            rsvd19;
+    __le16          active_power;
+    __u8            active_work_scale;
+    __u8            rsvd23[9];
+};
+
+struct nvme_id_ctrl {
+    __le16          vid;
+    __le16          ssvid;
+    char            sn[20];
+    char            mn[40];
+    char            fr[8];
+    __u8            rab;
+    __u8            ieee[3];
+    __u8            cmic;
+    __u8            mdts;
+    __le16          cntlid;
+    __le32          ver;
+    __le32          rtd3r;
+    __le32          rtd3e;
+    __le32          oaes;
+    __le32          ctratt;
+    __le16          rrls;
+    __u8            rsvd102[9];
+    __u8            cntrltype;
+    char            fguid[16];
+    __le16          crdt1;
+    __le16          crdt2;
+    __le16          crdt3;
+    __u8            rsvd134[119];
+    __u8            nvmsr;
+    __u8            vwci;
+    __u8            mec;
+    __le16          oacs;
+    __u8            acl;
+    __u8            aerl;
+    __u8            frmw;
+    __u8            lpa;
+    __u8            elpe;
+    __u8            npss;
+    __u8            avscc;
+    __u8            apsta;
+    __le16          wctemp;
+    __le16          cctemp;
+    __le16          mtfa;
+    __le32          hmpre;
+    __le32          hmmin;
+    __u8            tnvmcap[16];
+    __u8            unvmcap[16];
+    __le32          rpmbs;
+    __le16          edstt;
+    __u8            dsto;
+    __u8            fwug;
+    __le16          kas;
+    __le16          hctma;
+    __le16          mntmt;
+    __le16          mxtmt;
+    __le32          sanicap;
+    __le32          hmminds;
+    __le16          hmmaxd;
+    __le16          nsetidmax;
+    __le16          endgidmax;
+    __u8            anatt;
+    __u8            anacap;
+    __le32          anagrpmax;
+    __le32          nanagrpid;
+    __le32          pels;
+    __le16          domainid;
+    __u8            rsvd358[10];
+    __u8            megcap[16];
+    __u8            rsvd384[128];
+    __u8            sqes;
+    __u8            cqes;
+    __le16          maxcmd;
+    __le32          nn;
+    __le16          oncs;
+    __le16          fuses;
+    __u8            fna;
+    __u8            vwc;
+    __le16          awun;
+    __le16          awupf;
+    __u8            icsvscc;
+    __u8            nwpc;
+    __le16          acwu;
+    __le16          ocfs;
+    __le32          sgls;
+    __le32          mnan;
+    __u8            maxdna[16];
+    __le32          maxcna;
+    __u8            rsvd564[204];
+    char            subnqn[256];
+    __u8            rsvd1024[768];
+    __le32          ioccsz;
+    __le32          iorcsz;
+    __le16          icdoff;
+    __u8            fcatt;
+    __u8            msdbd;
+    __le16          ofcs;
+    __u8            rsvd1806[242];
+    struct nvme_id_power_state  psd[32];
+    __u8            vs[1024];
+};
+
+struct nvme_lbaf {
+    __le16          ms;
+    __u8            ds;
+    __u8            rp;
+};
+
+struct nvme_id_ns {
+    __le64          nsze;
+    __le64          ncap;
+    __le64          nuse;
+    __u8            nsfeat;
+    __u8            nlbaf;
+    __u8            flbas;
+    __u8            mc;
+    __u8            dpc;
+    __u8            dps;
+    __u8            nmic;
+    __u8            rescap;
+    __u8            fpi;
+    __u8            dlfeat;
+    __le16          nawun;
+    __le16          nawupf;
+    __le16          nacwu;
+    __le16          nabsn;
+    __le16          nabo;
+    __le16          nabspf;
+    __le16          noiob;
+    __u8            nvmcap[16];
+    __le16          npwg;
+    __le16          npwa;
+    __le16          npdg;
+    __le16          npda;
+    __le16          nows;
+    __le16          mssrl;
+    __le32          mcl;
+    __u8            msrc;
+    __u8            rsvd81[11];
+    __le32          anagrpid;
+    __u8            rsvd96[3];
+    __u8            nsattr;
+    __le16          nvmsetid;
+    __le16          endgid;
+    __u8            nguid[16];
+    __u8            eui64[8];
+    struct nvme_lbaf    lbaf[16];
+    __u8            rsvd192[192];
+    __u8            vs[3712];
+};
+#endif
diff --git
a/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/plugin.c
b/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/plugin.c
new file mode 100644
index 0000000..6554028
--- /dev/null
+++ b/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/plugin.c
@@ -0,0 +1,215 @@
+#include <errno.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <unistd.h>
+
+#include "plugin.h"
+#include "util/argconfig.h"
+
+static int version(struct plugin *plugin)
+{
+    struct program *prog = plugin->parent;
+
+    if (plugin->name) {
+        printf("%s %s version %s\n", prog->name, plugin->name,
plugin->version);
+    } else {
+        printf("%s version %s\n", prog->name, prog->version);
+    }
+    return 0;
+}
+
+static int help(int argc, char **argv, struct plugin *plugin)
+{
+    char man[0x100];
+    struct program *prog = plugin->parent;
+    char *str = argv[1];
+    int i;
+
+    if (argc == 1) {
+        general_help(plugin);
+        return 0;
+    }
+
+    for (i = 0; plugin->commands[i]; i++) {
+        struct command *cmd = plugin->commands[i];
+
+        if (strcmp(str, cmd->name)) {
+            if (!cmd->alias || (cmd->alias && strcmp(str, cmd->alias)))
{
+                continue;
+            }
+        }
+        if (plugin->name) {
+            sprintf(man, "%s-%s-%s", prog->name, plugin->name,
cmd->name);
+        } else {
+            sprintf(man, "%s-%s", prog->name, cmd->name);
+        }
+        if (execlp("man", "man", man, (char *)NULL)) {
+            perror(argv[1]);
+        }
+    }
+    return 0;
+}
+
+void usage(struct plugin *plugin)
+{
+    struct program *prog = plugin->parent;
+
+    if (plugin->name) {
+        printf("usage: %s %s %s\n", prog->name, plugin->name,
prog->usage);
+    } else {
+        printf("usage: %s %s\n", prog->name, prog->usage);
+    }
+}
+
+void general_help(struct plugin *plugin)
+{
+    struct program *prog = plugin->parent;
+    struct plugin *extension;
+    unsigned i = 0;
+    unsigned padding = 15;
+    unsigned curr_length = 0;
+    printf("%s-%s\n", prog->name, prog->version);
+
+    usage(plugin);
+
+    printf("\n");
+    print_word_wrapped(prog->desc, 0, 0);
+    printf("\n");
+
+    if (plugin->desc) {
+        printf("\n");
+        print_word_wrapped(plugin->desc, 0, 0);
+        printf("\n");
+    }
+
+    printf("\nThe following are all implemented sub-commands:\n");
+
+    /*
+     * iterate through all commands to get maximum length
+     * Still need to handle the case of ultra long strings,
+     * help messages, etc
+     */
+    for (; plugin->commands[i]; i++) {
+        curr_length = 2 + strlen(plugin->commands[i]->name);
+        if (padding < (curr_length)) {
+            padding = curr_length;
+        }
+    }
+    i = 0;
+    for (; plugin->commands[i]; i++) {
+        printf("  %-*s %s\n", padding, plugin->commands[i]->name,
+                    plugin->commands[i]->help);
+    }
+
+    printf("  %-*s %s\n", padding, "version", "Shows the program
version");
+    printf("  %-*s %s\n", padding, "help", "Display this help");
+    printf("\n");
+
+    if (plugin->name) {
+        printf("See '%s %s help <command>' for more information on a \
+        specific command\n", prog->name, plugin->name);
+    } else {
+        printf("See '%s help <command>' for more information on a \
+        specific command\n", prog->name);
+    }
+    /*
+     * The first plugin is the built-in. If we're not showing help for
the
+     * built-in, don't show the program's other extensions
+     */
+    if (plugin->name) {
+        return;
+    }
+    extension = prog->extensions->next;
+    if (!extension) {
+        return;
+    }
+    printf("\nThe following are all installed plugin extensions:\n");
+    while (extension) {
+        printf("  %-*s %s\n", 15, extension->name, extension->desc);
+        extension = extension->next;
+    }
+    printf("\nSee '%s <plugin> help' for more information on a
plugin\n",
+            prog->name);
+}
+
+int handle_plugin(int argc, char **argv, struct plugin *plugin)
+{
+    unsigned i = 0;
+    char *str = argv[0];
+    char use[0x100];
+
+    struct plugin *extension;
+    struct program *prog = plugin->parent;
+
+    if (!argc) {
+        general_help(plugin);
+        return 0;
+    }
+
+    if (!plugin->name) {
+        sprintf(use, "%s %s <device> [OPTIONS]", prog->name, str);
+    } else {
+        sprintf(use, "%s %s %s <device> [OPTIONS]", prog->name,
+        plugin->name, str);
+    }
+    argconfig_append_usage(use);
+
+    /*
+     * translate --help and --version into commands
+     */
+    while (*str == '-') {
+        str++;
+    }
+    if (!strcmp(str, "help")) {
+        return help(argc, argv, plugin);
+    }
+    if (!strcmp(str, "version")) {
+        return version(plugin);
+    }
+
+    for (; plugin->commands[i]; i++) {
+        struct command *cmd = plugin->commands[i];
+
+        if (strcmp(str, cmd->name)) {
+            if (!cmd->alias || (cmd->alias && strcmp(str, cmd->alias)))
{
+                continue;
+            }
+        }
+        return cmd->fn(argc, argv, cmd, plugin);
+    }
+
+    /*
+     * Check extensions only if this is running the built-in plugin
+     */
+    if (plugin->name) {
+        printf("ERROR: Invalid sub-command '%s' for plugin %s\n", str,
+        plugin->name);
+        return -ENOTTY;
+        }
+
+    extension = plugin->next;
+    while (extension) {
+        if (!strcmp(str, extension->name)) {
+            return handle_plugin(argc - 1, &argv[1], extension);
+        }
+        extension = extension->next;
+    }
+
+    /*
+     * If the command is executed with the extension name and
+     * command together ("plugin-command"), run the plug in
+     */
+    extension = plugin->next;
+    while (extension) {
+        if (!strncmp(str, extension->name, strlen(extension->name))) {
+            argv[0] += strlen(extension->name);
+            while (*argv[0] == '-') {
+                argv[0]++;
+            }
+            return handle_plugin(argc, &argv[0], extension);
+        }
+        extension = extension->next;
+    }
+    printf("ERROR: Invalid sub-command '%s'\n", str);
+    return -ENOTTY;
+}
diff --git
a/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/plugin.h
b/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/plugin.h
new file mode 100644
index 0000000..358082f
--- /dev/null
+++ b/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/plugin.h
@@ -0,0 +1,39 @@
+#ifndef PLUGIN_H
+#define PLUGIN_H
+
+#include <stdbool.h>
+
+struct program {
+    const char *name;
+    const char *version;
+    const char *usage;
+    const char *desc;
+    const char *more;
+    struct command **commands;
+    struct plugin *extensions;
+};
+
+struct plugin {
+    const char *name;
+    const char *desc;
+    const char *version;
+    struct command **commands;
+    struct program *parent;
+    struct plugin *next;
+    struct plugin *tail;
+};
+
+struct command {
+    char *name;
+    char *help;
+    int (*fn)(int argc, char **argv, struct command *command,
+    struct plugin *plugin);
+    char *alias;
+};
+
+void usage(struct plugin *plugin);
+void general_help(struct plugin *plugin);
+int handle_plugin(int argc, char **argv, struct plugin *plugin);
+
+
+#endif
diff --git
a/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/util/argconfig.c
b/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/util/argconfig.c
new file mode 100644
index 0000000..341a049
--- /dev/null
+++
b/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/util/argconfig.c
@@ -0,0 +1,545 @@
+/*
+ * Copyright 2014 PMC-Sierra, Inc.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version 2
+ * of the License, or (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
02110-1301, USA.
+ *
+ */
+
+/*
+ *
+ *   Author: Logan Gunthorpe
+ *
+ *   Date:   Oct 23 2014
+ *
+ *   Description:
+ *     Functions for parsing command line options.
+ *
+ */
+
+#include "argconfig.h"
+#include "suffix.h"
+
+#include <errno.h>
+#include <inttypes.h>
+#include <getopt.h>
+#include <limits.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <stdarg.h>
+#include <string.h>
+
+static argconfig_help_func *help_funcs[MAX_HELP_FUNC] = { NULL };
+
+static char END_DEFAULT[] = "__end_default__";
+
+static const char *append_usage_str = "";
+
+void argconfig_append_usage(const char *str)
+{
+	append_usage_str = str;
+}
+
+void print_word_wrapped(const char *s, int indent, int start)
+{
+	const int width = 76;
+	const char *c, *t;
+	int next_space = -1;
+	int last_line = indent;
+
+	while (start < indent) {
+		putc(' ', stderr);
+		start++;
+	}
+
+	for (c = s; *c != 0; c++) {
+		if (*c == '\n')
+			goto new_line;
+
+		if (*c == ' ' || next_space < 0) {
+			next_space = 0;
+			for (t = c + 1; *t != 0 && *t != ' '; t++)
+				next_space++;
+
+			if (((int)(c - s) + start + next_space) >
(last_line - indent + width)) {
+				int i;
+new_line:
+				last_line = (int) (c-s) + start;
+				putc('\n', stderr);
+				for (i = 0; i < indent; i++)
+					putc(' ', stderr);
+				start = indent;
+				continue;
+			}
+		}
+		putc(*c, stderr);
+	}
+}
+
+static void show_option(const struct argconfig_commandline_options
*option)
+{
+	char buffer[0x1000];
+	char *b = buffer;
+
+	b += sprintf(b, "  [ ");
+	if (option->option) {
+		b += sprintf(b, " --%s", option->option);
+		if (option->argument_type == optional_argument)
+			b += sprintf(b, "[=<%s>]", option->meta ?
option->meta : "arg");
+		if (option->argument_type == required_argument)
+			b += sprintf(b, "=<%s>", option->meta ?
option->meta : "arg");
+		if (option->short_option)
+			b += sprintf(b, ",");
+	}
+	if (option->short_option) {
+		b += sprintf(b, " -%c", option->short_option);
+		if (option->argument_type == optional_argument)
+			b += sprintf(b, " [<%s>]", option->meta ?
option->meta : "arg");
+		if (option->argument_type == required_argument)
+			b += sprintf(b, " <%s>", option->meta ?
option->meta : "arg");
+	}
+	b += sprintf(b, " ] ");
+
+	fprintf(stderr, "%s", buffer);
+	if (option->help) {
+		print_word_wrapped("--- ", 40, b - buffer);
+		print_word_wrapped(option->help, 44, 44);
+	}
+	fprintf(stderr, "\n");
+}
+
+void argconfig_print_help(const char *program_desc,
+			  const struct argconfig_commandline_options
*options)
+{
+	const struct argconfig_commandline_options *s;
+
+	printf("\033[1mUsage: %s\033[0m\n\n",
+	       append_usage_str);
+
+	print_word_wrapped(program_desc, 0, 0);
+	printf("\n");
+
+	if (!options || !options->option)
+		return;
+
+	printf("\n\033[1mOptions:\033[0m\n");
+	for (s = options; (s->option != NULL) && (s != NULL); s++)
+		show_option(s);
+}
+
+int argconfig_parse(int argc, char *argv[], const char *program_desc,
+		    const struct argconfig_commandline_options *options)
+{
+	char *short_opts;
+	char *endptr;
+	struct option *long_opts;
+	const struct argconfig_commandline_options *s;
+	int c, option_index = 0, short_index = 0, options_count = 0;
+	void *value_addr;
+	int ret = -EINVAL;
+
+	errno = 0;
+	for (s = options; s->option != NULL; s++)
+		options_count++;
+
+	long_opts = malloc(sizeof(struct option) * (options_count + 2));
+	short_opts = malloc(sizeof(*short_opts) * (options_count * 3 +
4));
+
+	if (!long_opts || !short_opts) {
+		fprintf(stderr, "failed to allocate memory for opts:
%s\n",
+				strerror(errno));
+		ret = -errno;
+		goto out;
+	}
+
+	for (s = options; (s->option != NULL) && (option_index <
options_count);
+	     s++) {
+		if (s->short_option != 0) {
+			short_opts[short_index++] = s->short_option;
+			if (s->argument_type == required_argument ||
+			    s->argument_type == optional_argument)
+				short_opts[short_index++] = ':';
+			if (s->argument_type == optional_argument)
+				short_opts[short_index++] = ':';
+		}
+		if (s->option && strlen(s->option)) {
+			long_opts[option_index].name = s->option;
+			long_opts[option_index].has_arg =
s->argument_type;
+
+			if (s->argument_type == no_argument
+			    && s->default_value != NULL) {
+				value_addr = (void *)(char
*)s->default_value;
+
+				long_opts[option_index].flag =
value_addr;
+				long_opts[option_index].val = 1;
+			} else {
+				long_opts[option_index].flag = NULL;
+				long_opts[option_index].val = 0;
+			}
+		}
+		option_index++;
+	}
+
+	long_opts[option_index].name = "help";
+	long_opts[option_index].flag = NULL;
+	long_opts[option_index].val = 'h';
+	option_index++;
+
+	long_opts[option_index].name = NULL;
+	long_opts[option_index].flag = NULL;
+	long_opts[option_index].val = 0;
+
+	short_opts[short_index++] = '?';
+	short_opts[short_index++] = 'h';
+	short_opts[short_index] = 0;
+
+	optind = 0;
+	while ((c = getopt_long_only(argc, argv, short_opts, long_opts,
+				&option_index)) != -1) {
+		if (c != 0) {
+			if (c == '?' || c == 'h') {
+				argconfig_print_help(program_desc,
options);
+				goto out;
+			}
+			for (option_index = 0; option_index <
options_count;
+			     option_index++) {
+				if (c ==
options[option_index].short_option)
+					break;
+			}
+			if (option_index == options_count)
+				continue;
+			if (long_opts[option_index].flag) {
+				*(uint8_t
*)(long_opts[option_index].flag) = 1;
+				continue;
+			}
+		}
+
+		s = &options[option_index];
+		value_addr = (void *)(char *)s->default_value;
+		if (s->config_type == CFG_STRING) {
+			*((char **)value_addr) = optarg;
+		} else if (s->config_type == CFG_SIZE) {
+			*((size_t *) value_addr) = strtol(optarg,
&endptr, 0);
+			if (errno || optarg == endptr) {
+				fprintf(stderr,
+					"Expected integer argument for
'%s' but got '%s'!\n",
+					long_opts[option_index].name,
optarg);
+				goto out;
+			}
+		} else if (s->config_type == CFG_INT) {
+			*((int *)value_addr) = strtol(optarg, &endptr,
0);
+			if (errno || optarg == endptr) {
+				fprintf(stderr,
+					"Expected integer argument for
'%s' but got '%s'!\n",
+					long_opts[option_index].name,
optarg);
+				goto out;
+			}
+		} else if (s->config_type == CFG_BOOL) {
+			int tmp = strtol(optarg, &endptr, 0);
+			if (errno || tmp < 0 || tmp > 1 || optarg ==
endptr) {
+				fprintf(stderr,
+					"Expected 0 or 1 argument for
'%s' but got '%s'!\n",
+					long_opts[option_index].name,
optarg);
+				goto out;
+			}
+			*((int *)value_addr) = tmp;
+		} else if (s->config_type == CFG_BYTE) {
+			unsigned long tmp = strtoul(optarg, &endptr, 0);
+			if (errno || tmp >= (1 << 8)  || optarg ==
endptr) {
+				fprintf(stderr,
+					"Expected byte argument for '%s'
but got '%s'!\n",
+					long_opts[option_index].name,
optarg);
+				goto out;
+			}
+			*((uint8_t *) value_addr) = tmp;
+		} else if (s->config_type == CFG_SHORT) {
+			unsigned long tmp = strtoul(optarg, &endptr, 0);
+			if (errno || tmp >= (1 << 16) || optarg ==
endptr) {
+				fprintf(stderr,
+					"Expected short argument for
'%s' but got '%s'!\n",
+					long_opts[option_index].name,
optarg);
+				goto out;
+			}
+			*((uint16_t *) value_addr) = tmp;
+		} else if (s->config_type == CFG_POSITIVE) {
+			uint32_t tmp = strtoul(optarg, &endptr, 0);
+			if (errno || optarg == endptr) {
+				fprintf(stderr,
+					"Expected word argument for '%s'
but got '%s'!\n",
+					long_opts[option_index].name,
optarg);
+				goto out;
+			}
+			*((uint32_t *) value_addr) = tmp;
+		} else if (s->config_type == CFG_INCREMENT) {
+			(*((int *)value_addr))++;
+		} else if (s->config_type == CFG_LONG) {
+			*((unsigned long *)value_addr) = strtoul(optarg,
&endptr, 0);
+			if (errno || optarg == endptr) {
+				fprintf(stderr,
+					"Expected long integer argument
for '%s' but got '%s'!\n",
+					long_opts[option_index].name,
optarg);
+				goto out;
+			}
+		} else if (s->config_type == CFG_LONG_SUFFIX) {
+			*((uint64_t *)value_addr) =
suffix_binary_parse(optarg);
+			if (errno) {
+				fprintf(stderr,
+					"Expected long suffixed integer
argument for '%s' but got '%s'!\n",
+					long_opts[option_index].name,
optarg);
+				goto out;
+			}
+		} else if (s->config_type == CFG_DOUBLE) {
+			*((double *)value_addr) = strtod(optarg,
&endptr);
+			if (errno || optarg == endptr) {
+				fprintf(stderr,
+					"Expected float argument for
'%s' but got '%s'!\n",
+					long_opts[option_index].name,
optarg);
+				goto out;
+			}
+		} else if (s->config_type == CFG_SUBOPTS) {
+			char **opts = ((char **)value_addr);
+			int remaining_space = CFG_MAX_SUBOPTS;
+			int enddefault = 0;
+			int r;
+			while (0 && *opts != NULL) {
+				if (*opts == END_DEFAULT)
+					enddefault = 1;
+				remaining_space--;
+				opts++;
+			}
+
+			if (!enddefault) {
+				*opts = END_DEFAULT;
+				remaining_space -= 2;
+				opts += 2;
+			}
+
+			r = argconfig_parse_subopt_string(optarg, opts,
+					remaining_space);
+			if (r == 2) {
+				fprintf(stderr,
+					"Error Parsing Sub-Options: Too
many options!\n");
+				goto out;
+			} else if (r) {
+				fprintf(stderr, "Error Parsing
Sub-Options\n");
+				goto out;
+			}
+		} else if (s->config_type == CFG_FILE_A ||
+			   s->config_type == CFG_FILE_R ||
+			   s->config_type == CFG_FILE_W ||
+			   s->config_type == CFG_FILE_AP ||
+			   s->config_type == CFG_FILE_RP ||
+			   s->config_type == CFG_FILE_WP) {
+			const char *fopts = "";
+			FILE *f;
+			if (s->config_type == CFG_FILE_A)
+				fopts = "a";
+			else if (s->config_type == CFG_FILE_R)
+				fopts = "r";
+			else if (s->config_type == CFG_FILE_W)
+				fopts = "w";
+			else if (s->config_type == CFG_FILE_AP)
+				fopts = "a+";
+			else if (s->config_type == CFG_FILE_RP)
+				fopts = "r+";
+			else if (s->config_type == CFG_FILE_WP)
+				fopts = "w+";
+
+			f = fopen(optarg, fopts);
+			if (f == NULL) {
+				fprintf(stderr, "Unable to open %s file:
%s\n",
+					s->option, optarg);
+				goto out;
+			}
+			*((FILE **) value_addr) = f;
+		}
+	}
+	free(short_opts);
+	free(long_opts);
+
+	return 0;
+ out:
+	free(short_opts);
+	free(long_opts);
+	return ret;
+}
+
+int argconfig_parse_subopt_string(char *string, char **options,
+				  size_t max_options)
+{
+	char **o = options;
+	char *tmp;
+	size_t toklen;
+
+	if (!string || !strlen(string)) {
+		*(o++) = NULL;
+		*(o++) = NULL;
+		return 0;
+	}
+
+	tmp = calloc(strlen(string) + 2, 1);
+	if (!tmp)
+		return 1;
+	strcpy(tmp, string);
+
+	toklen = strcspn(tmp, "=");
+
+	if (!toklen) {
+		free(tmp);
+		return 1;
+	}
+
+	*(o++) = tmp;
+	tmp[toklen] = 0;
+	tmp += toklen + 1;
+
+	while (1) {
+		if (*tmp == '"' || *tmp == '\'' || *tmp == '[' || *tmp
== '(' ||
+		    *tmp == '{') {
+
+			tmp++;
+			toklen = strcspn(tmp, "\"'])}");
+
+			if (!toklen)
+				return 1;
+
+			*(o++) = tmp;
+			tmp[toklen] = 0;
+			tmp += toklen + 1;
+
+			toklen = strcspn(tmp, ";:,");
+			tmp[toklen] = 0;
+			tmp += toklen + 1;
+		} else {
+			toklen = strcspn(tmp, ";:,");
+
+			if (!toklen)
+				return 1;
+
+			*(o++) = tmp;
+			tmp[toklen] = 0;
+			tmp += toklen + 1;
+		}
+
+		toklen = strcspn(tmp, "=");
+
+		if (!toklen)
+			break;
+
+		*(o++) = tmp;
+		tmp[toklen] = 0;
+		tmp += toklen + 1;
+
+		if ((o - options) > (max_options - 2))
+			return 2;
+	}
+
+	*(o++) = NULL;
+	*(o++) = NULL;
+
+	return 0;
+}
+
+int argconfig_parse_comma_sep_array(char *string, int *val,
+					 unsigned max_length)
+{
+	int ret = 0;
+	unsigned long v;
+	char *tmp;
+	char *p;
+
+	if (!string || !strlen(string))
+		return 0;
+
+	tmp = strtok(string, ",");
+	if (!tmp)
+		return 0;
+
+	v = strtoul(tmp, &p, 0);
+	if (*p != 0)
+		return -1;
+	if (v > UINT_MAX) {
+		fprintf(stderr, "%s out of range\n", tmp);
+		return -1;
+	}
+	val[ret] = v;
+
+	ret++;
+	while (1) {
+		tmp = strtok(NULL, ",");
+
+		if (tmp == NULL)
+			return ret;
+
+		if (ret >= max_length)
+			return -1;
+
+		v = strtoul(tmp, &p, 0);
+		if (*p != 0)
+			return -1;
+		if (v > UINT_MAX) {
+			fprintf(stderr, "%s out of range\n", tmp);
+			return -1;
+		}
+		val[ret] = v;
+		ret++;
+	}
+}
+
+int argconfig_parse_comma_sep_array_long(char *string,
+					      unsigned long long *val,
+					      unsigned max_length)
+{
+	int ret = 0;
+	char *tmp;
+	char *p;
+
+	if (!string || !strlen(string))
+		return 0;
+
+	tmp = strtok(string, ",");
+	if (tmp == NULL)
+		return 0;
+
+	val[ret] = strtoll(tmp, &p, 0);
+	if (*p != 0)
+		return -1;
+	ret++;
+	while (1) {
+		tmp = strtok(NULL, ",");
+
+		if (tmp == NULL)
+			return ret;
+
+		if (ret >= max_length)
+			return -1;
+
+		val[ret] = strtoll(tmp, &p, 0);
+		if (*p != 0)
+			return -1;
+		ret++;
+	}
+}
+
+void argconfig_register_help_func(argconfig_help_func * f)
+{
+	int i;
+	for (i = 0; i < MAX_HELP_FUNC; i++) {
+		if (help_funcs[i] == NULL) {
+			help_funcs[i] = f;
+			help_funcs[i + 1] = NULL;
+			break;
+		}
+	}
+}
diff --git
a/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/util/argconfig.h
b/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/util/argconfig.h
new file mode 100644
index 0000000..3147277
--- /dev/null
+++
b/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/util/argconfig.h
@@ -0,0 +1,130 @@
+/*
+ *
+ * Copyright 2014 PMC-Sierra, Inc.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version 2
+ * of the License, or (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
02110-1301, USA.
+ *
+ */
+
+/*
+ *
+ *   Author: Logan Gunthorpe <logang@deltatee.com>
+ *           Logan Gunthorpe
+ *
+ *   Date:   Oct 23 2014
+ *
+ *   Description:
+ *     Header file for argconfig.c
+ *
+ */
+
+#ifndef argconfig_H
+#define argconfig_H
+
+#include <string.h>
+#include <getopt.h>
+#include <stdarg.h>
+
+enum argconfig_types {
+	CFG_NONE,
+	CFG_STRING,
+	CFG_INT,
+	CFG_SIZE,
+	CFG_LONG,
+	CFG_LONG_SUFFIX,
+	CFG_DOUBLE,
+	CFG_BOOL,
+	CFG_BYTE,
+	CFG_SHORT,
+	CFG_POSITIVE,
+	CFG_INCREMENT,
+	CFG_SUBOPTS,
+	CFG_FILE_A,
+	CFG_FILE_W,
+	CFG_FILE_R,
+	CFG_FILE_AP,
+	CFG_FILE_WP,
+	CFG_FILE_RP,
+};
+
+#define OPT_ARGS(n) \
+	const struct argconfig_commandline_options n[]
+
+#define OPT_END() { NULL }
+
+#define OPT_FLAG(l, s, v, d) \
+	{l, s, NULL, CFG_NONE, v, no_argument, d}
+
+#define OPT_SUFFIX(l, s, v, d) \
+	{l, s, "IONUM", CFG_LONG_SUFFIX, v, required_argument, d}
+
+#define OPT_LONG(l, s, v, d) \
+	{l, s, "NUM", CFG_LONG, v, required_argument, d}
+
+#define OPT_UINT(l, s, v, d) \
+	{l, s, "NUM", CFG_POSITIVE, v, required_argument, d}
+
+#define OPT_INT(l, s, v, d) \
+	{l, s, "NUM", CFG_INT, v, required_argument, d}
+
+#define OPT_LONG(l, s, v, d) \
+	{l, s, "NUM", CFG_LONG, v, required_argument, d}
+
+#define OPT_DOUBLE(l, s, v, d) \
+	{l, s, "NUM", CFG_DOUBLE, v, required_argument, d}
+
+#define OPT_BYTE(l, s, v, d) \
+	{l, s, "NUM", CFG_BYTE, v, required_argument, d}
+
+#define OPT_SHRT(l, s, v, d) \
+	{l, s, "NUM", CFG_SHORT, v, required_argument, d}
+
+#define OPT_STRING(l, s, m, v, d) \
+	{l, s, m, CFG_STRING, v, required_argument, d}
+
+#define OPT_FMT(l, s, v, d)  OPT_STRING(l, s, "FMT", v, d)
+#define OPT_FILE(l, s, v, d) OPT_STRING(l, s, "FILE", v, d)
+#define OPT_LIST(l, s, v, d) OPT_STRING(l, s, "LIST", v, d)
+
+struct argconfig_commandline_options {
+	const char *option;
+	const char short_option;
+	const char *meta;
+	enum argconfig_types config_type;
+	void *default_value;
+	int argument_type;
+	const char *help;
+};
+
+#define CFG_MAX_SUBOPTS 500
+#define MAX_HELP_FUNC 20
+
+typedef void argconfig_help_func();
+void argconfig_append_usage(const char *str);
+void argconfig_print_help(const char *program_desc,
+			  const struct argconfig_commandline_options
*options);
+int argconfig_parse(int argc, char *argv[], const char *program_desc,
+		    const struct argconfig_commandline_options
*options);
+int argconfig_parse_subopt_string(char *string, char **options,
+				  size_t max_options);
+int argconfig_parse_comma_sep_array(char *string, int *ret,
+					 unsigned max_length);
+int argconfig_parse_comma_sep_array_long(char *string,
+					      unsigned long long *ret,
+					      unsigned max_length);
+void argconfig_register_help_func(argconfig_help_func * f);
+
+void print_word_wrapped(const char *s, int indent, int start);
+#endif
diff --git
a/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/util/suffix.c
b/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/util/suffix.c
new file mode 100644
index 0000000..bf1485f
--- /dev/null
+++ b/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/util/suffix.c
@@ -0,0 +1,132 @@
+/*
+ *
+ * Copyright 2014 PMC-Sierra, Inc.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version 2
+ * of the License, or (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
02110-1301, USA.
+ *
+ */
+
+/*
+ *
+ *   Author: Logan Gunthorpe
+ *
+ *   Date:   Oct 23 2014
+ *
+ *   Description:
+ *     Functions for dealing with number suffixes
+ *
+ */
+
+#include "suffix.h"
+
+#include <stdlib.h>
+#include <ctype.h>
+#include <errno.h>
+#include <math.h>
+
+static struct si_suffix {
+	double magnitude;
+	const char *suffix;
+} si_suffixes[] = {
+	{1e15, "P"},
+	{1e12, "T"},
+	{1e9, "G"},
+	{1e6, "M"},
+	{1e3, "k"},
+	{1e0, ""},
+	{1e-3, "m"},
+	{1e-6, "u"},
+	{1e-9, "n"},
+	{1e-12, "p"},
+	{1e-15, "f"},
+	{0}
+};
+
+const char *suffix_si_get(double *value)
+{
+	struct si_suffix *s;
+
+	for (s = si_suffixes; s->magnitude != 0; s++) {
+		if (*value >= s->magnitude) {
+			*value /= s->magnitude;
+			return s->suffix;
+		}
+	}
+
+	return "";
+}
+
+static struct binary_suffix {
+	int shift;
+	const char *suffix;
+} binary_suffixes[] = {
+	{50, "Pi"},
+	{40, "Ti"},
+	{30, "Gi"},
+	{20, "Mi"},
+	{10, "Ki"},
+	{0, ""}
+};
+
+const char *suffix_binary_get(long long *value)
+{
+	struct binary_suffix *s;
+
+	for (s = binary_suffixes; s->shift != 0; s++) {
+		if (llabs(*value) >= (1LL << s->shift)) {
+			*value =
+			    (*value + (1LL << (s->shift - 1))) / (1LL <<
s->shift);
+			return s->suffix;
+		}
+	}
+
+	return "";
+}
+
+const char *suffix_dbinary_get(double *value)
+{
+	struct binary_suffix *s;
+
+	for (s = binary_suffixes; s->shift != 0; s++) {
+		if (fabs(*value) >= (1LL << s->shift)) {
+			*value = *value / (1LL << s->shift);
+			return s->suffix;
+		}
+	}
+
+	return "";
+}
+
+uint64_t suffix_binary_parse(const char *value)
+{
+	char *suffix;
+	errno = 0;
+	uint64_t ret = strtoll(value, &suffix, 0);
+	if (errno)
+		return 0;
+
+	struct binary_suffix *s;
+	for (s = binary_suffixes; s->shift != 0; s++) {
+		if (tolower(suffix[0]) == tolower(s->suffix[0])) {
+			ret <<= s->shift;
+			return ret;
+		}
+	}
+
+	if (suffix[0] != '\0')
+		errno = EINVAL;
+
+	return ret;
+}
diff --git
a/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/util/suffix.h
b/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/util/suffix.h
new file mode 100644
index 0000000..278f472
--- /dev/null
+++ b/nvme-cli-master/stand_alone_mi_tool/nvme-cli-master/util/suffix.h
@@ -0,0 +1,41 @@
+/*
+ *
+ * Copyright 2014 PMC-Sierra, Inc.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version 2
+ * of the License, or (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
02110-1301, USA.
+ *
+ */
+
+/*
+ *
+ *   Author: Logan Gunthorpe
+ *
+ *   Date:   Oct 23 2014
+ *
+ *   Description:
+ *     Functions for dealing with number suffixes
+ *
+ */
+
+#ifndef __ARGCONFIG_SUFFIX_H__
+
+#include <inttypes.h>
+
+const char *suffix_si_get(double *value);
+const char *suffix_binary_get(long long *value);
+const char *suffix_dbinary_get(double *value);
+uint64_t suffix_binary_parse(const char *value);
+
+#endif






------aHyYs37HgbwNH3LE6ZzmTfiBsTB6hVarzLo_OvI4GdRlgC_p=_5a2ea_
Content-Type: text/plain; charset="utf-8"


------aHyYs37HgbwNH3LE6ZzmTfiBsTB6hVarzLo_OvI4GdRlgC_p=_5a2ea_--

