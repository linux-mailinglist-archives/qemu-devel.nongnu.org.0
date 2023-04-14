Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2806E1D58
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 09:37:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnDyn-0007Gs-30; Fri, 14 Apr 2023 03:36:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slankes@eonerc.rwth-aachen.de>)
 id 1pnDyT-0007GU-4K; Fri, 14 Apr 2023 03:36:01 -0400
Received: from mail-out-2a.itc.rwth-aachen.de ([2a00:8a60:1:e501::5:45])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slankes@eonerc.rwth-aachen.de>)
 id 1pnDyD-0005pJ-8R; Fri, 14 Apr 2023 03:36:00 -0400
X-IPAS-Result: =?us-ascii?q?A2AHBACIATlk/5gagoZaHQEBAQEJARIBBQUBQIFPiU+xD?=
 =?us-ascii?q?Q8BAQEBAQEBAQEIAUQEAQGFAgIChT4nOBMBAgQBAQEBAwIDAQEBAQEBAwEBB?=
 =?us-ascii?q?gEBAQEBAQYEgR2FL0aGBicPAUY1AiYCXw6DA4JdrxCBMoEBhHKaaoFnCQGBC?=
 =?us-ascii?q?i2JIYJThgiBSUSBS4hEgw6CZwSaTQqBNHSBIA5KcoEEAgkCEUMogRAIaYF5Q?=
 =?us-ascii?q?AINYwsOb4FJgU6BXAQCFEcOEjcDCQMHBSwdQAMLGA0WOhMsNRQfXGwtEhIFA?=
 =?us-ascii?q?wsVKkcECDgGUBECCA8SDyxEDEI3MxMGXAEpCw4RA09CGWwEgQqBAQcmJJ4jI?=
 =?us-ascii?q?0+BDiSBVXCSdrEGgjKBVqBtGjODapMtkiuXdaNKhCwCBAIEBQIWgXqBfjMaC?=
 =?us-ascii?q?BwUgyNRFwIPog2BMAIHAQoBAQMJi0UBAQ?=
IronPort-Data: A9a23:gvt7UaBKLTxeTxVW/0Liw5YqxClBgxIJ4kV8jS/XYbTApGwj1DwHz
 WYbCG6OO/rbMDSne9F+PYTipkgD68OHy4VnOVdlrnsFo1CmCCbmLYnDch2gb3v6wunrFh8PA
 xA2M4GYRCwMZiaA4E3raNANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtcAbeORXkXc6
 Lsen+WFYAX+g2ItbjpNg06+gEoHUMra6WtwUmMWOKgjUG/2zxE9EJ8ZLKetGHr0KqE88jmSH
 rurIBmRpws1zj91Yj+Xuu+Tnn4iHtY+CTOzZk9+AMBOtDAf/HBogvZjXBYrQRw/Zz2hx7idw
 TjW3HC6YV9B0qbkwIzxX/TEes1zFfUuxVPJHZSwmZKq8nKceEXX+OtJHB5uNIsp5edYLG4bo
 JT0KBhVBvyCr/ip3LK2Wqx334EqatP0IINas30mwTyx4fQOGMufBfyRvZkCgnFp25om8fX2P
 qL1bRJ0aB3GYBBUEloQDp8kl6GymWX/NjRRo1KYo+w77gA/ySQtiui8a4eNK7RmQ+1pg22Hh
 03mwFikAxRGLv6UimSh0ViF07qncSTTHdh6+KeD3udnhUDWymENBRk+U1y9rv+kzEmkVLp3M
 0EI9zBoqKEj+EGvSvH5XhuxunnCuQQTM/JJHugnrQiXz4LS5ACWAHVCSSROAOHKr+csWiAq2
 0/MhIqsDHp1r6GVDHuRsLuZxd+vBRUowaY5TXdsZWM4DxPL+enfUjqnog5fLZOI
