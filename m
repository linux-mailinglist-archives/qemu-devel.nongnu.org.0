Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB3819D440
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Apr 2020 11:46:21 +0200 (CEST)
Received: from localhost ([::1]:52896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jKIu4-000558-Hp
	for lists+qemu-devel@lfdr.de; Fri, 03 Apr 2020 05:46:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59582)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1jKItB-0004VJ-Q1
 for qemu-devel@nongnu.org; Fri, 03 Apr 2020 05:45:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1jKIt9-0008As-N0
 for qemu-devel@nongnu.org; Fri, 03 Apr 2020 05:45:25 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:23053
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1jKIt8-0008A5-RS
 for qemu-devel@nongnu.org; Fri, 03 Apr 2020 05:45:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585907122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B416If9r0QtvvendAleiNCuTYOggUqubG9J1w5R85qk=;
 b=Q44pjh36mHviOFSwBuvq0wJv9KpKtYpqbqHGVV/q3u+vRehXRiCu/HKB6Oma8EAW47PV1k
 WMqLgUcB7jL7WOmD3gg/tZXZsCSsDv3ADXEfwlX3TtTnPQ8oEn5eoi1H08KZSnC3flIUNY
 DxkvBuFW99gAwfhE+s4bIqC3alk3V7w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-YtF_c4bCPcyHhY94hzI3YQ-1; Fri, 03 Apr 2020 05:45:18 -0400
X-MC-Unique: YtF_c4bCPcyHhY94hzI3YQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8EEF9190B2A3;
 Fri,  3 Apr 2020 09:45:17 +0000 (UTC)
Received: from localhost (unknown [10.40.208.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 43D305DA7D;
 Fri,  3 Apr 2020 09:45:05 +0000 (UTC)
Date: Fri, 3 Apr 2020 11:45:03 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2 03/12] acpi: drop pointless _STA method
Message-ID: <20200403114503.1150ebaf@redhat.com>
In-Reply-To: <20200403080502.8154-4-kraxel@redhat.com>
References: <20200403080502.8154-1-kraxel@redhat.com>
 <20200403080502.8154-4-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFy?= =?UTF-8?B?Yy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri,  3 Apr 2020 10:04:53 +0200
Gerd Hoffmann <kraxel@redhat.com> wrote:

> When returning a constant there is no point in having a method
> in the first place, _STA can be a simple integer instead.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/i386/acpi-build.c | 14 +++-----------
>  1 file changed, 3 insertions(+), 11 deletions(-)
> 
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 9a19c14e661b..214b98671bf2 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -1151,14 +1151,11 @@ static Aml *build_kbd_device_aml(void)
>  {
>      Aml *dev;
>      Aml *crs;
> -    Aml *method;
>  
>      dev = aml_device("KBD");
>      aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0303")));
>  
> -    method = aml_method("_STA", 0, AML_NOTSERIALIZED);
> -    aml_append(method, aml_return(aml_int(0x0f)));
> -    aml_append(dev, method);
> +    aml_append(dev, aml_name_decl("_STA", aml_int(0xf)));
>  
>      crs = aml_resource_template();
>      aml_append(crs, aml_io(AML_DECODE16, 0x0060, 0x0060, 0x01, 0x01));
> @@ -1173,14 +1170,11 @@ static Aml *build_mouse_device_aml(void)
>  {
>      Aml *dev;
>      Aml *crs;
> -    Aml *method;
>  
>      dev = aml_device("MOU");
>      aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0F13")));
>  
> -    method = aml_method("_STA", 0, AML_NOTSERIALIZED);
> -    aml_append(method, aml_return(aml_int(0x0f)));
> -    aml_append(dev, method);
> +    aml_append(dev, aml_name_decl("_STA", aml_int(0xf)));
>  
>      crs = aml_resource_template();
>      aml_append(crs, aml_irq_no_flags(12));
> @@ -2238,9 +2232,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>                                             TPM_CRB_ADDR_SIZE, AML_READ_WRITE));
>          aml_append(dev, aml_name_decl("_CRS", crs));
>  
> -        method = aml_method("_STA", 0, AML_NOTSERIALIZED);
> -        aml_append(method, aml_return(aml_int(0x0f)));
> -        aml_append(dev, method);
> +        aml_append(dev, aml_name_decl("_STA", aml_int(0xf)));
>  
>          tpm_build_ppi_acpi(tpm, dev);
>  


