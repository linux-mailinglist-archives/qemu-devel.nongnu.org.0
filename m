Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 455AD36B34C
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 14:40:54 +0200 (CEST)
Received: from localhost ([::1]:60836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lb0Xl-0003Nc-56
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 08:40:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1lb0Wm-0002sg-8D
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 08:39:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56040)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1lb0Wi-0003sL-Og
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 08:39:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619440788;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mp9ZuvtrLhiHM+dUX2rWZFg8I0nQQDkWjsYeGXIZOzY=;
 b=YaPv2e4FHmXpmgU7zdZsvawc5fAUAzYd0GPPKlziks3r4zRt3kWWag7slsTO1LHn1pk4k6
 d34JyuZxMN3f61yqO2jSjDfOWRDQRD5Nb1nGe/mqxBP/cHZoqMgXjqiXp7gxsDhr9BQ/fP
 4NywXojkEJIiWYg88QWGWHEqj/yw8n4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-527-ONX8xYPTMaaxNfAjdgRRNA-1; Mon, 26 Apr 2021 08:39:46 -0400
X-MC-Unique: ONX8xYPTMaaxNfAjdgRRNA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 23EAB6D241;
 Mon, 26 Apr 2021 12:39:45 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-115-153.ams2.redhat.com
 [10.36.115.153])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 20FF460C5F;
 Mon, 26 Apr 2021 12:39:42 +0000 (UTC)
Subject: Re: [PATCH v2 3/3] docs/interop/firmware.json: Add SEV-ES support
To: Tom Lendacky <thomas.lendacky@amd.com>, qemu-devel@nongnu.org
References: <a7c5ee6c056d840f46028f4a817c16a9862bdd9e.1619208498.git.thomas.lendacky@amd.com>
 <b941a7ee105dfeb67607cf2d24dafcb82658b212.1619208498.git.thomas.lendacky@amd.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <8e7010dc-0920-eb49-8b61-d047c05176aa@redhat.com>
Date: Mon, 26 Apr 2021 14:39:42 +0200
MIME-Version: 1.0
In-Reply-To: <b941a7ee105dfeb67607cf2d24dafcb82658b212.1619208498.git.thomas.lendacky@amd.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Pavel Hrdina <phrdina@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michal Privoznik <mprivozn@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/23/21 22:08, Tom Lendacky wrote:
> From: Tom Lendacky <thomas.lendacky@amd.com>
> 
> Create an enum definition, '@amd-sev-es', for SEV-ES and add documention
> for the new enum. Add an example that shows some of the requirements for
> SEV-ES, including not having SMM support and the requirement for an
> X64-only build.
> 
> Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
> ---
>  docs/interop/firmware.json | 47 +++++++++++++++++++++++++++++++++++++-
>  1 file changed, 46 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/interop/firmware.json b/docs/interop/firmware.json
> index 9d94ccafa9..8d8b0be030 100644
> --- a/docs/interop/firmware.json
> +++ b/docs/interop/firmware.json
> @@ -115,6 +115,12 @@
>  #           this feature are documented in
>  #           "docs/amd-memory-encryption.txt".
>  #
> +# @amd-sev-es: The firmware supports running under AMD Secure Encrypted
> +#              Virtualization - Encrypted State, as specified in the AMD64
> +#              Architecture Programmer's Manual. QEMU command line options
> +#              related to this feature are documented in
> +#              "docs/amd-memory-encryption.txt".
> +#
>  # @enrolled-keys: The variable store (NVRAM) template associated with
>  #                 the firmware binary has the UEFI Secure Boot
>  #                 operational mode turned on, with certificates
> @@ -179,7 +185,7 @@
>  # Since: 3.0
>  ##
>  { 'enum' : 'FirmwareFeature',
> -  'data' : [ 'acpi-s3', 'acpi-s4', 'amd-sev', 'enrolled-keys',
> +  'data' : [ 'acpi-s3', 'acpi-s4', 'amd-sev', 'amd-sev-es', 'enrolled-keys',
>               'requires-smm', 'secure-boot', 'verbose-dynamic',
>               'verbose-static' ] }
>  
> @@ -504,6 +510,45 @@
>  # }
>  #
>  # {
> +#     "description": "OVMF with SEV-ES support",
> +#     "interface-types": [
> +#         "uefi"
> +#     ],
> +#     "mapping": {
> +#         "device": "flash",
> +#         "executable": {
> +#             "filename": "/usr/share/OVMF/OVMF_CODE.fd",
> +#             "format": "raw"
> +#         },
> +#         "nvram-template": {
> +#             "filename": "/usr/share/OVMF/OVMF_VARS.fd",
> +#             "format": "raw"
> +#         }
> +#     },
> +#     "targets": [
> +#         {
> +#             "architecture": "x86_64",
> +#             "machines": [
> +#                 "pc-q35-*"
> +#             ]
> +#         }
> +#     ],
> +#     "features": [
> +#         "acpi-s3",
> +#         "amd-sev",
> +#         "amd-sev-es",
> +#         "verbose-dynamic"
> +#     ],
> +#     "tags": [
> +#         "-a X64",
> +#         "-p OvmfPkg/OvmfPkgX64.dsc",
> +#         "-t GCC48",
> +#         "-b DEBUG",
> +#         "-D FD_SIZE_4MB"
> +#     ]
> +# }
> +#
> +# {
>  #     "description": "UEFI firmware for ARM64 virtual machines",
>  #     "interface-types": [
>  #         "uefi"
> 

Reviewed-by: Laszlo Ersek <lersek@redhat.com>

Thanks!
Laszlo


