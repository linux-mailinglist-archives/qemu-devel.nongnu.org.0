Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4C8322AB2
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 13:42:43 +0100 (CET)
Received: from localhost ([::1]:54186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEX1W-0007jv-EE
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 07:42:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1lEX03-00072f-Vm
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 07:41:11 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:38337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1lEWzz-0004EY-MD
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 07:41:11 -0500
Received: by mail-pg1-x52a.google.com with SMTP id e6so2630753pgk.5
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 04:41:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=v8BYBKKqg6jns79lN/p7nGyESzVU3TWN8/bugtGWpAc=;
 b=M86jNPndRACJfe93FE/F6c/DPwNEE52WbE95Sef+5Zf8FlhZTTOitgZJG+0+a5fZbr
 7G8rGpMG6azsd9IXvrs6+VhSVSuFudVKbdJPDaH2/oYwSxUYoqEhhP7bJy/TxVfJdQUQ
 Mf2bKttlGtZcSBfWE1Zs+mHobR7K9J3D4EsG6pyu/QqA8Pu49QXLms0mjHTRgPoIB/37
 vH7CzjzI9bZRbz67uSdtKrPhxWKCHU5cG8M84UR+En6ns3du0lhTfg39Q/dACIPNc588
 +6YSW49WLRp56ZiN21gssrGNI6f41A1QVWS4gVO/Q8SeS12/UO3tcjY7e1ZQH5VnM2cA
 F6vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=v8BYBKKqg6jns79lN/p7nGyESzVU3TWN8/bugtGWpAc=;
 b=mGRz7SbscdxTVWNEtMKACt0/JWu1bZ4pH0X2MlpNStZaCB4naa2cJ1SqKaSV4+1GM+
 f4UwRGpYJ1xzL3hVrqT37LtRoF6JDfJxjYDFlrYAUGNnTqjElC6yFaHG51uf7dE+AG0v
 lZxRzBk9sqPnGteg25U1wnnnboSZ9K5e8cycHGI4LTwhPEXa+/vuIbhr/TWvdKfFZpAG
 7dKj97AKdfnohT6rCGJolLouXELXk9KdSKpknJqi9VPJ95hYmfuf6YBMQB6/vBGh9pJR
 Gv0r2UFixpXsEQt3i3MNw8/hkdFPOG2qoj+hNJErNaTtVTf6hejXqvvu2mKQC8hbbk0s
 zGNA==
X-Gm-Message-State: AOAM532P+wY16m0ceuNrBjZD9I0q9M/MURITCxEY9aQqq5R3FQKsB742
 EROqMen0f9wAZu00yCojCE74vQ==
X-Google-Smtp-Source: ABdhPJznty/ijPI/Uv3XgimeMy7r6L494gCRPNAaNa6z71ltwgsSEUTryPVuZjQleRGcv1BliOieUQ==
X-Received: by 2002:a63:65c6:: with SMTP id z189mr4356425pgb.122.1614084065224; 
 Tue, 23 Feb 2021 04:41:05 -0800 (PST)
Received: from [192.168.10.23] (124-171-107-241.dyn.iinet.net.au.
 [124.171.107.241])
 by smtp.gmail.com with UTF8SMTPSA id e130sm12428815pfh.189.2021.02.23.04.41.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Feb 2021 04:41:04 -0800 (PST)
Subject: Re: who's using the ozlabs patchwork install for QEMU patches ?
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org
References: <CAFEAcA8h8QVoGsfJCLTYnbk3yzmrtphsWdSsDUrgQkB=vGh3zw@mail.gmail.com>
 <20210223123943.06d23a56@bahia.lan>
 <CAFEAcA9mgE5t5KpkGac7ABaVy3gK11PbpNMfO3p-gcVhSN51tQ@mail.gmail.com>
 <2915273.dLz0rCdnKo@silver>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-ID: <e79d7306-c0d8-fbd2-9582-bfa169dd6289@ozlabs.ru>
Date: Tue, 23 Feb 2021 23:40:59 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:85.0) Gecko/20100101
 Thunderbird/85.0
MIME-Version: 1.0
In-Reply-To: <2915273.dLz0rCdnKo@silver>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=aik@ozlabs.ru; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
 Stephen Rothwell <sfr@canb.auug.org.au>, Greg Kurz <groug@kaod.org>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>, Jeremy Kerr <jk@ozlabs.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 23/02/2021 23:24, Christian Schoenebeck wrote:
> On Dienstag, 23. Februar 2021 12:54:47 CET Peter Maydell wrote:
>> On Tue, 23 Feb 2021 at 11:39, Greg Kurz <groug@kaod.org> wrote:
>>> On Tue, 23 Feb 2021 11:09:05 +0000
>>>
>>> Peter Maydell <peter.maydell@linaro.org> wrote:
>>>> On Mon, 22 Feb 2021 at 14:43, Greg Kurz <groug@kaod.org> wrote:
>>>>> My understanding is that users must be "maintainer" to edit other's
>>>>> patches. Only three 'maintainers' are currently listed at ozlabs for
>>>>> QEMU:
>>>>>
>>>>> https://patchwork.ozlabs.org/api/1.0/projects/14/
>>>>>
>>>>> We had a discussion about that a few months back with Christian
>>>>> Schoenebeck
>>>>> (9pfs maintainer, Cc'd) who also uses patchworks. It turned out we
>>>>> didn't
>>>>> quite know how to go further because of lack of documentation, but I'd
>>>>> be
>>>>> glad to experiment the full patchwork experience if someone knows how
>>>>> to
>>>>> do it :-)
>>>>
>>>> If people want to try that kind of thing out I'm happy to try
>>>> to tweak their permissions on the patchwork instance.
>>>
>>> Please do for me then. My name is groug :)
>>
>> Hmm. Having looked through the UI and docs I can't figure
>> out how to do that (or even if 'maintainer' permission is
>> sufficient to add other maintainers; maybe one has to ask the
>> patchwork instance admins to do that?). If you can tell me what
>> I need to do to add you to the maintainer list for QEMU I'll do it :-)
>>
>> -- PMM
> 
> We were looking into this last year, and from my (poor) understanding this is
> how it works:
> 
> https://lists.gnu.org/archive/html/qemu-devel/2020-09/msg02864.html
> 
> If somebody knows a more convenient/appropriate way, that would be
> appreciated.


Jeremy or Stephen (cc-ing) do definitely know if there is a better way.


-- 
Alexey