IronPort-HdrOrdr: A9a23:MaXPfK40zzXMV+UwJQPXwUyBI+orL9Y04lQ7vn2ZFiY7TiXIra
 yTdaoguCMc0AxhIk3I6urwRZVoIEm1yXcR2+cs1NiZLW/bUQeTXeJfBM7Zskbd8k7Fh6VgPM
 VbAtFD4bTLZDMR7KbHCUuDYq4dKbG8geWVbIzlvhJQpHRRGsZdBnBCe2Km+yNNNWt77cNTLu
 val4x6jgvlXU5SQtWwB3EDUeSGjcbMjojabRkPAANiwBWSjBuzgYSKWSSw71M7aXdi0L0i+W
 /Kn0jS/aO4qcy2zRfayiv684lWot380dFObfb8x/T9aw+cxjpAVr4RFYFqjwpF4d1HL2xa0O
 Ukli1QcPibLUmhPV1d7yGdmTUImwxel0MKgWXo/kcL5/aJAA7SQvAx+75xY1/X7VEts8p717
 8O12WFt4BPBReFhyjl4cPUPisa4HZcjEBS5dL7tUYvJrc2eftUt8gS7UlVGJAPEGbz750mCv
 BnCIXZ6OxNeV2XYnjFti03qebcFkgbD1ODWAwPq8aV2z9ZkDRwyFYZ3tUWmjMF+IgmQ5dJ6u
 zYOuBjla1ITMURcaVhbd1xCPefGyjIW1bBIWiSKVPoGOUOPG/MsYf+5PEv6OSjaPUzve4PcV
 T6ISFlXEIJCjHT4Je1rex2Gzj2MRWAYQg=
X-Talos-CUID: =?us-ascii?q?9a23=3AfsFrrmu6/+CH1JD8s75GL46m6It7S0DilnzuGHS?=
 =?us-ascii?q?mLnY2ELSTeECR145rxp8=3D?=
X-Talos-MUID: 9a23:b51D6gqJLEI0n7c7f9wezw1/H9hJzISRNB0MlMkcmcLHawhTER7I2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.99,195,1677538800"; d="scan'208";a="42893509"
Received: from rwthex-s1-a.rwth-ad.de ([134.130.26.152])
 by mail-in-2a.itc.rwth-aachen.de with ESMTP; 14 Apr 2023 09:35:28 +0200
Received: from Tartaros.fritz.box (2a0a:a540:ee49:0:4dac:dbd1:97f4:c51) by
 rwthex-s1-a.rwth-ad.de (2a00:8a60:1:e500::26:152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 14 Apr 2023 09:35:27 +0200
From: Stefan Lankes <slankes@eonerc.rwth-aachen.de>
To: <qemu-devel@nongnu.org>
CC: <peter.maydell@linaro.org>, <qemu-arm@nongnu.org>, Stefan Lankes
 <slankes@eonerc.rwth-aachen.de>
Subject: [RFC 0/1] add support of `--initrd` for ELF-ARM kernels
Date: Fri, 14 Apr 2023 09:34:31 +0200
Message-ID: <20230414073432.36000-1-slankes@eonerc.rwth-aachen.de>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2a0a:a540:ee49:0:4dac:dbd1:97f4:c51]
X-ClientProxiedBy: rwthex-w1-a.rwth-ad.de (2a00:8a60:1:e500::26:156) To
 rwthex-s1-a.rwth-ad.de (2a00:8a60:1:e500::26:152)
Received-SPF: pass client-ip=2a00:8a60:1:e501::5:45;
 envelope-from=slankes@eonerc.rwth-aachen.de;
 helo=mail-out-2a.itc.rwth-aachen.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

We are developing an ELF-based kernel for ARM processor and would like
to use the flag "—initrd". An initial ramdisk simplifies the boot 
process, but as far as I know, it is currently not support by Qemu for
ARM processors. The flag is only available for pure Linux kernels.

This patch enables the flags for ELF kernels and creates a device tree
entry, which helps the kernel to find the address of the initial ramdisk.

Stefan Lankes (1):
  add support of `--initrd` for ELF-ARM kernels

 hw/arm/boot.c | 106 +++++++++++++++++++++++++++++---------------------
 1 file changed, 62 insertions(+), 44 deletions(-)

-- 
2.39.2 (Apple Git-143)


