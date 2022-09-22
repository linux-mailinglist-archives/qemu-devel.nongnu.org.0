Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1EFC5E6909
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 19:02:05 +0200 (CEST)
Received: from localhost ([::1]:38122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obPaO-0004s7-HC
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 13:02:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1obNsN-0008Ud-3V
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 11:12:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40282)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1obNsL-0007bG-13
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 11:12:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663859546;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eZJlmhzpgBeUOEM9vdJKbW75DmcemhF66/Lii1oF1S8=;
 b=CV7bkuijV4ntxK/He1VKfIlrNqw+fIRSwPUBy8HzSalFk5xwNvwtRVVYTGaDoEgb/ny0lT
 eBmCU28f6X6p7jDjSp7QgXzVnBU3EaXOuV8Z/arQH0mJIc2ar2RP38ojaw3FZTLOYY419Z
 oiobooKk1U56EXLZdjyN53foPSy/00Y=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-554-aJMw_8gDM6iLHExcXQHV-g-1; Thu, 22 Sep 2022 11:12:24 -0400
X-MC-Unique: aJMw_8gDM6iLHExcXQHV-g-1
Received: by mail-io1-f69.google.com with SMTP id
 l84-20020a6b3e57000000b006a3fe90910cso846503ioa.16
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 08:12:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=eZJlmhzpgBeUOEM9vdJKbW75DmcemhF66/Lii1oF1S8=;
 b=cS7eEIGvDJSB9y94I96MRqkyo2aAz9ocTYevGl6p7lrWZdhpeCcxgyYhq20uScnV5g
 SbGv7bUWFzSH1zfl0PqX072qel0OiioAkl8bCthYASDOwU3EdjrFCeKUwlVNJLoLbpKN
 Vs2DThNjZgTbSEW8hJbfdKNsGL0I4Vbopn0GTxtOC0IVPYCQ0AlNPL2ejFJxZAdlkqM6
 hZa0AVjxtkg3gaZpkfGi9OS6zk0UY4QCHikyfbLMw836OPwuDEnks8Caby/OFyIT9SBX
 aGzIl+D19Kn4pzNBKYyJPWsVSgVp1lv8916W3ZeS672bjDLHtdfWF3wfqhgttcgXZhzO
 qSkQ==
X-Gm-Message-State: ACrzQf0BGck79Ubz0ntMRfYXRDAP6OJgO14MytB5udcbsLnxzI/Fw9OH
 FPYJVZ73NS8XRhVeSBcxDGMOyTJJM8KTCr9Yt6Ovp7X7wXOOtHnePgPna2hliUuaf/VroxqTBoJ
 crTP5Mz0CyHEn9hDDsqL/gtprPgOC7vc=
X-Received: by 2002:a05:6638:c48:b0:35a:3f5f:d382 with SMTP id
 g8-20020a0566380c4800b0035a3f5fd382mr2301929jal.6.1663859541574; 
 Thu, 22 Sep 2022 08:12:21 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4HnsI+eNMzqqth12QxyBHrRaU9ENLLbNb35D4+bbiWgUtBzxuK/QS1QlYWzOjQnyz9KqFdoLhhFekYANf0vps=
X-Received: by 2002:a05:6638:c48:b0:35a:3f5f:d382 with SMTP id
 g8-20020a0566380c4800b0035a3f5fd382mr2301919jal.6.1663859541417; Thu, 22 Sep
 2022 08:12:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220922084924.201610-1-pbonzini@redhat.com>
 <20220922084924.201610-3-pbonzini@redhat.com>
In-Reply-To: <20220922084924.201610-3-pbonzini@redhat.com>
From: Alberto Campinho Faria <afaria@redhat.com>
Date: Thu, 22 Sep 2022 16:11:45 +0100
Message-ID: <CAELaAXwqcWz4uh0OroLOm7F1Jx7Z9MvQCh_+QjxEgKPf11Xp7g@mail.gmail.com>
Subject: Re: [PATCH 02/26] block: add missing coroutine_fn annotations
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, Sep 22, 2022 at 9:49 AM Paolo Bonzini <pbonzini@redhat.com> wrote:
> Callers of coroutine_fn must be coroutine_fn themselves, or the call
> must be within "if (qemu_in_coroutine())".  Apply coroutine_fn to
> functions where this holds.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  block.c               |  6 +++---
>  block/block-backend.c | 10 +++++-----
>  block/io.c            | 22 +++++++++++-----------
>  3 files changed, 19 insertions(+), 19 deletions(-)
>
> diff --git a/block.c b/block.c
> index bc85f46eed..5c34ada53f 100644
> --- a/block.c
> +++ b/block.c
> @@ -631,9 +631,9 @@ static int64_t create_file_fallback_truncate(BlockBackend *blk,
>   * Helper function for bdrv_create_file_fallback(): Zero the first
>   * sector to remove any potentially pre-existing image header.
>   */
> -static int create_file_fallback_zero_first_sector(BlockBackend *blk,
> -                                                  int64_t current_size,
> -                                                  Error **errp)
> +static int coroutine_fn create_file_fallback_zero_first_sector(BlockBackend *blk,
> +                                                               int64_t current_size,
> +                                                               Error **errp)

Why mark this coroutine_fn? Maybe the intention was to also replace
the call to blk_pwrite_zeroes() with blk_co_pwrite_zeroes()?

Regardless:

Reviewed-by: Alberto Faria <afaria@redhat.com>


