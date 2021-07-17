Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4558D3CC275
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 12:17:22 +0200 (CEST)
Received: from localhost ([::1]:50124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4hNp-00055x-9L
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 06:17:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m4hHV-0000ID-0z
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 06:10:49 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:36588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m4hHS-0007rL-TJ
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 06:10:48 -0400
Received: by mail-wr1-x434.google.com with SMTP id v5so15011416wrt.3
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 03:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6yOwF13YVLimhQ3tJeTwQpKCIA7tgyYpg7aNRwF9oWI=;
 b=nsRYS8ghPip8RJOD31MR9oKUrx9uWeZF4AJK/dSJEP1gfC2Fzq0Z+Mfx1FNv+MZ1k/
 pmrel+7S2V+EOesAF06yMTlUwXkbnc0kFHf3uWdRpa4MFr+T3JXD62YNSiG5xCjObLJ9
 bUDvwr21A6B1UJma4eXhcucTfvSQN+A5QQiF3ObGHRFpBGaltUkDjAuUypqwF0Qgkiix
 kuzSEP3A3vkAb3NmU7O6Sw9N6EN8zH+T1bZ/rSjTFVBoStkYUeoRUyPZzUDqOcVYX3Iu
 NrAYyAO0BIaF2Qxls3E0Cakk7GF3/8Fbf/Z/1WBDvREWbnGvJkGlZ+ciTpOvfj1NpbPe
 rUwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6yOwF13YVLimhQ3tJeTwQpKCIA7tgyYpg7aNRwF9oWI=;
 b=gHLt6WbZuVVuDK33OZpXE/mFwQteNpJbuE+wC2VXET9MGD4wbEuOXdaVPpGbtBP1CF
 reSNCJ8SqGpy3Sy3OuB0b2yXfoOR+lPw8HimG8hXBO9WkBdEPxi3nx70V1RdkqgiVJRM
 O4YiRJOigQzejabNsLcxtua3x+Ck1C9njH1Ksp1etURpukPkEi1LvgXPahKOR7B4YGLO
 s+q2DnwanSPzVNZrc0e8ayS5MftdyhjwM33rIHpScjoCAka0uYSIrdO7pQc+RUPZFVYS
 xaweQEfXN18blry7qeBxMG93g+r8GvTSC+D3xHsKnYHARxAuE8qjE0nQuazuxQpLMeP8
 I+Eg==
X-Gm-Message-State: AOAM530dvv8paBFHutfUdBafiemmgYCHR0uecOGRffOC/EAz86ouV6Pc
 400ByKih72acIY7P2670Cd4=
X-Google-Smtp-Source: ABdhPJzk8ijWgruTQrmLluCs/qROOsycmNTh2oWy7PKHe3Hmdcjs2TuDnpvOXdBy0L/scj/7FEpCOQ==
X-Received: by 2002:adf:e749:: with SMTP id c9mr18223798wrn.407.1626516645663; 
 Sat, 17 Jul 2021 03:10:45 -0700 (PDT)
Received: from [192.168.1.31] (abordeaux-654-1-74-136.w109-214.abo.wanadoo.fr.
 [109.214.221.136])
 by smtp.gmail.com with ESMTPSA id 129sm10794582wmz.26.2021.07.17.03.10.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Jul 2021 03:10:45 -0700 (PDT)
Subject: Re: [PATCH v2 08/11] accel/tcg: Remove ATOMIC_MMU_DECLS
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210717014121.1784956-1-richard.henderson@linaro.org>
 <20210717014121.1784956-9-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <4c4ad34a-0652-8e68-bbbf-e3868db0782b@amsat.org>
Date: Sat, 17 Jul 2021 12:10:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210717014121.1784956-9-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, crobinso@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/17/21 3:41 AM, Richard Henderson wrote:
> All definitions are now empty.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/atomic_template.h | 12 ------------
>  accel/tcg/cputlb.c          |  1 -
>  accel/tcg/user-exec.c       |  1 -
>  3 files changed, 14 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

