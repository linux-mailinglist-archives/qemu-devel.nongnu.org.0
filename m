Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5894D2038D6
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Jun 2020 16:11:26 +0200 (CEST)
Received: from localhost ([::1]:47142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnNAT-0007p6-91
	for lists+qemu-devel@lfdr.de; Mon, 22 Jun 2020 10:11:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jnN7n-00059t-T7
 for qemu-devel@nongnu.org; Mon, 22 Jun 2020 10:08:39 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:28866
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jnN7l-0001Zx-R2
 for qemu-devel@nongnu.org; Mon, 22 Jun 2020 10:08:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592834917;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ziMa7Evr9YzbGBPs7fpJYrt8/CdgEp11GNeVLcr7h7Y=;
 b=AZ9DPD+LSo+sYffLjGv/cZoeimWGnYkE62LP5pc6RWs+BQJwuzsCYGVvPX8RkIeWYvzSww
 U6khx1WVWr1m3CbJIpvkMuMJ6L6RoGP1bbtpeAQxQ0JCyp/FsLx9gXzqowEUksP9wdMM23
 c83MBTlDICAjsgpMFuez0M5pszdaOYc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-57-MQKTZgRuOtqGU71CswvfXg-1; Mon, 22 Jun 2020 10:08:25 -0400
X-MC-Unique: MQKTZgRuOtqGU71CswvfXg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3CB1F107ACF3
 for <qemu-devel@nongnu.org>; Mon, 22 Jun 2020 14:08:24 +0000 (UTC)
Received: from redhat.com (unknown [10.36.110.63])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E0F371671;
 Mon, 22 Jun 2020 14:08:17 +0000 (UTC)
Date: Mon, 22 Jun 2020 15:08:14 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v9 1/5] hw/nvram/fw_cfg: Add the FW_CFG_DATA_GENERATOR
 interface
Message-ID: <20200622140814.GI736373@redhat.com>
References: <20200615103457.25282-1-philmd@redhat.com>
 <20200615103457.25282-2-philmd@redhat.com>
 <20200616153122.GN550360@redhat.com>
 <f7c32845-3125-d7c4-0cb8-90ec45f6c135@redhat.com>
