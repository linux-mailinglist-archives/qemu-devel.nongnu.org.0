Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 744CD2D7A5E
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 17:01:53 +0100 (CET)
Received: from localhost ([::1]:47998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knkrg-0001GT-Fu
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 11:01:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1knkjb-0002Rv-2a
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 10:53:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1knkjZ-0007aD-0E
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 10:53:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607702008;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rRw/A1BuerAs5PcyOio/aB/yUWmxQV8/LVLsGla7Kik=;
 b=e1FTPN1hyQfNkldr8uugkNKQ1fKTmDkmR1T2Z1OzFB7xIM2C5GPAat29Z2VwsAMPxvbS79
 ww+KFx9igDGCNykDvOYPU7dIPY1VF0lmqveQDH29UWmMEL+1mx83eHV3dJ2E4ymK8SYECS
 vp0MtF84v5LM25Zd2qHNULA3hznoc9k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-W7NJbX0mN5ygsuEsRXcnuw-1; Fri, 11 Dec 2020 10:53:26 -0500
X-MC-Unique: W7NJbX0mN5ygsuEsRXcnuw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 29A58E745;
 Fri, 11 Dec 2020 15:53:25 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-113-76.ams2.redhat.com [10.36.113.76])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C083F5F9A6;
 Fri, 11 Dec 2020 15:53:23 +0000 (UTC)
Subject: Re: [PATCH] hw/rtc/twl92230: Add missing 'break'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201211154605.511714-1-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <ab22ad23-d529-397a-9c92-3b6a9a08fa07@redhat.com>
Date: Fri, 11 Dec 2020 16:53:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201211154605.511714-1-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/12/2020 16.46, Philippe Mathieu-Daudé wrote:
> Add missing 'break' to fix:
> 
>   hw/rtc/twl92230.c: In function ‘menelaus_write’:
>   hw/rtc/twl92230.c:713:5: error: label at end of compound statement
>     713 |     default:
>         |     ^~~~~~~

... which occurs when disabling the "VERBOSE" switch in this file (that is
enabled by default - that's why we've not noticed this before).

> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> I noticed Thomas "Compile QEMU with -Wimplicit-fallthrough" series
> and remembered this old patch.
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/rtc/twl92230.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/rtc/twl92230.c b/hw/rtc/twl92230.c
> index f838913b378..28656cb0e59 100644
> --- a/hw/rtc/twl92230.c
> +++ b/hw/rtc/twl92230.c
> @@ -714,6 +714,7 @@ static void menelaus_write(void *opaque, uint8_t addr, uint8_t value)
>  #ifdef VERBOSE
>          printf("%s: unknown register %02x\n", __func__, addr);
>  #endif
> +        break;
>      }
>  }

Reviewed-by: Thomas Huth <thuth@redhat.com>


