Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D32B390103
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 14:29:49 +0200 (CEST)
Received: from localhost ([::1]:55584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llWBv-00004s-LF
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 08:29:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llWAn-0007nC-8J
 for qemu-devel@nongnu.org; Tue, 25 May 2021 08:28:37 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:33506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llWAl-0008Ht-Cv
 for qemu-devel@nongnu.org; Tue, 25 May 2021 08:28:37 -0400
Received: by mail-wr1-x42e.google.com with SMTP id n2so32135874wrm.0
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 05:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qmlQzc9ScoHU7+Y2ZpTb+ACvGZ2PEYawK4xAMVOF5zQ=;
 b=sQGPv545vQV34Jt3aHH4iLT2E71qYqco/stLEZf/chOpx1cC94dxcZcTgN44Ytc4BI
 WqiY6UMr6HGL6ciYQCe4nQq8uYUJlm50wkaAGqt/+QjSBipx+7kxdy+u3uZtKccuP3k0
 Tus/PBmB/9vKHmsDCmnFnYbpCUYXszX9uO+X88AhREBYpkyC1kT9yId32guhVDA4inRB
 b2btB5colGWF7d3JdEvZHZpPKSlN7QC+7GeYi1P60VZaeKNvPIFiME7yVX0OSI1N5PAL
 xLfRvTO112oJZEsoWFXbuqnZoR5sgLZxyLkfcG9lpvyG6FmSem9INzCbgf13LbjGCk1P
 +0wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qmlQzc9ScoHU7+Y2ZpTb+ACvGZ2PEYawK4xAMVOF5zQ=;
 b=t43oYBOKQAGDzgcKRfPywz4a3OSUdK5wVWhZ+3tohPRY60mM6ecck+gRUTnd2W+Xi2
 7GMyAJnq9dQbx7Hml06OAt7bDyhyfGQlmXvNZkQ5AwtlwFoaHV1KOzbrH60PrHbp11BH
 LwgiFiBUR5bvScwXieSMI+m1lfUEFh87gf1KzVlM3vKRu4v/mzgVKwPEKC2s2EiSz06d
 EKwsA1u36gTVzbbyJLOvYHvR0f2bvGK/mVyU2KZFF1X9wjXH0UGvOWRxBdP3vhZtL5yk
 7LHKdMQ2TXprTPWlpHluiW+TfGDHqnaVRH0rEQ0nSGqTQHckmnvE9UxMDcbJl26BwYpX
 Vbyw==
X-Gm-Message-State: AOAM53395dnsk4XuFe8LVvv3ey7meYUqBU7xZFIsD1PZS45R/JPvd6PC
 ic0959zf/vlcBq9V55s8R8kiB3TfNkP5cg==
X-Google-Smtp-Source: ABdhPJxHrfLHknE1X0mhX1m2CiSSilQrrftsFsUhBxusXC1bbuByY+tUiocOE+ImkQe7WAPVO8a4bw==
X-Received: by 2002:adf:ebc4:: with SMTP id v4mr26628727wrn.217.1621945713313; 
 Tue, 25 May 2021 05:28:33 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id b7sm15521679wri.83.2021.05.25.05.28.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 May 2021 05:28:32 -0700 (PDT)
Subject: Re: [PULL 0/7] testing, gdbstub and plugin updates
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org
References: <20210525112431.22005-1-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <7ef6ac9e-27a6-451c-a511-38cd67a2bcd0@amsat.org>
Date: Tue, 25 May 2021 14:28:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210525112431.22005-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/25/21 1:24 PM, Alex Bennée wrote:
> The gprof/gcov passed on retry. I'll continue to look at it but didn't want
> to hold up the PR because of it. - Alex
> 
> The following changes since commit 0dab1d36f55c3ed649bb8e4c74b9269ef3a63049:
> 
>   Merge remote-tracking branch 'remotes/stefanha-gitlab/tags/block-pull-request' into staging (2021-05-24 15:48:08 +0100)
> 
> are available in the Git repository at:
> 
>   https://github.com/stsquad/qemu.git tags/pull-testing-and-misc-updates-250521-1
> 
> for you to fetch changes up to bb84bcf61495e9c2907b0659a60beacd2e92e34e:
> 
>   plugins/syscall: Added a table-like summary output (2021-05-25 09:24:21 +0100)
> 
> ----------------------------------------------------------------
> Testing, gdbstub and plugin updates
> 
>   - ensure gitlab references master registry
>   - add special rule for hexagon image
>   - clean-up gdbstub's argument handling
>   - fix replay HMP commands to accept long icount
>   - minor re-factor of gdbstub replay handling
>   - update syscall plugin to be more useful
> 
> ----------------------------------------------------------------
> Alex Bennée (5):
>       gitlab: explicitly reference the upstream registry
>       gitlab: add special rule for the hexagon container

FYI there is still an issue with this patch:

  'build-user-hexagon' job needs 'hexagon-cross-container' job,
  but it was not added to the pipeline

