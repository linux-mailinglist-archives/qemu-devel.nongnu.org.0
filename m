Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFE440C296
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 11:14:10 +0200 (CEST)
Received: from localhost ([::1]:53062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQQzZ-0001Pl-Ud
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 05:14:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQQt1-0003If-Ag; Wed, 15 Sep 2021 05:07:23 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:34677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQQsz-0007c5-Dn; Wed, 15 Sep 2021 05:07:23 -0400
Received: by mail-wr1-x42f.google.com with SMTP id m9so2724125wrb.1;
 Wed, 15 Sep 2021 02:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=U7De9gyi9xPhvUagsve7h9eCcKKpY2sSmb3AGMuPBvE=;
 b=J2wZiF+VQFwUr0y2axBF0lHTHgx1865sfQCMDPXFjPZaiQvDTklK6fZL41bUOv2Q/W
 x1fb1AtZ06HxIMzlYmNuqQkAcVNpbVdTDFglb3lHCONszEgLlfZq7MB+MkMMfmaiQI8u
 IKwzcDcOns5lcyZnZ92AA5Et/MGJDEl0msMlZtsOQJCXNvccLE+9aymlus6lMsgzgwd5
 BsTNc0j0VxSz+T2t1DUUEr+04vwHYV9L3hGMt3mZtXsZbYiJGvUZNwQtELl84TzuFtdi
 7hAibTbzA3/1sl58v2YdRQZ7Sp8oFNFsrZ7EeK4uD2TXDc0KcYp54UUTuolKeG34TU8O
 8Vew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=U7De9gyi9xPhvUagsve7h9eCcKKpY2sSmb3AGMuPBvE=;
 b=PTuIjD8tEncdO6pmnB8PA1Gyl6hE5KA1ksunZn76OFtmIwreoa3TcKqkHYVlqwnshJ
 Kjd+Bt7veR/ov2GRa48Rte7Zlxp0Y+tpFIjBZQmDbnBYC5xxWKkEPqAIPLygFmf/6n4Q
 fuwBISD/wTJVJ+OF3rLR7JDJOqEDfAj8IFONTyFFb/ZwqXh+043BUZxmBoWJb1+DDdvc
 cvthrAU04ZAER4oWsLhbHVqqKhFrk6Lfh1pJMpykr8Hu7DUbC+dAPfamwdCTDw35JngI
 e2zuxJHzfph5zbkgUWwkMKpakPF41x2dWM7i9zrzcRttRyJGRoYRVNQcqSQdsmgSQO85
 /DXg==
X-Gm-Message-State: AOAM530ZDTc7t9IJ9cdVIAq+deUGfdwoTvNXm4fVZX5wFQO5SUcJxyyS
 mhC3CK6UdGsKbNTjy4TdXHxQYmrRrx8=
X-Google-Smtp-Source: ABdhPJxZDamEwlZVsMzyTQaeozwWTKc1I3crVPKoKoDCDDG+hs0K179xBrwqTBvhfVN0lIJYy7Smbw==
X-Received: by 2002:adf:d084:: with SMTP id y4mr3687447wrh.249.1631696837915; 
 Wed, 15 Sep 2021 02:07:17 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id e3sm16391741wrv.18.2021.09.15.02.07.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Sep 2021 02:07:17 -0700 (PDT)
Subject: Re: high cpu usage in idle state
To: Ali Vatankhah <alivatankhah72@gmail.com>, qemu-discuss@nongnu.org,
 qemu-ppc <qemu-ppc@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
References: <CABip9V9nwDNAEg-620hG2r5pyhw_rig+2nf9Ja3s=WA-wmH=jQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e53eecec-8897-767a-149f-51faffd76d67@amsat.org>
Date: Wed, 15 Sep 2021 11:07:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CABip9V9nwDNAEg-620hG2r5pyhw_rig+2nf9Ja3s=WA-wmH=jQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.969,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/15/21 9:46 AM, Ali Vatankhah wrote:
> Dear qemu developers
> I built an image for e5500 cpu with yocto and run with qemu ppce500 machine:
> qemu-system-ppc64 -nographic -M ppce500 -cpu e5500 -kernel uImage
> -initrd core-image-minimal.rootfs.ext2.gz -append 'root=/dev/ram rw' 
> It works well, but as the emulated guest is in idle state, in the host
> it consumes 100% cpu on one core. 
> Is this cpu usage due to guest idle instruction emulated on the host? is
> it possible to correct that?

It depends of:

- is your CPU able wait when there is no workload
  (Old CPUs don't have this ability and just keep running
   wasting cycles. Newer have instructions such "wait for
   interrupt or something" or "idle")

- is your guest using such instruction, or doing a while(true)
  loop while idling?

