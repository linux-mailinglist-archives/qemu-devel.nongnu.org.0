Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA5D33E2F0
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 01:42:44 +0100 (CET)
Received: from localhost ([::1]:41604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMKGp-0005hc-0v
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 20:42:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMKFI-0005BU-AI
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 20:41:08 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:43643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMKFE-0004oL-2I
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 20:41:08 -0400
Received: by mail-wr1-x433.google.com with SMTP id e9so52650wrw.10
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 17:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=T3W7gAt1RWMyetvH8L0qAkYLotNz12lCAUXAmiP1cUE=;
 b=NgAn1O8RvhI5OS2jRDRaZiW4Zy5dV6/Tb39dOXI3FlJGDbIb3f85Dl0o4a2kcIjR9v
 UFa7HKnNs0s44452hKPf80i9FGt41xzJQI5ZmnnZ6u3S32bGjCw58wxtwsnis7X8EzDF
 kKtxvSzcg6biagVDUapGWoTUwYUEwVSLvXMo3PCcTXIrqsDHmodUMkQmhF2AVzMJhI19
 9x6NEgqH+hFIvDf1Q0GAUjwmQWZnsyJUZzO6hq/SHnb1G8/eD0aGLgp3rl6U6/Qj3ZiM
 RX+2LKIUua033yW+Tliw+rtrIMe5A0wlmT/6/VjjrJE08bh/e3mxa8JYhR+cG2Hg+OWQ
 ve0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=T3W7gAt1RWMyetvH8L0qAkYLotNz12lCAUXAmiP1cUE=;
 b=JVbWSvwTwkmONkgLlfDC925eCVjohw69JnAll15wUdqOCjcA6RchcOLyfvRAZZysk7
 PFU54omTU1sPKW1ZILK9v9X4fiNPdND2cZ9M8f+Vrco8CxqO3UAAHug+GvpWuVNGG4J1
 90J2ZBH15h7r3h4Cg0Gv4PLkxx+J63vtgQMQ7OTovc7W+Zu5oPF99WBUDD9Igd+vJEfo
 YcbCPeXk9PhWm18EiRGcgWEkWn+IbEth35fOeIbyUPqpK1JwLndJgVoOQZSzS1hbvFC2
 KwmunIhdoCZDaxpQO5IR1FCICUgEIYvufXws56nu7i0xEQhsLz+ckIwEffFcFq2Plwui
 0Ajg==
X-Gm-Message-State: AOAM531Mv11EgJkBbdi1iC8UpHmchAC9NpRtF/ks0Ke+vzgVVpIkMZdm
 RpUHMd9WkyrgwCpFxRA652A=
X-Google-Smtp-Source: ABdhPJxDyu2H43vrYzeK26q3+g19tSVg1ZPxiSztmDqlOFcTjlZEIb0slDihAy5z6Ir3mimTkILW+g==
X-Received: by 2002:a5d:4203:: with SMTP id n3mr1565607wrq.116.1615941661843; 
 Tue, 16 Mar 2021 17:41:01 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id g5sm23728472wrq.30.2021.03.16.17.41.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 17:41:01 -0700 (PDT)
Subject: Re: [PATCH v5 00/57] TCI fixes and cleanups
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210311143958.562625-1-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <cf408a75-8948-7fbb-1b03-0629f0f41c5a@amsat.org>
Date: Wed, 17 Mar 2021 01:41:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210311143958.562625-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/11/21 3:39 PM, Richard Henderson wrote:
> Changes since v4:
>   * 19 more patches now upstream.

I'm done for today. Hope in time so you can squeeze another
batch in 6.0.

Regards,

Phil.

