Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23143369896
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 19:41:59 +0200 (CEST)
Received: from localhost ([::1]:42320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZzoU-0002Jm-7p
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 13:41:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lZzl0-00018h-0Q
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 13:38:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lZzkw-0005wL-Hd
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 13:38:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619199498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PRIp+18eM6rWXuHmW2XDhgi9uzuq5wJcJ0aoVZcyBdQ=;
 b=AZ/JkzqsstAaJdTshrWJvZzjWoZgEJ5IVsASaLoPIV4qRTbsxbbvBdOJZp3XjefmBZyYLR
 498yrr9jMjXsLm5t1aN1hUGg7hZGqU/LC5pxt6SiEnNzb7Jws6iRpLjSAtJfoqQE90kkVd
 27NMlRmSUUTzmsB612+PCKWQf1DYc8w=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-125-FwqU1JiiPruu-bEC0P3YRg-1; Fri, 23 Apr 2021 13:38:02 -0400
X-MC-Unique: FwqU1JiiPruu-bEC0P3YRg-1
Received: by mail-vs1-f72.google.com with SMTP id
 w17-20020a67d1910000b029021d2b42b93fso7547468vsi.1
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 10:38:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PRIp+18eM6rWXuHmW2XDhgi9uzuq5wJcJ0aoVZcyBdQ=;
 b=tWC63wY7o+VMAFXrVwAoNiNAgzSCuXEcyP6XlXUdn8+oDqwY+xDnRjUtMtGa5eaYtq
 3OueAr4/maT7kjjxU2iRX/FEoQZW9mMgu2v8sN+iej9ShBFH64IPWsGTmdip7LIfn7St
 ebFVZhTfv85Wfs637vlo+z7eysr0XgGdO5BBNl+dYKAEz70TBCO6j3NvJ0GynMg07VTB
 0dEoHFjQXOjmpoNxJD3Wso5Ijx8AFWfowzNQPGNNcFIss8Hot1lcykPwa2nvi2ecFVfQ
 BAJ97oCbie04GoOSzIcLwTZEW/1W/08o281ZU2JkF5pdDL6qlnFOiuf7y8XgiHu5zm2Y
 qh7w==
X-Gm-Message-State: AOAM532tm+B5evGaQzixplxFK9qA8T/Z3ovzzZhTkjz6I47yH+YJ/Nrm
 6RKfsP/DTfOVpG7qYT3I5LTPdphHeB5ufPH1gCOZyFogYLNm+yw7Eky4vFOHCXgAFcxpdcnY9Xz
 8vNqdqkqxSyE/Q/yZsKi7NIRTDsrR5B4=
X-Received: by 2002:a05:6122:2ad:: with SMTP id
 13mr4799204vkq.11.1619199482082; 
 Fri, 23 Apr 2021 10:38:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/fs1zuxbpW6dC2Hux6wVbhKZMB178bovobsIV+RRuP3bKn69S329zvutivW0pp0Lu36ASWNHlws53Bapf8wk=
X-Received: by 2002:a05:6122:2ad:: with SMTP id
 13mr4799183vkq.11.1619199481954; 
 Fri, 23 Apr 2021 10:38:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210419145435.14083-1-alex.bennee@linaro.org>
 <20210419145435.14083-4-alex.bennee@linaro.org>
In-Reply-To: <20210419145435.14083-4-alex.bennee@linaro.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 23 Apr 2021 14:37:35 -0300
Message-ID: <CAKJDGDbO07V=NBvL4VYSvL2EYamY5NPMFfN4UU_5A5ndAZoVmA@mail.gmail.com>
Subject: Re: [PATCH v1 03/25] tests/docker: make executable an optional
 argument to "update"
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa Junior <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Apr 19, 2021 at 11:54 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
>
> We're going to extend the abilities of the command shortly.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> ---
> v2
>   - fix indention issue
> ---
>  tests/docker/Makefile.include |  2 +-
>  tests/docker/docker.py        | 56 ++++++++++++++++++-----------------
>  2 files changed, 30 insertions(+), 28 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


