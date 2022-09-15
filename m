Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4795B942B
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Sep 2022 08:14:34 +0200 (CEST)
Received: from localhost ([::1]:47760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYi8v-0000zj-AS
	for lists+qemu-devel@lfdr.de; Thu, 15 Sep 2022 02:14:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oYi2F-0006rN-N0
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 02:07:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oYi2C-0006gC-Ep
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 02:07:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663222055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4nWNy5D0cG/nmvk0A3A2prhlZB//7Uye6nH5DbOKMuk=;
 b=E8rt76eegXyMlztIM250eWFG5HsJEkcR/kNKjq8y7IUf/3CN7WhYs7bTZx3E2EH1Tys3Kf
 6evMyEWZcZK5ODzXa1/mPhRUDSxO5s8zuFXh9W+0bQxxDB2yHF/i56wD8PpKNs8olm7Iu+
 8BOTK8fu1u8Eo9wVkGlzs0kORnOInvY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-536-w6u1HQLgPh-dxGcs03HU5Q-1; Thu, 15 Sep 2022 02:07:34 -0400
X-MC-Unique: w6u1HQLgPh-dxGcs03HU5Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 b16-20020a05600c4e1000b003a5a47762c3so9108791wmq.9
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 23:07:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=4nWNy5D0cG/nmvk0A3A2prhlZB//7Uye6nH5DbOKMuk=;
 b=z1iCMhVbMrsuXR7XSdr0NCcaPb2xNbOM9xDR6LozquBQ09Kx74nsYdKIHZgL9VRCNJ
 SBHx+UrYIhD8TgdFhkLU23jTa8m4EeKz9r6T9VInXXmxbKP0RHBFAEdEwS508mQTNPI2
 CGIVQVpRPjnlkoe9ch0AcLblmxlsaLCWmw2ktaL4i3fI5+1Y8Jt0+V6IcfNWmLCNondk
 PsOkVk3PBegc0u2MrfcX9QLL8K4np2O6daL9FlmbNYpoTBVhnwP1Xw8j9D1slWmB5Y3+
 yo+fx1gb/jCXw+Uv1iAhBdEQoU/S3N1IdTVGvXRYRKFJpPdJd5UH6/SDy61E92dn+Gxh
 MFJA==
X-Gm-Message-State: ACgBeo3qAXapAEDMY1hQlphkSFv5f/A+Hw1QmKsLJPQ+zS1IAWXBvqbE
 P/TsEV6O0Q6kMQz9SHLXwSDvuWaoydB7k9s1PbW9A851p94lduPE452Fn7mIGMcmRIMUbVdD5OH
 8fxPyrdfE33aZn/I=
X-Received: by 2002:a5d:6849:0:b0:228:6461:592b with SMTP id
 o9-20020a5d6849000000b002286461592bmr23125089wrw.82.1663222053027; 
 Wed, 14 Sep 2022 23:07:33 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7Ncg79unBqBAiKJmGGqEmDjRaWfl3YRBl3qOQo8VuDMQUVY4WwlZP3UYyc2t4GWCwpPhGsAA==
X-Received: by 2002:a5d:6849:0:b0:228:6461:592b with SMTP id
 o9-20020a5d6849000000b002286461592bmr23125073wrw.82.1663222052840; 
 Wed, 14 Sep 2022 23:07:32 -0700 (PDT)
Received: from [172.20.194.41] ([79.140.208.123])
 by smtp.gmail.com with ESMTPSA id
 g6-20020a05600c288600b003a5c999cd1asm1841558wmd.14.2022.09.14.23.07.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Sep 2022 23:07:31 -0700 (PDT)
Message-ID: <61a6bdcb-d7c1-0b2d-ec07-2fd23fd0b636@redhat.com>
Date: Thu, 15 Sep 2022 07:07:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/1] s390x/tcg: Fix opcode for lzrf
Content-Language: en-US
To: Christian Borntraeger <borntraeger@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-s390x <qemu-s390x@nongnu.org>,
 Cornelia Huck <cohuck@redhat.com>, Janosch Frank <frankja@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Nathan Chancellor <nathan@kernel.org>
References: <20220914105750.767697-1-borntraeger@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220914105750.767697-1-borntraeger@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.583, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 14/09/2022 11.57, Christian Borntraeger wrote:
> Fix the opcode for Load and Zero Rightmost Byte (32).
> 
> Cc: qemu-stable@nongnu.org
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Tested-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Christian Borntraeger <borntraeger@linux.ibm.com>
> ---
>   target/s390x/tcg/insn-data.def | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Thanks, queued to my s390x-next branch:

https://gitlab.com/thuth/qemu/-/commits/s390x-next

  Thomas



