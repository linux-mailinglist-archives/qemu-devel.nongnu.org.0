Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE72FBF394
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Sep 2019 14:58:48 +0200 (CEST)
Received: from localhost ([::1]:35574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDTM6-0000VU-JN
	for lists+qemu-devel@lfdr.de; Thu, 26 Sep 2019 08:58:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46266)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iDTKp-0008LP-Rr
 for qemu-devel@nongnu.org; Thu, 26 Sep 2019 08:57:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iDTKi-0001Ra-8Q
 for qemu-devel@nongnu.org; Thu, 26 Sep 2019 08:57:23 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:40522)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iDTKi-0001Qw-2u
 for qemu-devel@nongnu.org; Thu, 26 Sep 2019 08:57:20 -0400
Received: by mail-ot1-f66.google.com with SMTP id y39so1877063ota.7
 for <qemu-devel@nongnu.org>; Thu, 26 Sep 2019 05:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g27mqee5ydRq0p02BbLwMtriMJe8fDuxr4cnAl1Pjec=;
 b=WJ+5NqOC/H0aQYue2UatS4SkWJE/XmlXr8PvLYtNF3llcAWxj1JM/AliGBRkeq8s5Z
 D4Z6ykJxyesF0dOzn/HpRE1V6pTEz8qfg5MEHqnjhvkHD8h5uJX42ANHOUZIstpzWzUo
 qPYrwyy1zAMcE5LNcMwsswBdp2jbPipw8fjxqXxT57zJUCMTlu4TnfrdeF04EMZC3cqj
 2iIxmW55/9nCj5nR3eprNs4xtm/UbE6r+chQO7bT4QzedvA0cHNvIdei9hG4WVvU7t3R
 zRpQJAsEWPodPL+J/iGLVcEI7ggIlZ61J4P/DNGMAqZfFHg4Gr3qdtorXP6Py+Bqzty9
 bzMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g27mqee5ydRq0p02BbLwMtriMJe8fDuxr4cnAl1Pjec=;
 b=GMfQHzY2E/V4FNJLO+LWJXFtXbtAsNTZVG63BOsXvpr1jVlduOBtYXzl65/xs0HE1K
 TV04wtgpYWqIfXD7amwdeszcIgRmY2JqD/03R8YAo2ICEKdrCvewVfDGgWbFKKHfyumQ
 /TvbKwnr/iZMvYtypenfMwx1GRnVS1vIfjE7JnQsV1stlaSeCV6eBA2DMFMAsD36pf/e
 rgoi1MJlN5mx60r54vS7Z4nD0pwF168EHL4A3fVh7Y8cYcFQQnj+NRXWc7z9IjWxExKY
 HIMhKTDaCSbLMywU0SpXGLK2O0QGicljRFDVlXu53lU69gv30jW6yzuvK7tW+Y4She6L
 cNdQ==
X-Gm-Message-State: APjAAAXIyxCvEWc389vyEIV3ulk5aR6Nnp4W+aYIjXZ9kNi9IfYzBGMQ
 0qnfeiTdtYpTqWS15DFIUut++5M82zqfWLMMOgEk1A==
X-Google-Smtp-Source: APXvYqyUqEe5tCAqD0cI+mpb/KYNUEWIWLKaCHh0Q0jmKiu3OoFWQrLtdZzQcWWfVmXLkeXBDDUAl1FSHzg3G0Ulms0=
X-Received: by 2002:a9d:4615:: with SMTP id y21mr2360213ote.97.1569502578285; 
 Thu, 26 Sep 2019 05:56:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190925133740.30401-1-eblake@redhat.com>
In-Reply-To: <20190925133740.30401-1-eblake@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Sep 2019 13:56:07 +0100
Message-ID: <CAFEAcA-C7eNwZX3PmwdgyrDXuFz4QaE=Rf=KkWuDC1K3o006zA@mail.gmail.com>
Subject: Re: [PULL v2 0/5] NBD patches for 2019-09-24
To: Eric Blake <eblake@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.210.66
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 25 Sep 2019 at 14:47, Eric Blake <eblake@redhat.com> wrote:
>
> The following changes since commit 2f93a3ecdd3bb060bd04f698ccafe66efd98563a:
>
>   Merge remote-tracking branch 'remotes/davidhildenbrand/tags/s390x-tcg-2019-09-23' into staging (2019-09-23 15:44:52 +0100)
>
> are available in the Git repository at:
>
>   https://repo.or.cz/qemu/ericb.git tags/pull-nbd-2019-09-24-v2
>
> for you to fetch changes up to da5e1169183ca6eb6fb470dc32ed1bfc24d1d406:
>
>   util/qemu-sockets: fix keep_alive handling in inet_connect_saddr (2019-09-25 08:15:44 -0500)
>
> For v2 - add one more patch
>
> ----------------------------------------------------------------
> nbd patches for 2019-09-24
>
> - Improved error message for plaintext client of encrypted server
> - Fix various assertions when -object iothread is in use
> - Silence a Coverity error for use-after-free on error path
>



Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/4.2
for any user-visible changes.

-- PMM

