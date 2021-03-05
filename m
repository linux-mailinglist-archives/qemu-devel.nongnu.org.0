Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F77032F409
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 20:38:52 +0100 (CET)
Received: from localhost ([::1]:42596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIGHi-0004Bt-S4
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 14:38:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lIGGb-0003lp-Hz
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 14:37:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lIGGX-0008K0-Bq
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 14:37:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614973055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SdLiuiiSPnRRo3hVfr2pX0YblC2gOQKNMsAJtaqbAl4=;
 b=iqu4+3vKy63N9WivCux/K917W92WwX/O2sR7qowV1Tb9fxPoZePrR/DbRATdvTYsxkcvpA
 hw3Nc5r93OFCjouakVJ4oLDy54T/ht3UFNXYpvYWvZXDG4zmlvt5ZeFgzRCXoagLoUK26g
 pw94CpKzHwWM732hm6HT6kCDqDOvoLw=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-511-XKpb4xx0NdSqe35T3soZWw-1; Fri, 05 Mar 2021 14:37:32 -0500
X-MC-Unique: XKpb4xx0NdSqe35T3soZWw-1
Received: by mail-vk1-f198.google.com with SMTP id x190so962346vkd.12
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 11:37:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SdLiuiiSPnRRo3hVfr2pX0YblC2gOQKNMsAJtaqbAl4=;
 b=efDl3L5m9pSIeLcxN75upq78FUB1pbCMOQ74KhoZe4xGzXjiwEuiY2pDUIrivt8F0P
 x3csV0nm0f8y5WyVjwVAPdjfSz4VZfLUpZq6UJOVnbP0irccolRjkl4Fobl2FsOmKkZP
 tsvvaqAbhKJNagJUkZwnnDf7LI7B2fTtcYWRs1xi+y9nI7HJqAkAWsY9Hr/nS4JJ+wMX
 JZlI5HAKSvFv21cwu5xr+uH3wDWSzh2CH55UFBQ8dGcmjPN0s1ydi4Fkcewjp4k0Lz3W
 wi9DSNiabtnAGmopKIDfiLgwyC1iec17UOmiNE6MlX4dTzve4IqRkupAdXOm0QvfKXZ8
 RqkQ==
X-Gm-Message-State: AOAM533iyAoMjkbRF2quqE1IzAsatz2a/HaViLUxIw3Fi/GhXOrwewNa
 /5tqcCQRvmXmT0PExZhuj5A5oUe9ag9CGJTCftQBkGSycdw4sTXEpKmjInkuu1GSWqkhRPEDbwr
 nyQbksAZJj4KGAbri+abxNYxjUNCDWqM=
X-Received: by 2002:a1f:abcf:: with SMTP id u198mr8155782vke.19.1614973052391; 
 Fri, 05 Mar 2021 11:37:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyj5tyPLq2Q3wO+AzHgxy9ipZgXskkCMT8dcTNMBWrarzvdeAsC36wla4clvpqHqFPuS3g546Fupc3UNdq/7eI=
X-Received: by 2002:a1f:abcf:: with SMTP id u198mr8155766vke.19.1614973052220; 
 Fri, 05 Mar 2021 11:37:32 -0800 (PST)
MIME-Version: 1.0
References: <20210305092328.31792-1-alex.bennee@linaro.org>
In-Reply-To: <20210305092328.31792-1-alex.bennee@linaro.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 5 Mar 2021 16:37:06 -0300
Message-ID: <CAKJDGDboytn0H7fQfHZEbuUkfoB+GaTqwU9FcASnxoQECAom4Q@mail.gmail.com>
Subject: Re: [PATCH v1 0/9] testing/next (docs, hexagon, cfi, docker)
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
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Daniel Berrange <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa Junior <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 5, 2021 at 6:31 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>
> Hi,
>
> Another week another testing/next roll. The series includes a couple
> of my proposed documentation tweaks (including the re-org of the devel
> manual). We also enable testing for the hexagon linux-user target to
> avoid bitrot. I've documented the process for manually updating the
> registry at:
>
>  https://wiki.qemu.org/Testing/DockerBuild#The_GitLab_Registry
>

I see a mix of valid/invalid URLs, like `registry.gitlab.example.com`
and then `registry.gitlab.com`. For consistency, my suggestion is to
use either the example URL or a valid URL mentioning that is an
example for a specific docker image.


