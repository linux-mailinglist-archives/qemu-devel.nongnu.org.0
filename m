Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BD1410B2C
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Sep 2021 12:40:58 +0200 (CEST)
Received: from localhost ([::1]:56018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRuFl-0007yN-7v
	for lists+qemu-devel@lfdr.de; Sun, 19 Sep 2021 06:40:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mRuDj-0007A7-5J
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 06:38:51 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:54215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mRuDh-00009O-6W
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 06:38:50 -0400
Received: by mail-wm1-x335.google.com with SMTP id z2so1773793wmc.3
 for <qemu-devel@nongnu.org>; Sun, 19 Sep 2021 03:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QJwqV5DFZr/3qHtzBCjw6sF6cj8UkPbSNOoHE/xmDX8=;
 b=WbTBQqwT4MwuqWZ3sCLBeQq5jaqq/ztUo0+XyUEkd5nW40WYld5tlQPJB6HjwKw8Td
 vcbI2qQNA+8YoSihwtcA39R1M33acPqNPHyuRBTFgtUYsj5m4xau/DKeTvOSWG/Qt4Fj
 k4klOB8XYx+RdkItg/ITXjRYKyyiiQPbO/tTE6Q548qKF6IMnL/3cRd5853Cp+DyoEJv
 3+p341JgLQdPrilE1sdPDdgqVxa0nBYnPbEx5vnsNpnKqPw3ZMviPJQi+7iVKRqnjmUw
 2PJUrSVwyiIEt1wkqa1y+w1/1mwDC8P7HjkbD3fS9sb+Yp80lyQ+zJLcO3Gkmb6dz7ng
 JsoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QJwqV5DFZr/3qHtzBCjw6sF6cj8UkPbSNOoHE/xmDX8=;
 b=bUuXuY0U8z5c3190hIfLgYGd+xwNZOVssopletP+KwyU5j/kKv0xD65ETEM5ygOiM6
 Bl6oLDugj+TRFbZ6EVINwK0pDSWvASu3bsA+Vf2cvoN2f5jXY85o0LaBCMLcdOrS3uFo
 UbWFkk9V3NMqDZE0egI4h9SxCcRFXhJJaL9tf8dwLGC71Sn45m1sUIY+EqwOJxkCbi3k
 164duX9OgDKx9KFdFdySt/malCGdHnNXfa2WV46AfDrguVHqp6gKpeItmEZkkrENslYV
 cPJ6kFqRJ980MeVl1wUodTZfxCv+357P8uCtjGYl3nuQCA0kyBH55XFDG/j/ZrIrDpir
 yP4Q==
X-Gm-Message-State: AOAM530/n7DgIE4lFJaBVdbwMWSaqUZ+X+gbO8zLZVPHT1UBii1rAuYX
 5KB+BXIGEch/ItO1oQLY2zA=
X-Google-Smtp-Source: ABdhPJwgFFTKKqAfP9hSv0ORc1SWR4d44Dil5dgafjZxEAYbwHRHIpSfCRh8rxid8FpF95BSNltl8w==
X-Received: by 2002:a1c:58:: with SMTP id 85mr1612111wma.87.1632047927207;
 Sun, 19 Sep 2021 03:38:47 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id f19sm11678905wmf.11.2021.09.19.03.38.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Sep 2021 03:38:43 -0700 (PDT)
Message-ID: <2c7141a5-88ca-12ad-8bfb-85de33ba042c@amsat.org>
Date: Sun, 19 Sep 2021 12:38:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 00/41] linux-user: Streamline handling of SIGSEGV
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210918184527.408540-1-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210918184527.408540-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.538,
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/18/21 20:44, Richard Henderson wrote:

>   linux-user: Reorg handling for SIGSEGV
>   linux-user/host/x86: Populate host_signal.h
>   linux-user/host/ppc: Populate host_signal.h
>   linux-user/host/alpha: Populate host_signal.h
>   linux-user/host/sparc: Populate host_signal.h
>   linux-user/host/arm: Populate host_signal.h
>   linux-user/host/aarch64: Populate host_signal.h
>   linux-user/host/s390: Populate host_signal.h
>   linux-user/host/mips: Populate host_signal.h
>   linux-user/host/riscv: Populate host_signal.h
>   target/arm: Fixup comment re handle_cpu_signal
>   linux-user/host/riscv: Improve host_signal_write
>   linux-user/signal: Drop HOST_SIGNAL_PLACEHOLDER

Thanks for caring and splitting v1 patch :)

