Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB63E873E8
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Aug 2019 10:21:29 +0200 (CEST)
Received: from localhost ([::1]:57254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hw09Q-000888-Lm
	for lists+qemu-devel@lfdr.de; Fri, 09 Aug 2019 04:21:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36219)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.bennee@linaro.org>) id 1hw08f-0007fg-JZ
 for qemu-devel@nongnu.org; Fri, 09 Aug 2019 04:20:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1hw08e-0004aK-Gn
 for qemu-devel@nongnu.org; Fri, 09 Aug 2019 04:20:41 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:55433)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1hw08e-0004Zw-9u
 for qemu-devel@nongnu.org; Fri, 09 Aug 2019 04:20:40 -0400
Received: by mail-wm1-x341.google.com with SMTP id f72so4789669wmf.5
 for <qemu-devel@nongnu.org>; Fri, 09 Aug 2019 01:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=KBsNV1XQlyjiPyd1Wc0UXP8zB6AfBKSi2bbbrHqPl6U=;
 b=bPj1RlhQlIUYmwrVHGXKsf6CLFeKE94O6Mf9IFTbUL6OYJCAlY8eTer2nbSJxFoM/B
 gAlvd++x6zbC3FvQJydwdZqakLF2T2rjHl0WXGvUYryyfJWGUIMFz+b2sJEtgLaAx0PL
 wYKieRcPdOW0d3xBSfw8EdFML6iP0OZg+TwJe4SjaaTgbo82xlQg/rWfDALGrbCn++YR
 eb6xL8biYAmdsgxjvzbKjYOlFcodw50i8lrlvcAAPEgAK877cMJr0MDM6CtqVIcJgkqc
 ljFcuUm71bX/tZ9CXl7sKYnr1sicWgqEPJd6n2aZ08OO3aZRzKAqolYQuYtJzUSNp5Lk
 m+dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=KBsNV1XQlyjiPyd1Wc0UXP8zB6AfBKSi2bbbrHqPl6U=;
 b=d7hW/Xa1X3K8VLOXbtLzESUZrpdHKBJpuiAzaxx4K3/LvIwar2Ns4SEMX97Cufjhh9
 FA2E7WXxeCd5Sj2S2h1+SVqDP8dCV0tIUZCzaB7YqT4h+qiuCBfW59Z9jhcoLwDth+SU
 zgTmX11cPCdqmN7jDNmxiY6aano/r/Br8ZqccwuQfSsmzPx5IUi/5y9aYtVDwqzmKvc8
 IK9QmIqTLoi99karYcr4jYMKkD7yk/1azO3LJmSYKXEeqGVm+22xBcPrYgB3vkGsPztK
 WHQ4nBIMvm0FFr79Nkx7nBpY63tTjuHOI1NtfT4mAxx+AMl9EtRU7CW8uKsSSg0yy8C0
 WKRQ==
X-Gm-Message-State: APjAAAV0mkgnKA/DHxyX8RWmMM+MRP9sYwWBJnhFlVEV4dVYbXTwlOVu
 0g/meNuoe41cCUp5cJ9PIJ6H6G7yXTw=
X-Google-Smtp-Source: APXvYqxVAYCid/OlXXNm9mKGG5L1SreZ5Q7dP/+kP5JCEWnftWP0Bw1zobOaREePLq9glLM805kmkw==
X-Received: by 2002:a1c:2015:: with SMTP id g21mr9142929wmg.33.1565338838610; 
 Fri, 09 Aug 2019 01:20:38 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
 by smtp.gmail.com with ESMTPSA id s2sm4369712wmj.33.2019.08.09.01.20.37
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 09 Aug 2019 01:20:37 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6D47F1FF87;
 Fri,  9 Aug 2019 09:20:37 +0100 (BST)
References: <20190808164117.23348-1-alex.bennee@linaro.org>
 <87lfw2alzb.fsf@dusky.pond.sub.org>
User-agent: mu4e 1.3.4; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Markus Armbruster <armbru@redhat.com>
In-reply-to: <87lfw2alzb.fsf@dusky.pond.sub.org>
Date: Fri, 09 Aug 2019 09:20:37 +0100
Message-ID: <8736iaiwbu.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
Subject: Re: [Qemu-devel] [PATCH  v1 0/7] softfloat header cleanups
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


Markus Armbruster <armbru@redhat.com> writes:

> Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:
>
>> Hi Markus,
>>
>> As promised here is a softfloat specific follow-up to your headers
>> clean-up series:
>>
>>   From: Markus Armbruster <armbru@redhat.com>
>>   Date: Tue,  6 Aug 2019 17:14:06 +0200
>>   Message-Id: <20190806151435.10740-1-armbru@redhat.com>
>>   Subject: [Qemu-devel] [PATCH v2 00/29] Tame a few "touch this, recompi=
le the world" headers
>>
>> The first few patches do a little light re-organising of the header
>> files and some renaming. The remaining patches then rationalise the
>> header usage in the targets mostly by removing the inclusion of
>> softfloat.h from cpu.h which is most likely to trigger the largest
>> number of rebuilds.
>
> Neat!
>
>> I'm happy for you to pull these straight into your larger series if
>> you want otherwise I'll collect tags and submit once the tree
>> re-opens.
>
> What about this: I post my v3 of my series to address the reviews of v2,
> you post a v2 of yours if necessary.  Once both are ready, I do the pull
> request.  If yours is ready, but mine needs another respin, I can pick
> yours into my respin, to take it off your hands.  Okay?

Yep. I'll be posting a v2 shortly which addresses some of Richard's
comments.



--
Alex Benn=C3=A9e

