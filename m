Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D57A950E2AD
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 16:08:32 +0200 (CEST)
Received: from localhost ([::1]:39018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nizOB-0003AP-Bb
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 10:08:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nizMi-0001M3-R5
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 10:07:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nizMf-0001pS-K4
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 10:06:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650895616;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=E3C+gBI48WxGj/Jukij1rbwm/6JHlrW0+q9QbsHmsTU=;
 b=camVd8UjJllq3af5eVRsr8A0xFgg/zKqfCOQP7QnzN2gQjvVPihmqhAALSsSkBZ3ESwBta
 /brK4K31dGY126TruhVDMZyMcAdBJ3ORyerhnrOCAZ0u83x5MrG65ZQfgTjhqKjGcoLICy
 ogpGs7ek6IiZwJLWHEsukWHUJWlIuQY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-373-YSorlpmcNO6CvzE2XpULJg-1; Mon, 25 Apr 2022 10:06:53 -0400
X-MC-Unique: YSorlpmcNO6CvzE2XpULJg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3D96A805904;
 Mon, 25 Apr 2022 14:06:23 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.152])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CF43D40D1B9B;
 Mon, 25 Apr 2022 14:06:17 +0000 (UTC)
Date: Mon, 25 Apr 2022 15:06:14 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Martin Kletzander <mkletzan@redhat.com>
Subject: Re: [PATCH 07/18] Introduce machine's default-audiodev property
Message-ID: <Ymaq1ouZVKD5kZfV@redhat.com>
References: <cover.1650874791.git.mkletzan@redhat.com>
 <49192ccd62fc98c474bb0b627a22cc28a634e8b8.1650874791.git.mkletzan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <49192ccd62fc98c474bb0b627a22cc28a634e8b8.1650874791.git.mkletzan@redhat.com>
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

On Mon, Apr 25, 2022 at 10:21:50AM +0200, Martin Kletzander wrote:
> Many machine types have default audio devices with no way to set the underlying
> audiodev.  Instead of adding an option for each and every one of them this new
> property can be used as a default during machine initialisation when creating
> such devices.
> 
> Signed-off-by: Martin Kletzander <mkletzan@redhat.com>
> ---
>  hw/core/machine.c   | 23 +++++++++++++++++++++++
>  include/hw/boards.h |  1 +
>  2 files changed, 24 insertions(+)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index cb9bbc844d24..d055a126d398 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -596,6 +596,22 @@ static void machine_set_memdev(Object *obj, const char *value, Error **errp)
>      ms->ram_memdev_id = g_strdup(value);
>  }
>  
> +static char *machine_get_default_audiodev(Object *obj, Error **errp)
> +{
> +    MachineState *ms = MACHINE(obj);
> +
> +    return g_strdup(ms->default_audiodev);
> +}
> +
> +static void machine_set_default_audiodev(Object *obj, const char *value,
> +                                         Error **errp)
> +{
> +    MachineState *ms = MACHINE(obj);
> +
> +    g_free(ms->default_audiodev);
> +    ms->default_audiodev = g_strdup(value);
> +}
> +
>  HotpluggableCPUList *machine_query_hotpluggable_cpus(MachineState *machine)
>  {
>      int i;
> @@ -867,6 +883,12 @@ static void machine_class_init(ObjectClass *oc, void *data)
>      object_class_property_set_description(oc, "confidential-guest-support",
>                                            "Set confidential guest scheme to support");
>  
> +    object_class_property_add_str(oc, "default-audiodev",
> +                                  machine_get_default_audiodev,
> +                                  machine_set_default_audiodev);
> +    object_class_property_set_description(oc, "default-audiodev",
> +                                          "Audiodev to use for default machine devices");
> +

Hmm, if we add this, people might reasonably question why this default
audiodev can't be used for everything, instead of making other 'audiodev'
parameter mandatory.

For the x86 machines we have a property tied specifically to the PC
speaker.

  -machine ...,pcspk-audiodev=<name>


If we assume that's the desired pattern, then every machine which has
a built-in audio device should gain some  "{$device}-audiodev" proprerty
where '$device' is some reasonable name for the built-in audio device
of the machine.  This would work better if a machine ended up with
two built-in audio devices and needed separate audiodevs for them.


>      /* For compatibility */
>      object_class_property_add_str(oc, "memory-encryption",
>          machine_get_memory_encryption, machine_set_memory_encryption);
> @@ -961,6 +983,7 @@ static void machine_finalize(Object *obj)
>      g_free(ms->device_memory);
>      g_free(ms->nvdimms_state);
>      g_free(ms->numa_state);
> +    g_free(ms->default_audiodev);
>  }
>  
>  bool machine_usb(MachineState *machine)
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index d64b5481e834..5be1de50af03 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -346,6 +346,7 @@ struct MachineState {
>       */
>      MemoryRegion *ram;
>      DeviceMemoryState *device_memory;
> +    char *default_audiodev;
>  
>      ram_addr_t ram_size;
>      ram_addr_t maxram_size;
> -- 
> 2.35.1
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


