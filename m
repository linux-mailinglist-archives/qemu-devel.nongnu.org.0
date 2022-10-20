Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 767EE606652
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 18:55:16 +0200 (CEST)
Received: from localhost ([::1]:44994 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olYox-0004wP-8N
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 12:55:03 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olYo7-0008HJ-KD
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 12:54:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olY2H-0006oZ-Vz
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 12:04:46 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:40643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olY2G-00016w-CY
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 12:04:45 -0400
Received: by mail-wr1-x42f.google.com with SMTP id w18so35352773wro.7
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 09:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=z2JnT2Ul7/hW6B8On4wgu1FMNCvsdYYV89N+CZi/jWA=;
 b=YCA7Bv2CKs8l7PMBi30fxx+d+NY9IWpxT/4OhFPSJ7Ejka5mPiQFQryCC9XyVGUxNl
 fDovPwWd1o6s1gdDZt7o1ifE1pXu1fArJyBudTHrBpQsErOkvBY6hoxNATlbMC1L9hED
 FbEBYJsIzZX14y2cA4CtGRZqrzPCir2qAp5kga1RdGCBUNgk0oYbodHklrNWUq3rsMIu
 SPFEZh4UAhs5J7L2K4WGRuKWKjuUWJGT6rmi5pychLWCpqSxwySv9urSusqTX04wQgnZ
 UaKHV48IOUjMjeKpMhgR8TwCY9RSIhIP0YyWfH5UuuidC0+367vrtUnWSUH5kzFTt/Ip
 Ivew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=z2JnT2Ul7/hW6B8On4wgu1FMNCvsdYYV89N+CZi/jWA=;
 b=R1/nxNf1uErdavkfbq6vuVUGwadFIj/MfrVY3b68IHIIqvBB0yXLyFl+KXq0/PjFcf
 pOvZMnIqjWIlT6KWI3va6UxMR77IeJDJpXUrPOTSxBXFcHw1EaJJifoV66o6KLf3pAqx
 /oXv0lE4c//MpTH9TosHR0uRe5LwimqoPTu941DE2Svq4dzAuqJovYPrNHQ+Zo4pim7v
 qBuoo+Aun8U6M7GBxu4nLjxb7O5nLekruunJScrSS18OA2CrOfeFcz19K6P0av/SRNMI
 KH5frkzonyBpFvqCqEanH/2wi+heTVO71Bq/a/wvhVK/hWBt2YHl3UI5mEuHJ4nTXdI4
 F2jg==
X-Gm-Message-State: ACrzQf3OJHO2V18mg1yXdZxrG64tlM5ASJI0DHT4WmiltQb9XUaVvibH
 CbxzOPaSeDu2DDX4ytWhgeTG3Q==
X-Google-Smtp-Source: AMsMyM5ZBqP7euaN8YdbiDRJ6tB++cvSG/iAH5/j7RfgzRiWhcJtMRhmiIgQwSVblM7KQR6WZY3BSw==
X-Received: by 2002:a5d:6dc3:0:b0:22a:bcc3:21c6 with SMTP id
 d3-20020a5d6dc3000000b0022abcc321c6mr9612457wrz.450.1666281882658; 
 Thu, 20 Oct 2022 09:04:42 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 bg6-20020a05600c3c8600b003c6f3e5ba42sm169013wmb.46.2022.10.20.09.04.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 09:04:41 -0700 (PDT)
Message-ID: <b5864756-306a-1e51-ee40-c79376ac7cd9@linaro.org>
Date: Thu, 20 Oct 2022 18:04:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH] MAINTAINERS: Add qapi/virtio.json to section "virtio"
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: "Michael S . Tsirkin" <mst@redhat.com>
References: <20221020120458.80709-1-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221020120458.80709-1-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/10/22 14:04, Markus Armbruster wrote:
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


