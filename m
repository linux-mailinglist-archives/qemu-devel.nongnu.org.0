Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD6F32DAA2
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 20:55:38 +0100 (CET)
Received: from localhost ([::1]:53964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHu4P-00075H-1H
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 14:55:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cbrowy@avery-design.com>)
 id 1lHu1x-0006De-BA
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 14:53:05 -0500
Received: from server.avery-design.com ([198.57.169.184]:55112)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cbrowy@avery-design.com>)
 id 1lHu1q-0003ls-Lg
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 14:53:03 -0500
Received: from ool-44c0a99c.dyn.optonline.net ([68.192.169.156]:52191
 helo=[192.168.1.180])
 by server.avery-design.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <cbrowy@avery-design.com>)
 id 1lHtzD-00008B-PE; Thu, 04 Mar 2021 19:50:15 +0000
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: [RFC PATCH v2 1/2] Basic PCIe DOE support
From: Chris Browy <cbrowy@avery-design.com>
In-Reply-To: <20210304192158.00004296@Huawei.com>
Date: Thu, 4 Mar 2021 14:50:14 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <E4FC0C46-FAED-4F9B-BC7B-B770DA517F6F@avery-design.com>
References: <1612900760-7361-1-git-send-email-cbrowy@avery-design.com>
 <1612902949-9992-1-git-send-email-cbrowy@avery-design.com>
 <20210304192158.00004296@Huawei.com>
To: Jonathan Cameron <jonathan.cameron@huawei.com>
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
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Reply-To: "20210304192158.00004296@huawei.com"
 <20210304192158.00004296@Huawei.com>
Cc: Ben Widawsky <ben.widawsky@intel.com>, david@redhat.com,
 qemu-devel@nongnu.org, vishal.l.verma@intel.com, jgroves@micron.com,
 armbru@redhat.com, linux-cxl@vger.kernel.org, f4bug@amsat.org, mst@redhat.com,
 Huai-Cheng <hchkuo@avery-design.com.tw>, imammedo@redhat.com,
 dan.j.williams@intel.com, ira.weiny@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Mar 4, 2021, at 2:21 PM, Jonathan Cameron =
<jonathan.cameron@huawei.com> wrote:
>=20
> On Tue, 9 Feb 2021 15:35:49 -0500
> Chris Browy <cbrowy@avery-design.com> wrote:
>=20
> Hi Chris,
>=20
> One more thing hit whilst debugging linux side of this.
>=20
>> +static void pcie_doe_irq_assert(DOECap *doe_cap)
>> +{
>> +    PCIDevice *dev =3D doe_cap->doe->pdev;
>> +
>> +    if (doe_cap->cap.intr && doe_cap->ctrl.intr) {
>=20
>=20
> need something like
>=20
> doe_cap->status.intr =3D 1;
>=20
> I think or anyone checking the status register is going to think
> this interrupt is spurious.

You=E2=80=99re absolutely right, good catch!

>=20
> Otherwise all seems to work. I need to do a bit of tidying up on
> kernel code but should be able to send out early next week.
>=20

We=E2=80=99re putting out the v3 by end of this week.  We=E2=80=99re =
spent a bit longer
tidying up on our end but sounds like coming together real soon in 5.12=20=

release!

>> +        /* Interrupt notify */
>> +        if (msix_enabled(dev)) {
>> +            msix_notify(dev, doe_cap->cap.vec);
>> +        } else if (msi_enabled(dev)) {
>> +            msi_notify(dev, doe_cap->cap.vec);
>> +        }
>> +        /* Not support legacy IRQ */
>> +    }
>> +}


