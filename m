Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A231E50E36F
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 16:38:44 +0200 (CEST)
Received: from localhost ([::1]:35592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nizrP-0000dK-LC
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 10:38:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nizRy-0004Vv-HD
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 10:12:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nizRv-0002e3-4H
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 10:12:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650895940;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Ru2I3/P1gvBJV04NM5tGtTOmd4SFv46f3qyNEWE3AaY=;
 b=S9ATNetsYMacL2y2OVAk/zr7VHXju1BF5G2XKo8xrkS8wNviHMBOGEOhxeLZSAo+mN703B
 SQ9nUSItI/z95As6q7mKgV8b/z14jAVFGVi/4Z6tBSK1v8EYpDK9XD6pM5DdFH6mrbT8Eh
 zclz8HwxtdDHKoVTdC1aAFE6GG8qZ5g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-453-YCANpG3gNjuVbqzhOX-gAw-1; Mon, 25 Apr 2022 10:12:16 -0400
X-MC-Unique: YCANpG3gNjuVbqzhOX-gAw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EA7768117B0;
 Mon, 25 Apr 2022 14:12:14 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.152])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E443D40C1241;
 Mon, 25 Apr 2022 14:12:07 +0000 (UTC)
Date: Mon, 25 Apr 2022 15:11:53 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Martin Kletzander <mkletzan@redhat.com>
Subject: Re: [PATCH 14/18] audio: Require AudioState in AUD_add_capture
Message-ID: <YmasKSIzQl2HsjOc@redhat.com>
References: <cover.1650874791.git.mkletzan@redhat.com>
 <c6e87e678e914df0f59da2145c2753cdb4a16f63.1650874791.git.mkletzan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c6e87e678e914df0f59da2145c2753cdb4a16f63.1650874791.git.mkletzan@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, libvir-list@redhat.com,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, qemu-arm@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Darren Kenny <darren.kenny@oracle.com>,
 Thomas Huth <huth@tuxfamily.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Apr 25, 2022 at 10:21:57AM +0200, Martin Kletzander wrote:
> Since all callers require a valid audiodev this function can now safely
> abort in case of missing AudioState.
> 
> Signed-off-by: Martin Kletzander <mkletzan@redhat.com>
> ---
>  audio/audio.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/audio/audio.c b/audio/audio.c
> index b95aca444382..97eb645764c1 100644
> --- a/audio/audio.c
> +++ b/audio/audio.c
> @@ -1855,10 +1855,8 @@ CaptureVoiceOut *AUD_add_capture(
>      struct capture_callback *cb;
>  
>      if (!s) {
> -        if (!legacy_config) {
> -            dolog("Capturing without setting an audiodev is deprecated\n");
> -        }
> -        s = audio_init(NULL, NULL);
> +        error_setg(&error_abort,
> +                   "Capturing without setting an audiodev is not supported");

Preferrable to do:

  error_report("Capturing ...");
  abort();

Or pass in an 'Error **errp' parameter and let the caller decide
what todo

>      }
>  
>      if (!audio_get_pdo_out(s->dev)->mixing_engine) {
> -- 
> 2.35.1
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


