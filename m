Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A00E3E026C
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 15:50:58 +0200 (CEST)
Received: from localhost ([::1]:42588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBHIM-0006Jb-Ut
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 09:50:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mBHHV-0005dh-SW
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 09:50:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mBHHU-000291-1a
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 09:50:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628084998;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L2oWkSjACNn31x85OCgggSSdL/JTvW/CQ40b43cQCSw=;
 b=RG44lFxr0CISHClai67IWO+CXK9mnDVbCf41wBoTms6YNeWcg9eRXnI+YKpPrPDHevoxOh
 EGTW2BPl9SoiKmj2ANTKn9HeqzllJDSdDsNGlCNZ08n8gV7HGlCfWY3MqLdYpWWfVZrt5m
 zDwxB9TOIVUgdQT2DfsA8mQEZWD1N+M=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-450-tgAigz8QOy2HilnPL84P8Q-1; Wed, 04 Aug 2021 09:49:56 -0400
X-MC-Unique: tgAigz8QOy2HilnPL84P8Q-1
Received: by mail-pj1-f71.google.com with SMTP id
 f62-20020a17090a28c4b02901733dbfa29cso6614811pjd.0
 for <qemu-devel@nongnu.org>; Wed, 04 Aug 2021 06:49:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=L2oWkSjACNn31x85OCgggSSdL/JTvW/CQ40b43cQCSw=;
 b=VQptzhp/Xh7ZlPBiZUgNncKXWLSZP1cOA4Ui/eR9kh5kFqXAak7Zp1bWN2evb6rf/i
 bez3KujUPJwYtXmwXJK21Z4ksAnscJq34jlkaD6swdIPvkFZlrcPCyOqEpUy8wREGaNz
 QTA/mQXcB2fcN1aBjvFVP5jpbQHx7QKDIGTeCXbpHcsgiyQlVhkQekq4pKdP7h1tOsje
 mZbV39vv6CWAVeeDPRIqkq7EFRU2/4du2EB04NEHlZvkDfkKwLaXMWd5WEfZsCAcMsAk
 U9cZRkrogswGXKkIljAq2lwOls4/h6zypJETbcIpwBjnUnJfHou54tfHWbB1FU5FLoZ2
 stcA==
X-Gm-Message-State: AOAM533cFFeWDZW5K5i++Kj15rNpahERx/06sdS6JajeJaHVZ4y4Lhu5
 F++XYbPiymyazVDgdG+zwKogUFOELCHipJdPsU8D+1aQhl1EZD0keAqa6d5ap64y5mqSiqWKyi3
 90V8Xx9k7Qy50mnmfmEILLImQ+QLyLxo=
X-Received: by 2002:a17:90b:1c8e:: with SMTP id
 oo14mr9970822pjb.108.1628084995679; 
 Wed, 04 Aug 2021 06:49:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJytDYMw6oOafjiZOko33JfHqoRorX/Phpkds3imlm/ssVR0CD45hXB/ZzAD0XazVfSpF+Zq5dGm3ndNb9pagKo=
X-Received: by 2002:a17:90b:1c8e:: with SMTP id
 oo14mr9970800pjb.108.1628084995459; 
 Wed, 04 Aug 2021 06:49:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210803193447.3946219-1-crosa@redhat.com>
 <20210803193447.3946219-3-crosa@redhat.com>
 <CAKJDGDYPqySobBWrRyU=0NaSnRQp5voFQHDFoDUbkoAb21fkfQ@mail.gmail.com>
 <352cfbf4-4162-8863-a544-51ff04032d7b@redhat.com>
In-Reply-To: <352cfbf4-4162-8863-a544-51ff04032d7b@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 4 Aug 2021 10:49:29 -0300
Message-ID: <CAKJDGDaQTsFEJqgx3Mr8BDcX+U8BpHaXB5pX49GpHYbcgb_MkQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] Acceptance Tests: updates to the MAINTAINERS file
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Auger Eric <eric.auger@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 4, 2021 at 6:45 AM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om> wrote:
>
> On 8/3/21 10:09 PM, Willian Rampazzo wrote:
> > On Tue, Aug 3, 2021 at 4:35 PM Cleber Rosa <crosa@redhat.com> wrote:
> >>
> >> The tests/acceptance directory is currently lacking a maintainer
> >> entry, even though I've been performing that role (of course with help
> >> from many others).  Thus, its status is, even more now, Maintained.
> >>
> >> This also removes the currently broken Trello board link, which was
> >> make unavailable unintentionally by a third party.
> >>
> >> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> >> ---
> >>  MAINTAINERS | 6 +++---
> >>  1 file changed, 3 insertions(+), 3 deletions(-)
> >>
> >
> > Reviewed-by: Willian Rampazzo <willianr@redhat.com>
>
> Willian you could send an extra patch to add yourself a R: tag.

Ack!


