Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2010569AC1
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jul 2019 20:23:01 +0200 (CEST)
Received: from localhost ([::1]:41734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hn5cq-00059U-Bn
	for lists+qemu-devel@lfdr.de; Mon, 15 Jul 2019 14:23:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57708)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pbonzini@redhat.com>) id 1hn5cb-0004U6-SS
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 14:22:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1hn5ca-0005id-V4
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 14:22:45 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:34573)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hn5ca-0005i9-Nb
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 14:22:44 -0400
Received: by mail-wr1-f66.google.com with SMTP id 31so18185067wrm.1
 for <qemu-devel@nongnu.org>; Mon, 15 Jul 2019 11:22:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jh1EjcI3mccPq9EguW1nzi7NdEBTHvB+4+XINCI1nAQ=;
 b=q/D7IYaUw1mleUjs6JYuNAEa6D8HyYZ8CtmjOjHJwMmdWxBoxvPg6vYj2oqPkXeRir
 ixLj52FrdbEWgM7ujsAl2r8rRtBUs+w21gNhbIEYVcZiez1nHvNrTgSSNl931XK3u3oH
 RJLJUzt/BuQj0wZjZGlw+I0zkRylXrGg3RFt3blEhs5lzeUvRxhgNOyoXiccSD+8hREL
 QXOh9y+LKrcCPfb8VTUyc/tYnuyrMIK25s37izvcdBn/QPEUajusm+UbO1LkpLaerVP3
 WOGcwaUN9TOuDaErYEwGJkp+xaXGEE8/LChY9fUXbhr6XquiI4g3ZXkwhl725dCG8Dx9
 0sMQ==
X-Gm-Message-State: APjAAAW0KvPaK2usOTmHfqI2yqfcdPP2uIpxKjlzvdISW0Z7kGkeH3z0
 6OrWBsfEeoJ1PuKC0RGsQH1voA==
X-Google-Smtp-Source: APXvYqx1tWHVdEAiQSSJKmKdTfXojB12V9FcU8Q/G+9lC716NBkwgiUbht1ZBsYHFKID+z6CSqB3/A==
X-Received: by 2002:adf:e444:: with SMTP id t4mr28841642wrm.262.1563214963421; 
 Mon, 15 Jul 2019 11:22:43 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:b159:8d52:3041:ae0d?
 ([2001:b07:6468:f312:b159:8d52:3041:ae0d])
 by smtp.gmail.com with ESMTPSA id c11sm30438514wrq.45.2019.07.15.11.22.41
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 15 Jul 2019 11:22:42 -0700 (PDT)
To: Cornelia Huck <cohuck@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <20190715095545.28545-1-philmd@redhat.com>
 <20190715095545.28545-2-philmd@redhat.com>
 <ca528cdc-6118-0b2f-c1b8-30b06875dde8@redhat.com>
 <CAFEAcA-wgTVfj0TUJ=piP0wEgLGiNpOYia5DK2GQAO4Q7gNaWg@mail.gmail.com>
 <6d69e8ad-d720-ce04-20f2-a03193903078@redhat.com>
 <20190715125653.6e65d575.cohuck@redhat.com>
 <c1c68faf-0424-6c7c-e39f-42159457c3ee@redhat.com>
 <20190715130955.4a117388.cohuck@redhat.com>
 <13fce62f-234c-1b13-595f-5910c066bc4f@redhat.com>
 <6c39a198-e951-c0bd-1ddc-5d227afe72ff@redhat.com>
 <87a7dfth4i.fsf@dusky.pond.sub.org>
 <20190715181206.3cb1db93.cohuck@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <799aa0f5-8850-5caa-5103-e1cf3cdb018f@redhat.com>
Date: Mon, 15 Jul 2019 20:22:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190715181206.3cb1db93.cohuck@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.66
Subject: Re: [Qemu-devel] [qemu-s390x] [RFC PATCH 1/3] hw/Kconfig: PCI bus
 implies PCI_DEVICES
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Helge Deller <deller@gmx.de>,
 Palmer Dabbelt <palmer@sifive.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Collin Walling <walling@linux.ibm.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "open list:S390" <qemu-s390x@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, qemu-ppc <qemu-ppc@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/07/19 18:12, Cornelia Huck wrote:
>> Is it INTx vs. MSI vs. MSI-X?
> 
> I think for s390x we need (INTx || MSI) vs MSI-X...

I think MSI vs MSI-X is just how it's configured, not the actual
behavior, so it should be irrelevant.

Paolo

