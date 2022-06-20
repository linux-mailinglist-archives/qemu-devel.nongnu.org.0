Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1936E550EFC
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 05:39:53 +0200 (CEST)
Received: from localhost ([::1]:37464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o38GW-0005BQ-7B
	for lists+qemu-devel@lfdr.de; Sun, 19 Jun 2022 23:39:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1o38ED-0003bb-V1
 for qemu-devel@nongnu.org; Sun, 19 Jun 2022 23:37:29 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:46736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1o38EB-00013G-GE
 for qemu-devel@nongnu.org; Sun, 19 Jun 2022 23:37:29 -0400
Received: by mail-pg1-x52e.google.com with SMTP id l4so9117988pgh.13
 for <qemu-devel@nongnu.org>; Sun, 19 Jun 2022 20:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=7nGVW0pylIFEREoosLR1lEMItd5bmCoMYTCv+D3bZao=;
 b=jN61u+SmLAnZkW4ilCBl+FprLrxumRZ2vy8sD7VdBvXTx5EHV5WzuW9vZYVsiNhU2r
 IpVjPvvvflbeMT+oAJGmHhJ+ECTDtxg5AgP1srvSF+/Vgo2L6jfSxJOQk3X7kVDsTPK4
 2FWyEJ4cfdqgKAC+8004bHEpzA1tyLipcE2k/6q8sLOoYvJ0jSeCB0D7NH9cSmdIQpps
 vJU3XN+WcysKXY63VBsyVfLXhVeU31NOvbtEGIDfZj575w6iyVqbDdq1ObCW1lumct6R
 vc32PGJM0zXabKTfTFi17HU54v4EcTQBblCyhx++wkBXWIyPAavZ1Oj2lhC0IcZLV0KK
 MgfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7nGVW0pylIFEREoosLR1lEMItd5bmCoMYTCv+D3bZao=;
 b=j0gtn3Tb8P2JmdtrKT6/rzE7QJigx9VZhoIYDZz2ACJdJK+SW0kcy7CyIixA2gaCeL
 03rvDm7ZeWycwIXieGfw0X8ix3lOM3ULE3jYo1zDvr8wJolVZhFaLjvY1SY0JHKm7KTU
 Xpq1S4p83nPi8m6jstzCxHKxKDpNn04lDRGrTqHmwGQWa5PNcGLIzxa9+XbZdX0L7Ouw
 5/rWNnXMd4zbKqMjUFw6ZkEJ7bLfSBjfhLwSHh1xxrzuDurinN6IzOWiIZR+15d78qGf
 jsXb1lMu+zgTFxuIl8GmIH3yBiI+QiotpfdVZJauZY2IoWXBTBEQn3tF5D2+Uq+OC92P
 LtJw==
X-Gm-Message-State: AJIora+kCtcyFthLO9hWN3/rp60gRYfy3ANz6H0RwJU5vL6KyncS9J32
 HyY6gdxTKassJ0jUnPSIvyYm6g==
X-Google-Smtp-Source: AGRyM1tI8vucDFAyArE3vqWzzg1kwyVMY5+9Mx9DsuZoBua0Qt/+WPFG+vYyShGtOqvA6PxG5oUSug==
X-Received: by 2002:a63:f312:0:b0:3fd:12b7:193b with SMTP id
 l18-20020a63f312000000b003fd12b7193bmr19485139pgh.9.1655696245114; 
 Sun, 19 Jun 2022 20:37:25 -0700 (PDT)
Received: from [10.61.2.177] (110-175-254-242.static.tpgi.com.au.
 [110.175.254.242]) by smtp.gmail.com with ESMTPSA id
 d20-20020a056a00199400b00518d06efbc8sm8138658pfl.98.2022.06.19.20.37.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Jun 2022 20:37:24 -0700 (PDT)
Message-ID: <efa3a569-2533-0156-2dbb-c4ffd21c3b38@ozlabs.ru>
Date: Mon, 20 Jun 2022 13:37:20 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.0
Subject: Re: [PATCH qemu v2 1/2] ppc: Define SETFIELD for the ppc target
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
References: <20220617060703.951747-1-aik@ozlabs.ru>
 <20220617060703.951747-2-aik@ozlabs.ru>
 <14983389-aace-f030-65a8-2234b94952bd@gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <14983389-aace-f030-65a8-2234b94952bd@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=aik@ozlabs.ru; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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



On 6/18/22 02:50, Daniel Henrique Barboza wrote:
> 
> 
> On 6/17/22 03:07, Alexey Kardashevskiy wrote:
>> It keeps repeating, move it to the header. This uses __builtin_ctzl() to
>> allow using the macros in #define.
>>
>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>> ---
> 
> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>



soooo I do not need to repost it, right?


-- 
Alexey

