Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 311A737BBA9
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 13:20:18 +0200 (CEST)
Received: from localhost ([::1]:34768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgmuX-0003Jz-7E
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 07:20:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lgmnf-0001OF-Kv
 for qemu-devel@nongnu.org; Wed, 12 May 2021 07:13:11 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:44699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lgmnd-0000HC-OC
 for qemu-devel@nongnu.org; Wed, 12 May 2021 07:13:10 -0400
Received: by mail-wr1-x431.google.com with SMTP id e7so4669407wrc.11
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 04:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vKmiofyJpX2dCUfgJbqlDGi9sfZJzJE2rkgf1wrqGNE=;
 b=NHVB5E7NIsbOUZKZuRDvsNRaiiuREmfDlZs4jXk6f7lyADiGlptBJzlGBmDVJF/6ml
 CogUTQ/Jw897t0xICtZw6lLzMr95wp3U8lJOScaLei9IJdp2vLzxQxQv583+lb04KTTc
 lwh/0GZs3+n83GyC2FaoH2kC4kuyLC51cEuaepSRr0ylXRNOGmboXx3KjSObHGlO74Sl
 k4I4QeKjlwr+43m9N0mLvy5oi6o09XbE1A7WiP2cQC3pdsRbYAW7Vh3srEF0hggFaeds
 IvkVVLGtwvaXm/7BMChoWUG+0jLXqnBmnkTHLlwv54tt4uAeVPiDtUSwvQpZCNoGc6aj
 bUxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vKmiofyJpX2dCUfgJbqlDGi9sfZJzJE2rkgf1wrqGNE=;
 b=btX3x5ZATYQ27z4kUIVIPC1YLZX7myVhoLyeVnEK5TthB0D6VxG2pNSx1ZZ+qbBOeC
 92XcP7TV8NEiyitSLJqn1oVHa55onhaSszcNxv7yGkCxLD+uwOytyeI3viimnHCJKTkV
 dYw0BdmDWnPz0I3iD1AkNDMzm5vpxrNt8PmcC4M/rcruN6Pg6k07+WmDDoSON6z7hoZP
 XaLmK3aEVpMUBczkbXdW1Hm1dHjv+MGRoWmChBLkQV0p5AlEAZ64J+NLdaFJdLlEamK6
 VELnAmdPcc3qjMjzWoNVgJ8SwESMdSgCL+pdxlFghhDYlYT5w22RLNKHopat/DZ5rsFS
 lNoA==
X-Gm-Message-State: AOAM530EmWtUqogxygFEtUchO/GFVlqCxqPKCOTy7qSdmW6YCJ7o0dv9
 la8Zf9/MUAFZURQ8kLV036512tptMskhmw==
X-Google-Smtp-Source: ABdhPJwWWxtkQ9m3yGSwEM+jswx8o7MUQPqJVRkymHdMErnoB2j+FM8hQe+9huaNpi8CvlqzSuOP1w==
X-Received: by 2002:a05:6000:178a:: with SMTP id
 e10mr40301959wrg.157.1620817988208; 
 Wed, 12 May 2021 04:13:08 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id x8sm29747603wrs.25.2021.05.12.04.13.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 May 2021 04:13:07 -0700 (PDT)
Subject: Re: [PATCH v3 29/31] tests/tcg: fix missing return
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210512102051.12134-1-alex.bennee@linaro.org>
 <20210512102051.12134-30-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <30eb0eec-5003-f80e-0d4f-84a83cfe21c8@amsat.org>
Date: Wed, 12 May 2021 13:13:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210512102051.12134-30-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
Cc: fam@euphon.net, berrange@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/12/21 12:20 PM, Alex Bennée wrote:
> This was picked up when clang built the test.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  tests/tcg/multiarch/system/memory.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

