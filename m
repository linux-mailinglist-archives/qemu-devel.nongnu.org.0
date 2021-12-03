Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3237467F66
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 22:35:31 +0100 (CET)
Received: from localhost ([::1]:39516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtGDK-00017v-GB
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 16:35:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mtGB8-0007Xs-9m; Fri, 03 Dec 2021 16:33:14 -0500
Received: from [2a00:1450:4864:20::335] (port=45018
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mtGB6-0003lz-GF; Fri, 03 Dec 2021 16:33:14 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 p27-20020a05600c1d9b00b0033bf8532855so3196193wms.3; 
 Fri, 03 Dec 2021 13:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mR7jK+ywohaXURGnJzsbN5+r+G2BMwMdZYWdGaqPXKE=;
 b=KR+3YAVGsaCZOZfl4j5w89mU3KxzeEObW30ppBp13WOmQ8uI3/83+mLA8EI6EaPDpM
 SMtu46yZTUwFkoW1AglATttoK9ArDWEY9A9UImgQyvVXyG/7alu8RKj+VVzFXPBGfXjN
 18MCvjRRSOcdbkbX0yVmzt2g6JPDACexuF5GhvBB58XGjzgSHlRPaBpYYKqOhVU3CdbJ
 AqshpIcc69HrUlC7K0/ktbJaJHrocrYo1HgJVBGFlZAwD9MDp6pUCfDk9zmXSOA2tJz/
 a1+Ujqv15mK4ZyAFY8zUv+//TVL0Vhht2Czg5S7JmHgzWOq+14l6BZneyMBlTe6myTni
 ZZ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mR7jK+ywohaXURGnJzsbN5+r+G2BMwMdZYWdGaqPXKE=;
 b=f20YAAd41gCYcoili82CI4UeIaNQK5TyPV/On93nzzf0LweZ+QICjrIb0t/2OY+Lt+
 EB2g2N8cZGnVQAs9VuGroPIkJ/fF+mwv3LxplkF0zuFEt9eE6GbQCb48jAhiz88AYWZa
 rkrmlAz9QPe2t9RtVuWB8HCCVK/zsPt3TsmmW1Xdxm+SdpkxIlnVrmZUgXgURKalJDLG
 gB+JfAm1Hpd65UwTpc9r49XTSQLDtGBQDqMKo22V2bI0DvDW/MhX6mKh4qtHBYsbWX3v
 og0VJ2+na98+LuMegrLi4ZvlC9OUXvjjJdPHqe1tcRjbGtZIbfXFfUL8tlxs2iYK+gMQ
 QMxg==
X-Gm-Message-State: AOAM530MrOD352LES6WqDQOpxgznbFHe4quHF3K5q7GNqVsct1ajy4A/
 +GegE/R6WS2oLJiIiyoPKs4=
X-Google-Smtp-Source: ABdhPJzANKGUJIIJ0H8ue2rzl0sTW8lIl932rQlpITE6i881WKYZ67lta/UKWgRpXu8ObDQ2U69FVg==
X-Received: by 2002:a7b:c256:: with SMTP id b22mr17996409wmj.176.1638567190847; 
 Fri, 03 Dec 2021 13:33:10 -0800 (PST)
Received: from [192.168.1.34] (abayonne-654-1-109-18.w86-222.abo.wanadoo.fr.
 [86.222.60.18])
 by smtp.gmail.com with ESMTPSA id f7sm7766207wmg.6.2021.12.03.13.33.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Dec 2021 13:33:10 -0800 (PST)
Message-ID: <5264ce81-366d-202e-d6a2-384e567d4ce4@amsat.org>
Date: Fri, 3 Dec 2021 22:33:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 01/35] softfloat: Extend float_exception_flags to 16 bits
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211119160502.17432-1-richard.henderson@linaro.org>
 <20211119160502.17432-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211119160502.17432-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.938,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: alex.bennee@linaro.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/19/21 17:04, Richard Henderson wrote:
> We will shortly have more than 8 bits of exceptions.
> Repack the existing flags into low bits and reformat to hex.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/fpu/softfloat-types.h | 16 ++++++++--------
>  include/fpu/softfloat.h       |  2 +-
>  2 files changed, 9 insertions(+), 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


