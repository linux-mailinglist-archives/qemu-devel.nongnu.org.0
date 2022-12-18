Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A97A650433
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Dec 2022 18:32:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6xW7-0003E0-KF; Sun, 18 Dec 2022 12:32:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6xW6-0003Dk-2j
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 12:32:02 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6xW4-0005cG-LA
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 12:32:01 -0500
Received: by mail-ed1-x52f.google.com with SMTP id c66so10068819edf.5
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 09:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yGA6h0qOMZM1BMijVL+UKbzIUdNaA6H5pm2ZOLDJ3o8=;
 b=QguBP4/X3d3bxMQQuq35RYY11oKpOD90bTGN/pHNaiDToaXuYCu//9ltzL4X0olRSv
 CXDptxOq62W4YFpofcCSdtA1Dv3o+Tyo4wgdLwpAYKh91EEjkFmk4X26YEx2XiyHu3AN
 hXbxDO7Ml9oF9M4kJWfio4Bwmoc/M+TOMmwKksNZQMLTefnhiCo/O52cSLY0oYXksuki
 UxiBHABUCIcTuVRrO+jgdfazgN5N7RkojsngwWbf+IaoRxWyfdifs9HDHc1lSQwZZQ/k
 0ac8IcknyDMl2kb2Fq+xh8u/Ntc0owHdEdGfz1CiGWxICLZ3+q9xsN53fz/XrDr2GiK6
 4dvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yGA6h0qOMZM1BMijVL+UKbzIUdNaA6H5pm2ZOLDJ3o8=;
 b=0S2zwXNBSoKj19bxYvwGoHkVjU3aQv/jTWcCOXdmy7OXJShQoiWG5l502C1RU+3VNb
 4iMIjPFYXMJh35MskAjo+EfmfK0e0IKQT2a+tHm3hvjKKOnqlSX6P/Z/fhxo3poPYXSO
 UiFWyFaH5E/IxLMCB/XCwvpRawu+TlImJ4ZUL8F0j4YNWYeuABplIlOn/X21Cl+RpceB
 HxoCmb2HrOLQPnRgB5dfUxI7Vz2IDEE5LzhB7GXn6UN00tP2ccvNk8WSPWS6cClIBgZK
 KEYtAoyx9g6pXyPwgeErfPbRQiAmzEPr2cBPN9/NtIjFZlyF7UbaK3RENZBM44PNt1WR
 lbVw==
X-Gm-Message-State: ANoB5pkMo2yp7Lx1jUEpdWpF9MadasUgm+wwLFstOmGvNiWmuQJrXy31
 gBMs9iC5PitDUFTswvGmzKUO/A==
X-Google-Smtp-Source: AA0mqf7BEQwDMz0V8gyg3306aspDkq0sQmvzTFwWfBb6iJdEKXi0BH1UIuaj/s7sZxmJEYzJ5SWgcQ==
X-Received: by 2002:a50:8d1c:0:b0:46c:97c2:8d75 with SMTP id
 s28-20020a508d1c000000b0046c97c28d75mr35612599eds.21.1671384718780; 
 Sun, 18 Dec 2022 09:31:58 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 cy9-20020a0564021c8900b0046776f98d0csm3370710edb.79.2022.12.18.09.31.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Dec 2022 09:31:58 -0800 (PST)
Message-ID: <e3799b21-726f-2530-77e2-81b590288a03@linaro.org>
Date: Sun, 18 Dec 2022 18:31:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 04/11] audio: remove unused #define AUDIO_STRINGIFY
Content-Language: en-US
To: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>,
 Gerd Hoffmann <kraxel@redhat.com>
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 qemu-devel@nongnu.org
References: <3b1404eb-a7c5-f64c-3e47-1397c54c45bb@t-online.de>
 <20221218171539.11193-4-vr_qemu@t-online.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221218171539.11193-4-vr_qemu@t-online.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 18/12/22 18:15, Volker Rümelin wrote:
> Remove the unused #define AUDIO_STRINGIFY. It was last used before
> commit 470bcabd8f ("audio: Replace AUDIO_FUNC with __func__").
> 
> Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
> ---
>   audio/audio_int.h | 3 ---
>   1 file changed, 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



