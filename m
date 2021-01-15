Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 634C12F7FFA
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 16:50:40 +0100 (CET)
Received: from localhost ([::1]:46216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0RN1-0002fA-FL
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 10:50:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l0RDR-0001wT-8A
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 10:40:45 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:45330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l0RDP-0005ED-Bv
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 10:40:44 -0500
Received: by mail-ej1-x632.google.com with SMTP id ke15so6233605ejc.12
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 07:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YyleLIaAGzaShdrDc+e75gdNdqoij+HNUiGfu0OeNa8=;
 b=zWMJRHesP2CyLoYGCV5oGzYuO6kwRZ2oR+ynNOROnUtHw7wXw/OsjYYrhDDsQ6rsFH
 p2AoXtPwTc/lP9jIQ8YakgMWSdcYHSQe02fyoKfJ6argNy/BGUFe3AGLmCY6+m7jEN/4
 rHcPtWVuMEF+aAyfTu1ns5F9Fk5feBj07S4sIGnc1x+juCNp4lvFRjkEWpNhxm/3lMtp
 aVouQ4X8BkI/+mcgOMROLL8cVU1EymBO5UnN3jWSuv14qe4fSVH5BTLWquHB+AAdoGqJ
 td2HYwHAHVnLIq8QP5nCY2+1Q4oJ5v8OcPWjXnfrvFJiLDBerlji/9zNi9jA3+dld9Zk
 4HjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YyleLIaAGzaShdrDc+e75gdNdqoij+HNUiGfu0OeNa8=;
 b=WEOVVMfLnkWPtwdD4Sm0WGlNU9tFgjfoaisg6ZvNniAbMdO7XfvaqKAdFAZUIiamtz
 FUrb24RfHe54bEYMuJs56bWbgrV7tXEXUTbZVsmnxktaaPvl+dH1+Hu8sdyIQ6c+Ec1j
 VcNNXFiYKXZf2DlaGsb3ylDNSSgZTLuuZIBET22jCxS5xF5A/GygDh9HFJPY9Dr5jvKK
 7rKngk8BuLP7XvoD5cTLXabxjJeY/PzQINR8VQ/wcFsMzRfvj2Jq4AbDQwD1nIrwZNxM
 3TcHVrTf3AxpEOXmJ0oiiTs6QFTBNpKQOlkLN3ACN/YMNw5qtNHymLZSTorRPpnGhPN6
 nbJw==
X-Gm-Message-State: AOAM5328pQfVgMAB8ygcgAW34WdPmE2I9uiQ+Ue1PmLMRh89vl1cRzjm
 c8NvRYDunWnFAUgArj9UEep1BK++tt55twa7fb20gA==
X-Google-Smtp-Source: ABdhPJyyNLmszv7pNWg3YcMI8H4WAitB1fjjMWRBKROkTNCPi8CHJVcXc6mB1wFo5WGkKCQyH1rdy1p8viiUOAt84Uk=
X-Received: by 2002:a17:906:3d4a:: with SMTP id
 q10mr9391161ejf.85.1610725241233; 
 Fri, 15 Jan 2021 07:40:41 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA8ozrnbh8XVZa8OF9C9SnNKb4Wb-=gZianHPPp5zcKjmw@mail.gmail.com>
 <980269ad-bd28-08e5-0be0-fb5564aa7cd5@weilnetz.de>
In-Reply-To: <980269ad-bd28-08e5-0be0-fb5564aa7cd5@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 Jan 2021 15:40:30 +0000
Message-ID: <CAFEAcA8myFRpx9KOYY4nw_jX81_Pz1OgCb4dQjoEMUVnFLLSJQ@mail.gmail.com>
Subject: Re: Windows installer builds apparently broken since October?
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
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
Cc: John Snow <jsnow@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 15 Jan 2021 at 15:34, Stefan Weil <sw@weilnetz.de> wrote:
> although I have some local fixes (available for example in
> https://github.com/stweil/qemu/) I am still struggling with 5.2.0.
>
> One problem which was recently discussed on the list is the directory
> structure of the installation (especially the location for BIOS and
> similar files) which still needs changes (which als require updates for
> qemu.nsi). I'd prefer a similar hierarchical structure for both Linux
> and Windows (instead of a flat one which does not work with the current
> code).

Yeah, that was about where I got stuck. Somehow the way the
temporary install directory is created for the Windows build
shoves everything in a single directory (you don't get this if
you do a normal Linux install -- that has separate bin, docs,
icons, etc subdirectories). This gets even worse with the single-manual
documentation because all the files for the manual are then in
that same directory too :-(

I don't think I can really get this to work with the single-manual
documentation setup as qemu.nsi stands in master. So my plan is
to just commit the single-manual changes (probably next week some
time) and then we I'm happy to help with the Windows installer
changes necessary for the manual part once it's basically working
again.

thanks
-- PMM

