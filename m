Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB20C28174D
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Oct 2020 17:59:42 +0200 (CEST)
Received: from localhost ([::1]:48556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kONTB-0001Ap-VE
	for lists+qemu-devel@lfdr.de; Fri, 02 Oct 2020 11:59:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kONPf-0007JC-Sw
 for qemu-devel@nongnu.org; Fri, 02 Oct 2020 11:56:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kONPd-0006Lp-R4
 for qemu-devel@nongnu.org; Fri, 02 Oct 2020 11:56:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601654159;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/rF37OcPhN5IDHWM0r32+rP449QCmlHlgw5aAm2fsCk=;
 b=gNenE9t7bxCdSx7uQViSYrmi40hMp+1P0spErf1Gc9ssvnFkjUktOu7XHhMxU2AMe7sHH4
 vHttrk34C9duXxUcmmA5Y+8jOgjqxLInmXnKiCICtJe/rT59jozZyOeuPsN6HiIXh/zmi/
 9QP2wrLofaq6lg0jwd58+zn6LrAIWuA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-RDemEiNwNxOjr7MxADosDg-1; Fri, 02 Oct 2020 11:55:55 -0400
X-MC-Unique: RDemEiNwNxOjr7MxADosDg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 31D1B89CCC1;
 Fri,  2 Oct 2020 15:55:54 +0000 (UTC)
Received: from localhost (ovpn-119-102.rdu2.redhat.com [10.10.119.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E86385C1D7;
 Fri,  2 Oct 2020 15:55:53 +0000 (UTC)
Date: Fri, 2 Oct 2020 11:55:53 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Alistair Francis <alistair.francis@wdc.com>
Subject: Re: [PATCH v1 1/1] register: Remove unnecessary NULL check
Message-ID: <20201002155553.GA7303@habkost.net>
References: <00b3ad01ce01027870a036bc4f6adc873bc3f7d7.1601652718.git.alistair.francis@wdc.com>
MIME-Version: 1.0
In-Reply-To: <00b3ad01ce01027870a036bc4f6adc873bc3f7d7.1601652718.git.alistair.francis@wdc.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/01 23:37:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, alistair23@gmail.com,
 f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 02, 2020 at 08:33:40AM -0700, Alistair Francis wrote:
> This patch fixes CID 1432800 by removing an unnecessary check.
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/core/register.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/core/register.c b/hw/core/register.c
> index 31038bd7cc..9ac9bc6bfe 100644
> --- a/hw/core/register.c
> +++ b/hw/core/register.c
> @@ -258,7 +258,7 @@ static RegisterInfoArray *register_init_block(DeviceState *owner,
>          int index = rae[i].addr / data_size;
>          RegisterInfo *r = &ri[index];
>  
> -        if (data + data_size * index == 0 || !&rae[i]) {
> +        if (!&rae[i]) {

I thought you were going to remove both checks.

rae can't be NULL, so &rae[i] will never be NULL.

>              continue;
>          }
>  
> -- 
> 2.28.0
> 

-- 
Eduardo


