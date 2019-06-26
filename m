Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B15574F1
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jun 2019 01:34:43 +0200 (CEST)
Received: from localhost ([::1]:45450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hgHR4-0005YG-D6
	for lists+qemu-devel@lfdr.de; Wed, 26 Jun 2019 19:34:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52859)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <skrtbhtngr@gmail.com>) id 1hgHPE-0004ym-0p
 for qemu-devel@nongnu.org; Wed, 26 Jun 2019 19:32:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <skrtbhtngr@gmail.com>) id 1hgHPC-0002m5-Uw
 for qemu-devel@nongnu.org; Wed, 26 Jun 2019 19:32:47 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:51854)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <skrtbhtngr@gmail.com>)
 id 1hgHPC-0002kb-Lv
 for qemu-devel@nongnu.org; Wed, 26 Jun 2019 19:32:46 -0400
Received: by mail-wm1-x336.google.com with SMTP id 207so3804787wma.1
 for <qemu-devel@nongnu.org>; Wed, 26 Jun 2019 16:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=bekfvSix3AZ0zzIJ8X6iO1Zy6my+G81nYMwzB3oYyBM=;
 b=O6Jen0mF1RRihptbEer4bZp6Wb1zVZ3wck9t5Feeiv8JaiYCbl2NLfG4lCxuM9kjrl
 VPd21IMD9OjVI8ie+4cTx49bXCL+ZI6P0THz4hEcgHftBQS5aOraLRTQJDn9LE4AyVl8
 W7bzkRUrXbH0ZbTT2nuvbJMCOE3L9yXO7r7PIyTErQ68C0McrimI4TdYMtIh82rSrr5k
 yXWF47ftNE+GtUgzcGlMFOtEdb/Xg934z6vVxxQA8Rlg14Q9NwBWcuzlQYKflp9/ifl9
 JNdhN2qQOJi3cZCIcKx1hCxGjMOM5Y4keYMEBZlH4dv6lepXHOuDYFAaqeuvXwOftdQS
 uIKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=bekfvSix3AZ0zzIJ8X6iO1Zy6my+G81nYMwzB3oYyBM=;
 b=gubmaXXDQ2YFBdnGiUMdaYuOYmPVOLmmgSLqZgVy4MItrQtuWIEdQfMjqJZ9YjDFvW
 aq1bIn68TtRaXKXAyklS9fgLQHQb8bTf/4LnJePwnpK37OA5ZDK/NcGYKiV/aRU1LGaV
 9OCYhf0il/psbaaUL2/wie6MicvFY4YusB0x2UCPKdX2zItUzgTTLac4EDxyfk57kYSX
 kgTrwaa3QpQUTthsZgN8vDMjxmmfOcO81CUd8GGQJ74X+y/WEz9KeT/fQ9nUUeF1zW4u
 FEQAli+putwvZsFHN1uzQwwzVli6ptSgG4264QUOW/hEbXuQdniZbW54WWII8w18XMeE
 L5Uw==
X-Gm-Message-State: APjAAAXeopgYKEFewY9gcfwWK6tvNzdqyYtlp46oKNPMD9Z7YXsFdygW
 AgXlDZnZajzNx3He/yo0SxV7Z4fAbnMpiZCJlmQ=
X-Google-Smtp-Source: APXvYqyPT0PG/sKVxgM5DMqLTMqU8nqBZSqf4vIG85QVYeuK9HC0G36XxcfiINcsul9XMDn2rlwF7z0gU2Mmguh7txM=
X-Received: by 2002:a1c:d10c:: with SMTP id i12mr811506wmg.152.1561591964178; 
 Wed, 26 Jun 2019 16:32:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAMzgYoMG1ic-5yiS2ehnDLna+UKgCtMBcSVNmKQx1oxRZqT=yQ@mail.gmail.com>
 <20190624184133.GW2726@work-vm>
In-Reply-To: <20190624184133.GW2726@work-vm>
From: Sukrit Bhatnagar <skrtbhtngr@gmail.com>
Date: Thu, 27 Jun 2019 05:02:33 +0530
Message-ID: <CAMzgYoOjCNYvadBT0PPorG0wOX3Ymvd5x_1NzW1SH2te1JfN-Q@mail.gmail.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::336
Subject: Re: [Qemu-devel] [GSoC] Help needed in implementing live migration
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 25 Jun 2019 at 00:11, Dr. David Alan Gilbert
<dgilbert@redhat.com> wrote:
>
> * Sukrit Bhatnagar (skrtbhtngr@gmail.com) wrote:
> > Hi David,
> >
> > I am Sukrit, GSoC participant working on PVRDMA live migration.
> > We had a short chat about vmxnet3 migration about a week ago
> > on the IRC channel.
> >
> > I am facing an issue while doing migration of the pvrdma device.
> > While loading the device state, we need to perform a few dma
> > mappings on the destination. But on the destination, the migration
> > fails due a BounceBuffer being locked (in_use). This global
> > BounceBuffer is used in address_space_map/unmap functions
> > which the rdma_pci_dma_map/unmap calls.
> > Essentially, we need a way to remap guest physical address on
> > the destination after migration.
> >
> > I had posted an RFC a while ago on the list:
> > https://lists.gnu.org/archive/html/qemu-devel/2019-06/msg04924.html
> > https://lists.gnu.org/archive/html/qemu-devel/2019-06/msg04923.html
> >
> > My mentors (Marcel and Yuval) told me to ask you for help
> > regarding this. It would be really great if you can guide me in
> > finding a workaround for this.
>
> Hi,
>   I'll have a look; I need to get some other things finished first.

Adding cc: qemu-devel, sorry for the private email.

> Dave
> > Thanks,
> > Sukrit
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

