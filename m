Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7AA75335D6
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 05:32:47 +0200 (CEST)
Received: from localhost ([::1]:50560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nthlO-0005qy-In
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 23:32:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nthjy-00053q-86
 for qemu-devel@nongnu.org; Tue, 24 May 2022 23:31:18 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:55992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nthjw-0001aa-Ai
 for qemu-devel@nongnu.org; Tue, 24 May 2022 23:31:17 -0400
Received: by mail-pj1-x1034.google.com with SMTP id n10so18528208pjh.5
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 20:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=vXW78gsqdUd9BvtpF6O9P+jwUgNu9w63csrZKWUdGQk=;
 b=mrV1acrUYKYCyEVvlqIqYFPdqMu2vyRD5Je070eaOpXB/o6K20IOB03zXPLwierj/s
 SOwQ/ovCv+y5iuUWNit4Ik429ULJXXUhNBREbvduMYWzEaAZgpCuL9IR50SQ/E6U45yx
 gMC5a/ZfDxGk31lp3iCurEk45ZOYvpkLkXHqOcJKqafJnL84tbbEz3VVKBIEeyzff+9p
 eiBC4Emk5PnGBv9HSaKl84TT+omVUMfIvYLCnTyKS06qrK3hyQmKb+Z9MJa29a3DWgz9
 VYQJy71lx+u4jUUJLPAIPiiSZqyGLn/Lgn7lAIymZ4hKWsswQXnF5U35uSrKRpqmsSKu
 0K/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vXW78gsqdUd9BvtpF6O9P+jwUgNu9w63csrZKWUdGQk=;
 b=mJOVrjYTBMjItCtSaZtbHEzMvW37p8smlohzEKsKrK0Kyww7DJUjlK9WJTdYVCJPJs
 wed4RBTd5KWRyrmEct4jorW+8sDAs4W2C6X/l1EsNLSZAqmmUMpYL7fJkXGij6F5jPzo
 1G1bFaZFiDFGyQy0dFskdpW3tBB/dAUEMDHkXOKM0yibrpquXsVnod1EueLYcOmLwEML
 ut+fEq3pZkEN7n7Sx/iSHd/Nkwh1H6iphXdg9oWx2NIl5JdCSw8Ji2vd688WjVpOeKBn
 SnaQiOypNn4F4WOXFznw4uEJZpllWFZ3ZcaDh8we+FcTTuZRIm8eKxxPpq78iZSb+wL7
 BbRQ==
X-Gm-Message-State: AOAM533HqDzHTea8U1MQjjOIcZy+TlcYucVIw3jx5BIlG+h44u5nKCb0
 VXMtg2QkH2rXSgocChbvEq48CQ==
X-Google-Smtp-Source: ABdhPJwAoBHWNGtgTGix+Hfye1Ge0aFINFpu9rKHAiEF9wcun1LtlpHoF60G+CQXsRfee8nqt78HTA==
X-Received: by 2002:a17:902:da87:b0:162:49a5:ceb8 with SMTP id
 j7-20020a170902da8700b0016249a5ceb8mr4956445plx.91.1653449474410; 
 Tue, 24 May 2022 20:31:14 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a170902b70500b0015ed003552fsm7988246pls.293.2022.05.24.20.31.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 May 2022 20:31:13 -0700 (PDT)
Message-ID: <2d20696a-5d3d-c87e-6dfc-38c030dab3d6@linaro.org>
Date: Tue, 24 May 2022 20:31:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v5 00/43] Add LoongArch softmmu support
Content-Language: en-US
To: yangxiaojuan <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
Cc: gaosong@loongson.cn, mark.cave-ayland@ilande.co.uk, mst@redhat.com,
 imammedo@redhat.com, ani@anisinha.ca
References: <20220524081804.3608101-1-yangxiaojuan@loongson.cn>
 <3fce1517-2d55-0bce-eb7b-1bfbdcc7af22@linaro.org>
 <5018d8c0-7cbf-e63f-286e-f0aa8b8e4e86@linaro.org>
 <7cbb6328-2802-b0ed-b143-16c31cf42b82@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <7cbb6328-2802-b0ed-b143-16c31cf42b82@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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

On 5/24/22 17:44, yangxiaojuan wrote:
> 
> 在 2022/5/25 6:41, Richard Henderson 写道:
>> On 5/24/22 15:32, Richard Henderson wrote:
>>> When the syntax errors are fixed, it does not pass "make check".
>>
>> When I configure with --enable-debug --enable-sanitizers I get
>>
> I got the same error.
> 
> The 'make check '  result:
> 
> Summary of Failures:
> 
>   95/117 qemu:qtest+qtest-loongarch64 / qtest-loongarch64/device-introspect-test 
> ERROR           1.20s killed by signal 6 SIGABRT
> Ok:                 114
> Expected Fail:      0
> Fail:               1
> Unexpected Pass:    0
> Skipped:            2
> Timeout:            0
> 
> 
> We will fix this error as soon as possible.  And  what necessary tests do we need to do?
> 'mak check-tcg' ,  'make check' and 'make docker-test-build',  these are we know so far.
> 
> I also see the wiki  [1],   should  we need tests all of them? Could you give us some advice?
> [1] : https://wiki.qemu.org/Testing#Tests_included_in_the_QEMU_source

That's pretty good.  Eventually it would be good to add some tests to tests/avocado, to 
test linux kernel boot.  That can wait for a bit, as it also requires hosting a kernel 
image somewhere.

In this instance I used --enable-sanitizers because without, I was getting SIGFPE for a 
rather unlikely divide-by-zero, and I suspected memory corruption.


r~

