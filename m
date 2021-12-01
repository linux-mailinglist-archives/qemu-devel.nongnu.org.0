Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD11646471E
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 07:21:32 +0100 (CET)
Received: from localhost ([::1]:57702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msIze-0003BW-NC
	for lists+qemu-devel@lfdr.de; Wed, 01 Dec 2021 01:21:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1msIxf-0002VC-KW
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 01:19:23 -0500
Received: from [2a00:1450:4864:20::432] (port=44005
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1msIxd-0001wr-SA
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 01:19:23 -0500
Received: by mail-wr1-x432.google.com with SMTP id v11so49694508wrw.10
 for <qemu-devel@nongnu.org>; Tue, 30 Nov 2021 22:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=IfLcb5ESZShRHZAZuOGbsS4+MDt/UR//+/kbT7UBzoY=;
 b=eQDkPgR0C28E7c75KIWYr/WZT1a3Bge59ljhfSjZ7mCIZ0WC7vvwjFafkjdnBicqtg
 t0z6kyOXd2IrA5MHxtSiYx4d1RmbGYJ9QdeFohaJkAygx22xsyXksY1axqSrFxdGT+J/
 9FLZjHTosbM03KC+66mrj2AlJcgFXWRyRq7IUahqugBYkQCJp+qQWm7PSZnd2ORVcGPR
 QfEG2oepxU55dbiDeixXTUixdYfMGOUnwsrZ2RzD8ahwGVh8bO1q7xjDzAcA5VD/XpyB
 reslq22ACVTny/5TkNlEuBlI1Hd5imDgo5Uie4Nz28Ut7OwXzvR2u4lE1raQzqrh2dyF
 stgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IfLcb5ESZShRHZAZuOGbsS4+MDt/UR//+/kbT7UBzoY=;
 b=dqCo3fbBoXNMZ7/6waU40utIJwZWCG283JiOjB+AIuXykPn5XOGZXcU+Wud3PeKgGi
 pdn68MQSDd9ksuMT0YvP2d4eCaY+76JpRXj4rlplXpD+M6XiChg11BTuhnw3Zor5YFXR
 Hr/hbcqC5tYeVp/FhWxcJlsplf+ZsLvv9VfFFm74yLz7xGXCpdt07c455/tiHbSTqUS8
 GA9h0Vzx6fj+oMTl9OrRm6k+jYKmCHLnYIzv3xRHDRa4uH+1BRjNukxuQ6LcmREgCgGn
 bnG/HJk5ZyBHOU9GLEbwiOZp8XpfHQbAbp6YuZcqnV/Nmk96Xk7jmVl5V14DtKW1Mh6l
 wMQA==
X-Gm-Message-State: AOAM532mUIPGLhglElmzOPvaLgtFDFeSfMUsWvYx24RZOoLy6zHranzk
 x3iBLz+8oi4kAPYDLiNYdRrJfA==
X-Google-Smtp-Source: ABdhPJyDqcy/EpxkZdCP9YjbG0JfjqOMf+mIwMYHrt6hDl7EzaJZNmMQzllqhfGEyFursfC5keOQJw==
X-Received: by 2002:a05:6000:1625:: with SMTP id
 v5mr4317473wrb.196.1638339560253; 
 Tue, 30 Nov 2021 22:19:20 -0800 (PST)
Received: from [192.168.1.147] (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id m21sm18506285wrb.2.2021.11.30.22.19.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Nov 2021 22:19:19 -0800 (PST)
Subject: Re: [PULL 0/1] MAINTAINERS update
To: Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20211130204722.2732997-1-ehabkost@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <03cee1da-334b-bd1e-ff38-84b40f3077d9@linaro.org>
Date: Wed, 1 Dec 2021 07:19:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211130204722.2732997-1-ehabkost@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.211,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/30/21 9:47 PM, Eduardo Habkost wrote:
> * MAINTAINERS: Change my email address (Eduardo Habkost)
> 
> Eduardo Habkost (1):
>    MAINTAINERS: Change my email address
> 
>   MAINTAINERS | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 

Not a pull request.  But since it's just one patch that needs no regression testing, I 
have applied it directly.


r~

