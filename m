Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8FC25EC5E
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Sep 2020 05:48:42 +0200 (CEST)
Received: from localhost ([::1]:43526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kElfV-0001dd-Fr
	for lists+qemu-devel@lfdr.de; Sat, 05 Sep 2020 23:48:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kEleb-0000Uf-Cn
 for qemu-devel@nongnu.org; Sat, 05 Sep 2020 23:47:45 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:41845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kEleZ-0003h3-PS
 for qemu-devel@nongnu.org; Sat, 05 Sep 2020 23:47:45 -0400
Received: by mail-pf1-x444.google.com with SMTP id z19so4628700pfn.8
 for <qemu-devel@nongnu.org>; Sat, 05 Sep 2020 20:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=b5ZzcbJiwBJ+DcHp0jwy+RGUII9IoGUI9Y6vnQMR98E=;
 b=Fc6lHuNIK77UgyYWFHT0rqV4kh+9p1Ad1BhQ3U1uHQv97ziBYqL2QaoF0pJe0lyQnx
 U17u5+ibFnNA1PJuhCjfF+RhT+SBl5zVg/SJCXCOunBSBSqAIfzEwywj671pAck3HYSd
 G4VvNXjOt0TaFnBbyjsfZaS/Th1jZBAE/bAasx6poV8xi8u/LMpZ0Y7+VkF7+nvFktNx
 DsxSVgLqxRyW5yWBlNGBoS468tUl1if7ZURBvzQiIHAytpOPwcWFIut4eBUHIfQ8oC+W
 zrczGEHENi2juzoosW9nDy2Pxz2I3DA2YL3vuVFwAF9OT2kEonxwnIRqn54mU2s/YblM
 aRMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=b5ZzcbJiwBJ+DcHp0jwy+RGUII9IoGUI9Y6vnQMR98E=;
 b=ZLKdYHsd2lRWzYbsmsOXUJ2XeBCfqbJvgxdVsaz+xz7Re8HZBb/L+/yb2ELLXSLX8q
 M8Rm1OiFPLsxUScYHOZ5ou0fwjpiSHs5Z9Gd27eRClg9kBxRKesUBDeJQtw7qOiYSKK8
 yyA40YUedx5rwowFA2lIzeKGo980YgQq20OSQ1Erd0O+K9rCVMy/JCDE4ujqhl4ANCuS
 YwXqwRIC85vRpV0DV1oZNA8ef0DXUKvfTttjnFvfFLTZLSd6D6MEHz/sGbx5RIwBxlG2
 v/6EJm8NTpT4287peMtXeC9DeKF87p6Ms7mC651ugtM1NknfVUaKB7b7X8JHhg72SaTe
 3drw==
X-Gm-Message-State: AOAM533lNYytyYYg5AqRueOdgMy4MBaWSIgcoCYobv4CNHBDrF952o6n
 ALCqFJatHyAFCgLWf1n3KFXtyg==
X-Google-Smtp-Source: ABdhPJxli21gRMSFuF/eB6kaGmwhFPZ32YGwi99IBkUTkrZby2CVB7B5H79+hRghqaFA+ttfigI3Eg==
X-Received: by 2002:aa7:8f28:: with SMTP id y8mr2476963pfr.180.1599364062241; 
 Sat, 05 Sep 2020 20:47:42 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id a20sm9956366pfa.59.2020.09.05.20.47.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Sep 2020 20:47:41 -0700 (PDT)
Subject: Re: [PATCH 03/13] dma: Document
 address_space_map/address_space_unmap() prototypes
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20200904154439.643272-1-philmd@redhat.com>
 <20200904154439.643272-4-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <40969041-60e7-c132-b414-0feb57ca07fe@linaro.org>
Date: Sat, 5 Sep 2020 20:47:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200904154439.643272-4-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.107,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-block@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Richard Henderson <rth@twiddle.net>,
 Laszlo Ersek <lersek@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Beniamino Galvani <b.galvani@gmail.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-ppc@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/4/20 8:44 AM, Philippe Mathieu-Daudé wrote:
> Add documentation based on address_space_map / address_space_unmap.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  include/sysemu/dma.h | 30 +++++++++++++++++++++++++++++-
>  1 file changed, 29 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


