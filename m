Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 650B62AB6D5
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Nov 2020 12:31:05 +0100 (CET)
Received: from localhost ([::1]:37176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kc5O4-0005yM-6b
	for lists+qemu-devel@lfdr.de; Mon, 09 Nov 2020 06:31:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kc5M2-0004Br-C7
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 06:28:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kc5Ly-0005jT-21
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 06:28:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604921332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/s1+1PSqcdH4Gsxh5UAFx2++HhciJ/Y/oNxhPqdRetg=;
 b=Usx9D4Ypip/Ib8Lku0kcJG+xAMVBRifWQ8vpXPfqyoevcuInFOkzLsFNCB7a78Kwwmju/i
 2TJoIYisaaXWBGoBfTj6e1t7q7xC9WlG2bsJGZ+C0InfO9HWjG7yt7wXBOYtGR2f6Ws/Uq
 S2AQMsyja6mLKEVqoKJGwKKYT3T7zT4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-zmOmNzPlO5CtI73GCh7n8g-1; Mon, 09 Nov 2020 06:28:50 -0500
X-MC-Unique: zmOmNzPlO5CtI73GCh7n8g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74FD01009E2C;
 Mon,  9 Nov 2020 11:28:49 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-53.ams2.redhat.com [10.36.112.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6EC455B4CF;
 Mon,  9 Nov 2020 11:28:47 +0000 (UTC)
Subject: Re: [PATCH] tests/qtest/tpm: Remove redundant check in the
 tpm_test_swtpm_test()
To: AlexChen <alex.chen@huawei.com>, stefanb@linux.vnet.ibm.com,
 lvivier@redhat.com, Paolo Bonzini <pbonzini@redhat.com>
References: <5FA41448.4040404@huawei.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <49c8d937-7acc-da16-96a2-d73279abdb56@redhat.com>
Date: Mon, 9 Nov 2020 12:28:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <5FA41448.4040404@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/09 00:04:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, QEMU <qemu-devel@nongnu.org>,
 zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/11/2020 16.03, AlexChen wrote:
> The 'addr' would not be NULL after checking 'succ' is valid,
> and it has been dereferenced in the previous code(args = g_strdup_printf()).
> So the check on 'addr' in the tpm_test_swtpm_test() is redundant. Remove it.
> 
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Alex Chen <alex.chen@huawei.com>
> ---
>  tests/qtest/tpm-tests.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/qtest/tpm-tests.c b/tests/qtest/tpm-tests.c
> index 70c80f8379..0da3a8a4df 100644
> --- a/tests/qtest/tpm-tests.c
> +++ b/tests/qtest/tpm-tests.c
> @@ -70,10 +70,8 @@ void tpm_test_swtpm_test(const char *src_tpm_path, tx_func *tx,
>      qtest_end();
>      tpm_util_swtpm_kill(swtpm_pid);
> 
> -    if (addr) {
> -        g_unlink(addr->u.q_unix.path);
> -        qapi_free_SocketAddress(addr);
> -    }
> +    g_unlink(addr->u.q_unix.path);
> +    qapi_free_SocketAddress(addr);
>  }

Right, addr gets already dereferenced earlier in this function, so it can
not be NULL here.

Reviewed-by: Thomas Huth <thuth@redhat.com>

Thanks, I'll queue this for my next pull request.


