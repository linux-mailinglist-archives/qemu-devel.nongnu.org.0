Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB953ED8BC
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 16:12:40 +0200 (CEST)
Received: from localhost ([::1]:43048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFdLz-0004Dy-9p
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 10:12:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1mFdKg-0002c0-82; Mon, 16 Aug 2021 10:11:18 -0400
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a]:41979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1mFdKe-0002IG-Jc; Mon, 16 Aug 2021 10:11:18 -0400
Received: by mail-oi1-x22a.google.com with SMTP id be20so26821299oib.8;
 Mon, 16 Aug 2021 07:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/sR3hoZ9UA6pFMmEoR9mIdcECv8wqeFUQJWMDOpuY1U=;
 b=ePrnsjun4a3+S7K5sn50+osrxFYzpjRva3+fRzlGpeXEdXay0XZWHvZte1WuH0fKkq
 iIgKPElzfi6dkRbj3Z2aBNDGxY+9pKmbeg6Bsz0FGz56WJeCGM2dEO8pHJH2D1U+4RsC
 3Lh4v+RzaM5fbkmeHwkWoB4Sd3lpj18Wd2oU7Wr9s8d4JiLi7WXYajvaQwQ/vmNA2wWq
 i1a24QoC/h4b4OVRGhwQgH8R9vzAa+iuEZOvJqGpvyQcZ4RS+yna4c9pHxGoOeHsV3xX
 GGdSKab/K39Jm7vGahbIY981AvewXBmqgb4YsXPkuMchfxYBswrXy5VKOZEh6z8fS5E9
 G+PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/sR3hoZ9UA6pFMmEoR9mIdcECv8wqeFUQJWMDOpuY1U=;
 b=JHrze7tnj9DiyTXCOn7EBBJ79U8zI1wOSUojZnIfBDveUp7dovljL9uzMLcPGd2cq5
 T/yEOLyRe8b/Rgn386yqWcZghRTyb967zvWjI4jjwUBEHYtn5Si0AxpwkgRaLJVyFpip
 lftuxrwJpF2os/2MP5J8oqVnVPBD+n9B2RjQ0dG3F6wd2w+bAasOw3SQVWfg2sffZb1W
 9148uZh/2+NDAEx5rl3zMcnQNqsVP5lzUSHpBGhtCIDLjgH2iJVEPzBDkPgOKaOGoO0p
 mgKpfh+DXPdDy/k1VjuV69p0bYOvkQbcBvupWP4cus5ViNTJBZOmSjnTr92zKa9LW4Ku
 iNRA==
X-Gm-Message-State: AOAM5313KYdnLazgJBJoQMlYFxtge9jUycXgQCsJ8Y1BXOlwtxMtQ2S6
 okgPD7Aa6MUczar10qhzWrs=
X-Google-Smtp-Source: ABdhPJxWg+UrgoLnk8s2x/NW2b3vJN1l/Eyj2+tx6yhwDJ1YNVSW5pk3JJoZSbG7fgth6r6/0PR4yg==
X-Received: by 2002:aca:170f:: with SMTP id j15mr11372128oii.151.1629123075211; 
 Mon, 16 Aug 2021 07:11:15 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 w9sm1357297oti.35.2021.08.16.07.11.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Aug 2021 07:11:14 -0700 (PDT)
Subject: Re: [PATCH] hw: ppc: sam460ex: Disable Ethernet devicetree nodes
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210816025915.213093-1-linux@roeck-us.net>
 <YRn6d/Vb10JTmZ18@yekko>
 <CAFEAcA-KSFuYbkbu7iBvgLxgBgBPRGeOgLuEuh5g5_MO4=Nk0w@mail.gmail.com>
 <6b0a3a08-a57b-fbb6-71d8-3760d76fd265@roeck-us.net>
 <CAFEAcA_CJXseGT6A36h86Tt7rrgy0T14kXAMGLmR=AgO5W78ww@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <1ac55b8f-db96-0747-5beb-2016ef4bb6b1@roeck-us.net>
Date: Mon, 16 Aug 2021 07:11:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_CJXseGT6A36h86Tt7rrgy0T14kXAMGLmR=AgO5W78ww@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=groeck7@gmail.com; helo=mail-oi1-x22a.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-3.71,
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
Cc: Greg Kurz <groug@kaod.org>, qemu-ppc <qemu-ppc@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/16/21 7:03 AM, Peter Maydell wrote:
> On Mon, 16 Aug 2021 at 15:00, Guenter Roeck <linux@roeck-us.net> wrote:
>> The controllers are instantiated (it looks like the Linux driver doesn't
>> really check during probe if the hardware is present but relies on DT),
>> but when trying to access them there is a PHY error. If a different Ethernet
>> device is explicitly specified and instantiated, it either ends up as eth2
>> or as eth0, depending on the driver load order. That makes it difficult
>> to test those other Ethernet devices (and with it the PCI controller).
> 
> I thought that code wasn't supposed to rely on the naming/ordering of
> ethX anyway these days?
> 

Depends on what you call "that code". I use small buildroot based root file
systems for testing which do depend on the load order (or, rather, on eth0
working).

Guenter

