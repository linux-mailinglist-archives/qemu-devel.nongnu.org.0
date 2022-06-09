Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B24FA54553D
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 22:01:45 +0200 (CEST)
Received: from localhost ([::1]:55220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzOLg-0004ZJ-AA
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 16:01:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1nzMFY-0007vA-UL
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 13:47:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1nzMFX-0007cG-IR
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 13:47:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654796833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0TcShtKseNfv4CjN3KzcuSxpvQwAFlYO/Mfg30O9w+k=;
 b=NGGRhYW9cQqDs752pY4VmB6ioDo4syyEQ8dUBSQFWtyoKCNbKOZgEz4d+m+Smrz5XBm0tk
 hgRzy+PJeQcWfgmybijWfnOplEl2/6+AWUdqZWhzBYcEx4Gq9HeuE4lHVr5n/NrX6SkyE0
 ChgJE1xMsbWxIvHdFuvb/Vxnoj96Ndo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-3-He4vit-9OBypKnkR2sCEmA-1; Thu, 09 Jun 2022 13:47:12 -0400
X-MC-Unique: He4vit-9OBypKnkR2sCEmA-1
Received: by mail-wm1-f71.google.com with SMTP id
 j31-20020a05600c1c1f00b0039c481c4664so4405794wms.7
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 10:47:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0TcShtKseNfv4CjN3KzcuSxpvQwAFlYO/Mfg30O9w+k=;
 b=0KPhDkMTZJW3GBM4ezHH31hdWwEZTuAXBiE1nue5LNPXTZZNljOB8nukiughHw7eLN
 8zxKjPzillo1/Y9DvdOp7SLCveJWWOXqN2iYCRu73+PIgZ//DHF8aT1qwaXQjSaCvbNF
 c3fwpab7+XWiTXE5Eg7QmBDcbbEGL4v3kaMe5vJb7YyifbCETEsiUzfalaR+pB1MsR0z
 0en865x6cIDBVZOB6cRARZTESx2PRhDn8xbwRf6WFmfRXfGRTvy6+7o5UYTYu3ZGMEsI
 AmLiIlaCm5sSHlTxle3bE8Z71VYaEEsB4xm4U/EsVi0X9h4fR6nPKpD+JY+UNScmqTOJ
 Cv5w==
X-Gm-Message-State: AOAM531r813X+JlLX7dKblYtpnDpTr58nSejRqhUKarYj0XiGGpyAilh
 23FMzuuk0dbeBP1J9JWwJqsmqQt217VbWtUp1GtoW2qbevIG0yNGFIhkXuOdz8ObGo6hvuCJQH7
 2MpRMJeScJb6Zeb4=
X-Received: by 2002:adf:ed01:0:b0:20c:c137:aaeb with SMTP id
 a1-20020adfed01000000b0020cc137aaebmr40540662wro.638.1654796831295; 
 Thu, 09 Jun 2022 10:47:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzsTElKm4lPMuSFA86dcl02ERf/IPBKLvzUQxkEIAoV+GHFEsCP4fWcQgqle49n6qAeXJzXMQ==
X-Received: by 2002:adf:ed01:0:b0:20c:c137:aaeb with SMTP id
 a1-20020adfed01000000b0020cc137aaebmr40540646wro.638.1654796831115; 
 Thu, 09 Jun 2022 10:47:11 -0700 (PDT)
Received: from sgarzare-redhat (host-79-46-200-40.retail.telecomitalia.it.
 [79.46.200.40]) by smtp.gmail.com with ESMTPSA id
 j37-20020a05600c1c2500b0039c235fb6a5sm29388941wms.8.2022.06.09.10.47.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 10:47:10 -0700 (PDT)
Date: Thu, 9 Jun 2022 19:47:07 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 qemu-stable@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org
Subject: Re: [PATCH 2/2] linux-aio: explain why max batch is checked in
 laio_io_unplug()
Message-ID: <20220609174707.xilti37x5xaevhwj@sgarzare-redhat>
References: <20220609164712.1539045-1-stefanha@redhat.com>
 <20220609164712.1539045-3-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20220609164712.1539045-3-stefanha@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 09, 2022 at 05:47:12PM +0100, Stefan Hajnoczi wrote:
>It may not be obvious why laio_io_unplug() checks max batch. I discussed
>this with Stefano and have added a comment summarizing the reason.
>
>Cc: Stefano Garzarella <sgarzare@redhat.com>
>Cc: Kevin Wolf <kwolf@redhat.com>
>Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>---
> block/linux-aio.c | 6 ++++++
> 1 file changed, 6 insertions(+)
>
>diff --git a/block/linux-aio.c b/block/linux-aio.c
>index 6078da7e42..9c2393a2f7 100644
>--- a/block/linux-aio.c
>+++ b/block/linux-aio.c
>@@ -365,6 +365,12 @@ void laio_io_unplug(BlockDriverState *bs, LinuxAioState *s,
>     assert(s->io_q.plugged);
>     s->io_q.plugged--;
>
>+    /*
>+     * Why max batch checking is performed here:
>+     * Another BDS may have queued requests with a higher dev_max_batch and
>+     * therefore in_queue could now exceed our dev_max_batch. Re-check the max
>+     * batch so we can honor our device's dev_max_batch.
>+     */
>     if (s->io_q.in_queue >= laio_max_batch(s, dev_max_batch) ||
>         (!s->io_q.plugged &&
>          !s->io_q.blocked && !QSIMPLEQ_EMPTY(&s->io_q.pending))) {
>-- 
>2.36.1
>

I should have added that...

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


