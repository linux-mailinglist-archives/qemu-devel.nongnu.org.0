Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD3E39BADF
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 16:27:06 +0200 (CEST)
Received: from localhost ([::1]:53566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpAmv-0004mJ-4U
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 10:27:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lpAm3-00047J-4A
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 10:26:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lpAm0-0006sw-2G
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 10:26:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622816767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=neJ1ybU/5/3U2g5QCte5gioupVhblYHr2BaOjkLHHhU=;
 b=IFn5Cx+VYsigaMiibW5+uEN9k8FuM157mQmaRrM6fmWsD8urpFUg8c4rqZuW8ktOZkD3EO
 NAMx+AwO7WW4q0DUOUay2OIoEGjDpN/vYxFMdF2Q2QKTs06lvGiUzhsKzFfTXmKCNmEZkq
 ZMCDltO6mOtF1bSKGFl+NWfST+DEgcs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-545-3p84qnzIOt-PXgfS_Jl-Nw-1; Fri, 04 Jun 2021 10:26:00 -0400
X-MC-Unique: 3p84qnzIOt-PXgfS_Jl-Nw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2ADE107ACF6;
 Fri,  4 Jun 2021 14:25:58 +0000 (UTC)
Received: from redhat.com (ovpn-113-53.phx2.redhat.com [10.3.113.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A0220687E3;
 Fri,  4 Jun 2021 14:25:57 +0000 (UTC)
Date: Fri, 4 Jun 2021 09:25:55 -0500
From: Eric Blake <eblake@redhat.com>
To: Mirela Grujic <mirela.grujic@greensocs.com>
Subject: Re: [RFC PATCH 5/9] qapi: Implement 'next-machine-phase' command
Message-ID: <20210604142555.tbepaxhhbnhfov4g@redhat.com>
References: <20210513082549.114275-1-mirela.grujic@greensocs.com>
 <20210513082549.114275-6-mirela.grujic@greensocs.com>
MIME-Version: 1.0
In-Reply-To: <20210513082549.114275-6-mirela.grujic@greensocs.com>
User-Agent: NeoMutt/20210205
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
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
Cc: damien.hedde@greensocs.com, edgar.iglesias@xilinx.com,
 Eduardo Habkost <ehabkost@redhat.com>, mark.burton@greensocs.com,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, May 13, 2021 at 10:25:45AM +0200, Mirela Grujic wrote:
> This command will be used to control via QMP the advancing of machine
> through initialization phases. The feature is needed to enable the
> machine configuration via QMP.
> 
> The command triggers QEMU to advance the machine to the next init phase,
> i.e. to execute initialization steps required to enter the next phase.
> The command is used in combination with -preconfig command line option.
> 
> Note: advancing the machine to the final phase has the same effect as
> executing 'x-exit-preconfig' command.
> 
> Signed-off-by: Mirela Grujic <mirela.grujic@greensocs.com>
> ---
>  qapi/machine.json          | 24 ++++++++++++++++++++++++
>  include/sysemu/sysemu.h    |  3 +++
>  hw/core/machine-qmp-cmds.c | 12 ++++++++++++
>  softmmu/vl.c               |  3 +--
>  4 files changed, 40 insertions(+), 2 deletions(-)
> 
> diff --git a/qapi/machine.json b/qapi/machine.json
> index 47bdbec817..968d67dd95 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -1328,3 +1328,27 @@
>  ##
>  { 'command': 'query-machine-phase', 'returns': 'MachineInitPhaseStatus',
>               'allow-preconfig': true }
> +
> +##
> +# @next-machine-phase:
> +#
> +# Increment machine initialization phase
> +#
> +# Since: #FIXME

You can put 6.1 instead of #FIXME if that's what you're aiming for
(but then you may have to adjust it to 6.2 if it misses soft
freeze...)

> +#
> +# Returns: If successful, nothing

This sentence doesn't add much.

> +#
> +# Notes: This command will trigger QEMU to execute initialization steps
> +#        that are required to enter the next machine initialization phase.
> +#        If by incrementing the initialization phase the machine reaches
> +#        the final phase, the guest will start running immediately unless
> +#        the -S option is used. The command is available only if the
> +#        -preconfig command line option was passed.
> +#
> +# Example:
> +#
> +# -> { "execute": "next-machine-phase" }
> +# <- { "return": {} }

As an API, this command seems awkward.  How do I query what phase I'm
currently in?  How many times do I have to call it?  Do we anticipate
the number of times I need to call it to change in future qemu
releases?

Would it be better to require me to pass an enum parameter stating the
phase I intend to move into (and error out if that is not actually the
next phase), where the introspection of the enum tells me how many
times to use this command?  Should this command return a struct
containing "new-state":"enum-value" telling me what state I moved to
on success?


-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


