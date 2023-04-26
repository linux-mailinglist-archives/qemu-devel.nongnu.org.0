Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A29F6EF8D5
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 18:58:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1priSL-0002lH-5z; Wed, 26 Apr 2023 12:57:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1priSI-0002kX-DC; Wed, 26 Apr 2023 12:57:22 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1priSF-0003aN-Ry; Wed, 26 Apr 2023 12:57:22 -0400
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Q64ly71kkz6DBV1;
 Thu, 27 Apr 2023 00:57:02 +0800 (CST)
Received: from localhost (10.195.35.167) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Wed, 26 Apr
 2023 17:57:05 +0100
Date: Wed, 26 Apr 2023 17:57:04 +0100
To: Peter Maydell <peter.maydell@linaro.org>
CC: <qemu-devel@nongnu.org>, "Michael S . Tsirkin" <mst@redhat.com>,
 <qemu-arm@nongnu.org>, Fan Ni <fan.ni@samsung.com>, <linuxarm@huawei.com>,
 Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Subject: Re: [RFC] hw/arm/virt: Provide DT binding generation for PCI
 eXpander Bridges
Message-ID: <20230426175704.00007985@Huawei.com>
In-Reply-To: <CAFEAcA8FCZkU12hmkGX+N5Cokbakm1T8RJkCgO_JHT1ZsbVmxg@mail.gmail.com>
References: <20230421165037.2506-1-Jonathan.Cameron@huawei.com>
 <CAFEAcA_DB=nNdiMRwn02mUAATKLvV0Nzs2dCYaM+2fwitac5sg@mail.gmail.com>
 <20230424164058.00000a3d@Huawei.com>
 <CAFEAcA_2JP=cM-SCGVhnhnP_6zYr748=A=G=Sh+BH+gkFmwnZA@mail.gmail.com>
 <20230424225626.00001219@huawei.com>
 <CAFEAcA8QXcpkxdXMWP8X9tLem6K8qC3CwZ2-t-fqEpGR-nJBTg@mail.gmail.com>
 <20230425183713.000054c3@huawei.com>
 <CAFEAcA8FCZkU12hmkGX+N5Cokbakm1T8RJkCgO_JHT1ZsbVmxg@mail.gmail.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.195.35.167]
X-ClientProxiedBy: lhrpeml100005.china.huawei.com (7.191.160.25) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 25 Apr 2023 21:15:25 +0100
Peter Maydell <peter.maydell@linaro.org> wrote:

> On Tue, 25 Apr 2023 at 18:37, Jonathan Cameron
> <Jonathan.Cameron@huawei.com> wrote:
> > We could explore only solving the problem for pxb-cxl for now.
> > However, we would still be talking infrastructure in kernel only
> > to support emulated CXL devices and I can see that being
> > controversial. A normal CXL host bridge is not something
> > we can enumerate.  
> 
> Hmm, so what is real hardware doing that our emulation is not?

For real hardware, the host bridges would not typically share
the various windows.  Various options, but most likely they
would be in different PCI segments, with separate ECAM space,
and separate space into which the BARs would be mapped.
That separation would be needed as the Physical Address
routing in the host would need to direct the reads and
writes to the correct bit of hardware and that tends to
be done with very simple address decoders on the appropriate
interconnects - those internal routing tables are normally
effectively fixed for a given system.  We could add another
full host bridge to arm-virt.  That would require separate
emulation as I don't think we can reuse the pxb-cxl stuff.

The PXB approach is to ignore the normal restrictions on
routing being fairly fixed, by building a fixed configuration
before the OS sees it - allowing different host bridges to use
different parts of a single region.  Arguably very early
boot firmware could do that with a physical system but it
would involve some nasty impdef programming of address decoder
logic.  This would be similar to what firmware does to
change the routing dependent on whether it finds a 2 socket
confirmation or a 4 socket configuration in servers. Want
entity would do this is implementation defined - may well
be before any application processor boots.

Jonathan

> 
> -- PMM


