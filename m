Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 425AD4E1E0A
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Mar 2022 22:54:38 +0100 (CET)
Received: from localhost ([::1]:57934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nW3VV-0000iZ-Bb
	for lists+qemu-devel@lfdr.de; Sun, 20 Mar 2022 17:54:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nW3TL-0007dL-5g
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 17:52:23 -0400
Received: from [2a00:1450:4864:20::329] (port=43642
 helo=mail-wm1-x329.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nW3TJ-0007Rr-Ql
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 17:52:22 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 l1-20020a05600c4f0100b00389645443d2so7482290wmq.2
 for <qemu-devel@nongnu.org>; Sun, 20 Mar 2022 14:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=jEJ4zBsZdfdYMH8w6GIhZK3DXnwCi8QW5pq2eM30LT0=;
 b=UVMqbxFL9AB5fIpnlUc7jgkDtcTGoKtMNFDypBd3dtUXaicDkWJMV6+8CKF4DTF8Nt
 ciTTiH2dCgH+dsCa2tA/nC73Gu487IeX8AKknH+5Zo3kXeU+tmiXAg+W8IGfLSYX1MVr
 F5NCUBZ2p2foZKtBz0YdtOx9NIkyberWyj8zlgy/tTUM99Q0DT6X7Xcr2y23zKly4ZGu
 RNQEKYOR6ylGC+ztqqB48lxw/oDSEiSpjI5s7yO8CRoyIQLqw8VTnzlN26WA+vN2tRoz
 4nb4gBg4qpb5Ekv8ghIWT3UMy5yVOBevLd5lsAFV2dBO8INhgViCnflKiX+pC6Qh3Pub
 oKQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jEJ4zBsZdfdYMH8w6GIhZK3DXnwCi8QW5pq2eM30LT0=;
 b=VNr9O4kcnof7cfRTd4aXBRlDwcJ26aS7dXZ8K3CtVTL7/u5Ue7J0baCXvUd9egqlkO
 1Zt+smZah3z8DCQ3YTr0O9EOc8dBFr42CliPBM4lWcl6rCx/DeHz1acvwzJgaVgBRp7v
 G36c/5Dy8muY/MDhJ28QnTNfiiEdADeIZ3v41g7s5FkTsjEdH1zX659U9tK+tyXOiJWT
 GV2YRDbNcjqoLLWt4Thk+0UHQqpLN0j3EgVdx9BV30tx4pAvgJkI3KEHXg0scXJvp4ji
 BYD9jegPUtTR5zLQJwnKfDGCpfm+XDCT9tmSPn29UzgERVDwziU6RCKHJvkValrAsfIC
 qGTA==
X-Gm-Message-State: AOAM532gT0KTwDPQQHvUxD1PK8KxIPbh3+d21J7v0Pm33SeJLQdhIfT0
 1m00YGYuWh7tlNufP7tIq1s=
X-Google-Smtp-Source: ABdhPJwlsrs9tUY1OJazee4MF/IMSDsZdiJy5/MUqZxYIvFR2C2hg+pJlDq3dfLfvgE4DOwbTKqYmw==
X-Received: by 2002:a05:600c:252:b0:381:3461:1c64 with SMTP id
 18-20020a05600c025200b0038134611c64mr16898495wmj.94.1647813140498; 
 Sun, 20 Mar 2022 14:52:20 -0700 (PDT)
Received: from [192.168.1.34] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71]) by smtp.gmail.com with ESMTPSA id
 p21-20020a05600c359500b0038ca92f175csm892639wmq.32.2022.03.20.14.52.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Mar 2022 14:52:20 -0700 (PDT)
Message-ID: <0049e744-f1f8-b6be-451c-b118fab5a4b4@gmail.com>
Date: Sun, 20 Mar 2022 22:52:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PULL for-7.1 05/36] util/log: Move qemu_log_lock,
 qemu_log_unlock out of line
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220320171135.2704502-1-richard.henderson@linaro.org>
 <20220320171135.2704502-6-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220320171135.2704502-6-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::329
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/3/22 18:11, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/qemu/log.h | 28 +++-------------------------
>   util/log.c         | 23 +++++++++++++++++++++++
>   2 files changed, 26 insertions(+), 25 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

