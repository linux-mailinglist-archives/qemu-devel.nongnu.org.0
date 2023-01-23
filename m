Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E0B6775C5
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 08:45:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJrVc-0002LS-DF; Mon, 23 Jan 2023 02:44:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pJrVZ-0002Ku-SG
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 02:44:49 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pJrVY-0001OD-2r
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 02:44:49 -0500
Received: by mail-wr1-x432.google.com with SMTP id z5so9900716wrt.6
 for <qemu-devel@nongnu.org>; Sun, 22 Jan 2023 23:44:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HkGSvtDue5tb5qH1aE/RmIXpjs8bnJY2nZhWy/e8iSI=;
 b=yabRoidcu51jUOVEPXX9Jq82/37o/u/Z/HcrLQLTCAoJjhrFd26zYLeffSeT8h0caB
 cUNRX03v2xu6l6zxHvVfSFIHctWMbrn0QWQFece2GuyxbAAnJ9l826iM84Z+rh186/UX
 w2Rrvw9y0ZhHKaPSzrkMXZASWa+4HAsdQp2maFliaY32Cr0QKYgufs5wUOA6703uF+/Y
 PW2raRoZCdAFs0L14x/3aCN8/wlI7V0I6rdGxATgfrgQxzwmDFqi1nTKXUb+KtGEn2me
 ah0apEiqFptvQ0J/rIRsoedPU9RjQ3FAilNEup1qzwS2MJEHo6PwD3Oy0FBV1qsUgziJ
 LeeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HkGSvtDue5tb5qH1aE/RmIXpjs8bnJY2nZhWy/e8iSI=;
 b=tLL2DL1mhTUouPlSdzHKGjqTSrY2GTwhy4WWueBxSQzd5tKFTgZ5DGELNkkDqcQS6f
 1xPryooJutb8nXDUBTOxszY6gH76nMUAFmbds6zvEbN/cz/yAgDO2aGkGL7eQAizCn98
 U8wfK4g2Y8aBfhhohMl0Hobg3dY/BLDPk4JFQfrxI/RQGttYaxRdt61ry1KwPLt2VcPl
 cglq5DpRBFw77TSQtvS3RJC9WEt7WzbN3cg4WawsZPMmcd8gcMwBb4m0DJzEOpHOMhr7
 S78GU+hwyk8iHIbndK+yq5zHxR2cAkGRYtXv4ns0xvCFwt7jx+j9tiiOlpX6rac2I/6L
 NCNw==
X-Gm-Message-State: AFqh2kqpiLKxfXPjvM1ArHl+AXs6inTwj1SJJEvuna5XuJQARuNr2KGS
 K8ESeP4u5/19Bj/Z0d8BVceZng==
X-Google-Smtp-Source: AMrXdXtyy1vOcTvYP0zBWby3XYAeEHtjD1mOMMZ6I+S4VYJMvVXNoOPO3lWmCekHq2JHbJu5I3CSUA==
X-Received: by 2002:adf:f5c8:0:b0:2bc:83ee:e319 with SMTP id
 k8-20020adff5c8000000b002bc83eee319mr21452387wrp.34.1674459885946; 
 Sun, 22 Jan 2023 23:44:45 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 u24-20020adfa198000000b002bc84c55758sm41080424wru.63.2023.01.22.23.44.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 Jan 2023 23:44:45 -0800 (PST)
Message-ID: <ea8f9ee3-f30b-9327-de84-e1dcc5628471@linaro.org>
Date: Mon, 23 Jan 2023 08:44:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 11/11] alsaaudio: reintroduce default recording settings
Content-Language: en-US
To: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>,
 Gerd Hoffmann <kraxel@redhat.com>
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <0a4007dc-e11c-f16e-0e21-dbc4e60caa59@t-online.de>
 <20230121094735.11644-11-vr_qemu@t-online.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230121094735.11644-11-vr_qemu@t-online.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
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

On 21/1/23 10:47, Volker Rümelin wrote:
> Audio recording with ALSA default settings currently doesn't
> work. The debug log shows updates every 0.75s and 1.5s.
> 
> audio: Elapsed since last alsa run (running): 0.743030
> audio: Elapsed since last alsa run (running): 1.486048
> audio: Elapsed since last alsa run (running): 0.743008
> audio: Elapsed since last alsa run (running): 1.485878
> audio: Elapsed since last alsa run (running): 1.486040
> audio: Elapsed since last alsa run (running): 1.485886
> 
> The time between updates should be in the 10ms range. Audio
> recording with ALSA has the same timing contraints as playback.
> Reintroduce the default recording settings and use the same
> default settings for recording as for playback.
> 
> The term "reintroduce" is correct because commit a93f328177
> ("alsaaudio: port to -audiodev config") removed the default
> settings for recording.
> 
> Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
> ---
>   audio/alsaaudio.c | 10 ++++------
>   1 file changed, 4 insertions(+), 6 deletions(-)

> -    /*
> -     * OptsVisitor sets unspecified optional fields to zero, but do not depend
> -     * on it...
> -     */
>       if (!dev->u.alsa.in->has_period_length) {
> -        dev->u.alsa.in->period_length = 0;
> +        /* 256 frames assuming 44100Hz */
> +        dev->u.alsa.in->period_length = 5805;
>       }
>       if (!dev->u.alsa.in->has_buffer_length) {
> -        dev->u.alsa.in->buffer_length = 0;
> +        /* 4096 frames assuming 44100Hz */
> +        dev->u.alsa.in->buffer_length = 92880;
>       }

Please use DIV_ROUND_UP(). Maybe worth adding definitions?


