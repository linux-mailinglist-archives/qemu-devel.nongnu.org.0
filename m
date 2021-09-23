Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98084415B62
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 11:49:09 +0200 (CEST)
Received: from localhost ([::1]:58184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTLLo-00072A-NG
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 05:49:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1mTLKJ-0005sk-R2
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 05:47:36 -0400
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33]:34394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1mTLKG-0002Wa-V5
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 05:47:35 -0400
Received: by mail-io1-xd33.google.com with SMTP id h129so7377280iof.1
 for <qemu-devel@nongnu.org>; Thu, 23 Sep 2021 02:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zLljctyIbcBcOD5p0LGSKu7hBnrJEUEMzuzUksVKwLE=;
 b=TOgVNrAuYake+OYGtNM0oW3MKdR1gj2v78HNdcYhbgaFzwTZ3rTIsJJmfngo5bZjwD
 GVfxGy/KqOMv24jArwXfmbBW8imZ5DnzDEJhf8GhGpyOJlXDJNi28xVXg1nrKfbTul5k
 1qOR0pyEO7LAuiE5VkmZCG6H7R+Z9+BG90hiOj5oZFlfj/JRqP0xsbdEHmhVzCqTX2kT
 Hh6sHZdXFpaWbbZFP/99Lj0bO5ka1oXZmrSKtbBCwg8zphdcOq92hmf0o3u7Ul3mCAwE
 JO1453/04kGZmHbMImad7nlsie0zNkP9rFhbNzim2fAvrWloPukzDemCdSvcuxVmgAcD
 ve9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zLljctyIbcBcOD5p0LGSKu7hBnrJEUEMzuzUksVKwLE=;
 b=o2RjA+WILihLqjJ+Y1rVD4uRTWHEr6gJjpYg5/yaFuBERwrlGdoDv/OMX5USlfLOma
 NMlpl4tAhbtc8nVpkBUBuoaS+qFfwOkb/gboxZYO+L2sFiNJ5Q4CYZMfTGQ21fmbztHN
 Aq76XIeaXE5z4uWFwU6Qx9b/heWDNy0sILj0mBQ4jO4Nq8Aol2oLTxRSmJyGTeb7fxPR
 IvsQjkRRE+3eOJVu4ZCcGiNmSRU9fg2GOArHPJzkaL7En8o4rNerBWjWdpysOej/zmDx
 d0w7avcHq+NJXw0wlojn/3/ns7DxK7lp0ftlZWMT5YYubJPRTPkLuYRynnkZNu+TRvwa
 wpvw==
X-Gm-Message-State: AOAM531rSjiuWbLqn9VWyyoVym2iTEFmf5ehAbtr1J2+GmvCDgnUEtX8
 nAQ5nb7EUjbSqMgIE2/iOx9Es7hozeouwVbj6Sw=
X-Google-Smtp-Source: ABdhPJxNzTLOwtJA7YfTtNaXkInctfTWRcY3AaWlKt1dE6uSpFl5hmdcp3Fvi6kI/Qd8JrNCVaPuzyQi/jNlXFIZtlA=
X-Received: by 2002:a02:7818:: with SMTP id p24mr3240202jac.72.1632390450460; 
 Thu, 23 Sep 2021 02:47:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210726071145.150832-1-pankaj.gupta.linux@gmail.com>
In-Reply-To: <20210726071145.150832-1-pankaj.gupta.linux@gmail.com>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Thu, 23 Sep 2021 11:47:19 +0200
Message-ID: <CAM9Jb+iukn4hszakOnGEgECpFyi0rZWp4FUx-MU+T_KdYd=GZQ@mail.gmail.com>
Subject: Re: [PATCH] docs/nvdimm: Update nvdimm option value in machine example
To: Xiao Guangrong <xiaoguangrong.eric@gmail.com>, 
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d33;
 envelope-from=pankaj.gupta.linux@gmail.com; helo=mail-io1-xd33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Qemu Developers <qemu-devel@nongnu.org>,
 Pankaj Gupta <pankaj.gupta@ionos.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping

> Update nvdimm option value in example command from "-machine pc,nvdimm"
> to "-machine pc,nvdimm=on" as former complains with the below error:
>
> "qemu-system-x86_64: -machine pc,nvdimm: Expected '=' after parameter 'nvdimm'"
>
> Signed-off-by: Pankaj Gupta <pankaj.gupta@ionos.com>
> ---
>  docs/nvdimm.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/docs/nvdimm.txt b/docs/nvdimm.txt
> index 0aae682be3..fd7773dc5a 100644
> --- a/docs/nvdimm.txt
> +++ b/docs/nvdimm.txt
> @@ -15,7 +15,7 @@ backend (i.e. memory-backend-file and memory-backend-ram). A simple
>  way to create a vNVDIMM device at startup time is done via the
>  following command line options:
>
> - -machine pc,nvdimm
> + -machine pc,nvdimm=on
>   -m $RAM_SIZE,slots=$N,maxmem=$MAX_SIZE
>   -object memory-backend-file,id=mem1,share=on,mem-path=$PATH,size=$NVDIMM_SIZE,readonly=off
>   -device nvdimm,id=nvdimm1,memdev=mem1,unarmed=off
> --
> 2.25.1
>

