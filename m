Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB7136982C
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 19:19:52 +0200 (CEST)
Received: from localhost ([::1]:53926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZzT5-0002cZ-Nm
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 13:19:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lZzS9-0002Ce-E1
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 13:18:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lZzS6-0005ka-Rw
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 13:18:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619198328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ka39FUwo2gNimSBwk62AjhNVfuVKuAW77RqhQaSjljc=;
 b=B/6OLLbvQNZBR7CV2J4mlqBUY5DJi306P5Ow/RzwwZmkHcbpdbrA/qzw4rJPhtAEZghMFI
 ndavht4R6wuZj1RKzbEgcPQu0wZr2FHoP6vmWIpqQjvLtf1KcCKwHWY1jXD9msgorwIWsl
 /6zXSiDej21zsnxHtwQCyinj7Nt2SuQ=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-srAhv_MJP9G8kV6Lx9rtqw-1; Fri, 23 Apr 2021 13:18:47 -0400
X-MC-Unique: srAhv_MJP9G8kV6Lx9rtqw-1
Received: by mail-vs1-f70.google.com with SMTP id
 3-20020a6717030000b029016d08542c7dso8445182vsx.14
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 10:18:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ka39FUwo2gNimSBwk62AjhNVfuVKuAW77RqhQaSjljc=;
 b=A0P5fEQXfE5RxBLG8Hh8bJ8tGb+bZgx0073t6xx+HN4kscuph1fFKZnVaNwiePYF80
 s9pZpXBWghfZtMDLi8zZUz8n/b1a/iLlMG6uUkatmvGo/4O7CaTAjZRgmAGE8gvN8aJq
 INmJVRRhNEHUPewhdh1sp4vZM7B5I0AxEYCifEyq9GHN3BoDWN/K43urEz/87CAJYJaL
 tckeCuDe+gWsEVWzktk/9vFEBAF5sR/Yw1yuIpyNfvH73Dkfop2RdrGjn+vq2Bt37aMa
 vpDX83y5MdkIPBHLKhGbT95cZLEIOUgnBCdxs6MvPKtLAgfyP9EpFp/plg9WbqL0r0cE
 F25w==
X-Gm-Message-State: AOAM531mw2Sh3GGGFWCun93MwKmr/MIQ/gW3etzETjAvUG+S4je118G0
 sLQG/TRh9NMx+WmCWRNjyZ8BiZgPZASbp+0uPvpLurx9CqQ52ToU5pVgmSKj4G5J5R7W226s/2Q
 0lu2cLeTTBn4QKJ7dia9hiNnkE24auqM=
X-Received: by 2002:ab0:664f:: with SMTP id b15mr4411836uaq.110.1619198326365; 
 Fri, 23 Apr 2021 10:18:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxSL3aelIuMPfMHF18Kzjlmt7z/4ygtyMw4L6IotAW7pCLMMa7Q34r6BN/Uc45PNXfXTqGMCdCc+iICBn9cexg=
X-Received: by 2002:ab0:664f:: with SMTP id b15mr4411788uaq.110.1619198326024; 
 Fri, 23 Apr 2021 10:18:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210418233448.1267991-1-f4bug@amsat.org>
 <20210418233448.1267991-6-f4bug@amsat.org>
 <461d2524-b7a3-9a77-7dbf-64eadd8ba494@redhat.com>
In-Reply-To: <461d2524-b7a3-9a77-7dbf-64eadd8ba494@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 23 Apr 2021 14:18:20 -0300
Message-ID: <CAKJDGDZzo7SJC3sYvzRbvdjTR1b6VOmLJXW8d5esAp1=XUuTqg@mail.gmail.com>
Subject: Re: [PATCH 05/15] gitlab-ci: Rename acceptance_test_job ->
 integration_test_job
To: Thomas Huth <thuth@redhat.com>
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
Cc: =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Erik Skultety <eskultet@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>,
 Miroslav Rezanina <mrezanin@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Apr 19, 2021 at 2:19 AM Thomas Huth <thuth@redhat.com> wrote:
>
> On 19/04/2021 01.34, Philippe Mathieu-Daud=C3=A9 wrote:
> > From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> >
> > The acceptance tests aren't accepting anything,
> > rename them as integration tests.
> >
> > Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> > Reviewed-by: Willian Rampazzo <willianr@redhat.com>
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> > ---
> >   .gitlab-ci.yml | 20 ++++++++++----------
> >   1 file changed, 10 insertions(+), 10 deletions(-)
>
> Acked-by: Thomas Huth <thuth@redhat.com>
>
> FWIW, I'm in favour of renaming the tests/acceptance directory to
> tests/integration , too.
>

For the sake of consistency, +1 here.


