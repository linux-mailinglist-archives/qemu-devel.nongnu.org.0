Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 966293DF61E
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 22:11:11 +0200 (CEST)
Received: from localhost ([::1]:35550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mB0ko-0000yW-Ms
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 16:11:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mB0jm-0000FX-Bb
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 16:10:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mB0jk-0002TK-Sp
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 16:10:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628021404;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bl3KXFWCT04e7mb78QzaGD3/2hQu3gFvK4tXQD68Ji8=;
 b=EKVg6q1jBtQUjznDjpQUuQKTymhaQwpiZ6gnCQXS/LEvVdnJWl23K0MbVJqt5KrQJzi1CD
 Gwj9GSlPR23Bvecx5Dyz8MRjBopdUT+ocxvCpii7vmOUWMeVkk40YKKfOS2tPtnHbCvwgb
 QvPaGZD7TDxPOQVzyXZoDwLMXPZ6NPQ=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-28-16n7oaH1Ny2Ntpuoo35_6g-1; Tue, 03 Aug 2021 16:10:03 -0400
X-MC-Unique: 16n7oaH1Ny2Ntpuoo35_6g-1
Received: by mail-pj1-f70.google.com with SMTP id
 o13-20020a17090a9f8db0290177972c9adeso12120813pjp.5
 for <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 13:10:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bl3KXFWCT04e7mb78QzaGD3/2hQu3gFvK4tXQD68Ji8=;
 b=OrIZG1DKcMRD0uoiujjL2h0sWQ8Omf4/t+dFmy1nUFNvf9SOvDXr+Tdq3msYUxC9jD
 bYJJXPEDcBWKysy5aRcRo+DEXnzd6FJCmQuICiJtyQxkxF90jQQDN16QFOWbG15KDEqt
 cuqahFEUF5nNVhPGufYdLOf5kr8mtNKLsm6hIbmcmV+1OXn6Cb0K5aPsx4qAv4tOvEtP
 z0YGbYjvugHP+J9bRuF/ZDFb+O36XxKMmVFOGSvrvAnesCcgRSrFKEjlyu6X2Clg+pFy
 q/m4cpbNxirMhaJdzX58k62kXfGOI/ViyyqGMA6FUImhW+3zPs8V7kI2VEQRDO4PkFYt
 x3tQ==
X-Gm-Message-State: AOAM530GBJ9GRlwXxbXyS5/tFiAi9DJVYvuZQAp91SLtdb9HuzFowusa
 PQGjLET96wQC17h4+KjBGVzxfGPtcpcwAVuzZ8HYBKkQPvHn5rFIfWq3iqXkOY16POo0WE6ebpl
 0dmFfcwxmgploejfQ0c+DYhvdexzYZcQ=
X-Received: by 2002:a17:90a:7789:: with SMTP id
 v9mr25478492pjk.159.1628021402084; 
 Tue, 03 Aug 2021 13:10:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZ3UZrp6tDFI/LwLEJhQxgFXCZpy05gEwDq7p8im0QmTP6IyYRpe5cHEYXA3lOOFJ7HlMWpV8FdWmtnbSKCW8=
X-Received: by 2002:a17:90a:7789:: with SMTP id
 v9mr25478470pjk.159.1628021401892; 
 Tue, 03 Aug 2021 13:10:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210803193447.3946219-1-crosa@redhat.com>
 <20210803193447.3946219-3-crosa@redhat.com>
In-Reply-To: <20210803193447.3946219-3-crosa@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Tue, 3 Aug 2021 17:09:35 -0300
Message-ID: <CAKJDGDYPqySobBWrRyU=0NaSnRQp5voFQHDFoDUbkoAb21fkfQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] Acceptance Tests: updates to the MAINTAINERS file
To: Cleber Rosa <crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Auger Eric <eric.auger@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 3, 2021 at 4:35 PM Cleber Rosa <crosa@redhat.com> wrote:
>
> The tests/acceptance directory is currently lacking a maintainer
> entry, even though I've been performing that role (of course with help
> from many others).  Thus, its status is, even more now, Maintained.
>
> This also removes the currently broken Trello board link, which was
> make unavailable unintentionally by a third party.
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  MAINTAINERS | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


