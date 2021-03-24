Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0807434821D
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 20:42:28 +0100 (CET)
Received: from localhost ([::1]:56384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP9Oc-0006Z8-8V
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 15:42:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lP9Mp-0005bb-GL
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 15:40:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lP9Ml-0000GA-S7
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 15:40:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616614830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ok5JhezqL8TtYqnY+inkxdrQeUdPeBPhlCFGWd4tgH4=;
 b=Xi0QhUDjhFbbwg8u4SqwsYXWdErqoudY/SuTi3IIzJuXUi/XNH+SJERjHfxVZoGJepSRuv
 97veZvWs3xOSQmsdNQMY3WXB+reaq0skYTNHzfNDQQA8xUg4qmlBhrRzeaK1f0rZqffTEC
 04WC0rydwRgjnsNYNP2kxYLV52ZjfAA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-100-OuphCXQAMi-XgGYGkkOJUQ-1; Wed, 24 Mar 2021 15:40:27 -0400
X-MC-Unique: OuphCXQAMi-XgGYGkkOJUQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A07CA100830E;
 Wed, 24 Mar 2021 19:40:13 +0000 (UTC)
Received: from work-vm (ovpn-112-29.ams2.redhat.com [10.36.112.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 42A5D71282;
 Wed, 24 Mar 2021 19:40:12 +0000 (UTC)
Date: Wed, 24 Mar 2021 19:40:09 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2] hw/isa/piix4: Migrate Reset Control Register
Message-ID: <YFuVmTJcsdXj1UrG@work-vm>
References: <20210324192731.717142-1-f4bug@amsat.org>
MIME-Version: 1.0
In-Reply-To: <20210324192731.717142-1-f4bug@amsat.org>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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
> When adding the Reset register in commit 5790b757cfb we
> forgot to migrate it.
> 
> While it is possible a VM using the PIIX4 is migrated just
> after requesting a system shutdown, it is very unlikely.
> However when restoring a migrated VM, we might have the
> RCR bit #4 set on the stack and when the VM resume it
> directly shutdowns.
> 
> Add a post_load() migration handler and set the default
> RCR value to 0 for earlier versions, assuming the VM was
> not going to shutdown before migration.
> 
> Fixes: 5790b757cfb ("piix4: Add the Reset Control Register")
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> v2: Add piix4_ide_post_load() and describe
> ---
>  hw/isa/piix4.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
> index a50d97834c7..e7bce0e590c 100644
> --- a/hw/isa/piix4.c
> +++ b/hw/isa/piix4.c
> @@ -93,12 +93,25 @@ static void piix4_isa_reset(DeviceState *dev)
>      pci_conf[0xae] = 0x00;
>  }
>  
> +static int piix4_ide_post_load(void *opaque, int version_id)
> +{
> +    PIIX4State *s = opaque;
> +
> +    if (version_id == 2) {
> +        s->rcr = 0;
> +    }
> +
> +    return 0;
> +}
> +
>  static const VMStateDescription vmstate_piix4 = {
>      .name = "PIIX4",
> -    .version_id = 2,
> +    .version_id = 3,
>      .minimum_version_id = 2,
> +    .post_load = piix4_ide_post_load,
>      .fields = (VMStateField[]) {
>          VMSTATE_PCI_DEVICE(dev, PIIX4State),
> +        VMSTATE_UINT8(rcr, PIIX4State),

I don't think that looks right any more; you'd need to make that a 
   VMSTATE_UINT8_V(rcr, PIIX4State, 3),

I think, otherwise when you loaded a v2 it would still try
and read the rcr byte.

Dave

>          VMSTATE_END_OF_LIST()
>      }
>  };
> -- 
> 2.26.2
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


