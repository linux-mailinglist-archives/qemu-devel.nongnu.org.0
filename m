Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D76A638F35A
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 20:57:52 +0200 (CEST)
Received: from localhost ([::1]:57626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llFlv-0006Js-OS
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 14:57:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1llFjV-0004gh-Db
 for qemu-devel@nongnu.org; Mon, 24 May 2021 14:55:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45187)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1llFjQ-0007dl-Aj
 for qemu-devel@nongnu.org; Mon, 24 May 2021 14:55:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621882515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SGhztfa3wdG2HQzq0rLPVRnUn9CsfGTvYNN6vNFCRRo=;
 b=hGIZEb9ztunH6BIkXmCqS1v3OxumlYhFwEgMG3UG/FFJv2MH/jJi0BtRjU/SDYNQodi7fK
 gWPvRIsJqQuIwV6yOktLe8k0WEg+///2IUGY5ofZPiLeHqen8+4xaNbDomqVUAwpqn8bJS
 tKcUMXWnDuvldycz4YZ24rbnCA6dnNQ=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-314-5-ci_zWiP7WCfQshDcsW0g-1; Mon, 24 May 2021 14:55:13 -0400
X-MC-Unique: 5-ci_zWiP7WCfQshDcsW0g-1
Received: by mail-vs1-f70.google.com with SMTP id
 q16-20020a67d7900000b0290228198e77b6so12065891vsj.23
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 11:55:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SGhztfa3wdG2HQzq0rLPVRnUn9CsfGTvYNN6vNFCRRo=;
 b=kEd9kbMGUd4fg4C9vwPaHX4OzuNuaQSIbHrmnzgdue2+w9Mgp955oc8Ap1sHmBhB3X
 oEnPUrhbFLnLIJVJtxDAjgzliPXRRwRe+EunMQgcO3wmEKsBfaKxogZIrZ72tqrAlEnp
 LBf/xrNs9VwICwjJcK3whdZ8OZty3S7omuMO9UjCOMK70BckLAy9d80O/4+unm8y+V2b
 4ihHlxggoXGox701G358ytj8oHuKFzZBbeXaVsE8vwiGWQjSyUnzQ8pTce11X/FNvUuR
 M1y4hFLMlI+1d8vnEG3lGls5M/K/hdi19sIFJ4E2OBSZCU2LxgI6EvYmlzlZS9Ta3Z9k
 01iQ==
X-Gm-Message-State: AOAM531kLMjrseq41vQl3l/r+t5Kb+JBQMpE48C9EWnQSspBVR/h+SVi
 fO88s1uYFeiiFWnAgCX0Db1qyGuYZBmNHGUo4K3TWzPPCvpeK2BS0Oi8tzrxV3nYnf9139WudY+
 pLMGkluQXloGtV5SGKM3eMCWUnGH+U/g=
X-Received: by 2002:ab0:3403:: with SMTP id z3mr24688019uap.113.1621882513097; 
 Mon, 24 May 2021 11:55:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxm23dhxwCCWGCIVrJQcJoKmCmcn8V19xIi2NdfFR0c4eE0TWVPpYT8vThUEvYmn4nP6Foudl/d7HkHpNW1qsY=
X-Received: by 2002:ab0:3403:: with SMTP id z3mr24688010uap.113.1621882512899; 
 Mon, 24 May 2021 11:55:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210503224326.206208-1-wainersm@redhat.com>
 <20210503224326.206208-5-wainersm@redhat.com>
 <0aaa0e83-ea50-8836-20a8-75ef32617731@amsat.org>
 <CAKJDGDYmABQJ1ykFJkyO-6jJRmDOETPzWvCAip8b3mYXRpVa1g@mail.gmail.com>
In-Reply-To: <CAKJDGDYmABQJ1ykFJkyO-6jJRmDOETPzWvCAip8b3mYXRpVa1g@mail.gmail.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 24 May 2021 15:54:46 -0300
Message-ID: <CAKJDGDa=2v=FdCQ+QSg8OO3gpqMD4A1hvnWfzJwQC58JfWCVRw@mail.gmail.com>
Subject: Re: [PATCH 4/7] tests/acceptance: Sun4uMachine: Remove dependency to
 LinuxKernelTest
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa Junior <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 24, 2021 at 3:30 PM Willian Rampazzo <wrampazz@redhat.com> wrot=
e:
>
> On Tue, May 4, 2021 at 1:01 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
> >
> > Hi Wainer,
> >
> > On 5/4/21 12:43 AM, Wainer dos Santos Moschetta wrote:
> > > The Sun4uMachine class inherit from LinuxKernelTest to effectively on=
ly use
> > > the KERNEL_COMMON_COMMAND_LINE attribute. This change remove that unn=
eeded
> > > dependency, making Sun4uMachine self-content.
> >
> > It is odd because the test boots a Linux kernel...
> >
> > Once you added ConsoleMixIn, LinuxKernelTest is left with
> > 2 methods related to archive extraction. Not particularly
> > specific to Linux kernel. Beside, shouldn't these methods
> > be provided by Avocado directly, by avocado.utils.archive
> > and avocado.utils.software_manager.backends?
>
> Indeed, it makes a lot of sense to have those two methods inside the
> Avocado utilities. I opened an issue on the Avocado side to track
> that: https://github.com/avocado-framework/avocado/issues/4610.

Beraldo reminded me there is already an issue to handle this:
https://github.com/avocado-framework/avocado/issues/3549.


