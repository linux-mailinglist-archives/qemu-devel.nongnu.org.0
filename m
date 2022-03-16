Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2754DB1D2
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 14:46:38 +0100 (CET)
Received: from localhost ([::1]:41088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUTz3-0006OH-Ah
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 09:46:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nUTZV-0006VC-Jo; Wed, 16 Mar 2022 09:20:13 -0400
Received: from [2a00:1450:4864:20::436] (port=41879
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nUTZU-0003Qb-76; Wed, 16 Mar 2022 09:20:13 -0400
Received: by mail-wr1-x436.google.com with SMTP id h23so2340109wrb.8;
 Wed, 16 Mar 2022 06:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=c6YEaOEcCHU3YPD8x5SZYOLPS12Fw/csUrsgP2nu0Dw=;
 b=eoCpwqroRF0iN5N49vuE/nmlWJqHKAXov/vSbcIlGayQQdXNa1ckc875v4UhuxpYmK
 UhePVijV1KTIjnqTnnyxiIJQL4FjX4U3CbGnXb+Op4+Xo6hkqYNZxEf/WzmsAMoGdn8v
 eTNkIs/CXWaAjQevP7bzUTfgd49mclpWQTwc8neHUMf52ukE5uj+vCwBU9x4pQXGQpf1
 KwZghWXUmFiXZ1baXmIwnGe900PjGFJAsAtlg/lef6/+lS8JxC4ANSOqXUE/cfbtQQIK
 s/RpUqY+UIrFF2wACZ+CWax6bPQ/XytAbiGGy1C6zqcaB/k1g4CVNlu04zBzPXDtBZwH
 bucA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=c6YEaOEcCHU3YPD8x5SZYOLPS12Fw/csUrsgP2nu0Dw=;
 b=Gi9aSsBD35L/gEBrpegpDidFIgtNpQ8D90lq/4cT5zjxzxOOlewj7PzRMGzPKJC04+
 q2XavMJg/x13lgKGEeUSoJK4/jpehGvOqsZhV6wxCad74Ho8y3VmGWPUp5kyevv9OvM8
 HZ6NFrFex9OtIRPG6AyxOLGBO0TOXXeDf/t47j4joFH3xpnmsXB7hImrXOwtHnaT00Jm
 mJzLy0+7ALYKq+FmBXyo3a5owFl4HZcEviDPkcY3ZU6ic8nnG5DbE00mFgyWY8voEqKh
 DakamykwE+4FBy9rjtaHIKC4VdgScJlaxpKTKFB1o0xGeAyETtIElMSphTxCxGg0mO++
 FA0A==
X-Gm-Message-State: AOAM533m8UcNAy4Hz+NFJR1qic0ZpYC+RD+gocVxar9AmVIWa2OZkuTV
 jhrYBeJesOgbaYDwxfB5l+fkqOrr8zI=
X-Google-Smtp-Source: ABdhPJxzIWm8USK0w6wI5S6iKttNEZFT28+jl0x2bzaoqF0fRLwuyEjaeiADPzgqzmrJsw7iNXs5vA==
X-Received: by 2002:a5d:58d6:0:b0:203:de3f:e648 with SMTP id
 o22-20020a5d58d6000000b00203de3fe648mr2738921wrf.292.1647436810728; 
 Wed, 16 Mar 2022 06:20:10 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 n65-20020a1c2744000000b003862bfb509bsm5458394wmn.46.2022.03.16.06.20.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Mar 2022 06:20:10 -0700 (PDT)
Message-ID: <392781a9-fcec-5c09-7c08-5533bc462c17@gmail.com>
Date: Wed, 16 Mar 2022 14:20:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH 08/27] compiler.h: replace QEMU_WARN_UNUSED_RESULT with
 G_GNUC_WARN_UNUSED_RESULT
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220316095256.2613620-1-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220316095256.2613620-1-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 "open list:qcow2" <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/3/22 10:52, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> One less qemu-specific macro. It also helps to make some headers/units
> only depend on glib, and thus moved in standalone projects eventually.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/qemu-common.h      |  2 +-
>   include/qemu/compiler.h    |  2 --
>   include/qemu/range.h       |  4 ++--
>   scripts/cocci-macro-file.h |  2 +-
>   block/qcow2-refcount.c     | 20 +++++++++++---------
>   scripts/checkpatch.pl      |  2 +-
>   6 files changed, 16 insertions(+), 16 deletions(-)

Preferably poisoning QEMU_WARN_UNUSED_RESULT:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

