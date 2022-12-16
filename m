Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE2964EA0C
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 12:15:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p68f5-0007jv-Jd; Fri, 16 Dec 2022 06:13:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1p68f3-0007jl-Ub
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 06:13:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1p68f2-0003Hi-DO
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 06:13:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671189230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RbTOovQUdfGt9U9QZ4ZgQdSPz1KkfxzdXiNrkIEZJ18=;
 b=UK7uBU3u8BQfSmO9H+xIlYhXaKOBl1YBBT4ELJEdlTnlgp7EIktDeGpotQ7VDFtTGcDgZV
 3fLz0slhZTsUFaZXQZIslLDY8Psgy33ojTJLT3FksdSQun6bN6YxSzAZ0XG8o/TpuH/4Uy
 SbAqDW3IFIqEFoVlBRfEgsiYZn24vmI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-161-rMcfay-AOuSG6T-_dFt6_g-1; Fri, 16 Dec 2022 06:13:49 -0500
X-MC-Unique: rMcfay-AOuSG6T-_dFt6_g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 04C5780D101;
 Fri, 16 Dec 2022 11:13:49 +0000 (UTC)
Received: from pinwheel (unknown [10.39.194.166])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D1DBD2026D35;
 Fri, 16 Dec 2022 11:13:47 +0000 (UTC)
Date: Fri, 16 Dec 2022 12:13:45 +0100
From: Kashyap Chamarthy <kchamart@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 2/2] docs: add no-padding firmware feature
Message-ID: <Y5xS6TaZGnOCiRag@pinwheel>
References: <20221216101234.2202009-1-kraxel@redhat.com>
 <20221216101234.2202009-3-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221216101234.2202009-3-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kchamart@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Dec 16, 2022 at 11:12:34AM +0100, Gerd Hoffmann wrote:

Hi,

> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  docs/interop/firmware.json | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/interop/firmware.json b/docs/interop/firmware.json
> index 56814f02b3c0..74f404d745b0 100644
> --- a/docs/interop/firmware.json
> +++ b/docs/interop/firmware.json
> @@ -191,6 +191,8 @@
>  #                  PL011 UART. @verbose-static is mutually exclusive
>  #                  with @verbose-dynamic.
>  #
> +# @no-padding: The (arm/aarch64) firmware images are not padded to 64M.
> +#
>  # Since: 3.0
>  ##
>  { 'enum' : 'FirmwareFeature',
> @@ -198,7 +200,8 @@
>               'amd-sev', 'amd-sev-es', 'amd-sev-snp',
>               'intel-tdx',
>               'enrolled-keys', 'requires-smm', 'secure-boot',
> -             'verbose-dynamic', 'verbose-static' ] }
> +             'verbose-dynamic', 'verbose-static',
> +             'no-padding' ] }

If you're re-spinning, please consider adding a sentence or two (for
those of us who're not familiar) a bit more about the "no-padding"
feature to the commit message.

IIUC, I found the use of the padding feature reading an old email
response[1] from Dan Berrangé:

(quote)
    ...
    If there's a risk that newer firmware will be larger than old firmware
    there's only really two options:
    
      - Keep all firmware images forever, each with a unique versioned
        filename. This ensures target QEMU will always load the original
        smaller firmware
    
      - Add padding to the firmware images. IOW, if the firmware is 2 MB,
        add zero-padding to the end of the image to round it upto 4 MB
        (whatever you anticipate the largest size wil be in future).
    ...
(/quote)


[1] https://edk2.groups.io/g/devel/message/54758

Regardless:

Reviewed-by: Kashyap Chamarthy <kchamart@redhat.com>

>  ##
>  # @FirmwareFlashFile:
> -- 
> 2.38.1
> 

-- 
/kashyap


