Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E97517045E
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Feb 2020 17:30:12 +0100 (CET)
Received: from localhost ([::1]:46730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6zZb-0002lb-9c
	for lists+qemu-devel@lfdr.de; Wed, 26 Feb 2020 11:30:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53717)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j6zYr-0002K0-Bt
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 11:29:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j6zYq-0002TV-3Y
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 11:29:24 -0500
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c]:40842)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j6zYp-0002Ri-UH
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 11:29:24 -0500
Received: by mail-ot1-x32c.google.com with SMTP id i6so3497845otr.7
 for <qemu-devel@nongnu.org>; Wed, 26 Feb 2020 08:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=XQpGTHkkwmIdWTJmKHSVWZFURZ/3d29YLidR1/QlfII=;
 b=aPOqnVwp8vtFKOM0xFH5AjNya/U+mUTP2HBD6xgTWVBBev2Efe4/J7boucJh0Ii1WE
 hJ7yH4DqWUELQNd+lnUW9E2YFJPI4pw5/1g8wOMdmrzNlFOadW3p7Ra3ZteVUfvStFsb
 S4NuKOm+B8sk4uUeS5Ol+cF+L3Cm9bM/wmeG7zeRSyId2NrjkvdqFNhzO4fHqU7PVnbV
 EHDQJxEiVn7bdPjtKMlyEI+oOgUvXQDbRryUPNYbJRQiZnPFgDCXgALJ4OQvsrW8LRGV
 lA+qQZlbytGQUUXgkgIr8e+8ZPETeL0D1fOk+0dPmZmclqOWBO/+RITyBcNr34jeJMCH
 UxVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XQpGTHkkwmIdWTJmKHSVWZFURZ/3d29YLidR1/QlfII=;
 b=AOl2bgAcTPQ8oxdGWcV4OdtELwKqc4S0optf9oI4rkkPscP7kDXo1CuPh5SZy5oOlX
 LABJovYe4ycjNFjpCEv0r+zJl4i6VC00XbgEoNShTJP3GuSOpdyHXELE1ZETxy0MFuUK
 fqVRLiELbobxzcWBjMy31riC8d4imIw4OJN3fWSP/UrSe3SaDFJo7ImClLJwS9bdWsSD
 /M4Q2dnl3D6+N/NUEkzbVQjpT0P9JsB7TtaTdaT1CSzgP/w4IXVJagbIqTZmtsZuqnrB
 8StKF5GpB2Hz3BfpHamYINJbQfDQ/x+u1HrDZntDPDvRVTK9I8hLN9tCTFntfr2DHc8t
 28xQ==
X-Gm-Message-State: APjAAAWtC5U13pwb+tPVtl3Q6kYG9ZxVvdk/zqE3rN8D2sDlRS7K+SuC
 UoI1yvp0CqhGh1vmgErRJhVIfvccaECI1V2PkoS4kg==
X-Google-Smtp-Source: APXvYqzDt7grsd+BgN74PX5kyizo1uLmcBF2AELyCiDr8MAgkoL1jVkasQxwMRmY/yXXovxcgGXIJRqCNjFf03JOMVA=
X-Received: by 2002:a05:6830:184:: with SMTP id
 q4mr3843862ota.232.1582734562458; 
 Wed, 26 Feb 2020 08:29:22 -0800 (PST)
MIME-Version: 1.0
References: <MN2PR02MB5935836FBB0AC02F56278FE3CAEA0@MN2PR02MB5935.namprd02.prod.outlook.com>
In-Reply-To: <MN2PR02MB5935836FBB0AC02F56278FE3CAEA0@MN2PR02MB5935.namprd02.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 26 Feb 2020 16:29:11 +0000
Message-ID: <CAFEAcA_iXuc_r=wJWhHjZ1ROvfCwsxbU0yyiwJpqaxDfFtfmbQ@mail.gmail.com>
Subject: Re: Implementing IOMMU support for SDHCI
To: Sai Pavan Boddu <saipava@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::32c
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
Cc: "pbonzini@redhat.com" <pbonzini@redhat.com>,
 Edgar Iglesias <edgari@xilinx.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 26 Feb 2020 at 12:38, Sai Pavan Boddu <saipava@xilinx.com> wrote:
>
> Hi Poalo/Peter,
>
> We are trying to add SMMU support for dma's used in SD controller on Zynq=
MP boards. In order to do that we need a clean way to assign MemTxAttrs to =
each device(i.e all devices which connect to smmu) via "object_add_link_pro=
perty/ object_set_link_property "  functions.
>
> But in order to do that, first we may need to convert MemTxAttrs as QOM o=
bject. I just need some feedback, if its advisable to do so ?

We create and throw around MemTxAttrs structs a lot, I don't think they're
suitable to be QOM objects. I don't think you need it, anyway -- your
problem is rather that the iommu doesn't get an opportunity to sit in
the middle of transactions the way you'd like it to, and making
MemTxAttrs a QOM object doesn't help address that.

thanks
-- PMM

