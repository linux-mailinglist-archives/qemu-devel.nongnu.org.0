Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E86C13152C5
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 16:26:54 +0100 (CET)
Received: from localhost ([::1]:59976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Uuk-0004US-1L
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 10:26:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1l9Utg-0003EZ-N4
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 10:25:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51300)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1l9Utb-0002hN-KA
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 10:25:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612884342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N1OCRv935mFCZE8L/RHcysUs7cJ1RrynxT3KfCtpIWA=;
 b=F97rCtyqihHAqMQhKM8oPtrQ4PpKQ+aA4n05ASFcJsXIrf0JJ39isrin1gDthrNAzxjDgU
 2yunGoGuxoF3sVMO33VCRD6zBT3bn7L/9oaPynCwqqf8KJamMkRtq4z5FLfSOiHhgIDXOf
 lU6IFb9bpvI0lY7Uk90VZ8ukJbLPkm0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-oPIjiMHbO7-rrweSmqclOg-1; Tue, 09 Feb 2021 10:25:40 -0500
X-MC-Unique: oPIjiMHbO7-rrweSmqclOg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 194AC10082F7;
 Tue,  9 Feb 2021 15:25:39 +0000 (UTC)
Received: from localhost (unknown [10.40.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2B36460C04;
 Tue,  9 Feb 2021 15:25:36 +0000 (UTC)
Date: Tue, 9 Feb 2021 16:25:35 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: isaku.yamahata@gmail.com
Subject: Re: [PATCH v2 5/9] acpi: add test case for smm unsupported -machine
 smm=off
Message-ID: <20210209162535.67dc82a8@redhat.com>
In-Reply-To: <b59eaefcfa5b4afc4c09056ebf9b9c3719422a0a.1612821109.git.isaku.yamahata@intel.com>
References: <cover.1612821108.git.isaku.yamahata@intel.com>
 <b59eaefcfa5b4afc4c09056ebf9b9c3719422a0a.1612821109.git.isaku.yamahata@intel.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Isaku Yamahata <isaku.yamahata@intel.com>, philmd@redhat.com,
 qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon,  8 Feb 2021 13:57:24 -0800
isaku.yamahata@gmail.com wrote:

> From: Isaku Yamahata <isaku.yamahata@intel.com>
> 
> Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  tests/qtest/bios-tables-test.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index 669202fc95..096d15db68 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -969,6 +969,17 @@ static void test_acpi_q35_tcg_numamem(void)
>      free_test_data(&data);
>  }
>  
> +static void test_acpi_q35_tcg_nosmm(void)
> +{
> +    test_data data;
> +
> +    memset(&data, 0, sizeof(data));
> +    data.machine = MACHINE_Q35;
> +    data.variant = ".nosmm";
> +    test_acpi_one("-machine smm=off", &data);
> +    free_test_data(&data);
> +}
> +
>  static void test_acpi_piix4_tcg_numamem(void)
>  {
>      test_data data;
> @@ -1325,6 +1336,7 @@ int main(int argc, char *argv[])
>          qtest_add_func("acpi/q35/memhp", test_acpi_q35_tcg_memhp);
>          qtest_add_func("acpi/piix4/numamem", test_acpi_piix4_tcg_numamem);
>          qtest_add_func("acpi/q35/numamem", test_acpi_q35_tcg_numamem);
> +        qtest_add_func("acpi/q35/nosmm", test_acpi_q35_tcg_nosmm);
>          qtest_add_func("acpi/piix4/dimmpxm", test_acpi_piix4_tcg_dimm_pxm);
>          qtest_add_func("acpi/q35/dimmpxm", test_acpi_q35_tcg_dimm_pxm);
>          qtest_add_func("acpi/piix4/acpihmat", test_acpi_piix4_tcg_acpi_hmat);


