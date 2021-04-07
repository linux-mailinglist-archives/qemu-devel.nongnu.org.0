Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6894A3572E5
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 19:16:51 +0200 (CEST)
Received: from localhost ([::1]:48012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUBnO-0006TG-Ft
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 13:16:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lUBlH-0005SH-B5
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 13:14:40 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:42675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lUBlD-0005hb-AU
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 13:14:38 -0400
Received: by mail-pg1-x52b.google.com with SMTP id g35so8799210pgg.9
 for <qemu-devel@nongnu.org>; Wed, 07 Apr 2021 10:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=23Z4NJ9FVmwchvQmdf+rbF+jNGUBtqi/A78EWm1O7vk=;
 b=UwoZENeQEb4tCcolqpnrVUWPRT4HOAe333/9g/PlQ8AubWzWXUwKDEBoiZzcUoCvjz
 pnqOkLH17MkfbB/zZj4QMCRn0XwrGkuenJHUIRlTiCTMlO1s+vSCBGR1HysRyvmC7WCw
 AuraQXm2CspakQfUDMMNxmmCssgUfDO4sI3xwyiUiHxmuOhse/0x3qhKepZAJx6aCr94
 ndtL5cT7osJZX9QyfCgpwWaEegLV11REnsrHT8IEzu78WVq3IQgy5K1Q0O6IdG7mNUla
 z4SQuM6IMBurBIPCkLR/h49WwJK6S1efnX0CQSjgDe9EFf5oVnF7ZG8n4quUsR/SD3w6
 YJDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=23Z4NJ9FVmwchvQmdf+rbF+jNGUBtqi/A78EWm1O7vk=;
 b=acMs9q3CqtylpKFVMpg25xR8Zy+yI86tFGyQeqyRFwIr7wBIbhuKji9vQcPu6YW07t
 muAUto1wvEQ/+KtiQTO6LV3paawQjI3Bj2y3zWDRSqbzprR+Tbcn9IueudyZK6rzvMJB
 Td1dnLa5Ra1twRIK8eaO57qBoFLXxErhyZQb7WfYeloCaQKCf2B2enmt6xztDm05wYTp
 qzFawzfPqdo7ooFq0WMe0Av09CffIPmRy1pi4oKjLzIGkragr/6ZQdPMahp2jZTgRm9o
 9++zyBOfu/y80sF54a/u3u4/mRz7OibJ4ropAY+lm7XtCdqTnMEeh8L/x9w/WUQ7Zeur
 0xJg==
X-Gm-Message-State: AOAM533ynsxWRWoGXtb6LvdJ96Gxj71Svz611QF7UJML2nSc3cFOOmx/
 l4jv2iSdmfjGvtX0Wz1IjNOfKQ==
X-Google-Smtp-Source: ABdhPJzIO0hxVIYKibcYuD1yqbICIndxgjIZAUbM1Y3JkVR1i+Htyhl3vgPVsOfxT7acGXkQg2xPBw==
X-Received: by 2002:a05:6a00:138e:b029:204:422e:a87e with SMTP id
 t14-20020a056a00138eb0290204422ea87emr3753883pfg.24.1617815673001; 
 Wed, 07 Apr 2021 10:14:33 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id g10sm21309579pfh.212.2021.04.07.10.14.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Apr 2021 10:14:32 -0700 (PDT)
Subject: Re: [PATCH 06/27] arc: semfunc.c tcg code generator.
To: cupertinomiranda@gmail.com, qemu-devel@nongnu.org
References: <20210405143138.17016-1-cupertinomiranda@gmail.com>
 <20210405143138.17016-7-cupertinomiranda@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2d3c797b-74a5-d464-fbbd-5819c88d828d@linaro.org>
Date: Wed, 7 Apr 2021 10:14:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210405143138.17016-7-cupertinomiranda@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: shahab@synopsys.com, linux-snps-arc@lists.infradead.org,
 claziss@synopsys.com, cmiranda@synopsys.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/5/21 7:31 AM, cupertinomiranda@gmail.com wrote:
> From: Cupertino Miranda<cmiranda@synopsys.com>
> 
> TCG generator scripts for semfunc.c file.
> 
> Signed-off-by: Cupertino Miranda<cmiranda@synopsys.com>
> ---

My only comment here is: do we really want to re-write semfunc.c, as opposed to 
read one input file and output another?  I presume that the original comments 
come from some canonical source at Synopsys?

I don't know ruby at all, and don't really know how to evaluate the rest.


r~

