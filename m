Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB5A1A85AB
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Apr 2020 18:49:28 +0200 (CEST)
Received: from localhost ([::1]:34864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jOOkZ-0003gU-Gk
	for lists+qemu-devel@lfdr.de; Tue, 14 Apr 2020 12:49:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56455)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jOObF-0004AA-Hv
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 12:39:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jOObE-0005Ku-9E
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 12:39:49 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:51240)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jOObE-0005KZ-3l
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 12:39:48 -0400
Received: by mail-pj1-x1035.google.com with SMTP id e16so5224107pjp.1
 for <qemu-devel@nongnu.org>; Tue, 14 Apr 2020 09:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=D5qTFijV7pl5vLMMevWqBC7e6+/jyGEbHDPzg9pLRp8=;
 b=IZgOVaX1kOvzng5Uom7RhZAc64LRdtPVUg9pBkyIIv4gtcldSrsiFmMxRy6B4+PCfW
 OdfJ5LC5hD3DtHHtwxFBiMFnUGqguBqFNScjSrqh1WFY2OpePoCp4AxyptzMv/wkSA22
 GshiB4ZLLHR8r4mZTHAEkyAS0QGpERjkOuyf4ZRdqqXcZFLd2MSBiFPBB9WMGVa6kEit
 rS/zTuo5XKZmzlJmpEsYMT5yapFVj5828T7eIZL+zBxxHSvdTHr7uA3t7qmNo52Mdj15
 RQsuuOUGgrhvYZpNLx7ZE2myGZogpanZuUWEvCTRThBKsvhTnuYLI3ts6OLalfZ0J5yj
 /hJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=D5qTFijV7pl5vLMMevWqBC7e6+/jyGEbHDPzg9pLRp8=;
 b=dpp36dmOsERQrCmaCKl48EgFhbDpDyzVSwVxAIedGeIBWZFI0Lvppvw4LVoK/tdLPV
 cYnF5HYjAorHChoqT5tRtVECaWJ+pDFXJXKj2AliCIj3MlRuhawH8XJBIrvjC5FIUDpo
 wcAx3OkiOqXma/UTh0HAMyB6dkhbWpKD0i8qPgSmmkJqG6ofQ8Ee9nODdMNEKHWbnt5O
 zwmVifPIe2zH9da116gz1tBaryxc16qkJXDU7DsTuLhmuk9lL6vT8SKJfwDW1ZZ4IeZh
 226Gu+sQKNy/o4G1jsYBeZ5Ic6l15rE0OMGNzgjU5Pif9kXl/awdtQnYV55S9IfrtVX0
 9iRA==
X-Gm-Message-State: AGi0PuZL4y8A/caqE/Q7LWsIEbN6GNEiY73Ej/WG69en7vCZG/kgBnsd
 iJQmKHury0uX7q6UjyjSGw6y8fOA0c4=
X-Google-Smtp-Source: APiQypJ8RweyktmPO/nNWqhpz6Q25F360ng1HEV0++qXZQiOquhDxgR+WoZqs1Gw/Km56Hyj/lwVLw==
X-Received: by 2002:a17:90a:e02:: with SMTP id
 v2mr1079698pje.131.1586882386460; 
 Tue, 14 Apr 2020 09:39:46 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id g25sm11369321pfh.55.2020.04.14.09.39.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Apr 2020 09:39:45 -0700 (PDT)
Subject: Re: [PATCH] .gitignore: include common build sub-directories
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20200413162902.7985-1-alex.bennee@linaro.org>
 <c137f5b3-3e93-e497-e2d2-16ced7d2fb42@linaro.org> <87v9m281vo.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <96a60b62-9558-0665-439a-1aacb3624fae@linaro.org>
Date: Tue, 14 Apr 2020 09:39:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <87v9m281vo.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1035
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/14/20 9:31 AM, Alex Bennée wrote:
> Richard Henderson <richard.henderson@linaro.org> writes:
>> My build directories are always siblings of the source directory in the parent
>> directory.
> 
> 
> It's not exactly an un-common pattern - especially if you have a lot of
> build variants. Keeping them under builds makes it easier to blow the
> whole lot away rather than having a messy parent directory which you
> have to clean manually.

"Manual" is a bit of an overstatement.  In the end there's no difference at
all: it's rm -rf build* no matter the $PWD where you perform it.

As for "messy", you're the one that put stuff that doesn't belong into the
source directory.  Mine is nice and clean.  ;-)

> Personally it also works better with my tooling which can slurp up all
> the build directories and present me with a menu of make commands to
> build from. That's not a good argument for accepting the patch though.

Hah.


r~

