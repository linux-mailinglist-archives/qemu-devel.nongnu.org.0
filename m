Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F40DA161B23
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Feb 2020 20:00:22 +0100 (CET)
Received: from localhost ([::1]:51056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j3ld0-0000QD-21
	for lists+qemu-devel@lfdr.de; Mon, 17 Feb 2020 14:00:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50549)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j3lbY-0007hF-4Y
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 13:58:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j3lbW-0000X2-TJ
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 13:58:52 -0500
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:42776)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j3lbW-0000WS-8L
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 13:58:50 -0500
Received: by mail-pg1-x541.google.com with SMTP id w21so9671515pgl.9
 for <qemu-devel@nongnu.org>; Mon, 17 Feb 2020 10:58:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kjQ7XfNZPZAkdh7eXDkhQIORhV7ono2RXJzWOjleTZQ=;
 b=CUWoAOm+CXRNUxiI6QBgniT0V0hT+fMT6GXYdn9vQiJFPvNUsLuwlfEQArGvWrnBNN
 D2w7uSHnSAcHIMdn/7JTxtWh4cE/TU4GVQBKnP4gINKLbGt+KKwsTCCdsAM3+/UsEUtM
 kCbJDEdY8K1GZGGCbtNw/sxG/v8l3KK80OGMLiOGpEEBl84n6zHLm+oDLXR1Ba06Fy1X
 9pEpy5cJRcNnyhzmyJmCN/Av5Cdi9ybKv3wV0eyHwEKKM5Qa18ZFOMbOTdVDBLZ3M3KW
 diZT/6HK+hectvVn4mfrvvsTTcTjLrZQt+KPBgYvEljWLRDXAeQeSULdYoybqJ238kGs
 ZrVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kjQ7XfNZPZAkdh7eXDkhQIORhV7ono2RXJzWOjleTZQ=;
 b=ZyZXsBAeNFWigfAt/Poh/a18yu26ewz8z6WcCJtZh6eFgh6c+zmORS9mM6ETQSOf4j
 NLLTCQBSyLC2GpOG+0DzDfEDaDJ1iy7uoVbnYN9/ukSoMwmfY9AidqcYNQ2RqazUQua4
 rPu0v+nrROJuqKyj3+QTsPmyuAAm3l1I2RvV9lRm3rREX8gQHiJ4AlqK8MBs++HudAjd
 h1bsPoNA+CMSB4ZarI6q4UUYWoUzo0ufRPaCMzP67hNPd0ctKHWtOdVeoLWxyAvKybsZ
 2mcdejul+JN1oxXDnKs8pElO6Pm9aqfDEuLMX2knRbsaOCCXjVFyaIawk4sGQT86InoD
 0riw==
X-Gm-Message-State: APjAAAUS14GoE7AJtAV0NXaVRvwL3yI0+SIw3ZDxtLWhKd8mTwPlpoHZ
 X5ih/050pwKo4Dza/NDdsR+g3sA+ouc=
X-Google-Smtp-Source: APXvYqwidMoIoCPp0Q9/YTK1KqxB04Ayo4LcvjfE2ATcHuLMRGH6THrfK+FlFyns2qZ2vAOE7lNl9w==
X-Received: by 2002:a17:90a:9f93:: with SMTP id
 o19mr540798pjp.76.1581965929379; 
 Mon, 17 Feb 2020 10:58:49 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 l8sm179814pjy.24.2020.02.17.10.58.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2020 10:58:48 -0800 (PST)
Subject: Re: [PATCH v5 18/79] arm/kzm: drop RAM size fixup
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20200217173452.15243-1-imammedo@redhat.com>
 <20200217173452.15243-19-imammedo@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d0416e94-ad10-fa9b-d901-fc4a8271c8c2@linaro.org>
Date: Mon, 17 Feb 2020 10:58:46 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200217173452.15243-19-imammedo@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/17/20 9:33 AM, Igor Mammedov wrote:
> If the user provided too large a RAM size, the code used to
> complain and trim it to the max size.  Now that RAM is allocated by
> generic code, that's no longer possible, so generate an error and
> exit instead.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Reviewed-by: Peter Chubb <peter.chubb@data61.csiro.au>
> ---
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


