Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75AED346280
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 16:13:36 +0100 (CET)
Received: from localhost ([::1]:40626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOiis-0006Y8-8s
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 11:13:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lOifw-0004cV-1k
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 11:10:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lOifp-0005i6-SI
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 11:10:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616512225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ykKTiElHSy3PM29XXlCqGErOgWPhEQ7yHH64KTgV0zI=;
 b=MZijIE7mLWP02MHy1en7Ftjv2/b1a7S6/ArBMLKcMcIyZMn0AZWwezUnO/WKMN8Tx6bFxO
 Mo9zCUJOmTZWBF2TkBUi4ewGWs7m9GNTzWsZPgNl+oTWzWhLecpNQkatIx1vjonp8gKP4i
 8IrO3z23m+k9zYS7kP+ZN453CkcTsyM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-558-qhBXdpJWPYK6JPi_TdhbBg-1; Tue, 23 Mar 2021 11:10:23 -0400
X-MC-Unique: qhBXdpJWPYK6JPi_TdhbBg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A04611007477;
 Tue, 23 Mar 2021 15:10:22 +0000 (UTC)
Received: from [10.3.112.201] (ovpn-112-201.phx2.redhat.com [10.3.112.201])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 399FE1001281;
 Tue, 23 Mar 2021 15:10:19 +0000 (UTC)
Subject: Re: [PATCH 20/28] qapi/pragma: Streamline comments on
 member-name-exceptions
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20210323094025.3569441-1-armbru@redhat.com>
 <20210323094025.3569441-21-armbru@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <7aa5b4fe-20c6-b3da-b720-e0f0c989566b@redhat.com>
Date: Tue, 23 Mar 2021 10:10:18 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210323094025.3569441-21-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: michael.roth@amd.com, jsnow@redhat.com, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/23/21 4:40 AM, Markus Armbruster wrote:
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  qapi/pragma.json | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
> 

Reviewed-by: Eric Blake <eblake@redhat.com>

> diff --git a/qapi/pragma.json b/qapi/pragma.json
> index 4895848c5e..4c47c802d1 100644
> --- a/qapi/pragma.json
> +++ b/qapi/pragma.json
> @@ -10,11 +10,13 @@
>          'query-tpm-models',
>          'query-tpm-types',
>          'ringbuf-read' ],
> -    'member-name-exceptions': [
> -        'ACPISlotType',             # DIMM, visible through query-acpi-ospm-status
> -        'BlockdevVmdkSubformat',    # all members, to match VMDK spec spellings
> -        'BlockdevVmdkAdapterType',  # legacyESX, to match VMDK spec spellings
> -        'QapiErrorClass',           # all members, visible through errors
> -        'UuidInfo',                 # UUID, visible through query-uuid
> -        'X86CPURegister32'          # all members, visible indirectly through qom-get
> +    # Externally visible types whose member names may use uppercase
> +    'member-name-exceptions': [     # visible in:
> +        'ACPISlotType',             # query-acpi-ospm-status
> +        'BlockdevVmdkAdapterType',  # blockdev-create (to match VMDK spec)
> +        'BlockdevVmdkSubformat',    # blockdev-create (to match VMDK spec)
> +        'QapiErrorClass',           # QMP error replies
> +        'UuidInfo',                 # query-uuid
> +        'X86CPURegister32'          # qom-get of x86 CPU properties
> +                                    # feature-words, filtered-features
>      ] } }
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


