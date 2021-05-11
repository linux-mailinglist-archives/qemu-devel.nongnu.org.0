Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F3337B04F
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 22:50:05 +0200 (CEST)
Received: from localhost ([::1]:57156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgZKO-0007e8-DP
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 16:50:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lgZJY-0006y3-4a
 for qemu-devel@nongnu.org; Tue, 11 May 2021 16:49:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lgZJV-000136-Lf
 for qemu-devel@nongnu.org; Tue, 11 May 2021 16:49:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620766148;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p83mLgP02YbOps3oo8QSR9UTbCwUvl9EVeo0j1Lmcng=;
 b=eDcAsHymrY/6Y0P+aRgxaQ2AEDwNpW9Ka39qNU1Ke9DURQqyDhAiqOPCObjJ82KfUzf0X1
 3XJ7HNz+U5MGHgjNj7fc48su022gE3grVyDPLGho16Ety4RJ9FdOYIQYa3vaAPMhBFdE4g
 Nyy57SMs8GPwW1oS6VEijofdXp+61b0=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152--SmEaH5eO_6OKeRoNyd8RA-1; Tue, 11 May 2021 16:49:06 -0400
X-MC-Unique: -SmEaH5eO_6OKeRoNyd8RA-1
Received: by mail-vs1-f70.google.com with SMTP id
 z21-20020a67d2950000b02902271a3918c4so10142438vsi.20
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 13:49:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=p83mLgP02YbOps3oo8QSR9UTbCwUvl9EVeo0j1Lmcng=;
 b=XwEcMBQS3l2s5O3IH28SZ8C8MO4vx/IgJNXAD278UNLx+KzLWdWhutHN9wo3lGl4pY
 v0W/dp5diW5xAZjFsZFRDjf01HOFlJ3ln5594HJEWdz0Cd4camLliec33WOv0T48E2Xq
 owMY0/sFFM7sZ4pPJVa8O1WHlwkBAC3PWdWAlu6IsGEngzjZUQ0JxihB9KGrbNX/E1vl
 iSBrLmvlO0Vp6eF0hiWHeBG3bFGZsXGGibZA2sRyqTrrlL6Chf5vh+3nbBGPakqoXYY6
 08SvHdgLFcA67YwM9tCcSbE4b7Z97ocQ+LyD9XcCTKdRtdNiWnyjn01jH/zU5REfK+2b
 Guhg==
X-Gm-Message-State: AOAM530v2kWBTl+eOpPcOOCr4WK2LVr5nNbRlP7SzeWi5AXjI1RgwM6r
 ToSKY7rTPpJzYJjsiVhvsNjBW7aZ139gIeut2BuBk11pEaEY/yhIeN8DCRtG1DJdg4rv1fhmk7u
 OYMBlqJsleHkeFfnTgbm6sT5JqtY1n2Q=
X-Received: by 2002:ab0:3403:: with SMTP id z3mr28328604uap.113.1620766146183; 
 Tue, 11 May 2021 13:49:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzKgMYUQe0p/ilxt5z+rmjYRpiCjoiX2rN4TJPd0u6xUO4J8S9shf4BrzYGJTo2apolkCtzuSjDLCbgujxnjeQ=
X-Received: by 2002:ab0:3403:: with SMTP id z3mr28328591uap.113.1620766146059; 
 Tue, 11 May 2021 13:49:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210511072952.2813358-1-f4bug@amsat.org>
 <20210511072952.2813358-11-f4bug@amsat.org>
In-Reply-To: <20210511072952.2813358-11-f4bug@amsat.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Tue, 11 May 2021 17:48:40 -0300
Message-ID: <CAKJDGDaLRsHm5CwuTynEjtqKuT=Tu5s9UEnBZN0=oqcm48kA-Q@mail.gmail.com>
Subject: Re: [PATCH v2 10/10] gitlab-ci: Move current job set to
 qemu-project.yml
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 11, 2021 at 4:30 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> To allow forks to easily decide which jobs they want to run,
> but without disrupting the current default, move the current
> set of jobs to a new file corresponding to the jobs run by
> the mainstream project CI:
> https://gitlab.com/qemu-project/qemu/-/pipelines
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  .gitlab-ci.d/qemu-project.yml | 11 +++++++++++
>  .gitlab-ci.yml                |  8 +-------
>  2 files changed, 12 insertions(+), 7 deletions(-)
>  create mode 100644 .gitlab-ci.d/qemu-project.yml
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


