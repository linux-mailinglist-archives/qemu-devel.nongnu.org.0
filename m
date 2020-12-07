Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE67C2D16B7
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 17:46:57 +0100 (CET)
Received: from localhost ([::1]:49790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmJf6-0004oU-Ry
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 11:46:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kmJcW-0003RZ-Ou
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 11:44:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kmJcM-0000RE-FJ
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 11:44:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607359445;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d6qCnGP9fAKkzRo/ypmK6r4u9gZkeMbAU/AgVJGt8RY=;
 b=ErKz2T0Nq/YZhsm2oNZmTeOMLPEDKfyXlUuuGnRj8VrpJtykQl3PxuVVL5O1fz0Abdozvd
 zDX4RRcX3PinfhmYbFT0DjFja8yc2efvSLq0MnBosGshdlkrD/YQFGOecoCLnWrZDa6w9O
 xOLNDkfj/I2xd6qWVCCfwnV2U7dCx0A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-402-5mEW8ionPkqi-SfQPjeVkQ-1; Mon, 07 Dec 2020 11:44:04 -0500
X-MC-Unique: 5mEW8ionPkqi-SfQPjeVkQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A694800D55
 for <qemu-devel@nongnu.org>; Mon,  7 Dec 2020 16:44:03 +0000 (UTC)
Received: from localhost (unknown [10.40.208.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 384CF2DACF;
 Mon,  7 Dec 2020 16:44:01 +0000 (UTC)
Date: Mon, 7 Dec 2020 17:43:59 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 14/15] null-machine: do not create a default memdev
Message-ID: <20201207174359.03b099ce@redhat.com>
In-Reply-To: <20201202081854.4126071-15-pbonzini@redhat.com>
References: <20201202081854.4126071-1-pbonzini@redhat.com>
 <20201202081854.4126071-15-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed,  2 Dec 2020 03:18:53 -0500
Paolo Bonzini <pbonzini@redhat.com> wrote:

> The default RAM size is 0, so no RAM will be created anyway.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  hw/core/null-machine.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/core/null-machine.c b/hw/core/null-machine.c
> index 7e693523d7..c40badf5bc 100644
> --- a/hw/core/null-machine.c
> +++ b/hw/core/null-machine.c
> @@ -49,7 +49,7 @@ static void machine_none_machine_init(MachineClass *mc)
>      mc->init = machine_none_init;
>      mc->max_cpus = 1;
>      mc->default_ram_size = 0;
> -    mc->default_ram_id = "ram";
> +    mc->default_ram_id = NULL;

probably that will break:

 QEMU -m X -M none


maybe there is  a bug over there but
    "mc->default_ram_size = 0"
above, should result in
    current_machine->ram_size == 0
in case user hasn't provided "-m"
and hence memdev shouldn't be created

>      mc->no_serial = 1;
>      mc->no_parallel = 1;
>      mc->no_floppy = 1;


