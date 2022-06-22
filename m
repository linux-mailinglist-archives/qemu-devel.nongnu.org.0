Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8A1554CBE
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 16:20:20 +0200 (CEST)
Received: from localhost ([::1]:39070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o41DP-0006ih-8H
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 10:20:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o41BN-0005p0-4R
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 10:18:13 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:34311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o41BL-0003vo-DD
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 10:18:12 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id i15so25594416ybp.1
 for <qemu-devel@nongnu.org>; Wed, 22 Jun 2022 07:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=n3HCKnC31xjnQ2vCDiF8v3K/a9NsvNS6SnXNcsCPHRs=;
 b=inpn1KZF6sCoZ4t5FS86zH16HwglDE/PY7d3ec8l/eW+LSBwD0d2mhiZMZzGv7Cfwe
 lFMumYk87oezz5u+lPLidIhgsQkqCod8dEqaqLieZ39he4OwU8ej2FzLkZDGTkXTXR6b
 TbiQWquJM/RZkRE/akozePHtT9i4FwFrf2CWozIup5P+soow8sfMc7fDX6ZL++QuLhu5
 jJr/rfJZ1nURSVhueWfgSgoDXzg5c3Af+fhfstRDXYBqlulDyvPypWkgJWsNR4Lc2S0t
 zNkTuZHuVzU85TohCZdqvu/sXs8PiqUGyM8Zg+p2/bpTzOC+QIP1p8WkhZKu+rByjwE3
 D/Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=n3HCKnC31xjnQ2vCDiF8v3K/a9NsvNS6SnXNcsCPHRs=;
 b=PEPPgT0NBpFXFMkuiim3YFxU98xVXoQT0W/NUX5TvTwvIAChYd1ePxKk8wLNQwzOsH
 esJNvf6ULWDZd0yzPJcvigMrClb+/QXn8uLpQXYB+NRTkNOFRZpEGzqoq99vZGls3VVu
 hsZ8kwTVqSoDUCAxmB7+Nt6p2mtRqhRnvQp1yOJC3zdd1xq2CUQKfzGDEm7ovn3iIVT6
 ApquIiGrpyBcBA83L00xfrKTeay7GyVqa/iatta+uH2n57axf6+Yt6zN/VeeEMlnO5zt
 ea9oyFov/RpsaFqL51cw2sTLk9EBDx5XPF8OoTNka5sUypMFyxazXy7PGBAy/j4wLCDU
 NYZQ==
X-Gm-Message-State: AJIora+oenbZByI7FVDbLrr3yiDmgwieoKbQjv6toY7bQBs1Jr+5UK2f
 G7aW+n0CJlgdacxSj5PHjqT2j9pgjZIP+Da2+gnkkA==
X-Google-Smtp-Source: AGRyM1t7hqEFQ0i1+JHIlDemDyMZLQB5LMwmwx6dh/TFSLrW4taTAA2QjlSrX1Hcbib4ComqalbssOG2sYSS+BMIMMc=
X-Received: by 2002:a5b:dd2:0:b0:668:fc4a:9403 with SMTP id
 t18-20020a5b0dd2000000b00668fc4a9403mr3991363ybr.39.1655907489909; Wed, 22
 Jun 2022 07:18:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220622123305.3971169-1-alex.bennee@linaro.org>
In-Reply-To: <20220622123305.3971169-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 22 Jun 2022 15:17:32 +0100
Message-ID: <CAFEAcA_v+VM1kd=_D2Tm7DkkS=i+3k26aaM-YGjnTT6-zsPDxg@mail.gmail.com>
Subject: Re: [RFC PATCH] gitlab: add a binary build to project registry
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Anders Roxell <anders.roxell@linaro.org>, 
 Remi Duraffort <remi.duraffort@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Wed, 22 Jun 2022 at 13:33, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> There have been requests from other projects such LKFT to have
> "official" docker images with pre-built QEMU binaries. These could
> then be consumed by downstream CI systems by pulling directly from the
> qemu-project container registry. The final image could then be run by
> doing:
>
>   docker run --rm -it \
>     registry.gitlab.com/qemu-project/qemu/qemu/debian-amd64-binaries \
>     /opt/bin/qemu-system-aarch64 $ARGS
>
> To keep the build time down we skip user-mode, documents, plugins and
> a selection of the more esoteric hardware emulations. Even so it still
> takes over an hour to build and install everything.

> This is very much an RFC for now as we have traditionally not provided
> binaries for our users except for the slightly special case of
> Windows. As currently structured this will rebuild the binaries on
> every merge but we could change the generation rules to only trigger
> for tagged or stable branch pushes. We also wouldn't be testing these
> binaries so we are basically assuming they are OK by the nature of
> being built from master which in theory never breaks.

I'm a bit uncertain about providing "official" docker images
or other pre-built binaries, because it might give the impression
that these are OK to use with KVM, when in fact they won't necessarily
get security fixes in a timely manner, and almost all users of QEMU for
KVM purposes are better off with the distro QEMU.

thanks
-- PMM

