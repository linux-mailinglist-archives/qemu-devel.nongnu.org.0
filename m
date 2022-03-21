Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD62B4E281C
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 14:51:58 +0100 (CET)
Received: from localhost ([::1]:42252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWIRx-00036S-LN
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 09:51:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nWIM3-0007BV-Gu
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 09:45:52 -0400
Received: from [2607:f8b0:4864:20::1132] (port=34640
 helo=mail-yw1-x1132.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nWIM1-0004Of-Tj
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 09:45:51 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-2db2add4516so156250497b3.1
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 06:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=DJbqo7cU0F6C/R4b09cPby+at2fzLrHmAs8zIGx6gvs=;
 b=q9G2+GJXYcFfsXRFYT5YqnejMcWpoaqkJRYpVUde8mjdjmXQY1T5O32vV4giWoMMXS
 Wp+05JOrjsu9bWsyk1f+8W4axnAqkNfQv3eV0t4gnnyMCA+R2pXbthT86bMWZxDm6p7w
 nQyXzxCmY+rk7B/DoS5ErIgeYpk0zQT4a0qSpvo27AaeYWwVsN8t8ryI262K9MAR8fBJ
 IpheoMzKZO7CLaky4m5Ip7uGJahBr6MIrItKl1cdfbmhdK0x21J0cKhwpqSHQ7WNz6pi
 33638AI3cuCuBrkNYPKxRjxMcxkEJd+OQ9cAiZceUw6AhJ9tUnEQgDdFo6wtVir+Evec
 UbpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DJbqo7cU0F6C/R4b09cPby+at2fzLrHmAs8zIGx6gvs=;
 b=ITuNOZ02RyXVjBISoKW6qr5AulTiaFon32verSp0Y6eO7VsOTXM2g9CeJ1msNDq6Ju
 Jr8cBEgGaNAfcuwHk3ISnEsEC2NXb6kciGNQDTxvb994/laM5lCFYz940S/Jo0WGr1wt
 j8PzelsXFPkgvSAZaqTHGY6uCXRw30xcGHu3hcm6SDP8P2AGhS+llOPg3kK9/eO3EQdb
 5C2b11NCVn6FNFN8pWyrBADtNBLQbxCwO6LiiZYJpu5DsenLVD5gpynlJKdTm+wyn480
 5C6gML9NqLJ4/kEUsOreppOaLf+Xbslb9eQrjzQxPh0PzAkB3aIiM9xY9OosYkpCOtOM
 +5Bg==
X-Gm-Message-State: AOAM531JdK/9AiboHIMi9cnjeOAzgVVyjXI/8G406xP39rJbnRs/ECG8
 +bDEjGPquGoGEK7jay5WnCfnpDN3Gb++xy2XG2ajZA==
X-Google-Smtp-Source: ABdhPJynuCsuGuyYj24ZHe42yuHi3h3YknBhSYyi+5Vwsw08EbHkNFURNVlAJC9l9SQqQdZZe48ZP9iWue+KvWQ95VQ=
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr24512801ywb.257.1647870348921; Mon, 21
 Mar 2022 06:45:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220321133905.3278054-1-alex.bennee@linaro.org>
In-Reply-To: <20220321133905.3278054-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Mar 2022 13:45:36 +0000
Message-ID: <CAFEAcA8KTojHaWbdQFgqKQ0c5z8WGDuwLw_hwbXJ1pDXBgpyPQ@mail.gmail.com>
Subject: Re: [RFC PATCH] gitlab: disable accelerated zlib for s390x
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1132
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 "open list:S390 general arch..." <qemu-s390x@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 21 Mar 2022 at 13:39, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> Apparently this causes problems with migration.

More specifically:

# There appears to be a bug in the s390 hardware-accelerated version
# of zlib distributed with Ubuntu 20.04, which makes our test
# /i386/migration/multifd/tcp/zlib hit an assertion perhaps one
# time in 10. Fortunately zlib provides an escape hatch
# where we can disable the hardware-acceleration entirely by
# setting the environment variable DFLTCC to 0. Do this on all
# our CI which runs on s390 hosts, both our custom gitlab runner
# and also the Travis hosts.


...speaking of which, this patch seems to only be
touching the gitlab CI and not the travis config.

thanks
-- PMM

