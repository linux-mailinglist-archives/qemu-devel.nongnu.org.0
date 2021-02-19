Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A84A320189
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Feb 2021 00:08:52 +0100 (CET)
Received: from localhost ([::1]:56290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDEtG-0007hb-Ti
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 18:08:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDErg-0006iE-FV; Fri, 19 Feb 2021 18:07:12 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:45371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDEre-0001gl-OV; Fri, 19 Feb 2021 18:07:12 -0500
Received: by mail-ej1-x633.google.com with SMTP id n13so16502861ejx.12;
 Fri, 19 Feb 2021 15:07:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9Fg/UcFR8UCdkcXxit5fDiDKjU63VthQVYRAp3FKt7o=;
 b=WH+PYexKk1DslYk2OMkesOj9gc7vT19ZWkg6PjYR5ox5VsbfY3avPz4gfgAQXn5sgV
 2q1JktuV8DcgWho6AWJYtm0WLtvKdsCFLodQ3atSzZe6GvSxLduc09Yr5AzRHkMawn1X
 J9Pv/eY3E7x5JDmrnjiFfM8KNcwgt/AU6OedMSU75KG8Cf6jsVwYnU6tOg3TTyjMGTRc
 6fCPn1iWzAyzgAadYvDmbfDAMJjyoFE5IT1RG0Bd/Sam3j5pUfrJJjhw4BEhQAtVcP6A
 B0LnjGbLbnjFy5WY/L49jloMg2vrpSMDGnRHozHT84aRjJgBS3i1kDKwMDLYd45NRW0K
 yXug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9Fg/UcFR8UCdkcXxit5fDiDKjU63VthQVYRAp3FKt7o=;
 b=pPY0hgAuRfl6oNw8wro6zE02uxY3gemBlJxXaehIuYofKQtHFmKLFJyK9sziMYkg9g
 x2+B8ICQd5OQvuwUPGvqd4PLPpjJa8ldH9IZ9ddxed80AZy7ChQR8nBmYu6iTWH2M9kJ
 rhuzvpB08KcXeAt7HLOCA+QLypOIwATj3iYDEha40bt4FCNFlpdzno0y5qnjJvNXdTl1
 DRAZspkbG8bFc3cdotI9wnBt/AUoxseD4tOUDHVGsA+uiobTD7P79oobKN5Rsu2JWTc4
 ZmC1rtBmzmzHR5pd+Nrn59SX2KMA/8O3wZPKFAuWQyIZsFnaz4n9/YCaGS84RUedCB+z
 0Nfg==
X-Gm-Message-State: AOAM531MEYGoIDoFNwl5/gBNDl70AYFDh1oDdcfZXN1XBXRus0eFrkIu
 5ClbSNHdItV/U1iBVZJ52AU5vXh1P0c=
X-Google-Smtp-Source: ABdhPJxMhV2yg5JbkYoifuCWYROcreE5SrDQFKlCL1fVeR4e1o6dcre+rb48KiDSS4iOgPZcmxl2cA==
X-Received: by 2002:a17:907:20bb:: with SMTP id
 pw27mr10826321ejb.71.1613776028542; 
 Fri, 19 Feb 2021 15:07:08 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id ia17sm363008ejc.55.2021.02.19.15.07.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Feb 2021 15:07:08 -0800 (PST)
Subject: Re: problema compilation
To: nerus <fhuvu30@gmail.com>,
 Ottavio Caruso <ottavio2006-usenet2012@yahoo.com>
References: <05BD61C1-9771-4EF9-AD1B-8DAB8DFD127A@hxcore.ol>
 <CAFEAcA8Xuf3WfPiNPqSVLz+tMgvO+6OzKTRQpJ_9Z7MqeO6pCw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b0bb2b4e-4ebe-f4c4-d8ef-191c19c876bb@amsat.org>
Date: Sat, 20 Feb 2021 00:07:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8Xuf3WfPiNPqSVLz+tMgvO+6OzKTRQpJ_9Z7MqeO6pCw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-discuss <qemu-discuss@nongnu.org>,
 Yonggang Luo <luoyonggang@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing Stefan / Yonggang / Paolo.

On 2/20/21 12:03 AM, Peter Maydell wrote:
> On Fri, 19 Feb 2021 at 22:54, nerus <fhuvu30@gmail.com> wrote:
>>
>> Good evening, I turn to you because I have a problem that does not appear in the official documentation, nor in the different blogs or irc channels.
>>
>> I need to do a cross compilation but it is impossible from version 5.2, when I use msys2 an error occurs indicating that symbolic links cannot be created even though the windows user has permissions to create symbolic links, I configured this through gpedit.msc.
>>
>> when I use cygwin with the mingw64-w64 tool chain an error occurs whereby meson says that it cannot find any compiler even though the compiler path is specified in the configuration script, mingw cannot be used from linux either due to There are many missing components that cannot be compiled by hand because the proper versions are no longer available, how could you solve these problems without using already compiled binaries? Thank you
> 
> Cross compilation works in general -- our CI testing setup
> includes various cross-compile configurations, including
> building Windows executables from a Linux host
> (eg https://gitlab.com/qemu-project/qemu/-/jobs/1042844159).
> 
> You'll need to be more specific about exactly what you're
> trying to do and failing (eg quoting exact commands,
> setups, error messages).
> 
> thanks
> -- PMM
> 


