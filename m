Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 861F2346348
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 16:50:26 +0100 (CET)
Received: from localhost ([::1]:49282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOjIX-0001AH-Iu
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 11:50:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lOjEl-0005zi-96
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 11:46:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56189)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lOjEf-0000QS-PZ
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 11:46:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616514384;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D1fNUNvEN+DbivTxPd70Z6HTElq+Vt/O95A5m675b+I=;
 b=Coex5gT4ao8tIVjAAA2U0a2oetgtLHV/KXOJJTwLJ7YDpm18/CsntJLJkW51yafuqgGcY3
 AyLIDoUv4rrLlVjniiIJWu9GmFCF7o1lwjj6rGzSXWa7i9CqANI9LNfeNm1OINJcMEoI6p
 EF7Hpj1rJjnrcXjwD+ACB485vd+poDs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20-zZkM9Fa6O9-0J58UjGcr_Q-1; Tue, 23 Mar 2021 11:46:22 -0400
X-MC-Unique: zZkM9Fa6O9-0J58UjGcr_Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D80E3835B47;
 Tue, 23 Mar 2021 15:46:21 +0000 (UTC)
Received: from [10.3.112.201] (ovpn-112-201.phx2.redhat.com [10.3.112.201])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7385B6087C;
 Tue, 23 Mar 2021 15:46:18 +0000 (UTC)
Subject: Re: [PATCH 26/28] qapi: Enforce struct member naming rules
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20210323094025.3569441-1-armbru@redhat.com>
 <20210323094025.3569441-27-armbru@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <e5b2cdc4-a649-86c1-cde8-ce142be9f5ae@redhat.com>
Date: Tue, 23 Mar 2021 10:46:17 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210323094025.3569441-27-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
> Struct members, including command arguments, event data, and union
> inline base members, should use '-', not '_'.  Enforce this.  Fix the
> fixable offenders (all in tests/), and add the remainder to pragma
> member-name-exceptions.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---

> +++ b/qapi/pragma.json
> @@ -31,10 +31,27 @@
>      # Externally visible types whose member names may use uppercase
>      'member-name-exceptions': [     # visible in:
>          'ACPISlotType',             # query-acpi-ospm-status
> +        'AcpiTableOptions',         # -acpitable
> +        'BlkdebugSetStateOptions',  # blockdev-add, -blockdev
> +        'BlockDeviceInfo',          # query-block
> +        'BlockDeviceStats',         # query-blockstats
> +        'BlockDeviceTimedStats',    # query-blockstats
> +        'BlockIOThrottle',          # block_set_io_throttle
> +        'BlockInfo',                # query-block
>          'BlockdevVmdkAdapterType',  # blockdev-create (to match VMDK spec)
>          'BlockdevVmdkSubformat',    # blockdev-create (to match VMDK spec)
> +        'ColoCompareProperties',    # object_add, -object
> +        'FilterMirrorProperties',   # object_add, -object
> +        'FilterRedirectorProperties', # object_add, -object
> +        'FilterRewriterProperties', # object_add, -object
> +        'InputLinuxProperties',     # object_add, -object
> +        'NetdevTapOptions',         # netdev_add, query-netdev, -netdev
> +        'PciBusInfo',               # query-pci
> +        'PciDeviceInfo',            # query-pci
> +        'PciMemoryRegion',          # query-pci
>          'QapiErrorClass',           # QMP error replies
>          'UuidInfo',                 # query-uuid
> +        'VncClientInfo',            # query-vnc, query-vnc-servers, ...
>          'X86CPURegister32'          # qom-get of x86 CPU properties
>                                      # feature-words, filtered-features
>      ] } }

I was worried the list might be even longer.  And as before, we might
have future patches that want to add aliases and/or deprecate the old
spellings, as long as introspection can easily see new spellings.

At any rate, I'm in agreement with letting the computer flag new
instances instead of relying on me to notice during review.

> diff --git a/qga/qapi-schema.json b/qga/qapi-schema.json
> index 2b08b761c2..fb17eebde3 100644
> --- a/qga/qapi-schema.json
> +++ b/qga/qapi-schema.json
> @@ -19,6 +19,10 @@
>  # Whitelists to permit QAPI rule violations; think twice before you

Did you want to fix this instance of the word 'Whitelists' somewhere in
the series?

>  # add to them!
>  { 'pragma': {
> +    # Types whose member names may use '_'
> +    'member-name-exceptions': [
> +        'GuestAgentInfo'
> +    ],
>      # Commands allowed to return a non-dictionary:
>      'command-returns-exceptions': [
>          'guest-file-open',
Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


