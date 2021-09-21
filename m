Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 614AE4139D0
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 20:12:29 +0200 (CEST)
Received: from localhost ([::1]:42054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSkFo-0007bh-Fo
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 14:12:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSkDl-0005TW-Fu; Tue, 21 Sep 2021 14:10:27 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:41961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSkDj-0007t7-UM; Tue, 21 Sep 2021 14:10:21 -0400
Received: by mail-wr1-x429.google.com with SMTP id w29so41874340wra.8;
 Tue, 21 Sep 2021 11:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9RxyTgtNKqgQrlrP5Sept7NqDe5PL8egCdnkfXDUkcI=;
 b=HPPUIrgf5+R+DJu7a0gYPpmnT+TGJrsh6e5pg/ir0z1E12oz4GhH78knwFyYJYZnjM
 1pL8AXk0YcamIsS6w1RuR+GAXhvm2uBxa7nKeyfRQfM2AiJz6LQdQf37iNCNrRbicO1H
 KH3ZXkalUUiQv8fWO7opbcc3UcRzjke66Y1AvECBVq6gt9aYxiTrGQGVjxvHNv8To5am
 BPTScw8BpyceYCuV3KkgiKsNNQrkuayhUT6ZQTT3vUxMtt8Ilkdw7Ygdw6s/WkuZEV+P
 +BkPR5qiQ8jpnCrule53oJeuoyXuGTdevMPU5XsKSbRaavFRSuDlB0qgCKVOQg7T1dbu
 zpGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9RxyTgtNKqgQrlrP5Sept7NqDe5PL8egCdnkfXDUkcI=;
 b=XKeG1O6dATNQFP27Ibcgh5YwAKkwJUK2Lt9EKnsxK7x5jq/0OqGZ3Z+XCSUTuegZMv
 mt0RKniozgVs634O3PqKiOdwptv+Mfx8Q/ilP8gqBPHu3VaH+RAiAJN+BxJE7oWXdunT
 dQqsKtlUfwtNPKKeHA63idakVGwS2JUg4MJHPE+D9mmzMDSW2WHkZA7TyOBEJPDW63ij
 oi3GB+axb1Fq6vhf8uTAU0XsoHha2tLqxGyzM9wCBqm4XdRNkf/esGyDMz183nAWAEty
 qUrG5GCxUHfMOJ8ClrRv3Djk1e2jfyTAJqOTK57V+tEZpXySxstIfH28mTihlSO2MMge
 IiRw==
X-Gm-Message-State: AOAM530/Lkx1ucI2QcyaoEp3Qzux3J6EsXqxCkgCzmZFM24xG3SPnTZG
 IpAYlKp4KRP/ZJv2pPCTPUc=
X-Google-Smtp-Source: ABdhPJykJQTBLTgl2E8uKpgKwzN9zeuxYzxbRT8n/HJ4EFJxgLA7CrdoZuAy9yLZp2lCRnZPbPP+Bw==
X-Received: by 2002:a5d:5903:: with SMTP id v3mr36318996wrd.232.1632247817935; 
 Tue, 21 Sep 2021 11:10:17 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id m29sm21323709wrb.89.2021.09.21.11.10.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Sep 2021 11:10:17 -0700 (PDT)
Message-ID: <9e781cf7-d769-05fd-880d-7e38236ad198@amsat.org>
Date: Tue, 21 Sep 2021 20:10:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 2/5] target/arm: Fix coding style issues in gdbstub code
 in helper.c
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210921162901.17508-1-peter.maydell@linaro.org>
 <20210921162901.17508-3-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210921162901.17508-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Luis Machado <luis.machado@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/21/21 18:28, Peter Maydell wrote:
> We're going to move this code to a different file; fix the coding
> style first so checkpatch doesn't complain.  This includes deleting
> the spurious 'break' statements after returns in the
> vfp_gdb_get_reg() function.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/helper.c | 23 ++++++++++++++++-------
>   1 file changed, 16 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

