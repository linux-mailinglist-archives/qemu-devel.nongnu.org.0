Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A69C339F71
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 18:21:19 +0100 (CET)
Received: from localhost ([::1]:45808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lL7x0-0004DC-7c
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 12:21:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lL7t3-0001kn-SY
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 12:17:15 -0500
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732]:46893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lL7t1-0003fL-En
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 12:17:13 -0500
Received: by mail-qk1-x732.google.com with SMTP id a9so27648456qkn.13
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 09:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ioccn+KpAtuEnaXmoxbBstjYF10P/plxA1gW92B1Cac=;
 b=WbsS1hnC9Dslz/EGky6e22HOVsJrLmDVEQsE5WUFkAIfch+bd+I2BcLMRe5SnaS6sc
 K3/GnWH4WHflNFD11L+rNO7/LV7NYUbNh5qX/ec249G6zTn18qZY+fdVEDCUaFcD2L4v
 iNJY9jiRKhEAWOTADeoECJYVJlwEkjkYVvjLUinUxc8SNaRQvxyRteB5SppOFuq/ielC
 kkLoVr5IYuxc64pQOYGJueJ+O09zpTwLZz6Dr6wBio/Lv36lgUwOGfCMM7/btkjS7OG5
 6JWA98QLkUIyYPXknDvxq1WuJAOew8rtipEvCEdOYvoUFEaua+IqT8m+0AZx0yDgKQ7T
 MPnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ioccn+KpAtuEnaXmoxbBstjYF10P/plxA1gW92B1Cac=;
 b=uWT00+lZxz33ZxNus52DfKkWMT1ftQlMrSk6qoRDax43jF3CH2QyFDLrTwUcACrmgm
 TUv65KLZnUXZNb7SE2eVlR3lkcIngMInPTBjfmtz++Aejq1QYtVeP7iqxqZ3qpWPNpZz
 HTKMrr4k/SKWDErKuNEJ/AXhxi7O8vyDxUyD0KxFVKb0GywhU5wsVzRe1vb3gQIiWn2D
 Wy03z2uWBn52A9YIKazp13tKRgagbc/Of8pN9nM7knkDM16E4y4eqe3a+DoCc2MxaGoD
 IcT/toCJKaJg11Io9txf3vTA4EeZvKvvFU2c3H8inTQSYQUXyB+RZ5QQsyAVlQ3jbTov
 eX6g==
X-Gm-Message-State: AOAM533iCLMs/BFh/nJ+nLxs2xOvbRgTMXu1N/VQxuTmZmG5fibDW5/t
 st47UkP7jIGUMvfScAFw1xz4gA==
X-Google-Smtp-Source: ABdhPJzaf+hkCveBEN9xS+rxDYsNRDWGNGgcydj0nBI6nKY93tgA0fSL1wglqdbXjCbTJqRMBi1Bcg==
X-Received: by 2002:a37:4d86:: with SMTP id
 a128mr17701368qkb.115.1615655829804; 
 Sat, 13 Mar 2021 09:17:09 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id k24sm6485739qtu.35.2021.03.13.09.17.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Mar 2021 09:17:09 -0800 (PST)
Subject: Re: [PATCH 0/2] MAINTAINERS: Mark Renesas hardware emulation orphan
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210312155513.1849109-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <137c32d2-10a4-44d9-6db1-77617cd64f46@linaro.org>
Date: Sat, 13 Mar 2021 11:17:06 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210312155513.1849109-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::732;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x732.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Magnus Damm <magnus.damm@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/12/21 9:55 AM, Philippe Mathieu-Daudé wrote:
> Philippe Mathieu-Daudé (2):
>    MAINTAINERS: Mark RX hardware emulation orphan
>    MAINTAINERS: Mark SH-4 hardware emulation orphan

Acked-by: Richard Henderson <richard.henderson@linaro.org>

r~

