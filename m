Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50616584071
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 15:57:39 +0200 (CEST)
Received: from localhost ([::1]:56502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH41C-0006cM-DT
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 09:57:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oH3kh-0006WJ-1Y
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 09:40:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oH3kb-0004b8-Ia
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 09:40:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659015629;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kWEUIZmzClZUIxtDa3GWdOFk7OGmLqO53Qq9Uv2F8ZE=;
 b=D1EpYotpMYsnvEN9f0odOOFWdR4FCdrv59dEuppDgnx7t0Ln9G5HNNvPQA44rUPaZdm5IV
 +5Jr25aJgWH+mNavafwzmTaI/rbQEQQolB9YMqNpCc4XaHLHPB6qsiGET6OAtb2dML8FqQ
 OuEMzAPgkUHJ/lv45KDdCp4sa5wWB90=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-533-NdE-AoKhN1aase4JjB2srg-1; Thu, 28 Jul 2022 09:40:25 -0400
X-MC-Unique: NdE-AoKhN1aase4JjB2srg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A2B193C1104D;
 Thu, 28 Jul 2022 13:40:24 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.211])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CF68D2026D64;
 Thu, 28 Jul 2022 13:40:23 +0000 (UTC)
Date: Thu, 28 Jul 2022 14:40:21 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, mst@redhat.com, peter.maydell@linaro.org,
 ani@anisinha.ca
Subject: Re: [PATCH for-7.1] tests: acpi: silence applesmc warning about
 invalid key
Message-ID: <YuKRxeHrPIo6+ryP@redhat.com>
References: <20220728133713.1369596-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220728133713.1369596-1-imammedo@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 28, 2022 at 09:37:13AM -0400, Igor Mammedov wrote:
> OSK value is irrelevant for ACPI test case.
> Supply fake OSK explicitly to prevent QEMU complaining about
> invalid key when it fallbacks to default_osk.
> 
> Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
>  tests/qtest/bios-tables-test.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index 359916c228..7c5f736b51 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -1632,7 +1632,9 @@ static void test_acpi_q35_applesmc(void)
>          .variant = ".applesmc",
>      };
>  
> -    test_acpi_one("-device isa-applesmc", &data);
> +    /* supply fake 64-byte OSK to silence missing key warning */
> +    test_acpi_one("-device isa-applesmc,osk=any64characterfakeoskisenough"
> +                  "topreventinvalidkeywarningsonstderr", &data);
>      free_test_data(&data);
>  }

All 64 chars present and correct.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


