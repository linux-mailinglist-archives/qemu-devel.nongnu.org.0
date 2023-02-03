Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B11F76898DA
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 13:34:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNvGK-0001an-Tj; Fri, 03 Feb 2023 07:33:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNvG7-0001TN-E2
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 07:33:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNvG6-0001ww-0y
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 07:33:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675427616;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=up0ne8COrAE42tEysraXT2ttxJdIz31866hjTGa8KpA=;
 b=EWBEIAK9z5YbMIIAiRhTn0PDKrjRCIJG+6Ul7R2V5U7qOCg752oWHacJ5g+bAUrbT5LxKN
 Fvw4IZKzRlf8saNC1tx+hHh/aOGthesP66lSBpcAj8PNLweaCZxk1CLRx7Ou+OZ38hYpY5
 zVVYNk/o0SBfU5JtIyDw6qfQXgV8QCg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-512-Z5LFGru4PEiFb_qzw0U4OA-1; Fri, 03 Feb 2023 07:33:35 -0500
X-MC-Unique: Z5LFGru4PEiFb_qzw0U4OA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9AD09101A521;
 Fri,  3 Feb 2023 12:33:34 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 78A9018EC5;
 Fri,  3 Feb 2023 12:33:34 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 79A1B21E6A1F; Fri,  3 Feb 2023 13:33:33 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  qemu-arm@nongnu.org,  qemu-ppc@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,  Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 5/9] hw/usb/hcd-ohci: Include missing 'sysbus.h' header
References: <20230203113650.78146-1-philmd@linaro.org>
 <20230203113650.78146-6-philmd@linaro.org>
Date: Fri, 03 Feb 2023 13:33:33 +0100
In-Reply-To: <20230203113650.78146-6-philmd@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Fri, 3 Feb 2023 12:36:46
 +0100")
Message-ID: <87edr7c4iq.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> Avoid when including "hw/usb/hcd-ohci.h":
>
>   hw/usb/hcd-ohci.h:100:5: error: unknown type name 'SysBusDevice'
>       SysBusDevice parent_obj;
>       ^
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/usb/hcd-ohci.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/usb/hcd-ohci.h b/hw/usb/hcd-ohci.h
> index 11ac57058d..e5e6b434fd 100644
> --- a/hw/usb/hcd-ohci.h
> +++ b/hw/usb/hcd-ohci.h
> @@ -21,6 +21,7 @@
>  #ifndef HCD_OHCI_H
>  #define HCD_OHCI_H
>=20=20
> +#include "hw/sysbus.h"
>  #include "sysemu/dma.h"
>  #include "hw/usb.h"
>  #include "qom/object.h"

Reviewed-by: Markus Armbruster <armbru@redhat.com>


