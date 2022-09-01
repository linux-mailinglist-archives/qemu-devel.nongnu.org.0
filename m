Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD7A5A8E38
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 08:21:12 +0200 (CEST)
Received: from localhost ([::1]:41244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTdZf-00079Z-44
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 02:21:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oTdSK-0004EM-0I
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 02:13:37 -0400
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33]:34647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oTdSF-0006Bg-0c
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 02:13:35 -0400
Received: by mail-qv1-xf33.google.com with SMTP id kh8so12757431qvb.1
 for <qemu-devel@nongnu.org>; Wed, 31 Aug 2022 23:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=/d51QABQ3iADcusSDnG2cWWjSKFuZXPBX0SWGWgeGtU=;
 b=h8zC5Z9IzTFqfmbfm3tBbiXsSqy9gHw+aE19eeSBbK7VDk9ifiSNMfIVghsZE5Co8k
 2GJmM68JBCNgi8ClD9YxpAgHV756dkEB81bR73Frmp1mmXTRrEJlUoskBH2rt0e4mhfe
 luGK4q6o7p8o+cqk8Id7o2pmz9NeiZVxjjojVttFmcC5pFUdqrACeQN0QibLulH2x+sL
 pen9ukYBHfx0GRg6O+SJv64xdbME6WXsRvWat9ePRmEjEjYPqeuMZGAdJ4oP+UOYhUhj
 jwlleWRQswwcCy8a41qpOXl71Ojz4rMYUCewfRdGlGXmH/DJT6BT5NqUjmi6dp8p57St
 h2Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=/d51QABQ3iADcusSDnG2cWWjSKFuZXPBX0SWGWgeGtU=;
 b=oUXKxBluiCgannCC21woV0JEwOwBYCwYioRSRfMak7aEXZgvmTfQiP48T0XWhZDysX
 1jVFJSBVJD2cQn0uQXACnMW0JD5uHTJdTLGVD+7Av+7709+tbTfWZNVKZDdVbAdrlzma
 rVQfW37ITWIh5dd9CbWiVEn7l2LkBEOA9W0GpdaiGVUj6W8xTMGQ7BbQTKAz8Tee9jr9
 8VF0/Hgl/rf1aVVE2z/xGpT+NH41G1kgPrRHZyrwEIygGOByW32gyKHN++Kk7SkAUlAe
 uZZ2iJAuswZaD7zu/sVif7RaxDgn91ULQChtFHydzHHzFjlcvALxwflEddXuA49KRdMS
 cPKA==
X-Gm-Message-State: ACgBeo123sCI72Moj6yTkF4pD9sVsapHh6XAhkI6IXUb1ZrYkNrgIXjh
 8IAbxH4/5ZXpOqJ/9oH0osPkrF+yDsVNznCXVZvaMgD0
X-Google-Smtp-Source: AA6agR6TEgYCV2B7/gtGkl53sI0PQRSEJzZc6+OPHABCk0I1bC4y3659ypf1JbuFKOg9aRheuo7RQR64pqgCTCvuiRY=
X-Received: by 2002:a05:6214:ca1:b0:498:f96d:4a8c with SMTP id
 s1-20020a0562140ca100b00498f96d4a8cmr19747329qvs.51.1662012807120; Wed, 31
 Aug 2022 23:13:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220802075200.907360-1-bmeng.cn@gmail.com>
In-Reply-To: <20220802075200.907360-1-bmeng.cn@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 1 Sep 2022 14:13:16 +0800
Message-ID: <CAEUhbmW5Mcc5+ebHxVdm9N8bsMUj3gRWA0GBz8whtFacPymm2w@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] Enable unix socket support on Windows
To: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f33;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qv1-xf33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On Tue, Aug 2, 2022 at 3:52 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Support for the unix socket has existed both in BSD and Linux for the
> longest time, but not on Windows. Since Windows 10 build 17063 [1],
> the native support for the unix socket has come to Windows. Starting
> this build, two Win32 processes can use the AF_UNIX address family
> over Winsock API to communicate with each other.
>
> [1] https://devblogs.microsoft.com/commandline/af_unix-comes-to-windows/
>
> Changes in v4:
> - instead of introducing CONFIG_AF_UNIX, add fallback afunix.h header
>   in os-win32.h, and compile the AF_UNIX stuff for all Windows hosts
> - drop CONFIG_AF_UNIX
> - introduce a new helper socket_check_afunix_support() to runtime-check
>   the availability of AF_UNIX socket, and skip those appropriately
>

All patches in this series have been reviewed. Would you please queue
this? Thanks!

Regards,
Bin

