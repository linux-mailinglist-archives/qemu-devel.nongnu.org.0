Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B2165324D
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 15:15:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7zrh-000741-Hq; Wed, 21 Dec 2022 09:14:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1p7zrf-00073s-Qg
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 09:14:35 -0500
Received: from kylie.crudebyte.com ([5.189.157.229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1p7zrd-0007rl-U7
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 09:14:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=3tY55ljGXCKRgd61CTTFWJvG7l+4GchBf1YX6M3TkFQ=; b=JVB88UEbFlD/aonn5wHUkbD9oI
 x9nexhVlYUlxtmqLG/bXYFCKtmI5Qx6gnt8HDJIOo+C1wgQzWvzlIQkeQyLC6Z6/MA6xWtukzMC5e
 BTt31V/ajkOQ0bueU97mBW0YXz6Y6UcYzBNinb5zsEPAEU9CaHIPwuUWN5PJ+graGEp3fSSmGWMxj
 CjiiwPWPsyIFBfwhM+b+yG1qOewMcH9XXGxL9j5G/6jHj97qlRbwE/arm+QZNJ+FTgqFDbUBRJcix
 yKsvF0+x6n0VYm7SI5dqIBj2KmiyB52nCtjbfei3plfskrcgYIL1/Y/tpRf4Hke1GbO23olcXi9i/
 oGTF2aDuFkOOaQZ4cpPL6vQaR9xxhFDMau+Dz7V3PlF34g6t42/QU5RGxjZGA6VYOU4W1lSTc+dE1
 WzkIqnb8TJPHaOdb95ejAe/3ujSuxKA+LZzlM5XeLj4kLjJhSHlYopC1SMQLP0ZhcNubc9lcnR2L7
 72WAXyoxvGtcIeQwq7NGdtQ6IFVoXIpeI9bFa8o1G1Rx6tD5GiiSkaUSElVUDKQGuW++Fgj6ZZzs7
 my8uFHZr9uw4FuWiH6oynxO344jMd5ALtHAgnpuSwy8ZFJBYe2k43SpR88WsxpYSwF5dnDVObBuxU
 65JL04DMoKpAZOyJ4ECg+eMxhkJZ9WrzILZIahfLM=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Cc: Daniel =?ISO-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 =?ISO-8859-1?Q?Marc=2DAndr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Will Cohen <wwcohen@gmail.com>,
 Bin Meng <bin.meng@windriver.com>, Guohuai Shi <guohuai.shi@windriver.com>
Subject: Re: [PATCH v3 00/17] hw/9pfs: Add 9pfs support for Windows
Date: Wed, 21 Dec 2022 15:14:29 +0100
Message-ID: <1875482.isOkDvx3hk@silver>
In-Reply-To: <20221219102022.2167736-1-bin.meng@windriver.com>
References: <20221219102022.2167736-1-bin.meng@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On Monday, December 19, 2022 11:20:04 AM CET Bin Meng wrote:
> At present there is no Windows support for 9p file system.
> This series adds initial Windows support for 9p file system.
> 
> 'local' file system backend driver is supported on Windows,
> including open, read, write, close, rename, remove, etc.
> All security models are supported. The mapped (mapped-xattr)
> security model is implemented using NTFS Alternate Data Stream
> (ADS) so the 9p export path shall be on an NTFS partition.
> 
> 'synth' driver is adapted for Windows too so that we can now
> run qtests on Windows for 9p related regression testing.
> 
> Example command line to test:
> 
>   "-fsdev local,path=c:\msys64,security_model=mapped,id=p9 -device 
virtio-9p-pci,fsdev=p9,mount_tag=p9fs"
> 
> Base-commit: 562d4af32ec2213061f844b3838223fd7711b56a

Queued patches 1..3 for now on 9p.next:
https://github.com/cschoenebeck/qemu/commits/9p.next

Thanks!

Best regards,
Christian Schoenebeck



