Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D50443E3878
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Aug 2021 06:40:55 +0200 (CEST)
Received: from localhost ([::1]:47108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCacI-00042t-Ua
	for lists+qemu-devel@lfdr.de; Sun, 08 Aug 2021 00:40:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mCabA-0002ez-3N
 for qemu-devel@nongnu.org; Sun, 08 Aug 2021 00:39:44 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:44646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mCab8-0004Ee-8u
 for qemu-devel@nongnu.org; Sun, 08 Aug 2021 00:39:43 -0400
Received: by mail-pl1-x630.google.com with SMTP id q2so12779287plr.11
 for <qemu-devel@nongnu.org>; Sat, 07 Aug 2021 21:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=weSU2w5LuRqLyc+kik4P3MQYKmUOE2fzPQwxF/nNriI=;
 b=sCrUNmplSiWy1ECaNuJ7jneHEQ+UPoV9tHvXzgFSyQtL0ybKG7DgdABExu6PiPqaVj
 Yo7joVBe+E/A2wTnkv37wTvglJ5gpxmPO3vXQ3xLj8tcPRF2rMXJJ2f6nWsc9K4IQBhB
 aU1Xz6JCd/iFCxsLhw1CKFsJZmUDYI6TZMM/Hm3aUjsb2Mx9wHPp/zgdPN2dkRqgvcFh
 vktpFoocIvCdDJ9R0gDjsWM4MOhzUDHvf2f/yRc2VNiIZi6fjZMd6CeffMzofr16huV9
 SvUmLB3VKoVJ/1E1BNV6JpYk7Ao8pWPCp2nzBegj1gPSwLvFq9gGuXJxqlOoua8aFlTk
 7g3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=weSU2w5LuRqLyc+kik4P3MQYKmUOE2fzPQwxF/nNriI=;
 b=rfrTvAG9HR0AKgFTUIRC9lVVDs3s18BmmUcqHWlpcelMcfdpRJBqYnL4Io5wuPuuIM
 GOmOUqz9x2P4fBGx1VYWACqZ1wHbij3FXIl6lxAEcovFBw7LbCghqx3o29d5RCXfu4Hm
 i3bwQxx+nvGaadrOYF+3lndj1hor7tz3YcBnETVREuwx2GhhwlTTJ4Gi3r7N/9y4Gi8P
 FxU3krEjca4yzhFenCw5JzsB3MZlr31PhRUACd99BUTYrS47GgmI/Fcq8kHJlIyx3a3C
 gB8SxqqD/UEY7zsT68e3aQN38KyQPN8n/b1rtv6DKfBBhdf0mZjF8OtwVuvXF0Az/UXt
 wr4g==
X-Gm-Message-State: AOAM532QTmUfp61MbpAQfQGpJTVtp6sDv5DZDMoSP1pw+WaP8PZdW7U/
 HlPW/W1CN+0PrCrIQaK3M1VU+w==
X-Google-Smtp-Source: ABdhPJxGkrFCVAbRkv5x36bEQd7weZt49Xuwv8tsXX0HByCqyD3GEoodALGkC53uBKv82UwO8KC4mA==
X-Received: by 2002:a63:62c7:: with SMTP id w190mr2129pgb.55.1628397580445;
 Sat, 07 Aug 2021 21:39:40 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id z24sm14763946pfn.150.2021.08.07.21.39.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Aug 2021 21:39:40 -0700 (PDT)
Subject: Re: [PATCH for 6.2 09/49] bsd-user: add license
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210807214242.82385-1-imp@bsdimp.com>
 <20210807214242.82385-10-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e2b77f43-a36c-4b9f-61c7-836ae4dd22c0@linaro.org>
Date: Sat, 7 Aug 2021 18:39:37 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210807214242.82385-10-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: kevans@freebsd.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/7/21 11:42 AM, Warner Losh wrote:
> Pull in the license statement at the top of the bsdload.c file
> from the bsd-user fork version of this file. No functional changes.
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/bsdload.c | 17 ++++++++++++++++-
>   1 file changed, 16 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

