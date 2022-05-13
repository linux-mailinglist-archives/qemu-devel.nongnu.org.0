Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B13B552659A
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 17:05:01 +0200 (CEST)
Received: from localhost ([::1]:41814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npWqi-0003GB-LO
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 11:05:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1npWpL-00025u-M5
 for qemu-devel@nongnu.org; Fri, 13 May 2022 11:03:35 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:43615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1npWpH-000197-Mh
 for qemu-devel@nongnu.org; Fri, 13 May 2022 11:03:34 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 l7-20020a17090aaa8700b001dd1a5b9965so8033456pjq.2
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 08:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=jCcDkes7W//az2PBlVukhfo1pIhUBIzGo0vDszYbD1Y=;
 b=kuUi9t6dVvEAaDsCPflEF0tnOo4lvz6UJKLDniVnDgXvWhXaCWKNV/L8Pl/chkDc3n
 buQNSmFdSuybZnjBTKyCjCO9/M7gfqC3qYCwtyUU6eDwmWQZU2ydUaaVjesnEYCvwdS3
 tymbv5+vEcc98pjR0RqVB5v6NHc2wGbIOKYQaiuFJpm3yghBxrF1ZaemJ+4MhupsUvmQ
 0RtAfsxssduuNhil7WAx8+wYQELOer8ZN9DgqkcvbQa8r2H0xlQa/8uBZXRjvooVIOnQ
 1fbVDbqclnhYtZSJ6MnqJBr28HnHx04xjs/dTy7QMs1TJfiLqkqnGTy+tb0YmWFiJYu+
 EUaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jCcDkes7W//az2PBlVukhfo1pIhUBIzGo0vDszYbD1Y=;
 b=uqwVd1knY7RThUixZ3hEF2wD2ZInQhAbKemLyJh//vl6RuOnzUzz2vu+mKiYs7m9my
 /hPJZUIexpf/se1miKr9sOZpHeKgJJ5AfiC14j0TucfKSiYXOdqQNqbTI2qWvXGN0t81
 rtxYzehxLFeXPVO3y38lSNrwYajQZDlkrAm84tEqs1KidFj9Ne4wpcnaKz7X6uO6xHit
 wcY9W+T917LxH/G5XB5azzqjJZJQVKT3MiZ7Z8V6v98K3aEUcT5JlvcrAUVYahp+ef8o
 faNBlT6YznQvz8OSAC9TUy1Cxs/UVagl3zTUqfztOii5wQ5bXCOPykHJGOTxMKc8QkY7
 KbRA==
X-Gm-Message-State: AOAM532YagiHCVxUID/2jn1uno7esUe0Z1LPfue1n4nKGQtjy4ac/BFg
 v3unUPtKJYTm76B4T93+vG/EQw==
X-Google-Smtp-Source: ABdhPJzNWxDTscxADM5xo8fplsKjLGB10v4Lg9tUC3x/qLwNg9uJS7uHUJB1mcQA1GE6UiPjqnKxBg==
X-Received: by 2002:a17:902:7402:b0:15e:d84c:260a with SMTP id
 g2-20020a170902740200b0015ed84c260amr4922957pll.80.1652454209526; 
 Fri, 13 May 2022 08:03:29 -0700 (PDT)
Received: from [192.168.66.8] (50-78-183-178-static.hfc.comcastbusiness.net.
 [50.78.183.178]) by smtp.gmail.com with ESMTPSA id
 a30-20020a62d41e000000b0050dc7628130sm1942223pfh.10.2022.05.13.08.03.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 08:03:29 -0700 (PDT)
Message-ID: <9dcf48dc-3c58-d78d-d3c3-26c010a5fddb@linaro.org>
Date: Fri, 13 May 2022 08:03:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: sbsa board boot with neoverse-n1
Content-Language: en-US
To: Itaru Kitayama <itaru.kitayama@gmail.com>, qemu-devel@nongnu.org
References: <CANW9uyswqzNGwkzbbNK_OcA-eF6Uf+Q3EkWgJrz2CudvQW4yPQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CANW9uyswqzNGwkzbbNK_OcA-eF6Uf+Q3EkWgJrz2CudvQW4yPQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 5/12/22 22:59, Itaru Kitayama wrote:
> Richard,
> I'm wondering what options you use to bring up sbsa board with neoverse-n1
> as I am only able to do it with cortex-a57, no other CPU types works.

I didn't attempt to boot it, because I don't have firmware for it.
I only added it to the list of cpus that would be accepted by the board.


r~

