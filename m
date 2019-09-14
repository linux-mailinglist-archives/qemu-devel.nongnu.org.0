Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EEA2B2C8C
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Sep 2019 20:18:56 +0200 (CEST)
Received: from localhost ([::1]:51744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i9CdL-0002b0-E7
	for lists+qemu-devel@lfdr.de; Sat, 14 Sep 2019 14:18:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49683)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i9CbY-0001Ve-Sj
 for qemu-devel@nongnu.org; Sat, 14 Sep 2019 14:17:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i9CbY-0006Dn-07
 for qemu-devel@nongnu.org; Sat, 14 Sep 2019 14:17:04 -0400
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:40663)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i9CbX-0006BL-PV
 for qemu-devel@nongnu.org; Sat, 14 Sep 2019 14:17:03 -0400
Received: by mail-ed1-x544.google.com with SMTP id v38so29706121edm.7
 for <qemu-devel@nongnu.org>; Sat, 14 Sep 2019 11:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=X/Kyf7dYtaqUSu8ByDG9rWgwKebFYKkdIdx1ypmMZ/o=;
 b=OWG9XGJZdvsV5UxbsSHFa3ZzBLXbOKz0GHLVrQhIPHEnNolhH6f/3kyUXq23WghvVI
 WL/kGQuunYeomXtdJzvTYOffC7ScqlWsFz8IibjIBUSN69ag+rskogPmEVrJpcqk7NRI
 4oL0i0dqlOMcee2B6n5bTAjXLihDvIKnIWSNTd0FpUKUMj8JktM6k3uOkwEFYY6urrHO
 NTReWnKMbN0pUvCDwcV6J5et9HizqUx+gqM6Eqv7A2PfC2XR+xdQw0zQTXClbbztL+Rg
 kElv0yR3DKfxczipj1NXcaOP1VeC0MmMAsZH8hGEpCDx53ElB6mMCVv2wEcxj1Fa2s94
 IFUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=X/Kyf7dYtaqUSu8ByDG9rWgwKebFYKkdIdx1ypmMZ/o=;
 b=Azv2Sb/IEgkuA7RC+xH0TaOa5ue7Sloz/i4+SFESt1AeiyUy8cbpWyjKZ+7wwhCLTT
 nEbObttBwvdKzg5mHW67D9uyKplvGFWbA9nLg5/Zy7TXD/Ztk2tLBc/jat/5t/HB59QM
 qUOpGdjotWr95gutsIP08Z/FsWyTM6GmywEeZ1S+vSgfsDFVP7vWXSfcJBqXSeSY6Hkt
 hVqcb4sOfk24mFxmOIuH/ZK6Y2lqm0kBi7/nmSm1HBxDUZc19KfORwuG/m7Yq0KsSHTq
 YGPa1Rz8Y3r4HcAy4tILAPnR++pKS255Op7b7i9cZ39ng5JGZ3nXc9ZNaIhMUCSx0R9m
 bGpg==
X-Gm-Message-State: APjAAAUKQpoyvqZveFcKLKMNqEVtcxe54z0ciKcqLbqYx5KQzDKMe4Dk
 HE+XbzOCgLkFNFxlRk2To6FoP56Gz+f0lA==
X-Google-Smtp-Source: APXvYqwjEchJshBQc+B7kiCGgxi3upnAPIE+e6KSHLu9vi/XJPV4X8i3jgsrsClS042RLGtmqpXYTA==
X-Received: by 2002:a50:cb8c:: with SMTP id k12mr46120379edi.94.1568485020047; 
 Sat, 14 Sep 2019 11:17:00 -0700 (PDT)
Received: from [192.168.44.107] ([185.81.138.21])
 by smtp.gmail.com with ESMTPSA id j5sm5984212edj.62.2019.09.14.11.16.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 14 Sep 2019 11:16:59 -0700 (PDT)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org
References: <20190910193408.28917-1-alex.bennee@linaro.org>
 <20190910193408.28917-4-alex.bennee@linaro.org> <878sqv1by6.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <bac4e3bb-8454-fa32-8b5a-b600fc1fb410@linaro.org>
Date: Sat, 14 Sep 2019 14:16:55 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <878sqv1by6.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::544
Subject: Re: [Qemu-devel] [PATCH v1 3/4] elf: move elf_ops.h into
 include/elf/ and rename
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/11/19 4:20 AM, Alex Bennée wrote:
> Alex Bennée <alex.bennee@linaro.org> writes:
> 
>> Lets keep all the Elf manipulation bits together. Also rename the file
>> to better reflect how it is used and add a little header to the file.
>>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> ---
>>  hw/core/loader.c                            | 4 ++--
> It is arguable this could be a private header in hw/core as it is only
> included in one place.
> 

Let's leave it here.


r~

