Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DAE7B5674
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Sep 2019 21:50:38 +0200 (CEST)
Received: from localhost ([::1]:51774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iAJUj-0007Nk-I0
	for lists+qemu-devel@lfdr.de; Tue, 17 Sep 2019 15:50:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48768)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dirty.ice.hu@gmail.com>) id 1iAJRX-00050j-Nr
 for qemu-devel@nongnu.org; Tue, 17 Sep 2019 15:47:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dirty.ice.hu@gmail.com>) id 1iAJRW-0006j5-Id
 for qemu-devel@nongnu.org; Tue, 17 Sep 2019 15:47:19 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:38123)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <dirty.ice.hu@gmail.com>)
 id 1iAJRW-0006iu-Cl
 for qemu-devel@nongnu.org; Tue, 17 Sep 2019 15:47:18 -0400
Received: by mail-wr1-x443.google.com with SMTP id l11so4444075wrx.5
 for <qemu-devel@nongnu.org>; Tue, 17 Sep 2019 12:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:subject:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oQeH/mztuXf3vq0eWv8W6xjsjG4JJWjy8XIK1haLLVs=;
 b=qFnPRKGEE9NX720h0qkefIyp672Y4ztlT9/zUYmQoq3/LEy3c3nxHQxDgq9GRxwutL
 bNewvizDIv0hy0q5M+2L5Yz5+F46khcd+0YeajmwEYFlrKq/amz0ATqlLmm+LZVuz4Et
 cfvPTim8QFOVWuB6hdsdtQokA99oAOR9RJi+E72BqYjyKTgRVzoFqwXGsF3F9GP++mrv
 CR6L1UAwXTvv95/2BFtIiTNxchkID/hRHEUQSZL45N3K2UWSq5LRqzYougpv5cbsAIGB
 bpTlb0SYSxTUeN8WVOXaF9uu0x9yvsBk2xKBcznsb3gvhOQUrbPO5J46n7gSpv4wGBJI
 LPoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oQeH/mztuXf3vq0eWv8W6xjsjG4JJWjy8XIK1haLLVs=;
 b=ZE1C3sTf5Rt0VwoKeeDxXk5uMLBjPJWeRY7VGhzG4e4aYRE1+ML5u+rMZcBcPFsC+x
 yaN6gZ9F8jLFXuk3rhgZDUHBcQNbaYDUsdMbztC85YBcBBfSGQb5QwWjc0gvW97UPeSn
 sPYy2lmccNONCiX1gcxybpjOSbWI+frfN4E+9B8YNPAVairx1ZEVCU9lGYw5/jpmWYPO
 ma0WZQ77BzyTH7/8DocoqGatI86h3snYirqm8OG5CRq98fQ1C+gjp7fJMtbvC0ril0pN
 peJvhETjQjAdnv3fU3cW2cB14j8YO7uGFdPIjgfM78+SMX7gOzKDPkLizHLBM5dqWVU7
 ZskQ==
X-Gm-Message-State: APjAAAXwq7xzWvsi2X7aLYhv5LXq2nIQ/i0sV/yO+QqUAmN61ImFODEs
 Xb+CZs3eoPezCX+Pmqgx9FU=
X-Google-Smtp-Source: APXvYqw1mRque88o81h6NUES7DaFjJuEVekibpX/D2bWpv7arR0iNbVishhsYko7Ey/Crkn3gA59lQ==
X-Received: by 2002:a5d:434f:: with SMTP id u15mr249554wrr.16.1568749637106;
 Tue, 17 Sep 2019 12:47:17 -0700 (PDT)
Received: from ?IPv6:fd00:835b:d940:d4fc:1::ca?
 (2a01-036c-0113-74ef-0001-0000-0000-00ca.pool6.digikabel.hu.
 [2a01:36c:113:74ef:1::ca])
 by smtp.gmail.com with ESMTPSA id c132sm4915810wme.27.2019.09.17.12.47.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 17 Sep 2019 12:47:16 -0700 (PDT)
From: "=?UTF-8?B?Wm9sdMOhbiBLxZF2w6Fnw7M=?=" <dirty.ice.hu@gmail.com>
X-Google-Original-From: =?UTF-8?B?Wm9sdMOhbiBLxZF2w6Fnw7M=?=
 <DirtY.iCE.hu@gmail.com>
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20190911145818.18962-1-stefanha@redhat.com>
 <20190911145818.18962-3-stefanha@redhat.com>
Message-ID: <9b2c9131-41d1-aee2-c40d-0f448c83b497@gmail.com>
Date: Tue, 17 Sep 2019 21:47:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190911145818.18962-3-stefanha@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
Subject: Re: [Qemu-devel] [PATCH 2/2] audio: add -audiodev pa,
 in|out.latency= to documentation
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
> The "latency" parameter wasn't covered by the documentation.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Zoltán Kővágó <DirtY.iCE.hu@gmail.com>
> ---
> How is this parameter related to buffer-length?

Pulseaudio being a client-server architecture is a bit different than 
the other backends, plus it also has to mix multiple streams. 
buffer-length corresponds to the buffer inside qemu, while latency 
corresponds to pulseaudio.  For playback, the latency should be "maximum 
latency that the application can deal with", if a different client 
request a lower latency, our latency will decrease too.  It's up to the 
server to figure out an optimal buffer size on the server side of the 
things.
For recording it's the size of the buffer we will read at a time from 
pulseaudio.

> ---
>   qemu-options.hx | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/qemu-options.hx b/qemu-options.hx
> index a4f9f74f52..82154cecf8 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -470,6 +470,7 @@ DEF("audiodev", HAS_ARG, QEMU_OPTION_audiodev,
>       "-audiodev pa,id=id[,prop[=value][,...]]\n"
>       "                server= PulseAudio server address\n"
>       "                in|out.name= source/sink device name\n"
> +    "                in|out.latency= desired latency in microseconds\n"
>   #endif
>   #ifdef CONFIG_AUDIO_SDL
>       "-audiodev sdl,id=id[,prop[=value][,...]]\n"
> @@ -630,6 +631,9 @@ Sets the PulseAudio @var{server} to connect to.
>   @item in|out.name=@var{sink}
>   Use the specified source/sink for recording/playback.
>   
> +@item in|out.latency=@var{usecs}
> +Desired latency in microseconds.
> +
>   @end table
>   
>   @item -audiodev sdl,id=@var{id}[,@var{prop}[=@var{value}][,...]]
> 


