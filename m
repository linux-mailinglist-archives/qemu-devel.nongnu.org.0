Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6452FAB93
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 21:36:44 +0100 (CET)
Received: from localhost ([::1]:40372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1bGV-0003mY-Jq
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 15:36:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l1ari-0002em-Pc
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 15:11:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l1arf-000136-QF
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 15:11:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611000662;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WUVVBo6Ajtsp1p1cl9vt8il5Uqeysu/ud/O2QfPozL8=;
 b=cwA//VxcW9Z1oC6OvFd0PKzVjptXYyRuIu2VPOSX6eg2/g9rClFQ+BM9dIpJO924p8ia9A
 +GzxcE5BDLLI8OXWvhC59Ohh4bN+BhV70G/ypHrUtX6w77FOAutirLNqbe0VlmYhAar7Wa
 4bxYJth66T1GDEDygJNNlI6efUdvhcI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-492-_5-D_X5wMBS0cETqTD7Ozg-1; Mon, 18 Jan 2021 15:10:58 -0500
X-MC-Unique: _5-D_X5wMBS0cETqTD7Ozg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A459192FDA3;
 Mon, 18 Jan 2021 20:10:56 +0000 (UTC)
Received: from work-vm (ovpn-115-197.ams2.redhat.com [10.36.115.197])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BB2DE1002388;
 Mon, 18 Jan 2021 20:10:47 +0000 (UTC)
Date: Mon, 18 Jan 2021 20:10:45 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [RFC PATCH v2 10/20] hw/usb/hcd-ohci: Mark the device with no
 migratable fields
Message-ID: <20210118201045.GI9899@work-vm>
References: <20210117192446.23753-1-f4bug@amsat.org>
 <20210117192446.23753-11-f4bug@amsat.org>
MIME-Version: 1.0
In-Reply-To: <20210117192446.23753-11-f4bug@amsat.org>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.175,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Philippe Mathieu-Daudé (f4bug@amsat.org) wrote:
> This device doesn't have fields to migrate. Be explicit
> by using vmstate_qdev_no_state_to_migrate.
> 
> Add a more descriptive comment to keep a clear separation
> between static property vs runtime changeable.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

OK,

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>


although I think it's quite interesting; I think we have
a base class which has data to migrate which expects any
child classes to migrate it's data; so marking it as
not actually having any state is not quite right.

> ---
>  hw/usb/hcd-ohci.h | 2 ++
>  hw/usb/hcd-ohci.c | 1 +
>  2 files changed, 3 insertions(+)
> 
> diff --git a/hw/usb/hcd-ohci.h b/hw/usb/hcd-ohci.h
> index 11ac57058d1..fd4842a352f 100644
> --- a/hw/usb/hcd-ohci.h
> +++ b/hw/usb/hcd-ohci.h
> @@ -101,6 +101,8 @@ struct OHCISysBusState {
>      /*< public >*/
>  
>      OHCIState ohci;
> +
> +    /* Properties */
>      char *masterbus;
>      uint32_t num_ports;
>      uint32_t firstport;
> diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
> index f8c64c8b95b..302aab30992 100644
> --- a/hw/usb/hcd-ohci.c
> +++ b/hw/usb/hcd-ohci.c
> @@ -2007,6 +2007,7 @@ static void ohci_sysbus_class_init(ObjectClass *klass, void *data)
>      DeviceClass *dc = DEVICE_CLASS(klass);
>  
>      dc->realize = ohci_realize_pxa;
> +    dc->vmsd = vmstate_qdev_no_state_to_migrate;
>      set_bit(DEVICE_CATEGORY_USB, dc->categories);
>      dc->desc = "OHCI USB Controller";
>      device_class_set_props(dc, ohci_sysbus_properties);
> -- 
> 2.26.2
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


