Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4954B4BCA7A
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Feb 2022 20:20:15 +0100 (CET)
Received: from localhost ([::1]:46686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nLVHB-000851-Oy
	for lists+qemu-devel@lfdr.de; Sat, 19 Feb 2022 14:20:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <josh.a.seaton@gmail.com>)
 id 1nLVEn-0007Or-8H
 for qemu-devel@nongnu.org; Sat, 19 Feb 2022 14:17:45 -0500
Received: from [2a00:1450:4864:20::530] (port=35345
 helo=mail-ed1-x530.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <josh.a.seaton@gmail.com>)
 id 1nLVEk-0002yB-LE
 for qemu-devel@nongnu.org; Sat, 19 Feb 2022 14:17:44 -0500
Received: by mail-ed1-x530.google.com with SMTP id f17so21299927edd.2
 for <qemu-devel@nongnu.org>; Sat, 19 Feb 2022 11:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vs3zsZZZbsEgZNQ1J5l+yQcilKeKJLpckeiXLAcDZUs=;
 b=ZoKBxVKmNywiVjtVxF/kX1hk5pl2IKz3Y6miSCiRMiuarvI/k9MQEn83nvYmOkzuJ7
 J0y7952TPF+SGjJEe7pLiu0G2yLbWtCbMN0vObL+4G+e7ekRb94tNaoRog4p4VftorPG
 ynTEfcfmD56r6/EizPfJ+qz5yqt4t0sW1YNXJtiJ6xqW9DsgO7NdG1sZAvnVheN2AX6p
 fMrCaNdHsRprDPAjiHQbbin4oIQP4YLSdaa4A6HZFnsqRPQjMr3UllacRuMN/yzEKOfL
 h0Gg2jA2WYFEZSpYjgEzpCQNXCpVEMJSh7EslUrqQ/VB0gwjbGoIMuhZ1Nft8Ur4FLsa
 TOng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vs3zsZZZbsEgZNQ1J5l+yQcilKeKJLpckeiXLAcDZUs=;
 b=WE01+mLFEVZ0eEp3YfLgAgIkGACpSTCudP3hxwyHpYlvc623xGZq/7k23bycNb+Nuv
 UN/Gx71n1877mpgqiiQkJDMM6kf9A06er0v1nZgPJ/pt9T56bpDB2G+XL8fpH5Ssoseb
 Y0C73WpPRQV1v1Ax1LS3K5cUIm6DeDoV2jbzIkyr9Hwl8jjyMLg707sXNa663iK1a9o9
 j1k0pw4BBRAgWrPlRxH0+YpmTg5Krp8mJjM1hDhx1uUGHnsoa1JOx8DXBlTGcJEK7kLF
 GejDfbs0Y1gm6MdIiI0FkMQzt7EETPiUU+k2RIaPEkRn1j3iYhHU9NRAEtcHt0LKv6js
 v1wg==
X-Gm-Message-State: AOAM533EVoGSGU79bSBZP3t5JXs7cccjH+MfhLV+fCNtLwikH+Nbc1oO
 glNHFrnoFGwgGkBkkIPhOscBA4abIYTrZJGittE=
X-Google-Smtp-Source: ABdhPJwXhUhk+/wf8U79itFoKek++7sO3J8YQ0uRndyCfB10PehrjMjVMtupHVg7BSXsQgZyCz4jOfBm7A9BNn1ZkG8=
X-Received: by 2002:a05:6402:42c6:b0:412:8cbc:8f3d with SMTP id
 i6-20020a05640242c600b004128cbc8f3dmr14141165edc.310.1645298260044; Sat, 19
 Feb 2022 11:17:40 -0800 (PST)
MIME-Version: 1.0
References: <CAPbYy+_XEvLYuPa5jgMde7YAgk2Cx4wDi=QnJiLn9zT5ALjROA@mail.gmail.com>
 <59b4fb65-10b6-8d4b-e257-cea50381f168@amsat.org>
In-Reply-To: <59b4fb65-10b6-8d4b-e257-cea50381f168@amsat.org>
From: Joshua Seaton <josh.a.seaton@gmail.com>
Date: Sat, 19 Feb 2022 11:17:28 -0800
Message-ID: <CAPbYy+9ksqwk04EfiFGcebsgwGjjJz9GO48oekYVbybbJZUiSQ@mail.gmail.com>
Subject: Re: configure: How to pass flags to the Objective-C compiler?
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::530
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=josh.a.seaton@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thanks, Philippe.
I was in luck that you already had this prepared.
My naive read of that patch is that it covers specification at the
levels of the configure and meson front-ends, but that it still does
not wire that up to the build (beyond the diagnostic `summary_info`
addition). Is that accurate? If so, will there be follow-up patches?
If not, could you clarify how this amounts to affecting Objective-C
compilation steps? The other references to `objc_args` I see in the
meson build only seem like they amount to kwarg whitelisting for
certain classes (but, then again, I don't yet understand how the meson
build works).


Joshua.

On Fri, Feb 18, 2022 at 2:14 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Hi Joshua,
>
> On 18/2/22 22:58, Joshua Seaton wrote:
> > Hi all,
> >
> > How does one pass Objective-C compilation flags (e.g., a sysroot
> > specification) when configuring/building? `configure` exposes
> > `--extra-cflags` and `--extra-cxxflags` for C/C++ compilation, but
> > there isn't an equivalent for Objective-C.
>
> You can use this patch (which is going to be merged soon):
> https://lore.kernel.org/qemu-devel/20220215080307.69550-3-f4bug@amsat.org=
/
>
> > In my particular case, I'd like to specify a particular sysroot for a
> > macOS build.
>
> Regards,
>
> Phil.
>

