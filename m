Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A6C40975B
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 17:32:19 +0200 (CEST)
Received: from localhost ([::1]:55596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPnwQ-0002ZO-Ho
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 11:32:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mPntf-0000Ap-UV
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 11:29:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mPnte-0003HB-As
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 11:29:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631546965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=90HDSNZLmXQqnw1IbLB3QIX+8dhd99dn4RPDZ8MOuIE=;
 b=L5XofExEITBxLt1ihJNfiIkop/ndCI2pIAuR2lo1MR2HLuVYsXS66/XPK92AVy0ir55Sh9
 XMfPfKTIp6dzxGRHJVv2omEI58+DUzGmNZw7n5/v5rRscwCHuZyGTTN9qBTV2tS718taKk
 3k7A9XEJXW+Vy8ur5q67fY4KX+MumSg=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-415-mkomKHtQOgGsGk23E-Xvpw-1; Mon, 13 Sep 2021 11:29:23 -0400
X-MC-Unique: mkomKHtQOgGsGk23E-Xvpw-1
Received: by mail-pg1-f198.google.com with SMTP id
 w5-20020a654105000000b002692534afceso7577685pgp.8
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 08:29:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=90HDSNZLmXQqnw1IbLB3QIX+8dhd99dn4RPDZ8MOuIE=;
 b=UsJOdT7e9fyRWdug6/DOD43F3iQyTDSJMU9+kEIG9n6xwTFpptT6EWm2MxlfCSNHK+
 kEtic6s9PMN/rxXjvHOx1gcZS70hWyisUAoG+YUwapepdkJfXfzeGYnR+GjGpWI5CB/i
 +av62l1LhjFYPH26vGL3g0TgZwwZLHjFi3p5Ar2TdW1q47wg7E1hCTQ++adPFKchxDDk
 9CPq4VUUy9iKqEccJXV6uJ90qj72CR6Pqrgiqre5MJaKfUGmapG8HJ7UfTRD8Qg0RELT
 jz1aiXjV0hUYPymRnOnwfSnb9HLVVpgPYuBFq6iEi/s/Iy7NppELnWpRaXfmdu2dlzRw
 k3rQ==
X-Gm-Message-State: AOAM532e0ZL/du0ovSaspf09CNfeE/LQ4dtcoV2dryNawAwcSvVIJRyc
 Sah9c5GR/2VX3c8Zxf94xkuHseQMeIqVEhJ1Stwz06nyprEu8+L5BaTdaiwNCQk9wzs8Zve522D
 mJunO+I9G3rICeiwGnuNxM40sWbLvQdA=
X-Received: by 2002:a65:47cd:: with SMTP id f13mr11724043pgs.439.1631546962760; 
 Mon, 13 Sep 2021 08:29:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwxHBtXnozwzyG23CQ3Tfo/GZKFzrbiI4QJB00FgY2JxvCidVUk3Ud6cqOW9xRx0xIqBMERlXodGgYXxTe+sjo=
X-Received: by 2002:a65:47cd:: with SMTP id f13mr11724017pgs.439.1631546962401; 
 Mon, 13 Sep 2021 08:29:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210913101948.12600-1-peter.maydell@linaro.org>
In-Reply-To: <20210913101948.12600-1-peter.maydell@linaro.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 13 Sep 2021 12:28:56 -0300
Message-ID: <CAKJDGDbw6jO-mrby9LLHADYyBw0-w8c+ZR36qt48A7wheRZRSA@mail.gmail.com>
Subject: Re: [PATCH] gitlab-ci: Make more custom runner jobs manual, and don't
 allow failure
To: Peter Maydell <peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
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
Cc: Thomas Huth <thuth@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 13, 2021 at 7:22 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Currently we define a lot of jobs for our custom runners:
> for both aarch64 and s390x we have
>  - all-linux-static
>  - all
>  - alldbg
>  - clang (manual)
>  - tci
>  - notcg (manual)
>
> This is overkill.  The main reason to run on these hosts is to get
> coverage for the host architecture; we can leave the handling of
> differences like debug vs non-debug to the x86 CI jobs.
>
> The jobs are also generally running OK; they occasionally fail due to
> timeouts, which is likely because we're overloading the machine by
> asking it to run 4 CI jobs at once plus the ad-hoc CI.
>
> Remove the 'allow_failure' tag from all these jobs, and switch the
> s390x-alldbg, aarch64-all, s390x-tci and aarch64-tci jobs to manual.
> This will let us make the switch for s390x and aarch64 hosts from
> the ad-hoc CI to gitlab.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  .gitlab-ci.d/custom-runners.yml | 20 ++++++++------------
>  1 file changed, 8 insertions(+), 12 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


