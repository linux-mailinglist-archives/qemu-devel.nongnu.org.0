Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83362573C20
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 19:44:06 +0200 (CEST)
Received: from localhost ([::1]:38988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBgP7-0004Mm-Ey
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 13:44:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oBgJ7-0000wE-R4; Wed, 13 Jul 2022 13:37:53 -0400
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236]:39670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oBgJ6-0003vS-7L; Wed, 13 Jul 2022 13:37:53 -0400
Received: by mail-oi1-x236.google.com with SMTP id n206so6317201oia.6;
 Wed, 13 Jul 2022 10:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=jY5TLoZnLbAduXTvCyqoZMCZrjIZiTtdPS8FM75Cp9M=;
 b=ijrPTVAuMQNXJjtx31HqStAheb5GT9+DDnY3mijHqP12mWR7n094fOjum8A/iblxPr
 71zgLfPt3trClSCvYPJHh6QimVFUjmqn2YZwgZR2UMsU+33stiEz056S43DOxPFiOuhz
 ZFv8KmU43V8/56rTvh9qwi3Y4HQ3LZ8DSUe2fzVo4mpRdhhRh4vveN/cqpphg4jtLLsI
 0cfuYpRka2Ho94J3p9akYkxGyFvIioFzBR0xg1KYHiRA51JdDeIIpurLEUjbRbp4zIh2
 YG3av8yg94knq/do6t2jtXd8TweWYleZJpt2lNpzhExypbHwcx7zG+SDtM5iO27DzTHK
 OMbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jY5TLoZnLbAduXTvCyqoZMCZrjIZiTtdPS8FM75Cp9M=;
 b=PWZizm01JUeNz/xtFiFsCnLzuVMVsJz8e1VuWIXayqhzJR2dtr0rUXKk70w4uN6V2H
 oK4G0cFVVFw9Ck39BYnNfYHduWefAdO8hEqXcnDwOYIHSWvCgqmDa2IbYXWpo9lIXBTD
 El877U8u67N/ld5v/unK8A9BrsxOPpEHKC+QPR1Wa8B7gJvQidfMj5+iTT6pD9hbwmmp
 dJFf9dHDjFpG6gZ0Ley/0Ocb/TMVKsAcThjbjA8rGWcFwvAXdjsqo9tQnkpGZk95A6Bn
 OY99lnpCiNbzE6oHb3kbEQm06W3j8dnSuoDmg+oh1rAxx/GMM03EugEU/moQy69rY49W
 pAdw==
X-Gm-Message-State: AJIora8u0boAuQW7Fe70YvgJneO5dUWW0EJ1CnX0Xc4a4MwfBsgcG7Im
 FXD6B+ZWD6iPzJy20dQVkqUtaHiyV6Q=
X-Google-Smtp-Source: AGRyM1tBr50cy34CoGmxS+GIC+P5S/xSn14L8/F9qdj6AZQxVy+eyIxERVx6mLhxoX8CqfhPRSRDKg==
X-Received: by 2002:a05:6808:1643:b0:335:19ba:b696 with SMTP id
 az3-20020a056808164300b0033519bab696mr2316347oib.42.1657733870739; 
 Wed, 13 Jul 2022 10:37:50 -0700 (PDT)
Received: from ?IPV6:2804:431:c7c6:ec9a:1920:c2d:854d:f40c?
 ([2804:431:c7c6:ec9a:1920:c2d:854d:f40c])
 by smtp.gmail.com with ESMTPSA id
 k12-20020a54440c000000b003263cf0f282sm5442214oiw.26.2022.07.13.10.37.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Jul 2022 10:37:50 -0700 (PDT)
Message-ID: <4712b9e2-9ab1-b50b-0cf2-61df6d477a69@gmail.com>
Date: Wed, 13 Jul 2022 14:37:48 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] hw/ppc: pass random seed to fdt
Content-Language: en-US
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: qemu-devel@nongnu.org, "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Cedric Le Goater <clg@kaod.org>
References: <20220712135114.289855-1-Jason@zx2c4.com>
 <7310087f-443e-ebdb-f345-a18358a874e4@gmail.com>
 <af9db769-ad98-9dc4-ebd7-fc792a1c5e82@gmail.com> <Ys8BMbBPrKYq6S1e@zx2c4.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <Ys8BMbBPrKYq6S1e@zx2c4.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x236.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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



On 7/13/22 14:30, Jason A. Donenfeld wrote:
> Hi Daniel,
> 
> On Tue, Jul 12, 2022 at 05:31:27PM -0300, Daniel Henrique Barboza wrote:
>> CCing qemu-ppc and Cedric for awareness since I forgot to do so in
>> my reply (⌒_⌒;)
>>> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> 
> Thanks for the review and for forwarding this to qemu-ppc. What's the
> route this patch needs to take in order to make it into some tree
> somewhere? Can somebody queue it up?


I'll queue it up shortly in my ppc-next tree in Gitlab at

gitlab.com/danielhb/qemu/tree/ppc-next


After that I'll send a pull request get it merged with upstream. Probably
end of this week/next Monday.


Thanks,


Daniel


> 
> Regards,
> Jason

