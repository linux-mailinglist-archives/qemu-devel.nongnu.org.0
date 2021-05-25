Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93852390426
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 16:39:31 +0200 (CEST)
Received: from localhost ([::1]:38704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llYDR-0000KT-M4
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 10:39:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1llYAF-0002cW-0h
 for qemu-devel@nongnu.org; Tue, 25 May 2021 10:36:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1llYAC-000485-H5
 for qemu-devel@nongnu.org; Tue, 25 May 2021 10:36:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621953367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XhiBNS7jpfIcsUg+mQKTO0ZrCuyUHqxYqIc7hiYmq78=;
 b=jRjtxAndz9ZL66aJVv7sJRDO+OWIKaYn6GLrUrZvFxriqoOmszANpCzt3l4agPqw01p6b0
 8SWVO+NutcIdFKrY7pbrzWf5b6NMSiNT3zcqULrhTSJVPWSU3Hu4eQPf1OpXs1zOTEcmfC
 rZbJj9BVENE2iBRBx7v/3kEeRh7zdq0=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-4H1ULzHjP1ir1kztzNbKsg-1; Tue, 25 May 2021 10:36:03 -0400
X-MC-Unique: 4H1ULzHjP1ir1kztzNbKsg-1
Received: by mail-ua1-f69.google.com with SMTP id
 b8-20020ab026c80000b029020f97f38cfcso12291855uap.3
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 07:36:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XhiBNS7jpfIcsUg+mQKTO0ZrCuyUHqxYqIc7hiYmq78=;
 b=CibEMzMPpWK8c+aZ4WZ6UxfnZj0SQhCr78jSytAWmSyspg+Yl+Sjztyj9iSFm2OWr4
 e9HCPFP51/lzfLSrrt4AQpFZisJYZf7EgCY8RgAZdWfnj4aljXn1Y8haojrvyqi6uiVz
 y5ZVkxxn2hfLLzrkY0nssH/l45AzVsuuB+j+vm4FSgaslF85PoPvl6jLUkepodgo58wY
 5UBylq9Cp6aA9OHuHJpTpgqdyzkAZFYEns8Khf1UYTZN93lDrK56Tx5NHp6C8bR+5Ig7
 2RtMKrZeeIUHcNPKjEycDfxDqBj4rCBtR6MxZG0RZ7CDg7z29h31NQlYba1nQ4MxCxuY
 5pNg==
X-Gm-Message-State: AOAM530rf/ujOEOdcXAiwHBZ9K0D0vuiInI3HBDOvJhKz+cKtABvtksI
 GMHNMD7cE6odznhvpUDeClSfvgfcmAoVVX6Ln6eY+mDepoAc5dFFIcQNBKE3p0K6SGHg+XOlmAc
 mw1vd2vv3wSFmQf5Id8Vyuq7naknhg4M=
X-Received: by 2002:ab0:3403:: with SMTP id z3mr28003282uap.113.1621953363320; 
 Tue, 25 May 2021 07:36:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyuooBVESBg+57NTIwfdjaUk4bPHy9nULb8WUTgNYccJbeDIQ7G8pN+BK7e8IubtF0D1HSzXEV7JdLPRUBSZ28=
X-Received: by 2002:ab0:3403:: with SMTP id z3mr28003253uap.113.1621953363180; 
 Tue, 25 May 2021 07:36:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210525082556.4011380-1-f4bug@amsat.org>
 <20210525082556.4011380-8-f4bug@amsat.org>
In-Reply-To: <20210525082556.4011380-8-f4bug@amsat.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Tue, 25 May 2021 11:35:37 -0300
Message-ID: <CAKJDGDZZqvLUq1hu_-S6VQepyvR_WKtFUqbMMZGN9zJhL3EkQQ@mail.gmail.com>
Subject: Re: [PATCH 7/9] gitlab-ci: Keep Avocado reports during 1 week
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 25, 2021 at 5:26 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Sometimes pull requests are merged during the week-end, triggering
> a CI pipeline. Currently if such pipeline fails, the Avocado reports
> are available for 2 days. For the reviewers working on the project
> during office hours, the reports are already discarded when they
> want to look at them. Increase this time to 1 week, which should
> give reviewers enough time.
>
> Only keep the reports on failure, which is the only case we'll
> look at them.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  .gitlab-ci.d/buildtest-template.yml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


