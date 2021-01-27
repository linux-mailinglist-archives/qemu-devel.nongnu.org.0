Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 696393058AB
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 11:42:24 +0100 (CET)
Received: from localhost ([::1]:35038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4iHH-0006Bq-Fo
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 05:42:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1l4iFq-0005ek-5X
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 05:40:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1l4iFo-0004jx-LS
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 05:40:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611744051;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wbo8eQwV/WTeiNFaKItgb6Jb0RaTpSuZau0lxKisLBI=;
 b=igjRr61nTa7kUJzbctPMBWiFcGyXdzigtZn3hsJN6cYZ2tCPGIoHUIFGKBPNrY0p2cMFpd
 ecYkyjcsQEAJEGtTdBUqnx9Fm3eD+eyEXMxA3kgTMashilk2BGMcOYfmcMYZvPC+8W65xS
 jqo8rxmK3pu0rZoLxTow5HSLTU6orys=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-531-RIo1O7VZPj6UT_F_AOEmvQ-1; Wed, 27 Jan 2021 05:40:49 -0500
X-MC-Unique: RIo1O7VZPj6UT_F_AOEmvQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 514D5190B2A0;
 Wed, 27 Jan 2021 10:40:48 +0000 (UTC)
Received: from [10.40.194.186] (unknown [10.40.194.186])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 45FA410016FA;
 Wed, 27 Jan 2021 10:40:47 +0000 (UTC)
Subject: Re: [PATCH v3] machine: add missing doc for memory-backend option
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20210121161504.1007247-1-imammedo@redhat.com>
From: Michal Privoznik <mprivozn@redhat.com>
Message-ID: <5786708e-002c-f919-5586-d8d09d40bb0f@redhat.com>
Date: Wed, 27 Jan 2021 11:40:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210121161504.1007247-1-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mprivozn@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mprivozn@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: peter.maydell@linaro.org, pkrempa@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/21/21 5:15 PM, Igor Mammedov wrote:
> Add documentation for '-machine memory-backend' CLI option and
> how to use it.
> 
> And document that x-use-canonical-path-for-ramblock-id,
> is considered to be stable to make sure it won't go away by accident.
> 
> x- was intended for unstable/iternal properties, and not supposed to
> be stable option. However it's too late to rename (drop x-)
> it as it would mean that users will have to mantain both
> x-use-canonical-path-for-ramblock-id (for QEMU 5.0-5.2) versions
> and prefix-less for later versions.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
> v2:
>   - add doc that x-use-canonical-path-for-ramblock-id is considered stable,
>       (Peter Krempa <pkrempa@redhat.com>)
> v3:
>   - s/x-use-canonical-path-for-ramblock-id=on/x-use-canonical-path-for-ramblock-id=off/
>       (Michal Privoznik <mprivozn@redhat.com>)
>   - add to commit message why x- prefix is preserved
>   - drop clause about x-use-canonical-path-for-ramblock-id being stable
>     from help section, but keep it in code comment above
>     x-use-canonical-path-for-ramblock-id property. It's sufficient
>     to prevent option being changed/removed by accident.
>       (Peter Maydell <peter.maydell@linaro.org>)
> ---
>   backends/hostmem.c | 10 ++++++++++
>   qemu-options.hx    | 26 +++++++++++++++++++++++++-
>   2 files changed, 35 insertions(+), 1 deletion(-)

Reviewed-by: Michal Privoznik <mprivozn@redhat.com>

Michal


