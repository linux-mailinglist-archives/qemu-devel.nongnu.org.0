Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C33442DE0BE
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 11:11:00 +0100 (CET)
Received: from localhost ([::1]:55688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqCix-0004Gg-RI
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 05:10:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kqCi2-0003gg-JA
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:10:02 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:36171)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kqCi0-00029y-Pl
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:10:02 -0500
Received: by mail-wr1-x431.google.com with SMTP id t16so1526721wra.3
 for <qemu-devel@nongnu.org>; Fri, 18 Dec 2020 02:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=4KggAfV3YBbw1ge5MkjlThMckmM+tMUgJvdWkCJ4uNU=;
 b=SRRDarvKx3dxRD99xncuxml8cGF9B7WkTYI3lJJkE/ULzGMBT6VAwD/43dgZ4z21T1
 1IpU+/6uZU6gGQk9Wn+zLmZgirwcUG5GDSKPM1pOC/4RZTwcI4v88d4kNcJa8SLkn0rA
 uMuCZlRkZxokKEVUjrJhgUgDXdzLoW/nPDLffdzP5vSg6jU3lbKT86Lkrq9EP7xGPSN0
 waRMIKTT54qKyojmWxzpI8Q6ZPIXTH1K0OJJHTKsF+qDe+bIJHCRdlzGou8c52Qk1uqj
 d6C5IMTK1apGR0pK1QV/YPWH/WIu0Y5LBPvV8Ye+6flI5N1EJs2FMO1O8OmIOzDzrYla
 g/Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=4KggAfV3YBbw1ge5MkjlThMckmM+tMUgJvdWkCJ4uNU=;
 b=EHrqBXBFQBYBEgBYSMW50HX7M0MJ+vqHcRLJ/2oYF2JWzIqd2mxoaXEo2tGHehEFMa
 HTri/yBBya1GmdqTVAX9s5w1ClNbzt5e2oucyWTfRfTxpC9/8kvN50lafAJ965/PoLr/
 GY1QupQr7alWyu4/FdbnHv0T6y/bfB4/C+L9ZgKm2lfy+ncA5wWlpKeT46zW26No8RWY
 uSpr3wgqfIW3q281VvvFTOvv1Xt4g4lMiRiHOwfQZp0t3IbrW3v6dd81GkyI8ZYSAlvi
 VE7aMZym+nQWComjAuRJQd5rp+c8Mz98/6W7wMGsNjRrxVfDt10CGyQ2zFUylNCvERUI
 7AnQ==
X-Gm-Message-State: AOAM530k92ZMxDgGmPa1ZMpiarBnXp1s36OVeMYufKRkzuy4h3I0Nvzk
 iGADHFVXhp84V1nXi6+wSgeOhw==
X-Google-Smtp-Source: ABdhPJzI2B3/9YK91saRdRge3MNhsO5a7mlIXSqdvPeFzCWM3NWkd+uz+1E0oyLdekCrvdA+s2bB1w==
X-Received: by 2002:adf:9546:: with SMTP id 64mr3531749wrs.343.1608286198394; 
 Fri, 18 Dec 2020 02:09:58 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s1sm12871848wrv.97.2020.12.18.02.09.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Dec 2020 02:09:57 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7ED381FF7E;
 Fri, 18 Dec 2020 10:09:56 +0000 (GMT)
References: <20201218011158.13495-1-jiaxun.yang@flygoat.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH] tests/docker: Use lower case for centos8 powertools
Date: Fri, 18 Dec 2020 10:08:47 +0000
In-reply-to: <20201218011158.13495-1-jiaxun.yang@flygoat.com>
Message-ID: <87sg83qvbf.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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
Cc: fam@euphon.net, philmd@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Jiaxun Yang <jiaxun.yang@flygoat.com> writes:

> Our gitlab amd64-centos8-container pipeline constantly fail at:
>
> 15.36 Error: No matching repo to modify: PowerTools.
>
> Fix it by convert it to lower case.
>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

Thanks for you patch, we already have a similar fix in flight this PR:

  Subject: [PULL v2 00/11] testing and configure updates
  Date: Thu, 17 Dec 2020 09:43:30 +0000
  Message-Id: <20201217094330.17400-1-alex.bennee@linaro.org>

> ---
>  tests/docker/dockerfiles/centos8.docker | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/docke=
rfiles/centos8.docker
> index 54bc6d54cd..06b67962fd 100644
> --- a/tests/docker/dockerfiles/centos8.docker
> +++ b/tests/docker/dockerfiles/centos8.docker
> @@ -31,6 +31,6 @@ ENV PACKAGES \
>      zlib-devel
>=20=20
>  RUN dnf install -y dnf-plugins-core && \
> -  dnf config-manager --set-enabled PowerTools && \
> +  dnf config-manager --set-enabled powertools && \
>    dnf install -y $PACKAGES
>  RUN rpm -q $PACKAGES | sort > /packages.txt


--=20
Alex Benn=C3=A9e

