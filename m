Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC96510DCD
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 03:17:17 +0200 (CEST)
Received: from localhost ([::1]:36736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njWIu-0004V5-Vt
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 21:17:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njWHi-000380-KA
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 21:16:02 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:43656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njWHh-0002zl-2i
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 21:16:02 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 j8-20020a17090a060800b001cd4fb60dccso496121pjj.2
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 18:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=7e4l6anWQ+Poo4iPSm+5D+OdQDo9TKyp0X2MioW2y0w=;
 b=vipABmaaYHu5hLMDusaZluHvqV/Zy0oEe+R09cCcvK9YlAhbiwlLIxLKxydkZptVo3
 jSysrQyVEbOVYeP+Du7Z+9HTA5EphdPjbFYDCpc+pd2zBijifqsOqFcJ/jAcSxq/Nqut
 9lrHGpGyOB/pYgu9xKTF8wzEc0nOwyULklkZ+OCHqaN1Cg5J8oM1K0oxvubDX66yGYo7
 nLgk/eq8yxYVGl1vWIOQFAbiJGI787W1Zxia+hWWmDYw6FEe2UfSqrKY70/8Q6VbjCbU
 2NwpNOR6x/FjPMsrlEkgPewovxs0eEL5bceVeoMW4oPg/5/4KbvImCyuqKW9y6LNPYCZ
 PKlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7e4l6anWQ+Poo4iPSm+5D+OdQDo9TKyp0X2MioW2y0w=;
 b=WouaOrlBhWpUo5Z6yNOKGq2e46aqhF5I0OfYqAfWKsFISkcnEiFo32vwi/R7FUe4Ur
 ewiildvUCElgLaZPRX5nx5/ROrXxl9V22C8aRrkPytYJBKuD/iWn7x/v6/DuGuFfqhDw
 rgtiWzJtEIwUhP4/GMdAWQipW+eoskaSys5G7MliA9DGgOCyp0kJtj1CHueOrOCf1N3m
 kYEK6C+SKFn+SoVTxNHq/juOiT1CxXeacnBR8NTSOd2uI44oS0U2Kt7Pc/g6qqa0RCR7
 t/XjyNKBCx9TBTeVMdVyvLSVhlDJPBnKUW5YyMy4pl1fMh/M9GtG0fRIjr5sJPhJpWkx
 eBTw==
X-Gm-Message-State: AOAM5318pxMHSzYyKznbvlTfrHveHUJ0uOy/P9OTgLJ7gPvGiZzeAMNd
 Wb9S2NM0VXX8p7e1x0LkhICknrSnlM9+cw==
X-Google-Smtp-Source: ABdhPJzN1fEFSyJ95bRwHDRPDNmUFbdEl1mtUWMEqCjjWTem3NdspXCp0RcLKzTeh9MXxKeX2PvdvA==
X-Received: by 2002:a17:902:b703:b0:158:2667:7447 with SMTP id
 d3-20020a170902b70300b0015826677447mr25817228pls.92.1651022159568; 
 Tue, 26 Apr 2022 18:15:59 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 y4-20020a056a00190400b004fac0896e35sm16903864pfi.42.2022.04.26.18.15.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 18:15:59 -0700 (PDT)
Message-ID: <a75a3e25-5c11-1740-e42f-4c4b8bded189@linaro.org>
Date: Tue, 26 Apr 2022 18:15:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 18/26] io: make qio_channel_command_new_pid() static
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220426092715.3931705-1-marcandre.lureau@redhat.com>
 <20220426092715.3931705-19-marcandre.lureau@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220426092715.3931705-19-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/26/22 02:27, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau<marcandre.lureau@redhat.com>
> 
> The function isn't used outside of qio_channel_command_new_spawn(),
> which is !win32-specific.
> 
> Signed-off-by: Marc-André Lureau<marcandre.lureau@redhat.com>
> ---
>   include/io/channel-command.h | 25 -------------------------
>   io/channel-command.c         | 26 ++++++++++++++++++++++----
>   2 files changed, 22 insertions(+), 29 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

