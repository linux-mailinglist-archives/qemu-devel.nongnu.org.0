Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC46C369D35
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 01:16:52 +0200 (CEST)
Received: from localhost ([::1]:45232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la52Z-0003Dt-T8
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 19:16:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1la51E-0002gw-2G
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 19:15:28 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:50953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1la51C-0002rw-Dv
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 19:15:27 -0400
Received: by mail-pj1-x1034.google.com with SMTP id u11so20213012pjr.0
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 16:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=X2Vcbf5TpWDXru1isc/A/qDqvHKMHQyxKMfw/qkWI6w=;
 b=CZFsFW3zKWtAfV+sImGdV59SxUpURrY0RjmN8mWbqw4f9igYltt4uh+wKY2ONAAJIr
 mg3/HSPNIBQKnW9V7kn1wcAkO4X43XkobJhp43VT4PbEItB+3DEHaDv/Yl/HUdqCqnY8
 q5+M9HmrzepeTVyXBfNRrXmu0VdlPPl12gITwnyDUeFWTKd8XXQtZnKE4dIQgw6Mgmwy
 ObUC60EXVC+U8sbVPNWBtd/tBJdK8Og/DCbeQyPXIL6tQQHvyoh6GMSGVH/uKtIkAEvs
 T6cMD7xO8sa95swh+kd6bqnaY3hGW1X+X4M0IRLx1K0BkMWub5uo/p7uS8uD/P8oeJVG
 1jSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=X2Vcbf5TpWDXru1isc/A/qDqvHKMHQyxKMfw/qkWI6w=;
 b=YFzW7mGhO8B3PPSL6b1uOH/BaRPXWXwiCKidT6WvEdhFck+tPTCXT9vIW68xNNTjAa
 cXERl8mSQkQ7zeQgd5BeWeH8f1RSmVXW+SpxPr7JlIqpznTw/JlPs3VuFX1gf2/IFOQ9
 9zwK5/HjhvWSGdCw1sdOkzjt88kGkixg7hrQIBItlSlOtEqaovHMPbZE8eVb7xa2pZ3i
 rfM6oOmc2BF3ViGtKsX3vSis0iXNubB0figD4yZ+ifGhO9wGHL+nDYCPlzE1VdyTZeWd
 SimQ/sPICZgOZdeNsXDig3Hj5xz2BPMLc3U63U3Qk/ufkJlJ2O5v2QYCxXPtBtwdCvM4
 WpIg==
X-Gm-Message-State: AOAM530kE75g1fsg6dt4JLo5tyNSS7p5Dulb+nZ39ovFYgZSTvxSAUek
 J5GKxJpn2qMZI4CH8AKq+mWP0Q==
X-Google-Smtp-Source: ABdhPJyStIVsTstF+RLRKHEXoGsHkYoaUZXd4cSV2D3hf6yylH6MXDg9Cd3t5HXjedP8thzeJLBNXA==
X-Received: by 2002:a17:90a:5d92:: with SMTP id
 t18mr7120030pji.226.1619219724901; 
 Fri, 23 Apr 2021 16:15:24 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id gw19sm5814795pjb.4.2021.04.23.16.15.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Apr 2021 16:15:24 -0700 (PDT)
Subject: Re: [PULL 18/24] bsd-user: style changes for {}
To: imp@bsdimp.com, qemu-devel@nongnu.org
References: <20210423203959.78275-1-imp@bsdimp.com>
 <20210423203959.78275-9-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ebf23d65-d600-3c16-94da-fc03039e2860@linaro.org>
Date: Fri, 23 Apr 2021 16:15:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210423203959.78275-9-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
Cc: kevans@freebsd.org, arichardson@freebsd.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/23/21 1:39 PM, imp@bsdimp.com wrote:
> From: Warner Losh<imp@bsdimp.com>
> 
> Fix various issues with {} not being present on if / for / case statements.
> Tweak indentation where needed to appease checkpatch after this.
> Minor line length tweaks
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/main.c | 100 +++++++++++++++++++++++++++++-------------------
>   1 file changed, 60 insertions(+), 40 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


