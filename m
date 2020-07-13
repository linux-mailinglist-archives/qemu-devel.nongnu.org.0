Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 230DA21D303
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jul 2020 11:42:44 +0200 (CEST)
Received: from localhost ([::1]:41592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1juuyx-00030b-6r
	for lists+qemu-devel@lfdr.de; Mon, 13 Jul 2020 05:42:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1juuvH-0006uc-9F
 for qemu-devel@nongnu.org; Mon, 13 Jul 2020 05:38:55 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:26114
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1juuvF-0007uB-1n
 for qemu-devel@nongnu.org; Mon, 13 Jul 2020 05:38:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594633132;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=uYbchLs/u9jviJMaygK1iPJQYIstlsjoxUxH+OhMZ2I=;
 b=YOyfMMipkMjMYAQy7PeGK0v8kBxlZK9ojJ5maDr6FOiog7t3nduatiqQX3MFm/hZqhgozy
 FT7AQHwtUx8lD92ia0MiqG64iFeKDinHPi672aImaV4Db8wfItt3ta11g7ytMGa/5a0o+X
 7+YvoUq/wey2Q5FCjThaKN6bPOTQwK0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-4QxSJsgnMxWCMDRO9d170w-1; Mon, 13 Jul 2020 05:38:50 -0400
X-MC-Unique: 4QxSJsgnMxWCMDRO9d170w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1FE1E19067E1;
 Mon, 13 Jul 2020 09:38:49 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-125.ams2.redhat.com [10.36.112.125])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 573711001B07;
 Mon, 13 Jul 2020 09:38:46 +0000 (UTC)
Subject: Re: [PATCH 11/12] target/sh4: Remove superfluous breaks
To: Yi Wang <wang.yi59@zte.com.cn>, qemu-devel@nongnu.org
References: <1594631142-36745-1-git-send-email-wang.yi59@zte.com.cn>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <038e7f75-8c34-0a26-1451-75120d703c3d@redhat.com>
Date: Mon, 13 Jul 2020 11:38:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1594631142-36745-1-git-send-email-wang.yi59@zte.com.cn>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=thuth@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/13 03:20:22
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: xue.zhihong@zte.com.cn, QEMU Trivial <qemu-trivial@nongnu.org>,
 wang.liang82@zte.com.cn, Liao Pingfang <liao.pingfang@zte.com.cn>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/07/2020 11.05, Yi Wang wrote:
> From: Liao Pingfang <liao.pingfang@zte.com.cn>
> 
> Remove superfluous breaks, as there is a "return" before them.
> 
> Signed-off-by: Liao Pingfang <liao.pingfang@zte.com.cn>
> Signed-off-by: Yi Wang <wang.yi59@zte.com.cn>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/sh4/translate.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/target/sh4/translate.c b/target/sh4/translate.c
> index 6192d83..60c863d 100644
> --- a/target/sh4/translate.c
> +++ b/target/sh4/translate.c
> @@ -1542,7 +1542,6 @@ static void _decode_opc(DisasContext * ctx)
>          tcg_gen_qemu_ld_i32(REG(0), REG(B11_8), ctx->memidx,
>                              MO_TEUL | MO_UNALN);
>          return;
> -        break;
>      case 0x40e9:                /* movua.l @Rm+,R0 */
>          CHECK_SH4A
>          /* Load non-boundary-aligned data */
> @@ -1550,7 +1549,6 @@ static void _decode_opc(DisasContext * ctx)
>                              MO_TEUL | MO_UNALN);
>          tcg_gen_addi_i32(REG(B11_8), REG(B11_8), 4);
>          return;
> -        break;
>      case 0x0029:		/* movt Rn */
>          tcg_gen_mov_i32(REG(B11_8), cpu_sr_t);
>  	return;
> @@ -1638,7 +1636,6 @@ static void _decode_opc(DisasContext * ctx)
>          CHECK_SH4A
>          tcg_gen_mb(TCG_MO_ALL | TCG_BAR_SC);
>          return;
> -        break;
>      case 0x4024:		/* rotcl Rn */
>  	{
>  	    TCGv tmp = tcg_temp_new();
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


