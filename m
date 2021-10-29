Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38EF643F753
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 08:38:34 +0200 (CEST)
Received: from localhost ([::1]:33660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgLX7-0001uu-CQ
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 02:38:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgKjt-0003ze-2P
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 01:47:41 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:40589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgKjr-0002e9-2m
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 01:47:40 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 j128-20020a1c2386000000b003301a98dd62so3227784wmj.5
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 22:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=F3Vo0LdvqDxTsMsBOr5CAD77aoN35M2rBereIQrTQ3c=;
 b=qhUbKKYw5T2Nalq1vOJ8oMCzNkCRCPGqgDMiuqXf3pLAyX3Twzsz2rbXufFmvgLG98
 hNnJ2/CMCaRuHZAfvQkd6EDtRImmGqK0kuMzTwiZkVo2abKUBC9b7vkmjg7gemtUW0PW
 piup67qRJDkdkWFOm+gIB9LJsuKeOMVm0p3Dq+Xpl14VK8YpM/0jAyM/YRiVfkIBNi/1
 XNtUYvbbCq5Kh+0sto97avMb2Rgi/4UpkxbiVaMX91tOS+q2vs6am0PJbk+0HeE3518S
 SAKYW7JMODorwBTrh7IOKsvez7uRuwPW/Ejo4G42uf1ZJk2/4X/MJirS+W6SrXqjs1Ol
 /a8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=F3Vo0LdvqDxTsMsBOr5CAD77aoN35M2rBereIQrTQ3c=;
 b=6GJS2rfaj+hmVH5HlfvnFl6ez7GRWC2QQp1GxsDl+/bTCXyRlEggaIkT/7Wk/yqXU2
 73JOMkvyYC15KT7i+GRh8DN+w0py6z6gPT4GMb7tbfgqOt7dlxWn+avbFxoRGjeWMiDd
 ucwPiqM4LdjAzhfg5u1wpRLqL5WEmSmbKVhVLfhMyo3xUFUCffuQXx03Wkhh/fYkGQpn
 d697HGIKKmTZN/vf603p5WqjP+Fa2NITQa91NPzrLMBy2qXsHtDLiRuiR/AfN6tyo8XU
 KYpHrQq3YbAW92LfXXctYEj3kwq8GGgwONvZs+kPFG/VSbNZ5FvG/y4ssxw8VMhl5xQd
 jmBg==
X-Gm-Message-State: AOAM533z7ZachZa8lB61WUNild3WA3Hm1UazRzp2NoZ4BEH0KP5NL7jx
 StR1hLr0QJGwoswGWMlZLOM=
X-Google-Smtp-Source: ABdhPJzy+yejqb6t+zZ79KcawgLjnYKVA2gaTfrdQXXKQwUP/47fDt8c3kgtHqnZ359MS2QhriFTgg==
X-Received: by 2002:a7b:c38d:: with SMTP id s13mr211092wmj.12.1635486457846;
 Thu, 28 Oct 2021 22:47:37 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id e9sm4849766wrn.2.2021.10.28.22.47.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 22:47:37 -0700 (PDT)
Message-ID: <b7ecb713-3f87-1da8-22eb-69826df39907@amsat.org>
Date: Fri, 29 Oct 2021 07:47:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 20/23] hw/timer/sh_timer: Rename sh_timer_state to
 SHTimerState
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1635449225.git.balaton@eik.bme.hu>
 <647c291f53b4de0e79b979aaeee761ec4cf01a20.1635449225.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <647c291f53b4de0e79b979aaeee761ec4cf01a20.1635449225.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.847,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/28/21 21:27, BALATON Zoltan wrote:
> According to coding style types should be camel case, also remove
> unneded casts from void *.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
> The tmu123_state is left for now, that's the real exported object with
> SHTimerState being an internal object for a single timer. I'll come
> back to this when QOM-ifying so only handled SHTimerState in this patch.
> 
>  hw/timer/sh_timer.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

