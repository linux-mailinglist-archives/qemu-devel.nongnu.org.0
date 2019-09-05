Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51570AA802
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Sep 2019 18:10:07 +0200 (CEST)
Received: from localhost ([::1]:48054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i5uKj-0001wn-RZ
	for lists+qemu-devel@lfdr.de; Thu, 05 Sep 2019 12:10:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56348)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ufimtseva@gmail.com>) id 1i5uJM-0001SG-1B
 for qemu-devel@nongnu.org; Thu, 05 Sep 2019 12:08:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ufimtseva@gmail.com>) id 1i5uJL-0004qd-0m
 for qemu-devel@nongnu.org; Thu, 05 Sep 2019 12:08:39 -0400
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:43673)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <ufimtseva@gmail.com>) id 1i5uJK-0004q7-Q9
 for qemu-devel@nongnu.org; Thu, 05 Sep 2019 12:08:38 -0400
Received: by mail-ed1-x541.google.com with SMTP id c19so3183950edy.10
 for <qemu-devel@nongnu.org>; Thu, 05 Sep 2019 09:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7quAPg/B4W/5UP9wmS1YkRD1HC5q4Q8G4iWutx2JrOA=;
 b=b2T3MGuEe4WIFbiiN84q+YSaB8F2AL4MXUum8be8pGKKEU3KLA588cg9ZhaK6v8xJy
 MpTaN8mHVGw90ItFbuMSfu+G1F1TC8kaK1zCKgfLDXi/c3FjbEL3lOsaSWf/L4Ei1Sn3
 ymiTDjMpeS7QxqnYX5BijEBpZ15m2VntoDVQqYMHEBbv1dcLRfzo3qfPQn5fdqhSyFMQ
 A+tV3s3J+hOFCDT1NWVDbcS6mUXdilgE+T2HZlLK93f8J96HzXY7/DMcPFFX8mXAZkT6
 sgwAkqPG+7ykmFW0zslfZP3nXWplBbct+4tn9bVgBBO0xyxYcKG69tfLB4pouc410BGa
 vwNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7quAPg/B4W/5UP9wmS1YkRD1HC5q4Q8G4iWutx2JrOA=;
 b=ukQ/0ulJSznbcBVUtNeiOqzBbFw/kO9uC+Q6IBSDErYKGtQCCUJiqoON8h5hIY8XT6
 0PmI2juvJjMGmMb12+bqkEAXLfXuJRiCSCPojWLBCr1VMFPYqR2dWVvellTjxmPqcQMs
 l8V1OWPGzFkOPDWe8iAIzdoX5sDsxH6ity5+yIBYzbcIqpMAk11Cq57eA8DXjzePw5If
 ERei5bsV+gmTMbS48Nna70VC3RpFSWtqa4e2GxNFDa1I21Iuj6LYBv0biYj89pt0vHH2
 KY8YPlx2R9L+33wemCku/WPhAGQuibpUqEydtz5T6TOkzz6Og5mZtgf2F8gCRyPz5na0
 S1Kg==
X-Gm-Message-State: APjAAAVoknYb0QbtfgzXGEfOfkc5uoWYULAs30OkaValbHn8g4rvWz5p
 5mBKQe7jjHKH006TMZlv9/aOmC8ppULMPhlZRkY=
X-Google-Smtp-Source: APXvYqxTtL6Sj50D55V9WUuDrujhkHyxD9ClzhcUD6ijSE2qFQ8nG2h8rPRjeLNhfaiDUF3gxYlxRV9ik7RoHKv18IQ=
X-Received: by 2002:a17:906:fd0:: with SMTP id
 c16mr2858365ejk.213.1567699716822; 
 Thu, 05 Sep 2019 09:08:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1567534653.git.jag.raman@oracle.com>
 <59cb496983f03b05f6da87af73bc2a2ac0bb7f81.1567534653.git.jag.raman@oracle.com>
 <CAFEAcA_-NpSSkDuN4ggHb5Loqen0xaxBNpoaadtexppFc2B-6Q@mail.gmail.com>
In-Reply-To: <CAFEAcA_-NpSSkDuN4ggHb5Loqen0xaxBNpoaadtexppFc2B-6Q@mail.gmail.com>
From: Elena Ufimtseva <ufimtseva@gmail.com>
Date: Thu, 5 Sep 2019 09:08:23 -0700
Message-ID: <CAEr7rXg9uc5Hi-UxHKmHJPRW6QX7qb4iandE6er6SkGNXbS83A@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::541
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.23
Subject: Re: [Qemu-devel] [RFC v3 PATCH 44/45] multi-process: add the
 concept description to docs/devel/qemu-multiprocess
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>, Fam Zheng <fam@euphon.net>,
 john.g.johnson@oracle.com, QEMU Developers <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Jagannathan Raman <jag.raman@oracle.com>,
 Juan Quintela <quintela@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, kanth.ghatraju@oracle.com,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, liran.alon@oracle.com,
 Stefan Hajnoczi <stefanha@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Kevin Wolf <kwolf@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Ross Lagerwall <ross.lagerwall@citrix.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 5, 2019 at 3:19 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Tue, 3 Sep 2019 at 22:19, Jagannathan Raman <jag.raman@oracle.com>
> wrote:
> >
> > From: John G Johnson <john.g.johnson@oracle.com>
> >
> > Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> > Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> > Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> > ---
> >  v2 -> v3:
> >    - Updated with latest design of this project
> >
> >  docs/devel/qemu-multiprocess.txt | 627
> +++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 627 insertions(+)
> >  create mode 100644 docs/devel/qemu-multiprocess.txt
>
> Hi; you can ignore this review comment until there's more
> consensus on whether we want to take this patch series, but
> new documents in docs/ should be in RST format and included
> in the relevant contents page (here docs/devel/index.rst),
> please.
>
> thanks
> -- PMM
>
> Thanks Peter, will change this.

-- 
Elena
