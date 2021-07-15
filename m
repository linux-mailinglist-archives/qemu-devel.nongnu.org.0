Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C06173CA110
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 17:00:53 +0200 (CEST)
Received: from localhost ([::1]:44198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m42r6-00054H-Cf
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 11:00:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <p.kalghatgi@samsung.com>)
 id 1m42pE-0004Dz-4t
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 10:58:56 -0400
Received: from mailout4.samsung.com ([203.254.224.34]:62476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <p.kalghatgi@samsung.com>)
 id 1m42pB-00080H-8N
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 10:58:55 -0400
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20210715145847epoutp04606244e2550cb6164f38c874e5a1a0af~R-tQOWywF0688006880epoutp04D
 for <qemu-devel@nongnu.org>; Thu, 15 Jul 2021 14:58:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20210715145847epoutp04606244e2550cb6164f38c874e5a1a0af~R-tQOWywF0688006880epoutp04D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1626361127;
 bh=zgEGatL+ayDX0gvGqvZGMBT8dfdzPhoIewzYf/5Y/po=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=cKbFYDPLbSauUJtHpIKPuAVWxHE+umiLpRNE8JnK2js24Yc5f8AzbEsuz7Se+5BW/
 rccaksRJ97AmHi5dN+osE6JOuRIZ7BgXLX63lluTuYLGoCwsVY4n9sVtaCsL9eFXEi
 UNLws/eCCoVyHWVtxPML69eAOrS1/4p1OMuju9oM=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTP id
 20210715145845epcas5p3debe1434bafbe5f20d2bda3ffc237568~R-tOsMR7b0343503435epcas5p3g;
 Thu, 15 Jul 2021 14:58:45 +0000 (GMT)
