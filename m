Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 166C25F07C0
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 11:36:59 +0200 (CEST)
Received: from localhost ([::1]:60164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeCS2-0000wq-7M
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 05:36:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1oeCPQ-0007pb-P6
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 05:34:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1oeCPM-0007Nt-6O
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 05:34:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664530451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zq7NCbfMOJqZqV31ZrqgSbCL1Guyl6Zlj7nTw+j2nuQ=;
 b=abHec1pA8kRgMICR50n9dUWTZLRUXeQBARFn0Lu8VfLmgKN5E8S4ZZEIiGpyHN6K3VO59s
 48YK5s9uksZMD7r3zMvYwyH6yQZgYTrIMGtTUjEo47NrR2INKi+xAxo3asd8WTGVsoB9+S
 YWc1FHUPNW4ZcajWD/eQj/BUWx5+4/o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-500-eC8ILeH7N7G-BD6i5jYfWg-1; Fri, 30 Sep 2022 05:34:09 -0400
X-MC-Unique: eC8ILeH7N7G-BD6i5jYfWg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 49182857F90;
 Fri, 30 Sep 2022 09:34:09 +0000 (UTC)
Received: from pinwheel (unknown [10.39.194.203])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D9A4D40C6EC2;
 Fri, 30 Sep 2022 09:34:07 +0000 (UTC)
Date: Fri, 30 Sep 2022 11:34:05 +0200
From: Kashyap Chamarthy <kchamart@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, libvir-list@redhat.com,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH] docs: add firmware feature flags
Message-ID: <Yza4DT3MYFwxjeXI@pinwheel>
References: <20220930091833.1648504-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220930091833.1648504-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kchamart@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.08,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 30, 2022 at 11:18:33AM +0200, Gerd Hoffmann wrote:
> Add new firmware feature flags for the recently added confidential
> computing operating modes by amd and intel.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  docs/interop/firmware.json | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/docs/interop/firmware.json b/docs/interop/firmware.json
> index 4e049b1c7ca0..657082b78b83 100644
> --- a/docs/interop/firmware.json
> +++ b/docs/interop/firmware.json
> @@ -121,6 +121,15 @@
>  #              related to this feature are documented in
>  #              "docs/amd-memory-encryption.txt".

Nit: This is pre-existing, but the location and the file format of the
above file seems to have changed; it's now at: 

    ./system/i386/amd-memory-encryption.rst

Cornelia rSTified that doc in this[1] commit.

[1] 96a46def58 (docs: rstfy confidential guest documentation, 2022-02-09)

>  #
> +# @amd-sev-snp: The firmware supports running under AMD Secure Encrypted
> +#               Virtualization - Secure Nested Paging, as specified in the
> +#               AMD64 Architecture Programmer's Manual. QEMU command line
> +#               options related to this feature are documented in
> +#               "docs/amd-memory-encryption.txt".

Here too: ./system/i386/amd-memory-encryption.rst

> +#
> +# @intel-tdx: The firmware supports running under Intel Trust Domain
> +#             Extensions (TDX).
> +#
>  # @enrolled-keys: The variable store (NVRAM) template associated with
>  #                 the firmware binary has the UEFI Secure Boot
>  #                 operational mode turned on, with certificates
> @@ -185,9 +194,11 @@
>  # Since: 3.0
>  ##
>  { 'enum' : 'FirmwareFeature',
> -  'data' : [ 'acpi-s3', 'acpi-s4', 'amd-sev', 'amd-sev-es', 'enrolled-keys',
> -             'requires-smm', 'secure-boot', 'verbose-dynamic',
> -             'verbose-static' ] }
> +  'data' : [ 'acpi-s3', 'acpi-s4',
> +             'amd-sev', 'amd-sev-es', 'amd-sev-snp',
> +             'intel-tdx',
> +             'enrolled-keys', 'requires-smm', 'secure-boot',
> +             'verbose-dynamic', 'verbose-static' ] }

With the above tiny nits fixed:

Reviewed-by: Kashyap Chamarthy <kchamart@redhat.com>    

>  ##
>  # @FirmwareFlashFile:
> -- 
> 2.37.3
> 

-- 
/kashyap


