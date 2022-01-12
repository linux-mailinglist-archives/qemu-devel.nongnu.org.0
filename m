Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE8F48C29B
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 11:58:43 +0100 (CET)
Received: from localhost ([::1]:50434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7bL0-0001eJ-JB
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 05:58:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7bIj-0000Dx-KK
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 05:56:21 -0500
Received: from [2a00:1450:4864:20::434] (port=42728
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7bIi-0006vE-2t
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 05:56:21 -0500
Received: by mail-wr1-x434.google.com with SMTP id k30so3434570wrd.9
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 02:56:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NrTDgDsQtAVnWiYSLFFdiv8OXlgL7QH1lajZ5NbReH4=;
 b=NKtwySACgJZb9Z5KT1tR5q2M1oh6/jKx0cPzdpNRPFlbervOY9rBi25oPDf2uOqWdA
 FTXnxRDnuyofeda1xyWOxuQ9gfpcJCY5UwUjmiLE7lEOJZfHnhZeV2MZWa4KHFoDxKrb
 NAG6/0LIIQc77+kqQVcUxy9/wwafATlROB4g+g7f3RGO+AsYq8+LbDaqvvibsPFTNgUM
 g6xXujNgspminbdkrtowQ/L919kG6eDJzA3ruET0p0ASvfTZc2U0C3AgNEvm01/qnEf4
 7VTgfumsGzQwyaq8OcPdy3lGsdwyc4/Q44ARbrFBRUi5zlJIJ+0TaQIi1HSJeoB1hyVD
 mQCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NrTDgDsQtAVnWiYSLFFdiv8OXlgL7QH1lajZ5NbReH4=;
 b=FkmibqaJ6iJ/CplP8LvJNvQYfDgMvybsPP+aGEtY52bZiCNnFjJ37JGtDbgw30fNTI
 9iBjOKJBeAxWo2Qyc/ajW+AUi67P6MejoDNloMV0KTp4nEwFMFy2GR8rZVFs4xD/ySTB
 /JPd8XrVXKso2vsJd7Vvlwi/DdrB7LAEB6974GJb1usnaA4UAN7b88UkfCLaMcrT+JHx
 wKPSC3ZenX3OgQaggmXCGinLR6/RqoJYZhmDbRMk9M0eqQLB9cAE6gh/IIgTKWW84D8w
 55mpNONMJDPC8NK/RGtirIe8FJ/iZhlacuSV2YZ1PtpZc8zp08OKWVtz+wOqqReQNb9i
 WoOA==
X-Gm-Message-State: AOAM531TgAQklyz0ql5kJ03Of2mcGjNJvzSIXt39mwmkbjnp30rglmBp
 M8iQH2Zqx7VXDu0YnCfLeL6ViudACsKfH3E6WgUQZw==
X-Google-Smtp-Source: ABdhPJxVABpvkoS9oHyqMnwUNUpOqA48PChcw/jyfFjPQlhprNpdfIAoUw75AyQ2kD9nnp/hzL8p1ouA1RWGKTfrnTo=
X-Received: by 2002:a5d:64c3:: with SMTP id f3mr7244788wri.295.1641984978672; 
 Wed, 12 Jan 2022 02:56:18 -0800 (PST)
MIME-Version: 1.0
References: <20220112102345.79395-1-dgilbert@redhat.com>
 <CAFEAcA9b9NtkyWY2aCUpOvm2J5uRVt9qUPj6gPk3MFtkTh6ceQ@mail.gmail.com>
 <Yd6wrYdzzT/XsSSK@work-vm>
In-Reply-To: <Yd6wrYdzzT/XsSSK@work-vm>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 Jan 2022 10:56:07 +0000
Message-ID: <CAFEAcA_W9KoMiuBApJaPs9inOrWtjzr2F4L4qnnTxegvFwd_NA@mail.gmail.com>
Subject: Re: [PATCH] migration: Add canary to VMSTATE_END_OF_LIST
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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
Cc: lsoaresp@redhat.com, marcandre.lureau@gmail.com, qemu-devel@nongnu.org,
 peterx@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 12 Jan 2022 at 10:42, Dr. David Alan Gilbert
<dgilbert@redhat.com> wrote:
>
> * Peter Maydell (peter.maydell@linaro.org) wrote:
> > Does 'make check' definitely do the traversal for all vmstate
> > structs, or do we need to add a "sanity check them all on startup"
> > bit of test code ?
>
> Oh I doubt it does; some vmsd's are conditional on guest state, many are
> only on particular machine types.
>
> I think the closest we have to being able to walk the tree, is
> --dump-vmstate - although you need to call that for each machine type.
> (I forgot to add the canary check in the dump-vmstate code, I'll fix
> that).

We could have vmstate_register_with_alias_id() iterate through
and assert presence of the right terminator (probably only if
qtest enabled, or some other suitable condition). Then the
existing tests that do the basic "check we can instantiate every
device and initialize every board model" would run that code
and catch most missing terminator cases, I think.

-- PMM

