Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC09D3AB14B
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 12:23:37 +0200 (CEST)
Received: from localhost ([::1]:38554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltpBR-0000Ue-1U
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 06:23:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ltonj-00040U-QQ
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:59:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ltoni-0000mp-3R
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:59:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623923945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1N8Wu0fp/1U7UTLdzkcGOmdeBnZsrdnZHFjqgZm2LUg=;
 b=BEjP2n3bwpP4UuOkMb+gbhXOoFp0bNTwAkukKwpF8n2TDtWwQW2G/90hYnQIku/3Nm4d7r
 u6erLTZT9rfQRv9Hl9zhCbfElsgnIeGl7OdIWpROv63yd7V2am+Z3Ey14OsI4j727cVZTp
 nHLqwyYx/sm0MUarf1ilg5gUefQBpdY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-569-rLjYNgyEP6G3BNxfCLHdDg-1; Thu, 17 Jun 2021 05:59:03 -0400
X-MC-Unique: rLjYNgyEP6G3BNxfCLHdDg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B3C3D91270;
 Thu, 17 Jun 2021 09:59:02 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7FC4560C05;
 Thu, 17 Jun 2021 09:59:02 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D15C218000B2; Thu, 17 Jun 2021 11:59:00 +0200 (CEST)
Date: Thu, 17 Jun 2021 11:59:00 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH] audio: Fix format specifications of debug logs
Message-ID: <20210617095900.3uiiabjzeb24kvxc@sirius.home.kraxel.org>
References: <20210616141411.53892-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210616141411.53892-1-akihiko.odaki@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 16, 2021 at 11:14:11PM +0900, Akihiko Odaki wrote:
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> ---
>  audio/audio.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/audio/audio.c b/audio/audio.c
> index 534278edfed..6eba208cdba 100644
> --- a/audio/audio.c
> +++ b/audio/audio.c
> @@ -704,7 +704,7 @@ static size_t audio_pcm_sw_write(SWVoiceOut *sw, void *buf, size_t size)
>  
>      if (live == hwsamples) {
>  #ifdef DEBUG_OUT
> -        dolog ("%s is full %d\n", sw->name, live);
> +        dolog ("%s is full %zu\n", sw->name, live);
>  #endif
>          return 0;
>      }
> @@ -994,7 +994,7 @@ static size_t audio_get_avail (SWVoiceIn *sw)
>      }
>  
>      ldebug (
> -        "%s: get_avail live %d ret %" PRId64 "\n",
> +        "%s: get_avail live %zu ret %" PRId64 "\n",
>          SW_NAME (sw),
>          live, (((int64_t) live << 32) / sw->ratio) * sw->info.bytes_per_frame
>          );
> @@ -1021,7 +1021,7 @@ static size_t audio_get_free(SWVoiceOut *sw)
>      dead = sw->hw->mix_buf->size - live;
>  
>  #ifdef DEBUG_OUT
> -    dolog ("%s: get_free live %d dead %d ret %" PRId64 "\n",
> +    dolog ("%s: get_free live %zu dead %zu ret %" PRId64 "\n",
>             SW_NAME (sw),
>             live, dead, (((int64_t) dead << 32) / sw->ratio) *
>             sw->info.bytes_per_frame);

Added to audio queue.

thanks,
  Gerd


