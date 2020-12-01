Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4DA2CA789
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 17:00:12 +0100 (CET)
Received: from localhost ([::1]:54604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk84Z-0005cL-A7
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 11:00:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kk83a-0004FV-V9
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 10:59:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kk83Z-0008Pd-Ia
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 10:59:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606838348;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=baHmn6Uii6J/Gvr1Di2CxuVEUzWqQIEY0HeaAI6Rz9I=;
 b=T/p9NpNPLaeMee4W1jYfQALC/EmzXqfhgH9Rvh/GHzqn74qOrpPJUSTP8iYJfAcz5hTNJx
 4cZ27jUd33tbRRsUsUMMfc++GbmchiGFTrFjWhSLoGVIEvg13GEg7hLH9k8fohMupeB9Dr
 h6Q7H1/SZFmhqJud1rgX+WxFRPf8hM8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-ze7wEPNFMtS3FeHVNBmjWQ-1; Tue, 01 Dec 2020 10:59:04 -0500
X-MC-Unique: ze7wEPNFMtS3FeHVNBmjWQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7A620817B8D;
 Tue,  1 Dec 2020 15:59:03 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-117.ams2.redhat.com [10.36.112.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 51D5A10013C1;
 Tue,  1 Dec 2020 15:59:01 +0000 (UTC)
Subject: Re: [PATCH 1/3] tests/qtest/fuzz-test: Quit test_lp1878642 once done
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20201201151319.2943325-1-philmd@redhat.com>
 <20201201151319.2943325-2-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <13abd57a-ead8-a2a8-dd9e-968b9c5a6c6e@redhat.com>
Date: Tue, 1 Dec 2020 16:59:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201201151319.2943325-2-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Hannes Reinecke <hare@suse.com>, qemu-block@nongnu.org,
 Li Qiang <liq3ea@163.com>, Alexander Bulekov <alxndr@bu.edu>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/12/2020 16.13, Philippe Mathieu-Daudé wrote:
> Missed in fd250172842 ("qtest: add a reproducer for LP#1878642").
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  tests/qtest/fuzz-test.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/qtest/fuzz-test.c b/tests/qtest/fuzz-test.c
> index 9cb4c42bdea..87b72307a5b 100644
> --- a/tests/qtest/fuzz-test.c
> +++ b/tests/qtest/fuzz-test.c
> @@ -45,6 +45,7 @@ static void test_lp1878642_pci_bus_get_irq_level_assert(void)
>      qtest_outl(s, 0xcf8, 0x8400f841);
>      qtest_outl(s, 0xcfc, 0xebed205d);
>      qtest_outl(s, 0x5d02, 0xebed205d);
> +    qtest_quit(s);
>  }
>  
>  int main(int argc, char **argv)
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


