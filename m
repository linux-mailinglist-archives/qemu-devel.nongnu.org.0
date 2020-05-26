Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66EE51CDC9B
	for <lists+qemu-devel@lfdr.de>; Mon, 11 May 2020 16:06:14 +0200 (CEST)
Received: from localhost ([::1]:35116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jY94P-000117-Fd
	for lists+qemu-devel@lfdr.de; Mon, 11 May 2020 10:06:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gengdongjiu@huawei.com>)
 id 1jY92U-0007nD-Kw
 for qemu-devel@nongnu.org; Mon, 11 May 2020 10:04:14 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:39964 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gengdongjiu@huawei.com>)
 id 1jY92T-0001Q3-Bh
 for qemu-devel@nongnu.org; Mon, 11 May 2020 10:04:14 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id CB7799C3731E4C08D848
 for <qemu-devel@nongnu.org>; Mon, 11 May 2020 22:03:50 +0800 (CST)
Received: from [127.0.0.1] (10.142.68.147) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.487.0; Mon, 11 May 2020
 22:03:45 +0800
Subject: Re: [PATCH v26 01/10] acpi: nvdimm: change NVDIMM_UUID_LE to a common
 macro
To: <qemu-devel@nongnu.org>
References: <20200507134205.7559-1-gengdongjiu@huawei.com>
 <20200507134205.7559-2-gengdongjiu@huawei.com>
 <4f29e19c-cb37-05e6-0ae3-c019370e090b@redhat.com>
From: gengdongjiu <gengdongjiu@huawei.com>
Message-ID: <151408ae-269f-85af-207e-2f515aff2342@huawei.com>
Date: Mon, 11 May 2020 22:03:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <4f29e19c-cb37-05e6-0ae3-c019370e090b@redhat.com>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.142.68.147]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35;
 envelope-from=gengdongjiu@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/11 10:03:51
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2020/5/11 20:29, Philippe Mathieu-Daud� wrote:
>> @@ -1 +1 @@
>> -Subproject commit 2faae0f778f818fadc873308f983289df697eb93
>> +Subproject commit 55ab21c9a36852915b81f1b41ebaf3b6509dd8ba
> 
> The SLiRP submodule change is certainly unrelated.

Thanks Philippe's review and comments. I submitted another patchset "[PATCH RESEND v26 00/10] Add ARMv8 RAS virtualization support in QEMU" to fix it, please review that patchset.


