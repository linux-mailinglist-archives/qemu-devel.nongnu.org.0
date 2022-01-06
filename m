Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D527C48669F
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 16:19:23 +0100 (CET)
Received: from localhost ([::1]:49434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5UXy-0002Lq-L3
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 10:19:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5UJY-00024D-7j
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 10:04:28 -0500
Received: from [2a00:1450:4864:20::330] (port=40487
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5UJW-0008WN-4x
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 10:04:27 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 2-20020a05600c02c200b003470f96e778so1132803wmn.5
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 07:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=kHQxLq3EQ0dfwJsEcmi7sOwF86hM/TS9+7/xjwgohK4=;
 b=r4++FUduzYPWNuULZ2rYPwqjs37meVc29zg+ScYC4pat2+paa2Qnf457/051ThlRgf
 bQg8aF4DOhGRbaHjNv1tzIuQbxnmEEVeoCfOOd9qi74bqRzgB9VVPQGBtHAKZkpGcIGp
 ljWhH5gM9iCso/XtyYj1d17xY5OXs/ECHf0Lsn3V4YjpwpWmu34fchwfdA5uHYQ2wacG
 jhtAOlaLEO6Wua1zc58J72q8o9HYuCkB+2OtAZvb4cWs/vw4bws4K8rBAi48UzJqmKWT
 /F5ensUKYvUrkO9mhmjE4UfAnkoInU/3Lw8/59wnmmM01Cau5Bqgh7LK2Mv5q1MGAhQV
 sfLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kHQxLq3EQ0dfwJsEcmi7sOwF86hM/TS9+7/xjwgohK4=;
 b=kglzsQu7BvNIWkEzKIvQAQ0XGXY71DgGBGbm0mp6/4SNV2UKXvUNt1L1THFlGC86sG
 TZSY31IxuVJXVlpSWULyRs6n2Bo7dhW2StRVLtQZbu2NdDBTmt3fG6Gy8U6X691UMAxt
 AfD+kV1v5fa71T6bNxExrSzNiW41NphiMyg70sc21I7o5DuTPb1A5HRmx0YRzTWxAyn2
 TtcuIwnW77FFv1591mPNuMWkswQky4U/4k6+UPrOHP44xKTmPepqepQIcdkOTT2EyF0c
 IeIyO7VkcGimmbdOYHW/+F3iOaxNbr5VKx5VU3R0gPv00suIjowZHDH2R7+VOD5q2Q7R
 eB/A==
X-Gm-Message-State: AOAM532HR3QoN2JvbxQmrqRlkfMRVj8fUKvcWTIfrRfRkQdTvEe1ov7O
 o5okgFeC93JQXqTVsKCefhYArOC2Ct6VFht51I5g7g==
X-Google-Smtp-Source: ABdhPJz5ghog2yYnLVf+eXLK3OuT8rPVBhqDaL++WX2LJaF2Lvolux6ap0DPv8RES9GQyUs4UmtmlgIGTN8AHCt37fk=
X-Received: by 2002:a05:600c:3ac5:: with SMTP id
 d5mr7453233wms.32.1641481464144; 
 Thu, 06 Jan 2022 07:04:24 -0800 (PST)
MIME-Version: 1.0
References: <87czl6jb79.fsf@linaro.org>
 <fbc66bb0-2c15-d789-bbaa-f9c3ba6f81e4@amsat.org>
 <87r19lj3l3.fsf@linaro.org>
 <CAFEAcA9XX26RHmNM59Zc13dwvhv83bAnomLp7Yj45Wmf16W66w@mail.gmail.com>
 <87iluxhrdc.fsf@linaro.org>
In-Reply-To: <87iluxhrdc.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Jan 2022 15:04:13 +0000
Message-ID: <CAFEAcA_yg=FVCadEa7BBaudvyoZ+VgAppG5cT=T4MoKmYhGaQA@mail.gmail.com>
Subject: Re: Trying to understand QOM object creation and property linking
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 6 Jan 2022 at 14:26, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Wed, 5 Jan 2022 at 21:05, Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
> >> Can't be added as a subregion to the container...
> >>
> >>   qemu-system-arm: ../../softmmu/memory.c:2538: memory_region_add_subr=
egion_common: Assertion `!subregion->container' failed.
> >
> > This assert means you tried to add the same MemoryRegion
> > as a subregion of more than one parent MR.
>
> Right - that is probably something we should make (more?) explicitly
> clear in the Memory API docs.

The doc comment does document the requirement:
 * [...] A region
 * may only be added once as a subregion (unless removed with
 * memory_region_del_subregion()); use memory_region_init_alias() if you
 * want a region to be a subregion in multiple locations.

One of the deficiencies of C assert() is the lack of an
explanatory text message to go along with the raw expression.

> > You can either:
> >  * pass all the CPUs the same container as their "memory" link,
> >    if they all see the same view of the world
>
> This should be the case - I don't think the different cores have any
> particular different view of the world. The use of the two 4kb banks I
> think is purely convention.
>
> However trying for a single container shared between both cores fails
> because armv7m_realize adds it's board_memory to another container:
>
>     memory_region_add_subregion_overlap(&s->container, 0, s->board_memory=
, -1);

Yeah, that trick only works for the real CPU object, not for
passing to SoC or SoC-like objects.

> So I guess I just have to repeat the creation of the aliases for each
> core. This seems needlessly messy...

It's not great, but the MR tree does need each MR to have only
one parent. Maybe there's some way to make it a bit less tedious
to create the aliases.

-- PMM

