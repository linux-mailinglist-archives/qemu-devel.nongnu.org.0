Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0381F62C7
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Jun 2020 09:39:27 +0200 (CEST)
Received: from localhost ([::1]:37126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jjHo5-0005c0-HX
	for lists+qemu-devel@lfdr.de; Thu, 11 Jun 2020 03:39:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jjHn3-00044d-1r
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 03:38:21 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:47883
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jjHn2-0006Gp-83
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 03:38:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591861099;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=j9TbR9CiYS5xke6KPzjPF/ExSl4P94rgEh3Zthl/ekw=;
 b=ixlt/VdeBLKU37+lrOk30fUUrf7UkTH3beArs+C6bvEYQ9x0K6c663FAcIi5gnCNzfOwKe
 b78rUPR6jGgcdoDKxdJ0f9dBg1IcEFr+LimZzibCe2JFsDfEnxIsNEprK0lUUE0BU6MF63
 YnoRlUd8ifyzU0DkR/B39rqHb7R23Vw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-382-ZnWV_MDGOPqrlh0immLyZA-1; Thu, 11 Jun 2020 03:38:15 -0400
X-MC-Unique: ZnWV_MDGOPqrlh0immLyZA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 118CF8018A6;
 Thu, 11 Jun 2020 07:38:13 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-113-215.ams2.redhat.com [10.36.113.215])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 55DED5C1B0;
 Thu, 11 Jun 2020 07:38:09 +0000 (UTC)
Subject: Re: [PATCH v3 05/11] MAINTAINERS: Add an entry for common Renesas
 peripherals
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200610220853.8558-1-f4bug@amsat.org>
 <20200610220853.8558-6-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <03112dec-ca30-2fa2-02a7-7a7402721783@redhat.com>
Date: Thu, 11 Jun 2020 09:38:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200610220853.8558-6-f4bug@amsat.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/11 03:29:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Fam Zheng <fam@euphon.net>, Magnus Damm <magnus.damm@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, qemu-trivial@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/06/2020 00.08, Philippe Mathieu-Daudé wrote:
> Renesas peripherals are common to SH4/RX based MCUs. Their
> datasheets share common sections. It makes sense to maintain
> them altogether. The current names are misleading (see the
> 'sh' prefix). This will be fixed later when RX peripherals
> will be added.
> 
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  MAINTAINERS | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 653fca1da8..0398634179 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1254,8 +1254,6 @@ M: Magnus Damm <magnus.damm@gmail.com>
>  S: Odd Fixes
>  F: hw/sh4/r2d.c
>  F: hw/intc/sh_intc.c
> -F: hw/timer/sh_timer.c
> -F: include/hw/sh4/sh_intc.h

You've added the line for sh_intc.h in the previous patch, just to
remove it here again? ... I guess you only wanted to remove sh_timer.c
here instead?

 Thomas

>  Shix
>  S: Orphan
> @@ -1954,6 +1952,13 @@ F: hw/*/*xive*
>  F: include/hw/*/*xive*
>  F: docs/*/*xive*
>  
> +Renesas peripherals
> +M: Magnus Damm <magnus.damm@gmail.com>
> +S: Odd Fixes
> +F: hw/char/sh_serial.c
> +F: hw/timer/sh_timer.c
> +F: include/hw/sh4/sh.h
> +
>  Subsystems
>  ----------
>  Audio
> 


