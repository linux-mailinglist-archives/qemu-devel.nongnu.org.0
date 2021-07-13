Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2551E3C7210
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 16:22:52 +0200 (CEST)
Received: from localhost ([::1]:48676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3JJD-0000Hl-5x
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 10:22:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m3Ik4-0000Wl-CE
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:46:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m3Ik1-0000Gr-NC
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:46:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626183988;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QLx206Qzzr8A+ihwc0eH35TYBcdAS6JVYdCZEvYlhdg=;
 b=U+KY/bqC6CBryQ50c6ha3Kb1dWiqCUn74McVFG6KNcTCahTHXI7TmM5h2nNP4bo85cL+aM
 R+QZIEzLXaFwSZJul1XTV3zMytSX8MWYg52ky31FFbr0krAkhXULjlRwxACiSPjLfcDJux
 QlbYkBDtR5cEMx17k2x7ou/e8vMZges=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-7QIouR9BNmmUweJaUUWG1g-1; Tue, 13 Jul 2021 09:46:27 -0400
X-MC-Unique: 7QIouR9BNmmUweJaUUWG1g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 91EDE1018724;
 Tue, 13 Jul 2021 13:46:25 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-19.ams2.redhat.com
 [10.36.112.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D0BA10016F4;
 Tue, 13 Jul 2021 13:46:20 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 22BFB113865F; Tue, 13 Jul 2021 15:46:19 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Brijesh Singh <brijesh.singh@amd.com>
Subject: Re: [RFC PATCH 2/6] i386/sev: extend sev-guest property to include
 SEV-SNP
References: <20210709215550.32496-1-brijesh.singh@amd.com>
 <20210709215550.32496-3-brijesh.singh@amd.com>
Date: Tue, 13 Jul 2021 15:46:19 +0200
In-Reply-To: <20210709215550.32496-3-brijesh.singh@amd.com> (Brijesh Singh's
 message of "Fri, 9 Jul 2021 16:55:46 -0500")
Message-ID: <87h7gy4990.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
 "Daniel P. =?utf-8?Q?Berrang?= =?utf-8?Q?=C3=A9?=" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S . Tsirkin" <mst@redhat.com>, Connor Kuehl <ckuehl@redhat.com>,
 Michael Roth <michael.roth@amd.com>, James Bottomley <jejb@linux.ibm.com>,
 qemu-devel@nongnu.org, "Dr . David Alan
 Gilbert" <dgilbert@redhat.com>, Dov Murik <dovmurik@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Brijesh Singh <brijesh.singh@amd.com> writes:

> To launch the SEV-SNP guest, a user can specify up to 8 parameters.
> Passing all parameters through command line can be difficult. To simplify
> the launch parameter passing, introduce a .ini-like config file that can be
> used for passing the parameters to the launch flow.
>
> The contents of the config file will look like this:
>
> $ cat snp-launch.init
>
> # SNP launch parameters
> [SEV-SNP]
> init_flags = 0
> policy = 0x1000
> id_block = "YWFhYWFhYWFhYWFhYWFhCg=="
>
>
> Add 'snp' property that can be used to indicate that SEV guest launch
> should enable the SNP support.
>
> SEV-SNP guest launch examples:
>
> 1) launch without additional parameters
>
>   $(QEMU_CLI) \
>     -object sev-guest,id=sev0,snp=on
>
> 2) launch with optional parameters
>   $(QEMU_CLI) \
>     -object sev-guest,id=sev0,snp=on,launch-config=<file>
>
> Signed-off-by: Brijesh Singh <brijesh.singh@amd.com>

I acknowledge doing complex configuration on the command line can be
awkward.  But if we added a separate configuration file for every
configurable thing where that's the case, we'd have too many already,
and we'd constantly grow more.  I don't think this is a viable solution.

In my opinion, much of what we do on the command line should be done in
configuration files instead.  Not in several different configuration
languages, mind, but using one common language for all our configuration
needs.

Some of us argue this language already exists: QMP.  It can't do
everything the command line can do, but that's a matter of putting in
the work.  However, JSON isn't a good configuration language[1].  To get
a decent one, we'd have to to extend JSON[2], or wrap another concrete
syntax around QMP's abstract syntax.

But this doesn't help you at all *now*.

I recommend to do exactly what we've done before for complex
configuration: define it in the QAPI schema, so we can use both dotted
keys and JSON on the command line, and can have QMP, too.  Examples:
-blockdev, -display, -compat.

Questions?


[1] https://www.lucidchart.com/techblog/2018/07/16/why-json-isnt-a-good-configuration-language/

[2] Thanks, but no thanks.  Let's make new and interesting mistakes
instead of repeating old and tired ones.


