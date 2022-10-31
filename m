Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB60613188
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 09:14:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opPw0-0002L5-18; Mon, 31 Oct 2022 04:14:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opPvy-0002Jy-Eo
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 04:14:14 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opPvx-0005Pp-0f
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 04:14:14 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 b20-20020a05600c4e1400b003cc28585e2fso7536956wmq.1
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 01:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7//pJVQkXeOUKIL7Ks0ucjymXULyUdy891MZlxul35g=;
 b=FD73Rl5DQ+v/2p7daBUq0AxYv884g+qcmG8vGFNfdqmuse+tSk5yaEO1/c+QMwqe7b
 2utZHaLJpmim9enZSyVja72AQJw4ccEu/ksej9ClPPxatd0g0zA/IeLEac8iecoOqv5i
 D75Sq5/R3kaaOy6zD/IOlNsTwSmXRnFoxc6d2+n/0lYd9ChfuxcyuaS9KXgpglxboWGC
 WSEZduWneyR/xjZUp/+BrGosRth8KhS4BA/pPoZoXEIOmyiZB7dNDsGngMzFS98wPXA9
 VByuRqHDnq9M0g62axy2s5wvLdYAs0vXfV3jGTND+IkfdpFAfGcsWa9j5Zw5qVk1LSAW
 7nAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7//pJVQkXeOUKIL7Ks0ucjymXULyUdy891MZlxul35g=;
 b=FwR+uiI9v1S1NjUOO0LJtu4xZLAgthtKJ3oYJ0848Ak36u8EFYTOKHIySVGTqyN7ag
 CUecdTjPiLHU4Ga1f/ZJld892yDsa2JthpnIfltz52OXlCtZHvmwW3OQKY0uNFKTgO3J
 OASdHUhTD7ud94cSNSTyjeagEIIhV5kBtlgam7GH4sqfk+DwoAZBsPv6H3c2l9BpBfid
 9WFg4Q+IA8N+kSiRp4CIXkLnPS/DmvCqvc8OpeC0q9PJ3//x6Sri4k+zKvAQiqLLYpk/
 F0lZr9Dkx6mtRHqE82l5oXmqk8k+KXAl36IGLArNXeolzNzJDE4pucYLyNr3kiGFDl4m
 nkrA==
X-Gm-Message-State: ACrzQf2pNphmbWg7mqoN11aVK5ISkSHuulUVIxKRgd2scgyckJFB+PWt
 i7iPbJ4F3coeQxvroB9H6Np/Ew==
X-Google-Smtp-Source: AMsMyM4UCiXU/2cSzVTYPHJXNoZMmo+EwXySJEU044oEEB28Yu6CBPiK1Q61KAhBXDyAYWGYEBTmxA==
X-Received: by 2002:a05:600c:4618:b0:3cf:54ad:7bb3 with SMTP id
 m24-20020a05600c461800b003cf54ad7bb3mr13206520wmo.4.1667204051563; 
 Mon, 31 Oct 2022 01:14:11 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 bv19-20020a0560001f1300b00236627c078esm6374990wrb.110.2022.10.31.01.14.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Oct 2022 01:14:10 -0700 (PDT)
Message-ID: <a09af4b2-6c08-bb03-e681-52ec95290917@linaro.org>
Date: Mon, 31 Oct 2022 09:14:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH 0/4] Endianess and coding style fixes for SVQ event idx
 support
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>, =?UTF-8?Q?Eugenio_P=c3=a9rez?=
 <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Jason Wang <jasowang@redhat.com>
References: <20221028160251.268607-1-eperezma@redhat.com>
 <20221029042349-mutt-send-email-mst@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221029042349-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 29/10/22 10:24, Michael S. Tsirkin wrote:
> On Fri, Oct 28, 2022 at 06:02:47PM +0200, Eugenio Pérez wrote:
>> Some fixes that did not get in time for the last net pull request.
> 
> 
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> 
> Jason's tree since he has some bits this depends on.
FYI I made 2 comments/questions whether using the virtio LD/ST API
isn't more appropriate here.

