Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C98E3A288A
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 11:40:27 +0200 (CEST)
Received: from localhost ([::1]:37538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrHAo-0003rZ-Lj
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 05:40:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lrH9q-0003Bh-M7
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 05:39:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lrH9p-0002jq-0f
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 05:39:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623317964;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6pS+uwrVhPBZrmcKY1ab8QlxrMsrLz8ZBdhHMVpGiYk=;
 b=Oqt3TwPbbDfQgB0gOE1NA2hmJir6O5pKxKX+xZ9ydh0RPGq2WwXIxlX4g8hWuzqF8DDRGK
 YOjJQZfOzKo16kTEpe9ke6PVyjl25NaP+G9UAGBecoUy8yzpQD5nl7J8XsSJRhMl9jtP3b
 gjiz8xekDsGG5O/qz+juiT8BVa4tER4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-413-vzdL3BahOBO3EyKtae523g-1; Thu, 10 Jun 2021 05:39:23 -0400
X-MC-Unique: vzdL3BahOBO3EyKtae523g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0192C100CF6D;
 Thu, 10 Jun 2021 09:39:22 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-222.ams2.redhat.com
 [10.36.112.222])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BDF1319D7C;
 Thu, 10 Jun 2021 09:39:21 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3FB5A113865F; Thu, 10 Jun 2021 11:39:20 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 02/11] qapi/misc-target: Group SEV QAPI definitions
References: <20210610064556.1421620-1-philmd@redhat.com>
 <20210610064556.1421620-3-philmd@redhat.com>
Date: Thu, 10 Jun 2021 11:39:20 +0200
In-Reply-To: <20210610064556.1421620-3-philmd@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Thu, 10 Jun 2021 08:45:47
 +0200")
Message-ID: <875yymdpo7.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: Connor Kuehl <ckuehl@redhat.com>, Eric Blake <eblake@redhat.com>,
 Brijesh Singh <brijesh.singh@amd.com>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> There is already a section with various SEV commands / types,
> so move the SEV guest attestation together.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  qapi/misc-target.json | 75 +++++++++++++++++++++----------------------
>  1 file changed, 37 insertions(+), 38 deletions(-)
>
> diff --git a/qapi/misc-target.json b/qapi/misc-target.json
> index 5573dcf8f08..1b81f7017d4 100644
> --- a/qapi/misc-target.json
> +++ b/qapi/misc-target.json
> @@ -219,6 +219,43 @@
>    'data': { 'packet-header': 'str', 'secret': 'str', '*gpa': 'uint64' },
>    'if': 'defined(TARGET_I386)' }
> =20
> +##
> +# @SevAttestationReport:
> +#
> +# The struct describes attestation report for a Secure Encrypted Virtual=
ization
> +# feature.
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
> +# This command is used to get the SEV attestation report, and is support=
ed on AMD
> +# X86 platforms only.
> +#
> +# @mnonce: a random 16 bytes value encoded in base64 (it will be include=
d in report)
> +#
> +# Returns: SevAttestationReport objects.
> +#
> +# Since: 6.1
> +#
> +# Example:
> +#
> +# -> { "execute" : "query-sev-attestation-report", "arguments": { "mnonc=
e": "aaaaaaa" } }
> +# <- { "return" : { "data": "aaaaaaaabbbddddd"} }
> +#
> +##
> +{ 'command': 'query-sev-attestation-report', 'data': { 'mnonce': 'str' }=
,
> +  'returns': 'SevAttestationReport',
> +  'if': 'defined(TARGET_I386)' }
> +
>  ##
>  # @dump-skeys:
>  #

Just code motion, so

Acked-by: Markus Armbruster <armbru@redhat.com>

Opportunity to wrap the long doc comment lines.  Should be kept under 70
or so.

[...]


