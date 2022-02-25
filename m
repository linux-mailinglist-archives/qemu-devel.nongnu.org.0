Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA67F4C3C77
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 04:38:42 +0100 (CET)
Received: from localhost ([::1]:47234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNRRJ-0003fc-Mi
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 22:38:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nNRPh-0002tN-In; Thu, 24 Feb 2022 22:37:01 -0500
Received: from [2607:f8b0:4864:20::62f] (port=38776
 helo=mail-pl1-x62f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nNRPQ-0004aI-Rq; Thu, 24 Feb 2022 22:36:46 -0500
Received: by mail-pl1-x62f.google.com with SMTP id m11so3682411pls.5;
 Thu, 24 Feb 2022 19:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=x9jeapprFa4Ot11+WrwuDjIQF4aWPgBZK6dfh3JGtlA=;
 b=drYROIeHuUTxLgzFN+yTzzk8Yf365zr+d2chD+7xxOd75jmN94EZaygfq6K6UtQ734
 HerHGAaIXcF9E2EswWW05Td/hQDowfpRFVJ736TGjJPt3EvIVVLfkNgzJdO87XnUbDOo
 K4DmAyQqFdFPGs1XfejLum0Z826+l4ambf8P0/S+lhmi0mKFalT3UzJSnj7/ZVVo33c5
 TaJjenRVbRp6PyV4ujJbk5FumZUbCzhZKkEry1WAg1pIjRoNUhgTpaDdf0829qKJ1/+U
 wV9627M5tr8hflNhDuTpC+ghFfS/rTsglWUUgjQzEP0iMheIoAYMoR8E4vYx01tkDyzC
 i2bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=x9jeapprFa4Ot11+WrwuDjIQF4aWPgBZK6dfh3JGtlA=;
 b=IPX6PDGK0jH/ETqfN4L4wKhYDbHEOY6fuW8BhRFnlPM83IH7Jrh7ydyvQU1xDVXqsz
 Ii4et7DR67JOkUlQKvuY2sw1vHB5Jm1Pz4uZhcuE9rxVHccLyKS4WJtQom/sXS8DOGiL
 mU7cFlSaWHCFsNQm0loSDsNmBNM6SDtp280v2E5N9Fq6IeQ1mE5/difLkxi35XgYRfIY
 hj4PCVC8lIaEiapgn+xDSk2TvFR8/qlmJJ2sgfTcGuppxmaBHukMPHD9krxhgB27TyVW
 KVNpGRtNraDwd7tqmy1BdnrSy48l3PVbpkqVqYFiXMENJe2HCPDkfHC5OK1QRJiSyP1F
 l2wA==
X-Gm-Message-State: AOAM530s9e4eEPqVbVwxaPXkvgnAclU7fuM2zBytiOrXrFGH9QNTBoAI
 sgQkLTtMYAJY4IqKW9w7edE=
X-Google-Smtp-Source: ABdhPJy2YsLj6movcSTrGJRRPIQ0KmTp8WcGHF6VVCf5eK+yCLyk4FaceOhnjEcOOiOcdBj7yAPFkA==
X-Received: by 2002:a17:90b:4f4b:b0:1b9:3798:85f8 with SMTP id
 pj11-20020a17090b4f4b00b001b9379885f8mr1241067pjb.139.1645760201295; 
 Thu, 24 Feb 2022 19:36:41 -0800 (PST)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 d7-20020a056a0024c700b004bd03c5045asm967835pfv.138.2022.02.24.19.36.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 19:36:40 -0800 (PST)
Message-ID: <9223d640-3f50-1258-1bdb-e3ca5d635981@gmail.com>
Date: Fri, 25 Feb 2022 12:36:40 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2] target/arm: Support PSCI 1.1 and SMCCC 1.0
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220213035753.34577-1-akihiko.odaki@gmail.com>
 <CAFEAcA9eXpxC7R_qcDsBh4C9Aur5417kTzAhs4c7p2YRCFQUKQ@mail.gmail.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <CAFEAcA9eXpxC7R_qcDsBh4C9Aur5417kTzAhs4c7p2YRCFQUKQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2022/02/24 21:53, Peter Maydell wrote:
> On Sun, 13 Feb 2022 at 03:58, Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
>>
>> Support the latest PSCI on TCG and HVF. A 64-bit function called from
>> AArch32 now returns NOT_SUPPORTED, which is necessary to adhere to SMC
>> Calling Convention 1.0. It is still not compliant with SMCCC 1.3 since
>> they do not implement mandatory functions.
>>
>> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
>> ---
> 
> Applied, thanks.
> 
> Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
> for any user-visible changes.
> 
> (I noticed while reviewing this that we report KVM's PSCI via
> the DTB as only 0.2 even if KVM's actually implementing better
> than that; I'll write a patch to clean that up.)
> 
> -- PMM

I don't have an account on https://wiki.qemu.org/ so can you create one? 
I'll update the changelog once I get access to the account.

Regards,
Akihiko Odaki

