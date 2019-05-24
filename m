Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6D8297D3
	for <lists+qemu-devel@lfdr.de>; Fri, 24 May 2019 14:11:48 +0200 (CEST)
Received: from localhost ([127.0.0.1]:53637 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hU935-0006Gs-1o
	for lists+qemu-devel@lfdr.de; Fri, 24 May 2019 08:11:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44943)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <liq3ea@gmail.com>) id 1hU90r-00057q-Ct
	for qemu-devel@nongnu.org; Fri, 24 May 2019 08:09:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <liq3ea@gmail.com>) id 1hU8vL-0006ce-2M
	for qemu-devel@nongnu.org; Fri, 24 May 2019 08:03:48 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:33452)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <liq3ea@gmail.com>) id 1hU8vK-0006cM-SC
	for qemu-devel@nongnu.org; Fri, 24 May 2019 08:03:46 -0400
Received: by mail-oi1-x244.google.com with SMTP id q186so6853538oia.0
	for <qemu-devel@nongnu.org>; Fri, 24 May 2019 05:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=NB99r1k+3CHCsqn7eFZg4AttJMUSlx0/RWRjT/9Nmqw=;
	b=XiSXEuJGQvrHOpy2Ls85MDsWTPWkIqXuLDWZ+juZMeGf7Bnsuro/KhSDrqIxcpsbM8
	DnTWcK19+0wj75Xw4MgEpQ2rv1UYVOgB2mOfm8SJwuhS1LS259MRETP0P2OUmMoRNQjy
	KnEljovo1ZUvit4CKNpI8tQUbWVIKTE9o3wqDKub7jVkwgCOPOSQes+HtxNMU42vBBNx
	Oj5LbFaAqb44/H/ZgUbyMS+rbhtKl2MAJlKR6rS6XSwI0AKbDERaoxJXt9JZteYZIEsc
	FANiJpNrO70hoqageFkbtcQOgV3OlnlgU8j/r7VOMTf8OKLHTaiKtezdC6Fqwz2HUw7V
	Q4Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=NB99r1k+3CHCsqn7eFZg4AttJMUSlx0/RWRjT/9Nmqw=;
	b=ciE4g3rzeYmqlo+3m9PYxtqQLNfy6ys5/uzv3YouK33LIpzONnWLtSmz3IGqe1DhSu
	VK7r8XD2UKQ/DXtIowmSpXTT0d4sPGZcPqNe3YOIQyWQatE/DMi5qIF2k/cJAV+r/WAv
	o+A49c5Zk6h7wWrJNJerMZujLL5m8vpfeuZq177Hu9WatTKKMS4LcXFmoYkBo+acDRli
	Wj8WoJywus6Yi6n4E+Af3tUQACWn6EKYYaLEPnRQ5w2g0C1YQtsQtO1joKnZHoL7ygAm
	4YvgYWQG1opUU71ucsCaqmNBPnG01eOeGpTYclyFPICpgXjw3jmULUmVlNOptGLEUjdO
	tvkg==
X-Gm-Message-State: APjAAAUK6YYMobWKgkACmJj7YEjzdo+Zn2SUBT4PDPVmF3QU9pUKbplZ
	irV8VB6bmKdsBFUPAQQJF9FCLJKJiA2L5ORKSq0=
X-Google-Smtp-Source: APXvYqx7BRFzjRmwCW9pvTAXqE5pvmM0KddNmvOEupEUcFTCs2smk0rth0I8lst/da3TdKTa4/hnNN2QjGwPqp8rDTI=
X-Received: by 2002:aca:fd45:: with SMTP id b66mr6125073oii.157.1558699426276; 
	Fri, 24 May 2019 05:03:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190524063553.5339-1-philmd@redhat.com>
	<20190524063553.5339-4-philmd@redhat.com>
In-Reply-To: <20190524063553.5339-4-philmd@redhat.com>
From: Li Qiang <liq3ea@gmail.com>
Date: Fri, 24 May 2019 20:03:10 +0800
Message-ID: <CAKXe6SJ91+YpHMH=zMqjw=Mk0x2QBXJRbEVY7Jy2TDzuKy9rPA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::244
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] [PATCH 03/20] hw/i386/pc: Let e820_add_entry()
 return a ssize_t type
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
Cc: Yang Zhong <yang.zhong@intel.com>, Eduardo Habkost <ehabkost@redhat.com>,
	Rob Bradford <robert.bradford@intel.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Qemu Developers <qemu-devel@nongnu.org>,
	Samuel Ortiz <sameo@linux.intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> =E4=BA=8E2019=E5=B9=B45=E6=
=9C=8824=E6=97=A5=E5=91=A8=E4=BA=94 =E4=B8=8B=E5=8D=882:43=E5=86=99=E9=81=
=93=EF=BC=9A

> e820_add_entry() returns an array size on success, or a negative
> value on error.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>

Reviewed-by: Li Qiang <liq3ea@gmail.com>



> ---
>  hw/i386/pc.c         | 2 +-
>  include/hw/i386/pc.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index df8600ac24..1245028dd6 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -868,7 +868,7 @@ static void handle_a20_line_change(void *opaque, int
> irq, int level)
>      x86_cpu_set_a20(cpu, level);
>  }
>
> -int e820_add_entry(uint64_t address, uint64_t length, uint32_t type)
> +ssize_t e820_add_entry(uint64_t address, uint64_t length, uint32_t type)
>  {
>      unsigned int index =3D le32_to_cpu(e820_reserve.count);
>      struct e820_entry *entry;
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index 28b19173b0..2bc48c03c6 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -289,7 +289,7 @@ void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
>  #define E820_NVS        4
>  #define E820_UNUSABLE   5
>
> -int e820_add_entry(uint64_t, uint64_t, uint32_t);
> +ssize_t e820_add_entry(uint64_t, uint64_t, uint32_t);
>  size_t e820_get_num_entries(void);
>  bool e820_get_entry(unsigned int, uint32_t, uint64_t *, uint64_t *);
>
> --
> 2.20.1
>
>
>
