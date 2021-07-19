Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D063C3CDD33
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 17:37:38 +0200 (CEST)
Received: from localhost ([::1]:34404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5VKr-0000oQ-SJ
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 11:37:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mohit.kap@samsung.com>)
 id 1m5VIr-0008Dl-38
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 11:35:33 -0400
Received: from mailout4.samsung.com ([203.254.224.34]:37296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mohit.kap@samsung.com>)
 id 1m5VIo-00041D-5D
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 11:35:32 -0400
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20210719153521epoutp04fb267948809008f7f87fec03bee27875~TOyVHpWjq0286502865epoutp04-
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 15:35:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20210719153521epoutp04fb267948809008f7f87fec03bee27875~TOyVHpWjq0286502865epoutp04-
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1626708921;
 bh=+iz8QLjyp62ci/sHv6Gd+OoD0wpySUqvhfTJiDKOEtA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tVgY/G0IaQc4pq/Bm0tjsQVcQqmCxFy53mEW1ftR5Z2mMbDqSSjGhz/t0X6AY2PU6
 U89kLQBkZExcWths1BaHoSeKUy/IX+aYy0+wfMVLhvgEDId+Y6or7F7lruiVGnTZQQ
 K9zh0B/815axp02ZxKAJNybJDRwXQbz/poyr7+O8=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTP id
 20210719153520epcas5p20f884d337a3c9f5a59fc0bc068123874~TOyUDQcmK3131731317epcas5p2f;
 Mon, 19 Jul 2021 15:35:20 +0000 (GMT)
