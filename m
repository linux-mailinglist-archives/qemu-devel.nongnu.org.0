Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58181663E50
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 11:34:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFBkn-0002Rc-94; Tue, 10 Jan 2023 05:21:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFBkl-0002RJ-Dz
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 05:21:11 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFBkj-00038e-1A
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 05:21:11 -0500
Received: by mail-wr1-x433.google.com with SMTP id bs20so11198567wrb.3
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 02:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VbImnKj9VTWQE8o+5Z3JrEGZa8KfIksZSR1hPBFUhCg=;
 b=TQHgxm9DX3I7v6AkZk0HVyG7pnJQJQ9h0gbIawDbWrukW79YWbQmL0hj1I/nmNSvGT
 r510VrXoIckSiYHhIrwhz8vxfwuVQzLk2k86jNC4ILa0n2z8s3cE6Hx/tgNRVao9qRBt
 qHBQznxMWBIaVpHps6V8RkjyMzWx2RE5srSx1rSyXasfm4rgYTIxZTUUD2Hm3PjbtjFL
 pGQe9E+v1fKvnTE6Qs8UOa8a6T39rhPTo3nzunRbjGiiSYeetyaS0m13pyj55FTHMsg/
 nCHtNdy1H41YPVPmVo48+cxfbgVXVKD/OkIYxKKrc5VueBHwkIezfIbPvf+buL9S43mo
 Yopg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VbImnKj9VTWQE8o+5Z3JrEGZa8KfIksZSR1hPBFUhCg=;
 b=0qYDwgMfMYdPF6ciSm6gHL+F16mrwgfcx86XGcGrf0Pt2tayGdzNCmqhbut+dzNT7S
 n4NRwpTcaxn12K+00ozZP7lMNoPKAvSQQX4g/Re+8ech9x9RbnsV6pDUOf3Ur/rNWTov
 MZP3FKC/l7S19rGDgMXYhgE5Jo6bouohZBQZq6c26+/F0dgPh/onzqdX0ReA1HQd5XvX
 k+NFPl2HGHWyXFbrDT4hnvECoI3WvP9nHNuJJt0wIedLcygUsGyNRFXWjWZG1DM/RaD8
 +J1NK6xSoaAzNlekFvN5aqrlX5QWbrb5iz9rSGFan0X5OdoQGyEEFZrX8AJkw2C0bBhg
 pnMg==
X-Gm-Message-State: AFqh2kogdsv3mSbDk58bCyd2Pq8KpzX1woJjU+tpGEtajpc4J6y+ss0E
 9RduRbO2StfWstF8FkIEt7kPMg==
X-Google-Smtp-Source: AMrXdXvxpNoajY98/0+YfuqOHww01f3u+LF6UmYlnSsHf5h0IqkQi+2wonALjcnG9D2uCPtxUYUMsw==
X-Received: by 2002:adf:a18b:0:b0:27c:fd94:63de with SMTP id
 u11-20020adfa18b000000b0027cfd9463demr32894612wru.27.1673346067177; 
 Tue, 10 Jan 2023 02:21:07 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 l6-20020a5d4bc6000000b0027323b19ecesm10866283wrt.16.2023.01.10.02.21.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jan 2023 02:21:06 -0800 (PST)
Message-ID: <8f28c524-ca4b-8dad-c290-afff4c9b1d41@linaro.org>
Date: Tue, 10 Jan 2023 11:21:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v6 0/4] Make the mc146818 RTC device target independent
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Michael S Tsirkin <mst@redhat.com>, qemu-devel@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: BALATON Zoltan <balaton@eik.bme.hu>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
References: <20230110095351.611724-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230110095351.611724-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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

On 10/1/23 10:53, Thomas Huth wrote:
> The basic idea of this patch set is to change hw/rtc/mc146818rtc.c into
> target independent code so that the file only has to be compiled once
> instead of multiple times (and that it can be used in a qemu-system-all
> binary once we get there).

> Thomas Huth (4):
>    hw/intc: Extract the IRQ counting functions into a separate file
>    hw/core/qdev-properties-system: Allow the 'slew' policy only on x86
>    hw/rtc/mc146818rtc: Make the mc146818 RTC device target independent
>    softmmu/rtc: Emit warning when using driftfix=slew on systems without
>      mc146818

I was happy enough with each iterations, but the changes requested over
each iter was worth having a v6, it is now very clean.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


