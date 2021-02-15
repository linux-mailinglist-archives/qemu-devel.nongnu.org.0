Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2934431BF68
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 17:34:44 +0100 (CET)
Received: from localhost ([::1]:42224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBgpf-0003w1-6w
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 11:34:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBgnd-0003Nk-2e
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 11:32:37 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:39823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBgnb-0001WR-E6
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 11:32:36 -0500
Received: by mail-pj1-x102d.google.com with SMTP id d2so4214422pjs.4
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 08:32:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=M/b5GLx/S8iZR/Jpq4jOvC3z/tnOvH7by+1LBJmiIoY=;
 b=uByfB6mQrQ9e9WpuKW4R3ZTtUA/tKooKUuLnpJ7CRhQsRjUJ48Mg3XJ0/rVbn4cwJF
 XmJlY3Eq63kBq4gtBv4s63BFL862MApm1J3QrHWstJ7n2Fjc+84PE802lxxMh9pdVs0R
 MZrMmzAWov78kNB2m8L3qCH/n8X42R/TZUzevSBHrmMBue17KIdWNEuxMGTPDx+aSOul
 Yar/z726kuFFwdo/ftjz7VQUoxq1h8OnZ+bOUQ5vxaMS1+Cqpp9PlFsRx3XUNthGyIJP
 VbRM8vbuzg43V/+h3oW7glmtvNPoMr8qAP6xYTb0DR7wzXCRc564P+/WRTmo+eto/aAK
 fBLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=M/b5GLx/S8iZR/Jpq4jOvC3z/tnOvH7by+1LBJmiIoY=;
 b=MHmvwjk5uRlzhey6lED6FmJf/DqoZDgbDpFpSuZeJ5GuvPsmg0jmdFbGttlyVVHaqM
 QN/VnhAXgdKXSQilM9do25thlmLtd/TadHNAFYy/1ZIuL3CQbzNri2l8ReQZZB+O2SfK
 BfUZoWGA1POpUCu6wJixuJcjSo0Ae3psoUoigJiCTDSs3v6bzEZsn5IzF2xeJ/rri8ls
 OuWCX1PlVIl/fLjJSFWP9joOXLNSKLcSP2oLFyxT3SPFR0dj0B8ZOZWg/roJ4EJdbhGn
 Wp9OISExeY3ooZUCr1Y2IZSTm+sA8uNmdJWPwrDFnCQFdkYqmxvPP6H5Bq8ae+5yNDIm
 llNA==
X-Gm-Message-State: AOAM533NCFppN2C0l61otyCrMIGgvf/Dxh2xtXCuzhQy73rJRL0D+Ywx
 vuyxAaUdGAZH0gOKodYY/rzfAw==
X-Google-Smtp-Source: ABdhPJw1klgC7AMJRH+UhbBAA21tSTFY6J2rMCQ8tCLk0qzDAUnI/pRoGl05uaJRmBGX4YtMtrpxkw==
X-Received: by 2002:a17:90a:404c:: with SMTP id
 k12mr16843743pjg.4.1613406753703; 
 Mon, 15 Feb 2021 08:32:33 -0800 (PST)
Received: from [192.168.1.11] (174-21-150-71.tukw.qwest.net. [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id
 b17sm18786741pfb.75.2021.02.15.08.32.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Feb 2021 08:32:33 -0800 (PST)
Subject: Re: [RFC PATCH 13/42] target/mips: Remove 'C790 Multimedia
 Instructions' dead code
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210214175912.732946-1-f4bug@amsat.org>
 <20210214175912.732946-14-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <921462c4-3d6d-62e6-f267-3567ea4c5846@linaro.org>
Date: Mon, 15 Feb 2021 08:32:31 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210214175912.732946-14-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Fredrik Noring <noring@nocrew.org>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/14/21 9:58 AM, Philippe Mathieu-Daudé wrote:
> We have almost 400 lines of code full of /* TODO */ comments
> which end calling gen_reserved_instruction().
> 
> As we are not going to implement them, and all the caller's
> switch() default cases already call gen_reserved_instruction(),
> we can remove this altogether.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/translate.c | 372 ----------------------------------------
>  1 file changed, 372 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

