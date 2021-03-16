Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CEF33CF93
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 09:19:13 +0100 (CET)
Received: from localhost ([::1]:58928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM4v2-0002ky-Ve
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 04:19:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <changzihao1@huawei.com>)
 id 1lM4q3-0003C2-Dw
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 04:14:03 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:3936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <changzihao1@huawei.com>)
 id 1lM4pz-00087f-N5
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 04:14:02 -0400
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4F05bN0bLjzNn33;
 Tue, 16 Mar 2021 16:11:28 +0800 (CST)
Received: from [10.174.186.85] (10.174.186.85) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.498.0; Tue, 16 Mar 2021 16:13:40 +0800
Subject: Re: [PATCH v7 0/3] vnc: support reload x509 certificates
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20210315131609.2208-1-changzihao1@huawei.com>
 <20210315180700.jbkzd52y2u3vwf55@sirius.home.kraxel.org>
From: Zihao Chang <changzihao1@huawei.com>
Message-ID: <dec8a65a-b980-cc7e-bd33-5a98f55223f0@huawei.com>
Date: Tue, 16 Mar 2021 16:13:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210315180700.jbkzd52y2u3vwf55@sirius.home.kraxel.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.186.85]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=changzihao1@huawei.com; helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: berrange@redhat.com, oscar.zhangbo@huawei.com, qemu-devel@nongnu.org,
 xiexiangyou@huawei.com, armbru@redhat.com, yebiaoxiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2021/3/16 2:07, Gerd Hoffmann wrote:
> On Mon, Mar 15, 2021 at 09:16:06PM +0800, Zihao Chang wrote:
>> This series supports reload x509 certificates for vnc
>> 1. Support reload x509 certificates.
>> 2. Support reload vnc certificates.
>> 3. Add new qmp display-reload and implement reload x509 certificates
>> for vnc.
>>
>> Example:
>> {"execute": "display-reload", "arguments":{"type": "vnc", "tls-certs": true}}
>>
>> Zihao Chang (3):
>>   crypto: add reload for QCryptoTLSCredsClass
>>   vnc: support reload x509 certificates for vnc
>>   qmp: add new qmp display-reload
> 
> fails gitlab.com ci (build-disabled test, possibly more, still running).
> 
> take care,
>   Gerd
> 
Sorry for the problem, I've fixed this in the patch v8.

Thanks,
Zihao
> 
> 

