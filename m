Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB7D4EC60B
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 15:56:27 +0200 (CEST)
Received: from localhost ([::1]:41408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZYoE-0001w1-H3
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 09:56:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nZYEg-0007C2-Vu; Wed, 30 Mar 2022 09:19:47 -0400
Received: from [2607:f8b0:4864:20::f33] (port=43529
 helo=mail-qv1-xf33.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nZYEb-0001O7-9S; Wed, 30 Mar 2022 09:19:42 -0400
Received: by mail-qv1-xf33.google.com with SMTP id f3so16758447qvz.10;
 Wed, 30 Mar 2022 06:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=sR3/cSIIxesi+h5rmG/bvJr8psg49kwOrfNyO+2JKF8=;
 b=QIY6sqiGFJzsNUMXzhlxlpZHjjpVuY4TZ/tqBjTFxudF+QAyHeWLIoYzFQElUP7zah
 0X8EnQggt1Ajsqpj91y2ApXNDEBExBvaw7yI5pBb5NEoz+4PUrttfixVWpE7S71S6R/K
 VGidcxpAzi+YAUqFUxLkwH5yYiCRHggCySL3dHHQ4/9itk8JDbRb0vppNokfr+/92pOQ
 ccj+53YcVWdR6C8rNh6hNvupfrLzFl3BUidQPg4A/Z7NroDkoG0Y12ybSX0rdtY+dDAW
 9lKcCKlnQQ/cEZHfv9zoWCeg18JU8XAsIArnPvRO3p7qSKFaoyDgK+P5yw7bFgYmKlK4
 rSLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=sR3/cSIIxesi+h5rmG/bvJr8psg49kwOrfNyO+2JKF8=;
 b=vYFnHRb9pqxgSJhNNqBsN0ZmApcG1v9MOXHXqr4PDscoXupRiNQqoSCl5kFKcDAWgV
 7O9Z0+jYjGwbO21sZ/qyZD/t5agBDNUMHllgvHmfKR+mEgycXBeHhaO/70ucgxAT9AJ9
 yCFoqrjpvXtInMo0/TGRL6tmSlblYWIy0X8PX3aXVfCinRWtxHflL4qubBmNJcKKepg3
 0eJNoolMkpf69WRMzzbGtMGJHakWtiViaZIZhhJi6VX7VXySjc1kjs88pd6Ly8ftlUQ/
 15lYCmoHuzAoc1NSwhWPFm9iviihHCJoDW6759S98s75w284YcabbpRb+1HhShVhJz+M
 0o2A==
X-Gm-Message-State: AOAM531CNAPnPF7ieLu9oOWKTyrcQtRUiP31Dur2dyu7GhjMsEJssdzz
 9jR/ssfXoBsHNLc3KQ7b+mo=
X-Google-Smtp-Source: ABdhPJx4qRQy1gMJrzIFPB6gA/HvaUUmNPw7U+sUJ+GPGT8SblIhJKAkAb4Ei6mCsaYxc2WZsqFPwg==
X-Received: by 2002:a05:6214:2aa4:b0:440:f5fc:f1c4 with SMTP id
 js4-20020a0562142aa400b00440f5fcf1c4mr31276434qvb.104.1648646376008; 
 Wed, 30 Mar 2022 06:19:36 -0700 (PDT)
Received: from ?IPV6:2600:70ff:f07f:0:403e:ab57:ee68:20ea?
 ([2600:70ff:f07f:0:403e:ab57:ee68:20ea])
 by smtp.gmail.com with ESMTPSA id
 br13-20020a05620a460d00b00680d020b4cbsm5443687qkb.10.2022.03.30.06.19.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Mar 2022 06:19:35 -0700 (PDT)
Message-ID: <212de8fd-2a18-fd54-201f-1119d1c7f992@gmail.com>
Date: Wed, 30 Mar 2022 15:19:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH] MAINTAINERS: change Fred Konrad's email address
Content-Language: en-US
To: Fabien Chouteau <chouteau@adacore.com>,
 Frederic Konrad <konrad@adacore.com>, QEMU Trivial <qemu-trivial@nongnu.org>
References: <1648643217-15811-1-git-send-email-frederic.konrad@adacore.com>
 <CALQG_WjoK5QRNZWbz+7ZgRCPw7gUJy3J-tSZ7Mnz5RXqY+xZnA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <CALQG_WjoK5QRNZWbz+7ZgRCPw7gUJy3J-tSZ7Mnz5RXqY+xZnA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f33
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f33;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-qv1-xf33.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Frederic Konrad <frederic.konrad@adacore.com>,
 QEMU Developers <qemu-devel@nongnu.org>, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing qemu-trivial@

On 30/3/22 14:41, Fabien Chouteau wrote:
> On Wed, Mar 30, 2022 at 2:31 PM Frederic Konrad <konrad@adacore.com 
> <mailto:konrad@adacore.com>> wrote:
> 
>     frederic.konrad@adacore.com <mailto:frederic.konrad@adacore.com> and
>     konrad@adacore.com <mailto:konrad@adacore.com> will stop working
>     starting
>     2022-04-01.
> 
>     Use my personal email instead.
> 
> 
> Reviewed-by: Fabien Chouteau <chouteau@adacore.com 

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


