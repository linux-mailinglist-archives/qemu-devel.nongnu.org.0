Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2CF14200
	for <lists+qemu-devel@lfdr.de>; Sun,  5 May 2019 20:59:13 +0200 (CEST)
Received: from localhost ([127.0.0.1]:44664 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hNMLw-0001hA-Cv
	for lists+qemu-devel@lfdr.de; Sun, 05 May 2019 14:59:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53817)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hNMKl-0001Iw-Ol
	for qemu-devel@nongnu.org; Sun, 05 May 2019 14:58:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hNMKk-0001xE-Qw
	for qemu-devel@nongnu.org; Sun, 05 May 2019 14:57:59 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:38582)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hNMKk-0001tT-K3
	for qemu-devel@nongnu.org; Sun, 05 May 2019 14:57:58 -0400
Received: by mail-wm1-f68.google.com with SMTP id f2so7670435wmj.3
	for <qemu-devel@nongnu.org>; Sun, 05 May 2019 11:57:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=mg1i+A/gxv6y0Ve48fCwAY/y7hW/JM1kixySjgl5CPE=;
	b=WQ6uiq1diIFZX58ghyekBjUGrI8QGZ7LBG/wHuAmu2Bpj3Q3WG/xuTffIh8hVoD7dF
	Gvv4dCDxNIP2IPv8roSc4olEWIck41rzb4/mljRR7jbelbbJe81f14GnN0FWe1kMbpH8
	NQQTcjsbdjklCiSzBInViUkA09KVLJv+ZbPMIu9Z3S/4n3Vum8n1Vb7pKNtgSpAoFanx
	/zM4lYNTK4qv6+IYAUWRYvYSsGWbuKOBOOiIrl/5ArqtwYDzsEhajaum3Vm+MVVsH8lW
	dLzz2uiZDbPE27W23cp1FI6KbeZfieal8T61IGG0sBvDNVzls9qVa34UXph7XluZa9Wl
	46lg==
X-Gm-Message-State: APjAAAUzBJbP17DEMoZcg1ROmW3EBScyHM0CxWz7BDG2mj1Uf1T447f/
	hmR5+ouVr7M0CRMPNaClpGFmKw==
X-Google-Smtp-Source: APXvYqwUsp9oTxqUzd0NVhFkrDNAgsezUW4HMOTMDkXliMpyfRykId/nPWJqe2iXHLkNvt0zJsyz6w==
X-Received: by 2002:a05:600c:1191:: with SMTP id
	i17mr13854686wmf.84.1557082677386; 
	Sun, 05 May 2019 11:57:57 -0700 (PDT)
Received: from [192.168.1.37] (193.red-88-21-103.staticip.rima-tde.net.
	[88.21.103.193]) by smtp.gmail.com with ESMTPSA id
	o13sm15151833wrg.40.2019.05.05.11.57.55
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Sun, 05 May 2019 11:57:56 -0700 (PDT)
To: Stephen Checkoway <stephen.checkoway@oberlin.edu>,
	QEMU Developers <qemu-devel@nongnu.org>, Thomas Huth <thuth@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
	"open list:Block layer core" <qemu-block@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20190426162624.55977-1-stephen.checkoway@oberlin.edu>
	<20190426162624.55977-11-stephen.checkoway@oberlin.edu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <1bad21e0-93ba-279a-4bec-9b1f2204184d@redhat.com>
Date: Sun, 5 May 2019 20:57:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190426162624.55977-11-stephen.checkoway@oberlin.edu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.68
Subject: Re: [Qemu-devel] [PATCH v4 10/10] block/pflash_cfi02: Use the chip
 erase time specified in the CFI table
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/26/19 6:26 PM, Stephen Checkoway wrote:
> When erasing the chip, use the typical time specified in the CFI table
> rather than arbitrarily selecting 5 seconds.
> 
> Since the currently unconfigurable value set in the table is 12, this
> means a chip erase takes 4096 ms so this isn't a big change in behavior.
> 
> Signed-off-by: Stephen Checkoway <stephen.checkoway@oberlin.edu>
> ---
>  hw/block/pflash_cfi02.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
> index d9087cafff..76c8af4365 100644
> --- a/hw/block/pflash_cfi02.c
> +++ b/hw/block/pflash_cfi02.c
> @@ -633,9 +633,9 @@ static void pflash_write(void *opaque, hwaddr offset, uint64_t value,
>                  pflash_update(pfl, 0, pfl->total_len);
>              }
>              set_dq7(pfl, 0x00);
> -            /* Let's wait 5 seconds before chip erase is done */
> +            /* Wait the time specified at CFI address 0x22. */
>              timer_mod(&pfl->timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
> -                      (NANOSECONDS_PER_SECOND * 5));
> +                      (1ULL << pfl->cfi_table[0x22]) * SCALE_MS);
>              break;
>          case 0x30:
>              /* Sector erase */
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>

