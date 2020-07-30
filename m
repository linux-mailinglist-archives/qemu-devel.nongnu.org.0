Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B662330DF
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jul 2020 13:22:45 +0200 (CEST)
Received: from localhost ([::1]:38564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k16e5-00026K-1f
	for lists+qemu-devel@lfdr.de; Thu, 30 Jul 2020 07:22:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k16dH-0001Yu-3P
 for qemu-devel@nongnu.org; Thu, 30 Jul 2020 07:21:55 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:35017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k16dE-0004Bt-4S
 for qemu-devel@nongnu.org; Thu, 30 Jul 2020 07:21:54 -0400
Received: by mail-ot1-x344.google.com with SMTP id 93so9630260otx.2
 for <qemu-devel@nongnu.org>; Thu, 30 Jul 2020 04:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=nW7AKJ4vYC3+boL8MHhZC9J+wbz691Jws/nMErt9LVw=;
 b=CCwqsUZhS2+MYU5WawIvm1qLGO8ZqhQgsosgrb8cwE0xRLrueE8dBDjh92JXBlzyE6
 7L/B9ABxNnAdnK2RvHZuUkAj3h+4QWqE3X4+P14/HOZfpVJ47HjEQDehZ7iTH6moDEzF
 UwDARA/ks2AvVqcXV7Z7F2pgvLjY1VRjpT+jAPNTh99MuT739QMW7x7tha6xU5ZSwrJR
 BmzvhadkfmFbnFt/53W/vidcQWnbl3+LPqeZ8z0ta1DmGP+9TckP2Q6mSPLsNcqyKKZL
 /k1aM1yRp37I3bUvyEC8BxkIFEzRoGnj7zQenuSrbJj7wgij8cbdBu8gsYo3kOrVXYrt
 N+hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nW7AKJ4vYC3+boL8MHhZC9J+wbz691Jws/nMErt9LVw=;
 b=qIFlfv3S8ecBgwJ53vtPQphF89R9u3c7zKE9bY6hOvJmElleU6jeSmoeqodkwDWI5B
 Uly6ukRN6BL0jg+mdpC+Uasluh7kYn/7ZRz1VNBtgLpAPCoa5WzFIjWnc3gpni9FCc3i
 4enk5vVTI/DB7eMiILUYf2wPFIODzI3a/Gvqf118QJowWpUDsf0NpGYqOh2G8ycB3mpz
 XVNLggLFOI9uj1zwF5zw0WGcLrvKskkVb++1+/YnG59MUH5VvcxrM4XgiimBRC7/YIIh
 rMYDcUsb97DfgXonxTQzazbFfCasp/Ur/bgHL9EZxQD5hwa8qybMHe0thg2vqi2nUgok
 Zg/w==
X-Gm-Message-State: AOAM531wqOWepUEOvKL6AXZ5M4oQYYsv+NeTB48bIsvEHzVslGKVVSU5
 okXOU9fp7ktdI7JUWbRGdXc5glgsi6FVX7Ut296+oA==
X-Google-Smtp-Source: ABdhPJzsdUQWBlFQLwsGBQYIje3wzOtXJqiGL6vVRJcbaH58pbE2LpQ+A1Jni6gOGPeWQ3BEJRW+0xMTaXHk41j6v/c=
X-Received: by 2002:a9d:3b61:: with SMTP id z88mr1981398otb.135.1596108110740; 
 Thu, 30 Jul 2020 04:21:50 -0700 (PDT)
MIME-Version: 1.0
References: <1596074182-4920-1-git-send-email-likaige@loongson.cn>
 <1596074182-4920-2-git-send-email-likaige@loongson.cn>
 <CAFEAcA_ZgrkcpwYZD-stZGDDjhTgMOSLx--9KHPnxfbKz58s7g@mail.gmail.com>
 <25c0ba1a-088d-c932-1f17-030211af5d4f@loongson.cn>
In-Reply-To: <25c0ba1a-088d-c932-1f17-030211af5d4f@loongson.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Jul 2020 12:21:39 +0100
Message-ID: <CAFEAcA_uy0dpxQ07S=THCBaMx2R0-xaM_BUn8OxLkOwR9LJdWQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] target/arm: Fix compile error.
To: Kaige Li <likaige@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, David Hildenbrand <david@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 30 Jul 2020 at 12:19, Kaige Li <likaige@loongson.cn> wrote:
>
> On 07/30/2020 04:44 PM, Peter Maydell wrote:
>
> > On Thu, 30 Jul 2020 at 02:56, Kaige Li <likaige@loongson.cn> wrote:
> >> When I compile qemu with such as:
> >>
> >> git clone https://git.qemu.org/git/qemu.git
> >> cd qemu
> >> git submodule init
> >> git submodule update --recursive
> >> ./configure
> >> make
> >>
> >> There is error log:
> >>
> >> /home/LiKaige/qemu/target/arm/translate-a64.c: In function =E2=80=98di=
sas_ldst=E2=80=99:
> >> /home/LiKaige/qemu/target/arm/translate-a64.c:3392:5: error: =E2=80=98=
fn=E2=80=99 may be used uninitialized in this function [-Werror=3Dmaybe-uni=
nitialized]
> >>       fn(cpu_reg(s, rt), clean_addr, tcg_rs, get_mem_index(s),
> >>       ^
> >> /home/LiKaige/qemu/target/arm/translate-a64.c:3318:22: note: =E2=80=98=
fn=E2=80=99 was declared here
> >>       AtomicThreeOpFn *fn;
> >>                        ^
> >> cc1: all warnings being treated as errors
> >>
> >> So, add an initiallization value for fn to fix this.
> >>
> >> Signed-off-by: Kaige Li <likaige@loongson.cn>
> > What compiler version is this ?
> It's the latest version: v5.1.0-rc2, but VERSION shows that is 5.0.92.
> Commit id is 5772f2b1fc5d00e7e04e01fa28e9081d6550440a

I asked for the compiler version, not the QEMU version :-)
Clang, gcc, OSX clang, something else, and which version number?

-- PMM

