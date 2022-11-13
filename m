Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC99627243
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Nov 2022 20:44:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouIsr-00068a-Ix; Sun, 13 Nov 2022 14:43:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ouIsp-00068I-P0
 for qemu-devel@nongnu.org; Sun, 13 Nov 2022 14:43:11 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ouIso-0001oI-9s
 for qemu-devel@nongnu.org; Sun, 13 Nov 2022 14:43:11 -0500
Received: by mail-wr1-x434.google.com with SMTP id a14so13882324wru.5
 for <qemu-devel@nongnu.org>; Sun, 13 Nov 2022 11:43:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6L9jPYcz7ct8alLyJuxfORWnDzbFO03+CMn7zI/QyvQ=;
 b=vxq8DKORJrOWTw7xsAduMLfKii8CMJHHUvMRt6USZEfjHwChqcAH659rArQnc0tMR1
 Mu5P1mWjn6+jYcn+DUhxQLMTm1pqFcnhyrvmRij00/lBWZgAvcyX1K1XaGot5Vox4oSv
 S+MQMXOb19gLYizz8suTL0JxmpWY3ilaYk7IcHKTxBXo8QD9bTEzotusOlfAgkZkKuzh
 b3vPbEvWfr530LIk0kFtUKs3TA7eTjkkQ+0JSrPp4H3DdEjxgPTHn+nG7P5wAA/evOJ5
 OwvjqM95P3whwxiAX0b1RDwsWgdapnjOOji8RD5nukDrhRZxYY837jqz230YUoz0GbmN
 s3KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6L9jPYcz7ct8alLyJuxfORWnDzbFO03+CMn7zI/QyvQ=;
 b=VplP5mRoAVsZDQmB3WettOLxBuO1cURgHoygKehL9iJS2GWYzbdxq9ObHQuOdy3OL8
 EdrHw+BPQMewpPlylnhZmjKn5hkUkn1fOCmscDKCGw6xoEI23mfY1ZIqkM3+l5tIout7
 /TRDywGllKET+C2kn77XkOs4amwv/iSQtbyw1Ub3G+7VMuZoT6rhbXbOfUBrR3nzN+To
 ElJ4tSdHZqfwHcEi/hQEk7RojF8paYueug8FJFUkIYo4kdvPg4N1wvPfBlM4BHYuFo2H
 JLE0WPPKeDG9Yri7YFBP8e9xDYN+LLFiYwoihmmCco3SvvKimfdY93wLqyikHqfyu5pK
 gahg==
X-Gm-Message-State: ANoB5pldjOlQSDjuEGO95bzFk2sWI/YhSrulhOBAiznPWIL1Xolp0dWP
 RrUZy3k15z/N0HvSyu4o8MC2eQ==
X-Google-Smtp-Source: AA0mqf4aesVuJ5L/Ev/ZKMy+Gf/W3Y04MQHW8aAxVj8OlhPr2GXnHf1N0KqhrNKZw3hQo7EhVZtg9Q==
X-Received: by 2002:a5d:4809:0:b0:238:3fd0:dbe2 with SMTP id
 l9-20020a5d4809000000b002383fd0dbe2mr5703991wrq.347.1668368588520; 
 Sun, 13 Nov 2022 11:43:08 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 z15-20020a056000110f00b0022a3a887ceasm7572816wrw.49.2022.11.13.11.43.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Nov 2022 11:43:07 -0800 (PST)
Message-ID: <d45cf92b-06bc-ab47-51e9-55a0126edbea@linaro.org>
Date: Sun, 13 Nov 2022 20:43:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH v5 09/20] hw/arm: remove current_cpu hack from pxa2xx
 access
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: f4bug@amsat.org, Peter Maydell <peter.maydell@linaro.org>,
 "open list:PXA2XX" <qemu-arm@nongnu.org>
References: <20221111182535.64844-1-alex.bennee@linaro.org>
 <20221111182535.64844-10-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221111182535.64844-10-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/11/22 19:25, Alex Bennée wrote:
> We can derive the correct CPU from CPUARMState so lets not rely on
> current_cpu.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   hw/arm/pxa2xx.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


