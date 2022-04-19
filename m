Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EEC250729D
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 18:06:59 +0200 (CEST)
Received: from localhost ([::1]:41012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngqNW-0004Hc-0j
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 12:06:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ngqK5-0003Xt-Kf
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 12:03:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ngqJz-0002aM-LB
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 12:03:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650384198;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=cz/HybSnJPGI+SpuPDHSzMp7gBORxoq1gXb1D/FPwDU=;
 b=aAaz/l8pBdpfhXMfD96t+14Sx8nHbNCjfd5xChfHB/rCOq1Mq4rgyQkZOy0tkVxwRZIpOO
 HQ8BIce5zpTLK3fsMHeZ14oOZS/AkCW9irOQNXt7d5i5bs5+pcZCl3tGlqGbhO7MEEAeg5
 R3Gok46pLFifMdSdXw1gc89eCpw8YnY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-118-lUYSxt_wNJWzfktNGTeKrQ-1; Tue, 19 Apr 2022 12:03:15 -0400
X-MC-Unique: lUYSxt_wNJWzfktNGTeKrQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B2CD4811E75;
 Tue, 19 Apr 2022 16:03:06 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.155])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D791F1415125;
 Tue, 19 Apr 2022 16:03:01 +0000 (UTC)
Date: Tue, 19 Apr 2022 17:02:59 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
Subject: Re: [PATCH v3] hw/misc: applesmc: use host osk as default on macs
Message-ID: <Yl7dM/xKG/zASa+D@redhat.com>
References: <20220405004621.94982-1-t0rr3sp3dr0@gmail.com>
 <20220417013608.22086-1-yaroshchuk2000@gmail.com>
 <CADO9X9SdWwKS49NAJDWULg_GxRSoNEhABWhWCBOkD_FwZGgkXw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADO9X9SdWwKS49NAJDWULg_GxRSoNEhABWhWCBOkD_FwZGgkXw@mail.gmail.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Pedro =?utf-8?Q?To=CC=82rres?= <t0rr3sp3dr0@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Jan Kiszka <jan.kiszka@siemens.com>,
 qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 agraf@suse.de, "Gabriel L. Somlo" <gsomlo@gmail.com>,
 marcandre.lureau@redhat.com, rene@exactcode.de,
 Eduardo Habkost <ehabkost@redhat.com>, Marcel Apfelbaum <marcel.a@redhat.com>,
 Alistair Francis <alistair.francis@xilinx.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Alexander Graf <agraf@csgraf.de>,
 suse@csgraf.de, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Chetan Pant <chetan4windows@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 afaerber@suse.de, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Apr 17, 2022 at 04:43:14PM +0300, Vladislav Yaroshchuk wrote:
> I've CCed all the people from previous threads.
> 
> 
> > [...]
> > +static bool applesmc_read_osk(uint8_t *osk)
> > +{
> > +#if defined(__APPLE__) && defined(__MACH__)
> > +    struct AppleSMCParams {
> > +        uint32_t key;
> > +        uint8_t __pad0[16];
> > +        uint8_t result;
> > +        uint8_t __pad1[7];
> > +        uint32_t size;
> > +        uint8_t __pad2[10];
> > +        uint8_t data8;
> > +        uint8_t __pad3[5];
> > +        uint8_t output[32];
> > +    };
> > +
> > +    io_service_t svc;
> > +    io_connect_t conn;
> > +    kern_return_t ret;
> > +    size_t size = sizeof(struct AppleSMCParams);
> > +    struct AppleSMCParams params_in = { .size = 32, .data8 = 5 };
> 
> Maybe it's better to name this magic number '5'
> 
> > +    struct AppleSMCParams params_out = {};
> > +
> 
> params_in and params_out can be the same variable, see
> https://patchew.org/QEMU/20211022161448.81579-1-yaroshchuk2000@gmail.com/
> 
> > +    svc = IOServiceGetMatchingService(0, IOServiceMatching("AppleSMC"));
> > +    if (svc == 0) {
> > +        return false;
> > +    }
> > +
> > +    ret = IOServiceOpen(svc, mach_task_self(), 0, &conn);
> > +    if (ret != 0) {
> > +        return false;
> > +    }
> > +
> > +    for (params_in.key = 'OSK0'; params_in.key <= 'OSK1';
> ++params_in.key) {
> > +        ret = IOConnectCallStructMethod(conn, 2, &params_in, size,
> &params_out, &size);
> 
> Same about this magic number '2'.
> 
> > +        if (ret != 0) {
> > +            return false;
> > +        }
> > +
> > +        if (params_out.result != 0) {
> > +            return false;
> > +        }
> > +        memcpy(osk, params_out.output, params_in.size);
> > +
> > +        osk += params_in.size;
> > +     }
> > +
> 
> Cleanup IOServiceClose and IOObjectReturn are not called at the
> end of the procedure.
> 
> This is also mentioned in Phil Dennis-Jordan's instruction you noted (stage
> 5):
> https://lists.nongnu.org/archive/html/qemu-devel/2021-10/msg02843.html
> 
> > +    return true;
> > +#else
> > +    return false;
> > +#endif
> > +}
> > +
> > [...]
> >
> > static void applesmc_isa_realize(DeviceState *dev, Error **errp)
> >  {
> >      AppleSMCState *s = APPLE_SMC(dev);
> > +    bool valid_osk = false;
> >
> >      memory_region_init_io(&s->io_data, OBJECT(s), &applesmc_data_io_ops,
> s,
> >                            "applesmc-data", 1);
> > @@ -331,8 +393,17 @@ static void applesmc_isa_realize(DeviceState *dev,
> Error **errp)
> >      isa_register_ioport(&s->parent_obj, &s->io_err,
> >                          s->iobase + APPLESMC_ERR_PORT);
> >
> > -    if (!s->osk || (strlen(s->osk) != 64)) {
> > -        warn_report("Using AppleSMC with invalid key");
> > +    if (s->osk) {
> > +        valid_osk = strlen(s->osk) == 64;
> > +    } else {
> > +        valid_osk = applesmc_read_osk((uint8_t *) default_osk);
> > +        if (valid_osk) {
> > +            warn_report("Using AppleSMC with host OSK");
> > +            s->osk = default_osk;
> > +        }
> > +    }
> > +    if (!valid_osk) {
> > +        warn_report("Using AppleSMC with invalid OSK");
> >          s->osk = default_osk;
> >      }
> > [...]
> 
> After the previous discussion we've decided (if i don't confuse anything)
> to have a way to enable/disable host OSK reading with new property:
> 1. properties osk=$key and hostosk=on cannot be used together (fail hard)
> 2. for QEMU machine > 7.0 - hostosk=on by default.
>     If unable to read - fail hard with error_setg.
> 3. for QEMU machine <= 7.0 - hostosk=off by default,
>    the dummy OSK is used (as previously).
> 
> BTW since my patches lost 7.0, I planned to wait until compat machines
> for 7.1 are added (after 7.0 release) and then rebase the patches,
> adding required changes into `hw/core/machine.c`
> 
> Now we have two versions of host OSK forwarding implementations,
> Pedro's (this one) and mine (
> https://patchew.org/QEMU/20220113152836.60398-1-yaroshchuk2000@gmail.com/#)
> 
> Do we still want to add this feature? If yes - whose version is preferred?
> (I'm still ready to work on this)

I prefer yours, since the feature is introspectable by mgmt apps,
given the existance of the 'hostosk' property

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


