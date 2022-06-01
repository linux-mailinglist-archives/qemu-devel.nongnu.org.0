Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA6253A8E5
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 16:16:25 +0200 (CEST)
Received: from localhost ([::1]:38268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwP96-00057L-Qw
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 10:16:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nwP6z-0003yQ-EV
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 10:14:15 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:39495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nwP6x-0007wa-RI
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 10:14:13 -0400
Received: by mail-wr1-x42b.google.com with SMTP id x17so2558795wrg.6
 for <qemu-devel@nongnu.org>; Wed, 01 Jun 2022 07:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=npVHTx6BwpEI2nEjsjId7+qHUeMhxBBTihJblT2exqk=;
 b=aBxDZC1FanQCrjoZ4E2VQH0sO8ss7ixXIFF9DagBgB1tL9Au/NoTVspU0IzuYUdDpJ
 sXBNRu3piEqVLTYPsJOsTRCwVo5zFmpDwbZIa4uTtSlvX404Z6UMDjFZayCozA68nzt+
 t27T0ZzdpkMj+hoXeIrymqMSCuR3PG5qy9n+TD/9TAxoXYp6Z8H0y+WIWc7flxlF+wLW
 CV+YiTh4WxWvukz9neQBAeBuXPhaJVev4Agnv1IG0nQroIp4R/MS1uoiRxIAR3Lp4PiQ
 neDIhrU7YRt3+cstqUdD/cTqX0r3t6wOUr0XfBGHkzGBlTzRJINa7xKFgF/lkRInqTMN
 0AbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=npVHTx6BwpEI2nEjsjId7+qHUeMhxBBTihJblT2exqk=;
 b=su5hrOeu2b9jDqipl8MpjIPeATeY5m7pbFKb9IGEC7T/9PSIoe3e/IChcvTbPTt3NW
 gJLwlUtZBXlxNnJouVZ0J03zPmkOPTez+QD9qRJzPzzvXELDxuOKKu0JVK+PPp2faNGL
 sr0SI99lMGFWmQgJVhoH74AScVKtWikKH+mJs7I4NbGvBvW7fOq3qOtObsG28i/dK7h8
 eMzx26S2/0vfh/CXJg4MHzIG3B1Uew3pehmWwNXiB4nob3ye8nQo6DZdQV5Ue5N8rh1O
 IAVFCc+J5zX/BROJmhVbpBnmh5FALu7BwgirvKouB0FeZhRX6RfC9ljAoNzemLbP5exY
 M6eg==
X-Gm-Message-State: AOAM533Pg0Co65TU4ZedTG8MaloRSOHjvFs2SnW3xZE3DFey4Il+GxHu
 dHAj7PEyoEUivt1M4LAMXrc=
X-Google-Smtp-Source: ABdhPJz6OgG8PTlsYintyrIrlaVACC67+WDdM0HFzODFPGnjMZgzQrk7SOWT2M5bC3G/j0GgzBO26g==
X-Received: by 2002:adf:ebce:0:b0:20d:7859:494d with SMTP id
 v14-20020adfebce000000b0020d7859494dmr11940wrn.590.1654092849898; 
 Wed, 01 Jun 2022 07:14:09 -0700 (PDT)
Received: from [192.168.1.82] (26.red-83-50-226.dynamicip.rima-tde.net.
 [83.50.226.26]) by smtp.gmail.com with ESMTPSA id
 j26-20020a05600c1c1a00b003973e27b789sm7437224wms.27.2022.06.01.07.14.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jun 2022 07:14:09 -0700 (PDT)
Message-ID: <07721a70-14f0-5609-2150-9c2955010d56@amsat.org>
Date: Wed, 1 Jun 2022 16:14:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: Types?
Content-Language: en-US
To: Kenneth Adam Miller <kennethadammiller@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <CAK7rcp8ukcpWLgcDozdMBnzrOh-qq_b9bkukBNqXYb=XbUYr+Q@mail.gmail.com>
In-Reply-To: <CAK7rcp8ukcpWLgcDozdMBnzrOh-qq_b9bkukBNqXYb=XbUYr+Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

Hi Kenneth,

On 1/6/22 11:28, Kenneth Adam Miller wrote:
> Hello,
> 
> I am working on a qemu target under development. and I am wondering how 
> I should differentiate the MachineState from the MachineClass.

Look at QOM documentation:
https://qemu.readthedocs.io/en/latest/devel/qom.html

MachineClass is the interface to create a MachineState object instance.

There is at most one FooClass registered. This class can create multiple
FooState instances.

FooClass fields are usually read-only, as modifying them would affect
all FooState instances.

Maybe start looking at hw/avr/arduino.c, which should be quite easy to
follow.

Regards,

Phil.

