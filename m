Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6531F6665
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Jun 2020 13:17:14 +0200 (CEST)
Received: from localhost ([::1]:50586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jjLCr-0001Jh-JR
	for lists+qemu-devel@lfdr.de; Thu, 11 Jun 2020 07:17:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jjLBc-0000M3-W5
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 07:15:57 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:58857
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jjLBa-0003pp-Mv
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 07:15:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591874151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=SXkgHsPoVFhjkhyqdsdbFO5t/UoTf7zRcQ2mIJFGzHs=;
 b=b12UV4ySKNjreIosYQEOhQ7aqrvfPARU05DLi0g/49YjgSUWgOzgeL1FVShqrP+oL5z1QP
 wXbeab68KTVIbrulctVZjv/UbWRJypWUbH5A2ZKsSiGPoFDVXpxNGECFUQ1RsDCg4dh9FT
 7xl7NVTtGekOuaa34RvITMGAkCFQxK0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-340-aiFItTSsPD279zN5smcFhg-1; Thu, 11 Jun 2020 07:15:49 -0400
X-MC-Unique: aiFItTSsPD279zN5smcFhg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 41D681800D41;
 Thu, 11 Jun 2020 11:15:48 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-114-175.ams2.redhat.com [10.36.114.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D7B772B4DC;
 Thu, 11 Jun 2020 11:15:46 +0000 (UTC)
Subject: Re: [PATCH v3 1/1] MAINTAINERS: Adjust sh4 maintainership
To: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 qemu-devel@nongnu.org
References: <20200611095316.10133-1-aleksandar.qemu.devel@gmail.com>
 <20200611095316.10133-2-aleksandar.qemu.devel@gmail.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <505493ed-02c5-2760-5def-ce5a74b7cdd3@redhat.com>
Date: Thu, 11 Jun 2020 13:15:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200611095316.10133-2-aleksandar.qemu.devel@gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=thuth@redhat.com;
 helo=us-smtp-1.mimecast.com
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
Cc: peter.maydell@linaro.org, Aurelien Jarno <aurelien@aurel32.net>,
 Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/06/2020 11.53, Aleksandar Markovic wrote:
> This patch transfers sh4 sections to Yoshinori Sato, who is
> best positioned in the community to assume sh4 maintainership.
> He is the maintainer of the related target rx as well, which
> means that some synergy between the two targets can be expected
> in future.
> 
> Further adjustments, reorganizations, and improvements of sh4
> sections are left to the future maintainer to be devised and
> executed, as he deems suitable.
> 
> Aurelien and Magnus are deleted as maintainers in some sections
> of the MAINTAINERS file with this patch. However, they will not
> be deleted from QEMU Hall of Fame, where their names will always
> remained carved in stone as QEMU pioneers and granddaddies.
> 
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Acked-by: Aurelien Jarno <aurelien@aurel32.net>
> Acked-by: Magnus Damm <magnus.damm@gmail.com>
> Acked-by: Yoshinori Sato <ysato@users.sourceforge.jp>
> Signed-off-by: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
> ---
>  MAINTAINERS | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6e7890ce82..5c78ff5672 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -296,7 +296,7 @@ F: tests/tcg/s390x/
>  L: qemu-s390x@nongnu.org
>  
>  SH4 TCG CPUs
> -M: Aurelien Jarno <aurelien@aurel32.net>
> +M: Yoshinori Sato <ysato@users.sourceforge.jp>
>  S: Odd Fixes
>  F: target/sh4/
>  F: hw/sh4/
> @@ -1251,14 +1251,16 @@ F: include/hw/riscv/opentitan.h
>  SH4 Machines
>  ------------
>  R2D
> -M: Magnus Damm <magnus.damm@gmail.com>
> +M: Yoshinori Sato <ysato@users.sourceforge.jp>
> +R: Magnus Damm <magnus.damm@gmail.com>
>  S: Maintained
>  F: hw/sh4/r2d.c
>  F: hw/intc/sh_intc.c
>  F: hw/timer/sh_timer.c
>  
>  Shix
> -M: Magnus Damm <magnus.damm@gmail.com>
> +M: Yoshinori Sato <ysato@users.sourceforge.jp>
> +R: Magnus Damm <magnus.damm@gmail.com>
>  S: Odd Fixes
>  F: hw/sh4/shix.c

Reviewed-by: Thomas Huth <thuth@redhat.com>


