Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB327511467
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 11:46:20 +0200 (CEST)
Received: from localhost ([::1]:33740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njeFX-0007M6-Mm
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 05:46:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1njeAp-0005Ci-Lb
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 05:41:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1njeAn-0000GD-S3
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 05:41:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651052484;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=5SExEP4D8iTrXZnX8LcXuTGfNS/3VoSpWcpS2/Yvv9M=;
 b=WWmsQiOx5d8ymAo9p5HkCHOQnZ80xC2cP/xPAR7MlypyHF5arym57vAHUzgrHqcudyqJos
 KtzN5EoFWP4EpHsUPzX6U/6lYs+8QDHZb41jjlEeSF15xVb7m1UOC0fFha5CLxGie/86RF
 cxc4Br0Ulhfum453BggSP2K6vG29E6g=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-610-gldTfSpuNCa3nY8FXxwMNQ-1; Wed, 27 Apr 2022 05:41:23 -0400
X-MC-Unique: gldTfSpuNCa3nY8FXxwMNQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 98C42299E776;
 Wed, 27 Apr 2022 09:41:22 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.193])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 13F9E40EC002;
 Wed, 27 Apr 2022 09:41:17 +0000 (UTC)
Date: Wed, 27 Apr 2022 10:41:15 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 06/18] ui/vnc: Require audiodev=
Message-ID: <YmkPu9rphlQZq9TP@redhat.com>
References: <cover.1650874791.git.mkletzan@redhat.com>
 <a07513f1bf6123fef52ff5e7943f5704746b376b.1650874791.git.mkletzan@redhat.com>
 <bacf5dd3-4cc1-7f80-8337-945d9b3f7dcc@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <bacf5dd3-4cc1-7f80-8337-945d9b3f7dcc@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, libvir-list@redhat.com,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
 Martin Kletzander <mkletzan@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Darren Kenny <darren.kenny@oracle.com>, Bandan Das <bsd@redhat.com>,
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Eduardo Habkost <eduardo@habkost.net>, Alexander Bulekov <alxndr@bu.edu>,
 Thomas Huth <huth@tuxfamily.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 27, 2022 at 11:32:41AM +0200, Paolo Bonzini wrote:
> On 4/25/22 10:21, Martin Kletzander wrote:
> > @@ -4188,12 +4188,15 @@ void vnc_display_open(const char *id, Error **errp)
> >       vd->ledstate = 0;
> >       audiodev = qemu_opt_get(opts, "audiodev");
> > -    if (audiodev) {
> > -        vd->audio_state = audio_state_by_name(audiodev);
> > -        if (!vd->audio_state) {
> > -            error_setg(errp, "Audiodev '%s' not found", audiodev);
> > -            goto fail;
> > -        }
> > +    if (!audiodev) {
> > +        error_setg(errp, "Audiodev parameter for vnc required");
> > +        goto fail;
> > +    }
> > +
> 
> Wouldn't this break "-vnc :0"?  You can just ignore the audio commands if
> vd->audio_state is NULL.

Yep, that's wha I suggested with skipping advertizing VNC_ENCODING_AUDIO
when audiodev is NULL

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


