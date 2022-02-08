Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D015A4AD82F
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 13:14:19 +0100 (CET)
Received: from localhost ([::1]:57688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHPNy-0002FQ-Rp
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 07:14:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHOG4-00074s-VI
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:02:05 -0500
Received: from [2a00:1450:4864:20::32a] (port=34606
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHOFz-0004BZ-MA
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:02:04 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 bg19-20020a05600c3c9300b0034565e837b6so666844wmb.1
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 03:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XARIOODFGy5pMZ3gEzqIPyWihx39AvUdx92sChNoWs4=;
 b=rmDt9jMqoWh/r1RvVF3Jvuon9zVFcGRlhS7ssY4HvRi8l2/d68CAOJQf2Kz2tSBFip
 jnQWysSCHiWEKXlo18fKPO/n660aWGuhvd7Q4CRzPMtLNHjokoqlp6PB4cbH77mOKHQw
 f0qpT33KVZsCk3k+YRZsWrUNTmiiLwEKAHbKV0MRdTx+FT2n2bUvVFIVY0u/e/rZFf0y
 Ad5+67MA9NKfirdAap4uY7rMp1Tylhso8/TAeaw1jOcAEmK9o0tpo7hFesZ60Yjc0CFc
 NYGNqPPPZNe5vBCPFzzuLFD29Qqu6ufhLUarByDfZ0uOlKzpvlqzui4BtuBNrR0x1oeG
 W8WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XARIOODFGy5pMZ3gEzqIPyWihx39AvUdx92sChNoWs4=;
 b=yFkmGeeMIdyeHEIA8795j9T6z/bLfV0PnQfV+AA0RiMj6o1XnGsCYA9uxRKqHPjiWD
 3h96HysSi0S2J8unt1r3gD1im1rWAtJeQEOY4BXPsGgz7fKD6gKjsa8iWl0mNQvGrNzW
 P0kI92o0LyKxcKvRHUFzz280XVrQUEj3ZlOoKJMVy5QpttJPVLWMlGwawOR8BlrBjK4P
 gFk5PhHfRD1E7zPu8hmHygAZSoFhvE6VrCAUe9982c2g4Lxsf7G91XMJEk2ZJo8X+aaG
 goLSgpxo+eF8HtpVAeZcCbYqpV8vEkCpUM83GHE1xJ8s01zA8WW3KliegxTZaLDGaSyw
 UcbQ==
X-Gm-Message-State: AOAM532lB9vpklWSnhzioJtqtxyqWVr6zwbinKp2X4GMJY3kLX/mpLiv
 KIEJnqsitgA6EFxPGKjbxkm8YD3RTOeFV1MPq2WeOw==
X-Google-Smtp-Source: ABdhPJw/wDoIzqRNjxWuB0Fc3FMOpNAdOUAgPojCzK9GkwpNcHOPJre9XqIawWYZPznWMarc8j/etYpjkrWSzPeqBno=
X-Received: by 2002:a05:600c:2d05:: with SMTP id
 x5mr619714wmf.133.1644318118290; 
 Tue, 08 Feb 2022 03:01:58 -0800 (PST)
MIME-Version: 1.0
References: <20220208071237.319844-1-richard.henderson@linaro.org>
 <20220208071237.319844-5-richard.henderson@linaro.org>
In-Reply-To: <20220208071237.319844-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Feb 2022 11:01:47 +0000
Message-ID: <CAFEAcA-XH1yc-NbFQAgXo7BAtiVBgCACQ70EWf6CjndXaZVqBw@mail.gmail.com>
Subject: Re: [PATCH 4/5] linux-user: Move sparc/host-signal.h to
 sparc64/host-signal.h
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: qemu-devel@nongnu.org, Laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 8 Feb 2022 at 08:17, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We do not support sparc32 as a host, so there's no point in
> sparc64 redirecting to sparc.

Where do we enforce that ? I couldn't see anything in
configure or meson.build that forbids linux-user with
a 32-bit sparc host, but I probably missed it.

thanks
-- PMM

