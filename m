Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DECC418D8EE
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Mar 2020 21:23:55 +0100 (CET)
Received: from localhost ([::1]:58804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jFOBO-0005vK-Dw
	for lists+qemu-devel@lfdr.de; Fri, 20 Mar 2020 16:23:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36677)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jerry.geis@gmail.com>) id 1jFOAc-0005Wk-UE
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 16:23:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jerry.geis@gmail.com>) id 1jFOAb-0005Co-8H
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 16:23:06 -0400
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834]:33443)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jerry.geis@gmail.com>)
 id 1jFOAb-0005Bn-30
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 16:23:05 -0400
Received: by mail-qt1-x834.google.com with SMTP id d22so6194515qtn.0
 for <qemu-devel@nongnu.org>; Fri, 20 Mar 2020 13:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+/ZKaiA3iGCzdq9LT6qeFDxaW1kTFzHLKGIBGouJUEo=;
 b=GFH95aq2QD7EzATkpWwB2756wJxUQX8gREC7E4y9TqaHFsonGvMJQEZd2dP+tQuoqi
 S0kLbP6Cg4qfBFSmSwwVQaZG9ZpxrfNTzb4jK0SjUacuJVm7DDni+P6Q80nfwq2hHCAL
 a+qaqBaJMFgsAW5KEiXRWltm7VKrfAiGEUipUeqIRSa46DLeSuFjFxgyX8fEBjQkbCGZ
 YBX/BEpwoCGpBWCDzET/6sv644lczQGDXeMUqWiZyz5HuSMuhjI/MZvSa+FZx4pAaKyc
 XYKHAfoo3B74Rx8VaqPm3/PNUpYJDYaZObEuPkiN5ue2YsgSEJsZmX5YAUvcr0IlsDVt
 IMrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+/ZKaiA3iGCzdq9LT6qeFDxaW1kTFzHLKGIBGouJUEo=;
 b=fTLr69lwsfzBzPQ82LtjpxRpQD/EhGcrTNvwDqqotPMhMpRHzskE9OIoU81k6z0LxM
 Blq8FfkN773sjbVzkxlvcxy/ZNy6y3khTu2PRLqVc2kxbjgWSLrs7e66uDMEoGJVFgoL
 zBEckh5zVLog71Z5He471IZ/ci9ZDPYq6gKDFa97vt6TOnALoI3pvgSQHhaAB5REcu1i
 1ILJvhX0FXz789iS1AEBFIS/7GNngjdZSTJIthuvGwKEQGFKESpjvY1GGScxdMXSCGqC
 LOHf9CySX5WNP9VNYyQeXLA0FCVqTEFa/mh0S1roj2DAT5uDbpVsXaVMBSPAqW/sS/hH
 BWzA==
X-Gm-Message-State: ANhLgQ1MZznHJuuDQsayHHiQf8v3ZQo0GUddMX+UyDZ8fDxjIZjnp5SN
 U+9Z26FkxqmFquhOPWZyaYjgqyeywMNJadf7UQGmcQ==
X-Google-Smtp-Source: ADFU+vt6tDIEcWdmt4geC12uxJ0etg4FWcdQ2WrXJiZSbNhyIZDD8gozX81XGCTWddnNkaEuzraDN0O+heXh75U1rcI=
X-Received: by 2002:ac8:2bf9:: with SMTP id n54mr10207821qtn.280.1584735783602; 
 Fri, 20 Mar 2020 13:23:03 -0700 (PDT)
MIME-Version: 1.0
References: <CABr8-B4RQo3OT6ogt7J=OWGhOpD6LqHt9zkp7dZTmqifiPCtyA@mail.gmail.com>
 <f51c571b-5eda-7837-36bb-9dfd3be39eb9@weilnetz.de>
In-Reply-To: <f51c571b-5eda-7837-36bb-9dfd3be39eb9@weilnetz.de>
From: Jerry Geis <jerry.geis@gmail.com>
Date: Fri, 20 Mar 2020 16:22:53 -0400
Message-ID: <CABr8-B5fCLfLk39f9s-4TyV+0iQbqHborKyV_SR1PsdCHXRNkg@mail.gmail.com>
Subject: Re: Qemu on Windows 10 - no acceleration found
To: Stefan Weil <sw@weilnetz.de>
Content-Type: multipart/alternative; boundary="00000000000071d0d305a14f0da4"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::834
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000071d0d305a14f0da4
Content-Type: text/plain; charset="UTF-8"

So I tried --enable-whpx and I get Invalid option. Im on Windows 10 and
QEMU 4.2.0

I'm confused.  Then I don't know where to download the HAXM. The place I
found is GIT and it wants the user to compile it. I was looking for just an
EXE.

Thanks

Jerry

--00000000000071d0d305a14f0da4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">So I tried --enable-whpx and I get Invalid option. Im on=
=C2=A0Windows 10 and QEMU 4.2.0<div><br></div><div>I&#39;m confused.=C2=A0 =
Then I don&#39;t know where to download the HAXM. The place I found is GIT =
and it wants the user to compile it. I was looking for just an EXE.</div><d=
iv><br></div><div>Thanks</div><div><br></div><div>Jerry</div></div>

--00000000000071d0d305a14f0da4--

