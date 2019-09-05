Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8CCA9F75
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Sep 2019 12:19:25 +0200 (CEST)
Received: from localhost ([::1]:44082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i5orM-0001rF-7G
	for lists+qemu-devel@lfdr.de; Thu, 05 Sep 2019 06:19:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58670)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i5ooq-0000ty-Gd
 for qemu-devel@nongnu.org; Thu, 05 Sep 2019 06:16:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i5oop-0004jQ-4e
 for qemu-devel@nongnu.org; Thu, 05 Sep 2019 06:16:48 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:37998)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i5ooo-0004j0-TN
 for qemu-devel@nongnu.org; Thu, 05 Sep 2019 06:16:47 -0400
Received: by mail-ot1-x343.google.com with SMTP id r20so1615549ota.5
 for <qemu-devel@nongnu.org>; Thu, 05 Sep 2019 03:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WrX+BV50C0YcEMaUWza2ABBb+KGxqFoCxrP8wzlqpqc=;
 b=P3ziD+P33ZeDirW3uks0Fym71/Gl8cyOAmdgIyt3dR6gNq0ngF9nwjiz/Pqu8BfAIC
 nX3kO3g23Kcw/NOAKuDIQFa/UvdEFRYEpj7JDAf8QCaZ52Ay4pE1AJieoQKlTPCBHC0q
 ISWcDZJPmKLE1I7aYwGy9vco4L4Hm22JIOLIWs3EKm70mRO8qJWeM/WCYP9BOLpIV60Y
 qiZGcphjRf/dvu1S0sEE/7EbE7O0jp0Vb3ll6mrd/KSwpv1j3mKzoQltG13tNAzFsnmR
 fayPuNhRV1MT544WKUu9lXetLinJCcSVPXY1FcdBIDLmX21N8q/YCTQsgvVFuLmGFEX8
 RyKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WrX+BV50C0YcEMaUWza2ABBb+KGxqFoCxrP8wzlqpqc=;
 b=Zatsw/DQusoThApHeVqP5P59AarLfsZE2GGwlW5O6YzS0qZeAqNd4hsw6lzzWlehWv
 zeVeRQ0repb6z0szbl6htD9kswfe+E2IIusLFACCs491ca8YrXHCU5EhyNjuDOA9nSWU
 vxz5cu+A63Id34PFkZEG743QuhY76Xhb5wpri2i7GeLTqgzwcOKyRyCebVEIx5lZU7DT
 y5+VehPVjzIxirOuwgYlEFAFd40koI1k24yZ+1uZu8BaI/PplOvE6QgpRt/uqiyHnrHP
 GirjWSONeI9TJ4IE8FxCrtBxZpSuKQGH3yPkqzwDYOgt+6Ez3VH4ELOSoe76wTDGvpr6
 4iGA==
X-Gm-Message-State: APjAAAUZvGdjM1kUmYig2RrTWLZ4Ioq7H+EBFy1UcNavIs7ekVNAtHcF
 k6kHW2JMDW4NIaccWdwQHRp0ulDGHxD/ZswbCad4VQ==
X-Google-Smtp-Source: APXvYqwRuUo5+ZMpiEXFFcspfklbXiLGf521+JoOhvLS1bs/Vl6v+d/fRWLag/XA+sRi5nPTX8nifRtewZK3bw2qVtk=
X-Received: by 2002:a9d:5e11:: with SMTP id d17mr1871366oti.135.1567678605681; 
 Thu, 05 Sep 2019 03:16:45 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1567534653.git.jag.raman@oracle.com>
 <59cb496983f03b05f6da87af73bc2a2ac0bb7f81.1567534653.git.jag.raman@oracle.com>
In-Reply-To: <59cb496983f03b05f6da87af73bc2a2ac0bb7f81.1567534653.git.jag.raman@oracle.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Sep 2019 11:16:34 +0100
Message-ID: <CAFEAcA_-NpSSkDuN4ggHb5Loqen0xaxBNpoaadtexppFc2B-6Q@mail.gmail.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
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
Cc: elena.ufimtseva@oracle.com, Fam Zheng <fam@euphon.net>,
 john.g.johnson@oracle.com, QEMU Developers <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 kanth.ghatraju@oracle.com, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, konrad.wilk@oracle.com,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, liran.alon@oracle.com,
 Stefan Hajnoczi <stefanha@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Kevin Wolf <kwolf@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Ross Lagerwall <ross.lagerwall@citrix.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 3 Sep 2019 at 22:19, Jagannathan Raman <jag.raman@oracle.com> wrote:
>
> From: John G Johnson <john.g.johnson@oracle.com>
>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>  v2 -> v3:
>    - Updated with latest design of this project
>
>  docs/devel/qemu-multiprocess.txt | 627 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 627 insertions(+)
>  create mode 100644 docs/devel/qemu-multiprocess.txt

Hi; you can ignore this review comment until there's more
consensus on whether we want to take this patch series, but
new documents in docs/ should be in RST format and included
in the relevant contents page (here docs/devel/index.rst),
please.

thanks
-- PMM

