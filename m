Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F54347CD1
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 16:39:24 +0100 (CET)
Received: from localhost ([::1]:43412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP5bP-00080M-OT
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 11:39:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lP5aK-000764-Ph
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 11:38:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lP5aH-0005BI-Mt
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 11:38:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616600291;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M/VSQMqAeY6MszK4Q24ckwUzVn5F6ynQAm1Wwxb5a1g=;
 b=CavUpYvzWwpfeovmu3DhFELop0a5SkannzrEfkT4qeHFZ5EJmTWigt+0cDHnOkEljnZqjC
 3GxknCuiWhXhNfM4iOgDoqLOV+Gq8uGXTwBj+x7u7YX9EvJU0R/Jdj992mInIPP5Kg+g4G
 PZudOmllPLeasYoaUEcoICJN/7Js78M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-QZvLfg5HNHmghUy_ZXtQtw-1; Wed, 24 Mar 2021 11:38:09 -0400
X-MC-Unique: QZvLfg5HNHmghUy_ZXtQtw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73EFA8030D7;
 Wed, 24 Mar 2021 15:38:08 +0000 (UTC)
Received: from work-vm (ovpn-115-64.ams2.redhat.com [10.36.115.64])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A26979448;
 Wed, 24 Mar 2021 15:38:06 +0000 (UTC)
Date: Wed, 24 Mar 2021 15:38:04 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH] hw/isa/piix4: Migrate Reset Control Register
Message-ID: <YFtc3HzzHT8N3Eo+@work-vm>
References: <20210324142814.609112-1-f4bug@amsat.org>
MIME-Version: 1.0
In-Reply-To: <20210324142814.609112-1-f4bug@amsat.org>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
 qemu-devel@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Philippe Mathieu-Daudé (f4bug@amsat.org) wrote:
> Fixes: 5790b757cfb ("piix4: Add the Reset Control Register")
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

So if I understand correctly, piix4 is only used on one of the MIPS
machines, so that bumping the version here won't break anyone who
cares about backwards migration; in which case from a migration point of
view:


Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  hw/isa/piix4.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
> index a50d97834c7..6eeff4525f8 100644
> --- a/hw/isa/piix4.c
> +++ b/hw/isa/piix4.c
> @@ -95,10 +95,11 @@ static void piix4_isa_reset(DeviceState *dev)
>  
>  static const VMStateDescription vmstate_piix4 = {
>      .name = "PIIX4",
> -    .version_id = 2,
> -    .minimum_version_id = 2,
> +    .version_id = 3,
> +    .minimum_version_id = 3,
>      .fields = (VMStateField[]) {
>          VMSTATE_PCI_DEVICE(dev, PIIX4State),
> +        VMSTATE_UINT8(rcr, PIIX4State),
>          VMSTATE_END_OF_LIST()
>      }
>  };
> -- 
> 2.26.2
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


