Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E233320E6
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 09:40:34 +0100 (CET)
Received: from localhost ([::1]:42200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJXur-0006ih-2k
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 03:40:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <changzihao1@huawei.com>)
 id 1lJXtl-0006Hb-Dp
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 03:39:25 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:3162)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <changzihao1@huawei.com>)
 id 1lJXtj-0008Ef-9o
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 03:39:24 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4DvpVZ21vqz8vb5;
 Tue,  9 Mar 2021 16:37:26 +0800 (CST)
Received: from [10.174.186.85] (10.174.186.85) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.498.0; Tue, 9 Mar 2021 16:39:03 +0800
Subject: Re: [PATCH v4 0/3] vnc: support reload x509 certificates
To: <qemu-devel@nongnu.org>
References: <20210224123419.786-1-changzihao1@huawei.com>
From: Zihao Chang <changzihao1@huawei.com>
Message-ID: <bc5cd689-1a15-06d4-31ef-b4760ee79883@huawei.com>
Date: Tue, 9 Mar 2021 16:39:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210224123419.786-1-changzihao1@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.186.85]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35;
 envelope-from=changzihao1@huawei.com; helo=szxga07-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: berrange@redhat.com, oscar.zhangbo@huawei.com, armbru@redhat.com,
 xiexiangyou@huawei.com, yebiaoxiang@huawei.com, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping?

Is this patch set being reviewed?  Who can help to do this?

Thanks
Zihao

On 2021/2/24 20:34, Zihao Chang wrote:
> This series supports reload x509 certificates for vnc
> 1. Support reload x509 certificates.
> 2. Support reload vnc certificates.
> 3. Add new qmp display-reload and implement reload x509 certificates
> for vnc.
> 
> Example:
> {"execute": "display-reload", "arguments":{"vnc-tls-certs": true}}
> 
> 
> Zihao Chang (3):
>   crypto: add reload for QCryptoTLSCredsClass
>   vnc: support reload x509 certificates for vnc
>   qmp: add new qmp display-reload
> 
>  crypto/tlscredsx509.c     | 117 ++++++++++++++++++++++++++++++++++++++
>  include/crypto/tlscreds.h |   8 ++-
>  include/ui/console.h      |   1 +
>  monitor/qmp-cmds.c        |  12 ++++
>  qapi/ui.json              |  32 +++++++++++
>  ui/vnc.c                  |  28 +++++++++
>  6 files changed, 195 insertions(+), 3 deletions(-)
> 

