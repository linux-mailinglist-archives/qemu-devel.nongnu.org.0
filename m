Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC5E165C47
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Feb 2020 11:57:12 +0100 (CET)
Received: from localhost ([::1]:39800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4jW3-0004Xx-Jh
	for lists+qemu-devel@lfdr.de; Thu, 20 Feb 2020 05:57:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36401)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j4jVM-00049M-KP
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 05:56:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j4jVL-0000To-9T
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 05:56:28 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:39617)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j4jVL-0000Tj-3W
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 05:56:27 -0500
Received: by mail-oi1-x243.google.com with SMTP id z2so27101475oih.6
 for <qemu-devel@nongnu.org>; Thu, 20 Feb 2020 02:56:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+SVpi9U9PU8mPItQk9tMOL2NgLw6chdQ0mg+igJtI+s=;
 b=KSxn+nDvQV8knWBgANIHAA3xuchRbBuD2N22MufTYn/4DDS2G2CRWV+Zx7iAeFIOR/
 pHf/HxzzZkDBSQyBqHCQ1qkC5SVjUzByiEiFR5FsvBHIHZJaateMnF41seg4/RJFWwHL
 dEk/VRh4DlaUNGPZPePqz/NVs4mRCckYLJgefZBMDcvl4IQumZLTS4+eQi1Wn/4YrFMX
 Mb/+ca8oK2s6lrL+Hiy98gDVa/2GX61kdxD6ZHX74RiAvAr1yDIX1utB8Q7g7WAd+vtP
 FcUPeht0Tz/QZnl7t+f6csZBGJ7CdASyTLQ0XaPq9iatim6GDlDBl4cXiAk1Ci77XcWM
 8EFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+SVpi9U9PU8mPItQk9tMOL2NgLw6chdQ0mg+igJtI+s=;
 b=TznhExWMe5Zc+ypyomPqYm1WFzmrBnTQpMa9C9rW5f6Ifo4QYWUQQXJh3XST48JX1E
 4hvy4xKvWrxV7lM/If1WfHZXQMU/59CFaW4WUU4Os4UpRxph+QKg0sdvJ/XQFsw7m/rI
 w70BLE97Op4kYxgSQDBkoCH5GLCuEtvjZYWObAfKosWvktVXvD9QIctNR6lyjqPd9TC+
 MpY/NsVVd0gJ2ajlvy1/buPSyM9IH5UvzpOvmxEpT8h2vhQ0hf6LUYyWw44igcIxMViO
 QTaeTJ3ZR0ad9UtO84baoFATSazMCiZSYTlAwfT1ykXThZtRbRM8s03ESFmQO40WTe3X
 8YKQ==
X-Gm-Message-State: APjAAAVL+pt28LFHo7CBdKpyaFvJpBJi9j5Zmz42E13Vk8AWe/psFlhC
 jTETUyWOBBsrmNHO7uFMDArF4WfEBeON0NO3gXELkQ==
X-Google-Smtp-Source: APXvYqxJsP/Q4MkArwNtGVZNPD5ozAeVQu1NyOjtIm6Q6v4DdwVHCgPOc9X74m1uzgd1XVaKBKgGc/A4A29uKUFJk6c=
X-Received: by 2002:a05:6808:3b2:: with SMTP id
 n18mr1450515oie.146.1582196186047; 
 Thu, 20 Feb 2020 02:56:26 -0800 (PST)
MIME-Version: 1.0
References: <20200219114607.1855-1-kchamart@redhat.com>
 <20200219114607.1855-2-kchamart@redhat.com>
 <CAFEAcA94A3doGQthOTrPuMadOfqrSLBadUbi+3BpHr1MGp_w1A@mail.gmail.com>
 <20200219164007.GC24572@paraplu>
 <CAFEAcA_M3s7U_Brx4iZcWKbrNesn5z33C2Cz+jr1PxCNGTvaXg@mail.gmail.com>
 <20200220102308.GE24572@paraplu>
In-Reply-To: <20200220102308.GE24572@paraplu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 Feb 2020 10:56:15 +0000
Message-ID: <CAFEAcA9eTgyuQ-CAvsmSc=w=EbC1Um0dcf=GTkgapZniSjYQxg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] docs: Convert qemu-cpu-models.texi to rST
To: Kashyap Chamarthy <kchamart@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
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
Cc: Markus Armbruster <armbru@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 20 Feb 2020 at 10:23, Kashyap Chamarthy <kchamart@redhat.com> wrote:
>
> On Wed, Feb 19, 2020 at 05:57:16PM +0000, Peter Maydell wrote:
> > On Wed, 19 Feb 2020 at 16:40, Kashyap Chamarthy <kchamart@redhat.com> wrote:
> > > Peter, how are you able to generate those *.7 `nroff` man pages?  When I
> > > do 'make sphinxbuild' from my build dir ($HOME/buld/qemu), I only see:
> >
> > Just run 'make'.
>
> I did that, but I was missing the "--enable-docs" with my `configure`
> invocation (which I didn't post in full on the list, but only on IRC
> yesterday).  Thanks, Markus, for spotting that.

Yeah, if you don't have the necessary tools then we'll
silently not build the docs (per configure's usual default
of "probe and enable only if possible").

thanks
-- PMM

