Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D03332CC5
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 18:04:22 +0100 (CET)
Received: from localhost ([::1]:54174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJfmP-0002cB-IZ
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 12:04:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1lJeyb-0000MP-Qh
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:12:53 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:45061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1lJetg-0007iK-E9
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:07:53 -0500
Received: by mail-ej1-x62d.google.com with SMTP id mm21so29092565ejb.12
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 08:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=livius-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=IKDBP8uEZYvUqECGbg00leh1rR/lxMB13fwXifWuId8=;
 b=kzwpflG/jQJuAxswxOqkBCldhFPfwzqsulxi9fgraCmS0sANhs590LxT9eHJR173bD
 8FmmPY+6O2uyWNozOCH4vpliQari3m8xdJhH5Spuyvij/pYZ7X097up6gXcCiFZrKzIp
 SflOnIhysXZEoTjQ+3XQ0HupvjACxzi6Ch4SwvT4ezpFe2IfACyBXnA1Cj08esQDrnpQ
 DOA/ma/uSgJezf25FgIVYV2HNCoh0o4OeH64AVILnIhERFxtzInHSTAQZvm2+2Ks3sTE
 1KueP5bOfr98IUV1gfQj3vUE4+uTsxadrUHPOdhFqzh/79nANYC4tGW4bi/3C3UUIa+2
 pagg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=IKDBP8uEZYvUqECGbg00leh1rR/lxMB13fwXifWuId8=;
 b=gdZ6zld9+wzt8o0H4aOhpSyjMf3gGeJRUvfRe/9opd4LtHenae98FruPjrT+RohiLX
 iGt7Roiu+jhXUhKtFS+yqYqaIuTB6t2bkpw9tFTNM10OSThke6I5P4R2P68gw+vRSLy0
 +UmAmgcGtyvMhGmvFnFgN+SGBjTZxZwP04s16Je288VHlAXHRzB5tIKNFG0XozeFgy2R
 lpj8CELJLdw1Pw1DhsOGQcrOY0VWPEekCyok/3StBwqB2Thm27MlqzLlQtVO7G2F2aIR
 WfG18T68qEOpZzwJCFs5RtBrZ9A/6A2o70UvXwD8ZnipUbTLagsc2FesdDnxqfcnuPaP
 6Bqw==
X-Gm-Message-State: AOAM532yDO/oiBNRLLX5I8AAmbie7WI/6j3zN1gazeWt46P0UPnTxST6
 Qo/sQC4VHKi3fUHEqvVAuJwgJQ==
X-Google-Smtp-Source: ABdhPJxqjDbaWu8ZmF6qDfig0Xwu248ZF//53YlbaZcYkV6STyepjK1ngbBC33InrpeUZTcBuEfJtg==
X-Received: by 2002:a17:906:f9d8:: with SMTP id
 lj24mr21062905ejb.200.1615306066693; 
 Tue, 09 Mar 2021 08:07:46 -0800 (PST)
Received: from wks.local (5-12-20-125.residential.rdsnet.ro. [5.12.20.125])
 by smtp.gmail.com with ESMTPSA id r17sm781071edm.89.2021.03.09.08.07.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Mar 2021 08:07:46 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: Malfunctionning qemu-system-arm ?
From: Liviu Ionescu <ilg@livius.net>
In-Reply-To: <943374ff-fc7f-b0bc-0b53-0e7487cdf810@trusted-objects.com>
Date: Tue, 9 Mar 2021 18:07:45 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <417B050D-9629-4AB8-A04E-F12BFAA72CB5@livius.net>
References: <20210211141515.8755-1-peter.maydell@linaro.org>
 <14af0670-caaf-caf1-0b90-fb10c7db13b0@trusted-objects.com>
 <e00943e0-b9a7-1688-b169-3650e8e4290e@trusted-objects.com>
 <FBA649E1-4EFB-4409-894E-C1A5AB086BF1@livius.net>
 <943374ff-fc7f-b0bc-0b53-0e7487cdf810@trusted-objects.com>
To: vincent Dupaquis <v.dupaquis@trusted-objects.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
Received-SPF: none client-ip=2a00:1450:4864:20::62d;
 envelope-from=ilg@livius.net; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On 9 Mar 2021, at 17:58, vincent Dupaquis =
<v.dupaquis@trusted-objects.com> wrote:
>=20
> Thanks for the responses, I'll have a check on this.

It is based on a bit old version of QEMU, but it is fully functional for =
the peripherals used by the CubeMX initialisations.

I use it to run unit-tests, as semihosted applications, for example:

=
https://github.com/micro-os-plus/micro-test-plus-xpack/blob/52b5e65fc865bc=
72c4c9d46ff016c13357247f54/tests/meta/CMakeLists.txt#L205

> On the other hand, it would be more on ST to invest on making those =
emulations running ...

Yeah, sure...


Liviu


