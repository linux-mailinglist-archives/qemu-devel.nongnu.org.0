Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 637B71BBB67
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Apr 2020 12:44:37 +0200 (CEST)
Received: from localhost ([::1]:52580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jTNjA-0001Ia-02
	for lists+qemu-devel@lfdr.de; Tue, 28 Apr 2020 06:44:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45230)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1jTNfJ-0007Ic-0n
 for qemu-devel@nongnu.org; Tue, 28 Apr 2020 06:42:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1jTNbh-0001iO-MG
 for qemu-devel@nongnu.org; Tue, 28 Apr 2020 06:40:35 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:46311
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1jTNbh-0001a4-5L
 for qemu-devel@nongnu.org; Tue, 28 Apr 2020 06:36:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588070211;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gKAG5jEnXVsg3LR+qqk/cFGOdFMkN77xyFHapGqosKA=;
 b=JSDmx7IaCOpOhJyDrH5O5AsBe5bECTJifBOsR5BHgS393WbzC1EBmoLaMaQeiuiitN0tpO
 n0roy4B0zYP8uoZIe7qgZ/C3UrAV6iNBtY+AgkyfKr7vsXjkTCFrXOoc81uA1lJsQNKOrA
 FQwaun5czcBetGWnZ1uuy4+esrNPsUM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-390-ZmIGqbrbNLSTAIqA0oXubg-1; Tue, 28 Apr 2020 06:36:47 -0400
X-MC-Unique: ZmIGqbrbNLSTAIqA0oXubg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D323107ACF3;
 Tue, 28 Apr 2020 10:36:46 +0000 (UTC)
Received: from gondolin (ovpn-112-178.ams2.redhat.com [10.36.112.178])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 876F560D3D;
 Tue, 28 Apr 2020 10:36:41 +0000 (UTC)
Date: Tue, 28 Apr 2020 12:36:39 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH 2/2] hw/arm/virt: Remove the compat forcing
 tpm-tis-device PPI to off
Message-ID: <20200428123639.5cd403c6.cohuck@redhat.com>
In-Reply-To: <20200427143145.16251-3-eric.auger@redhat.com>
References: <20200427143145.16251-1-eric.auger@redhat.com>
 <20200427143145.16251-3-eric.auger@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/28 02:06:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, eric.auger.pro@gmail.com, stefanb@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 27 Apr 2020 16:31:45 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> Now that the tpm-tis-device device PPI property is off by default,
> we can remove the compat used for the same goal.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/arm/virt.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 7dc96abf72..2a68306f28 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2311,11 +2311,6 @@ type_init(machvirt_machine_init);
>  
>  static void virt_machine_5_0_options(MachineClass *mc)
>  {
> -    static GlobalProperty compat[] = {
> -        { TYPE_TPM_TIS_SYSBUS, "ppi", "false" },
> -    };
> -
> -    compat_props_add(mc->compat_props, compat, G_N_ELEMENTS(compat));
>  }
>  DEFINE_VIRT_MACHINE_AS_LATEST(5, 0)
>  

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


