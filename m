Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A87E63ADBB
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 17:30:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozh0s-0002Bw-1U; Mon, 28 Nov 2022 11:29:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ozh0l-0002AI-8z
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 11:29:39 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ozh0i-0002da-E9
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 11:29:38 -0500
Received: by mail-wm1-x333.google.com with SMTP id 5so8898383wmo.1
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 08:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qiMbpv3c+ppQz/Fn/Yzd/jwu1LIulR9EHUPNiWA6U7w=;
 b=pgLtBf4VJ5rpoZXh5976yXiNWspnwc0mmT+kI3gIWpctYatAgQrf9kbrFO3wOBUb4Q
 wL5HuzFK6kNaoxVR0iYd4t+tQKuIMdtmzHdxm2p9r/OSJBNPxMQ1DBGSbcgCEw7zrkJu
 kbGo1dUl9ipgi9dlTvSYj3mtC0wZxcvqi/5u2DFuEOx/jwnke6zh0TIO3olaMoyE4Wiy
 RebtHabKDj0jfr1YRYhgy/2vSVo75kpclwxwTP4w5+TNiBSbaqp+LeMENgZ1VyhZPNeT
 5jX8ZNUx+fG6GPPR3CI8DEhOQ1oWoao9KtJqNBQzerqP9+9l/+9EXP1+McFrmiGhjgK3
 +Ciw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qiMbpv3c+ppQz/Fn/Yzd/jwu1LIulR9EHUPNiWA6U7w=;
 b=Mw7hdWZ0pEx9co3nfus59iHkFuIxfIcbxa6VD4eKlIE2BoX4LjGni8TqcTacLp3jic
 jC+aIlGrOzfFRRZB+UuS9X7yY/WtMf1U0NpklCGkvQc0n0e755WNMCAJ5UgKGR11EPeH
 fE0BblxW3sH88BP6kVx3502YuR5k9NJoKEtR35TC7eMi2V/9Sj9w1qQurZ9lVDCAggKW
 2I7kdRrdfuuoxZbttmRaeGUM1c4j9Clp0VpDhQ3qGmyaRM/A0lihvzK1AdMv3+/w58h+
 bxANdaTMyRPkaMds2KWSs88dRtnRWrgbC4yfNsNBQ8b+0QSmaNPi7Oww0lm4+KCaFXck
 YLIA==
X-Gm-Message-State: ANoB5pkR1o4lRhNdKqB4LNWcNcTTK+CNvpoO8QRgqAUk0oNRQONtIcU1
 XQF3DHqPczV3y/2cZyrY6KOnVg==
X-Google-Smtp-Source: AA0mqf7lrxS/c5Jnbk2Wg/Fd7rXeKNl8Gzw7/Edz2QScCckSemZU3aGhj59OAnR7kM8IAsSajJSCeA==
X-Received: by 2002:a1c:ed17:0:b0:3cf:cfce:9d9e with SMTP id
 l23-20020a1ced17000000b003cfcfce9d9emr26245190wmh.66.1669652974496; 
 Mon, 28 Nov 2022 08:29:34 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 j5-20020a5d5645000000b00225307f43fbsm11301815wrw.44.2022.11.28.08.29.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Nov 2022 08:29:33 -0800 (PST)
Message-ID: <9a8debf0-8a49-1ba7-a009-eb1e5b383590@linaro.org>
Date: Mon, 28 Nov 2022 17:29:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [RFC PATCH-for-7.2 3/5] hw/display/qxl: Pass requested buffer
 size to qxl_phys2virt()
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
To: Gerd Hoffmann <kraxel@redhat.com>, Peter Wu <peter@lekensteyn.nl>
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org, Alexander Bulekov <alxndr@bu.edu>,
 Peter Maydell <peter.maydell@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20221128134832.84867-1-philmd@linaro.org>
 <20221128134832.84867-4-philmd@linaro.org>
 <20221128150853.lp2hdkdzt6ou6f6g@sirius.home.kraxel.org>
 <655e51b2-99ef-a48d-9be3-ddbc15275e7f@linaro.org>
 <c64522e4-4bb9-8dbf-fd93-151b77f5156a@linaro.org>
In-Reply-To: <c64522e4-4bb9-8dbf-fd93-151b77f5156a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 28/11/22 17:18, Philippe Mathieu-Daudé wrote:
> On 28/11/22 16:41, Philippe Mathieu-Daudé wrote:
>> On 28/11/22 16:08, Gerd Hoffmann wrote:
> 
>>> Also at least one code path (processing SPICE_CURSOR_TYPE_MONO in
>>> qxl_cursor) goes access chunk.data[] without calling
>>> qxl_unpack_chunks(), that needs additional verification too (or
>>> switch it to call qxl_unpack_chunks, or just drop it because nobody
>>> uses mono chrome cursors anyway).
> Per commit 36ffc122dc ("qxl: support mono cursors with inverted colors")
> "Monochrome cursors are still used by Windows guests" (i.e. Win2008R2)
> :/

Hmm I guess I'm missing something in qxl_cursor() following the
SPICE_CURSOR_TYPE_MONO case.

- cursor_alloc() allocate QEMUCursor* c but doesn't set c->data,
- nothing seems to set c->data
- cursor_set_mono() is called and *(c->data) is assigned...

?