MIME-Version: 1.0
In-Reply-To: <f7c32845-3125-d7c4-0cb8-90ec45f6c135@redhat.com>
User-Agent: Mutt/1.14.0 (2020-05-02)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=berrange@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/22 02:57:26
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 22, 2020 at 03:54:58PM +0200, Philippe Mathieu-Daudé wrote:
> On 6/16/20 5:31 PM, Daniel P. Berrangé wrote:
> > On Mon, Jun 15, 2020 at 12:34:53PM +0200, Philippe Mathieu-Daudé wrote:
> >> The FW_CFG_DATA_GENERATOR allows any object to produce
> >> blob of data consumable by the fw_cfg device.
> >>
> >> Reviewed-by: Laszlo Ersek <lersek@redhat.com>
> >> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> >> ---
> >>  docs/specs/fw_cfg.txt     |  9 ++++++-
> >>  include/hw/nvram/fw_cfg.h | 52 +++++++++++++++++++++++++++++++++++++++
> >>  hw/nvram/fw_cfg.c         | 36 +++++++++++++++++++++++++++
> >>  3 files changed, 96 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/docs/specs/fw_cfg.txt b/docs/specs/fw_cfg.txt
> >> index 8f1ebc66fa..bc16daa38a 100644
> >> --- a/docs/specs/fw_cfg.txt
> >> +++ b/docs/specs/fw_cfg.txt
> >> @@ -219,7 +219,7 @@ To check the result, read the "control" field:
> >>  
> >>  = Externally Provided Items =
> >>  
> >> -As of v2.4, "file" fw_cfg items (i.e., items with selector keys above
> >> +Since v2.4, "file" fw_cfg items (i.e., items with selector keys above
> >>  FW_CFG_FILE_FIRST, and with a corresponding entry in the fw_cfg file
> >>  directory structure) may be inserted via the QEMU command line, using
> >>  the following syntax:
> >> @@ -230,6 +230,13 @@ Or
> >>  
> >>      -fw_cfg [name=]<item_name>,string=<string>
> >>  
> >> +Since v5.1, QEMU allows some objects to generate fw_cfg-specific content,
> >> +the content is then associated with a "file" item using the 'gen_id' option
> >> +in the command line, using the following syntax:
> >> +
> >> +    -object <generator-type>,id=<generated_id>,[generator-specific-options] \
> >> +    -fw_cfg [name=]<item_name>,gen_id=<generated_id>
> >> +
> >>  See QEMU man page for more documentation.
> >>  
> >>  Using item_name with plain ASCII characters only is recommended.
> >> diff --git a/include/hw/nvram/fw_cfg.h b/include/hw/nvram/fw_cfg.h
> >> index 25d9307018..ca69666847 100644
> >> --- a/include/hw/nvram/fw_cfg.h
> >> +++ b/include/hw/nvram/fw_cfg.h
> >> @@ -9,11 +9,43 @@
> >>  #define TYPE_FW_CFG     "fw_cfg"
> >>  #define TYPE_FW_CFG_IO  "fw_cfg_io"
> >>  #define TYPE_FW_CFG_MEM "fw_cfg_mem"
> >> +#define TYPE_FW_CFG_DATA_GENERATOR_INTERFACE "fw_cfg-data-generator"
> >>  
> >>  #define FW_CFG(obj)     OBJECT_CHECK(FWCfgState,    (obj), TYPE_FW_CFG)
> >>  #define FW_CFG_IO(obj)  OBJECT_CHECK(FWCfgIoState,  (obj), TYPE_FW_CFG_IO)
> >>  #define FW_CFG_MEM(obj) OBJECT_CHECK(FWCfgMemState, (obj), TYPE_FW_CFG_MEM)
> >>  
> >> +#define FW_CFG_DATA_GENERATOR_CLASS(class) \
> >> +    OBJECT_CLASS_CHECK(FWCfgDataGeneratorClass, (class), \
> >> +                       TYPE_FW_CFG_DATA_GENERATOR_INTERFACE)
> >> +#define FW_CFG_DATA_GENERATOR_GET_CLASS(obj) \
> >> +    OBJECT_GET_CLASS(FWCfgDataGeneratorClass, (obj), \
> >> +                     TYPE_FW_CFG_DATA_GENERATOR_INTERFACE)
> >> +
> >> +typedef struct FWCfgDataGeneratorClass {
> >> +    /*< private >*/
> >> +    InterfaceClass parent_class;
> >> +    /*< public >*/
> >> +
> >> +    /**
> >> +     * get_data:
> >> +     * @obj: the object implementing this interface
> >> +     *
> >> +     * Returns: pointer to start of the generated item data
> >> +     *
> >> +     * The returned pointer is a QObject weak reference, @obj owns
> >> +     * the reference and may free it at any time in the future.
> > 
> > This description is a bit odd. We're just returning a plain byte
> > array pointer, not a QObject, nor a reference, not will it be
> > free'd at any time.
> > 
> >> +     */
> >> +    const void *(*get_data)(Object *obj);
> >> +    /**
> >> +     * get_length:
> >> +     * @obj: the object implementing this interface
> >> +     *
> >> +     * Returns: the size of the generated item data in bytes
> >> +     */
> >> +    size_t (*get_length)(Object *obj);
> > 
> > I'd be inclined to have a single method that returns a GByteArray,
> > instead of separate methods for data & length.
> > 
> > That gives you a sized byte array, with a well define lifetime,
> > which is what the caller really wants here. ie
> > 
> >     /**
> >       * get_data:
> >       * @obj: the object implementing this interface
> >       *
> >       * Returns: reference to a byte array containing the data.
> >       * The caller should release the reference when no longer
> >       * required.
> >       */
> >      GByteArray *(*get_data)(Object *obj);
> > 
> >> +} FWCfgDataGeneratorClass;
> >> +
> > 
> > ....
> > 
> > 
> >> +size_t fw_cfg_add_from_generator(FWCfgState *s, const char *filename,
> >> +                                 const char *gen_id, Error **errp)
> >> +{
> >> +    FWCfgDataGeneratorClass *klass;
> >> +    Object *obj;
> >> +    size_t size;
> >> +
> >> +    obj = object_resolve_path_component(object_get_objects_root(), gen_id);
> >> +    if (!obj) {
> >> +        error_setg(errp, "Cannot find object ID '%s'", gen_id);
> >> +        return 0;
> >> +    }
> >> +    if (!object_dynamic_cast(obj, TYPE_FW_CFG_DATA_GENERATOR_INTERFACE)) {
> >> +        error_setg(errp, "Object ID '%s' is not a '%s' subclass",
> >> +                   gen_id, TYPE_FW_CFG_DATA_GENERATOR_INTERFACE);
> >> +        return 0;
> >> +    }
> >> +    klass = FW_CFG_DATA_GENERATOR_GET_CLASS(obj);
> > 
> > ...then the following:
> > 
> >> +    size = klass->get_length(obj);
> >> +    if (size == 0) {
> >> +        error_setg(errp, "Object ID '%s' failed to generate fw_cfg data",
> >> +                   gen_id);
> >> +        return 0;
> >> +    }
> >> +    fw_cfg_add_file(s, filename, g_memdup(klass->get_data(obj), (guint)size),
> >> +                    size);
> > 
> > Can be replaced with:
> > 
> >    g_autoptr(GByteArray) data = klass->get_data(obj);
> > 
> >    fw_cfg_add_file(s, filename, g_byte_array_steal(data, NULL),
> >                    (guint)g_byte_array_get_size(data));
> 
> g_byte_array_steal() has been added in GLib 2.64,
> QEMU supports up to 2.48.
> 
> I guess I have to use g_byte_array_free_to_bytes()
> and g_memdup(g_bytes_get_data()) to achieve something
> similar. I'll try.

Or can possibly use the simpler g_byte_array_free and avoid the g_autoptr


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


