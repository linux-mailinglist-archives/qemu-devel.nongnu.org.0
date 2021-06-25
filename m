Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BD13B48DB
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 20:38:54 +0200 (CEST)
Received: from localhost ([::1]:38960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwqj7-0007vC-V4
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 14:38:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lwqhs-00065G-Dt
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 14:37:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28185)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lwqhq-0007N6-AX
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 14:37:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624646253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4IM0JUqAz1hYAOY5HMG17Pw/NKvFD4/uI59hFsCjpsI=;
 b=QPwXrj4vdnDQ49Nci4jC3G3MVF+HgvkGV/dvy1NsjhLyyN9KK1BHPbTJ8yqZuTIdNXeM4f
 /32FIi4XGDgBqd1BsqI3HmBeSjoopHNIn8zDXPSqvddsfDeWMQ446NEVcEg+rz4QMe/8Fl
 wfCbgfiGtzfG88cvrl/APlVUR7Qb1LY=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-06-0J0XlODa7GhKY2gY_Gg-1; Fri, 25 Jun 2021 14:37:32 -0400
X-MC-Unique: 06-0J0XlODa7GhKY2gY_Gg-1
Received: by mail-vs1-f69.google.com with SMTP id
 s8-20020a0561023008b0290265187f0057so2525792vsa.2
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 11:37:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4IM0JUqAz1hYAOY5HMG17Pw/NKvFD4/uI59hFsCjpsI=;
 b=f3gICEh/KtOW4KSnfyqXjNKMpbj3NyHl66QCgM2FVtKFXAD5PCGsRmizj9mvVYvHFf
 vlRcE4GNUJ8pqsbqu7caK7EbrCYvJDs11+Ksf0+ZpVymgQcv2ALm4YJCBpx65wrjmkVS
 z0TFvSjo+GBr+tzAzwiX6CB1wWFfNugJ008DZy49NZUpIh62E/h6N0Qrx0VepAD6L2Ne
 C7zNuQ8tMmI6QII/CluAkug1EBWzIYIXK0h41E/UxoZVEE89eVPK3KajMvyKK5yWe5ZA
 H8bZixv8f+djLPNdmdIvc17tMnVQi0HTxWhTpJCGwtIUy4zsqXApzPXJEoWqtxaDUpEg
 Mqdg==
X-Gm-Message-State: AOAM531X+NZ3FFr40BbwINd+rX2N4cGg5GsG1XXgk+2J+JI2mGT5tNGO
 StQ2RAvhkikqqhYg/lCwrgj7sWA9vEQX1fNaeeK69Wzq869U8lIwxOID+D5bHkpuwQor9FZB9Zl
 VXNsUXXJkWvCDCnTsqrvXh7VpNE03/lA=
X-Received: by 2002:ab0:7642:: with SMTP id s2mr13216999uaq.133.1624646251827; 
 Fri, 25 Jun 2021 11:37:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwtE5PE9cmC/9weQJuS2wlQwna3KW0lxkVaS11RCdF7pt8S6k4OVPrZKpYIwqULhmGUmZMgwG7ldE8rhdmL+XA=
X-Received: by 2002:ab0:7642:: with SMTP id s2mr13216980uaq.133.1624646251718; 
 Fri, 25 Jun 2021 11:37:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210625154540.783306-1-jsnow@redhat.com>
 <20210625154540.783306-10-jsnow@redhat.com>
In-Reply-To: <20210625154540.783306-10-jsnow@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 25 Jun 2021 15:37:05 -0300
Message-ID: <CAKJDGDZ64T2t=8srxOFEyDzNGgneL6004yePsm-OWBPg7W9Eyw@mail.gmail.com>
Subject: Re: [PATCH 09/11] python: Update help text on 'make check',
 'make develop'
To: John Snow <jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 25, 2021 at 12:46 PM John Snow <jsnow@redhat.com> wrote:
>
> Update for visual parity with the other targets.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/Makefile | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


