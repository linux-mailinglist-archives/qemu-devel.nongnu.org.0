Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4BD21D2E8
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jul 2020 11:35:52 +0200 (CEST)
Received: from localhost ([::1]:45720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1juusJ-0001aX-33
	for lists+qemu-devel@lfdr.de; Mon, 13 Jul 2020 05:35:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1juunj-0003QW-O4
 for qemu-devel@nongnu.org; Mon, 13 Jul 2020 05:31:07 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:35922
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1juunh-0006hO-9M
 for qemu-devel@nongnu.org; Mon, 13 Jul 2020 05:31:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594632664;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=GvQ8Z7ojdhouw3Zjw8PBbbU+D+oG0srWxwf09EHThBA=;
 b=H0XFNQ03Xoc1h4/92rzGBRp+/pnaWn1RxuQrMKB6BdjzkbVDyhNOE+DNoiLrzJAMgQ9D+S
 Mp04yDxnmx26sqLMzlhrbA7dRVwYgAoOiif0d7P86O4NelJHYjj5JC3yvWp6qWQeabTKnh
 jeT6VhKghcsnBDDTkxHNwk/EPwAsdyM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-83--CUfvtV1OqKS_FpMass5Vw-1; Mon, 13 Jul 2020 05:31:03 -0400
X-MC-Unique: -CUfvtV1OqKS_FpMass5Vw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A765580040A;
 Mon, 13 Jul 2020 09:31:01 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-125.ams2.redhat.com [10.36.112.125])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C4F6B5D9DC;
 Mon, 13 Jul 2020 09:30:59 +0000 (UTC)
Subject: Re: [PATCH 02/12] target/ppc: Remove superfluous breaks
To: Yi Wang <wang.yi59@zte.com.cn>, qemu-devel@nongnu.org
References: <1594631025-36219-1-git-send-email-wang.yi59@zte.com.cn>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <9429f7c1-0bcf-5092-9f39-302f6b1cf598@redhat.com>
Date: Mon, 13 Jul 2020 11:30:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1594631025-36219-1-git-send-email-wang.yi59@zte.com.cn>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=thuth@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/13 02:19:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: wang.liang82@zte.com.cn, QEMU Trivial <qemu-trivial@nongnu.org>,
 qemu-ppc@nongnu.org, xue.zhihong@zte.com.cn,
 Liao Pingfang <liao.pingfang@zte.com.cn>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/07/2020 11.03, Yi Wang wrote:
> From: Liao Pingfang <liao.pingfang@zte.com.cn>
> 
> Remove superfluous breaks, as there is a "return" before them.
> 
> Signed-off-by: Liao Pingfang <liao.pingfang@zte.com.cn>
> Signed-off-by: Yi Wang <wang.yi59@zte.com.cn>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org> 
> ---
>  target/ppc/misc_helper.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/target/ppc/misc_helper.c b/target/ppc/misc_helper.c
> index 55b68d1..e43a3b4 100644
> --- a/target/ppc/misc_helper.c
> +++ b/target/ppc/misc_helper.c
> @@ -234,25 +234,20 @@ target_ulong helper_clcs(CPUPPCState *env, uint32_t arg)
>      case 0x0CUL:
>          /* Instruction cache line size */
>          return env->icache_line_size;
> -        break;
>      case 0x0DUL:
>          /* Data cache line size */
>          return env->dcache_line_size;
> -        break;
>      case 0x0EUL:
>          /* Minimum cache line size */
>          return (env->icache_line_size < env->dcache_line_size) ?
>              env->icache_line_size : env->dcache_line_size;
> -        break;
>      case 0x0FUL:
>          /* Maximum cache line size */
>          return (env->icache_line_size > env->dcache_line_size) ?
>              env->icache_line_size : env->dcache_line_size;
> -        break;
>      default:
>          /* Undefined */
>          return 0;
> -        break;
>      }
>  }
>  
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


