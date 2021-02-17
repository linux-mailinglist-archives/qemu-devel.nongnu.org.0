Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6531E31D560
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 07:34:19 +0100 (CET)
Received: from localhost ([::1]:43798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCGPh-0002AQ-P7
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 01:34:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lCGOC-0001b1-RK
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 01:32:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lCGO7-00028W-Qn
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 01:32:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613543554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lLjj7hENldjN2+hSirsiAErZKm6y7CpFI8UV0P0QCaw=;
 b=dzg0tpP5owF5G3ZD53b9cDzXD7X/2oko507RtJF8JqpWrRBDQM6e73OM/RKQQP5jMPg1G2
 anCg3k3t/zQN+/L4pVjOlxbD6FEhSvpT911E+raoIgoh6eGNqTT+p6djBQB95vZP3+0Jqj
 gp0KBYopyGJqKSIo3AoJ4mUeJJ/vDxo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-469-2gJN6e8YMsKGO3FIpvgjWA-1; Wed, 17 Feb 2021 01:32:31 -0500
X-MC-Unique: 2gJN6e8YMsKGO3FIpvgjWA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C42B66D4E0;
 Wed, 17 Feb 2021 06:32:29 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-116.ams2.redhat.com [10.36.112.116])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E1A375C648;
 Wed, 17 Feb 2021 06:32:27 +0000 (UTC)
Subject: Re: [PATCH] fuzz-test: remove unneccessary debugging flags
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
References: <20210216181316.794276-1-alxndr@bu.edu>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <d73c3d4e-73e5-0719-6711-303413611561@redhat.com>
Date: Wed, 17 Feb 2021 07:32:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210216181316.794276-1-alxndr@bu.edu>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/02/2021 19.13, Alexander Bulekov wrote:
> These flags cause the output to look strange for 'make check', and
> they aren't needed to reproduce bugs, if they reappear.
> 
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> ---
>   tests/qtest/fuzz-test.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/tests/qtest/fuzz-test.c b/tests/qtest/fuzz-test.c
> index cdb1100a0b..6f161c93be 100644
> --- a/tests/qtest/fuzz-test.c
> +++ b/tests/qtest/fuzz-test.c
> @@ -39,8 +39,7 @@ static void test_lp1878642_pci_bus_get_irq_level_assert(void)
>       QTestState *s;
>   
>       s = qtest_init("-M pc-q35-5.0 "
> -                   "-nographic -monitor none -serial none "
> -                   "-d guest_errors -trace pci*");
> +                   "-nographic -monitor none -serial none");
>   
>       qtest_outl(s, 0xcf8, 0x8400f841);
>       qtest_outl(s, 0xcfc, 0xebed205d);
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


