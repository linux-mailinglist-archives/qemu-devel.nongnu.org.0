Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C812374BDD
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 01:27:02 +0200 (CEST)
Received: from localhost ([::1]:49312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leQuz-000348-Fu
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 19:27:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=752564754=alistair.francis@wdc.com>)
 id 1leQrV-0006hJ-T0
 for qemu-devel@nongnu.org; Wed, 05 May 2021 19:23:25 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:42178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=752564754=alistair.francis@wdc.com>)
 id 1leQrT-0000B0-TZ
 for qemu-devel@nongnu.org; Wed, 05 May 2021 19:23:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620257003; x=1651793003;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=v9dngNOlYI6M8UvqCNI7Vz66vBQPm9MreWEGG7vUnp8=;
 b=CBPfp81Pwlpla6aE2iKdWKkyDrfDuRGZiDO5zRzsfkVkLsPUktgBGo+X
 zGuJLQz8+WM/goe30Ggx9OqZGl6On1OJeH8hQrc/3EWWEijy/7eRdhnm7
 4G68bokCu7oU+AvnsKpPodOQjGwqRX7k11Wbeu/AkPqUxlzPGIGlqu3lj
 DLg2vAhMHvRKliQiRzMH8Xpm1G8KHD3nlAzCN7tvLIc5KSlKp+lFi8gt8
 s0yrK4gdhssHTIAr8iYrPBCzhS19ZSNqbqjl+Di3++yOapgTt5QyJH44I
 NKXaFUtKLyFqkAK9yOwClbMq54PVpcuOdhNiSu9goEm3cPsm4PJma+LYb g==;
IronPort-SDR: aPJ/dXJc6UEKALqZj/JO48ltaA+uIO0JAP3IK2wfqLmHy3ctqoBaEsYnrdgAJDuQBMFwww9LdJ
 C0VpevPgdGpzkdHBgFMOMm09laxcBDMhVIhLoTx+euj/FBVf8I2OIDgIzbUta2LqS7+8KGu894
 bmtjReGqaS2YiYFbS+WNnFzKyW3kYE3d0xifO0Py5Nl7SFKwo+ySPv/Lue1tdtBXLnGuAuqjwF
 Nz4vfCvLTdHtgE8BCFLBCd1tPKgbTBzRYeN+jGFn8tU3HTd111BfUYDtt4A1srUl6Ex/pLZ0Jl
 P6Q=
X-IronPort-AV: E=Sophos;i="5.82,276,1613404800"; d="scan'208";a="278356861"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 May 2021 07:23:22 +0800
IronPort-SDR: SoYlgysaZLkFQehNbWVrAXVJru/COSSMX6GhKdT8MOZ2oedrO0KiuaXXmNbW3AAJoNhk6tiA02
 JEyytsnmU/8iKe9wTS3H7qUo+v++uXs4YXQQFDE/D1dDsO9xbQs1FpTuyb+S/M1Lk5Tmcm0QyT
 blqpNVqTNizg3LdY+f0urWEIMc3OVCayh60/x0DFFa/Wq6nBr7FcxKhAUdR8mHf6tKQoXeS01T
 6QDR7jHpvBknIoFyj4vouYqEG2lVOG3ycg3ZHMh15VRQtrvXvlwvIDF2l6FgvZlLXCDDQlE/Gh
 2aQHg4H+9YLOndJVDHu6uPHu
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 16:02:03 -0700
IronPort-SDR: UCtLIloSgIdddNzA1+Nj3MW8XvkWXRWFaCAFRkyIAhlYCVj8VfYA2L7BDex3EhVWkgcLa3tH0/
 QFlmk8jy9dmwCt0UrF3VqpWwida4Y8Me73CwjdPScz59qRJnsm33dQ1/zt6n00RxOtz2IdqIiV
 JaKypY2ji37Ix/FjxVMfSSaoQbsDNdlaJzxm0YYu8kuqQ4/UI31L5tOU0/PMYpn1yQIwtUNlY/
 h7YXx+gEaC5WGO/eHrWOcWAciN5Nml3hPqkLH6phjemywFK2GMYHTufFQOTEBZVrvdzD6ePOZy
 Ydk=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.46])
 by uls-op-cesaip01.wdc.com with ESMTP; 05 May 2021 16:23:20 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v2 02/42] docs/system/generic-loader.rst: Fix style
Date: Thu,  6 May 2021 09:22:32 +1000
Message-Id: <20210505232312.4175486-3-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505232312.4175486-1-alistair.francis@wdc.com>
References: <20210505232312.4175486-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=752564754=alistair.francis@wdc.com;
 helo=esa1.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Cc: alistair23@gmail.com, Axel Heider <axelheider@gmx.de>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Axel Heider <axelheider@gmx.de>

Fix style to have a proper description of the parameter 'force-raw'.

Signed-off-by: Axel Heider <axelheider@gmx.de>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: a7e50a64-1c7c-2d41-96d3-d8a417a659ac@gmx.de
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 docs/system/generic-loader.rst | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/docs/system/generic-loader.rst b/docs/system/generic-loader.rst
index 6bf8a4eb48..531ddbc8e3 100644
--- a/docs/system/generic-loader.rst
+++ b/docs/system/generic-loader.rst
@@ -92,9 +92,12 @@ shown below:
   specified in the executable format header. This option should only
   be used for the boot image. This will also cause the image to be
   written to the specified CPU's address space. If not specified, the
-  default is CPU 0. <force-raw> - Setting force-raw=on forces the file
-  to be treated as a raw image. This can be used to load supported
-  executable formats as if they were raw.
+  default is CPU 0.
+
+``<force-raw>``
+  Setting 'force-raw=on' forces the file to be treated as a raw image.
+  This can be used to load supported executable formats as if they
+  were raw.
 
 All values are parsed using the standard QemuOpts parsing. This allows the user
 to specify any values in any format supported. By default the values
-- 
2.31.1


