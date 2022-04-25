Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A508C50E149
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 15:13:21 +0200 (CEST)
Received: from localhost ([::1]:44162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niyWm-0003q4-Q5
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 09:13:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1niyS2-0008Ra-5T
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 09:08:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1niyRw-0007xt-Eq
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 09:08:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650892099;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=A1DW029SDw1sLQkzl7nCIfsNu34v/ERFCq8qQRD4wno=;
 b=UN6BB/H5vEFLkB52ruGmAJ1oTwQtLKH5Vb7DxEJCl+TRXr8BUQY3Wm0EUeg31mcjLeDNbA
 Dii6vdiFk3rN0URQ3fbIXes1DK3ZE6DlpDDbwgM75cKiEmL3O/xqCFXcK7RS/5VD1adCM2
 KfyY+rWGAqz/xc6cKJXkQ0xM5EPexeo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-378-zueK9MNOPgepF1xxCdoEoA-1; Mon, 25 Apr 2022 09:08:17 -0400
X-MC-Unique: zueK9MNOPgepF1xxCdoEoA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0688C3C02B84;
 Mon, 25 Apr 2022 13:08:17 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.152])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 29CBE401E97;
 Mon, 25 Apr 2022 13:08:11 +0000 (UTC)
Date: Mon, 25 Apr 2022 14:08:08 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Martin Kletzander <mkletzan@redhat.com>
Subject: Re: [PATCH 18/18] audio/spiceaudio: Fail initialisation when not
 using spice
Message-ID: <YmadOLrKgNvyHCLX@redhat.com>
References: <cover.1650874791.git.mkletzan@redhat.com>
 <5db1fdef0330f20ed6ae306b5a71dad1b5e9b44c.1650874791.git.mkletzan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5db1fdef0330f20ed6ae306b5a71dad1b5e9b44c.1650874791.git.mkletzan@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
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

On Mon, Apr 25, 2022 at 10:22:01AM +0200, Martin Kletzander wrote:
> The caller would already fail, but this way the message can better
> express the reason for the failure.
> 
> Resolves: https://bugzilla.redhat.com/show_bug.cgi?id=2043498
> 
> Signed-off-by: Martin Kletzander <mkletzan@redhat.com>
> ---
>  audio/spiceaudio.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/audio/spiceaudio.c b/audio/spiceaudio.c
> index a8d370fe6f31..fdbd7dc285ad 100644
> --- a/audio/spiceaudio.c
> +++ b/audio/spiceaudio.c
> @@ -74,8 +74,9 @@ static const SpiceRecordInterface record_sif = {
>  static void *spice_audio_init(Audiodev *dev)
>  {
>      if (!using_spice) {
> -        return NULL;
> +        error_setg(&error_fatal, "Cannot use spice audio without -spice");

Typically one would not use error_fatal directly with a call
to error_setg(). The usual pattern would be for the method
calling error_setg() to have an 'Error **errp' parameter.
The caller would then pass in &error_fatal when calling the
method, or pass in a real error object if wishing to receive
the error.

If you don't want to plumb in an 'Error **errp' to the
spice_audio_init() method, then it would be sufficient to
instead just do

   error_report("Cannot use spice....")

Using 'Error **errp' is best practice in new code, but no one
will blame you for not refactoring existing code to support
this if looks like too much work.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


