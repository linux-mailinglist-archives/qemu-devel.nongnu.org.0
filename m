Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B36140C0A9
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 09:39:01 +0200 (CEST)
Received: from localhost ([::1]:48132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQPVU-00060r-I5
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 03:39:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQPT1-000495-O0
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 03:36:27 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:39700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQPSz-0005eq-9h
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 03:36:27 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 196-20020a1c04cd000000b002fa489ffe1fso3983460wme.4
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 00:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AwD919eFDS6T21T/k/MjVbCLi2HASQXmNo241OhzzmM=;
 b=fRLJrIAr/jdAicGDS2nygnmI3wECend7e/2l9lq7QM+GmKrgQi5KjV5LQSGUVJFg9B
 5Y19qxDQs09OHCaaUXZ4ZjmNyY7t/UOvZa5/DZblNZrkcmqXj7MimUNt8Quu1YtsZvGD
 eUYtnoosFu+sHI/IZ5K1FdC7dsYCqrf3V1a3y6bQVyXD1UcCFQHmxgj7zXbbCURkkoe5
 EhMgjG3cBXSnZoJE+HeKzjOFFHHSe62V97zT580MATxmw/CLKDP66IjyA6QtQmrHWCvZ
 BkASLg6gN3blm0WRUPynRS9ymE7LAeIGCOeQ4GRcNkDiPmakh+vhbwldW9ddTbua9vhD
 sMmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AwD919eFDS6T21T/k/MjVbCLi2HASQXmNo241OhzzmM=;
 b=aTuqIPTgcQAOoNlyZjyMxG5y38ws4yWQt3/TuU1if92d1kOk4q/xVFD2elrbhhQlME
 njPR8NnhKQrcki7lol+U9DgyiDQ2kYzPY6y2ijL4DPkmL3SKVzYxf2YgUMdAfmrEW4eo
 Dvjoc1gY59jKDDM9/nw4+tV3RD6mTb1Hr+BhVuu6+n27LR8ch9lVJyosJa2x3Kf93TRG
 DicGSIPcjo7zrXHmLRoA7G3B5+4J7vROF6OrCc8c+1ns0uyZXd6AGExHtJCJqiXkuJBr
 3mAGtXUxGZOFFYDnaURjLBCaoEQ8f0OiXYk1APmdsooV1gfc9YAS8e1xyGxmLCwL7pl3
 VsWw==
X-Gm-Message-State: AOAM53288rPL1wyidYfiRw1kXowcsP69SsmGbFmqMeAtg2alYXIjny+A
 9DReDjoAMRObY/rSBLoxLfQ=
X-Google-Smtp-Source: ABdhPJzEs+5SwHUZ4Ue9UcPgjAjkvbcj4JTygR2Q2w8Ue4cFOXtNBi8A7kzIqqrrN8K+lwasb9Oyng==
X-Received: by 2002:a7b:cc94:: with SMTP id p20mr2913491wma.75.1631691383270; 
 Wed, 15 Sep 2021 00:36:23 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id l13sm12438503wrb.11.2021.09.15.00.36.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Sep 2021 00:36:22 -0700 (PDT)
Subject: Re: [PATCH 2/2] gitlab: Add cross-riscv64-system, cross-riscv64-user
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210914185830.1378771-1-richard.henderson@linaro.org>
 <20210914185830.1378771-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c5ce301c-92c9-ae30-e64f-c594ec250207@amsat.org>
Date: Wed, 15 Sep 2021 09:36:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210914185830.1378771-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.969,
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
Cc: willianr@redhat.com, thuth@redhat.com, alex.bennee@linaro.org,
 wainersm@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/14/21 8:58 PM, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  .gitlab-ci.d/crossbuilds.yml | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

