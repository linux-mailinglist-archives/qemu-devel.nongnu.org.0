Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B67B63FBB16
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 19:35:10 +0200 (CEST)
Received: from localhost ([::1]:54496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKlBd-0002o0-RT
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 13:35:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mKlAV-0001lf-NL
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 13:33:59 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:38468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mKlAU-0004Ye-2m
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 13:33:59 -0400
Received: by mail-ej1-x62a.google.com with SMTP id n27so32833950eja.5
 for <qemu-devel@nongnu.org>; Mon, 30 Aug 2021 10:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UT8lSzlGl/B8N1X79Ob2xv+78u86UKZFIM+1gk+DwE4=;
 b=gEugG4B1wnj4mX2S+tgJAvladbxo4BAln/IooMH8Gac38xZU8+bIqttPA2rE86beBj
 MDwVzlfmpjSbBCovsqAwf5FBZWyJdrPrs95ME5nPAaPRhaKtgG0W/q03va/vUMtZKQF2
 b+QbNytHXEXlDsRA9TENFGX1aPbSmACHXl81+1dbOqKwRN2Mt72wv8dRN5IfQ0dfWMhi
 bXKixqRWFftk274N1YWV65xytQ1nOF+4rZFzs1f9lZQE9kvI8eSqiCNNlzjDzzhTnTAC
 OijBVik/nHq58x1gjKr0IOJhP2fo+PnQsgSulV59IkEp0Dz2Nj5O7+Uw9uRFrxkidWBx
 UXyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UT8lSzlGl/B8N1X79Ob2xv+78u86UKZFIM+1gk+DwE4=;
 b=O1NnJuXoR+grfmjbSK4pKKwtzHqhWZTsJgzajWhYU/vUrIyAMQmLHY6ojxldVpq+//
 BhJDWwZaQziFoSawza8dVg71y1kZhBYCI+yfj3TIa8KVm3aJ1oH0ViK9sntrw3Cbwkl+
 GiiPkOH76CPHwg/q7r5B4H2FgKbb5uryu5ZEsLzQ0XGbvZAWrnUp1+u3jUILSEQwps7Z
 ZIgoKUqkRLKv1TN43TfO4WcjyMCJ64dsK92I/scb7QqJmsoZiSRQqecP6fiPkVnF+7Lt
 bevt6bWFgfPvNcaOtaFTo/PpL1s4tNajQabTWPnDvpaNFlRe7YU/rfdHFiKY2FutSe8X
 lMDw==
X-Gm-Message-State: AOAM5300I2s1DB+Ha+HU85IRwHAS0h0KknNwuAdsRI6iUJ0cEVR508oA
 54VFQDbRPeAc6RpaTDqOVbBtK0Wvpj0+DZWHJs2VLA==
X-Google-Smtp-Source: ABdhPJzb7GiO289gCafJuOl2S6goAz2cp8C1U74dauKHYyGhyt3CZwH6lHjww0WoMkdfVK1YUvDPR/js9wgTbBdWMko=
X-Received: by 2002:a17:907:75d9:: with SMTP id
 jl25mr26162641ejc.4.1630344836074; 
 Mon, 30 Aug 2021 10:33:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210805193950.514357-1-johannes.stoelp@gmail.com>
 <CAFEAcA8TRQdj33Ycm=XzmuUUNApaXVgeDexfS+3Ycg6kLnpmyg@mail.gmail.com>
 <20210830154708.ah27fh34q5dgg3le@redhat.com>
In-Reply-To: <20210830154708.ah27fh34q5dgg3le@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 Aug 2021 18:33:07 +0100
Message-ID: <CAFEAcA-QW1_sLEArKY1jBJkmGdKQukgwe=O36p7gDpH2mFceqw@mail.gmail.com>
Subject: Re: [PATCH v0] kvm: unsigned datatype in ioctl wrapper
To: Eric Blake <eblake@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 johannst <johannes.stoelp@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>,
 johannst <johannes.stoelp@googlemail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 30 Aug 2021 at 16:47, Eric Blake <eblake@redhat.com> wrote:
>
> On Sun, Aug 29, 2021 at 10:09:19PM +0100, Peter Maydell wrote:
> > Of the various KVM_* ioctls we use via these functions, do
> > any actually have values that would result in invalid sign
> > extension here ? That is, is this fixing an existing bug, or is
> > it merely avoiding a potential future bug?
>
> My question as well.  If there is such a bug, calling it out in the
> commit message is essential; if the bug is just theoretical,
> mentioning that is still useful.

I found this glibc bug from 2012, filed by some random guy named
Linus Torvalds, and still open:
https://sourceware.org/bugzilla/show_bug.cgi?id=14362
where among other things he claims
# As noted, this does not actually cause problems on Linux, because
# unlike FreeBSD, Linux knows what the f*ck it is doing, and just
# ignores the upper bits exactly because of possible sign confusion.

Whether that's still true a decade later I have no idea :-)

-- PMM

