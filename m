Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E666644A8
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 16:26:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFEL9-0001hA-TM; Tue, 10 Jan 2023 08:06:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pFEL1-0001ek-TM
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 08:06:51 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pFEKx-0006fM-BV
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 08:06:46 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 v13-20020a17090a6b0d00b00219c3be9830so13345626pjj.4
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 05:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SLW6m+Dua0Xln5CTfFmVXNwER7zdgIJlXBCVt8Q7zbk=;
 b=GF/VGIy64zEJE4NeO3/5jWwsnDqtpP+G7oDzVIfNYNj/pidgAXt2LnKs0KHVC1g0Ru
 CX5CsOqNDVqUl9s61zIIEmsTMJL8NtGWDoyH3/MCqNx/fzoFFmYG7Orql1bEZbiKLOen
 HUwXmDyPRSPBVj3wbNrhU5rkcKFkXbO1uhaPJySzrJNfmEmubcu+sKBSPyVaJksAlvGW
 QfP2yu8Mi7rISGrgA8WyrjnZRm4IMYgMoyUQoDXFif1PmhQopbQvtc9k6aSB7N9CIc3V
 PnyCTpbhavxPCOck+I1NOB1HM3uwq2fb1UAokO1kZrkDtr/3AipD9vU/Axhoh8C5joVK
 W66Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SLW6m+Dua0Xln5CTfFmVXNwER7zdgIJlXBCVt8Q7zbk=;
 b=Cfzzgj13Rb8MX7mfRomfORs1Ovr0qlKJy5iJUcgaZDHo1/3m1DwyUv6Zcub2jyvyi/
 hrtmRPMIxztTomfbQ4RQbIt0BsmLHeBlmOQNutP0pGC9w4mk056jWh21je7TG23kf5/a
 kR/Ui76Fr+ERyEg2gSgNgfrkXSIITFO6flOQNBQ/soOY6o1SShlW36dSwnMViqrKtNQo
 +Oz9w02Rm8BMXgeiTD7raT6Wv+ibgMRS64qtfe47LZ6JAfJnXXfWOGsWHo6Oek/0x4mY
 RkQ0CyMPW1hWmxEDBQcObLJwH1MLx1/XRWF8cxRquDg/R0/s21WyTpLrizjymwWeQ7qm
 Fuyg==
X-Gm-Message-State: AFqh2kopzJOZTR14pcsWk5a7hPpekBun9svtuUdyEbxgQC4z+V9Le/TG
 QC9kFvMNhGRuHBDp1qn1sd8Xi8uoXQrdDDfi/OHIdw==
X-Google-Smtp-Source: AMrXdXvfDyTNAMQ3kp9ArcnZ1T//kkJ7Gs9xTCiIukb2tJ7DQ66iNRY3kbZRbScSa9saCw6UCqv2TuALdOu2DBmHs9E=
X-Received: by 2002:a17:90a:77c7:b0:219:e2f1:81ad with SMTP id
 e7-20020a17090a77c700b00219e2f181admr5533072pjs.19.1673355982503; Tue, 10 Jan
 2023 05:06:22 -0800 (PST)
MIME-Version: 1.0
References: <20230109224232.11661-1-farosas@suse.de>
 <20230109224232.11661-14-farosas@suse.de>
 <35870ab3-1da6-c222-b708-06ac71a5883c@redhat.com> <87zgaqa6jk.fsf@suse.de>
In-Reply-To: <87zgaqa6jk.fsf@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Jan 2023 13:06:11 +0000
Message-ID: <CAFEAcA_x_kTdNt8+5YAjo518Wj_Ej4jZ=0OrCQmutNOjJx=3Gw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 13/19] tests: do not run test-hmp on all machines
 for ARM KVM-only
To: Fabiano Rosas <farosas@suse.de>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>, 
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>, 
 Laurent Vivier <lvivier@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 10 Jan 2023 at 13:00, Fabiano Rosas <farosas@suse.de> wrote:
>
> Thomas Huth <thuth@redhat.com> writes:
>
> > On 09/01/2023 23.42, Fabiano Rosas wrote:
> >> From: Claudio Fontana <cfontana@suse.de>
> >>
> >> on ARM we currently list and build all machines, even when
> >> building KVM-only, without TCG.
> >>
> >> Until we fix this (and we only list and build machines that are
> >> compatible with KVM), only test specifically using the "virt"
> >> machine in this case.
> >
> > Why don't you fix it immediately? ...
>
> My idea was to have in this series the minimum to unbreak the
> --disable-tcg build and later bring the rest of the changes
> incrementally.

This test is basically checking "all the machines should
work". That's an important invariant to maintain, so
I don't think we should just skip it for Arm targets.

-- PMM

