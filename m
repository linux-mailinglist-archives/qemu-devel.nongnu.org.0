Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A2D60AA62
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 15:33:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omxAA-0001gb-Pj; Mon, 24 Oct 2022 09:06:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1omxA9-0001gO-9b
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 09:06:41 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1omxA7-0008Kv-M6
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 09:06:41 -0400
Received: by mail-wr1-x435.google.com with SMTP id k8so7430605wrh.1
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 06:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LiMfn4kIA40aL12gUWL50OxPHK8aeh27iymZUuq8jp4=;
 b=iM2un1GbCXZiM1lQSq7RA5cfK0iDz1RXQW3CHZCmFlC2DXy5pqeyKua+3ZYuD1conT
 MI3SQQkLMWZcJLpCGMPF70FxlBljkfK1raj6sKJFEMfXAtnr1U817ziE+YFRY7dKbiJW
 qJwdmqiJ3CvzBGLzq4jDT413HHqYC8g2w0tTkMrnzgLS1I+tk/F7Htgd4l4j5TYfMeba
 8ilFceQEi+PYlloRP0UllX3v2OnXYG66c1534W7qKBOlMC4uQI3HCp4Rf/evd6izRsGs
 K3MbeZ4Mi4FZiAN8F0rJ2ecQ5G714Eka/95ZP8UNKQ/PTtn9/hlsmLQGP65vgzHZdK4z
 BH9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LiMfn4kIA40aL12gUWL50OxPHK8aeh27iymZUuq8jp4=;
 b=PHu1mgY+Jp6D9YgDQwEdViSY84SxKl6Yh1J2E2cagaUqsE6bcC4AJkGBVx+PerS3f4
 RwKU9TLpE8yrsax2nNI2eQ+Bx57iFGDKNlR90pp6113tQg55QmxiP6JIaZUOKcKxm0QW
 JpPj+3MtmwtL78gGo3yLYs4nD5951Jgh3F8IiMMqdQWmdFThMBqpnBw6xGL3zD+qK4El
 VQ7S35bnQ5MZNUN88hgxk+x4spwvFZQGdf5Pl7chLrZjpraRYMt1JUWVGEv2WEKruV0E
 12/DxpD0bYjNOMVA6/20tBeKqsiea4Lz8uz2Dd2JGGdyqkOeu+6dIXIkN0+pLwN8vIS+
 wMbw==
X-Gm-Message-State: ACrzQf2ycF3wsgzKsr2WdUWXXjabXQKstCpqeMOEnkeD+XMqWa52WysF
 fPT8KKg6P8tdRkG4o/eLO+RHPw==
X-Google-Smtp-Source: AMsMyM4gZiA5t8N5NiJGlV6HCnx3xCFb3WmDF2Tb84Jf49dtoSOGKf5aKQL9UpZLWHH/IjIOeBVG7A==
X-Received: by 2002:a05:6000:16c3:b0:22e:c6fd:2676 with SMTP id
 h3-20020a05600016c300b0022ec6fd2676mr21425828wrf.141.1666616797878; 
 Mon, 24 Oct 2022 06:06:37 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 i4-20020a05600011c400b002365cd93d05sm7042369wrx.102.2022.10.24.06.06.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 06:06:37 -0700 (PDT)
Message-ID: <cf7a4bdb-3c7e-d0b1-e996-8021b11ea5b1@linaro.org>
Date: Mon, 24 Oct 2022 15:06:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH v3 16/26] MAINTAINERS: add features_to_c.sh to gdbstub
 files
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com
References: <20221020115209.1761864-1-alex.bennee@linaro.org>
 <20221020115209.1761864-17-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221020115209.1761864-17-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 20/10/22 13:51, Alex Bennée wrote:
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


