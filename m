Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A83C0333DEA
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 14:35:11 +0100 (CET)
Received: from localhost ([::1]:55818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJyzW-0005ok-Oe
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 08:35:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lJyvM-0002CM-Q7
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 08:30:52 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:36757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lJyvK-0007t3-Rd
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 08:30:52 -0500
Received: by mail-wr1-x42e.google.com with SMTP id u14so23337079wri.3
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 05:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=4vxB6T/sabQ2wZcyrCjG41EkP8jfFSVvm24mFpCCksk=;
 b=TsYrQw27foOF+cNAq3ZESIm0hLqsg4Obt/foiFJVKT4oUtrY5HHnxSMe61943Xz02n
 CmoZnyoZg/dCFjXe9+6t6nc/WuvI6VJFTxXCu+ix8xNwZLTYPlcPVYFNb2HlXTjfjh4/
 Y3iqgcX+eXdaNLLlS08NK/YcSZLkzPjiLRVqElVJ97KrcO7X1fBEuhm4zGAgaxnslW4U
 fGXmoSIyY3+oLXpygmdTSlDMdy3Lnzj9wHU8TIg4jaWO8NVENH2oTVYn4JPOh7KRQy8b
 tz2MNZ13tZrESVnSRc2UDWPWCz7LhDGxCOkgOBpcbwc1xve8QPqis37UvwT8VpkNwftE
 gd8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=4vxB6T/sabQ2wZcyrCjG41EkP8jfFSVvm24mFpCCksk=;
 b=N1SP0C79QqOSc5mTHMGQnBKepTXr5VKa9fdZVHtmgD4LA8jjg8bXZ0O/M0w9e+TFHt
 qK7mFGb8pa6EGEs8EHqoCxQ48ogp1wK6eEcuJIzm+CF8jR0hOi3oIC3V6G0O86Ch/SFV
 lyU+klUnkC/iynpSnCohBB+QE5YDh0KWTJqouGh88XyNJBjuCM56kg+f8Gt8SSIdCfDn
 Y70FXd+WO5e7QYAYoZ3/1bZGUT/qQZinLHJRCSpIlf9K1gIIXs8oqQulh0Ijpvj+gXmO
 VXmHMgVyGYreP/rKCC3SaHkZfrtekXLP76ymDHQh4Kc8G7F7Hg15fPpEwpvrfYWvZHj8
 o86Q==
X-Gm-Message-State: AOAM5303L+YTIFLk8kY+henUq6GalcRD7xDtvHHPoEmXqnRaP9kkKOXg
 PXY+tLiqU+5P4AjDjSJPeHfTJw==
X-Google-Smtp-Source: ABdhPJyeEILKNGYUhT1G99V4CfAGzyIgXufk3uzOpj6eh72h7LlZefAFvZJHO0PHKk3raQycbsYq1g==
X-Received: by 2002:a5d:658d:: with SMTP id q13mr3617649wru.388.1615383046014; 
 Wed, 10 Mar 2021 05:30:46 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c16sm4843096wrs.81.2021.03.10.05.30.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 05:30:44 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2F8791FF7E;
 Wed, 10 Mar 2021 13:30:44 +0000 (GMT)
References: <20210308135104.24903-1-alex.bennee@linaro.org>
 <CAFEAcA9d01LaFRW=NnqivAMCsxPUbRP8kqOuL0i=P3o42tSZEg@mail.gmail.com>
 <87czw78f0d.fsf@linaro.org>
 <CAFEAcA-DmTGgAgpwocj5vO9W0E9RFtbdvO0DVThSa47S=yPJvA@mail.gmail.com>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 00/18] testing, docs, semihosting move and guest-loader
Date: Wed, 10 Mar 2021 13:27:33 +0000
In-reply-to: <CAFEAcA-DmTGgAgpwocj5vO9W0E9RFtbdvO0DVThSa47S=yPJvA@mail.gmail.com>
Message-ID: <877dmf87az.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> On Wed, 10 Mar 2021 at 10:44, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>> And then I get the same failure as you. Can you confirm the docker
>> version you have now?
>
> e104462:bionic:qemu$ docker version
> Client:
>  Version:           18.09.1
>  API version:       1.39
>  Go version:        go1.10.6
>  Git commit:        4c52b90
>  Built:             Wed Jan  9 19:35:23 2019
>  OS/Arch:           linux/amd64
>  Experimental:      false
>
> Server: Docker Engine - Community
>  Engine:
>   Version:          18.09.1
>   API version:      1.39 (minimum version 1.12)
>   Go version:       go1.10.6
>   Git commit:       4c52b90
>   Built:            Wed Jan  9 19:02:44 2019
>   OS/Arch:          linux/amd64
>   Experimental:     false

I swapped out the snap docker for the docker.io package from the
repository but it's still a newer version than yours:

  13:25 alex@bionic/x86_64  [user.static/testing/next] >docker version
  Client:
   Version:           19.03.6
   API version:       1.40
   Go version:        go1.12.17
   Git commit:        369ce74a3c
   Built:             Fri Dec 18 12:21:44 2020
   OS/Arch:           linux/amd64
   Experimental:      false

  Server:
   Engine:
    Version:          19.03.6
    API version:      1.40 (minimum version 1.12)
    Go version:       go1.12.17
    Git commit:       369ce74a3c
    Built:            Thu Dec 10 13:23:49 2020
    OS/Arch:          linux/amd64
    Experimental:     false
   containerd:
    Version:          1.3.3-0ubuntu1~18.04.4
    GitCommit:
   runc:
    Version:          spec: 1.0.1-dev
    GitCommit:
   docker-init:
    Version:          0.18.0
    GitCommit:

So I guess somehow we've regressed something that doesn't work on the
older version on your system. I can't recreate anything like your
failure unless I switch to the snap version (which I think is related to
visibility of file-systems from the snap) so perhaps we just need to
detect that somehow and disable docker support?

--=20
Alex Benn=C3=A9e

