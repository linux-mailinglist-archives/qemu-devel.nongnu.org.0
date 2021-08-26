Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED173F88A8
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 15:21:02 +0200 (CEST)
Received: from localhost ([::1]:57234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJFJQ-0000PP-Bq
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 09:20:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJFE7-0002UD-PD
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 09:15:27 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:45604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJFE6-0003Ta-8G
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 09:15:27 -0400
Received: by mail-ej1-x632.google.com with SMTP id e21so6128477ejz.12
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 06:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/UkNg+S0E5Ze9o20iVzr0wYeHSQPp59AzIhUWQtgAdY=;
 b=OIulbnvVGsF2IDnk+PmvsvxU8MxOkJldOCB67O/GM1NuXSxSkcLL7Rug6RQohisaD7
 q1V6+Z1ctSn4AkMmA4+jgdhh/tJCO+Qmu7twoY/bNfzWJBRfvLpP1d04f++SAiYcSqK2
 yrgGauXheSDHvjBvE9hIE0wUKd7ibYVxSCETHmPapZjJg+mjLIIlDwMNDX3m6cj2sKDx
 f6Ed8Ww3W97xF0a5pHe/kNRePWPfqMOjq9V3zvdk4mAphbPaiAJmZMCLreuh7HrwxgD5
 xeKdkqWUqjpNrz6zkI0fN5zAjSuTeM/tnuCO96q89qdorfGn23I4JFzikWAKDkgZRadO
 N5Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/UkNg+S0E5Ze9o20iVzr0wYeHSQPp59AzIhUWQtgAdY=;
 b=rG7RrhlYfIzLXBs1IlQzlSbynvf9lnUABhGFcvGr2VTv7LpfTT0DPGsLtJUELK6E85
 IQloziAM7pNEuFdvXeftz+qIGAIkiQ1OZ7sS6CLyf4TXSgaM8lVD9GH+vm0YhMrfdhA6
 eIouASlZr/EJ1aacPEndpzX6o77uE8ZicucY48hV/wxaBWOLRDR4azEmFjhDQUaZZP1a
 eVL7e9dOWbQI5Q6VeSbm4S1swzaAGEw+4kuyI9pcNtj6tdom78pd9LlUeR8alSaW3tHB
 PfqyNA7uGBQ8KffPbE7v6Q9Se9aee+PT3oEnsVc0ehw6KSzS2mXTDr/mcFlb5KthS+cI
 0OTg==
X-Gm-Message-State: AOAM530imTLctrbuABNduowvxwRfwo/U71oQOD2T7DMt3e+cK56uMI58
 c6IRhw51SMGJMinFD4Kq2jqGaxyrCtSYB+8VEqhkdA==
X-Google-Smtp-Source: ABdhPJyL3/TLib7oz6oZbPpkmC6Avu2H5n/4A20BLj7fZUuas4G7k7ZRY0Uuf7U7LtI5n/PaTjiKsp4u0cfIttsvOn0=
X-Received: by 2002:a17:907:75d9:: with SMTP id
 jl25mr4291912ejc.4.1629983724719; 
 Thu, 26 Aug 2021 06:15:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210824201105.2303789-1-matheus.ferst@eldorado.org.br>
 <20210824201105.2303789-2-matheus.ferst@eldorado.org.br>
 <CAFEAcA-_=BYkEPpARFpieTUfEVVQq+yEQYDBvsjm5uGZUmVn7Q@mail.gmail.com>
In-Reply-To: <CAFEAcA-_=BYkEPpARFpieTUfEVVQq+yEQYDBvsjm5uGZUmVn7Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Aug 2021 14:14:37 +0100
Message-ID: <CAFEAcA9qAtoC1Tr8tqt8Ernc2VD+m6vd8PwqbGJ9VKOD=yFAMA@mail.gmail.com>
Subject: Re: [PATCH 1/2] include/qemu/int128.h: define struct Int128 according
 to the host endianness
To: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
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
Cc: Greg Kurz <groug@kaod.org>, qemu-ppc <qemu-ppc@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 26 Aug 2021 at 14:11, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Tue, 24 Aug 2021 at 21:12, <matheus.ferst@eldorado.org.br> wrote:
> >
> > From: Matheus Ferst <matheus.ferst@eldorado.org.br>
> >
> > Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> > Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> > ---
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Oh, you could add a comment before the struct definition:

 /*
  * We guarantee that the in-memory byte representation of an
  * Int128 is that of a host-endian-order 128-bit integer
  * (whether using this struct or the __int128_t version of the type).
  * Some code using this type relies on this (eg when copying it into
  * guest memory or a gdb protocol buffer, or by using Int128 in
  * a union with other integer types).
  */
 struct Int128 {
     ....

so we don't forget why we put this ifdef in.

-- PMM

