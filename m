Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB120DF399
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Oct 2019 18:50:51 +0200 (CEST)
Received: from localhost ([::1]:45376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMatO-0007so-TD
	for lists+qemu-devel@lfdr.de; Mon, 21 Oct 2019 12:50:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40281)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iMasN-00075o-RD
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 12:49:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iMasM-0007XP-Tt
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 12:49:47 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:34778)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iMasM-0007X7-OJ
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 12:49:46 -0400
Received: by mail-pf1-x443.google.com with SMTP id b128so8795731pfa.1
 for <qemu-devel@nongnu.org>; Mon, 21 Oct 2019 09:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/iRyJKfvIZUCUKpEt4I8a3yw43BHIcxJnELB9yQR39M=;
 b=oxKc1+akw1KDrlwFJFHgCf1+1i/B2yFJSzpb1ARrBHT/aV3CvM+Rnieac1UEqhFZUS
 3CP87tUz/4tPg4J72Ccavzh5FLe80OB8gfyTt4zZAUgFSRd5emq7S/VV/pbyCoQMXKBV
 3jz+YMIKPB3BoGN2mQ9a8TprK6dmqTzkNTinacJm9yjazmbV4u30v5qlNYd9onicPgGj
 0A8RJp5PsmcMKlvaBRFmd9HmFz6mS27/WnaRkcciD1QzL4zNU+4Flfjuk04GehuaD82g
 OuO/8mDuGQqxk1qFiMc8RICBdkx19UKUniG+nhoWnkxN+KO7fLWdSG1zTcvjxIz4LkRw
 +HEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/iRyJKfvIZUCUKpEt4I8a3yw43BHIcxJnELB9yQR39M=;
 b=Nw2Mlxvk2ox11WC6BAMBdy5gwpFIOK/T/YA+rYkQ4hUSm43wOVu8l/PrHqF44cq6Cx
 Wz+x4k1992q2D6r/qpR2d1irS1EgU0Oj6t4WIOIipStS3zTglXVdHeKUSDX4gNymUq/V
 1hRne4MLly57XRpic2FzsnXbjIqPtJH0DkphwpE1wZxbBLefwvUoIN/MEGGPO3uHAC5R
 rGwFOo6fxxaceHIQ9qBbzZ032KaZTex9M8QjbogmfyGk0QdyRDR2KdWC9bmGKd1TRW6h
 XcUahpxVIWamrd2K3+EAtX0DmcgRBcQWSx8DrDAli7vVl1fifnLDZaP2Fai/ZHygW6lW
 wg6w==
X-Gm-Message-State: APjAAAWzH+KbCDVBkmHR45POCvdi5Ik40TdmDJ8E4ngzIPLJUzEsX2IS
 Y3GnJN4+xkqaTaXKszHriPpzEA==
X-Google-Smtp-Source: APXvYqxG+v1IaMBDQOaEZdBEHM1/x8UGoMX24W/nMgWS77OYSpVJTK7njtFFar0oJ8fchhpr1Dtg+Q==
X-Received: by 2002:aa7:8ad0:: with SMTP id b16mr24564153pfd.255.1571676585557; 
 Mon, 21 Oct 2019 09:49:45 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id k23sm15205671pgi.49.2019.10.21.09.49.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 21 Oct 2019 09:49:44 -0700 (PDT)
Subject: Re: [PATCH 01/21] hw/arm/xilinx_zynq: Use the IEC binary prefix
 definitions
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
References: <20191020225650.3671-1-philmd@redhat.com>
 <20191020225650.3671-2-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <d744fa54-cd7d-fae7-74e3-63b862634ecb@linaro.org>
Date: Mon, 21 Oct 2019 09:49:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191020225650.3671-2-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
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
Cc: Paul Burton <pburton@wavecomp.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Leif Lindholm <leif.lindholm@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Rob Herring <robh@kernel.org>,
 Peter Maydell <peter.maydell@linaro.org>, Helge Deller <deller@gmx.de>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Alistair Francis <alistair@alistair23.me>,
 Fabien Chouteau <chouteau@adacore.com>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Richard Henderson <rth@twiddle.net>,
 Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
 Thomas Huth <huth@tuxfamily.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Michael Walle <michael@walle.cc>,
 qemu-ppc@nongnu.org, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Jan Kiszka <jan.kiszka@web.de>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/20/19 3:56 PM, Philippe Mathieu-Daudé wrote:
> IEC binary prefixes ease code review: the unit is explicit.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/arm/xilinx_zynq.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


