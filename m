Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D56FDF451
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Oct 2019 19:33:06 +0200 (CEST)
Received: from localhost ([::1]:46236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMbYH-0001G8-DO
	for lists+qemu-devel@lfdr.de; Mon, 21 Oct 2019 13:33:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45838)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iMbUP-0006gc-5G
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 13:29:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iMbUN-0005kQ-Qj
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 13:29:05 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:34090)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iMbUN-0005ic-L8
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 13:29:03 -0400
Received: by mail-pf1-x444.google.com with SMTP id b128so8861089pfa.1
 for <qemu-devel@nongnu.org>; Mon, 21 Oct 2019 10:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pLdmouST/PhRgukMUeqN5JSaJyniO0EqlY7MBTvJfG8=;
 b=YEZggVAm/9Q/SJBuknJOVDgF01AbVhwisTjeAr3N/Lt0YQU9pQu6S0eo4WaAa24xtf
 vNSFEt/DGzunOKdvcK6JWpRKWWZnj69eiK93arp9ng2Q07vA9tB04WoLqvOqkxqURr6X
 RtaNBO72dCPIs8cHW4l4NZOFpTZa/XMCyqiqZ5OKjr9Ad/IW/k+T2QGIYHoDhAQnkN3D
 068w8ciq4BAJoiRk2BP40X95Jzyq4vcUDoAj28h1F5dOTVLG9cNfyGZYuRkiQ9AO+joa
 9bi1naWeDeyYww1+BjLv3o8Zlb0J4QNIwa6DzXd1A/EezCKQ68fKRHa0O/PU53Q8t/o+
 F0LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pLdmouST/PhRgukMUeqN5JSaJyniO0EqlY7MBTvJfG8=;
 b=EHqCUUHRAR2X/ba6aAFOmlsUtK5JwZisBIxFS4L+slep925z0g4OX2VLZvWjw43UwI
 JNhUnDrr7/zK0CCbAHXcS2G0psj16n4eL8sk4AwzPtCBpubKQLpcJLbK7BcXY4+xYGHb
 3LaYodAFIzOLxYfvvJxsFBXDvrloEQifVNv8gq+WWTmY/w8PGyBKlYo8g4OeRYv1cgh8
 FmHcTpBJkRh3dVnGlyhHFJj4o4xgkiGQlAfzCOzeSEqJ0Eu2G2ekcQvgITqO3XqL20HL
 42HIVGM2ZEIAbv0OolpYoQkYGnkvwCBnpEmPn6TvPLspA56wq5Wkj4W0ci3s16q4+9yn
 T6DA==
X-Gm-Message-State: APjAAAV6XlnCpHSnbMiX/+9h9B8yoqmn/AwEYIELvqe4fN8W3M0MI/wG
 ja7Hs7I8N40VHWCcEOoWQ+rbHQ==
X-Google-Smtp-Source: APXvYqzwXFUCJ5pSC5mcp8sYmIvEKYsoknyhrZMY3HRKDYbWBi4pmWrnooFhh3ITErVwNmC5jUqPhg==
X-Received: by 2002:a63:d50c:: with SMTP id c12mr24936087pgg.199.1571678942287; 
 Mon, 21 Oct 2019 10:29:02 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id o9sm20274824pfp.67.2019.10.21.10.29.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 21 Oct 2019 10:29:01 -0700 (PDT)
Subject: Re: [PATCH 13/21] hw/cris: Let the machine be the owner of the system
 memory
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
References: <20191020225650.3671-1-philmd@redhat.com>
 <20191020225650.3671-14-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <16e35bb5-4099-bf29-0669-3529112168d6@linaro.org>
Date: Mon, 21 Oct 2019 10:28:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191020225650.3671-14-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
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
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/cris/axis_dev88.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

