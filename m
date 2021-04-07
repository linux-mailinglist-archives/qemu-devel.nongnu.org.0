Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDEE357472
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 20:39:02 +0200 (CEST)
Received: from localhost ([::1]:59258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUD4v-0008Nw-2l
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 14:39:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lUD3R-0007nq-Eh
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 14:37:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21218)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lUD3O-0007IN-H0
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 14:37:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617820644;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h5nDwPlWGqfi+Yw7ER5eFUI9R87eG1GkeVtPF9LEyj0=;
 b=WjoMkwBcoJcEkSmxmTRZ+a1dD3PwPXgDMjg5tVS1WOl0VqmRWYsJf2ZXFb76CqYe88Ervy
 ilptitc26ao6cc3CpsCOcu/aMfOfYx7MSEF1xRvSDRjhasYvcm9bUMdjsJ3ewpITaCXSx7
 qZMWkYsjJ1V2aP0MXQUuPLhm7xcqq1Q=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-367-UYqrnS8zP7WJY2vCthS-CA-1; Wed, 07 Apr 2021 14:37:22 -0400
X-MC-Unique: UYqrnS8zP7WJY2vCthS-CA-1
Received: by mail-vk1-f200.google.com with SMTP id i65so6208911vkg.19
 for <qemu-devel@nongnu.org>; Wed, 07 Apr 2021 11:37:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=h5nDwPlWGqfi+Yw7ER5eFUI9R87eG1GkeVtPF9LEyj0=;
 b=mchWsbTpFtRrciXIDE73PxZZxx3KB5A7k8InqhChPmyxzYfrLf5Tca4j3H0iLVLYdF
 2nShtFnPjfW2NOM3EnKjoEPUyBBlPS6HG5morp5QW3bRf9hsJ//ZxwgyL8zznu0smVxE
 g0chNRPJ2WwLxUnj6zKDW44KLXYYdX/8zXq6X/827orZCZxAvm4LSYh4vJ2F7ZcSPPd7
 X2lzBIzefuR4TDR8KyTS+exYteDEVHGvLFL1Tyu0h0Fgb+wXCoU4m2V6REYOaMcUPSPL
 oUJWEifru0fNZ9T40lpoh+f1VQJFXz6UxnmTej/QLsoYekRto7wLigsc67I5f1Vff/Kj
 5ayA==
X-Gm-Message-State: AOAM533G0jT8gtWCaCLgc/XNzrQwY287uB9HY6w05LSmAwnEf3JWLGJ1
 D0fPSOwBW4PIc20LphsvM43eI3EmLZn0dOE+fMkVrefr+BbR6v5a6KYtZmlviCni3hTApwB1itt
 BxzEJQ8lFGlHadI/ebspYgKEHR4gr8Qw=
X-Received: by 2002:a05:6102:1085:: with SMTP id
 s5mr3473636vsr.45.1617820642506; 
 Wed, 07 Apr 2021 11:37:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw4q+/j4na5izsFDGVNbGAAdaxBsAdf4OGo/0ROwhg6ACe1ADjRtjdodaT/011kGsceIE6SkNJ3wiLMwjFPcUw=
X-Received: by 2002:a05:6102:1085:: with SMTP id
 s5mr3473628vsr.45.1617820642376; 
 Wed, 07 Apr 2021 11:37:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210407171637.777743-1-clg@kaod.org>
 <20210407171637.777743-13-clg@kaod.org>
In-Reply-To: <20210407171637.777743-13-clg@kaod.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 7 Apr 2021 15:36:56 -0300
Message-ID: <CAKJDGDaX1eF6ANC=PMKhGbLK+ChhTrLwX_qeRvhErcZw48Ksyw@mail.gmail.com>
Subject: Re: [PATCH 12/24] tests/acceptance: Test ast2600 machine
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 7, 2021 at 2:45 PM C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> From: Joel Stanley <joel@jms.id.au>
>
> This tests a Debian multi-soc arm32 Linux kernel on the AST2600 based
> Tacoma BMC machine.
>
> There is no root file system so the test terminates when boot reaches
> the stage where it attempts and fails to mount something.
>
> Cc: Cleber Rosa <crosa@redhat.com>
> Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Tested-by: C=C3=A9dric Le Goater <clg@kaod.org>
> [ clg : - removed comment
>         - removed ending self.vm.shutdown() ]
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Message-Id: <20210304123951.163411-3-joel@jms.id.au>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  tests/acceptance/boot_linux_console.py | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


