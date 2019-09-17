Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9974CB5627
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Sep 2019 21:31:05 +0200 (CEST)
Received: from localhost ([::1]:51616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iAJBo-00055H-Il
	for lists+qemu-devel@lfdr.de; Tue, 17 Sep 2019 15:31:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46825)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dirty.ice.hu@gmail.com>) id 1iAJAT-0004bD-Vc
 for qemu-devel@nongnu.org; Tue, 17 Sep 2019 15:29:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dirty.ice.hu@gmail.com>) id 1iAJAS-0007vf-VG
 for qemu-devel@nongnu.org; Tue, 17 Sep 2019 15:29:41 -0400
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:37374)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <dirty.ice.hu@gmail.com>)
 id 1iAJAS-0007vD-MO
 for qemu-devel@nongnu.org; Tue, 17 Sep 2019 15:29:40 -0400
Received: by mail-ed1-x544.google.com with SMTP id r4so4409399edy.4
 for <qemu-devel@nongnu.org>; Tue, 17 Sep 2019 12:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:subject:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vB9xwCFc5yhxsumTn28tjDCl6D2Qq7oIE9Y5rkz0XKs=;
 b=mWb2WKBRP3eTk++r2DlpP3sVXKI0LznB1rWAcqxa1JLpjg5mOSWXRf/IPB9+SCfSt8
 2nD5oWl80luQ3z3xMY7KelYlmMLFYlgs/WClqjtl/QJnq+P9cu4OxUEY9itud/psoNH6
 Vv4usIxcFiKMGtOBGuF8/jRgOtVzAGeYnZ/DzHeuUZU0HxfNv0XHs+3z53ldMgR9U8CJ
 AYnFOu5mFLpDp7Aj09zvBrat8qicojkz1xGDD4ylZfiMHueDCJ1OgrQ4PTXvlAi4S4Sk
 PLzlq7TcsVhYPnwP1APHRDUQI5n9vGNFXx1kU4qaeTfO3ondFaFjr2OkGaKbbAIiYbFY
 kLHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vB9xwCFc5yhxsumTn28tjDCl6D2Qq7oIE9Y5rkz0XKs=;
 b=pWzQu0T7dDsq0jx8EnXYRyqR5t6gKEIRF5g3ULaZOtFf7oic3/HN7NyTHypx7s+BRw
 bNZvtVwYhj4RUsgnDQzeB2yFu9BKrwgWCJgkKkw4Johvpfaf1CbK8818j6ZXzGmEZSFL
 k5x/YvifhWZPNuqc+qogVx5kEubbQE52K+U8HH7qK/QF2bOz+0XjRGjTSg5/EEYK0cZ/
 peLyduDETke4HhJqSzE/LwL52ppOf2u9MVmGxGaNANbNOwXmwHtF2G6rLaNWgrkxGyIu
 tJJakzuyjSWIo+cO5cyf0rW2sV+HYeFORU/OZumkE7NcYUAgvXAJ4cPI1aul/yLjRqEG
 NU0Q==
X-Gm-Message-State: APjAAAWuAnuoIyRsWolQ4OcXz5qBDY27nvljRNos1W8WMoJQCal4ClLn
 aN1up1Ygyx5vJbLO83N46C0=
X-Google-Smtp-Source: APXvYqy1d5ZldAhsi9eIN3tTcsbJbwtrScP5GPp+ChF/vEO8oQhGQXZkHdI83fuVoGGxNoQ1N7y1lA==
X-Received: by 2002:a05:6402:1a4c:: with SMTP id
 bf12mr6522396edb.277.1568748579002; 
 Tue, 17 Sep 2019 12:29:39 -0700 (PDT)
Received: from ?IPv6:fd00:835b:d940:d4fc:1::ca?
 (2a01-036c-0113-74ef-0001-0000-0000-00ca.pool6.digikabel.hu.
 [2a01:36c:113:74ef:1::ca])
 by smtp.gmail.com with ESMTPSA id i7sm586438edk.42.2019.09.17.12.29.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 17 Sep 2019 12:29:38 -0700 (PDT)
From: "=?UTF-8?B?Wm9sdMOhbiBLxZF2w6Fnw7M=?=" <dirty.ice.hu@gmail.com>
X-Google-Original-From: =?UTF-8?B?Wm9sdMOhbiBLxZF2w6Fnw7M=?=
 <DirtY.iCE.hu@gmail.com>
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20190911145818.18962-1-stefanha@redhat.com>
 <20190911145818.18962-2-stefanha@redhat.com>
Message-ID: <2de26e7e-1ea9-3fb6-d9b8-fcb397794d82@gmail.com>
Date: Tue, 17 Sep 2019 21:29:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190911145818.18962-2-stefanha@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::544
Subject: Re: [Qemu-devel] [PATCH 1/2] audio: fix buffer-length typo in
 documentation
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

On 2019-09-11 16:58, Stefan Hajnoczi wrote:
> Fixes: f0b3d811529 ("audio: -audiodev command line option: documentation")
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   qemu-options.hx | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/qemu-options.hx b/qemu-options.hx
> index bbfd936d29..a4f9f74f52 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -439,7 +439,7 @@ DEF("audiodev", HAS_ARG, QEMU_OPTION_audiodev,
>       "                in|out.format= sample format to use with fixed settings\n"
>       "                valid values: s8, s16, s32, u8, u16, u32\n"
>       "                in|out.voices= number of voices to use\n"
> -    "                in|out.buffer-len= length of buffer in microseconds\n"
> +    "                in|out.buffer-length= length of buffer in microseconds\n"
>       "-audiodev none,id=id,[,prop[=value][,...]]\n"
>       "                dummy driver that discards all output\n"
>   #ifdef CONFIG_AUDIO_ALSA
> @@ -524,7 +524,7 @@ Valid values are: @code{s8}, @code{s16}, @code{s32}, @code{u8},
>   @item in|out.voices=@var{voices}
>   Specify the number of @var{voices} to use.  Default is 1.
>   
> -@item in|out.buffer=@var{usecs}
> +@item in|out.buffer-length=@var{usecs}
>   Sets the size of the buffer in microseconds.
>   
>   @end table
> 

Double checking it's indeed "buffer-length" in qapi.  Also I spot a 
different bug: the alsa documentation qemu-options.hx has "period-len" 
but according to qapi it should be "period-length".  Care to fix it or 
should I submit a different patch?

Regards,
Zoltan

