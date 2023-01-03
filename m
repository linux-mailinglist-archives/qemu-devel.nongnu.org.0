Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7B865C50A
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 18:31:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCl84-0008CP-H2; Tue, 03 Jan 2023 12:31:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pCl82-00088W-DK
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 12:31:10 -0500
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pCl7x-0005mw-O9
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 12:31:10 -0500
Received: by mail-pg1-x535.google.com with SMTP id r18so20560032pgr.12
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 09:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6mspDTMqDyAcT/WXDLvH/FVnkx8la3xOkvBw7xeySNY=;
 b=WRsLZAkiO9BtELYaOXmUIASyjbk/vEpVHZQNRIlxAI9aT+5ADRDJIyA7SxO/hJQwIR
 G8RsCsfNThrVYfnW3cLC1IcDEAAskO/Gfr24c3/gKPhRzi2Yifdi429FwEL3K9m0O7L3
 3KFUsCPsJV2GTf0SLv32IpX88CcH0kA0Hcrgeo6eIfyT+SN0b/rkMfso/8jQIU9quAPF
 sJjlmDpPDq3qxzCzCtGhPjzqGD5g8qXJTQXIQcRUrha1UX5LiOV2BhA8rqxYVC57F1s+
 oL9qf4vpP2jRJiLNDwdsRUS30GQd8LQ2zFA14EvnDd/4nbvQMffUvPCka5xk2QpKvIj0
 h6Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6mspDTMqDyAcT/WXDLvH/FVnkx8la3xOkvBw7xeySNY=;
 b=aTkAVb4uGxTSzazgBXW05lKAnpoE3Sxd5MnlpwcMJz/2oxsZ9e98AFklgxNzU2zr5a
 HVBmIsjsUuKLYZMkheoU6h53bdslqkPSFFFRmtj5flN5HMoX3HT7IZjN8WwiuDMfI701
 GUpQ2kArB6Z+WIeVWA+uV8CYsMK9DTgOu9/GUI1y2tzD8FU1c9dHqd3qFTWk3fIYs49f
 vHNQqCAJ0cK1abmypz5PQre2Q4LbjLUBSNbjK+KDrTLYqLy4Fkhu7g2XTgkPMzXhHyI/
 3ASxM7KueXI49AWZxEn5UEOcWzue1dDJtu17WRlxJ3bIMmIprvrbtO3SHOIi0jwZK90K
 erMA==
X-Gm-Message-State: AFqh2koZXVmwFlG5at44En/qoAeG7p8Tu33NGp0VzSg5huE3iwoDLdN9
 dEwnre3o47f4ZycTT3YJ8Ioy6qtA4duQKj4Feg7hPQ==
X-Google-Smtp-Source: AMrXdXvoS0jao4+U8EpqvhciYrJItnM+VWP7paP+SJC2Kj1tSeNboGZNXA6tbJwH4O+603JtoTb42x7U85AGfah8zhI=
X-Received: by 2002:a63:e20b:0:b0:479:18a:8359 with SMTP id
 q11-20020a63e20b000000b00479018a8359mr2755159pgh.105.1672767064059; Tue, 03
 Jan 2023 09:31:04 -0800 (PST)
MIME-Version: 1.0
References: <20230102104113.3438895-1-ale@rev.ng>
 <CAJSP0QVbvgr6wHY9e6f7UgZ-vum5vGUNH+h0Lf93BpdEcFJf0A@mail.gmail.com>
 <20230103162603.74f631aa@orange>
 <CAJSP0QUd9Q25pT3OXst4V-1FKLo65jJnn-6-7d_O5hkPeJfPyw@mail.gmail.com>
 <20230103171149.3bcf0526@orange>
In-Reply-To: <20230103171149.3bcf0526@orange>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Jan 2023 17:30:52 +0000
Message-ID: <CAFEAcA8XY0Ks1mxMasZ9U4m-CNPsuLFU+9ercmb10kscP3iYSw@mail.gmail.com>
Subject: Re: [PATCH] Update scripts/meson-buildoptions.sh
To: Alessandro Di Federico <ale@rev.ng>
Cc: Stefan Hajnoczi <stefanha@gmail.com>, qemu-devel@nongnu.org, 
 Thomas Huth <thuth@redhat.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Anton Johansson <anjo@rev.ng>, 
 philmd@linaro.org, bcain@quicinc.com, quic_mathbern@quicinc.com, 
 stefanha@redhat.com, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, 3 Jan 2023 at 16:12, Alessandro Di Federico <ale@rev.ng> wrote:
>
> On Tue, 3 Jan 2023 10:51:36 -0500
> Stefan Hajnoczi <stefanha@gmail.com> wrote:
>
> > QEMU's Makefile used to a use a technique where it generated
> > "timestamp" files and used cmp(1) to check if rebuilding was
> > necessary:
> > 1. Always generate meson-buildoptions.sh-timestamp.
>
> `meson-buildoptions.sh-timestamp` would be the full expected output,
> right? It's not just a date or something.
> AFAIU that would make sure that if nothing changed in the output you
> don't trigger other targets depending on `meson-buildoptions.sh`. It's
> a solution for a different problem.
>
> The problem with always rebuilding `meson-buildoptions.sh` is that we
> spend 1 extra second on every build, even those that doesn't need to
> rebuild anything else.
> Not unacceptable, but I think we should strive not to commit generated
> files and move the file to the build directory, unless there's a reason
> why this is not viable that I'm not seeing.

The other problem with this file is that it appears to
be generated differently depending on the host distro
(specifically the default value for the --libdir option).
That also would seem to nudge towards "don't commit a
generated file".

thanks
-- PMM

