Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B6940B3CD
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 17:55:24 +0200 (CEST)
Received: from localhost ([::1]:60284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQAmI-0003PY-RM
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 11:55:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQAH0-0006YV-9E
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 11:23:02 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:39843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQAGx-00038g-Gg
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 11:23:01 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 c13-20020a17090a558d00b00198e6497a4fso2414916pji.4
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 08:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pkgjLpitsHJMhDXArCswox8AfpKZOBwtH5nrcktpw6M=;
 b=qx/iztLHMvW9e5Y9fsukYzn5C1B1MhPA1Ru0PaPQULOXhEvi3MCGWo4suLtwss9HO0
 Elt3c5W8VCn0K71hZrvijlaU8QUIiehws6V8ibAqUnBsqwQBQRGaPWLkJKZCwwyHPw3f
 TjSJffDcPvEVLFJ9VcjhvlwFbRelnC7om8TY9d5CeQhB0eCJeIJgoFA6cc+EdHszjYDL
 KScT/tJmn83Np8dG9spSDjzmQI39fJibpuP4j6LSQ+t1rRIK+5c1o1v9vDaiwFW0p7t9
 0ac6EWNqjDOyopHxC3BqOq2No+SLXY8XyLYATnmNsCenSDEm25MRPVZLgjW9sdw9vpfe
 W9zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pkgjLpitsHJMhDXArCswox8AfpKZOBwtH5nrcktpw6M=;
 b=lehHcj4mwqzt7QGAptiHM+N7N6WCYZHovInoslnOtNxi7nKY09rjZd2350yfoMN20M
 I3nw54eF5MmonCs57QEwTwatwe1qovXfwguEKOwtSiD2kV+1jvNWfc+caAWIMbHzKM/I
 00ly2O64puwuZGkMwtnyIcM453fGlNP0mbMVUvhwTabznGCCymgedmaBJ4WFKXDcjgOL
 Vdb+hguQL3y1vYV+wccTWHItjM7VMrRyXyE4Yw3Ay5+6fkR0wjzum6qDX48RvLZkcUNE
 GYfK8wgddfkoMBgg/npxEoJhnlja7gLXfNQ+0s5W1mXcBDy8aOnqS2nv00f81VN2Vu4f
 wwNw==
X-Gm-Message-State: AOAM532+/re8k4BpdeJPhV3mPF0MwIw6j7QcbwzLzkSR8iuLu0PNIiue
 JHXY3N7tkkuwAdOhYDFRJyK24g==
X-Google-Smtp-Source: ABdhPJxILJALrmpPUm6uy8TAXUqh0RbS92lb03ZDl+U3ULkA18Kbbyyit9P072O837nzi9I91UKK8w==
X-Received: by 2002:a17:902:6e02:b0:137:b47e:d779 with SMTP id
 u2-20020a1709026e0200b00137b47ed779mr15447944plk.50.1631632977764; 
 Tue, 14 Sep 2021 08:22:57 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id f6sm2090403pjo.0.2021.09.14.08.22.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Sep 2021 08:22:57 -0700 (PDT)
Subject: Re: [PULL 14/14] hw/arm/aspeed: Add Fuji machine type
To: Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>
References: <20210913161304.3805652-1-clg@kaod.org>
 <20210913161304.3805652-15-clg@kaod.org>
 <88c26520-6b87-e7a2-ac78-c1c92477c814@kaod.org>
 <BBC4A4E0-651C-41DB-81DE-1F6D86AABAB1@fb.com>
 <CACPK8Xdey9_x-ZN1JbgFyTrW59EapH4xcqYbyNQxyQ5t0uWPvw@mail.gmail.com>
 <CAFEAcA8ntPE3GkTNU8bSBhCWzk_jdH4QR1kDgwo6deQ+T1iOKw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1949e204-1bce-f15b-553b-1b42b41e3e08@linaro.org>
Date: Tue, 14 Sep 2021 08:22:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8ntPE3GkTNU8bSBhCWzk_jdH4QR1kDgwo6deQ+T1iOKw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.969,
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Peter Delevoryas <pdel@fb.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goate?= =?UTF-8?Q?r?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/14/21 5:26 AM, Peter Maydell wrote:
> (2) RAM blocks should have a length that fits inside a
>      signed 32-bit type on 32-bit hosts (at least I assume this
>      is where the 2047MB limit is coming from; in theory this ought
>      to be improveable but auditing the code for mishandling of
>      RAMblock sizes to ensure we weren't accidentally stuffing
>      their size into a signed 'long' somewhere would be kind
>      of painful)

Recalling that the win64 abi model is p64, i.e. 'long' is still 32-bit while pointers are 
64-bit, how close do we think we are to this being fixed already?

> Even if we did fix (2) we'd need to compromise on (3)
> sometimes still -- if a board has 4GB of RAM that's
> not going to fit in 32 bits regardless. But we would be
> able to let boards with 2GB have 2GB.

I'm not opposed to deprecating 32-bit hosts...  ;-)


r~

