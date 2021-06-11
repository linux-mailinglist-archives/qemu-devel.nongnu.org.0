Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D53543A46F7
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 18:48:36 +0200 (CEST)
Received: from localhost ([::1]:40930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrkKh-0002oA-Uf
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 12:48:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrkHr-0007zY-C2
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 12:45:39 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:51166)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrkHp-00081F-PM
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 12:45:39 -0400
Received: by mail-pj1-x102f.google.com with SMTP id g4so6033075pjk.0
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 09:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nes8B73Yhx1BNzt067IMJZV8+AQg9T/zIQOWHxYekB4=;
 b=qt4myICvsDlLJl7VC99xkw0JaIsitvxyCFuucpiDKQ9bXaWe3E+ZyD2cpZod8cEHkL
 q3LX0VksrILzVfi81qWeFtpj3XOH6Tyws9+kKYLNg6GJWLCMIHnJjydEDQuuHwJmNZO+
 j8G1GDQ3/1T38yLqE+0fZBTSEU3Ib3i1M2+uR4GkJQbSp0MrE9MQH6TIMQerjufaEcUs
 iHB92HvWSpvKn+Zgw/NV4dmf5S82fWVtkuOXSQ899KZdiGTavLFGyVQya53LWLLnC6wu
 Vf8WVgw3+fYVRsCgDCxPEv/2KnKxLablkDODnRgv02zfuxTqOVaPKcYqgfKjMQgQwYWS
 pQ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nes8B73Yhx1BNzt067IMJZV8+AQg9T/zIQOWHxYekB4=;
 b=n2NLBzAzWo5JKmcCrBOREDGvfcaw26AwRc0d4mo8G4DpY0BAPi5BYck8eFKRgfSu4x
 b08aoroL21ULuVobxcC7uBP0B+70065B5H+v8DPXowcZW93Fut4O1QmA8ySY76yumUK1
 5tO8XYSJaSYPPJLakEV4NLXW9qxgJeZyUEcjwU7SKv/WHl+dqfzN4Pyl0wHoPmwnAizz
 uvqwVHmg0zHr/HLZON6jozh2JnOB4+GwMKX0lDY5dGE+1zOGCBWCNTcNaTPEXx1lfhim
 Tq+b0FRU1yYHUV3oj0z04JlkTKkiM5VKql220ljqplbrDEa18XxzwVm+PMhi8Afg9MaW
 vwmQ==
X-Gm-Message-State: AOAM530d4EI5nrd5yX6t7zxHRfrWNA/ZUi42QvJYSeP8K0yNtS0baUeg
 CppCAv/YPsaArxQH2pRURY8rGg==
X-Google-Smtp-Source: ABdhPJwrzwq2IzLJXXSmp942JW8Lep1uzW8MsTBS0iUSuJuR3U89OdjmT3jl98MM1x7k/4QsnrnKqA==
X-Received: by 2002:a17:90a:4410:: with SMTP id
 s16mr5169196pjg.25.1623429933135; 
 Fri, 11 Jun 2021 09:45:33 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 j24sm5352464pfe.58.2021.06.11.09.45.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jun 2021 09:45:32 -0700 (PDT)
Subject: Re: [PATCH v3] docs/devel: Explain in more detail the TB chaining
 mechanisms
To: Luis Pires <luis.pires@eldorado.org.br>, qemu-devel@nongnu.org
References: <20210601125143.191165-1-luis.pires@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <09511b32-e56f-e448-a826-c049c70cc538@linaro.org>
Date: Fri, 11 Jun 2021 09:45:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210601125143.191165-1-luis.pires@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
Cc: pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/1/21 5:51 AM, Luis Pires wrote:
> Signed-off-by: Luis Pires<luis.pires@eldorado.org.br>
> ---
> v3:
>   - Dropped "most common" from the sentence introducing the chaining mechanisms
>   - Changed wording about using the TB address returned by exit_tb

Thanks, queued.


r~

