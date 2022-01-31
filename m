Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C17984A49A3
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 15:47:43 +0100 (CET)
Received: from localhost ([::1]:36040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEXy2-0006E4-Rf
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 09:47:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nEXnl-0005t7-3c
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 09:37:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nEXni-00053q-VG
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 09:37:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643639822;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SfUZbFsc4WuOzu6DOQ49CQTlGmkwAebZrueU69dCSKM=;
 b=DZFFe6+aj4FI7//CHxuY/0ZrI4L+eMX+q0MkKw3rkpxFdcCPtlkKlR0mXdWrAJe5xy+BDy
 ESVd7Y+05Hx3FN24iJu6Ch66nYUtPP65+OtQiq4ERULIqenxi5cW6ntcJ/NetN6GqbMaAl
 rYXKv50gwO2DAniQDkexeOn+/cSQs7E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-526-6H9hSZTbNDySHdqi_yGgpg-1; Mon, 31 Jan 2022 09:36:55 -0500
X-MC-Unique: 6H9hSZTbNDySHdqi_yGgpg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CDE481080865;
 Mon, 31 Jan 2022 14:36:54 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.62])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 23DCA72436;
 Mon, 31 Jan 2022 14:36:48 +0000 (UTC)
Date: Mon, 31 Jan 2022 14:36:46 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Kashyap Chamarthy <kchamart@redhat.com>
Subject: Re: [PATCH v2] docs: expand firmware descriptor to allow flash
 without NVRAM
Message-ID: <Yffz/v/7b6jJOBwi@redhat.com>
References: <20220131125509.170307-1-berrange@redhat.com>
 <YffrgRRVCEWVLS41@paraplu>
MIME-Version: 1.0
In-Reply-To: <YffrgRRVCEWVLS41@paraplu>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: libvir-list@redhat.com, qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 31, 2022 at 03:00:33PM +0100, Kashyap Chamarthy wrote:
> On Mon, Jan 31, 2022 at 12:55:09PM +0000, Daniel P. Berrangé wrote:
> > The current firmware descriptor schema for flash requires that both the
> > executable to NVRAM template paths be provided. This is fine for the
> > most common usage of EDK2 builds in virtualization where the separate
> > _CODE and _VARS files are provided.
> > 
> > With confidential computing technology like AMD SEV, persistent storage
> > of variables may be completely disabled because the firmware requires a
> > known clean state on every cold boot. There is no way to express this
> > in the firmware descriptor today.
> > 
> > Even with regular EDK2 builds it is possible to create a firmware that
> > has both executable code and variable persistence in a single file. This
> > hasn't been commonly used, since it would mean every guest bootup would
> > need to clone the full firmware file, leading to redundant duplicate
> > storage of the code portion. In some scenarios this may not matter and
> > might even be beneficial. For example if a public cloud allows users to
> > bring their own firmware, such that the user can pre-enroll their own
> > secure boot keys, you're going to have this copied on disk for each
> > tenant already. At this point the it can be simpler to just deal with
> > a single file rather than split builds. The firmware descriptor ought
> > to be able to express this combined firmware model too.
> 
> Cool, TIL that it's possible to include both the executable and the
> variables file into a single file.
> 
> I briefly wondered if in this "combined" mode whether the no. of
> duplicate copies can ever fill up the storage.  I doubt that, as the
> combined size of _VARS + _CODE is just about 2MB.  So it only starts
> mattering if you're running tens of thousands of guests.

When guest root / data disk sizes are measured in 100's of MB, or
GBs, I struggle to get worried about even a 16 MB OVMF  blob being
copied per guest.

The firmware can be provided in qcow2 format too, so if really
concerned, just create a qcow2 file with a backing store pointing
to the readonly master, so you're only paying the price of the
delta for any guest VARs writes. That's more efficient than what
we do today with copying the separate raw format VARS.fd file.

> > This all points towards expanding the schema for flash with a 'mode'
> > concept:
> > 
> >  - "split" - the current implicit behaviour with separate files
> >    for code and variables.
> > 
> >  - "combined" - the alternate behaviour where a single file contains
> >    both code and variables.
> > 
> >  - "stateless" - the confidential computing use case where storage
> >    of variables is completely disable, leaving only the code.
> >
> > Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> >  docs/interop/firmware.json | 54 ++++++++++++++++++++++++++++++++------
> >  1 file changed, 46 insertions(+), 8 deletions(-)
> > 
> > In v2:
> > 
> >  - Mark 'mode' as optional field
> >  - Misc typos in docs
> > 
> > diff --git a/docs/interop/firmware.json b/docs/interop/firmware.json
> > index 8d8b0be030..f5d1d0b6e7 100644
> > --- a/docs/interop/firmware.json
> > +++ b/docs/interop/firmware.json
> > @@ -210,24 +210,61 @@
> >    'data'   : { 'filename' : 'str',
> >                 'format'   : 'BlockdevDriver' } }
> >  
> > +
> > +##
> > +# @FirmwareFlashType:
> > +#
> > +# Describes how the firmware build handles code versus variable
> > +# persistence.
> > +#
> > +# @split: the executable file contains code while the NVRAM
> > +#         template provides variable storage. The executable
> > +#         must be configured read-only and can be shared between
> > +#         multiple guests. The NVRAM template must be cloned
> > +#         for each new guest and configured read-write.
> > +#
> > +# @combined: the executable file contains both code and
> > +#            variable storage. The executable must be cloned
> > +#            for each new guest and configured read-write.
> > +#            No NVRAM template will be specified.
> 
> Given my above wondering, is it worth adding a note here about storage
> considerations when running large number of guests in the "combined"
> mode?  If not, ignore my comment.

I don't think its worth worrying about.

> 
> > +# @stateless: the executable file contains code and variable
> > +#             storage is not persisted. The executed must
> 
> I guess you meant: s/executed/executable/

Opp yes.

> Whoever is applying the patch can touch it up.
> 
> > +#             be configured read-only and can be shared
> > +#             between multiple guests. No NVRAM template
> > +#             will be specified.
> > +#
> > +# Since: 7.0.0
> > +##
> > +{ 'enum': 'FirmwareFlashMode',
> > +  'data': [ 'split', 'combined', 'stateless' ] }
> > +
> >  ##
> >  # @FirmwareMappingFlash:
> >  #
> >  # Describes loading and mapping properties for the firmware executable
> >  # and its accompanying NVRAM file, when @FirmwareDevice is @flash.
> >  #
> > -# @executable: Identifies the firmware executable. The firmware
> > -#              executable may be shared by multiple virtual machine
> > -#              definitions. The preferred corresponding QEMU command
> > -#              line options are
> > +# @mode: describes how the firmware build handles code versus variable
> > +#        storage. If not present, it must be treated as if it was
> > +#        configured with value ``split``. Since: 7.0.0
> 
> For consistency, might want to capitalize the first word:
> s/describes/Describes/

Yep

> 
> (Here too, maintainer can touch it up.)
> 
> [...]
> 
> The concept looks very clear, and obviously useful.  FWIW:
> 
>     Reviewed-by: Kashyap Chamarthy <kchamart@redhat.com>    

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


