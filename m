Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEEF32AEC79
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 09:55:14 +0100 (CET)
Received: from localhost ([::1]:34440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcluL-0006M5-RB
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 03:55:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kclsx-0005oj-JC
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 03:53:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47297)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kclsw-0004cD-0J
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 03:53:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605084824;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Kuppntx+tdPel+gHf56eSX5K81wrFDEl2mM4r/K/yOY=;
 b=WkU4b6UX2uS04BemSMBhodFw9gR0b+szQEBhlM52a4GNaFVA/3IfgruFwrucOqL5Z8Lzfk
 ZEIqf9ICUXvqz7wbXhlcNgjEztY2Fbn4vvvMcY3QD9fGRjh5Tq8VTcFNQXOAdKOAGckkBc
 KfaJYCo5QiLCd+0yDxE/hvtNNvBW8I0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-479-1BgGsuStM52JSo3-epjuOA-1; Wed, 11 Nov 2020 03:53:43 -0500
X-MC-Unique: 1BgGsuStM52JSo3-epjuOA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B1B136414C;
 Wed, 11 Nov 2020 08:53:41 +0000 (UTC)
Received: from [10.72.12.213] (ovpn-12-213.pek2.redhat.com [10.72.12.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0D90610013BD;
 Wed, 11 Nov 2020 08:53:39 +0000 (UTC)
Subject: Re: [PATCH] net/l2tpv3: Remove redundant check in net_init_l2tpv3()
To: Alex Chen <alex.chen@huawei.com>
References: <5F9B7E9F.8050004@huawei.com> <5FAB9512.7070200@huawei.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <449ef665-7dee-8ac3-66f7-d136607bc6ac@redhat.com>
Date: Wed, 11 Nov 2020 16:53:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <5FAB9512.7070200@huawei.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:49:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-trivial@nongnu.org, zhengchuan@huawei.com,
 QEMU <qemu-devel@nongnu.org>, zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2020/11/11 下午3:38, Alex Chen wrote:
> Kindly ping.
>
> On 2020/10/30 10:46, AlexChen wrote:
>> The result has been checked to be NULL before, it cannot be NULL here,
>> so the check is redundant. Remove it.
>>
>> Reported-by: Euler Robot<euler.robot@huawei.com>
>> Signed-off-by: AlexChen<alex.chen@huawei.com>
>> ---
>>   net/l2tpv3.c | 9 +++------
>>   1 file changed, 3 insertions(+), 6 deletions(-)


Queued.

Thanks


