Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9591C2E321F
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Dec 2020 18:26:51 +0100 (CET)
Received: from localhost ([::1]:50796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktZog-0002Tc-5p
	for lists+qemu-devel@lfdr.de; Sun, 27 Dec 2020 12:26:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ktZmU-0001Cw-10
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 12:24:34 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:33825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ktZmR-0006Bx-Tn
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 12:24:33 -0500
Received: by mail-wr1-x429.google.com with SMTP id q18so8582558wrn.1
 for <qemu-devel@nongnu.org>; Sun, 27 Dec 2020 09:24:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EWdL+aq8vFTT65j8T1mjSKpQaPv3MWTyT7ymBR5jy2I=;
 b=uotbPecIzxBT4mnII9mvp2g62wq8zh1HdxpeUppr0RrATM43BEbwR+atjwGk9VLLVo
 8c7s8exp2i6k59u64TYkANdyOEuJkwCg5wekdq/jogE05XCSq+Ea1YFcKRfCb715eegb
 jzZrcc8b8l+i4OYPIMixqerF9lkim11GUHuRnD/51PH78jWjlcf/wARkDpkK3dzkPgS8
 VVqCj40QJvo2KLzSfIX57FZDEgkci4rmpQ+PNWAIn3JvPIwpeHuAWQ3aHJDFe4nNDZt5
 TYq3YHBCqIWWDz9Bw2Yvu2AkpBOv9AkRAHRLZHJJ/uDQkFaBrIzo0xE3wNnuP7CeAyx4
 Z3sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EWdL+aq8vFTT65j8T1mjSKpQaPv3MWTyT7ymBR5jy2I=;
 b=I5XHrEs0NhZN1EBGuN8eO7lRMv2fo5+LPqIHa9TWFqYRHceTJ9nBsp9jX9WCH2zz9r
 P3inRTh6UeaiahdA8tLBzSGmoaZihxlnt5EJI7eUTa/PMzFj2Kol5OtPDuehHGmRmYGD
 mN12FHnm1Km9rf/TkloDek3Xg87H/dzQ4UtXr7zjRoTyTHxxbDI+rlkPEN3VS75MajMa
 tkvBJdXoO1eECyVo1PVhQOxpVQYK3sL325Xg1VuSNufhUvGZER+fxpdc1p2siyKgw6EW
 4V6m4bpIq2X0PanTw+JpxMP/NZc4AlzPztYFDPLbqYqMd3vS+4jQAG5iRqXDdQU8VjbY
 BMPQ==
X-Gm-Message-State: AOAM531qdYenCxi/Z5JlK0sN5sXJaiJeeh7rC11vy5ldcCwLZ4IlFVzj
 0FN+1I2ps3KFxJ1CNQaM7kI=
X-Google-Smtp-Source: ABdhPJzpqVtbZ4eiWAjcH0Syvx4n6l4Lm/TS+56i9TWoZQ+D+nofkCXGvDb9KkFo+304Qbb/FxG3AQ==
X-Received: by 2002:adf:f6cc:: with SMTP id y12mr47320190wrp.35.1609089870467; 
 Sun, 27 Dec 2020 09:24:30 -0800 (PST)
Received: from ?IPv6:2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b?
 ([2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b])
 by smtp.gmail.com with ESMTPSA id y13sm48980649wrl.63.2020.12.27.09.24.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Dec 2020 09:24:29 -0800 (PST)
Subject: Re: [PATCH 2/2] via-ide: Fix fuloong2e support
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <cover.1608852217.git.balaton@eik.bme.hu>
 <796292ea92f3f00e696b1eea33ef0c6815002bf0.1608852217.git.balaton@eik.bme.hu>
 <00c994c9-99d8-5b34-3976-4e6617b794a2@amsat.org>
 <8c7e7487-3cb8-5df3-2ce7-5b4bb1b698c2@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <cdf2cf0e-bde8-a854-5206-4e55bdcc733f@amsat.org>
Date: Sun, 27 Dec 2020 18:24:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <8c7e7487-3cb8-5df3-2ce7-5b4bb1b698c2@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.829,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: John Snow <jsnow@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/27/20 5:40 PM, BALATON Zoltan via wrote:
> On Sun, 27 Dec 2020, Philippe Mathieu-Daudé wrote:
>> On 12/25/20 12:23 AM, BALATON Zoltan wrote:
>>> From: Guenter Roeck <linux@roeck-us.net>
>>>
>>> Fuloong2e needs to use legacy mode for IDE support to work with Linux.
>>> Add property to via-ide driver to make the mode configurable, and set
>>> legacy mode for Fuloong2e.
>>>
>>
>> Fixes: 4ea98d317eb ("ide/via: Implement and use native PCI IDE mode")?
> 
> Not really. That patch did what it said (only emulating (half) native
> mode instead of only emulating legacy mode) so it wasn't broken per se
> but it turned out that approach wasn't good enough for all use cases so
> this now takes a different turn (emulating either legacy or half-native
> mode based on option property). Therefore. I don't think Fixes: applies
> in this case. It fixes an issue with a guest but replaces previous patch
> with different approach. (Even though it reuses most of it.)

Well, if Linux guest got broken by this commit, why not name it a "fix"?
Anyway I don't mind how it is called. I find important to refer to the
commit hash to help navigating between commits while reviewing history.

What about:

'''
The legacy mode for IDE support has been removed in commit 4ea98d317eb
("ide/via: Implement and use native PCI IDE mode"). When using a Linux
guest, the Fuloong2e machine requires the legacy mode.
Add property to via-ide driver to make the mode configurable, and set
legacy mode for Fuloong2e.
'''

Guenter, is that OK with you? (I can update when applying this series
via the MIPS tree).

Thanks,

Phil.

> 
> Regards,
> BALATON Zoltan

