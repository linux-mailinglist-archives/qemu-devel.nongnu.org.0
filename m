Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 334882CB491
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 06:42:38 +0100 (CET)
Received: from localhost ([::1]:52208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkKuS-0005iT-Nw
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 00:42:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kkKsN-0004x2-2A
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 00:40:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kkKsJ-0003DJ-Su
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 00:40:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606887622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7LWlzaa906OXuLx5YMQMh969fQddXats4KM4TgYtsCE=;
 b=VIKFgqhJKjOz/oTdbZn+Bk64o7nVVIXPgZJWQl6KB3kQRAFUirV8S32vBtgPRk0jOyec9E
 7l9OKDAoAOT7L3U5m6hj6w68ZKUchaFx4MeSaukjkkYuTneEsKMtVqEa427rCJ5xydoPmd
 QWg7+oGNeKC7p44dMpa0VcFGNMJRvZI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292--G4FvNW6Pr2o0bI3d-Jgeg-1; Wed, 02 Dec 2020 00:40:19 -0500
X-MC-Unique: -G4FvNW6Pr2o0bI3d-Jgeg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 057891842159;
 Wed,  2 Dec 2020 05:40:18 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-110.ams2.redhat.com [10.36.112.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9ED3510013BD;
 Wed,  2 Dec 2020 05:40:15 +0000 (UTC)
Subject: Re: [PATCH v2 3/4] tests/qtest/fuzz-test: Add
 test_megasas_cdb_len_zero() reproducer
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20201201191026.4149955-1-philmd@redhat.com>
 <20201201191026.4149955-4-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <53023705-a66c-8c9c-c18a-9af08d5a9a7f@redhat.com>
Date: Wed, 2 Dec 2020 06:40:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201201191026.4149955-4-philmd@redhat.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Fam Zheng <fam@euphon.net>,
 Hannes Reinecke <hare@suse.com>, qemu-block@nongnu.org,
 Li Qiang <liq3ea@163.com>, Alexander Bulekov <alxndr@bu.edu>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/12/2020 20.10, Philippe Mathieu-Daudé wrote:
> Add a reproducer which triggers (without the previous patch):
> 
>   $ make check-qtest-x86_64
>   Running test qtest-x86_64/fuzz-test
>   qemu-system-x86_64: hw/scsi/megasas.c:1679: megasas_handle_scsi: Assertion `cdb_len > 0 && scsi_cdb_length(cdb) <= cdb_len' failed.
>   tests/qtest/libqtest.c:181: kill_qemu() detected QEMU death from signal 6 (Aborted) (core dumped)
>   ERROR qtest-x86_64/fuzz-test - too few tests run (expected 1, got 0)
> 
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  tests/qtest/fuzz-test.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/tests/qtest/fuzz-test.c b/tests/qtest/fuzz-test.c
> index 87b72307a5b..31f90cfb4fc 100644
> --- a/tests/qtest/fuzz-test.c
> +++ b/tests/qtest/fuzz-test.c
> @@ -48,6 +48,23 @@ static void test_lp1878642_pci_bus_get_irq_level_assert(void)
>      qtest_quit(s);
>  }
>  
> +static void test_megasas_cdb_len_zero(void)
> +{
> +    QTestState *s;
> +
> +    s = qtest_init("-M pc -nodefaults "
> +                   "-device megasas-gen2 -device scsi-cd,drive=null0 "
> +                   "-blockdev driver=null-co,read-zeroes=on,node-name=null0");
> +
> +    qtest_outl(s, 0xcf8, 0x80001011);
> +    qtest_outb(s, 0xcfc, 0xbb);
> +    qtest_outl(s, 0xcf8, 0x80001002);
> +    qtest_outl(s, 0xcfc, 0xf3ff2966);
> +    qtest_writeb(s, 0x4600, 0x03);
> +    qtest_outw(s, 0xbb40, 0x460b);
> +    qtest_quit(s);
> +}
> +
>  int main(int argc, char **argv)
>  {
>      const char *arch = qtest_get_arch();
> @@ -59,6 +76,8 @@ int main(int argc, char **argv)
>                         test_lp1878263_megasas_zero_iov_cnt);
>          qtest_add_func("fuzz/test_lp1878642_pci_bus_get_irq_level_assert",
>                         test_lp1878642_pci_bus_get_irq_level_assert);
> +        qtest_add_func("fuzz/test_megasas_cdb_len_zero",
> +                       test_megasas_cdb_len_zero);
>      }
>  
>      return g_test_run();
> 

Acked-by: Thomas Huth <thuth@redhat.com>


