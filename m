Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FEEC33AB8D
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 07:22:49 +0100 (CET)
Received: from localhost ([::1]:55538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLgcq-0003gO-Gi
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 02:22:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1lLgak-0002xS-Ik; Mon, 15 Mar 2021 02:20:38 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:4095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1lLgah-0004TK-6B; Mon, 15 Mar 2021 02:20:38 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4DzR7T17zTz7h9D;
 Mon, 15 Mar 2021 14:18:29 +0800 (CST)
Received: from [10.174.185.179] (10.174.185.179) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.498.0; Mon, 15 Mar 2021 14:20:11 +0800
Subject: Re: [PATCH v3] multi-process: Initialize variables declared with
 g_auto*
To: Miroslav Rezanina <mrezanin@redhat.com>
References: <20210312112143.1369-1-yuzenghui@huawei.com>
 <20210315054804.6yxv6dvypipwa7wu@lws.brq.redhat.com>
From: Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <a5fd7fd6-55a1-5daa-e821-098d8926c78a@huawei.com>
Date: Mon, 15 Mar 2021 14:20:10 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20210315054804.6yxv6dvypipwa7wu@lws.brq.redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.185.179]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=yuzenghui@huawei.com;
 helo=szxga07-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, jag.raman@oracle.com,
 qemu-trivial@nongnu.org, mjt@tls.msk.ru, qemu-devel@nongnu.org,
 laurent@vivier.eu, wanghaibin.wang@huawei.com, berrange@redhat.com,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2021/3/15 13:48, Miroslav Rezanina wrote:
> Missing declaration without initialization in hw/s390x/s390-pci-vfio.c
> othwerwise correct. Will you send v4 with missing initialization or
> should I send then as another patch?

I'd prefer the latter so that subsystem maintainers can take the
separate patch into their own tree ('Multi-process QEMU' and 'S390 PCI'
in this case). Please go ahead for the s390 fix.


Thanks,
Zenghui

