Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35386628F58
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 02:34:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oujzV-0007Gx-EX; Mon, 14 Nov 2022 19:39:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oujzR-0007DF-0S
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 19:39:49 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oujzO-0003KB-Ii
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 19:39:48 -0500
Received: by mail-ej1-x632.google.com with SMTP id ft34so32339587ejc.12
 for <qemu-devel@nongnu.org>; Mon, 14 Nov 2022 16:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WtFd44TggTnLDDcV+m2S78vF3ey19an/KhkHkr1PW5w=;
 b=kobfs3T9ka33KGoqE8WFSW3r327SA8U88/DfwywxqHrNRSd6TCsalgLjq4l1yXcfua
 ufIwsXJMjc3pP3iKiMzu+w8aIlkkneMHIFpxAyT7+KbaR7+i42Wj/WF292lG0AotKlVp
 l+uAVOPKdwMCeDsIA2J76q0Ns7JOqC2A8cQmYWi3Gwq5w7VtkQEeM1qweFIrTNGgdOgq
 d6qB8HOjtNT4nBkhxGOi39HV63Higdy5G9ShXuJjhU0XLEmrqX+4gPeynM4q3kPIH1yt
 FvPiaJi7DvPW0CUyg8KCRdnoy7vg3EOFulrDKTPJPwHAwqsgfXnj1ke+/00Hu0wIeilW
 MwTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WtFd44TggTnLDDcV+m2S78vF3ey19an/KhkHkr1PW5w=;
 b=01tmMEewiT9yUarQNtKrNwf+dvUH46MqfEs/3Lkru/1V/UAqmt9WYHoL3fT9UcDIqM
 67bHyV+pjQunDpL01Q3B7D6JxrXGwmYLm9fr9CDBgPCeRyrM/V+qKiAkQg8oZgKYKt4v
 lYzsBzfuE9KvI09VtvsCtAUAxyyGE1lUgqr6oLf+rw4a36b0irZRyPDMrOu/LLR82XJ2
 KLeLtFRdhv7ykLL/9x4s3H7SCyLsQFPQSyrS2UiwjwBAwWmaYBKD4HfJLzF1QaeflXP2
 dzNNWo/A/gAUDD5sv6H1VOiu4STD8awf7YDF1j4TQxJPTL+wfkZQzs92s+WNQMxGV/wh
 rBeg==
X-Gm-Message-State: ANoB5pnB97ls73UjpJu4lQ/Mvdz0nKmDTH4CBPGKDA8EYDWRFpWb/Drd
 zKg8KufayOQhMN9xzH5Rj/fUwg==
X-Google-Smtp-Source: AA0mqf5AzsYi/sFQUbFwFbitilXeu583UR/I+1SmEfYx9sqFkMmOM1JoJQpU94gUVU0scSB7T/03RA==
X-Received: by 2002:a17:906:e204:b0:780:93d2:8510 with SMTP id
 gf4-20020a170906e20400b0078093d28510mr11814411ejb.457.1668472783804; 
 Mon, 14 Nov 2022 16:39:43 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 n15-20020a17090695cf00b0078c213ad441sm4761815ejy.101.2022.11.14.16.39.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Nov 2022 16:39:43 -0800 (PST)
Message-ID: <24823397-e799-cd80-5e57-18eebefa64dc@linaro.org>
Date: Tue, 15 Nov 2022 01:39:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: aarch64 GitLab CI runner down
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@gmail.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
Cc: qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi
 <stefanha@redhat.com>, Richard Henderson <richard.henderson@linaro.org>
References: <CAJSP0QXFBKY1_aXSs9=0=FN0M5GhgqFyM_Wxq9028znz=-MvyQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAJSP0QXFBKY1_aXSs9=0=FN0M5GhgqFyM_Wxq9028znz=-MvyQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x632.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Stefan,

On 14/11/22 22:56, Stefan Hajnoczi wrote:
> Hi Alex and Richard,
> The aarch64 GitLab CI runner is down again. Are you able to restart it?

Alex wrote to your RH account :/ This is a scheduled shutdown.
Equinix is relocating the hardware and this runner will be down
for (at least) 4 days.

> Any idea why it disconnects sometimes?

Sometimes? Odd. Can we check on the GitLab concentrator logs when
the runner is unreachable?

Regards,

Phil.

