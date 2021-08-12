Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7B83EA610
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 15:55:32 +0200 (CEST)
Received: from localhost ([::1]:46132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEBBD-0004oX-O8
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 09:55:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mEBAF-00048s-7P
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 09:54:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mEBAB-00062h-Tl
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 09:54:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628776465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ywpM/9LjZxNoaG0VrUBge3egRwJecq4Xudl3/dkjw5A=;
 b=RYl+sOTh13q/g2S4Ir5LHsopv6wXs688B6nmioi/wYmnS9IB0W6S3bGcgSkZScHGb9VA0U
 dz/efFGbJn/tvX091AitLgjK8jdMGgXhuvm4Kx2dN0ADVED0pJh5vIUrLuQcHZwIhldODO
 fl+/0H38ngbe+r9FN3kAUATfQJanidE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-489-Xb4y4zrKM_u_TCXaORJ1ow-1; Thu, 12 Aug 2021 09:54:22 -0400
X-MC-Unique: Xb4y4zrKM_u_TCXaORJ1ow-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E08918C89E0;
 Thu, 12 Aug 2021 13:54:21 +0000 (UTC)
Received: from redhat.com (ovpn-112-138.phx2.redhat.com [10.3.112.138])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A67497E205;
 Thu, 12 Aug 2021 13:54:14 +0000 (UTC)
Date: Thu, 12 Aug 2021 08:54:12 -0500
From: Eric Blake <eblake@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH] configure: Remove spurious [] from tr
Message-ID: <20210812135412.krlpzwunyemy73hq@redhat.com>
References: <20210812110942.19065-1-dgilbert@redhat.com>
 <CAFEAcA9dp-kM_cB9g=7kpeCbFVxiwoQ14L+mymc_pHwZ_1UDnA@mail.gmail.com>
 <YRUcoAiKWtxfPVqB@work-vm>
MIME-Version: 1.0
In-Reply-To: <YRUcoAiKWtxfPVqB@work-vm>
User-Agent: NeoMutt/20210205-687-0ed190
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 12, 2021 at 02:05:36PM +0100, Dr. David Alan Gilbert wrote:
> Indeed it's not; there's LOTS of warnings; although most of them are
> probably irrelevant; there are also two others at the error level:
> 
> In configure line 4406:
>         if "$ld" -verbose 2>&1 | grep -q "^[[:space:]]*$emu[[:space:]]*$"; then
>                                                        ^-- SC1087: Use braces when expanding arrays, e.g. ${array[idx]} (or ${var}[.. to quiet).
> 
> which is probably just needing the ${emu} to shut it up.

Yep. ${var[idx]} is a bashism, but our configure is /bin/sh and not
bash, and we don't want an array access, so using ${emu}[ to shut up
the checker is the right action.

> 
> In configure line 4464:
> if !(GIT="$git" "$source_path/scripts/git-submodule.sh" "$git_submodules_action" "$git_submodules"); then
>     ^-- SC1035: You are missing a required space after the !.
> 
> which hmm I've not quite got my head around yet; but maybe that one is
> real.

In bash, !() is an extended glob when using 'shopt -s extglob' - but
we aren't using bash, and we _don't_ want extended glob (execute the
command formed from the set of all filenames in the current working
directory that do not match the contents inside (...), which is likely
to not be a valid command).  When the bash extension is not in use,
'if !()' is the same as 'if ! ()', checking if the exit status of the
subshell is non-zero.  Adding the space ensures we don't trigger an
unintended bash extglob, but would still waste the effort on a
subshell.  So I would suggest we fix the line to:

if ! GIT="$git" "$source_path..".."..$git_submodules"; then

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


