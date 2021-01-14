Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83AD72F64AD
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 16:33:38 +0100 (CET)
Received: from localhost ([::1]:36358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l04cz-0002ga-Kb
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 10:33:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l04Xm-0008Pj-Gy
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 10:28:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44217)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l04Xk-0003yU-As
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 10:28:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610638091;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z+lZOe8ujto2aOkYnmb8DsQboBoqOUHQKD+pqQGZ7KI=;
 b=HSEgYHwBryv/Pr57d9Din8BPXkUuvhkWLg9ZRC6HFEX4DnS5PGojfC0Lp+k/zaDf4LxL7a
 ugT6WyW174m/Yr4liOitGzkng8eODfP1rZFlW3ulOhuYuCU4XoCtz4ht6tw0oEfNHhrgoA
 DtQwbkGnV+c/YHL4xKBYkY0kP9ZrxNs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-2GbwogLXN-WqEyJtmS-GWQ-1; Thu, 14 Jan 2021 10:28:09 -0500
X-MC-Unique: 2GbwogLXN-WqEyJtmS-GWQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE060806661;
 Thu, 14 Jan 2021 15:28:07 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-108.ams2.redhat.com [10.36.112.108])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5AA186F99F;
 Thu, 14 Jan 2021 15:28:01 +0000 (UTC)
Subject: Re: [PATCH 01/23] sdlaudio: remove leftover SDL1.2 code
To: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <9315afe5-5958-c0b4-ea1e-14769511a9d5@t-online.de>
 <20210110100239.27588-1-vr_qemu@t-online.de>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <3fc235df-266b-c880-1980-5c39bf427793@redhat.com>
Date: Thu, 14 Jan 2021 16:28:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <20210110100239.27588-1-vr_qemu@t-online.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.237, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: QEMU <qemu-devel@nongnu.org>,
 =?UTF-8?B?Wm9sdMOhbiBLxZF2w6Fnw7M=?= <dirty.ice.hu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/01/2021 11.02, Volker Rümelin wrote:
> Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
> ---
>   audio/sdlaudio.c | 30 +++++++++++++-----------------
>   1 file changed, 13 insertions(+), 17 deletions(-)
> 
> diff --git a/audio/sdlaudio.c b/audio/sdlaudio.c
> index 21b7a0484b..bf3cfb8456 100644
> --- a/audio/sdlaudio.c
> +++ b/audio/sdlaudio.c
> @@ -240,28 +240,24 @@ static void sdl_callback (void *opaque, Uint8 *buf, int len)
>       }
>   }
>   
> -#define SDL_WRAPPER_FUNC(name, ret_type, args_decl, args, fail, unlock) \
> -    static ret_type glue(sdl_, name)args_decl                           \
> -    {                                                                   \
> -        ret_type ret;                                                   \
> -                                                                        \
> -        SDL_LockAudio();                                                \
> -                                                                        \
> -        ret = glue(audio_generic_, name)args;                           \
> -                                                                        \
> -        SDL_UnlockAudio();                                              \
> -        return ret;                                                     \
> +#define SDL_WRAPPER_FUNC(name, ret_type, args_decl, args)      \
> +    static ret_type glue(sdl_, name)args_decl                  \
> +    {                                                          \
> +        ret_type ret;                                          \
> +                                                               \
> +        SDL_LockAudio();                                       \
> +        ret = glue(audio_generic_, name)args;                  \
> +        SDL_UnlockAudio();                                     \
> +                                                               \
> +        return ret;                                            \
>       }
>   
>   SDL_WRAPPER_FUNC(get_buffer_out, void *, (HWVoiceOut *hw, size_t *size),
> -                 (hw, size), *size = 0, sdl_unlock)
> +                 (hw, size))
>   SDL_WRAPPER_FUNC(put_buffer_out, size_t,
> -                 (HWVoiceOut *hw, void *buf, size_t size), (hw, buf, size),
> -                 /*nothing*/, sdl_unlock_and_post)
> +                 (HWVoiceOut *hw, void *buf, size_t size), (hw, buf, size))
>   SDL_WRAPPER_FUNC(write, size_t,
> -                 (HWVoiceOut *hw, void *buf, size_t size), (hw, buf, size),
> -                 /*nothing*/, sdl_unlock_and_post)
> -
> +                 (HWVoiceOut *hw, void *buf, size_t size), (hw, buf, size))
>   #undef SDL_WRAPPER_FUNC
>   
>   static void sdl_fini_out (HWVoiceOut *hw)
> 

Right, sdl_unlock and sdl_unlock_and_post have been removed in commit 
8a7816c4ac13e6ba61de2 already.

Reviewed-by: Thomas Huth <thuth@redhat.com>


