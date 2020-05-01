Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id B47C41C187D
	for <lists+qemu-devel@lfdr.de>; Fri,  1 May 2020 16:53:27 +0200 (CEST)
Received: from localhost ([::1]:43414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jUX2c-00072H-NA
	for lists+qemu-devel@lfdr.de; Fri, 01 May 2020 10:53:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57404)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jUWzO-0003Yq-6O
 for qemu-devel@nongnu.org; Fri, 01 May 2020 10:51:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jUWvy-0001gj-N9
 for qemu-devel@nongnu.org; Fri, 01 May 2020 10:50:05 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:37298)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jUWvy-0001Zn-6X
 for qemu-devel@nongnu.org; Fri, 01 May 2020 10:46:34 -0400
Received: by mail-pl1-x641.google.com with SMTP id a21so151018pls.4
 for <qemu-devel@nongnu.org>; Fri, 01 May 2020 07:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=W0io/xZvck2WNT7aZWQsZ/ERDMHiPnf69GCaUNNx4xw=;
 b=zMs6KnF3bUEaKCluXIFu4ymXxTdSJY64PXAE4duXe2stpZXqhiPho86o0g9x/K9iov
 8jnW9xpsaT08YjpK49gfOgwS6DHiuT+BxR/jpM0s8DrszcVHZT0AB5klbtqchoQtVyKE
 +V/vjX8yl4prtxEmLJMXy99ssOIB+ai41OneI0xFTz7d/zlR833Mqoc9wKGJQcPlHGL5
 Mxb6e4r1pXSjZBrMWAFkSgt5i+RAjvG3LXdtRvGchOquXYIfcPAPYtYwNvBV0hGrbf+R
 HfBIm1oB+mBOJxXDTy8L9KzmR5xxaAg44qBbYrAy10FU/tasnNIMI7xVhA+SJV/0/9Cp
 4S8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=W0io/xZvck2WNT7aZWQsZ/ERDMHiPnf69GCaUNNx4xw=;
 b=WKVFf8iSjRXP9C2197Z+2R6s6t8rAstjKtnWE4ASCX/FRGAsaCx0Z+gY2hFAUx2Wwg
 swGDSJItkPh2M8Lw24dHZoMuJIQ7uXwQxq3ruEAT+7yUfEru7jyu8Q6W+bCyUgVw2dFQ
 vBNsbT9BtmdC8cUOyeUpQ3B8MOjcGHCSoJBn8H8PG/oGuxsEV19pq/ZE2Is0ieVe+B/S
 CGqC989x1M76RtxVScFPV2o29yu2yjN9vThdkyrdDaQWSjWnzPu8KwPurW0Il6tXjxWK
 JoWIwx21MYDpT74CvCidZ+jBqQKop+JgwUoJhET1s79WamzWHfSJlF4ZZaq86qbHRxd1
 lUqw==
X-Gm-Message-State: AGi0Puaob60wem4A/5kMPIQozGPqk0GFylHEEbHdQa8d0eR0D3LyclFh
 pRWQpaKQsYQrPK1YH2sJvTwzzqUJN+w=
X-Google-Smtp-Source: APiQypKbiosfj+8HV+ww+3qeN4gw1s21+HNlp3ADjtOdfHepdD01DkL5hNf8lbHF4vVNnstCoke/Aw==
X-Received: by 2002:a17:90a:ead6:: with SMTP id
 ev22mr5071742pjb.94.1588344388576; 
 Fri, 01 May 2020 07:46:28 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id h14sm2223402pjc.46.2020.05.01.07.46.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 May 2020 07:46:27 -0700 (PDT)
Subject: Re: [PATCH v1 7/9] tests/guest-debug: use the unix socket for
 linux-user tests
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20200430190122.4592-1-alex.bennee@linaro.org>
 <20200430190122.4592-8-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <274b5e0f-f95f-a15a-2b54-4d8c3c7576bc@linaro.org>
Date: Fri, 1 May 2020 07:46:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200430190122.4592-8-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x641.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::641
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/30/20 12:01 PM, Alex Bennée wrote:
> +    if "system" in args.qemu:
> +        gdb_cmd += " -ex 'target remote localhost:1234'"
> +    else:
> +        gdb_cmd += " -ex 'target remote %s'" % (socket_name)

Why should not system testing be moved to sockets?
Surely that has the same problem in the end.


r~

