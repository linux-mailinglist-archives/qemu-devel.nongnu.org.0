Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7782A1E7
	for <lists+qemu-devel@lfdr.de>; Sat, 25 May 2019 01:59:05 +0200 (CEST)
Received: from localhost ([127.0.0.1]:33361 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hUK5Y-0006Cg-6F
	for lists+qemu-devel@lfdr.de; Fri, 24 May 2019 19:59:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60137)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <programmingkidx@gmail.com>) id 1hUK3M-0005Ao-PQ
	for qemu-devel@nongnu.org; Fri, 24 May 2019 19:56:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <programmingkidx@gmail.com>) id 1hUK2s-0001H9-4j
	for qemu-devel@nongnu.org; Fri, 24 May 2019 19:56:19 -0400
Received: from mail-it1-x141.google.com ([2607:f8b0:4864:20::141]:50593)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <programmingkidx@gmail.com>)
	id 1hUK2s-0001Gm-0E; Fri, 24 May 2019 19:56:18 -0400
Received: by mail-it1-x141.google.com with SMTP id a186so8667363itg.0;
	Fri, 24 May 2019 16:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=CB+e8mhR8tRn7BPOR/5uMsoccOyM3rz96Ecj0M0x5uc=;
	b=qzo/Jo3aKk/ATLlkhLDXFudLeGt2OVKn1zoaUzpsNB2GpAsZJnqTGBB7d9dvMvPDIL
	p2DQqdlETy0pT87+cCApuDz8DzDfA/ABaYwo305zd3zcotaYKk0MhJQLM760ByliMe5S
	3zWaBzEzui8vaiU1Nnur9fflNuSpUQw8iQUcwfGfkudzTkomqU6B4rnnUp5SHnCIqbh0
	N+8EvmqqCNUBU+uYHLfAsK36wMAmOY+XHREDnR1YABnzRtru6uaudzXb0Y0nzzkWno77
	XkKHRsj+O4vCYu+9p6O55Gn5RNpUim59Efv52kuzmc0z9xXsYYD/P9YECvK7TNNjLSKp
	Nc/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=CB+e8mhR8tRn7BPOR/5uMsoccOyM3rz96Ecj0M0x5uc=;
	b=ULYUIilBkGlc6ejXo9CvbS1Zfcg+8+OvJQV4PCpKr35LpJAH3RAjGZS/CtF98fDec5
	P/hgKLpmqPqZTLPd7X8kkHIHlldMUMLB046T0iLtM0POj5q7Bq3xIHbK+GnYGMWU92CH
	ELb6BewDEJbaRlQ+6txH1h3maEzloyCLxepZutImg8Z9RNzVyO2uRzrfGZN8KsxT7pV3
	K+fPD8udmvLoqEXdN8qfeZ0vZ0XvoCPxH3UI0vn0NSRI7N9eL3/EXo7M4fjnn0xWJxxy
	vfU6A5RTB7cDMJTqP1k/wfzcp/YfzkDBWgbCq2AYw7VVy3QqLtPRubA54pNGXabou35B
	XA+w==
X-Gm-Message-State: APjAAAUhSoV63QDzfq1SmOrHYiqormYaWQAVxkI2xrwhHl1yiC7WBjtq
	V9UBMWmDvxNFw7Ih0OAeFC+iGWdS
X-Google-Smtp-Source: APXvYqybu+gAYRbRdlGhsGFZozCKuO08SqR8p14SQNpC4NuvL4N+Ip/tnFCxsxW4x8z/UAt4+2x8og==
X-Received: by 2002:a24:e48c:: with SMTP id
	o134mr19213297ith.171.1558742176646; 
	Fri, 24 May 2019 16:56:16 -0700 (PDT)
Received: from [192.168.0.6] (d14-69-20-184.try.wideopenwest.com.
	[69.14.184.20]) by smtp.gmail.com with ESMTPSA id
	t63sm1905059ita.42.2019.05.24.16.56.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 24 May 2019 16:56:15 -0700 (PDT)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
From: Programmingkid <programmingkidx@gmail.com>
In-Reply-To: <632b09de-c8e2-9907-9261-47b4de779a69@ilande.co.uk>
Date: Fri, 24 May 2019 19:56:14 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <C2B311CF-3EE5-4093-8835-2BA464C2D8AC@gmail.com>
References: <B954C7EE-DC27-433A-A271-D7ADF380550A@gmail.com>
	<632b09de-c8e2-9907-9261-47b4de779a69@ilande.co.uk>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
X-Mailer: Apple Mail (2.3273)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::141
Subject: Re: [Qemu-devel] Patch causing qemu-system-ppc to crash
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <rth@twiddle.net>, qemu-ppc <qemu-ppc@nongnu.org>,
	qemu Developers <qemu-devel@nongnu.org>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


> On May 24, 2019, at 2:56 AM, Mark Cave-Ayland =
<mark.cave-ayland@ilande.co.uk> wrote:
>=20
> On 24/05/2019 03:48, Programmingkid wrote:
>=20
>> Recently I have noticed that qemu-system-ppc is crashing while =
booting up my Mac OS X VM. A bit of git bisecting shows this is the =
patch that causes this issue:
>>=20
>> commit 1e262b49b5331441f697461e4305fe06719758a7
>> Author: Richard Henderson <richard.henderson@linaro.org>
>> Date:   Mon Mar 18 12:02:54 2019 -0700
>>=20
>>    tcg/i386: Implement tcg_out_dupm_vec
>>=20
>>    At the same time, improve tcg_out_dupi_vec wrt broadcast
>>    from the constant pool.
>>=20
>>    Signed-off-by: Richard Henderson <richard.henderson@linaro.org
>=20
> I think this is the same issue I reported last week - does the patch =
at
> https://lists.gnu.org/archive/html/qemu-devel/2019-05/msg03767.html =
help at all?
>=20
>=20
> ATB,
>=20
> Mark.

I think it fixed the problem. I just did a 'git pull' and the result was =
a working qemu-system-ppc. This patch is present in the history.

Thank you.=

