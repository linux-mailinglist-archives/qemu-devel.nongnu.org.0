Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA59140AEEE
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 15:30:41 +0200 (CEST)
Received: from localhost ([::1]:46430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ8WG-0003nV-OT
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 09:30:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mQ8Cv-00075T-M5
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 09:10:41 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:39784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mQ8Cs-00050r-9r
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 09:10:41 -0400
Received: by mail-ed1-x52c.google.com with SMTP id h17so9692390edj.6
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 06:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8vhbDWVA/zMk9rlEIhg64wLrmspuaofVEndka93rHR8=;
 b=wGzAS4Yr7i5zWkdmzI27LYdds5n6DbKMuqv/52pzJZiVi8dgSejDp9G2aC0Bq2O0kn
 MbyLQMuPYR/8uBa0Jb8/VOq7DB0rMxp1sP/rmco+IuO5P5N4jeAFJw8Pd7XGYu6islvV
 QfBovIKGEGP/097KyCIvoxoCwu15Pe6I9obOgh+hZi4F8eSS7tKo4wtHUeVuxdhwjga3
 iEtsSONJmco/Es86hHo3OvupOj+q6CzD7rtTO5AnDYVtfcSMgx4Q7j/akG1Hn1lk/Xnn
 VXEEOdIGfySZVOF83lEFranx4vMmMN/4kxr/EctzLe08umxQ9b2sUgPRq4HrwUN0Wqnx
 brjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8vhbDWVA/zMk9rlEIhg64wLrmspuaofVEndka93rHR8=;
 b=4Jx+KGGyo3AB7me/d8h3On7bc+bxe3mr/98Nm0s0F59dbVEDXySfmxRCukOUjGz5LY
 P87tKypmnyNRgS9YK4kau7KBdU8YYo3+qrbgP0WEW+MKOroFWvO5ppF8kqzsSDOPpbdJ
 sADR76Jum30AA0enh7vWv4Hh6hqSjHErY1VOiBzhexNCpUtm5OF/ps9RNXMSrr8EjdjM
 +ngAEhbzdyEZfd4b97yJ/GJUWivVNPrPyij6jRdmJXcBwxwcboGCm+5FCH/0wH0SikUs
 MbAh/AGRHbN6Y8jbZJe7MD65yyuXwrREutIQ+2Jrhr9I325ioGP1xDPxo0SDKheCTkYz
 aHHw==
X-Gm-Message-State: AOAM531TRys0lHXFJK+EJK7dZKINhn1rkcyJeJHr6Y7kLQZL94R/NQO/
 Y11PKjzqnlijK0BnHzxVyYJk3bcjp+YxYyGMFIelXCQERo0=
X-Google-Smtp-Source: ABdhPJyxKYBXJyo1xwHT4a1QCMy/g67f16X9amsY0zY4XzV/Yu5VAmtp6Z9HHI8+FkOokkNZsvfJy4Id54kOLdqpIYg=
X-Received: by 2002:a05:6402:2810:: with SMTP id
 h16mr18525713ede.293.1631625036081; 
 Tue, 14 Sep 2021 06:10:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210906093911.2069140-1-ani@anisinha.ca>
In-Reply-To: <20210906093911.2069140-1-ani@anisinha.ca>
From: Ani Sinha <ani@anisinha.ca>
Date: Tue, 14 Sep 2021 18:40:25 +0530
Message-ID: <CAARzgwxQyeCEAY1tqX1Pik7N6nnJvfMD+fgetkfHJ2vL7rFs_Q@mail.gmail.com>
Subject: Re: Add a unit test to exercize support for ACPI hotplug on
 multifunction bridges in q35
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000aecb4b05cbf44e16"
Received-SPF: none client-ip=2a00:1450:4864:20::52c;
 envelope-from=ani@anisinha.ca; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000aecb4b05cbf44e16
Content-Type: text/plain; charset="UTF-8"

Ping

On Mon, Sep 6, 2021 at 15:09 Ani Sinha <ani@anisinha.ca> wrote:

> Hi Igor/Michael :
>
> Added a unit test to exercize the following commit :
>
> d7346e614f4ec353 ("acpi: x86: pcihp: add support hotplug on multifunction
> bridges")
>
> I had sent just the unit test earlier but since the review is getting
> delayed, I thought of sending
> the whole patch set which can be now reviewed in totality.
>
> Thanks
> ani
>
>
>

--000000000000aecb4b05cbf44e16
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Ping=C2=A0</div><div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Mon, Sep 6, 2021 at 15:09 Ani Sinha &lt=
;<a href=3D"mailto:ani@anisinha.ca">ani@anisinha.ca</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">Hi Igor/Michael :<br>
<br>
Added a unit test to exercize the following commit :<br>
<br>
d7346e614f4ec353 (&quot;acpi: x86: pcihp: add support hotplug on multifunct=
ion bridges&quot;)<br>
<br>
I had sent just the unit test earlier but since the review is getting delay=
ed, I thought of sending<br>
the whole patch set which can be now reviewed in totality.<br>
<br>
Thanks<br>
ani<br>
<br>
<br>
</blockquote></div></div>

--000000000000aecb4b05cbf44e16--

