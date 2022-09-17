Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8942F5BBABA
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Sep 2022 23:42:22 +0200 (CEST)
Received: from localhost ([::1]:42542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZfZt-0004FR-Lb
	for lists+qemu-devel@lfdr.de; Sat, 17 Sep 2022 17:42:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oZfYa-0001yZ-5Q; Sat, 17 Sep 2022 17:41:00 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:51817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oZfYX-00009y-PY; Sat, 17 Sep 2022 17:40:59 -0400
Received: by mail-wm1-x332.google.com with SMTP id o5so14172234wms.1;
 Sat, 17 Sep 2022 14:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=8RMSDRDBTilJJsYB3FelQYu8TMMgY7ka7A2MTeLIpeE=;
 b=PkUIk2me5Wu+5ti4s2B0D+nRFoHTDJjK5GD68bi1O7bpSX2/ultIZp/vrP97Dv8sJu
 woGQGHdWktwldS4Gd0t3MZ9Boe/DN9fslMf6IsYqWxZh0kSoe9D0YkfYqu4bThd1yh/y
 kOfyW+tjqGy+APgwQX+LDZa1+rqzTVYc7AsLrUN+VrYIsnVnd+NH2pwnK2wK/CE0NPIU
 fLldofartxrhuZ8M078uvTvDHKoXzKu+5C3sngA3wUOJu5JTkldMs2MDjzKpmyXHyC1G
 38YT8Ugro4eq9i4T5jd7FjqEZwxo8rquNJ5j4c1hQ9wvsIIgw+E9SkW/a+ghamKGf6fs
 ar3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=8RMSDRDBTilJJsYB3FelQYu8TMMgY7ka7A2MTeLIpeE=;
 b=Vf6S8VMk7Krt6rCwHlIfiQx9Nd499GhudfrlKVb53JWIQgDBFKpttg+I3MQgtiPssB
 V+BOSJbkYfALVSimwT9P/Bqu48xhzcUF+a0T1U8lPV4bDGOtgXuz4hcij9M9Gjhit3xx
 mg75SwQJSz025Lmm+IZ5YA8br5Ug2ATVVuS7qSXG4Q0XEIYRQoCTPlIqXXUV/qP045Ns
 AGVONIfpy/JZAaQRc/V9brFbdQfoU0tgGQZWduf25cOCuzLaopqc0huppMVdRkzX6jKs
 rzAdNQtcDCnu2jQDi80YO0oa79TIeSgqMZvYSFCtWLlbtYxhK5jU6Og1nq/jxZjTWfwi
 MimQ==
X-Gm-Message-State: ACgBeo36TAQ8hDNAdRyV0wsZB4K6ieUqDIUDnsx40S/zvf5sbZkAxBCH
 V4RQhRmn98mtH6MrsJ26nOM=
X-Google-Smtp-Source: AA6agR66ELxO+fh+H2ZsBKFH5OxubO9iNE+uujVhpoJ+g3fOc1m2VLpylVswDdNJeTyX9GT94CXDiQ==
X-Received: by 2002:a1c:4c02:0:b0:3b4:9249:3539 with SMTP id
 z2-20020a1c4c02000000b003b492493539mr14412835wmf.128.1663450855823; 
 Sat, 17 Sep 2022 14:40:55 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 g8-20020a5d4888000000b00228634628f1sm8737580wrq.110.2022.09.17.14.40.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Sep 2022 14:40:55 -0700 (PDT)
Message-ID: <abc7f51d-d65c-2cff-a182-78333bddb233@amsat.org>
Date: Sat, 17 Sep 2022 23:40:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v2 3/4] scripts/ci/setup: spice-server only on x86 aarch64
Content-Language: en-US
To: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Daniel Henrique Barboza <danielhb413@gmail.com>
References: <20220914124153.61017-1-lucas.araujo@eldorado.org.br>
 <20220914124153.61017-4-lucas.araujo@eldorado.org.br>
In-Reply-To: <20220914124153.61017-4-lucas.araujo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.529,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 14/9/22 14:41, Lucas Mateus Castro(alqotel) wrote:
> From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
> 
> Changed build-environment.yml to only install spice-server on x86_64 and
> aarch64 as this package is only available on those architectures.
> 
> Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
> ---
>   scripts/ci/setup/build-environment.yml | 12 +++++++++++-
>   1 file changed, 11 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

