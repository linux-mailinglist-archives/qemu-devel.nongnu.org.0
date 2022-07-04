Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B1956567B
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 15:06:48 +0200 (CEST)
Received: from localhost ([::1]:40354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8Lmp-0001jH-3c
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 09:06:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8Ldd-0000ob-K7
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 08:57:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25236)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8Ldb-0007LM-ON
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 08:57:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656939435;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xHnxF0uPODvPNZ5lfZNsBg5VzEHo1Q30EbQ7rpAVcos=;
 b=GwmdbyzreGIVcMOkrG6+bRxrbXxK34N3chnHhOxKRsv4UCWjn35rHiY11VI9IrX9t5F7NM
 8v5vOJ0mP8pxcA/cs0cgR5n4WdEIPEDkT2E3gw75tW3nmt0kV5LUfL90sjAJsC33Mio8Oy
 y2AOAH2Xs6lVABlha529y8pcV8V3i8I=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-604-Vg81pFZaPy2NKSZEPVMB3A-1; Mon, 04 Jul 2022 08:57:14 -0400
X-MC-Unique: Vg81pFZaPy2NKSZEPVMB3A-1
Received: by mail-il1-f198.google.com with SMTP id
 h5-20020a056e021b8500b002d8f50441a2so4182853ili.13
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 05:57:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xHnxF0uPODvPNZ5lfZNsBg5VzEHo1Q30EbQ7rpAVcos=;
 b=nuYd1+DeSxrq6xR1GVIkdQykQv3nwveMfhiNTBkRymr+mUi5uRdXTuTiqI1EJ1JcKN
 Q/vJ/ZsVquLTCb+B1/nRTF+rl1y25HUIdglZ/Kz06z5jYQeE+t2SJC1IT09cQiWwFb4W
 B9Rs3MaUO8xpJ7OVhA5AXXCdw52HuIvm2+HHc/BUCmfspGWlmvCxWF1uEu6e513zuuWX
 pqrAXBAv5jzEu3A4HkZIvpM3fq9lMFYv/5tOF7fhyJGK6RPS0uLSoJWvZXNQ+4FVkgu3
 EAFPfjL9cta0qzY7u0CKVZ4sFSRP+pgoWf2e/WPqWKTAI472YB3jrHoZtwJ9eWlxRyDj
 xPfg==
X-Gm-Message-State: AJIora/NONSh8RDCtmmJlDw/1wYVs6Nv6r+zRN/7AUfxZaNWl14kIDbl
 px6kOSKpfIGajuqlctx7uoiYSCBWEnleXU32FD5Wgd2pu8rCtBJrODRTwKh8OZXkCeBug1CaLiy
 jV9NwklHSJzxzNQuZ8MDGHMq9sXp685c=
X-Received: by 2002:a05:6638:339c:b0:33e:b766:1bf1 with SMTP id
 h28-20020a056638339c00b0033eb7661bf1mr7544604jav.93.1656939433318; 
 Mon, 04 Jul 2022 05:57:13 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u+5L5usLU/vUJ/00gBAW32eSrZg4e1bMJ3FBNCcxPi1Er/7nbg3z9EDFZqpEFW6Lozebx2Nwzz32CXDvK6COU=
X-Received: by 2002:a05:6638:339c:b0:33e:b766:1bf1 with SMTP id
 h28-20020a056638339c00b0033eb7661bf1mr7544595jav.93.1656939433110; Mon, 04
 Jul 2022 05:57:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220509103019.215041-1-pbonzini@redhat.com>
 <20220509103019.215041-4-pbonzini@redhat.com>
In-Reply-To: <20220509103019.215041-4-pbonzini@redhat.com>
From: Alberto Faria <afaria@redhat.com>
Date: Mon, 4 Jul 2022 13:56:37 +0100
Message-ID: <CAELaAXw6XYAjV4ys6O9hW_uHXTRgxznT5nJrHWiNB5uGMyd09w@mail.gmail.com>
Subject: Re: [PATCH v2 03/26] nbd: remove incorrect coroutine_fn annotations
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Mon, May 9, 2022 at 11:39 AM Paolo Bonzini <pbonzini@redhat.com> wrote:
> nbd_co_establish_connection_cancel() cancels a coroutine but is not called
> from coroutine context itself, for example in nbd_cancel_in_flight()
> and in timer callbacks reconnect_delay_timer_cb() and open_timer_cb().
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  include/block/nbd.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Alberto Faria <afaria@redhat.com>


