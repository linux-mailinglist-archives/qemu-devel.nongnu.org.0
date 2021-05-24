Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E7738F4B7
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 23:08:14 +0200 (CEST)
Received: from localhost ([::1]:35902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llHo5-0002Xp-W4
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 17:08:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llHmQ-00015I-5i
 for qemu-devel@nongnu.org; Mon, 24 May 2021 17:06:30 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:54824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llHmN-0003P6-Sw
 for qemu-devel@nongnu.org; Mon, 24 May 2021 17:06:29 -0400
Received: by mail-pj1-x1029.google.com with SMTP id g24so15572916pji.4
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 14:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iDiRxYUggQa2aysfU7Uu6sYrox+Aoj7RNG3nHguYk9g=;
 b=tJXfSronTD5cwd7/DA80mJ5ZfCrCJsyzPaWPpuljH1ALyxrp/j+MkHZhE0gUzpFRDm
 NVj6ECmVfV6wtTgzR8p+I82SwRPHKWbyhi3VtuEiDNTomrUdxcn05z0av2CpDGRFNRgP
 mMuCKEJVVBHP6VYxDjyLMBAx3smWr4lKwRDMOjvwOcnmaGhZIZMN2B66b74bMkU61+0b
 +TzSqhbzuZZXK2YCQ5QnVj94QB6kFfGsiZTa3TZCbqgoHSw6oVpsFUXKHhGCqALNpxcY
 1iR2EIw/iMGK8TM8zJKrafkmpPX+rMH+VUphR3m7eBVjP1K3PweGvuIkHFYsvT0Lvkvy
 RAFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iDiRxYUggQa2aysfU7Uu6sYrox+Aoj7RNG3nHguYk9g=;
 b=XXMA49ctVWmX66RRAVqca5AkzCDbaQAFTvhZueETfRO6m9MYPt/PPljmziglIAoswL
 B3LvDEL7ZgfO73Tb/btaBrr2qv4WrsX6M1ByzSk8bWdy6yhWDZTvGEfsXngmFzp/HZOk
 wZ++RfCsRS/0iV1JLks63kkcF1DmVLQD311Pts4i3NSqzJ/H203Hr7gVV6rL62bL/Pq/
 f1HdARNuzx2HGcKpbLBDudzHW2ey1oz0C48Fvu5ZQeSZ7TS0c1bGaDskxjzQu38VCx9E
 GkC74JEp8rPkqK8BCoVN/RrtRFqCHR4rR5Fo9k3mUPBAT+C1TVu4AeE9Ay5QkUMwynbr
 OFdQ==
X-Gm-Message-State: AOAM530AQ+NfrZjXV4HVJi6NX2RIfcmEUfndxKWsqF+ueguRFE9tgFo+
 OJVY5uNvIhVovMBQI9aOLa0bOA==
X-Google-Smtp-Source: ABdhPJzvBaTTBxttgMOYIXncAtm+WbWX6G27x5XunA4QyN9T5CU5pkwvCNbm76voDT72WtHU+2aNHQ==
X-Received: by 2002:a17:902:6b4a:b029:fb:7b8e:56f8 with SMTP id
 g10-20020a1709026b4ab02900fb7b8e56f8mr2628299plt.46.1621890386543; 
 Mon, 24 May 2021 14:06:26 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 gj21sm289086pjb.49.2021.05.24.14.06.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 May 2021 14:06:25 -0700 (PDT)
Subject: Re: [PATCH v1 4/8] gdbstub: Constify GdbCmdParseEntry
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210520174303.12310-1-alex.bennee@linaro.org>
 <20210520174303.12310-5-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fdc54521-1c2b-d9cd-abd8-23586b35d9f2@linaro.org>
Date: Mon, 24 May 2021 14:06:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210520174303.12310-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/20/21 10:42 AM, Alex Bennée wrote:
> From: Philippe Mathieu-Daudé<philmd@redhat.com>
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Message-Id:<20210505170055.1415360-3-philmd@redhat.com>
> ---
>   gdbstub.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

