Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C064A4991
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 15:44:09 +0100 (CET)
Received: from localhost ([::1]:33738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEXua-0004dJ-Nt
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 09:44:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1nEXF2-0008Oq-9m
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 09:01:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1nEXEW-0006m5-Sl
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 09:00:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643637639;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=smIWqOctOcfZWvLVXI35FN28MIyVwHN+51liQ9ypkG8=;
 b=Vw2TqQUIymkCd37RXjnejSb4zJydsvTS6IuGQWVV+VjSS0ygdwU+GilINHE9E4oLQDR5VC
 H6RPcfxU+177FlsV8l4AvJYs+O6jnZwOI1JOBdqPBWqQKlTgbPl2EykYZoiZEQKaEQ5Zki
 hOQORziMuBtwBnKvPZpRGXzuHWMHD0c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-172-EH3Yc5tJPoa_a4-4TSA_hA-1; Mon, 31 Jan 2022 09:00:38 -0500
X-MC-Unique: EH3Yc5tJPoa_a4-4TSA_hA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4215C46863;
 Mon, 31 Jan 2022 14:00:37 +0000 (UTC)
Received: from paraplu (unknown [10.39.195.135])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2666B7B022;
 Mon, 31 Jan 2022 14:00:36 +0000 (UTC)
Date: Mon, 31 Jan 2022 15:00:33 +0100
From: Kashyap Chamarthy <kchamart@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH v2] docs: expand firmware descriptor to allow flash
 without NVRAM
Message-ID: <YffrgRRVCEWVLS41@paraplu>
References: <20220131125509.170307-1-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220131125509.170307-1-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kchamart@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kchamart@redhat.com;
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
Cc: libvir-list@redhat.com, qemu-devel@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 31, 2022 at 12:55:09PM +0000, Daniel P. Berrangé wrote:
> The current firmware descriptor schema for flash requires that both the
> executable to NVRAM template paths be provided. This is fine for the
> most common usage of EDK2 builds in virtualization where the separate
> _CODE and _VARS files are provided.
> 
> With confidential computing technology like AMD SEV, persistent storage
> of variables may be completely disabled because the firmware requires a
> known clean state on every cold boot. There is no way to express this
> in the firmware descriptor today.
> 
> Even with regular EDK2 builds it is possible to create a firmware that
> has both executable code and variable persistence in a single file. This
> hasn't been commonly used, since it would mean every guest bootup would
> need to clone the full firmware file, leading to redundant duplicate
> storage of the code portion. In some scenarios this may not matter and
> might even be beneficial. For example if a public cloud allows users to
> bring their own firmware, such that the user can pre-enroll their own
> secure boot keys, you're going to have this copied on disk for each
> tenant already. At this point the it can be simpler to just deal with
> a single file rather than split builds. The firmware descriptor ought
> to be able to express this combined firmware model too.

Cool, TIL that it's possible to include both the executable and the
variables file into a single file.

I briefly wondered if in this "combined" mode whether the no. of
duplicate copies can ever fill up the storage.  I doubt that, as the
combined size of _VARS + _CODE is just about 2MB.  So it only starts
mattering if you're running tens of thousands of guests.

> This all points towards expanding the schema for flash with a 'mode'
> concept:
> 
>  - "split" - the current implicit behaviour with separate files
>    for code and variables.
> 
>  - "combined" - the alternate behaviour where a single file contains
>    both code and variables.
> 
>  - "stateless" - the confidential computing use case where storage
>    of variables is completely disable, leaving only the code.
>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  docs/interop/firmware.json | 54 ++++++++++++++++++++++++++++++++------
>  1 file changed, 46 insertions(+), 8 deletions(-)
> 
> In v2:
> 
>  - Mark 'mode' as optional field
>  - Misc typos in docs
> 
> diff --git a/docs/interop/firmware.json b/docs/interop/firmware.json
> index 8d8b0be030..f5d1d0b6e7 100644
> --- a/docs/interop/firmware.json
> +++ b/docs/interop/firmware.json
> @@ -210,24 +210,61 @@
>    'data'   : { 'filename' : 'str',
>                 'format'   : 'BlockdevDriver' } }
>  
> +
> +##
> +# @FirmwareFlashType:
> +#
> +# Describes how the firmware build handles code versus variable
> +# persistence.
> +#
> +# @split: the executable file contains code while the NVRAM
> +#         template provides variable storage. The executable
> +#         must be configured read-only and can be shared between
> +#         multiple guests. The NVRAM template must be cloned
> +#         for each new guest and configured read-write.
> +#
> +# @combined: the executable file contains both code and
> +#            variable storage. The executable must be cloned
> +#            for each new guest and configured read-write.
> +#            No NVRAM template will be specified.

Given my above wondering, is it worth adding a note here about storage
considerations when running large number of guests in the "combined"
mode?  If not, ignore my comment.

> +# @stateless: the executable file contains code and variable
> +#             storage is not persisted. The executed must

I guess you meant: s/executed/executable/

Whoever is applying the patch can touch it up.

> +#             be configured read-only and can be shared
> +#             between multiple guests. No NVRAM template
> +#             will be specified.
> +#
> +# Since: 7.0.0
> +##
> +{ 'enum': 'FirmwareFlashMode',
> +  'data': [ 'split', 'combined', 'stateless' ] }
> +
>  ##
>  # @FirmwareMappingFlash:
>  #
>  # Describes loading and mapping properties for the firmware executable
>  # and its accompanying NVRAM file, when @FirmwareDevice is @flash.
>  #
> -# @executable: Identifies the firmware executable. The firmware
> -#              executable may be shared by multiple virtual machine
> -#              definitions. The preferred corresponding QEMU command
> -#              line options are
> +# @mode: describes how the firmware build handles code versus variable
> +#        storage. If not present, it must be treated as if it was
> +#        configured with value ``split``. Since: 7.0.0

For consistency, might want to capitalize the first word:
s/describes/Describes/  

(Here too, maintainer can touch it up.)

[...]

The concept looks very clear, and obviously useful.  FWIW:

    Reviewed-by: Kashyap Chamarthy <kchamart@redhat.com>    

> -- 
> 2.34.1
> 

-- 
/kashyap


