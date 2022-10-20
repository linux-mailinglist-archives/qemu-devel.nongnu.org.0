Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE5D60660F
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 18:43:54 +0200 (CEST)
Received: from localhost ([::1]:51788 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olYe1-0004G0-3z
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 12:43:46 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olYZ0-0007Bt-7M
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 12:38:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olXoF-0002Mv-H9
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 11:50:19 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:43675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olXoB-0002dn-Vn
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 11:50:15 -0400
Received: by mail-wr1-x433.google.com with SMTP id n12so35055043wrp.10
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 08:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hSb89y8AIrW7txLZ6E3QwVxP6XmQaJdjAGjboU2uRoI=;
 b=drr/RGgEd6vtb17sD6706GeiU8EaJF3OEcmzHx9f+mdp0L8sGirYpz+cqRbzZa4Xj8
 X3FlxNfBwqvQNt+JnukD8HHBvX4Yw0ymYjy91z6zOrvkW/PiZojVBwQp0zvAdxa43kyR
 kWp144F6lM3Ti56xFOoiVkdXGIDYmGa3o3wau3i6StiQj/xZ1PT2PXNncqTTY/cbzjti
 9hrhAbjIo6zh90/55D+UBLNZfqdP2SEAs5it1s3NwO+1GrfpUF/hHWFFnVXsNMfbe5Kw
 P0kK8KzMrk/37MDpuJje7dYXbPCpoUAoBnAijcIVOTjCASdIB+KLo6ccA6JdLVpdUDvj
 lIdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hSb89y8AIrW7txLZ6E3QwVxP6XmQaJdjAGjboU2uRoI=;
 b=5oJM9mWb3hs6sEe6PnEabdkdGC9i4NnEOXSz847CVXj5Gnc4x1nBluRz4fkgEwX+G1
 4v3Kn3O/6zOMw2HbutX+dpsO944T/WIVeJVdJjhKLT2iEJnLBshn9MwdAUB3GSLaWJTO
 3JofM92EszMgMJPRetQS0BB2qMnNrCJDEQjwM5rkszg1sNyYEM4Dp/bUbufUxrz9N+O3
 KLh3UUZuGmnoREBSrTNWcyZNHefssQy54KGoBBYZLHBtM7CEEFSbLJjH3WG3QqssrHla
 5djg71VYR5/lon6x7Jx79VrO8MqPji3ykk7cQq3I4pdS52ps2xBsVQYj5iCTIJX/mZc4
 Ah8w==
X-Gm-Message-State: ACrzQf3j6VeZvOngFFQ2eMcVTYEbLJNvwXDtPpI8oezgakNa95Bl5VHs
 F02HkqC2chyJY5htaeZ1UBzeWiDghdQbglpD0mg=
X-Google-Smtp-Source: AMsMyM7LEV/EdqdNFXl7Ow6LoXLWK3Y7C5OBzOwUt6M/rLuGL4Y9BmlS3dU5XHpouiFO9YUv3HAzFA==
X-Received: by 2002:a05:6000:168f:b0:232:bd06:d5c4 with SMTP id
 y15-20020a056000168f00b00232bd06d5c4mr8934548wrd.122.1666281010294; 
 Thu, 20 Oct 2022 08:50:10 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 l25-20020a1ced19000000b003c6cdbface4sm12318wmh.11.2022.10.20.08.50.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 08:50:09 -0700 (PDT)
Message-ID: <4c8367a4-019a-e3c6-36ba-47ff69c3288f@linaro.org>
Date: Thu, 20 Oct 2022 17:50:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH v3 21/26] tests/tcg: re-enable linux-test for sh4
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, Yoshinori Sato <ysato@users.sourceforge.jp>
References: <20221020115209.1761864-1-alex.bennee@linaro.org>
 <20221020115209.1761864-22-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221020115209.1761864-22-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 20/10/22 13:52, Alex Bennée wrote:
> This test was marked as broken due to bug #704 which was fixed by
> aee14c77f4 (linux-user: Rewrite do_getdents, do_getdents64). Local
> testing shows this is solid now so lets re-enable the test.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> ---
>   tests/tcg/sh4/Makefile.target | 6 ------
>   1 file changed, 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


