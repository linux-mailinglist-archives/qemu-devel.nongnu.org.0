Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A222393372
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 18:15:30 +0200 (CEST)
Received: from localhost ([::1]:55304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmIfR-0000Ec-MA
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 12:15:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lmIUc-00079E-Cy
 for qemu-devel@nongnu.org; Thu, 27 May 2021 12:04:18 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:53102)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lmIUZ-0000hs-PZ
 for qemu-devel@nongnu.org; Thu, 27 May 2021 12:04:18 -0400
Received: by mail-wm1-x32e.google.com with SMTP id z130so529469wmg.2
 for <qemu-devel@nongnu.org>; Thu, 27 May 2021 09:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=O706bkJNTAZiUMXjWmSSiQEGZr1A7qOAItehwm9OhR0=;
 b=JQ/yCfJtBt2KNSY8/5P5DQ3dBwCSR1YaKFPpoXmNoJEOBQbl/cJLZ60RowJWORiL63
 ZqHH85SmYkYVbGlEgL0MhZuN37FdbmeycCuHMUorYVeHEvCF6U/jpnMWI6zeJB1H9X6O
 t+17ll58wbTMEXvAxKaE5vIXJwXI7BC5igz1HfuRYcgbD22/m6WLUk4VL37syMtxzFO1
 SRQEgP3UUVygt1zq1vexvr892oXi+9igv9rXgnkFl0P9Tdrt2tKFGKCFR9oKKyiRA98h
 QHb6gYVjA+Zou8JYVTK6eaaX1dUwRYZdUHbM54rRb2x2p92aD1l76LGTXFrXitnZyh78
 zzqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=O706bkJNTAZiUMXjWmSSiQEGZr1A7qOAItehwm9OhR0=;
 b=jZOInMG1v8Bbj1vIShvPZexWsBSvGlTZCRYtKG5r8OFAFVAPmQ1nPyVi9Eys3sDgaK
 TF74eH0yuce8DhwyuM/OqmGaQuVs9shiqo1VaBNt8gfXH5tHK2gKHxpR3EkgNPUJjLZ4
 1FA7bu7HLIbN5AjNhE3dVvwh1USt3XhrYHxigooZ8+brP3/yeeeN7UtdT9fdWzR0Y/QC
 nMZ1xfxGHCvzDXUXmuRWhPGrwbPHUvNo6SlCqm3mB8zO5JNI3MV+97gi7KGbkArNbgDW
 ioYCuuxshGj8pUwICXiwYo6386EcfgjhOTyQd9W3htLJ/MwHRLplAIIJMYuvKQkcF29o
 WQqg==
X-Gm-Message-State: AOAM530XDkXAQKIklpM8Npmo3YC0jjKh5akOscU/eTcBfo9Q6GVekk1X
 sM/y8KE5u5kCJyBtHA97r9Y=
X-Google-Smtp-Source: ABdhPJzVPO6bSNZY4h7/RHrp/KnjoiktNgzLjiqxOHWfpJs+ma442ut/f/WJzxtwFdnSeIBVCkbyEA==
X-Received: by 2002:a05:600c:21c3:: with SMTP id
 x3mr4134164wmj.131.1622131454267; 
 Thu, 27 May 2021 09:04:14 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id b10sm3913887wrt.24.2021.05.27.09.04.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 May 2021 09:04:13 -0700 (PDT)
Subject: Re: [PATCH 0/9] gitlab-ci: Make mainstream CI green again
To: qemu-devel@nongnu.org
References: <20210525082556.4011380-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <25165a82-b2e5-c8dd-e5d1-d36e8fb06b57@amsat.org>
Date: Thu, 27 May 2021 18:04:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210525082556.4011380-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/25/21 10:25 AM, Philippe Mathieu-Daudé wrote:

>   gitlab-ci: Extract all default build/test jobs to buildtest.yml
>   gitlab-ci: Move current job set to qemu-project.yml
>   gitlab-ci: Document how forks can use different set of jobs
>   gitlab-ci: Extract cross-container jobs to container-cross.yml

>   gitlab-ci: Keep Avocado reports during 1 week
>   gitlab-ci: Run Avocado tests manually (except mainstream CI)

Thanks, addressed reviewers comments and applied this subset to
gitlab-ci-next.

