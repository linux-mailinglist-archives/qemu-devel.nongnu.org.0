Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 496936875F7
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 07:39:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNTEO-0007U9-QZ; Thu, 02 Feb 2023 01:38:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNTEJ-0007QQ-3N
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 01:37:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNTEA-0007Ss-3D
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 01:37:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675319846;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HIvR6DsQNJvV9kmDH1XaKdT1cJO+tj5DdgWo9krHzPM=;
 b=b1J8VZ0jDldVX4a1FWbyePUpg3lM8451J7IHECJx9XqvPAu5nf2ZqG/oaE3mmvX/h4y5nH
 8ehpfZu9UheJiBHMsLw4ZxSUywDSDcDw38D0IToScZvRmoyMwcmewFzZeW0XGnz3vFKXuu
 vmuBrADClBXe7eu4pB+K4gARSJbAuOA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-oPHirVN-PbG7DHt9WLfxHw-1; Thu, 02 Feb 2023 01:37:22 -0500
X-MC-Unique: oPHirVN-PbG7DHt9WLfxHw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ACE553813F3B;
 Thu,  2 Feb 2023 06:37:21 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 824A640398A0;
 Thu,  2 Feb 2023 06:37:21 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 35AA321E6A1F; Thu,  2 Feb 2023 07:37:20 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Khadija Kamran <kkamran.bese16seecs@seecs.edu.pk>
Cc: qemu-devel@nongnu.org,  thuth@redhat.com,  ysato@users.sourceforge.jp,
 alex.bennee@linaro.org,  pbonzini@redhat.com,  fam@euphon.net,
 peter.maydell@linaro.org,  philmd@linaro.org,  kwolf@redhat.com,
 hreitz@redhat.com
Subject: Re: [PATCH 1/9] Updated the FSF address in file hw/sh4/sh7750_regs.h
References: <bd7883e4dbedd5119c52a37f00a23a5dcef52610.1675270567.git.kkamran.bese16seecs@seecs.edu.pk>
Date: Thu, 02 Feb 2023 07:37:20 +0100
In-Reply-To: <bd7883e4dbedd5119c52a37f00a23a5dcef52610.1675270567.git.kkamran.bese16seecs@seecs.edu.pk>
 (Khadija Kamran's message of "Wed, 1 Feb 2023 22:33:54 +0500")
Message-ID: <875yckr2sf.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

I guess this is your attempt to implement my suggestion to squash your
series into one patch.  It came out as a concatenation of patches in a
single e-mail.  That's not what we mean by "squashing patches" :)

The common tool for squashing patches is git-rebase.  Say your series is
on branch "work", which is based on master.  Then

    $ git-rebase -i master work

If master has advanced since you based branch work on it, this will
advance your branch to be based on current master.  Hence "rebase".

The -i lets you edit the list of commits to be rebased.  It'll show
instruction right in the editor.  Relevant lines:

    # c        pick <commit> = use commit
    [...]
    # s        squash <commit> = use commit, but meld into previous commit
    # f        fixup [-C | -c] <commit> = like "squash" but keep only the previous
    #                    commit's log message, unless -C is used, in which case
    #                    keep only this commit's message; -c is same as -C but
    #                    opens the editor

If you keep the first (top-most) commit as "pick", and change the
remainder to "fixup", the patches become one, using the first patch's
commit message.

You'll then have to reword that commit message.  Since you're already
editing a rebase sequence, you may want to do that by changing "pick" to
"reword".

Hope this helps.


