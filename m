Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CBD1771FD
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Mar 2020 10:08:15 +0100 (CET)
Received: from localhost ([::1]:43942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j93XC-00005o-0i
	for lists+qemu-devel@lfdr.de; Tue, 03 Mar 2020 04:08:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43437)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j93WK-00085C-5b
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 04:07:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j93WI-00009P-Vc
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 04:07:19 -0500
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334]:36221)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j93WI-000091-Qn
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 04:07:18 -0500
Received: by mail-ot1-x334.google.com with SMTP id j14so2272641otq.3
 for <qemu-devel@nongnu.org>; Tue, 03 Mar 2020 01:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UazVJEFIdb5jexGclQBbRjblNtN3xTwRHhe8i4ijzmk=;
 b=EOt/j/xyFhTnk3MYsWmBoGfXAG0nNfVWwwhD888PI7UV3xVf06Gkm5mY+f9z1gmEGp
 qJQ1eZRJy3YznNbCXWUzdrWpSduzokpRcr3dwkb9TRcZ+MLL5GgiV9DYmXbZd/usXtiq
 /6G94VShL3lu17ZecxmOgSZ7uWLbGrUOFwlP4r6AeMprwF+X9Y7TWtLBLfspZ7LyWXJl
 6DBke9FJvW6MstOs0KFp4PwtifKDbe/Y3KPjlopKoAgHPDCvRp/MLy0Mvz3nkArZ2ERM
 16Icqb8t46h5gnGWoZHfopYFY2lMGpur5gW5VgwnY/kCa2HmvDJN7hQ4kWj8tMs6fQlt
 +U0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UazVJEFIdb5jexGclQBbRjblNtN3xTwRHhe8i4ijzmk=;
 b=Aeam+8C+N3Eka8qmBt2PcqGyqb5eeN7kZWGKdzpvmDrqg8TVTCIvPIMREv8iIZurb2
 YORRL23iQ0waeYJ1Bn6gcGvvbqRnk/HbymN0lPr/Dlcdv/9zB6wsiskIgYvcsJOMGRrP
 rGq1SCSHW5THkXMDUKrIL488Y7E/j0dsp0GYcbW87JiKgcozVVhBeklTKo2yHaXAeDjV
 Bh8I1P6Oa6cUIxIOyl9hi3IjQr3zfm5UaJdbHx13h1E5U0Q0qVIYdKW1cnW6kEI4dYWn
 PUd2QYm3ukAvUbQHJR/WqWgrq3aYeNnQod1R3bp2Lm+YiysBG8rIPpw2Wug0eA2Y1ssB
 hSdA==
X-Gm-Message-State: ANhLgQ0Q/SD7BBO3HKVo1H+2bNOsfvlGIxNLH/INvIvwZRLXHUg720nd
 YngGbqnCgMAkHQJoXqXSAA4QM6PE+rCQk3MS4lYY8A==
X-Google-Smtp-Source: ADFU+vsBiHYtk10inaC5d9lk6KRTscWlCiLMJwvYvFRmpM2kkt+d6iB1SOo88bjfIPOXFBFM7lhsnfQiO+u0/rdejFA=
X-Received: by 2002:a9d:75ca:: with SMTP id c10mr2446793otl.97.1583226437866; 
 Tue, 03 Mar 2020 01:07:17 -0800 (PST)
MIME-Version: 1.0
References: <MN2PR02MB5935836FBB0AC02F56278FE3CAEA0@MN2PR02MB5935.namprd02.prod.outlook.com>
 <CAFEAcA_iXuc_r=wJWhHjZ1ROvfCwsxbU0yyiwJpqaxDfFtfmbQ@mail.gmail.com>
 <MN2PR02MB5935FCFCAB2C3CECE898B290CAE80@MN2PR02MB5935.namprd02.prod.outlook.com>
 <CAFEAcA9h29YvbXSZxq4xFg_NbiYr-amqF9QGBS8nBvhvLi1WhQ@mail.gmail.com>
 <MN2PR02MB5935222A7AAD7518BD4F5DF8CAE40@MN2PR02MB5935.namprd02.prod.outlook.com>
In-Reply-To: <MN2PR02MB5935222A7AAD7518BD4F5DF8CAE40@MN2PR02MB5935.namprd02.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Mar 2020 09:07:06 +0000
Message-ID: <CAFEAcA9esoLLxeG_oe9d=cSKtJGhyVytLdPNTxXJOT7XJ0dsxw@mail.gmail.com>
Subject: Re: Implementing IOMMU support for SDHCI
To: Sai Pavan Boddu <saipava@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::334
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

On Tue, 3 Mar 2020 at 06:05, Sai Pavan Boddu <saipava@xilinx.com> wrote:
> > From: Peter Maydell <peter.maydell@linaro.org>
> > I don't think any of those scenarios are ones where you'd want the board
> > model to be passing in a MemTxAttr at device creation time.
> [Sai Pavan Boddu] Yeah ok, this makes sense. Only things which me might need to configure are master id's and trust zone settings if possible.
> May be we can set them at soc emulation level i.e "hw/arm/xlnx-zynqmp.c"

For that kind of thing, a good guide is to look at what the
hardware does. If the device inside the SoC just has
a hardcoded master ID, hardcode it in the QEMU device
model. If it has some signal lines that the SoC has to tie
off to 1 or 0 to configure it, implement that as a QEMU
device property (usually with the same name and basic
semantics as the config signal lines).

thanks
-- PMM

