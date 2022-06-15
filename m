Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C92054CB8C
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 16:40:31 +0200 (CEST)
Received: from localhost ([::1]:39794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1UC5-0005aO-S8
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 10:40:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o1UB0-0004l3-Tn
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 10:39:22 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:37609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o1UAz-00075S-6W
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 10:39:22 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 3-20020a17090a174300b001e426a02ac5so2331401pjm.2
 for <qemu-devel@nongnu.org>; Wed, 15 Jun 2022 07:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=WTQ9l37rmdojrdgU3c8N+pzDqikcSIMtMed2oW7i09c=;
 b=TWLeX4M0AvJ+iWWrrVQNadcNwgdyXKcVlx4f8GnMCh5RJxIULLwhyNtiO96YNOVfLE
 KeMWoCz7JnSsiIaxGQ2DPWf62lvXFBUSPLtBTzGiB67fxFjyWG2TPRzgUrRIySqh4SE4
 Dy/5f2CtrL4FLcQ7EhZz14hanQI0C4yMaX3OG5JJn5iTXrWO4oH+nL5NEN0fpTGoVIzX
 /CwddwsyDQyLBlSSuSCQlRnPmux2q3QPshKccHsJI2Qt0Llmwt1NWZuHs8I76fZbw75G
 WO3Bx33ey/oz/5xju+a3w2fSyy4ZQ2cTT2X/+F5xTr78cXdtTIqzoEIj55dnk5aK12ji
 o92Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WTQ9l37rmdojrdgU3c8N+pzDqikcSIMtMed2oW7i09c=;
 b=rIN6EmzrbHVT0VD4AaQoefGuEe+YY2zkv5S1fT0p4Rwp2O6gdHg/lRBYwqGo1DsPQz
 oEa6pE8Uyvfc39gA49JfA0ZwmfdHNvJ/Lup6zX3nd1/JzgJNFwqREKINcwXArKYQMFNa
 7+sDv4FjCunAkTfVyZKCfLZ6cqvvYVCdYgbyzG8B+Rimuv7tSSZleN1+RrkKvSGMMJg6
 +Vh1GpJp9JsdgHhAOfh/OW5d7xTnTiqGRJDP/x7rkNTVDS+djCyzaZZNrYOuzaB5YrZx
 vx+NWJG4rBCq4MTOao7Ycyw5Bo1eybsCbAiVPFURJN0iMQulSnLMuDhsXWs/v66uae8S
 4ZKQ==
X-Gm-Message-State: AJIora9B++4PCTSSAnqieRTjGIgjvxjH1QLPGn0ASDpydvgiTggIfO9M
 BANh+KpL5SnUbQNhHZ8x891hog==
X-Google-Smtp-Source: AGRyM1u7SbTEH1pxXjgaQuT44amqZ4iZ95IO0aNN1Gl3x+dxNTOgERVXGqltgPajrBfqJgvWhCPeIw==
X-Received: by 2002:a17:902:eac3:b0:167:92f1:15ba with SMTP id
 p3-20020a170902eac300b0016792f115bamr151016pld.92.1655303959695; 
 Wed, 15 Jun 2022 07:39:19 -0700 (PDT)
Received: from [172.21.2.253] ([50.208.55.229])
 by smtp.gmail.com with ESMTPSA id
 x21-20020a170902821500b001641244d051sm9349276pln.257.2022.06.15.07.39.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jun 2022 07:39:19 -0700 (PDT)
Message-ID: <a8ad29a5-73db-820b-089d-200c2875bc57@linaro.org>
Date: Wed, 15 Jun 2022 07:39:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PULL 00/10] Block jobs & NBD patches
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, stefanha@redhat.com,
 eblake@redhat.com, hreitz@redhat.com, kwolf@redhat.com,
 peter.maydell@linaro.org
References: <20220614102910.1431380-1-vsementsov@yandex-team.ru>
 <795ad7ac-27f9-4b84-4d47-86d107f5bf49@linaro.org>
 <8b8ba4be-2713-7b8d-a7a1-398ee37f41a4@yandex-team.ru>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <8b8ba4be-2713-7b8d-a7a1-398ee37f41a4@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 6/15/22 02:47, Vladimir Sementsov-Ogievskiy wrote:
> Also, could/should I run all these test pipelines on gitlab by hand before sending a PULL 
> request? Or can I rerun them on my qemu fork for debugging?

The first thing I'd try is make vm-build-<image> and make docker-test-full@<image>.

Either or both will reproduce the docker environment being used on gitlab.
If that fails to reproduce, it could be a difference in kernels, at which point I don't 
know how to advise.

It would be a good idea to run those test pipelines manually before the next PULL.


r~

