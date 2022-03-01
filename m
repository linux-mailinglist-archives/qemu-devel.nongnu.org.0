Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 539CE4C9023
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 17:17:54 +0100 (CET)
Received: from localhost ([::1]:44254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP5CD-0003Kb-El
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 11:17:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nP5B0-00022z-TA
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 11:16:38 -0500
Received: from [2607:f8b0:4864:20::b2e] (port=33670
 helo=mail-yb1-xb2e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nP5Az-0001B9-AK
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 11:16:38 -0500
Received: by mail-yb1-xb2e.google.com with SMTP id j2so28291980ybu.0
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 08:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zsHRSNxqly4NfNg54gzio1uw/874qQqD7wYTqL70B2U=;
 b=OQGoDnIhwadbtSxcIR7F4n8Ay0a527gd3cuhdMAJdxQ4Wp2lpcmiWAkadXqO+cAEHa
 cv3UFFwZ3bROOUdqrzXioTyvBOlrnrEFFou9Xgd2wfKu+rPGF/n6kWr7+4GsY0LL2Bwj
 V426n8kLEiZ6dNXflsFWGaPceDXzRHcjeg1wMhkTr1Lx8mMJPmJ9zg6diK+2X1GbhEgx
 z+4UfuOSd8HDPyqlTBZMXvSpwYOqui8TLDgM611MOZv73CrMPu/QNUpTpjWWleN63b2E
 LM2Nkbwqz+XZMFReviDotnVS7KFpWW2WMgnQwe+RbaO8djeCVrRGi4neOW5quY0lk1TO
 zLTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zsHRSNxqly4NfNg54gzio1uw/874qQqD7wYTqL70B2U=;
 b=Xa5WUNUiwQbibiS7o2aOEMWSJuZySXqeXhlf87njcmpp1ZDklZ6BaOuQ1bFFzYTboO
 CTNotYR/JrTFdH6UpBrurFOgL14jq4o4GjzQPbFgCnGvt/4bu4H2kp8a00Hl099R6d4v
 IG1m67KXLHf21VQ8kl13wwva4c+jDU47VVeYRxuS3r4qH3Ye7XEKnGnQyaKRNBuQSZ7q
 +/sDiFvZkWiU93mPmmOBNNSJvbeDNw1RGfbe4EwzQceZy+PWW33uYLZhmoY26JQRQAE7
 4z9guZNU7E9YAYVVCm5DIbkG/2C3KRLIU9lNsxWnCrbRC8q5PL3exbLE3bBtAFRKf6xu
 WTqg==
X-Gm-Message-State: AOAM531FqCy0D7jQB4T3OUqs6lbxKJeQ78r6V19Qbj+Yhl8mCgXEoAUJ
 zHfc2xkKc+8Mq2Dj/vuxDyvAgjAGqSHZ46ojvklkfw==
X-Google-Smtp-Source: ABdhPJypz9WOAWBKh4qDBhve2h5MbUoFpjpED6RTfglgKCrw+SN9qFNEzY11oJ6esmV7CGs65xgt5PJE3WkjcxceRSI=
X-Received: by 2002:a25:8084:0:b0:5fe:cadd:2532 with SMTP id
 n4-20020a258084000000b005fecadd2532mr24856928ybk.193.1646151396416; Tue, 01
 Mar 2022 08:16:36 -0800 (PST)
MIME-Version: 1.0
References: <20220223223137.114264-1-richard.henderson@linaro.org>
 <CAFEAcA84cFnF9EygS6Xun3VorjeGKf+Lw7zRdkBbcRp6YT_OeQ@mail.gmail.com>
In-Reply-To: <CAFEAcA84cFnF9EygS6Xun3VorjeGKf+Lw7zRdkBbcRp6YT_OeQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Mar 2022 16:16:25 +0000
Message-ID: <CAFEAcA_+70hkNaRhbT=ZT457x+cgD-qSad5QoJY8VAEds5UKeA@mail.gmail.com>
Subject: Re: [PATCH v3 00/17] target/arm: Implement LVA, LPA, LPA2 features
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 1 Mar 2022 at 16:08, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Wed, 23 Feb 2022 at 22:31, Richard Henderson
> <richard.henderson@linaro.org> wrote:
> >
> > Changes for v3:
> >   * Update emulation.rst.
> >   * Split out separate update to ID_AA64MMFR0.
> >   * Hack for avocado.
> >
> > If the avocado hack isn't acceptable, perhaps just drop the
> > last two patches for now?
>
> I think that given that there are Linux kernels out there
> that won't boot if LPA2 is enabled, we should probably have
> a -cpu command line option to disable it. Otherwise we might
> get a bunch of "why did my kernel stop booting" bug reports.

...and should using a versioned machine type also default
-cpu max to not enabling that? Not sure what x86 or other
precedent is there.

-- PMM

