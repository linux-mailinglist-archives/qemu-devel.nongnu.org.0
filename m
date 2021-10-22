Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B72CA437CB1
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 20:42:43 +0200 (CEST)
Received: from localhost ([::1]:52642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdzV4-0003F9-T4
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 14:42:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdzKH-000388-0W
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 14:31:33 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:33365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdzKA-0004Xd-H3
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 14:31:31 -0400
Received: by mail-pl1-x62c.google.com with SMTP id y4so3385743plb.0
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 11:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=to:from:subject:cc:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=6FRjbVakgTSxJty60vPS/94+QumuUqEQE1FHcI8mwL8=;
 b=Galcc3TcfdNVb72pBYpoTnvN7kMffqFa5L8q9PXvAK5l7GGFoBpLeCaUwC9Sv4o+bG
 pafmBv8c8+3Q6LBqSo5JZ497voa4jvD2TjpclLLPgwZQqJaoPlgA5J6GUX1+8gyiZIvE
 NmCmq0clFDTKlmMu6OLlCIkqu3lp+cuNyvH+uLW+60vfIZkQOLYTwgf1wrlX832Tn/Ta
 0zqPgAxGtIfsWt9HB6S1Vl8ZTTBPEpzovpHJ8XKgLTLtU6h/eQOqisGvzzlXT2dKUwEq
 WdtnqdsA4UATY6bEcBRI6attq3D/6OflO1yFyKmk0fuXSdu7ulgosjNhnPQKHDTAuZbT
 l/Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:from:subject:cc:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=6FRjbVakgTSxJty60vPS/94+QumuUqEQE1FHcI8mwL8=;
 b=JNZ/nhWLlIM/PT4UZznolXJqF0eyHv9ILIZVcbeMy6/UlxM4g4bbbUU1vVlQF4vJ0g
 eyQLA+Id7qL1DBEI82gvHhxIlq1DJ2/SQ5k5L1Gv3O2zwxThDQvwyzxmy651n9GwdtyK
 TTQFTho1B3eW1KqK0oCTHWPeZHdEMoRpgLW5S9PQ6lEsHgH2EXpvEncUoNZUUy7pQ1MF
 NMq4o26vm9zzzIi84n25D37ZUvNxtkBRviqYenV1dKb4rgdm/E+4NC6CmZhRjbL/a2cG
 iLQypPMxewfhL3w5T/TIWJF0FInAHfks9j2hylTCu21puFKdQe8AxmEb93k4OI1+xlV7
 oW2g==
X-Gm-Message-State: AOAM5319U8yWwM+A/m+b9+1N2yqbcSLfWEjEAsSwUey7BpRqM/yoTkaH
 GowAJet0YzKWppvTzGECmzaHyRRd1uRQWw==
X-Google-Smtp-Source: ABdhPJyERGL39303hNTlBJNIqcDddBqdNCpr0F7VY0yet8DglXxAImtBn6grCHMehtisDIShHXg70w==
X-Received: by 2002:a17:90b:4f46:: with SMTP id
 pj6mr1718291pjb.63.1634927483173; 
 Fri, 22 Oct 2021 11:31:23 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id u5sm11542186pfg.211.2021.10.22.11.31.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Oct 2021 11:31:22 -0700 (PDT)
To: "Daniel P. Berrange" <berrange@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Subject: gitlab/cirrus auth token failure
Message-ID: <8257c433-f8fb-7766-dec3-a220e9bee84b@linaro.org>
Date: Fri, 22 Oct 2021 11:31:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Daniel, you win the cookie because you committed cirrus.yml.

I should have reported this before the weekend, but at some point this week the auth 
tokens expired(?).  All of the cirrus-run tests are now failing:

cirrus_run.api.CirrusAPIError: API returned 1 error(s):
[ { 'extensions': {'classification': 'DataFetchingException'},
     'locations': [{'column': 13, 'line': 5}],
     'message': 'Exception while fetching data (/createBuild) : '
                'AccessTokenAuthorization(token=[MASKED]) '
                "doesn't have permissions to create builds for "
                '5748266831446016!',
     'path': ['createBuild']}]


r~

