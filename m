Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA5F5A0260
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 21:57:34 +0200 (CEST)
Received: from localhost ([::1]:38952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQwVJ-000469-4m
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 15:57:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQwTa-0002FQ-DZ
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 15:55:46 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133]:38556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQwTY-0001WC-Qq
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 15:55:45 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-3321c2a8d4cso488544997b3.5
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 12:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=TfbdDMonF22pc2HhJoHcoWnn90u0jJFFti4kTYktowk=;
 b=ntt644difkWtHgaS+BDKtd/g6P7akthcRaDDIkBgpWgep7gnxmjSFpigHSaSekJ9ll
 /196kOgkx2l9DUCifQLefK0y4ZIOlnYNTXub+cpCaPU24m5l2kNazuQlKUy1365s3pFv
 01RqdWIJTDyjFbj782o73+vMM2EySqeuHEX066dBUxBhaz/jzgK7I4AP+DvPQdt+3Nu0
 fwtvEwIVNB5TRF7GxJQYxFoylDjr8PsHsSJGiOg0Th8HOxDnm079IZez6PfEc8w1qpaD
 ibfxRNlXqlA/q+wKsLkXlYECqa6mePn/Oi3QioAM+l3FPvpxsXbWQUKrRmLpfchel2i0
 xZwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=TfbdDMonF22pc2HhJoHcoWnn90u0jJFFti4kTYktowk=;
 b=MN2w7mCqbwJyo40G9XyuBiA5pvaOrxjrRZt7RBM7FhgbVRi95EGkgmuFY61tQ4jg1l
 hmxUB+NoYC4kEIrwIXsQMLqxBS8l5pWnXCFo0yIZOpk6QC9X0DeMpZjS2gs056/ikMym
 XwkIWYpjqZdKilIyrXr+vGGQVYfUeRiKOQxlMISfZX5h+mF5IdJlsZN6W82N7uZ31YGz
 PscgbcX7cdecfz6ekroLlAheY9VbYouZcnQo/gfc6p3e/T9gf8xGd3aapL0WLb4rab/j
 UijxbKRSpfAa0jNCt1+kjNnOjdbo+HBnZSZF3UcSAy1HGIxTKNsUIKcRmnTe3SeSlETW
 MvDQ==
X-Gm-Message-State: ACgBeo3s24Vaw7ZRs3gW+wQfNBZbA64KHnZPkL20HgkEIjiWM3Afaku4
 WiRWPY9IQkj3+BiAhjAj5AYHu+H3wPBKRGJpiERPPstEt7c=
X-Google-Smtp-Source: AA6agR4qcJfuFJDZyHsDAYc9a+SmarNO6uhMB1+dhTEd/JAY9OKr3DQFNxedT1vRXLwkkOdUxatrQwPpAoiC4/A6Ob4=
X-Received: by 2002:a05:6902:10c3:b0:695:e4a3:ea8f with SMTP id
 w3-20020a05690210c300b00695e4a3ea8fmr715987ybu.288.1661370943690; Wed, 24 Aug
 2022 12:55:43 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ+F1CL27O8dmGSws=-QgutRRpM2NHcued28gnvt5jWo2WeUvw@mail.gmail.com>
 <e7b3468a-cdfb-4592-8a7a-48da2fa77647@redhat.com>
In-Reply-To: <e7b3468a-cdfb-4592-8a7a-48da2fa77647@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 24 Aug 2022 20:55:01 +0100
Message-ID: <CAFEAcA9OH4ih2pOUbsv6dTMW=3_9LTkzSRj4ogO4oxVS4fOASw@mail.gmail.com>
Subject: Re: Page alignment & memory regions expectations
To: David Hildenbrand <david@redhat.com>
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>, 
 QEMU <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, 
 Stefan Berger <stefanb@linux.vnet.ibm.com>, qiaonuohan@cn.fujitsu.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
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

On Wed, 24 Aug 2022 at 17:43, David Hildenbrand <david@redhat.com> wrote:
> One idea is doing another pass over the list at the end (after possible
> merging of sections) and making sure everything is page-aligned.
>
> Another idea is specifying somehow that that memory region should simply
> not be dumped ...
>
>
> But I do wonder why the ram memory region that's mapped into the guest
> physical address space has such a weird alignment/size ...

Lumps of memory can be any size you like and anywhere in
memory you like. Sometimes we are modelling real hardware
that has done something like that. Sometimes it's just
a convenient way to model a device. Generic code in
QEMU does need to cope with this...

-- PMM

