Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F54850E258
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 15:51:00 +0200 (CEST)
Received: from localhost ([::1]:49712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niz7D-0006cl-EP
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 09:50:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1niz5q-0005A2-Li
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 09:49:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1niz5o-0007Kh-64
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 09:49:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650894571;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=JxsLrU53gu/61c89cPbny24e2mrEdhXEG7sT5yvb81c=;
 b=dtouFcUEdGt9kGU+fIHLrxw2TIFI0zFkC2Nzxl9posuM7haIrCafRqD2/wa33ntKlqq5Y3
 3gjutG9MstvAhTKhgpxNbUrKjJJJVmO7rKF+5kFpXlJxxtdoehaTbSj+r8kfwegPBILvJe
 pW6ACwgKE4t+Ess4kqKqkAgVCYEKJME=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-564-aKZLwcRbPUWkOdeeu4MpPg-1; Mon, 25 Apr 2022 09:49:27 -0400
X-MC-Unique: aKZLwcRbPUWkOdeeu4MpPg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9FF4C1C05129;
 Mon, 25 Apr 2022 13:49:26 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.152])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F5B01121320;
 Mon, 25 Apr 2022 13:48:53 +0000 (UTC)
Date: Mon, 25 Apr 2022 14:48:50 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Martin Kletzander <mkletzan@redhat.com>
Subject: Re: [PATCH 06/18] ui/vnc: Require audiodev=
Message-ID: <Ymamwva9SW5Hj34z@redhat.com>
References: <cover.1650874791.git.mkletzan@redhat.com>
 <a07513f1bf6123fef52ff5e7943f5704746b376b.1650874791.git.mkletzan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a07513f1bf6123fef52ff5e7943f5704746b376b.1650874791.git.mkletzan@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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

On Mon, Apr 25, 2022 at 10:21:49AM +0200, Martin Kletzander wrote:
> Signed-off-by: Martin Kletzander <mkletzan@redhat.com>
> ---
>  ui/vnc.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/ui/vnc.c b/ui/vnc.c
> index badf1d7664fe..2e7af139b030 100644
> --- a/ui/vnc.c
> +++ b/ui/vnc.c
> @@ -4188,12 +4188,15 @@ void vnc_display_open(const char *id, Error **errp)
>      vd->ledstate = 0;
>  
>      audiodev = qemu_opt_get(opts, "audiodev");
> -    if (audiodev) {
> -        vd->audio_state = audio_state_by_name(audiodev);
> -        if (!vd->audio_state) {
> -            error_setg(errp, "Audiodev '%s' not found", audiodev);
> -            goto fail;
> -        }
> +    if (!audiodev) {
> +        error_setg(errp, "Audiodev parameter for vnc required");
> +        goto fail;
> +    }

I know we deprecated not setting 'audiodev', but I'm not convinced
this is the right approach.

The VNC audio extension is a custom QEMU invention that few VNC
clients have implemented, and even when implemented few turn it
on as it is pretty awful stuttering.

IMHO a better approach could be to leave audiodev optional, but
stop advertizing VNC_ENCODING_AUDIO when it isn't set.

IOW, current situation

   -vnc :1       -> enables audio capture from default backend

This patch

   -vnc :1       -> error
   -vnc :1,audiodev=audio0 ->  enable audio capture from 'audio0'

Better:

   -vnc :1       -> stop advertizing VNC_ENCODING_AUDIO
   -vnc :1,audiodev=audio0 ->  enable audio capture from 'audio0'


> +
> +    vd->audio_state = audio_state_by_name(audiodev);
> +    if (!vd->audio_state) {
> +        error_setg(errp, "Audiodev '%s' not found", audiodev);
> +        goto fail;
>      }
>  
>      device_id = qemu_opt_get(opts, "display");
> -- 
> 2.35.1
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


