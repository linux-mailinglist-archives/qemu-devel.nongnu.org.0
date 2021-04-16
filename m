Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C30BB362471
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 17:52:17 +0200 (CEST)
Received: from localhost ([::1]:53588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXQlU-0003nN-Qo
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 11:52:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lXQgC-0000zv-4C
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 11:46:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lXQgA-0007PM-DR
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 11:46:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618588005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o1po51z8bPXpauZqduzSW/18YjFzDBBNX7n6ngU0MVk=;
 b=JI13gHE6GOkbclXUCN4U7tdLFSLrj0xwYAN5WlTZtFCUdKfipSQGWNE9vzdqHcBG7lR/xM
 x0NWnGawDnfDURorGs32Bo5ToJamIxRaGZarzicOcEU2VLxD+CjnklH5P8t7e32RrXkb07
 rpu0Ln4cYSpnrdWUgorh3siyQsLQ1Fs=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147-ecG6uRFiNnG7jKr6Pj2BMg-1; Fri, 16 Apr 2021 11:46:42 -0400
X-MC-Unique: ecG6uRFiNnG7jKr6Pj2BMg-1
Received: by mail-vs1-f69.google.com with SMTP id
 s21-20020a67c3950000b0290221d913183eso164201vsj.2
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 08:46:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=o1po51z8bPXpauZqduzSW/18YjFzDBBNX7n6ngU0MVk=;
 b=GbnBDdykmkV56NM1znJFNgzfMYyQ2GZOYcl01LKLIP3ff0yWO2hSVDx8WYcLr5zMmk
 5KAtGuktSpGF6nTQJTpjxnPNmnyWz13mEjK+pGf8CR9MijYphF6+laKOIo/OLBsRchh5
 no2JcjuTL26bcjBi1xKEDe9nef4HKEeiBZZdgv1CPiioNwhhUPz58ea9DWV4SMlwzJxt
 vN17A6vlIoAgGv688ZdpumUnZhSDQmfWqXsClHQ1edENhaKnv+z++uum9+Twz3dnWCC3
 b80vEVk6TRbhp1sZvT8VoQilH5/TrfbEtn83aWq7FdRVtic6zx0RMcM23J7lB1gTGXm6
 YKwQ==
X-Gm-Message-State: AOAM531sTlBwC2VAKo2Wx9YZFJkEAKsaMbQ7C1A7Q882QHq5J93Fobzz
 bwNMrPF+ZI74ArnjEvpCmF/HZXyRZuLv6y8gnQhvK2sGnNNa4yGFQYirDgANQ3KRnJZ80LoN+1m
 6o3seNFatd+Nwou/1DsKaIqtgOKarghc=
X-Received: by 2002:a67:1744:: with SMTP id 65mr7340006vsx.50.1618588002001;
 Fri, 16 Apr 2021 08:46:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyI3Ach3lTzgNBmOashI/rxNfnF4JtZpW+XaBNWWs60kHt+mHwxwcElxnKufihxemKp/uJD+bvVPeUvEWJjBho=
X-Received: by 2002:a67:1744:: with SMTP id 65mr7339991vsx.50.1618588001864;
 Fri, 16 Apr 2021 08:46:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210415215141.1865467-1-crosa@redhat.com>
 <20210415215141.1865467-4-crosa@redhat.com>
 <229a10ef-b912-2191-c670-a2c74a0870a4@amsat.org>
In-Reply-To: <229a10ef-b912-2191-c670-a2c74a0870a4@amsat.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 16 Apr 2021 12:46:15 -0300
Message-ID: <CAKJDGDbF+dYktY3ZTP2UXGeiCypE+by7fBcmyYch7GsN+Ob4iQ@mail.gmail.com>
Subject: Re: [PATCH 3/8] tests/acceptance/linux_ssh_mips_malta.py: drop
 identical setUp
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Beraldo Leal <bleal@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Auger Eric <eric.auger@redhat.com>,
 "open list:S390 Virtio-ccw" <qemu-s390x@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 16, 2021 at 2:26 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> On 4/15/21 11:51 PM, Cleber Rosa wrote:
> > These tests' setUp do not do anything beyong what their base class do.
> > And while they do decorate the setUp() we can decorate the classes
> > instead, so no functionality is lost here.
>
> This is what I did first when adding this test, but it was not working,
> so I had to duplicate it to each method. Did something change so now
> this is possible?
>

If your attempt was made prior
https://github.com/avocado-framework/avocado/pull/3570, or with a
version that did not have this fix, this, indeed, wasn't working.


