Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F7435A3BF
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 18:44:39 +0200 (CEST)
Received: from localhost ([::1]:42428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUuFK-0005fX-Ee
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 12:44:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUu7k-00083q-E0; Fri, 09 Apr 2021 12:36:50 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:44806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUu7i-0002XO-T9; Fri, 09 Apr 2021 12:36:48 -0400
Received: by mail-ed1-x532.google.com with SMTP id f8so7275600edd.11;
 Fri, 09 Apr 2021 09:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vGf5PfG/yc4+TnlGhSXrYr2kEiIyr1bnG4XG+vvXUvI=;
 b=e330eHLD08J9X55WCD8KZ9wi07wpCYSS2RjXH+2++tbvcdZcv6+fyw4hAHbs2895JT
 fkwAWMeKjPigV7Z+e8tSFj4/ETQkw6KkObcdeAveCaKUYQUKqTeYgA2I6Ykyk/t/wW+V
 4Ud2QqWFRQmj11bFUYNNg/eg7/JTMk5OGtEhiRpfOK9keOZ6d/9J9t2WXUngTX/s072E
 yRUSxHlsN1Ga4/ZFfviehIVQ7hKyfjzgIJecxCvMTkhTh/JYWbkMYUOKdWoUeijXojUa
 WL2X0Ux810RxtPr0Kz0OLDK5z7Nsr2jD3cDnjaPZiv4KE+QMJnGJXwib44xZwaXPjSD5
 o4nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vGf5PfG/yc4+TnlGhSXrYr2kEiIyr1bnG4XG+vvXUvI=;
 b=ORWUtgdPCdpBdrBjXdXsmFfbay6esb3WwGmTh5fAiEKnNhk+M6GhzSGNK7wRmW9iAn
 QkZLFQBeReQb/f9zarwQOKIbmivdJeBpz7G9ktcBcutcEGJOTtkO/puK8R+2bK79V9aO
 gtEm7VmdI48FNiOp9VHpeXVhZqji2LEn8FSJOo6fQEJJUmLKxvEqu2jEFX13+mzVIfs1
 p/sjzwsMzyDh6I6r5y61a6BuZsBz7ttrypxP+inufIfnoR+haTJSlvHwrbfMLQtcP1R2
 +tNk5JQUx/9GNOOCZfpHSj6i35cAMIjniwgycN8BVNKPoftAuCzqqX+kHynlH+tlh9oV
 C23Q==
X-Gm-Message-State: AOAM531rRAt7UitAGq/39jd171YQ+4sr6c/BPrbgqlb0TqaCgzyzqgrT
 kP/DlvZnEa4l+5ENW73fpdQL6Iy3KM8WHg==
X-Google-Smtp-Source: ABdhPJzlHm2JBwgeYe6rxajwlP0VZ2IqI6aVtUt5XtApYkvWD8Qo5buFnOlQb48FtPJVi8WrzmSUlg==
X-Received: by 2002:aa7:d78a:: with SMTP id s10mr18079154edq.226.1617986203966; 
 Fri, 09 Apr 2021 09:36:43 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id o17sm1692493edt.10.2021.04.09.09.36.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Apr 2021 09:36:43 -0700 (PDT)
Subject: Re: [PATCH v2 1/4] hw/i2c: name I2CNode list in I2CBus
To: Patrick Venture <venture@google.com>, cminyard@mvista.com,
 wuhaotsh@google.com, hskinnemoen@google.com
References: <20210409162545.3705962-1-venture@google.com>
 <20210409162545.3705962-2-venture@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <da217b1d-52f8-16f9-7079-3042425eeb86@amsat.org>
Date: Fri, 9 Apr 2021 18:36:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210409162545.3705962-2-venture@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/9/21 6:25 PM, Patrick Venture wrote:
> To enable passing the current_devs field as a parameter, we need to use
> a named struct type.
> 
> Tested: BMC firmware with i2c devices booted to userspace.
> 
> Signed-off-by: Patrick Venture <venture@google.com>
> Reviewed-by: Hao Wu <wuhaotsh@google.com>
> ---
>  include/hw/i2c/i2c.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

