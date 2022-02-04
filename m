Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05EBD4A992B
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 13:19:44 +0100 (CET)
Received: from localhost ([::1]:60596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFxZ0-0002mo-Io
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 07:19:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nFxRY-0000Hh-Oo
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 07:12:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nFxRT-00012q-8i
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 07:11:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643976713;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aMphTDq4MEPDWkLP5yY3WjgDY5AKriOFuutLNmeuDlc=;
 b=F5kqq/rtsRjyqZPVH3MrGPvfKtX1S6mmLmLYaGw7KDi3HSbD1ml72RnGpMSfGBQ9tmvgS+
 Y5WhxGj8sOtKr74MCw7Q/hlEYDlLH9c1Di4bzvAIcY8TAieTs/LBCfzGSNJcaxRzQKRy10
 PjofVwMfg06Zyvb8LVX2oyDmW8q4dl8=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-403-KOU03AjRNtWdEhLQAC-6Dg-1; Fri, 04 Feb 2022 07:11:53 -0500
X-MC-Unique: KOU03AjRNtWdEhLQAC-6Dg-1
Received: by mail-ej1-f72.google.com with SMTP id
 o4-20020a170906768400b006a981625756so2496287ejm.0
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 04:11:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aMphTDq4MEPDWkLP5yY3WjgDY5AKriOFuutLNmeuDlc=;
 b=NpobkZ11Bi7kI9tWGT7tQSvJmoWOdgI7qvMWZ9REhItag7gMa82nf6Y+6pcSodF39R
 hNXZSEFWUtdDv3N+BGc3B4k/+s23X9iyiRbaui3cvDe+vrgvurYHMn4imLQOFuHKnjkM
 +d295Eg+21jATwqDzJ+e9hB5JRRaGEYXaxD87Ys9sz22EpyasqBMNfcz1WZCfXF8u/s9
 PjcrnUWvbON+cvPC8h099784e9S95/6K0nZTO5P4ls2FW1vTTHk2oU1kvwnT9GjwEP1+
 /AwfdOJ3n0EEdVLMhtrVoblfOeJtVu7+kkg6eKnziRGSGSu7UCLv7kWmmnEARNhLQD7V
 ezWQ==
X-Gm-Message-State: AOAM531KC+cMwhqOHLKUDOpsPiqJWudCxS1avmWinGDxpWw5HoLfv2Id
 wsBMa3fZz0bU0k3VLexb5WbGG91t3C5VbiOjrSDHpqa/4kh3zjn4ja/467Z+v2+PqthCQgN8BTo
 FBxq+PpkT7LfMK3gE9F7PhG6wDVklCa7si+rEJ669+LSqsDqAK9z0Q0ssR4LKmUVv/Ys=
X-Received: by 2002:a17:906:9742:: with SMTP id
 o2mr2205575ejy.126.1643976711510; 
 Fri, 04 Feb 2022 04:11:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyj57lxOBwnPU6oEl8MujZNNZfr0Z6U3F893A+VpqxURKTUHW4VI7CzxqyLTu8dEybHwMDwIQ==
X-Received: by 2002:a17:906:9742:: with SMTP id
 o2mr2205555ejy.126.1643976711266; 
 Fri, 04 Feb 2022 04:11:51 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id cz6sm783330edb.4.2022.02.04.04.11.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 04:11:50 -0800 (PST)
Date: Fri, 4 Feb 2022 13:11:49 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= via <qemu-devel@nongnu.org>
Subject: Re: [PATCH 04/10] hw/acpi/memory_hotplug: Remove unused
 'hw/acpi/pc-hotplug.h' header
Message-ID: <20220204131149.6c3f57d3@redhat.com>
In-Reply-To: <20220203193803.45671-5-f4bug@amsat.org>
References: <20220203193803.45671-1-f4bug@amsat.org>
 <20220203193803.45671-5-f4bug@amsat.org>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.092,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu,  3 Feb 2022 20:37:57 +0100
Philippe Mathieu-Daud=C3=A9 via <qemu-devel@nongnu.org> wrote:

> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/acpi/memory_hotplug.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/hw/acpi/memory_hotplug.c b/hw/acpi/memory_hotplug.c
> index a581a2183b..0a7e89a13e 100644
> --- a/hw/acpi/memory_hotplug.c
> +++ b/hw/acpi/memory_hotplug.c
> @@ -1,6 +1,5 @@
>  #include "qemu/osdep.h"
>  #include "hw/acpi/memory_hotplug.h"
> -#include "hw/acpi/pc-hotplug.h"
>  #include "hw/mem/pc-dimm.h"
>  #include "hw/qdev-core.h"
>  #include "migration/vmstate.h"


