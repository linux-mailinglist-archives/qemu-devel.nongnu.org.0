Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7103B75B4
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Sep 2019 11:08:39 +0200 (CEST)
Received: from localhost ([::1]:40482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iAsQY-0007bc-A5
	for lists+qemu-devel@lfdr.de; Thu, 19 Sep 2019 05:08:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36473)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1iAs0H-0002Ts-7B
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 04:41:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1iAs0G-0001sG-0W
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 04:41:28 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:40847)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1iAs0F-0001s7-Nx
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 04:41:27 -0400
Received: by mail-wm1-x344.google.com with SMTP id b24so2903647wmj.5
 for <qemu-devel@nongnu.org>; Thu, 19 Sep 2019 01:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=vXsoGHNUZZQbFoVEmo5YhF6fjxUVggvhJv3xcfyMLIw=;
 b=um3f5ql5YxEXUM4Sd/m47l0J7ijl2SFww42xP98tJZ7bzL3+4Qs+jLPIXAfR9M9vbn
 WD8R0E4F7Yy8nBwbcLulYUI06XnBQ5DTW4/ZVMa4QC4CBWR7CkSgBRyuXqjTQCshKXLi
 J2klHxGYQCnCRN+qtcGfStsFFokKkIQNcqPGhx+OywkZgQZM/MVM7hq1je/kmBuVlZ27
 EOI4vZ5ekUpWkhPgNyyA9CY5tP6IjRrxEUpoZlHfumnK7oe5ZYaq3pESxGjNGIoQRi9C
 7OAgjARxIUjDUgftRVXNtBUJ98w5NOz+4HBKdBR75TIPwBhKP8R2NZIQMoBlEpp+YnrL
 IGSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=vXsoGHNUZZQbFoVEmo5YhF6fjxUVggvhJv3xcfyMLIw=;
 b=Pu8pIqu1JdZkgQyNqoZRa/maRzUTWv9TF2XyI2KpgmRedbWiKVQv/5fGcEzUNf9Qu3
 I2kAvF3KqBb64U0dmcaWxxOiKUqtINkqoMU3cGDPwGir34R+XAIZRGPD+TKlO4TKfUSr
 edFfF87lEjOptDTjtJu0HmJGhAT/cPvHsfgND4sDC7CbVNHUoUB01jr6/kfk9ng6olx4
 7ZspRfLVmMj3iC0mOR2KPoFkR3K/lkfqE/Tytc1oEZ1QxxLMPn9u+TmcWIBhsjedKPRt
 d7naQe7uk3bgICDrAKIiF4GIocTo84s8A7CUbOVCHlMI4FrP1hKTnGRiC1ntg6qp2ihr
 0rEw==
X-Gm-Message-State: APjAAAUbxBC9HUuG4M7cyOBFy6aqn5OpeSN0Mo/tB9mvBLx06ob8Q3LV
 ndrGjQ7x9FfelrEPmi3HPke/cKLnOHw=
X-Google-Smtp-Source: APXvYqzhF66VPMOKD/YKncDX/1JZ9zv6c2RQhuzZsb5xj9oW24ANGND1Il863qqocfMLUMkqPBZjTQ==
X-Received: by 2002:a1c:9a94:: with SMTP id c142mr1739904wme.172.1568882486204; 
 Thu, 19 Sep 2019 01:41:26 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l13sm3792939wmj.25.2019.09.19.01.41.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Sep 2019 01:41:25 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BA3D51FF87;
 Thu, 19 Sep 2019 09:41:24 +0100 (BST)
References: <20190918222546.11696-1-jsnow@redhat.com>
User-agent: mu4e 1.3.4; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: John Snow <jsnow@redhat.com>
In-reply-to: <20190918222546.11696-1-jsnow@redhat.com>
Date: Thu, 19 Sep 2019 09:41:24 +0100
Message-ID: <87v9toznij.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::344
Subject: Re: [Qemu-devel] [PATCH] docker: remove python2.7 from docker9-mxe
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
Cc: Fam Zheng <fam@euphon.net>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


John Snow <jsnow@redhat.com> writes:

> When it was based on docker8 which uses python-minimal, it needed this.
> It no longer does.

Queued to testing/next, thanks.
>
> Goodbye, python2.7.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  tests/docker/dockerfiles/debian9-mxe.docker | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/tests/docker/dockerfiles/debian9-mxe.docker b/tests/docker/d=
ockerfiles/debian9-mxe.docker
> index 7431168dad..62ff1cecf2 100644
> --- a/tests/docker/dockerfiles/debian9-mxe.docker
> +++ b/tests/docker/dockerfiles/debian9-mxe.docker
> @@ -16,7 +16,6 @@ RUN apt-key adv --keyserver keyserver.ubuntu.com --recv=
-keys C6BF758A33A3A276 &&
>  RUN apt-get update && \
>      DEBIAN_FRONTEND=3Dnoninteractive eatmydata \
>      apt-get install -y --no-install-recommends \
> -        libpython2.7-stdlib \
>          $(apt-get -s install -y --no-install-recommends gw32.shared-ming=
w-w64 | egrep "^Inst mxe-x86-64-unknown-" | cut -d\  -f2)
>
> -ENV PATH $PATH:/usr/lib/mxe/usr/bin/
> +ENV PATH $PATH:/usr/lib/mxe/usr/bin/


--
Alex Benn=C3=A9e