Received: from epsmges5p1new.samsung.com (unknown [182.195.40.193]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4GQcvR0wGfz4x9Pq; Thu, 15 Jul
 2021 14:58:43 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
 epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 70.47.55882.22D40F06; Thu, 15 Jul 2021 23:58:42 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
 20210715143815epcas5p368f9e59b035f2c10de4833836cbda40c~R-bUut4Ks2180721807epcas5p3h;
 Thu, 15 Jul 2021 14:38:15 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210715143815epsmtrp109f345ca2f2e213f37558dc6d4dbab7a~R-bUtwInR1628016280epsmtrp1Y;
 Thu, 15 Jul 2021 14:38:15 +0000 (GMT)
X-AuditID: b6c32a49-f65ff7000001da4a-8e-60f04d224fc5
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 E2.3E.08289.65840F06; Thu, 15 Jul 2021 23:38:14 +0900 (KST)
Received: from test-zns (unknown [107.110.206.5]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20210715143812epsmtip21d6b064a18601c611c70204c6f6a189d~R-bSXqHSJ0439704397epsmtip2F;
 Thu, 15 Jul 2021 14:38:12 +0000 (GMT)
Date: Thu, 15 Jul 2021 20:07:07 +0530
From: Padmakar Kalghatgi <p.kalghatgi@samsung.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [RFC PATCH 1/2] hw/nvme: add mi device
Message-ID: <20210715143707.GA368@test-zns>
MIME-Version: 1.0
In-Reply-To: <YO1e01ex1yOvy0SB@stefanha-x1.localdomain>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrJJsWRmVeSWpSXmKPExsWy7bCmlq6S74cEg7fvbSzefn3AZnFl/3lG
 i9MTFjFZ7D/4jdXi8Z3P7BZL5+tbnGzcw2ox6dA1RoslF1Mt5i97ym6x5oWyxbxbyhZXpixi
 tpj1rp3N4njvDhaL15P+s1rcbH7K5iDo8eNcO5vH5hVaHud2nGf32LSqE8hbUu/x5NpmJo/3
 +66yefRtWcUYwBGVY5ORmpiSWqSQmpecn5KZl26r5B0c7xxvamZgqGtoaWGupJCXmJtqq+Ti
 E6DrlpkD9IKSQlliTilQKCCxuFhJ386mKL+0JFUhI7+4xFYptSAlp8DQqECvODG3uDQvXS85
 P9fK0MDAyBSoMiEnY9612+wF7eIV91umsDcwrhLuYuTkkBAwkbj2+ClzFyMXh5DAbkaJmbOu
 M4MkhAQ+MUpsOVMMkfjMKLG27yIjTMf1W7uhOnYxStz6soUFouMZo0TH0jgQm0VAVWLd8z6g
 OAcHm4CRxPdWWxBTREBT4ka3IEgrs8A/Jonj7U/YQcqFBYwl5vYvBrN5BbQlFhy5wghhC0qc
 nPkEbDyngLlEV/dvsBpRAWWJA9uOM4EMkhC4wiGxeNo7FojjXCQuf1oJdaiwxKvjW9ghbCmJ
 l/1t7BANzYwS+75cYYFwJjBKTJn/jgmiyl7i4p6/YDazQKbEsrVtUJNkJaaeWgcV55Po/f0E
 qp5XYsc8GFtV4vGFg2wQtrTE7JWfoOIeEr1b37FCgusXo8SzOdPYJzDKz0Ly3iwk+yBsK4nO
 D02ss4BBxgw0a/k/DghTU2L9Lv0FjKyrGCVTC4pz01OLTQsM81LLkWN8EyM4jWt57mC8++CD
 3iFGJg7GQ4wSHMxKIrxLjd4mCPGmJFZWpRblxxeV5qQWH2I0BcbWRGYp0eR8YCbJK4k3NDUy
 MzOwNDA1tjAzVBLnXcp+KEFIID2xJDU7NbUgtQimj4mDU6qBSXtTpem1zmU5fy6XWKxYVWZR
 nH91odxvuefNZz+qx55Pn/GHU5xnJr/Z2S/POnc+7mPImrWr9KXcCqf2r+nFqXU/ZqyZKh+S
 sol9/2pfm2mMdtN/1kz93/psQo/a7cp9PTJeHJuXTujI/joz/tYV3ccztI+eOJa0VkH9pTJ3
 g0jV1YrSeVtVeGWMNrz69oXj3ufvwQzrWf3atxz64sCruvjm5Xkc6U3zfltziDMU7Vm+MTfE
 dnWkAZvyxfetXn82/XNjPvD+RnyAWpVnhMfNGccE8rjb//+2b/kndHodv13S047ksO1zC7cJ
 fPCYmdgaeMBtS0f3sqMnsp751x2bZ21iuZHho8rm/nk+9jMf/1BiKc5INNRiLipOBABOfGgI
 bAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBIsWRmVeSWpSXmKPExsWy7bCSvG6Yx4cEg5d3LCzefn3AZnFl/3lG
 i9MTFjFZ7D/4jdXi8Z3P7BZL5+tbnGzcw2ox6dA1RoslF1Mt5i97ym6x5oWyxbxbyhZXpixi
 tpj1rp3N4njvDhaL15P+s1rcbH7K5iDo8eNcO5vH5hVaHud2nGf32LSqE8hbUu/x5NpmJo/3
 +66yefRtWcUYwBHFZZOSmpNZllqkb5fAldF76SlzwTaRio3PpzE1MH4W6GLk5JAQMJG4fms3
 cxcjF4eQwA5GiSnHT7FCJKQl9j28zgJhC0us/PecHcQWEnjCKLFrhS2IzSKgKrHueR9QDQcH
 m4CRxPdWWxBTREBT4ka3IMhIZoEGZonPl1eDjREWMJaY278YbAyvgLbEgiNXGCH2/mOUWD1r
 NyNEQlDi5MwnYA3MAmYS8zY/ZAYZygx0z/J/HCBhTgFzia7u32BzRAWUJQ5sO840gVFwFpLu
 WUi6ZyF0L2BkXsUomVpQnJueW2xYYJSXWq5XnJhbXJqXrpecn7uJERx5Wlo7GPes+qB3iJGJ
 g/EQowQHs5II71KjtwlCvCmJlVWpRfnxRaU5qcWHGKU5WJTEeS90nYwXEkhPLEnNTk0tSC2C
 yTJxcEo1MO1W+bvx1NbIxNN3zcWeLarrWz/rJ8vixlU7S6ofnHVTz9bKyrn8fO0j7zrvtRsY
 c2d76CZ8WNwQ/3HVlKJLXSv25Ueu3qLa5Luf865QHs+HnZouTe4fu4Vzz7kxTnnxQHupw4fN
 enGXxRjl1mvMESlaLxJiIcjeZV1T8GfTriLOmLM8wQtCuOe5nN/6xsQvXjnpjpbSnj2fnXKE
 ut+dbrsSs/F77ixGvbiy+1wJmW9ir1656TXL6kpIcfjGay7n7RfzsQjVf56rN3X/qvm97k+1
 8vIKonfez/RYW/ZZ9OSRNzoX7zoocS309hd0XL5sk8PRjenO3EKeyzz3zWqfqtNyK86BoWi3
 gJhmcIjaNiWW4oxEQy3mouJEAOePSWwrAwAA
X-CMS-MailID: 20210715143815epcas5p368f9e59b035f2c10de4833836cbda40c
X-Msg-Generator: CA
Content-Type: multipart/mixed;
 boundary="----w8WoUW9U98ZABCqmfkPgex-0FNLw1A5xJ_YAV6t3erFR02af=_122dad_"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210709135651epcas5p1c544dec5377413bfa4b2eeab6ee43f26
References: <CGME20210709135651epcas5p1c544dec5377413bfa4b2eeab6ee43f26@epcas5p1.samsung.com>
 <20210709135545.GA11148@test-zns> <YOwhf59Xb/9IkZ9K@stefanha-x1.localdomain>
 <YO0k9JFO93EMaFIj@infradead.org> <YO1e01ex1yOvy0SB@stefanha-x1.localdomain>
Received-SPF: pass client-ip=203.254.224.34;
 envelope-from=p.kalghatgi@samsung.com; helo=mailout4.samsung.com
X-Spam_score_int: -77
X-Spam_score: -7.8
X-Spam_bar: -------
X-Spam_report: (-7.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, kwolf@redhat.com, jg123.choi@samsung.com,
 qemu-block@nongnu.org, k.jensen@samsung.com, d.palani@samsung.com,
 qemu-devel@nongnu.org, linux-nvme@lists.infradead.org, mreitz@redhat.com,
 Christoph Hellwig <hch@infradead.org>, kbusch@kernel.org,
 u.kishore@samsung.com, its@irrelevant.dk, javier.gonz@samsung.com,
 prakash.v@samsung.com, mohit.kap@samsung.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

------w8WoUW9U98ZABCqmfkPgex-0FNLw1A5xJ_YAV6t3erFR02af=_122dad_
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Disposition: inline

On Tue, Jul 13, 2021 at 10:37:23AM +0100, Stefan Hajnoczi wrote:
>On Tue, Jul 13, 2021 at 06:30:28AM +0100, Christoph Hellwig wrote:
>On Tue, Jul 13, 2021 at 06:30:28AM +0100, Christoph Hellwig wrote:
>> On Mon, Jul 12, 2021 at 12:03:27PM +0100, Stefan Hajnoczi wrote:
>> > Why did you decide to implement -device nvme-mi as a device on
>> > TYPE_NVME_BUS? If the NVMe spec somehow requires this then I'm surprised
>> > that there's no NVMe bus interface (callbacks). It seems like this could
>> > just as easily be a property of an NVMe controller -device
>> > nvme,mi=on|off or -device nvme-subsys,mi=on|off? I'm probably just not
>> > familiar enough with MI and NVMe architecture...
>>
>> I'm too far away from qemu these days to understand what TYPE_NVME_BUS
>> is.  Bt NVMe-MI has tree possible transports:
>>
>>  1) out of band through smbus.  This seems something that could be
>>     trivially modelled in qemu
>>  2) out of band over MCTP / PCIe VDM.
>>  3) in band using NVMe admin commands that pass through MI commands
>
>Thanks for explaining!
>
>Common NVMe-MI code can be shared by -device nvme-mi-smbus, in-band NVMe
>MI commands (part of -device nvme), a vsock transport, etc. This patch
>has nvme_mi_admin_command() as the entry point to common MI code, so not
>much needs to be done to achieve this.
>
>My question about why -device nvme-mi was because this "device" doesn't
>implement any bus interface (callbacks). The bus effectively just serves
>as an owner of this device. The guest does not access the device via the
>bus. So I'm not sure a -device is appropriate, it's an usual device.
>
>If the device is kept, please name it -device nvme-mi-vsock so it's
>clear this is the NVMe-MI vsock transport. I think the device could be
>dropped and instead an -device nvme,mi-vsock=on|off property could be
>added to enable the MI vsock transport on a specific NVMe controller.
>This raises the question of whether the port number should be
>configurable so multiple vsock Management Endpoints can coexist.
>
>I don't have time to explore the architectural model, but here's the
>link in case anyone wants to think through all the options for NVMe MI
>Management Endpoints and how QEMU should model them:
>"1.4 NVM Subsystem Architectural Model"
>https://protect2.fireeye.com/v1/url?k=8ee99db1-ee0b00ec-8ee816fe-000babd9f1ba-c174da71c1d11e79&q=1&e=b7b9709a-33ac-4d98-a6c0-ff53377a3278&u=https%3A%2F%2Fnvmexpress.org%2Fwp-content%2Fuploads%2FNVM-Express-Management-Interface-1.2-2021.06.02-Ratified.pdf
>
>Stefan
Thanks Stefan for the suggestion.


------w8WoUW9U98ZABCqmfkPgex-0FNLw1A5xJ_YAV6t3erFR02af=_122dad_
Content-Type: text/plain; charset="utf-8"


------w8WoUW9U98ZABCqmfkPgex-0FNLw1A5xJ_YAV6t3erFR02af=_122dad_--

