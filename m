Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76BB414FEFA
	for <lists+qemu-devel@lfdr.de>; Sun,  2 Feb 2020 20:48:11 +0100 (CET)
Received: from localhost ([::1]:59174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iyLE2-0007uI-Is
	for lists+qemu-devel@lfdr.de; Sun, 02 Feb 2020 14:48:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36139)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dirty.ice.hu@gmail.com>) id 1iyLD0-0007Vj-37
 for qemu-devel@nongnu.org; Sun, 02 Feb 2020 14:47:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dirty.ice.hu@gmail.com>) id 1iyLCz-00011v-4d
 for qemu-devel@nongnu.org; Sun, 02 Feb 2020 14:47:06 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:37057)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <dirty.ice.hu@gmail.com>)
 id 1iyLCy-0000xh-SZ
 for qemu-devel@nongnu.org; Sun, 02 Feb 2020 14:47:05 -0500
Received: by mail-wr1-x444.google.com with SMTP id w15so15287842wru.4
 for <qemu-devel@nongnu.org>; Sun, 02 Feb 2020 11:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:subject:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QvplX+4gImN1ZzrXNn7xckqR5aPlt+NguUmNNKj9UbA=;
 b=B5JZSD+TY9QRQqx5jBwTq0WNul2UM7eemzKNIaHFHbZui9IPrY0cjiyAJxryCbw0UF
 j5b24rAIc8WAlW/3yWmNwl5aFXrlGdn4QOYYvEBngwhNcoyqhiWMYT4MrDryD3DPOkwP
 ymE3R6D82iAmI7y+xasieUF23lSybcLsjrnWdcG3UKzeQB5mZT6ZZeknUxMFaIIStGFg
 pUSYwRNDi6nCYM5hLCPYv6n0iKDc5tlbOsxorcIe1xb6v+MWKRgIcDS/FTSjRGOwuHKS
 otnaaleAGj8mWbb4c/jeS8cfvFDsoMKAC1Z/R0VjGt5R7ACCxbkig9IjtNFb92A9NUAG
 aHkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QvplX+4gImN1ZzrXNn7xckqR5aPlt+NguUmNNKj9UbA=;
 b=F28wBRx5wOufnDaqLf1PWv3FRmJExt4V1sQQ1pyb2ln2uopbR3GoiPq3vw9rj0w6en
 VyCC338yk854z7hQDG+nKZFYhAzB1Wps3QIDX38X9fhw3B+Qqfjqy0e9VLrj8LxyUfH/
 uawNXgAckmyK7hEgROXz7NO3u7M/h6CJc2SIIU03rNIJf6cI9m7nxb17Wo2jeF/aK+ti
 dpgPD6ozu1l2OLfhzUIVHsl1qEUCFQkmbMbKcND96vGLA7iBxxnGmbbKuKMBLlTCbn4y
 RaXNyouSiaxkkaikzy9kuuXuexVGTXuocshXPRUkxmk49eRRUmfcQ8j+vE0GZw3yCDor
 TF1Q==
X-Gm-Message-State: APjAAAVzgeOroz1vKk8tly0C3rGAQSOSZciaitEqOFFfXv6B4aK8iS1S
 jKjNzHlOZmrdo5M+gxlp/EU=
X-Google-Smtp-Source: APXvYqyizX6kpFX9aGl1djDNdjMEF5r3aZWy40mdoDhi7TCmZsFZxmTq2D0Mcusc71325zf7pxUjHw==
X-Received: by 2002:adf:f3d0:: with SMTP id g16mr11648496wrp.2.1580672823642; 
 Sun, 02 Feb 2020 11:47:03 -0800 (PST)
Received: from ?IPv6:fd00:835b:d940:d4fc::5?
 (2a01-036c-0113-48e2-0000-0000-0000-0005.pool6.digikabel.hu.
 [2a01:36c:113:48e2::5])
 by smtp.gmail.com with ESMTPSA id p3sm3242706wrx.29.2020.02.02.11.47.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 Feb 2020 11:47:03 -0800 (PST)
From: "=?UTF-8?B?Wm9sdMOhbiBLxZF2w6Fnw7M=?=" <dirty.ice.hu@gmail.com>
X-Google-Original-From: =?UTF-8?B?Wm9sdMOhbiBLxZF2w6Fnw7M=?=
 <DirtY.iCE.hu@gmail.com>
Subject: Re: [PATCH v2] Implement the Screamer sound chip for the mac99
 machine type
To: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>,
 Programmingkid <programmingkidx@gmail.com>,
 qemu Developers <qemu-devel@nongnu.org>,
 Howard Spoelstra <hsp.cat7@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <43D423C6-78D4-4DCE-B97C-0658D3D2E3BD@gmail.com>
 <4021690b-2380-3925-209e-d4cc66928773@gmail.com>
 <5314e860-dffe-3bc0-209f-bd2b937cd0c6@t-online.de>
Message-ID: <295dbdec-2ad3-d5ac-4ad6-a590f3be98ba@gmail.com>
Date: Sun, 2 Feb 2020 20:47:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.9) Goanna/4.4
 Interlink/52.9.7282
MIME-Version: 1.0
In-Reply-To: <5314e860-dffe-3bc0-209f-bd2b937cd0c6@t-online.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2020-01-28 09:30, Volker Rümelin wrote:
>> Hi,
>>
>> Unfortunately it's not that simple to simply revert the patch since the old backend api no longer exists.  Also I don't have a Mac so it's almost impossible for me to test the results.  I looked at the specified commit and I think I found a problem, could you please apply the attached patch on the current git master and check whether it solves the problem?  If yes I'll turn it into a proper patch.
>>
>> Regards,
>> Zoltan
>>
> 
> Hi Zoltán,
> 
> I also don't have a Mac so I tested your patch with a slightly modified sdlaudio version. I found two bugs in your patch. With the bugs fixed I have working SDL2 audio playback with float type samples. Now I wonder if the fixed patch also fixes coreaudio playback. Depending on how busy you are I can just write a review for your patch and let you handle the rest, or may I send a modified version of your patch to the mailing list for testing?
> 
> With best regards
> Volker
Hi,

Maybe I'm a bit late since you already did it, but go ahead, I don't 
have too much time to work on qemu recently.

Regards,
Zoltan

