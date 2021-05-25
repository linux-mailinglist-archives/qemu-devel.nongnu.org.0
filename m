Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5ED38F91A
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 05:59:13 +0200 (CEST)
Received: from localhost ([::1]:41558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llODo-0001uu-GB
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 23:59:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llOCO-0008Oj-V7
 for qemu-devel@nongnu.org; Mon, 24 May 2021 23:57:45 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:34797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llOCN-0007KZ-Ka
 for qemu-devel@nongnu.org; Mon, 24 May 2021 23:57:44 -0400
Received: by mail-wr1-x436.google.com with SMTP id r12so30573675wrp.1
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 20:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DX0g5DzMg2LebyWGJI3aBdtXoMrZb/CVrlCVMLea+60=;
 b=t/KXSa0sR9DLDHH0En7nUiSpc0l/p5Slj77lPSZ+vh4eq/QlkUKH19uOUiy7Ic8g72
 SjXAGAqHzEoj4bS+dT/PB+/HjLyZ8ZLAeoXdK9zBvDhVnqcO8w7K8843vCwNGkpVXl5O
 74lfPm3WNVR0EIVY+9cdYb709Kep4KRb/P6TTohKpT0OCyMkMZmOzoqZydbduQG6VSKy
 97Hs6cE10cFJYtHTjFuwnkLN+A9pK3Nq6QGb2Cc98E7WgYbJZZQGhcimwdsIvRRsUx3Q
 Q1kypImAKu7XoaEDoNP0sR+NAppw1h8F63T13tP/bc1g75G+HN3TStRymczv3B/ip4k/
 6+SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DX0g5DzMg2LebyWGJI3aBdtXoMrZb/CVrlCVMLea+60=;
 b=mR3U0DdXNw1jEWTUjBshUdjq5M9fI4UAHOusvP0PQo/wc8tWlJ/rvO05T/zYMu7jcj
 gAvqJY29CP/+w4Dow5mgwZv6y4YJKbbitE4KfuALXi3fzFSAbpc++pmFav2xNmCu72rR
 FMCBKNf7pB9aT/uteD3dWniXM6S8nhyzGFslrnOXO695Bx2ISn3oqc7BDNdXgk5CE3XD
 gahSAK8s5yLriLMceC8KNY6dA7QcsjtfTroi9WIDI+36z0N07PsdKeRS+0frFUusVYUJ
 xg16x7j7Dq1tFKeRacc0GCCuJXW+u5d1TjDqze+pdd4l8Y5ZgXSDZtY1kjUT3SLvc4sr
 TJrg==
X-Gm-Message-State: AOAM5336aauIjXqu9Sa82IBagCjlKUIx6QDX/E142lN7xOoWtwlM8P/9
 fijJbMvCY/cKcBd127q9tlI=
X-Google-Smtp-Source: ABdhPJwXUjXr92Agcn5kGTTp22ipMTLrEs1yQ4OJHuoWDkAZ4hcXizUlKH4VsEsiQGgZz9vHae71YA==
X-Received: by 2002:a5d:4f03:: with SMTP id c3mr24611569wru.158.1621915062315; 
 Mon, 24 May 2021 20:57:42 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id b15sm13988266wru.64.2021.05.24.20.57.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 May 2021 20:57:41 -0700 (PDT)
Subject: Re: [PATCH v1 7/8] gdbstub: tidy away reverse debugging check into
 function
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210520174303.12310-1-alex.bennee@linaro.org>
 <20210520174303.12310-8-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <2d303743-f0c4-39ff-04c8-227cf0b67886@amsat.org>
Date: Tue, 25 May 2021 05:57:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210520174303.12310-8-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alex,

On 5/20/21 7:43 PM, Alex Bennée wrote:
> In theory we don't need an actual record/replay to enact reverse
> debugging on a purely deterministic system (i.e one with no external
> inputs running under icount). Tidy away the logic into a little
> function.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  gdbstub.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/gdbstub.c b/gdbstub.c
> index 84ce770a04..52bde5bdc9 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -465,6 +465,15 @@ int use_gdb_syscalls(void)
>      return gdb_syscall_mode == GDB_SYS_ENABLED;
>  }
>  
> +static bool stub_can_reverse(void)

Do you mind renaming it gdbstub_can_reverse()?

Otherwise:

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

