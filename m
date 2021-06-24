Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE9F3B2DE8
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 13:32:49 +0200 (CEST)
Received: from localhost ([::1]:53594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwNbE-0001VJ-Jt
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 07:32:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lwNAB-0007DL-S3
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 07:04:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lwNA8-0001rK-9e
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 07:04:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624532686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jQenZQFL7LSJlCker7ATmhtfXeZAVJqvaklmRMUEPm4=;
 b=RHwt07itH9+6lyi6qGzpTpmSJvBWrXmMUsJyNJ4NEFE1QEum0KB/kyMj7HSDYN9rsYOvSI
 Fbxmih6bHIHoLIdMt81CiIy8WMWQHr8cdLOtz3hW/xXSJ6n4P9+vgfeAsMCmI0lL+I1a8c
 uSPu68G3TeO2jPaSJC7u/vND5cG5MMQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-nFFV3kTGNe-F2dv-UI4hPA-1; Thu, 24 Jun 2021 07:04:43 -0400
X-MC-Unique: nFFV3kTGNe-F2dv-UI4hPA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 53F40800D55;
 Thu, 24 Jun 2021 11:04:42 +0000 (UTC)
Received: from work-vm (ovpn-114-255.ams2.redhat.com [10.36.114.255])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B5921036D03;
 Thu, 24 Jun 2021 11:04:29 +0000 (UTC)
Date: Thu, 24 Jun 2021 12:04:26 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 02/23] qapi/misc-target: Wrap long 'SEV Attestation
 Report' long lines
Message-ID: <YNRmuqk6wTfYh6x3@work-vm>
References: <20210616204328.2611406-1-philmd@redhat.com>
 <20210616204328.2611406-3-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210616204328.2611406-3-philmd@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
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
Cc: Brijesh Singh <brijesh.singh@amd.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Connor Kuehl <ckuehl@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Dov Murik <dovmurik@linux.ibm.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Philippe Mathieu-Daudé (philmd@redhat.com) wrote:
> Wrap long lines before 70 characters for legibility.
> 
> Suggested-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> Note: it would be nice if checkpatch enforce 70 char for json
>       (or at least QAPI json), that would save future
>       developer modifying QAPI definitions reformating time.
> ---
>  qapi/misc-target.json | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/qapi/misc-target.json b/qapi/misc-target.json
> index 5573dcf8f08..81646126267 100644
> --- a/qapi/misc-target.json
> +++ b/qapi/misc-target.json
> @@ -290,8 +290,8 @@
>  ##
>  # @SevAttestationReport:
>  #
> -# The struct describes attestation report for a Secure Encrypted Virtualization
> -# feature.
> +# The struct describes attestation report for a Secure Encrypted
> +# Virtualization feature.
>  #
>  # @data:  guest attestation report (base64 encoded)
>  #
> @@ -305,10 +305,11 @@
>  ##
>  # @query-sev-attestation-report:
>  #
> -# This command is used to get the SEV attestation report, and is supported on AMD
> -# X86 platforms only.
> +# This command is used to get the SEV attestation report, and is
> +# supported on AMD X86 platforms only.
>  #
> -# @mnonce: a random 16 bytes value encoded in base64 (it will be included in report)
> +# @mnonce: a random 16 bytes value encoded in base64 (it will be
> +#          included in report)
>  #
>  # Returns: SevAttestationReport objects.
>  #
> @@ -316,10 +317,12 @@
>  #
>  # Example:
>  #
> -# -> { "execute" : "query-sev-attestation-report", "arguments": { "mnonce": "aaaaaaa" } }
> +# -> { "execute" : "query-sev-attestation-report",
> +                   "arguments": { "mnonce": "aaaaaaa" } }

Shouldn't that start with a # ?
(Actually, last time I tried this command, I think I realised that we
should also put a real nonce value in there; it requirs a 16 byte value)

Dave

>  # <- { "return" : { "data": "aaaaaaaabbbddddd"} }
>  #
>  ##
> -{ 'command': 'query-sev-attestation-report', 'data': { 'mnonce': 'str' },
> +{ 'command': 'query-sev-attestation-report',
> +  'data': { 'mnonce': 'str' },
>    'returns': 'SevAttestationReport',
>    'if': 'defined(TARGET_I386)' }
> -- 
> 2.31.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


