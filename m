Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 037A3510C7D
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 01:16:03 +0200 (CEST)
Received: from localhost ([::1]:55312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njUPa-0007kb-3D
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 19:16:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.thibault@gnu.org>)
 id 1njULP-0002Uw-6j
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 19:11:43 -0400
Received: from fencepost.gnu.org ([2001:470:142:3::e]:42598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.thibault@gnu.org>)
 id 1njULO-0000lx-Q3; Tue, 26 Apr 2022 19:11:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=gnu.org;
 s=fencepost-gnu-org; h=In-Reply-To:MIME-Version:References:Subject:To:From:
 Date; bh=26ShJs1wPBdxAOZqofTrblUb3Qxjvi1fwzci4kOhgwk=; b=iVDMVwZUEz+8KwUG77+A
 0QOGmR7KySIl+9UIlcAy68Zpb2ZCBe+sq8vqLhn6UJ3ztZqeegHCd6Y/nBcpnAFEl70rO/LwnMPMt
 wLyq1nXAWBRnSBCTFgb40LElBvHpDUPq8CHfJZljIiBCT9lvfukE/29Xwgv2YDqeJKRvf+7n8RXyR
 I8zgkVNRPgf0WWbKLvY2MQvb4obiuTVRYnr7jTLqBKXdIiVDH2ypkRwPuhFLhuEloeeXSxaTRxQlT
 Q+L9dDgpHHh0NQkkOG2DpCMFkGPj4FxwqLPEXUpFRPaR0mYgud6OJRpVLSBjT09mZGO1z9hv3L5iy
 0+ykTqaaLcw7Zg==;
Received: from [2a01:cb19:956:1b00:de41:a9ff:fe47:ec49] (port=47976 helo=begin)
 by fencepost.gnu.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.thibault@gnu.org>)
 id 1njULO-0006nP-J9; Tue, 26 Apr 2022 19:11:42 -0400
Received: from samy by begin with local (Exim 4.95)
 (envelope-from <samuel.thibault@gnu.org>) id 1njULM-002And-4h;
 Wed, 27 Apr 2022 01:11:40 +0200
Date: Wed, 27 Apr 2022 01:11:40 +0200
From: Samuel Thibault <samuel.thibault@gnu.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC PATCH 1/4] net: slirp: introduce a wrapper struct for
 QemuTimer
Message-ID: <20220426231140.aq7r6myqvz5lyxsb@begin>
References: <20220412121337.207203-1-pbonzini@redhat.com>
 <20220412121337.207203-2-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220412121337.207203-2-pbonzini@redhat.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: thuth@redhat.com, qemu-devel@nongnu.org, dbuono@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini, le mar. 12 avril 2022 14:13:34 +0200, a ecrit:
> This struct will be extended in the next few patches to support the
> new slirp_handle_timer() call.  For that we need to store an additional
> "int" for each SLIRP timer, in addition to the cb_opaque.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  net/slirp.c | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)
> 
> diff --git a/net/slirp.c b/net/slirp.c
> index bc5e9e4f77..f1e25d741f 100644
> --- a/net/slirp.c
> +++ b/net/slirp.c
> @@ -184,23 +184,32 @@ static int64_t net_slirp_clock_get_ns(void *opaque)
>      return qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>  }
>  
> +struct SlirpTimer {
> +    QEMUTimer timer;
> +}
> +
>  static void *net_slirp_timer_new(SlirpTimerCb cb,
>                                   void *cb_opaque, void *opaque)
>  {
> -    return timer_new_full(NULL, QEMU_CLOCK_VIRTUAL,
> -                          SCALE_MS, QEMU_TIMER_ATTR_EXTERNAL,
> -                          cb, cb_opaque);
> +    SlirpTimer *t = g_new(SlirpTimer, 1);
> +    timer_init_full(&t->timer, NULL, QEMU_CLOCK_VIRTUAL,
> +                    SCALE_MS, QEMU_TIMER_ATTR_EXTERNAL,
> +                    cb, cb_opaque);
> +    return t;
>  }
>  
>  static void net_slirp_timer_free(void *timer, void *opaque)
>  {
> -    timer_free(timer);
> +    SlirpTimer *t = timer;
> +    timer_del(&t->timer);
> +    g_free(t);
>  }
>  
>  static void net_slirp_timer_mod(void *timer, int64_t expire_timer,
>                                  void *opaque)
>  {
> -    timer_mod(timer, expire_timer);
> +    SlirpTimer *t = timer;
> +    timer_mod(&t->timer, expire_timer);
>  }
>  
>  static void net_slirp_register_poll_fd(int fd, void *opaque)
> -- 
> 2.35.1
> 
> 

-- 
Samuel
---
Pour une évaluation indépendante, transparente et rigoureuse !
Je soutiens la Commission d'Évaluation de l'Inria.

