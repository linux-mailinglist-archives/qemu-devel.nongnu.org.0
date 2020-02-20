Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA70A16654F
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Feb 2020 18:51:11 +0100 (CET)
Received: from localhost ([::1]:47225 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4pyg-0001NY-VV
	for lists+qemu-devel@lfdr.de; Thu, 20 Feb 2020 12:51:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44074)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j4pxW-0008Qv-CR
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 12:49:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j4pxV-0000DU-8m
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 12:49:58 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:40543)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j4pxV-0000B4-2n
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 12:49:57 -0500
Received: by mail-oi1-x242.google.com with SMTP id a142so28390450oii.7
 for <qemu-devel@nongnu.org>; Thu, 20 Feb 2020 09:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w909pNPxWSUnhNLXJu3bsKzp7hXuh5dlJWOv6OEzR6w=;
 b=zNqB5wwZZklQLVkVejsNO1/yEKGHL3UkxiuYN3hE1FLrhZwsH/13qw/N0zRn79E5Jb
 n2T4OP88aDUJTz2Vv/gEmI2LoF3tvwM+MYcdA1xNdFbPemuH3yjnBkjcCaRGdtK/194O
 eQ11dFySnHOyzpyHXDsTIqqrYPMxw58VIUg1f2GaNBJOdnvEf4smPMAN2+BSSvlpO6xN
 r7biNJs6lyTOhaUYVrrzuVlJ8A/QXgG+I+JB8rOxVoLncgOe/8NfR9RCeN+/1NgvPj/M
 4EqrrkkWhwrwvoelEz2llGuaFAicQb2oQwkFdNtzqWJ1tVN5R8p9saC8ukhKGocXcoGW
 VU/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w909pNPxWSUnhNLXJu3bsKzp7hXuh5dlJWOv6OEzR6w=;
 b=OO+k3poFFd/lh9H/Y+HkYIbfyUHM4CpgyoeF3Tm+H8sPWaO12u0vMP65o0G9YLckkS
 sXR2lyeeZ//zaFjKlaeWvY94nfWKamCAYnsizlFIdirmoWRJ72oL9RJj8zbJbe9pDoXM
 Rv0a9Fi9mdjtH13KzwN+0SjQSX93cVZcYFwbBXWUaciJg6uuET7yseE2hvH7+J8rsbzr
 YVR8MPHc1X+W095Rx3IWqBRJoyPlS1FllwZUE8scKW+8BiZ0Mnzv1jazq7yuOInZEDYA
 NS1UAup3HM6aDcaJYgKYRLeL01lx6sKlIckkR0kra6qd94suIhXYd58ZZjKqLJiQ4VA+
 RSaA==
X-Gm-Message-State: APjAAAUcZriyzbsvRPIef9qfPdbMebA0LfrulrFxqvpm9PJB1DOsIzg3
 9Obl+8QyhGiO/GsqIxIiEk2kM26C/132QDx65JWd8Q==
X-Google-Smtp-Source: APXvYqy8vwh+9W4uC9K3TqnnU13FrPcO7cwOJurnYWjVQdurKDlHwB49T3iSQC9rEnDZEX9f7F4q3bh5jK8uNdz6aD0=
X-Received: by 2002:a05:6808:3b2:: with SMTP id
 n18mr2861507oie.146.1582220992934; 
 Thu, 20 Feb 2020 09:49:52 -0800 (PST)
MIME-Version: 1.0
References: <20200214181547.21408-1-richard.henderson@linaro.org>
 <20200214181547.21408-20-richard.henderson@linaro.org>
In-Reply-To: <20200214181547.21408-20-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 Feb 2020 17:49:41 +0000
Message-ID: <CAFEAcA8AdL118-UpXFDqPcV4h-tg3i8xoD2FMUppNw86SbtoOw@mail.gmail.com>
Subject: Re: [PATCH 19/19] target/arm: Split VMINMAXNM decode
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 14 Feb 2020 at 18:16, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Passing the raw op field from the manual is less instructive
> than it might be.  Do the full decode and use the existing
> helpers to perform the expansion.
>
> Since these are v8 insns, VECLEN+VECSTRIDE are already RES0.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

