Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 722131F0A42
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Jun 2020 08:37:34 +0200 (CEST)
Received: from localhost ([::1]:60174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jhow1-0003Ts-4P
	for lists+qemu-devel@lfdr.de; Sun, 07 Jun 2020 02:37:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jhovJ-0002y1-HQ
 for qemu-devel@nongnu.org; Sun, 07 Jun 2020 02:36:49 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:31865
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jhovH-0000pi-BE
 for qemu-devel@nongnu.org; Sun, 07 Jun 2020 02:36:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591511806;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=GoqZp33SoDzxHaygSqHAERwmYa1Skf5Y3XRwhGBnKIo=;
 b=AxdJbbB8/tvx88xXMS22wYd5RAVPOa+88LWyJU8iO8SoY83ogTzUWhkvm4qC+SKpc1nSTS
 UafuDTWGx6e+flFxmBA/pZvEugFCAcSIUZkv1WI4VLCWOXyBfSEetBmhVsknbnzfWjOHRQ
 bp5UGqt0CxroNMhAGnNZMZXv+nD0OYE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-vEzg4er7Mw6vUMzYb8PV4Q-1; Sun, 07 Jun 2020 02:36:44 -0400
X-MC-Unique: vEzg4er7Mw6vUMzYb8PV4Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 19AF78015CB;
 Sun,  7 Jun 2020 06:36:43 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-22.ams2.redhat.com [10.36.112.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F00807CCEB;
 Sun,  7 Jun 2020 06:36:41 +0000 (UTC)
Subject: Re: [PATCH] hw/misc/auxbus: Use qemu_log_mask(UNIMP) instead of debug
 printf
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200606070216.30952-1-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <393bd3e9-e242-24f1-57cd-a89481369826@redhat.com>
Date: Sun, 7 Jun 2020 08:36:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200606070216.30952-1-f4bug@amsat.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/07 02:36:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: qemu-trivial@nongnu.org, Fred Konrad <konrad@adacore.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/06/2020 09.02, Philippe Mathieu-Daudé wrote:
> Replace a deprecated DPRINTF() call by qemu_log_mask(LOG_UNIMP).
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/misc/auxbus.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/misc/auxbus.c b/hw/misc/auxbus.c
> index f8e7b97971..06aabf20c5 100644
> --- a/hw/misc/auxbus.c
> +++ b/hw/misc/auxbus.c
> @@ -196,7 +196,7 @@ AUXReply aux_request(AUXBus *bus, AUXCommand cmd, uint32_t address,
>          }
>          break;
>      default:
> -        DPRINTF("Not implemented!\n");
> +        qemu_log_mask(LOG_UNIMP, "AUX cmd=%u not implemented\n", cmd);
>          return AUX_NACK;
>      }
>  
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


