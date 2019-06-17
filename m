Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B04A5495CF
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jun 2019 01:24:22 +0200 (CEST)
Received: from localhost ([::1]:52552 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hd0z7-0002Fd-Ut
	for lists+qemu-devel@lfdr.de; Mon, 17 Jun 2019 19:24:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46330)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hd0yN-0001RZ-BF
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 19:23:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hd0yM-00049l-G0
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 19:23:35 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:38780)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hd0yM-00048B-9Q
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 19:23:34 -0400
Received: by mail-pl1-x644.google.com with SMTP id f97so4847984plb.5
 for <qemu-devel@nongnu.org>; Mon, 17 Jun 2019 16:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vPdNOWAJucovboeV3Cai3ZcGUTz6AX2qckshg/SETjs=;
 b=EaVoMb4a58q+K83Xth0Lnmp2MKYDNiHJoMgiL8oOfkZPic8pfD86ztoNQje4EirTOj
 lWQTc7JIoC+ueV6hMN+uR/A6/bZA1jdWBhl1a5Izm0CvFwYW3wi1So21p7BtyQwynK8T
 miNT2DT9tHYh0jAkzbx6cqQRXf7bsPhzmnA4bkkgXaNj9q+I1gKc7M+KJpmLAMjqum/J
 w7sqg1rsBxHu6II/PtgEcTJJBUHqbf+AkaN5jEVDqQYYYOfwD+Ci5esGiuutqsJv48zC
 7zeZ061t+RqQT95RQ8Tg0zFVeZABqS+EzQcTekdTMziSpNJvuylE/AzFuHSop2xZaWUq
 ZHBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vPdNOWAJucovboeV3Cai3ZcGUTz6AX2qckshg/SETjs=;
 b=Xp8DUbJOLeu81XwAW3hImbLZyphrU9noKKE+5dPDOpRslHH3WM1E+eJMLvu3JbpTFp
 Mrz5RkSGjzAQAh9uM5vqiHrZgkOqWWfffVIAXl9qUjECxxXbxdhS92pbX+NorAaCeapy
 nLsg+ULlorOAZYIiQ1gdTk6twghOKEaXNqPTfCVxrsjNGm1EaFpVHFzJyA0RljBr5MPf
 uOeex4sh6xkXJkKgYYS6Y+fKw3U/nWPYCqEBbsDyTjU+wODwNa0OaFO0sypG2w0db0/a
 7J+YMTRLKp/5bwlRMU+XJANBq6sPB2VDizSQfeyVdQXCtLYeq0tAXESmGyqS1ZXsx8v5
 crbA==
X-Gm-Message-State: APjAAAXH+fRTW+VTxCJh/3UERuEiCJe1hky6WRNu9676EjPtxWTQPGj9
 xhZBGGq8aeNWQdTVd0khFMCxLg==
X-Google-Smtp-Source: APXvYqxGvftA4+jCYzkDRqOSVN8bgRQ16kCz0kTEFZCGensbzXR616zY/LDYMmuEhPdXzY/K9Hx6eA==
X-Received: by 2002:a17:902:2865:: with SMTP id
 e92mr109191989plb.264.1560813813384; 
 Mon, 17 Jun 2019 16:23:33 -0700 (PDT)
Received: from [192.168.1.11] (97-113-2-33.tukw.qwest.net. [97.113.2.33])
 by smtp.gmail.com with ESMTPSA id b8sm16024532pff.20.2019.06.17.16.23.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 17 Jun 2019 16:23:32 -0700 (PDT)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20190614171200.21078-1-alex.bennee@linaro.org>
 <20190614171200.21078-50-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <42ecfa78-5bb1-6ef2-55c3-e7b125ed82a8@linaro.org>
Date: Mon, 17 Jun 2019 16:23:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190614171200.21078-50-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::644
Subject: Re: [Qemu-devel] [PATCH v3 49/50] include/exec/cpu-defs.h: fix typo
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/14/19 10:11 AM, Alex Bennée wrote:
> - * This structure must be placed in ArchCPU immedately
> + * This structure must be placed in ArchCPU immediately

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


