Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 877555BB14
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Jul 2019 13:58:52 +0200 (CEST)
Received: from localhost ([::1]:57574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hhuxP-0007Jj-Q3
	for lists+qemu-devel@lfdr.de; Mon, 01 Jul 2019 07:58:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50835)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hhuvH-00058i-66
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 07:56:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hhuvG-0003mG-9T
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 07:56:39 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:37668)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hhuvG-0003lc-3n
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 07:56:38 -0400
Received: by mail-ot1-x342.google.com with SMTP id s20so13180840otp.4
 for <qemu-devel@nongnu.org>; Mon, 01 Jul 2019 04:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fM83QGm0HZFZIT205rVupzbm0V7pt4s+8qOZpv9c5nw=;
 b=Cs1mIuWDF+DI5imKO20y6f2YpAxNiKFA7j/8c2W+N73CvtIwPQimnZcMCarzbKXs67
 +KZedhjzJ01vGtoGdvKW57m5b0DYYPvnSSNLkfWuBkmMSHqYjxQJTCIrFjHrUhEnTe8w
 stOWgrFwitmPK09hi+ys6MtN86nhc83kD7aSie+dt/Vnl1Xwl2VGp59Z1sNI+VFJ6FAZ
 C8BIe9bmTHCGpPzwVTtihoE3omA7E91I6pBJM/yuaqwX+3XgvJeRdApRPl32vU+cUHrF
 /noJKVwdu5nD+rsceClZD0lMxa8RAtTeaqgNiiIkmBi594/spyFW4sbjUSi+RXBgBwq1
 EYBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fM83QGm0HZFZIT205rVupzbm0V7pt4s+8qOZpv9c5nw=;
 b=iUA+Vp8rmfBR343qKv0ENiFk24xaxJpcqRysguw5QC2waGNbA2oeKcAanaZQnhP4lE
 96iZ+4Y0u6BCleHxsccNAYmAWO1Fd8s+EcyOBW09ZfIUFSDeP1T1LUEGwvVQhgDRaWUq
 QtfQCzQwFwqNV1GNskyapNjR3/zUedXYvAM42nK71Ejihj01yzQI70GAlXhn1xgSte+K
 VvK39PcdzsVFkGKBiasSmuv/9uOMQepCPM+FasmCJZWvccmIg8EiS0Gx1KlAMoZs7axQ
 GihqjQF86C/9UiO0kQcNibBECJQa6H2TsVBsZT/SJ5ad6t3TwE+e8lMTiAR3FAXMna4B
 5keg==
X-Gm-Message-State: APjAAAXE5tCxK3aj6w+urIrjQO1Mn/IYDbAXrb1YbqiuZsTflehzIanW
 3iuBDvQMxZu3pb6YAGRchtWdcTMM7pZFF4GkKlaiwg==
X-Google-Smtp-Source: APXvYqwq6uXTOq4AI8zzW4Oca55F3xKHtj4238tzlM0/aeRzad8mgWNOBHRSVLR3O+t7H0w6e8MNeUE3bD6GHr8LKyY=
X-Received: by 2002:a9d:711e:: with SMTP id n30mr18251401otj.97.1561982197082; 
 Mon, 01 Jul 2019 04:56:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190416013902.4941-1-andrew.smirnov@gmail.com>
 <20190416013902.4941-5-andrew.smirnov@gmail.com>
In-Reply-To: <20190416013902.4941-5-andrew.smirnov@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Jul 2019 12:56:26 +0100
Message-ID: <CAFEAcA_eGUy5y+e_8buBy3yCB78BeyAxZawMFU2j-h0TOF98PQ@mail.gmail.com>
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-devel] [PATCH 4/5] pci: designware: Update MSI mapping
 when MSI address changes
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 16 Apr 2019 at 02:39, Andrey Smirnov <andrew.smirnov@gmail.com> wrote:
>
> MSI mapping needs to be update when MSI address changes, so add the
> code to do so.
>
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: qemu-devel@nongnu.org
> Cc: qemu-arm@nongnu.org
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

