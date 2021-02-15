Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7E531C2AF
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 20:57:38 +0100 (CET)
Received: from localhost ([::1]:51818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBk01-0004qR-2m
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 14:57:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBjzA-0004Oz-Ae
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 14:56:44 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:34134)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBjz7-0002Lo-Us
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 14:56:44 -0500
Received: by mail-ej1-x62b.google.com with SMTP id hs11so13231119ejc.1
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 11:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SDTC0CEKQ07Z3ZMF9z0Kno5k8XGncbWXiwQ+RDr/cVY=;
 b=F7/DpUagLD9j9PH+v1BW81eowNDFNb/Co8r1lXdxSLPcwY5kteoOplrp3DxR92xc0v
 zTRZ4aujOQJhE6otD8Z2C1zlESsMiEyRpIAFz7EQOsVQYTujFvaAT5YgKrxKKHZbO7wt
 BQb5VVYvoFBYXma1NMG0wgIN6csKNi+Ke6ydQfd+T1ye1uJAWKG+GDvvdufilwpsMBvn
 r0SeLQ+klo36QwhrHEd7yVtNgdXBniXSLiLUIJT7ES4todHDWRQaxS+/vWkIOKJJvz3p
 C9P0SRmtQO1ijtbyPBNoW1iSVAXGsoukCzZSaaGMxGM4t+8qKroQrrU5bdhFxS/pwIZ3
 j0DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SDTC0CEKQ07Z3ZMF9z0Kno5k8XGncbWXiwQ+RDr/cVY=;
 b=pIJpEaeHgUb7tdl59hgfdTkmEhRlL6rebPMn2pis0NiU5NLcuE6c/3nVRrWJM8laSb
 sQV5mKBImHmak84EbR5kQnPYEJRvgjG3/9zmG49tvBxtSxsL7UKVNlZqSUe7bYhYt6Ow
 0uNFXL1jGi55Cr3NW+onqcQ3NFK/tKQyqa0mmSwpdFeIU7oqtnW+YySrRkwu66gCj2F8
 8uLuxlgorMO2LwyrP06sul9CfwUG4a3wVNcQN330cgECarFTJy2QFlF85v1qPqa2Ilfu
 4jRr6x1TWWVCqVbDxWIsS7d7VBDbB2g3fUA+9K9nJAeGjMISO/TN65l9/o9ymtt3cULi
 A3tw==
X-Gm-Message-State: AOAM533OXavYZDY36xV3AsXLoXyfLNmDS9G5XZ+JhC9DEkuOtrJrhg13
 GbmHowpIquBvD0CMX4TVx2MWjqVJd3EIXbrAb4vrow==
X-Google-Smtp-Source: ABdhPJxNsUQRU2suTWfw1dbuxlPlghdb23cODd3UEWWh118LUvdkMjY/LfcPKWZhMYVEZYD70vRzWrZ6i0TrHLlV8Lw=
X-Received: by 2002:a17:907:98c3:: with SMTP id
 kd3mr17426405ejc.482.1613418999883; 
 Mon, 15 Feb 2021 11:56:39 -0800 (PST)
MIME-Version: 1.0
References: <20210123143128.1167797-1-pbonzini@redhat.com>
 <20210123143128.1167797-32-pbonzini@redhat.com>
In-Reply-To: <20210123143128.1167797-32-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Feb 2021 19:56:28 +0000
Message-ID: <CAFEAcA8R84_-BPG-suKDvkpE1BxG8o1edGv=zfU_CCw27pK4eg@mail.gmail.com>
Subject: Re: [PULL 31/31] qemu-option: warn for short-form boolean options
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
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

On Sat, 23 Jan 2021 at 14:50, Paolo Bonzini <pbonzini@redhat.com> wrote:
> Options such as "server" or "nowait", that are commonly found in -chardev,
> are sugar for "server=on" and "wait=off".  This is quite surprising and
> also does not have any notion of typing attached.  It is even possible to
> do "-device e1000,noid" and get a device with "id=off".
>
> Deprecate it and print a warning when it is encountered.  In general,
> this short form for boolean options only seems to be in wide use for
> -chardev and -spice.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Hi -- if you want to deprecate these ways of writing these options,
could you also go through the documentation and correct the various
examples that still use it, please?

"git grep ',server' docs" finds some of them; I bet there are more.

Alternatively, maybe we could not deprecate this really common syntax
pattern that's going to be in lots of peoples' examples, tutorials,
shell scripts and command lines ?

thanks
-- PMM

