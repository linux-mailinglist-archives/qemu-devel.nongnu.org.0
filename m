Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E38503FB8DE
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 17:14:37 +0200 (CEST)
Received: from localhost ([::1]:47926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKizc-0005At-TQ
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 11:14:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mKixh-0003yV-8m
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 11:12:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mKixb-0003By-IY
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 11:12:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630336350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s0dxA8y3e2Gey5U1mTyCCpHdO2zK1jpGBaIp9RByej8=;
 b=bnx9oW4UbPFIRlBZpmo8rpBKQpDGPTrnVKJ5Gq5dyWseYiC9uk6odFwJQpTOmNWIpO0k1k
 TjleUXfVDKCvFyQ+BaZIj0bS/ZvZTvj32CFRPXHsMXLFrf5Dv7I5T6MA3cVEWeuy72WxZj
 3jPeylSru2z7Yp9rHUMd1EIobMm0Ey4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-j9E3y2u-McmlUqFIDaxr6Q-1; Mon, 30 Aug 2021 11:12:27 -0400
X-MC-Unique: j9E3y2u-McmlUqFIDaxr6Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7F056838340;
 Mon, 30 Aug 2021 15:11:29 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-4.ams2.redhat.com [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 77319838BC;
 Mon, 30 Aug 2021 15:11:07 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 109C411380A9; Mon, 30 Aug 2021 17:11:06 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 03/23] qapi/misc-target: Group SEV QAPI definitions
References: <20210616204328.2611406-1-philmd@redhat.com>
 <20210616204328.2611406-4-philmd@redhat.com>
Date: Mon, 30 Aug 2021 17:11:06 +0200
In-Reply-To: <20210616204328.2611406-4-philmd@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Wed, 16 Jun 2021 22:43:08
 +0200")
Message-ID: <87v93n3r3p.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Brijesh Singh <brijesh.singh@amd.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Connor Kuehl <ckuehl@redhat.com>,
 Eric Blake <eblake@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> There is already a section with various SEV commands / types,
> so move the SEV guest attestation together.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  qapi/misc-target.json | 81 +++++++++++++++++++++----------------------
>  1 file changed, 40 insertions(+), 41 deletions(-)
>
> diff --git a/qapi/misc-target.json b/qapi/misc-target.json
> index 81646126267..7db94206212 100644
> --- a/qapi/misc-target.json
> +++ b/qapi/misc-target.json
> @@ -219,6 +219,46 @@
>    'data': { 'packet-header': 'str', 'secret': 'str', '*gpa': 'uint64' },
>    'if': 'defined(TARGET_I386)' }
> =20
> +##
> +# @SevAttestationReport:
> +#
> +# The struct describes attestation report for a Secure Encrypted
> +# Virtualization feature.
> +#
> +# @data:  guest attestation report (base64 encoded)
> +#
> +#
> +# Since: 6.1
> +##
> +{ 'struct': 'SevAttestationReport',
> +  'data': { 'data': 'str'},
> +  'if': 'defined(TARGET_I386)' }
> +
> +##
> +# @query-sev-attestation-report:
> +#
> +# This command is used to get the SEV attestation report, and is
> +# supported on AMD X86 platforms only.
> +#
> +# @mnonce: a random 16 bytes value encoded in base64 (it will be
> +#          included in report)
> +#
> +# Returns: SevAttestationReport objects.
> +#
> +# Since: 6.1
> +#
> +# Example:
> +#
> +# -> { "execute" : "query-sev-attestation-report",
> +#                  "arguments": { "mnonce": "aaaaaaa" } }

You're fixing the typo from PATCH 02 here.

> +# <- { "return" : { "data": "aaaaaaaabbbddddd"} }
> +#
> +##
> +{ 'command': 'query-sev-attestation-report',
> +  'data': { 'mnonce': 'str' },
> +  'returns': 'SevAttestationReport',
> +  'if': 'defined(TARGET_I386)' }
> +
>  ##
>  # @dump-skeys:
>  #
> @@ -285,44 +325,3 @@
>  ##
>  { 'command': 'query-gic-capabilities', 'returns': ['GICCapability'],
>    'if': 'defined(TARGET_ARM)' }
> -
> -
> -##
> -# @SevAttestationReport:
> -#
> -# The struct describes attestation report for a Secure Encrypted
> -# Virtualization feature.
> -#
> -# @data:  guest attestation report (base64 encoded)
> -#
> -#
> -# Since: 6.1
> -##
> -{ 'struct': 'SevAttestationReport',
> -  'data': { 'data': 'str'},
> -  'if': 'defined(TARGET_I386)' }
> -
> -##
> -# @query-sev-attestation-report:
> -#
> -# This command is used to get the SEV attestation report, and is
> -# supported on AMD X86 platforms only.
> -#
> -# @mnonce: a random 16 bytes value encoded in base64 (it will be
> -#          included in report)
> -#
> -# Returns: SevAttestationReport objects.
> -#
> -# Since: 6.1
> -#
> -# Example:
> -#
> -# -> { "execute" : "query-sev-attestation-report",
> -                   "arguments": { "mnonce": "aaaaaaa" } }
> -# <- { "return" : { "data": "aaaaaaaabbbddddd"} }
> -#
> -##
> -{ 'command': 'query-sev-attestation-report',
> -  'data': { 'mnonce': 'str' },
> -  'returns': 'SevAttestationReport',
> -  'if': 'defined(TARGET_I386)' }

Reviewed-by: Markus Armbruster <armbru@redhat.com>