Received: from epsmges5p1new.samsung.com (unknown [182.195.40.196]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4GT5Wp5g17z4x9Pv; Mon, 19 Jul
 2021 15:35:18 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
 epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 38.7B.55882.6BB95F06; Tue, 20 Jul 2021 00:35:18 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
 20210719153248epcas5p129bcb1396231522b157d4399ff3ed7f0~TOwG5BO-H2542925429epcas5p1f;
 Mon, 19 Jul 2021 15:32:48 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20210719153248epsmtrp2ce3b6917190a17f96a6234ca3669b9c0~TOwG48far2068720687epsmtrp2I;
 Mon, 19 Jul 2021 15:32:48 +0000 (GMT)
X-AuditID: b6c32a49-f4fff7000001da4a-fd-60f59bb6aa4d
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 80.90.08289.12B95F06; Tue, 20 Jul 2021 00:32:50 +0900 (KST)
Received: from test-zns (unknown [107.110.206.5]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20210719153247epsmtip10c4214f73775976dd53b5bc0b1fc8bf2~TOwFGS7Dg2100021000epsmtip1g;
 Mon, 19 Jul 2021 15:32:46 +0000 (GMT)
Date: Mon, 19 Jul 2021 21:01:41 +0530
From: Mohit Kapoor <mohit.kap@samsung.com>
To: Keith Busch <kbusch@kernel.org>
Subject: Re: [RFC PATCH nvme-cli 2/2] nvme-cli/plugins/mi:add support
Message-ID: <20210719153141.GA28218@test-zns>
MIME-Version: 1.0
In-Reply-To: <20210709160430.GB291156@dhcp-10-100-145-180.wdc.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrHJsWRmVeSWpSXmKPExsWy7bCmhu622V8TDJb/MbB4+/UBm8WV/ecZ
 LfYf/MZq8fjOZ3aLpfP1LU427mG1mHToGqPFkoupFvOXPWW3mHdL2eL6z0fsFlemLGK2mPWu
 nc3ieO8OFovXk/6zWtxsfsrmIODx41w7m8e5HefZPTat6mTz2Lyk3uPJtc1MHu/3XWXz6Nuy
 ijGAPSrHJiM1MSW1SCE1Lzk/JTMv3VbJOzjeOd7UzMBQ19DSwlxJIS8xN9VWycUnQNctMwfo
 dCWFssScUqBQQGJxsZK+nU1RfmlJqkJGfnGJrVJqQUpOgaFRgV5xYm5xaV66XnJ+rpWhgYGR
 KVBlQk7G8Y4JrAXrhCt2PV7P0sC4hK+LkYNDQsBEYsr9/C5GLg4hgd2MEv+eHGSHcD4xSjzY
 tokJwvnMKLFs9m2WLkZOsI6tDZdYIRK7GCWOTDjACJIQEnjGKHGoUwfEZhFQlVj7bRtYnE1A
 S2LW4f/MILaIgLLE3fkzwZqZBW4ySax6dZ4d5A5hAVeJiz+zQWp4BXQldvdeYIOwBSVOznwC
 tphTwEli/7QeJhBbFGjOgW3Hwa6TEDjDIXFt6zk2iH9cJNbPk4A4VFji1fEt7BC2lMTnd3uh
 SqolZq3jhWjtYJRY0HeWDaLGXuLinr9g85kFMiT27J/DCBGXlZh6ah1UnE+i9/cTJog4r8SO
 eSA2yExliWVfciDCkhKfNkxmhbA9JK5tfgANq52MEqcOdTFOYJSfheS1WUjWQdhWEp0fmlhn
 AY1lFpCWWP6PA8LUlFi/S38BI+sqRsnUguLc9NRi0wLDvNRy5OjexAhO2FqeOxjvPvigd4iR
 iYPxEKMEB7OSCK9K0dcEId6UxMqq1KL8+KLSnNTiQ4ymwKiayCwlmpwPzBl5JfGGpkZmZgaW
 BqbGFmaGSuK87PFATQLpiSWp2ampBalFMH1MHJxSDUy13xmKrzDI39p262hQHqfigge7FHlD
 bNSZO28kS/Y9zWrcub/7kKW3v03HmQ5PndadrFYN6pkyAklz18ZzLmGZWMpe6/bj9hqFEt79
 HFP9MngPu6lkzu+NFA+XW79KvHjP8rS+pzJf7GafZJugf8c2keHfpOWdv43OO216anWn/X5w
 77ZPobcuzVu2Or+tdrOF4AF/ESGXWJvCI75id/mexOj2c9V2zplz3lvwqdXrwp1b3U+Lh/7c
 snUd45dl0jPWxz39nrnMX63OKue8+o6K6P2B/9PyFSJuTcm5eH3Woi9hIU/Upv2eFiujqlzH
 sXDO7dD75/9umB1hYcURvGX/K3sH+Wwesalt+8wEg5VYijMSDbWYi4oTAa2zYEphBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprIIsWRmVeSWpSXmKPExsWy7bCSnK7S7K8JBptLLN5+fcBmcWX/eUaL
 /Qe/sVo8vvOZ3WLpfH2Lk417WC0mHbrGaLHkYqrF/GVP2S3m3VK2uP7zEbvFlSmLmC1mvWtn
 szjeu4PF4vWk/6wWN5ufsjkIePw4187mcW7HeXaPTas62Tw2L6n3eHJtM5PH+31X2Tz6tqxi
 DGCP4rJJSc3JLEst0rdL4Mr49201Y8EDgYoFLVOYGhg/cHcxcnJICJhIbG24xNrFyMUhJLCD
 UaJp2QxWiISkxPydM5ghbGGJlf+es0MUPWGUeHzwMFgRi4CqxNpv2xhBbDYBLYlZh/+DNYgI
 KEvcnT8TbCqzwG0mifbXN4CKODiEBVwlLv7MBqnhFdCV2N17gQ1i6E5GiTWfzzFCJAQlTs58
 wgJiMwuYSczb/JAZpJdZQFpi+T8OkDCngJPE/mk9TCC2KNCuA9uOM01gFJyFpHsWku5ZCN0L
 GJlXMUqmFhTnpucWGxYY5aWW6xUn5haX5qXrJefnbmIEx5qW1g7GPas+6B1iZOJgPMQowcGs
 JMKrUvQ1QYg3JbGyKrUoP76oNCe1+BCjNAeLkjjvha6T8UIC6YklqdmpqQWpRTBZJg5OqQam
 5cte+bBz1i9+wv9B44a4cr151sxIRyvdORWZGVkZfVOMRS1ZIkxfmJ6zeFf+6s6Zqo7ff82j
 5h0rDl+X+r5MYQrzehWjGXs1f3ofYdNvuu+heYP32j3jc/lpHgkvDvGfPCi999oyiTn3JNT/
 pMV1z6+cftitVTEl8Kbn63DH7okLA3L1lybv+Bz5yvPV0WAvMTe3WkOBx643Pt6ZZy8aNenJ
 pO/TjENrOZmMopc7RS3ffPQk5ybziBmxnGdCJ/xJfvP56Yt/Psu8+O4t0O+1PH03UW/V/65n
 b6oipWa42VeV7D6563X5g3nq219MX92987DAw0cV8zgquxSnffxv9NzKdVu3m4XTfN53Bkvy
 lViKMxINtZiLihMBMoFkxiQDAAA=
X-CMS-MailID: 20210719153248epcas5p129bcb1396231522b157d4399ff3ed7f0
X-Msg-Generator: CA
Content-Type: multipart/mixed;
 boundary="----jwvcjYHrFM3c_jtOMPe-K-pT79fi971tFzH_ulp86vm5ORTx=_a6d46_"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210709145458epcas5p35826843853e7a8986098c4ff8fba857a
References: <CGME20210709145458epcas5p35826843853e7a8986098c4ff8fba857a@epcas5p3.samsung.com>
 <20210709145352.GA14300@test-zns>
 <20210709160430.GB291156@dhcp-10-100-145-180.wdc.com>
Received-SPF: pass client-ip=203.254.224.34;
 envelope-from=mohit.kap@samsung.com; helo=mailout4.samsung.com
X-Spam_score_int: -85
X-Spam_score: -8.6
X-Spam_bar: --------
X-Spam_report: (-8.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.469,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: fam@euphon.net, kwolf@redhat.com, p.kalghatgi@samsung.com,
 qemu-block@nongnu.org, k.jensen@samsung.com, d.palani@samsung.com,
 qemu-devel@nongnu.org, linux-nvme@lists.infradead.org, mreitz@redhat.com,
 u.kishore@samsung.com, stefanha@redhat.com, its@irrelevant.dk,
 javier.gonz@samsung.com, prakash.v@samsung.com, jg123.choi@samsung.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

------jwvcjYHrFM3c_jtOMPe-K-pT79fi971tFzH_ulp86vm5ORTx=_a6d46_
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Disposition: inline

On Fri, Jul 09, 2021 at 09:04:30AM -0700, Keith Busch wrote:
>> +int hal_init()
>> +{
>> +    int retval = -1;
>> +    switch (GetSidebandInterface()) {
>> +    case qemu_nvme_mi:
>> +        retval = qemu_mi_init();
>> +        break;
>> +    default:
>> +        break;
>> +    }
>> +    return retval;
>> +}
>> +
>> +int hal_open()
>> +{
>> +    int retval = -1;
>> +    switch (GetSidebandInterface()) {
>> +    case qemu_nvme_mi:
>> +        retval = qemu_mi_open();
>> +        break;
>> +    default:
>> +        break;
>> +    }
>> +    return retval;
>> +}
>> +
>> +int hal_close()
>> +{
>> +    int retval = -1;
>> +    switch (GetSidebandInterface()) {
>> +    case qemu_nvme_mi:
>> +        retval = qemu_mi_close();
>> +        break;
>> +    default:
>> +        break;
>> +    }
>> +    return retval;
>> +}
>> +
>> +int hal_i2c_write(uint8_t *data_out, uint16_t num_bytes)
>> +{
>> +    int retval = -1;
>> +    switch (GetSidebandInterface()) {
>> +    case qemu_nvme_mi:
>> +        retval = qemu_mi_write(data_out, num_bytes);
>> +        break;
>> +    default:
>> +        break;
>> +    }
>> +    return retval;
>> +}
>> +
>> +int hal_i2c_read(uint8_t *data_in, uint16_t num_bytes)
>> +{
>> +    uint32_t retval = -1;
>> +    switch (GetSidebandInterface()) {
>> +    case qemu_nvme_mi:
>> +        retval = qemu_mi_read(data_in, num_bytes);
>> +        break;
>> +    default:
>> +        break;
>> +    }
>> +    return retval;
>> +}
>
>I'm really not a fan of having non-standard interfaces. If you were
>going to do that, though, you should create a struct of function
>pointers so that you don't need these repetitive "switch (...)"
>statements.
>
>But if we're going to have OOB MI support in toolign, they should all
>use the same standard defined interface.
>

Thanks for your comments.
We are planning to incorporate smbus/i2c interface in nvme-cli & qemu
and the patch will be shared in a few days.
While sharing the above patch, we will take care of the hardware
interface layer based on function pointer implementation as well.


------jwvcjYHrFM3c_jtOMPe-K-pT79fi971tFzH_ulp86vm5ORTx=_a6d46_
Content-Type: text/plain; charset="utf-8"


------jwvcjYHrFM3c_jtOMPe-K-pT79fi971tFzH_ulp86vm5ORTx=_a6d46_--

