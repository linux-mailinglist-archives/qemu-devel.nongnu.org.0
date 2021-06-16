Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55AF13A9808
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 12:46:37 +0200 (CEST)
Received: from localhost ([::1]:44230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltT48-0001Ba-D7
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 06:46:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1ltT2K-0007lT-Lp
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 06:44:44 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1ltT2H-00025I-H0
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 06:44:44 -0400
Received: from fraeml735-chm.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4G4hQR5cTdz6K6BD;
 Wed, 16 Jun 2021 18:34:55 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml735-chm.china.huawei.com (10.206.15.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 16 Jun 2021 12:44:36 +0200
Received: from localhost (10.52.123.249) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Wed, 16 Jun
 2021 11:44:35 +0100
Date: Wed, 16 Jun 2021 11:44:28 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Chris Browy <cbrowy@avery-design.com>
Subject: Re: [PATCH v6 cxl2.0-v6-doe 6/6] test/cdat: CXL CDAT test data
Message-ID: <20210616114428.00005a72@Huawei.com>
In-Reply-To: <1623331004-18651-1-git-send-email-cbrowy@avery-design.com>
References: <1623329999-15662-1-git-send-email-cbrowy@avery-design.com>
 <1623331004-18651-1-git-send-email-cbrowy@avery-design.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.52.123.249]
X-ClientProxiedBy: lhreml750-chm.china.huawei.com (10.201.108.200) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: ben.widawsky@intel.com, jgroves@micron.com, david@redhat.com,
 qemu-devel@nongnu.org, vishal.l.verma@intel.com, mst@redhat.com,
 armbru@redhat.com, f4bug@amsat.org, hchkuo@avery-design.com.tw,
 tyshao@avery-design.com.tw, imammedo@redhat.com, dan.j.williams@intel.com,
 ira.weiny@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 10 Jun 2021 09:16:44 -0400
Chris Browy <cbrowy@avery-design.com> wrote:

> From: hchkuo <hchkuo@avery-design.com.tw>
> 
> Pre-built CDAT table for testing, contains one CDAT header and six
> CDAT entries: DSMAS, DSLBIS, DSMSCIS, DSIS, DSEMTS, and SSLBIS
> respectively.
> 
> Signed-off-by: hchkuo <hchkuo@avery-design.com.tw>
> Signed-off-by: Chris Browy <cbrowy@avery-design.com>

I can't apply this. I haven't looked into why as
reviewing a binary file isn't my idea of fun anyway :)

> ---
>  tests/data/cdat/cdat.dat | Bin 0 -> 148 bytes
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  create mode 100644 tests/data/cdat/cdat.dat
> 
> diff --git a/tests/data/cdat/cdat.dat b/tests/data/cdat/cdat.dat
> new file mode 100644
> index 0000000000000000000000000000000000000000..b66c5d5836bcce7490e698f9ab5071c623425c48
> GIT binary patch
> literal 148
> ycmbQjz`($`14zJu1e^tBD1c~21`KhqG!ugem_{a;892aP794t585EF}W3U1CI069x
> 
> literal 0
> HcmV?d00001
> 


