Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C49863D69B
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 14:23:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0N3P-0000ki-VA; Wed, 30 Nov 2022 08:23:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0N3O-0000j2-4d
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 08:23:10 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0N39-00053n-Ev
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 08:23:09 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 r133-20020a1c448b000000b003d076ee89d6so358073wma.0
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 05:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YyBsJlXPKgbwdXOi8hpcQmECv0wE69HEoUaeiwtJ5NY=;
 b=lAhJiehstAOGlwj8dqO33Q0ZSEcnDudbvdqvNEPbBL89VCash7u/pDwvMyZHdmKkEk
 9DtFBDjio2WjiZkcPK1cBq2E4DROWBDAyNMqniaolggRDjwaDTaYBWLRRI8wdK1x/7S3
 xJ+xQ/TL/BmuzuDbSbV68btmjrMTuSbDMqCWTevZow9gSn0e6MyuOU9nkNweHwutmKEy
 nx4jM/10l86fQTWEJa34qd+EVc8jxYSlee3Oc4Ohx6LGs9trgozI3b6E8oZav9TI8R7Z
 VPjkHf53CfaRyN+sngICcXNZkcnfUcJ+Ydh5s4aOhtu/mxJYZIGG3LI8bI7bQe2i03bq
 g+gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YyBsJlXPKgbwdXOi8hpcQmECv0wE69HEoUaeiwtJ5NY=;
 b=xoWDmu5hemRnjUggW2zE56glkGBAc2rsBlZPftk7xPXo7SEksGYE2QXT9GFbP4b3G1
 RiPJXWl0cZbilH/DVpY5gYBDOacEIddOPkgXO3Vgb9ohZ3Xa8jNN5dEL+RejYbzjHrkT
 SSouJFMRFBsNJQaJiForX+F+nSF4Xagl4e1MtSFZRt7TYcFq6mCqsXJuZTI6hxK3YGOW
 um52H47ef385u5jYoWIg6xBsr7CWYJIEI2+kLbua4L/QQQmz0qeQ8QHdOr/jrWNCLRzJ
 52kjSgdY9qZLtQO2H2jY9RZory70I0pT/LK+4c2ajVxM1yD+V2dh8PW6hJUdkdosjO08
 1tug==
X-Gm-Message-State: ANoB5pmb9P0Er2WRUocfPR3jbw5JaUXFkEMZDbP583OlxLomb3fexm/O
 kfKpDBIIRjtb3Hd/htZBmSCo9w==
X-Google-Smtp-Source: AA0mqf5A7wcYhX/xqHDphu37idm0XDne5tSvSJxnQCYXn8LeSD45Iz0hSJd11monMhq+7e4fg/2/5Q==
X-Received: by 2002:a05:600c:4e50:b0:3d0:bda:f2c with SMTP id
 e16-20020a05600c4e5000b003d00bda0f2cmr32092450wmq.117.1669814573017; 
 Wed, 30 Nov 2022 05:22:53 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 y2-20020adfdf02000000b0023657e1b980sm1547187wrl.53.2022.11.30.05.22.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 05:22:52 -0800 (PST)
Message-ID: <1778e96c-a3fb-2b1f-fe37-bec3e3913f29@linaro.org>
Date: Wed, 30 Nov 2022 14:22:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH for-8.0 00/19] Convert most CPU classes to 3-phase reset
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>, Song Gao <gaosong@loongson.cn>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Laurent Vivier
 <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org
References: <20221124115023.2437291-1-peter.maydell@linaro.org>
 <51024464-6fd6-4181-633d-1e261c19917a@linaro.org>
 <0f9b0728-d6b5-a37b-2dcb-7b7fbee876a3@linaro.org>
 <CAFEAcA98mDNWMhT+-2rsevpXAaAUzF-PF74LJ4871yxJcAKFNA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA98mDNWMhT+-2rsevpXAaAUzF-PF74LJ4871yxJcAKFNA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 30/11/22 13:38, Peter Maydell wrote:
> On Wed, 30 Nov 2022 at 10:51, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> On 24/11/22 14:46, Philippe Mathieu-Daudé wrote:
>>> On 24/11/22 12:50, Peter Maydell wrote:
>>>> This patchset converts the TYPE_CPU base class and most subclasses
>>>> to use 3-phase reset. (The exception is s390, which is doing
>>>> something a bit odd with its reset, so the conversion there isn't
>>>> going to be simple like these others. So I'll do that one
>>>> separately.)
>> Note, we can then remove scripts/coccinelle/cpu-reset.cocci.
> 
> What's our usual practice for out-of-date conversion coccinelle
> scripts? That particular script was "we'll never need this again"
> pretty much from the moment it was checked in, because we did
> the conversion of all the targets in one go. But it's still
> useful in some sense as a "this is an example of how to do
> this kind of change with a coccinelle script"...

The pattern I observed last years is:

  (a) If one-shot transformation, log the script in the commit
      description,

  (b) If the script can be used again in the future, commit it
      in scripts/coccinelle/,

  (c) Complex scripts are committed in scripts/coccinelle/ as
      example/reference.

I am fine keeping scripts/coccinelle/cpu-reset.cocci as an
example (c).

Regards,

Phil.

