Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CFA54A3846
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Jan 2022 19:51:45 +0100 (CET)
Received: from localhost ([::1]:50104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEFId-0006C8-98
	for lists+qemu-devel@lfdr.de; Sun, 30 Jan 2022 13:51:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nEF67-0003Qs-UE
 for qemu-devel@nongnu.org; Sun, 30 Jan 2022 13:38:48 -0500
Received: from [2a00:1450:4864:20::32d] (port=44975
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nEF65-0003J5-2U
 for qemu-devel@nongnu.org; Sun, 30 Jan 2022 13:38:46 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 l35-20020a05600c1d2300b0034d477271c1so7877471wms.3
 for <qemu-devel@nongnu.org>; Sun, 30 Jan 2022 10:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XpfziHN585dmFVQRjx75tVu0/Vz0XDEqr3+wnPjviG0=;
 b=iSvSIcvixQcDdXtKhhLV1P1h2MgX8IUmotHNxU6rPdReZUWLXGGLJ/Er6ePEm1T+a3
 Fieqwrvt4BwNFMvuv62LBkcbTjX7VX/Khht6xUVaSB6jjXO1yiL6LmLFZRtvdUjCdzne
 c6xjarZR8sfcDD4ULvlazL4IG8D5/MeINFHVLi/7Vb8GOHLyFS680fIpPiiMBqKUqfJ+
 Lpr/wNBpQwIsWzLTwEeWfiLV+XlriCHcEH9/IZcKpowPdDxDfgu6moQqTv0Lf1w856/F
 8j4HKKwckx+LT09ptV3fn6J01lsskIoZWoVgv6F5gMgfknw4azwUU1cvmo28/vOhU6GS
 jRsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XpfziHN585dmFVQRjx75tVu0/Vz0XDEqr3+wnPjviG0=;
 b=xESwwRfrzxhSKStEcocCoy+HjrM3udcr44GEuBdYwZvUz7Kuz0/nuxFpf0OKgw9FQ8
 8RnMrLqxE6XRnlKPQUxCNMO5c1SOh6W8PqutqAr76YXfTn4/wVzKYgezNye5Wn24Lktb
 8vdtsl0+SaUk2iQdGcNEFi5Ob6DniwfWDRu7ae10wrrbwTJiPMwzixpRErvpCXdmdOpz
 cZGIr+bz0MwgStMemaKEu26gNE+dB3FCoDd1/uFYRM7qF7iUqL6q2F1lIYI6EOGLRZxC
 eq0sCCwlKVbpxOmapUiQJfBvNb0EKnw8C1ZuduHB60xiyGj4l2x6O2Zw7tTxiOKBNXie
 f80A==
X-Gm-Message-State: AOAM530GfSOMd6rO6JTizg3AAs+q0q1ftXDYBu0L4fGxahz13cD8tKie
 Oscu2sOuxsf0oT4mG2zdJFk=
X-Google-Smtp-Source: ABdhPJzDHUP9WCD0B7zXkukWdgzPjR2EvXVcFl0QkUrL86Qdk/vRwuD3rSBMxNIMDvdExNNCvE2y/g==
X-Received: by 2002:a05:600c:218f:: with SMTP id
 e15mr24267016wme.10.1643567913937; 
 Sun, 30 Jan 2022 10:38:33 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id p7sm10730308wrr.7.2022.01.30.10.38.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Jan 2022 10:38:33 -0800 (PST)
Message-ID: <7a56fef0-0ac0-f4d5-eae7-23028e49d2bb@amsat.org>
Date: Sun, 30 Jan 2022 19:38:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: build-oss-fuzz CI job often times out
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Alexander Bulekov <alxndr@bu.edu>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Darren Kenny <darren.kenny@oracle.com>
References: <CAFEAcA8V0jAjv1HS8QRa9AQHCxg=BVVH_jYVMYUVSP-Szstq-Q@mail.gmail.com>
In-Reply-To: <CAFEAcA8V0jAjv1HS8QRa9AQHCxg=BVVH_jYVMYUVSP-Szstq-Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Cc'ing Alex/Darren.

On 29/1/22 14:34, Peter Maydell wrote:
> Hi; the build-oss-fuzz gitlab CI job seems to intermittently
> but quite commonly hit the 1 hour timeout mark and get killed.
> Examples from the last couple of days:
> 
> https://gitlab.com/qemu-project/qemu/-/jobs/2030815488
> https://gitlab.com/qemu-project/qemu/-/jobs/2029246068
> https://gitlab.com/qemu-project/qemu/-/jobs/2029013479
> https://gitlab.com/qemu-project/qemu/-/jobs/2024871970
> https://gitlab.com/qemu-project/qemu/-/jobs/2022584981
> 
> Can we do anything to cut down on the runtime of this job
> and make it reliably complete inside the time limit?
> 
> thanks
> -- PMM


