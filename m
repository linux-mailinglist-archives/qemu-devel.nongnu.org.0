Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF533892C5
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 17:38:53 +0200 (CEST)
Received: from localhost ([::1]:53974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljOHc-0002Tz-EN
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 11:38:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ljOGM-0001lh-8r
 for qemu-devel@nongnu.org; Wed, 19 May 2021 11:37:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ljOGJ-0000oS-D0
 for qemu-devel@nongnu.org; Wed, 19 May 2021 11:37:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621438650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=u87J9TI/eSmhi18aTPbGGUjZOJYi2Mrjubsh1ToC4rw=;
 b=I04WPKZhY25tk9F4Kua3Lfp8Yvum+2OSafXoFQncsbwX96MoFbm5rYsHaHjByS1O3GR0P6
 fZgWHT3yYedKfm0gQUhKA55Kv/3CgwLgtkT6dQGasbAQWl+59biu8HQSIjTzrHovKZbmH0
 IbOzdr1EdVVttruawO5IjK4EFKf99i0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-547-n3jAh05WNnKa44uOkGZwkQ-1; Wed, 19 May 2021 11:37:27 -0400
X-MC-Unique: n3jAh05WNnKa44uOkGZwkQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 885506D24A;
 Wed, 19 May 2021 15:37:25 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-58.ams2.redhat.com [10.36.115.58])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B66561145;
 Wed, 19 May 2021 15:37:23 +0000 (UTC)
Date: Wed, 19 May 2021 17:37:22 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Mirela Grujic <mirela.grujic@greensocs.com>
Subject: Re: [RFC PATCH 6/9] qapi: Implement 'advance-machine-phase' command
Message-ID: <YKUwstsbx4DS7pj3@merkur.fritz.box>
References: <20210513082549.114275-1-mirela.grujic@greensocs.com>
 <20210513082549.114275-7-mirela.grujic@greensocs.com>
MIME-Version: 1.0
In-Reply-To: <20210513082549.114275-7-mirela.grujic@greensocs.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 13.05.2021 um 10:25 hat Mirela Grujic geschrieben:
> The command takes the target initialization phase as the argument
> and triggers QEMU to advance the machine to the target phase (i.e.
> execute all initialization steps required to enter the target phase).
> 
> This command would be used as an alternative to 'next-machine-phase'
> if it's more convenient to jump to a target initialization phase than
> to single-step through phases.
> 
> The command is used in combination with the -preconfig CLI option.
> 
> Note: advancing the machine to the 'ready' phase has the same effect as
> executing the 'x-exit-preconfig' command when the machine is in
> 'accel-created' phase.
> 
> Signed-off-by: Mirela Grujic <mirela.grujic@greensocs.com>

I think this command is preferable, not just because it is more
convenient if you don't have anything to do in some phase, but also
because it is more explicit and doesn't change its behaviour depending
on the current state.

We probably need to expect that this is a command that might often be
used in quickly hacked up shell scripts, which are error prone (Did I
really count the number of 'next-machine-phase' command right? Which
phase are we switching to again in this line?) and may lack proper error
handling, so the least amount of implicit magic will make sure that
users don't get more surprises than necessary.

> diff --git a/qapi/machine.json b/qapi/machine.json
> index 968d67dd95..31872aae72 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -1352,3 +1352,29 @@
>  #
>  ##
>  { 'command': 'next-machine-phase', 'allow-preconfig': true }
> +
> +##
> +# @advance-machine-phase:
> +#
> +# Advance machine initialization phase to the target phase
> +#
> +# @phase: target machine initialization phase
> +#
> +# Since: #FIXME
> +#
> +# Returns: If successful, nothing
> +#
> +# Notes: This command will trigger QEMU to execute initialization steps
> +#        that are required to enter the target machine initialization phase.
> +#        If the target phase is the final initialization phase, the guest will
> +#        start running immediately unless the -S option is used. The command
> +#        is available only if the -preconfig command line option was passed.
> +#
> +# Example:
> +#
> +# -> { "execute": "advance-machine-phase", "arguments": { "phase": "ready" } }
> +# <- { "return": {} }
> +#
> +##
> +{ 'command': 'advance-machine-phase', 'data' : {'phase': 'MachineInitPhase'},
> +             'allow-preconfig': true }
> diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
> index 8aa743d59b..6b21a3fdd5 100644
> --- a/hw/core/machine-qmp-cmds.c
> +++ b/hw/core/machine-qmp-cmds.c
> @@ -219,3 +219,13 @@ void qmp_next_machine_phase(Error **errp)
>  
>      qemu_machine_enter_phase(target_phase, errp);
>  }
> +
> +void qmp_advance_machine_phase(MachineInitPhase phase, Error **errp)
> +{
> +    if (phase_get() == phase) {
> +        error_setg(errp, "Machine is already in the target phase");
> +        return;
> +    }

Another option would be making it set-machine-phase, which doesn't fail
if you're setting the phase that you're already in. It would only fail
if you're trying to go backwards. But this is a minor detail.

> +    qemu_machine_enter_phase(phase, errp);
> +}

Kevin


