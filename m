Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7887671CA
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Jul 2019 16:58:26 +0200 (CEST)
Received: from localhost ([::1]:50302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hlx0D-0001Vd-Ta
	for lists+qemu-devel@lfdr.de; Fri, 12 Jul 2019 10:58:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52448)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pbonzini@redhat.com>) id 1hlx00-0000yJ-5a
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 10:58:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1hlwzz-0005W5-8W
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 10:58:12 -0400
Received: from mail-wr1-f47.google.com ([209.85.221.47]:37165)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hlwzz-0005SX-2I
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 10:58:11 -0400
Received: by mail-wr1-f47.google.com with SMTP id n9so10317122wrr.4
 for <qemu-devel@nongnu.org>; Fri, 12 Jul 2019 07:58:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=emIsT2uWy5ufwkOAnv2pkH1UDJF6aP1EQX0xPPePb0s=;
 b=gIcJHzgqoPSB6fNkHViznV9ufRgtYNtRxVNuOf7G8V8jnvEYsvTQA7iFd03BxGX62n
 DMhnzSsVHC/O2hXHBHdjObjIavpKvgIoAUeLt/A6NyD+av76D6b64ricRQCDAsOS3QXk
 OdgOhhydQ8xUgrC+wlyVGyjsaV73siWqYXYWJYPctuKWzp4oHqZMAKOTaJkJosnGuWg8
 2ZSO10j6aCi7JAHGSlaJPR46C7JT2rKfdq7AWx/KZnllYIu0y9K7F8AFdjBvOOfpOnV6
 0MPvUQh3dmK11Xw41jtYff67ypOsI+yCyhkEgbimndUzscPUhu4aSKBnuHpntItvvyYT
 J6Ag==
X-Gm-Message-State: APjAAAV8sW860gp8kUKzydur7K5or7UI4Pcl7Kf9lYOB9OgDNgqPlIJM
 EgLU7Xgp/I0DPrZSzlA6LiFi3Q==
X-Google-Smtp-Source: APXvYqxlRsBKopK/iZSqamQrSxNDIG2QNhAitnGIcgQr8fIdWKN0uP7Ttm46xNtfKvCi7K55O115tg==
X-Received: by 2002:adf:dbcb:: with SMTP id e11mr11810506wrj.272.1562943489841; 
 Fri, 12 Jul 2019 07:58:09 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:d066:6881:ec69:75ab?
 ([2001:b07:6468:f312:d066:6881:ec69:75ab])
 by smtp.gmail.com with ESMTPSA id s12sm7973260wmh.34.2019.07.12.07.58.09
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Fri, 12 Jul 2019 07:58:09 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20190712133928.21394-1-philmd@redhat.com>
 <20190712133928.21394-3-philmd@redhat.com>
 <64a41af4-e635-06e3-05a2-d2cddaf02af0@redhat.com>
 <de30351b-6747-b976-16c5-c587b51f2b7a@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <e2a6cb5d-b840-117f-728c-b5b1bf4c18d6@redhat.com>
Date: Fri, 12 Jul 2019 16:58:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <de30351b-6747-b976-16c5-c587b51f2b7a@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.47
Subject: Re: [Qemu-devel] [PATCH-for-4.1 2/7] hw/usb: Bluetooth HCI USB
 depends on USB & BLUETOOTH
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
Cc: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Miroslav Rezanina <mrezanin@redhat.com>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/07/19 16:16, Philippe Mathieu-Daudé wrote:
> I wondered but am not sure, it is default to Yes, but Bluetooth code is
> deprecated and print a big warning when you use it, so I think this
> device should not be selected as default, neither pull in the deprecated
> bluetooth code.
> 
> So personally I'd respin without 'default y'. If you have a good reason
> to use it, I can use 'select' instead.

There are two separate questions.  One is whether USB_BLUETOOTH should
select BLUETOOTH and the answer there is almost certainly yes (in the
words of kconfig.rst, BLUETOOTH is a "subsystem" while USB_BLUETOOTH is
a "device"; devices select the bus that the device provides).

The other is whether we want to enable USB_BLUETOOTH by default.  I
wouldn't have any problem there, but if we disable it basically no one
would ship/use it and we might as well delete the whole thing.

Paolo

