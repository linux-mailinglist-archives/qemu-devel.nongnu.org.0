Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E67983A1E2C
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 22:34:24 +0200 (CEST)
Received: from localhost ([::1]:52352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr4u8-0002Hi-1Y
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 16:34:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lr4tC-0001Y1-QW
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 16:33:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lr4tA-0003wO-Sz
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 16:33:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623270803;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9XZUQxP1c930yL+KGVnDvEGfj+EHI3DT9vHnplUmKek=;
 b=PTdN5+iBWDE0YdaBaRtnQFR/bVdBXLK2p9P/Wzr3Dyf79JUrtF6g5So5R6hjxyAWg0fJIg
 cyzsvh0g956u+n0He8QAWpsiKy0GWNjSeCLMUYZbdmXbXLdJKc91/yw3Ddtn8D+i3DmEc9
 ehoj3mtqUDqR2An1j6rlk4ShUDMzA8g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-565-tKNajN0iNG2LDEw_ScsrMw-1; Wed, 09 Jun 2021 16:33:22 -0400
X-MC-Unique: tKNajN0iNG2LDEw_ScsrMw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 21A7E1850606;
 Wed,  9 Jun 2021 20:33:21 +0000 (UTC)
Received: from redhat.com (ovpn-113-53.phx2.redhat.com [10.3.113.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4ADB810016FE;
 Wed,  9 Jun 2021 20:33:17 +0000 (UTC)
Date: Wed, 9 Jun 2021 15:33:15 -0500
From: Eric Blake <eblake@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 2/2] tpm: Return QMP error when TPM is disabled in build
Message-ID: <20210609203315.zskd2yczywyumh2o@redhat.com>
References: <20210609184955.1193081-1-philmd@redhat.com>
 <20210609184955.1193081-3-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210609184955.1193081-3-philmd@redhat.com>
User-Agent: NeoMutt/20210205
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
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
Cc: Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 09, 2021 at 08:49:55PM +0200, Philippe Mathieu-Daudé wrote:
> When the management layer queries a binary built using --disable-tpm
> for TPM devices, it gets confused by getting empty responses:
> 
...
> 
> To make it clearer by returning an error:
> - Make the TPM QAPI schema conditional
> - Adapt the HMP command
> - Remove stubs which became unnecessary
> 
> The management layer now gets a 'CommandNotFound' error:
> 
>   { "execute": "query-tpm" }
>   {
>       "error": {
>           "class": "CommandNotFound",
>           "desc": "The command query-tpm has not been found"
>       }
>   }
> 
> Suggested-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  qapi/tpm.json      |  9 ++++++---
>  monitor/hmp-cmds.c |  4 ++++
>  stubs/tpm.c        | 16 ----------------
>  3 files changed, 10 insertions(+), 19 deletions(-)

Yes, looks nicer.

> 
> diff --git a/qapi/tpm.json b/qapi/tpm.json
> index 6a10c9ed8d2..09332e6f996 100644
> --- a/qapi/tpm.json
> +++ b/qapi/tpm.json
> @@ -33,7 +33,8 @@
>  # <- { "return": [ "tpm-tis", "tpm-crb", "tpm-spapr" ] }
>  #
>  ##
> -{ 'command': 'query-tpm-models', 'returns': ['TpmModel'] }
> +{ 'command': 'query-tpm-models', 'returns': ['TpmModel'],
> +  'if': 'defined(CONFIG_TPM)' }

May need a rebase if the series to make 'if' language-agnostic lands
first (in fact, that would probably result in a build-time semantic
conflict rather than a patch-application-time merge conflict), but
that's not enough to prevent me from giving:

Reviewed-by: Eric Blake <eblake@redhat.com

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


