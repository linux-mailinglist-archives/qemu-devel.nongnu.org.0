Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 580DF581594
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 16:42:33 +0200 (CEST)
Received: from localhost ([::1]:45274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGLlY-0007nV-Dq
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 10:42:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oGLas-000787-FL
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 10:31:30 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:44634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oGLaq-0005MK-GZ
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 10:31:29 -0400
Received: by mail-pl1-x62f.google.com with SMTP id p1so4985445plr.11
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 07:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=T9hlhpmBl60RmvUYOs5WhjDJFPpkXvox3fdnmOLcq2k=;
 b=b9v5x3+ggn6M8fBvBVwd3OP2Mx3hejobFRf2vWwfKI/wcAZ0OruSnP6R500GqasY2b
 /IeP2tX8JePMYXXIT2wvsdJXf6jus3hMZWWwE+m3jPG8UFTOlb9/OD16Psi7JjTzFr1x
 fGdtIfxlsI8QA+w6RjPelZ7lk1v1FDGjD4ukWLpK1BPODbIUTRXHZm0h40bJEqFKu0y+
 UZvgKKQ/4yXh7BvVbC6EbhgAfdw4oVHJhjEr90ifaRXCeZluNN4XEscxQOfSJSsGDMAr
 7oKhpGbJUyDylmgqKcaaZKo+PopqPr437wc4MR4l0xK4pH0+WcMJSi0ol/2gE1+LHbEy
 yGQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=T9hlhpmBl60RmvUYOs5WhjDJFPpkXvox3fdnmOLcq2k=;
 b=bNK8AHnEJ05G/tnXIa4TuWMcvUUACIuQhGwslyKl9rwv5U9v90WRBVWjMkketMNqa2
 nmwj2Jh3COD1rkO2NxmmLvHgM6bpchiW9DM1TwMFTsKwQ3e2W9JZrU2ivJ3LPxyt29t7
 Gbg2IcMjc27GNB4r1vTcFz/Z9AxqyqmchnYvhys+qUjwDmWtZJXc5VLg4kLi+jmbi1DZ
 cm6IvcTBzguudrLrKtWsOhbybKpwU7ZEn/HGThTtsmGYSfW5FJT4fAz0kjcPCjozoSxy
 dlXAfcwV4SwNYGcLsapD8CJUvJAgmEa/yIGvFo4/SAUuAuPQ9lU29lYH4L/Lk5Fw4jfB
 qTLQ==
X-Gm-Message-State: AJIora9pGFKhOrOmcIie+H1xIeJzTM30dPNtURkuwl1YThK3s2yOHuRX
 KGP5UpueVRmzbtZ00cjN7P0=
X-Google-Smtp-Source: AGRyM1tBI4yznPc7/SGAv7b2Lu470fl94okkFr8vVac5oAkgcaVqwkwuYHxncUMz26Y2XhfSxZ8ZbQ==
X-Received: by 2002:a17:902:d58c:b0:16c:7fef:af9f with SMTP id
 k12-20020a170902d58c00b0016c7fefaf9fmr17226724plh.81.1658845886767; 
 Tue, 26 Jul 2022 07:31:26 -0700 (PDT)
Received: from [192.168.205.175] (113.red-88-29-182.dynamicip.rima-tde.net.
 [88.29.182.113]) by smtp.gmail.com with ESMTPSA id
 k13-20020a170902c40d00b0016d21697ed9sm5060329plk.48.2022.07.26.07.31.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Jul 2022 07:31:26 -0700 (PDT)
Message-ID: <c9cdf388-3f9e-6527-3666-79a146fb3f22@amsat.org>
Date: Tue, 26 Jul 2022 16:31:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH v1 06/13] semihosting: Don't return negative values on
 qemu_semihosting_console_write() failure
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 peter.maydell@linaro.org, Richard Henderson <richard.henderson@linaro.org>
References: <20220725140520.515340-1-alex.bennee@linaro.org>
 <20220725140520.515340-7-alex.bennee@linaro.org>
In-Reply-To: <20220725140520.515340-7-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 25/7/22 16:05, Alex Bennée wrote:
> From: Peter Maydell <peter.maydell@linaro.org>
> 
> The documentation comment for qemu_semihosting_console_write() says
>   * Returns: number of bytes written -- this should only ever be short
>   * on some sort of i/o error.
> 
> and the callsites rely on this.  However, the implementation code
> path which sends console output to a chardev doesn't honour this,
> and will return negative values on error.  Bring it into line with
> the other implementation codepaths and the documentation, so that
> it returns 0 on error.
> 
> Spotted by Coverity, because console_write() passes the return value
> to unlock_user(), which doesn't accept a negative length.
> 
> Resolves: Coverity CID 1490288
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Message-Id: <20220719121110.225657-2-peter.maydell@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   semihosting/console.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

