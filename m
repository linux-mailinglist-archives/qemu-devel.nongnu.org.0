Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3476A41B7
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 13:32:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWcer-0002Pr-4b; Mon, 27 Feb 2023 07:31:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWceX-0002PY-CQ
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 07:30:49 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWceV-0007xZ-6G
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 07:30:48 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 l7-20020a05600c4f0700b003e79fa98ce1so3722023wmq.2
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 04:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mARlAIr80G/5RYfyCnRzVFPqlZTmHXSSynTWvqtoeZo=;
 b=BMBsx3fzr7RIaGfjtsfAVKKG/7S8cvy3zBlAr2WMWPBaB1cr1dNxOdCd4NGaPcxYDS
 zotTJgb7VLJ8r26eFEr46d5AfPXkfACrnH0VBKSJzesWSY5Z63+hUmuBTtk9hF8jNb5J
 p3DSixPvV7lauo/NLBCso+wlfJ9m5LN914ByLE82Sv8andpnVvKksnoX2u0l/OQ3LOg6
 /RikcE1FrpRFfy++JiPcCEgGatZh+T6QRF91pQvJh2zN6R/yWoBDfcxjQJGoid9Taqxd
 0LUhus92UnRVqJwmlkJoPKHa+RgDLhyQ+M7Y/ZHqteD7gdi5W6TrVrwOffj8Os4h5X6P
 5jWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mARlAIr80G/5RYfyCnRzVFPqlZTmHXSSynTWvqtoeZo=;
 b=yzl4wruM70zZkp+iU2drDe+uBWqRzCCl0EaItLQScfE50Bo10HTdbvmYIA87I01gH2
 nneq776x13K8iJbeqy/6mHeVpjRUOc7YBeTtsRiTz55f775vookVT8r1D2g+s6yGgar7
 H5D4LEHo8R+a1RmSfiBHsyFfqBDhYq9nGxSWs5C79X9snAwjIRM6NeErGspwSd8PYfM7
 ecjhnel/3L3fHHEWKPc3V4t7ZvDWvVqc2rYoAPMpcKeXtaEZxmQrM/l31032xTCEqSur
 Yy4H5TF2krZSJCpMB6GucfY6lkDPqhgoZtg3pe5tO+TM+11kJo3yNoNvkWGYlZ+Ukf3l
 QUhQ==
X-Gm-Message-State: AO0yUKVvVLzap/OacOh0qY1BOymgDSzu6Ud+npKWm6/7yGz8vctsFpBf
 5FIzG+G6bbZQ5+lNbNwGZWUXRg==
X-Google-Smtp-Source: AK7set+db4FYcZnrE7LomBwbeaN+aDN2jvoWrBHbeax5mqwIBuqT2BnRX/jdSJ+BUsFRbATIm2unGw==
X-Received: by 2002:a05:600c:4f45:b0:3eb:39e7:3604 with SMTP id
 m5-20020a05600c4f4500b003eb39e73604mr3931603wmq.5.1677501044541; 
 Mon, 27 Feb 2023 04:30:44 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 m34-20020a05600c3b2200b003df5be8987esm13882499wms.20.2023.02.27.04.30.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 04:30:43 -0800 (PST)
Message-ID: <07b62d37-c7b0-e910-c622-8ca59813da0b@linaro.org>
Date: Mon, 27 Feb 2023 13:30:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v3 0/6] hw/vfio/ccw: hw: Use QOM macros and remove
 DO_UPCAST() uses
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Alex Williamson <alex.williamson@redhat.com>
Cc: Eric Farman <farman@linux.ibm.com>, Eduardo Habkost
 <eduardo@habkost.net>, Richard Henderson <richard.henderson@linaro.org>,
 qemu-s390x@nongnu.org, David Hildenbrand <david@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Ilya Leoshkevich <iii@linux.ibm.com>
References: <20230213170145.45666-1-philmd@linaro.org>
 <ba7cefe1-7fb7-7b6e-e22c-867eb4f0b3ad@linaro.org>
 <34cacdc8-ee20-7dfe-52f4-a68cc29fbfb2@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <34cacdc8-ee20-7dfe-52f4-a68cc29fbfb2@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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

On 27/2/23 12:46, Thomas Huth wrote:
> On 27/02/2023 12.15, Philippe Mathieu-Daudé wrote:
>> Hi Alex,

>> Could you take the other ones via your VFIO tree?
>> (all patches reviewed).
> 
> I've picked the other patches now, too (since they've got a Reviewed-by 
> by one of the vfio-ccw maintainers now).

Thank you :)


