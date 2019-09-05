Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B067AAA480
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Sep 2019 15:34:05 +0200 (CEST)
Received: from localhost ([::1]:46130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i5rtk-0005JK-RT
	for lists+qemu-devel@lfdr.de; Thu, 05 Sep 2019 09:34:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47714)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i5rrE-0004D3-Pf
 for qemu-devel@nongnu.org; Thu, 05 Sep 2019 09:31:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i5rrC-00077t-Cp
 for qemu-devel@nongnu.org; Thu, 05 Sep 2019 09:31:28 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:35866)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i5rrC-00077k-7l
 for qemu-devel@nongnu.org; Thu, 05 Sep 2019 09:31:26 -0400
Received: by mail-oi1-x242.google.com with SMTP id k20so1825270oih.3
 for <qemu-devel@nongnu.org>; Thu, 05 Sep 2019 06:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=gJfPVPG7MuPxV5jp++v4Gelba9R4W+xGywWI03N4afY=;
 b=tbu48F0rndJ+vhXCV2RkVBhM6MULsMzyktlTm5WFxDLQOEjysncBqa6s4PahZmgpE9
 B46E+HFcojvy2WAFg44LTKwRvFcfwS6Pe/9usXXFPEpb6nYp7546+4/LTXLHo+7f04Px
 l85IBv5OZ1ROvItPIS4s4Bzy7Wlvg92LMcooPGI9RvV7lDHUGuAdXDl9Ah/yxeTU3RbR
 Z3Yy2E7fAYdufjwBM35fF8zw0bzmwcLdGZLf9p+9bkuQwzMuqmGOshkjaqJlwDF6q/O+
 e1HZxhwtnupRHne29svA2lFUWQlgAJHLJRDitWJIPaeWCQ9RBbz/ZYmXrDWKgk5athIF
 DbCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gJfPVPG7MuPxV5jp++v4Gelba9R4W+xGywWI03N4afY=;
 b=TZQ6zeQaw+L+3ueM07aVrwG+zk1AI9lGhDaO7GY7D4ELo9sL/F+vm4lhhcLJBsJU2O
 +SXaUU6QzWUEiLmH0N63q/kA+RClbXXg+u9a2PJKtXV1q/nbvxhac1FOisCBp+B5heVG
 ncF41TMKuTE3VN6UAX5/Cl/1fsBSlV7iW+5x59kUM6hdKfbO0/uwWI/hrfNyh8/QGR8e
 XqqsNRYkfJbloXNR21etUa0oXJ3GTfsCDOKbVg+Y++32LDehVNMseOHX3gsMkmW8/nHw
 uaMClTf1UTCinYaM8yt0wjZqRmroQ6irFaASlkqg5zNaqfXBDr8oH5PetlnnxX5UgqCM
 uOQw==
X-Gm-Message-State: APjAAAXqxZQqw5GuwmjghRFZAS8N/2GGpPnP/qszybHmS1cNMVKMztK5
 rQQ2OraWCqKXCLVLxlvM035f96Fy7AMpoOPxRHZFIQ==
X-Google-Smtp-Source: APXvYqymVd5apEfJc2iPNmSxWS3MlPWi7LlLtHb8M0+yFTVKByiQnw956VU3MAKaU+h1TLN4FMBDrQn67rwFD28Z9L4=
X-Received: by 2002:aca:50d8:: with SMTP id e207mr2479093oib.48.1567690285290; 
 Thu, 05 Sep 2019 06:31:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190829165036.9773-1-berrange@redhat.com>
 <20190829165036.9773-5-berrange@redhat.com>
In-Reply-To: <20190829165036.9773-5-berrange@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Sep 2019 14:31:14 +0100
Message-ID: <CAFEAcA8UNsAdYn=+9Py20G-xbFC2v1aWNufviX1XFymvKm3hrQ@mail.gmail.com>
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-devel] [PATCH v3 4/4] docs: split the CODING_STYLE doc
 into distinct groups
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
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 29 Aug 2019 at 17:59, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  CODING_STYLE.rst | 9 +++++++++
>  1 file changed, 9 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

