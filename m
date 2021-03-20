Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8A5342E21
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Mar 2021 17:04:12 +0100 (CET)
Received: from localhost ([::1]:42820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNe53-0003RQ-1m
	for lists+qemu-devel@lfdr.de; Sat, 20 Mar 2021 12:04:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lNe1O-0001Fl-DZ
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 12:00:14 -0400
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b]:42763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lNe1L-0003zl-OP
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 12:00:13 -0400
Received: by mail-oo1-xc2b.google.com with SMTP id
 h3-20020a4ae8c30000b02901b68b39e2d3so3069067ooe.9
 for <qemu-devel@nongnu.org>; Sat, 20 Mar 2021 09:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=7aDOM7H28yVXC9CDp2XAWBfvH8jKFVG0/3+xQVMmra4=;
 b=AO94rG2Qc8p+WIZNzW8RuNq9WY2YYJG+9DUCMjMq5YV5WY4buaAxSHa8o+AvFzDINE
 a4g2N4bcIHvPDXP2NP2NC/yZ+jwzyzUOeyqTs/vDpt8nkdljBVLg8N1KorB10cycVJ+X
 ms3bN4BEe0GLLq3P5smi+siJxQL5ek1VoxjU/MH/bELxuF97MUMHRjlFvzKh50jU3WVJ
 S3B0gn5pspYY1Xd/1MyVXdVSs1uPUPYAJ1BHyr4iFJSb15AQSmJ5HJnjjwproSWm5r+5
 N2MkUyWfXeNe3smhYLYiz8XK7R8XeKsN8dlYoey6qGqvboIoVVaGmOvSMvZ67pc7O6wn
 TEAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7aDOM7H28yVXC9CDp2XAWBfvH8jKFVG0/3+xQVMmra4=;
 b=gglHaOe9jOvdLrA3TJ1LV8+AzzmTmcWfDFmYvpViA7iGY7cfq6bKlxGe0pqr9H8UbV
 8YrS7bFyON2UGSfsgZbZbbF9syauwGabJw+iCB9hQTRv5e1pyDy6ugvQU0GOVu6UZzXZ
 u1zJ3X2IVNhXPR7wkaNf2tGt+ARWX8YelRK5yfPvve7MSB8MNHMSddgRtyrvkfMSWseF
 GIevAoGkvssOun5ksnqz+Am8PAaDbt8xktcqGC9v5TBTihofX0VAxAap/FqofopILgUx
 555YGwwJHRz18yh8rz4H8vankd6CHyvLQfNaRmTR0/oMQi88bvvlSPAA3DP249CfZ/ir
 j3YA==
X-Gm-Message-State: AOAM530XxwXtL0mGppysMC3SvX+Dj+lne3+RSnec8oLseORjC+npJtfg
 25L6HShc0dWfTvbiLo3ONCvk66/XkSeaP7JZ
X-Google-Smtp-Source: ABdhPJx61NGtkmT7rgioI7VAJONlx+Akl4OzCX/KBZcX7qPJq+pwIvDvtpqCxls9xW327W7D16lVAw==
X-Received: by 2002:a4a:d296:: with SMTP id h22mr5543339oos.23.1616256009901; 
 Sat, 20 Mar 2021 09:00:09 -0700 (PDT)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id a73sm1992900oii.26.2021.03.20.09.00.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Mar 2021 09:00:09 -0700 (PDT)
Subject: Re: [PATCH v1 03/14] docs/devel: expand style section of memory
 management
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210320133706.21475-1-alex.bennee@linaro.org>
 <20210320133706.21475-4-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1247d86e-6265-3f72-13ac-94952ec6b4e1@linaro.org>
Date: Sat, 20 Mar 2021 10:00:06 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210320133706.21475-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc2b.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/20/21 7:36 AM, Alex Bennée wrote:
> This aims to provide a bit more guidance for those who take on one of
> our "clean up memory allocation" bite-sized tasks.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   docs/devel/style.rst | 46 ++++++++++++++++++++++++++++++++------------
>   1 file changed, 34 insertions(+), 12 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

