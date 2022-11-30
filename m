Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F221163D2F4
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 11:13:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0K5R-0005wk-Iq; Wed, 30 Nov 2022 05:13:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0K5O-0005wF-5j
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 05:13:02 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0K5M-0007xy-CL
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 05:13:01 -0500
Received: by mail-wr1-x433.google.com with SMTP id y16so6521373wrm.2
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 02:12:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YCfIQkgYPZXvXtZzEnXPBT7xyLqS1ZQYEYkmhjK1CUw=;
 b=xLpGoUaFbua2t4/0FgC1oH/ABb8nfVlZCejIb5/g7jcsg8tHNSKoS9MwwIne4ne9ov
 F9QTTa3/Vz+ajTjW1l298KHY9ga9E6ieDDH2lKvt0Teq2HRfzLnYh2PIAlZvvDfaWl8/
 JRl/I3DR8whODcdUEJiWfTosuF99ca96I2ZsU+o+e1DB/66fMGQP7qQWGlQCT/AZ7WJ8
 FxXtxNWdu3emYR+h7U5JczqrgjyJU+ielDPzvGjfIczQpVtkV5h/6K9Ijf0zWkVboGYC
 6jL9xBCuu/kMg91GJ268ta74sNc7ACQr8NASxJH5INn6Dpf6NbdjvUsWnf1MXZVqjS0g
 GhhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YCfIQkgYPZXvXtZzEnXPBT7xyLqS1ZQYEYkmhjK1CUw=;
 b=YOPeglGf9ZAFF++Fz9J97c9B8guB8YGOhtVVa2WJcqdCODH9syWkJhcqMua1VTI5Bu
 6is5ArH1xV1l1Jpf0Pq/BEZDxxj3WZebJh+RLShq6wbmv56F0Yk5RDRPbLilZXqzjnpB
 2g5AWQvBd3oCaba+jLekiN1rFdYDqkYV0zDdxAF2ThVVqlgfCl18t0QTerW/lWc29Jsq
 UQIC1KpM3cB6liaEKNYzARpJQy7+5mO+ckoBb9aCsmx/kWiJbylz3J253294+SzWw1Os
 t+8K7YBQm6wpVJroZ+7zXa7xfRhmfhU/QfrHY0wDijMGrBguwIU0atgqOWm+6RGfXyFV
 aqug==
X-Gm-Message-State: ANoB5pn+3lFoT80KyERPXcWU+gMF64iNSH+Oug0hppUnNBgT+XlwKuYK
 om7otXRgiWSeNtWLgUUvpP9u/w==
X-Google-Smtp-Source: AA0mqf53e9WEuCs548tksimNqApYERWZa5SC34P6Pt2Q3bs93AgjJui20TYR5ksv+qnxDZWkVWYBfQ==
X-Received: by 2002:a5d:410c:0:b0:242:1c3c:63e5 with SMTP id
 l12-20020a5d410c000000b002421c3c63e5mr7456359wrp.272.1669803178815; 
 Wed, 30 Nov 2022 02:12:58 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 m28-20020a056000025c00b00242257f2672sm1076715wrz.77.2022.11.30.02.12.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 02:12:58 -0800 (PST)
Message-ID: <b1cc584d-be9c-f2bf-ccf4-6712652936f8@linaro.org>
Date: Wed, 30 Nov 2022 11:12:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH for-8.0 6/9] hw/hyperv/vmbus: Use device_cold_reset() and
 bus_cold_reset()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org
References: <20221104161513.2455862-1-peter.maydell@linaro.org>
 <20221104161513.2455862-7-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221104161513.2455862-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.258,
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

On 4/11/22 17:15, Peter Maydell wrote:
> In the vmbus code we currently use the legacy functions
> qdev_reset_all() and qbus_reset_all().  These perform a recursive
> reset, starting from either a qbus or a qdev.  However they do not
> permit any of the devices in the tree to use three-phase reset,
> because device reset goes through the device_legacy_reset() function
> that only calls the single DeviceClass::reset method.
> 
> Switch to using the device_cold_reset() and bus_cold_reset()
> functions.  These also perform a recursive reset, where first the
> children are reset and then finally the parent, but they use the new
> (...in 2020...) Resettable mechanism, which supports both the old
> style single-reset method and also the new 3-phase reset handling.
> 
> This should be a no-behaviour-change commit which just reduces the
> use of a deprecated API.
> 
> Commit created with:
>    sed -i -e 's/qdev_reset_all/device_cold_reset/g;s/qbus_reset_all/bus_cold_reset/g' hw/hyperv/*.c
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/hyperv/vmbus.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


