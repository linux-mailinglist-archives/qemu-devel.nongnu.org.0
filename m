Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A23034ED18
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 18:04:16 +0200 (CEST)
Received: from localhost ([::1]:45718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRGql-0002mT-6j
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 12:04:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1lRGml-0000lf-OO
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 12:00:10 -0400
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836]:33511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1lRGmi-0004Ug-0N
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 12:00:06 -0400
Received: by mail-qt1-x836.google.com with SMTP id 1so11608986qtb.0
 for <qemu-devel@nongnu.org>; Tue, 30 Mar 2021 09:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j1IsNcYCUgDRR9K5pf3vuijlmb0C43wB3IwcwLZT9E8=;
 b=K4z+RjIFIHVfrEcx16FdMoMY4soYg440ObSk47gcqBR9tYr/uQX+W/De2iULztcNwW
 3/TEJxTtRhmHWYHfGxUa9i2rO5NSzPAIjiaEBKW+Wk6r+rB6mu2Oo6386Ywr23NcapO6
 6PBxYqj6SrzposRt4zI1XHUeIrla/v3Nx0z6G0Lu70cfIWK43FQdF7wbPz2fo34/Mter
 Tv4dWAbLSic2wv4YD56+Hy7kYLD9C/+RdducIeUStXD+tItxsDI8rQvaf5Vvl7pwpDoi
 H1dmU9fGN6go//C+rKHagNRHmd66V3cGWa4Z/uq/LkURvBuobUs2xo4hyZaq1Z1MoPWx
 9CEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j1IsNcYCUgDRR9K5pf3vuijlmb0C43wB3IwcwLZT9E8=;
 b=Ui30s4Nk0W419MYT4pTzyNJfBmnFQbAJvM9L/pJ0PTz4VhSaBjMRrfoBXUuhS37YYU
 Swusx1ehtvuNd28ySlYDrG2bz6rPvg2tj5CZsHi4JU1Tlyp33wKjtd9pM/RQzk3Lt6qi
 Qn9ay3HHjd32nb4Du1jFPCyUDCeNg4pCq0ResglXqbuVmGxWRB1AXv25v0IVa7iBZ8NR
 q3XpW9c9iTca3fQ4ax6IbYIgTTkbBydnebJYCWRdMmXUkNutSxZnj4kWpHH2euELGPnO
 Wj0P9iNfhZNO1ENG/5msKvqC7DsbAFjBJFKx4Wi9bTExoW5s5nncs/P2YGMS8gNe//Zl
 K1Lg==
X-Gm-Message-State: AOAM532LKRj+wnC0z5yBnzTnXvG9OA70rfLyEZXMHvr9Ie3aiPGt/4sM
 QP1nAGcx8xunDKR+xM9kUzjkcn2hNAo2XDGyPKXYMg==
X-Google-Smtp-Source: ABdhPJziPN7dPoa05lBinxWfsHAfHpMGM9s239idfhZoxKxvW40Iaqxi0zzfXKcv+IKY815Q1sx2+rw6E6RwcKBELBE=
X-Received: by 2002:ac8:4f10:: with SMTP id b16mr27383874qte.235.1617120000673; 
 Tue, 30 Mar 2021 09:00:00 -0700 (PDT)
MIME-Version: 1.0
References: <b351f107-a9fd-f7cf-1f27-2d435cea612a@amsat.org>
 <d05a40b2-ff80-d9c8-8dfe-5dfce2e57d3d@redhat.com>
 <YGHf3HjYTRJwktbf@stefanha-x1.localdomain>
 <YGMJSoIGa5VoVDB1@redhat.com>
 <04e5e251-7a09-dcf6-82ad-31bf696bc248@redhat.com>
 <902a93ca-bd71-504b-fcf5-fec2480f9ec0@redhat.com>
 <a5a40558-4f5a-223d-a7ea-c02f7fc14eef@amsat.org>
 <1bb868bb-d9d7-3a9a-cbd4-2e1780b46442@redhat.com>
 <YGMjypzf1hHk47bC@redhat.com>
 <23fcbe91-1b9c-559d-1a61-6cce839bb390@redhat.com>
 <YGMnVy4LDHu28wW4@redhat.com>
In-Reply-To: <YGMnVy4LDHu28wW4@redhat.com>
From: Warner Losh <imp@bsdimp.com>
Date: Tue, 30 Mar 2021 09:59:49 -0600
Message-ID: <CANCZdfqE9wOppe2PYco7-x630Q6xeCezG6=nh+UfbgN_j140HQ@mail.gmail.com>
Subject: Re: Serious doubts about Gitlab CI
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000331fcb05bec3171b"
Received-SPF: none client-ip=2607:f8b0:4864:20::836;
 envelope-from=wlosh@bsdimp.com; helo=mail-qt1-x836.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000331fcb05bec3171b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 30, 2021 at 7:33 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m>
wrote:

> The use of submodules has imposed significant pain on QEMU developers ove=
r
> the years, and as such I think our general goal should be to have zero gi=
t
> submodules over the long term. Usage of submodules ought to be considered
> a short term workaround only, with a clear criteria for removal. We shoul=
d
> continually introduce dependancies on newer & newer versions, as that mea=
ns
> we'll never have any opportunity to remove them and reduce the cost on
> QEMU.
>

submodules have caused me significant pain in rebasing the bsd-user work.
The way QEMU does things, you wind up with unclean trees after a build,
which causes grief at times... I for one, would shed no tears at the number
of
submodules dropping to 0.

Warner

--000000000000331fcb05bec3171b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 30, 2021 at 7:33 AM Danie=
l P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">berrange@redh=
at.com</a>&gt; wrote:</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
The use of submodules has imposed significant pain on QEMU developers over<=
br>
the years, and as such I think our general goal should be to have zero git<=
br>
submodules over the long term. Usage of submodules ought to be considered<b=
r>
a short term workaround only, with a clear criteria for removal. We should<=
br>
continually introduce dependancies on newer &amp; newer versions, as that m=
eans<br>
we&#39;ll never have any opportunity to remove them and reduce the cost on<=
br>
QEMU.<br></blockquote><div><br></div><div>submodules have caused me signifi=
cant pain in rebasing the bsd-user work.</div><div>The way QEMU does things=
, you wind up with unclean trees after a build,</div><div>which causes grie=
f at times... I for one, would shed no tears at the number of</div><div>sub=
modules dropping to 0.</div><div><br></div><div>Warner=C2=A0</div></div></d=
iv>

--000000000000331fcb05bec3171b--

