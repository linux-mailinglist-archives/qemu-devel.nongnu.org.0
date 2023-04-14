Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D25446E2695
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 17:13:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnL7E-0005Il-Ca; Fri, 14 Apr 2023 11:13:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pnL7B-0005IH-Ff
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 11:13:29 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pnL77-0004jX-Iq
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 11:13:28 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 bi22-20020a05600c3d9600b003f0ad935166so2623796wmb.4
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 08:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681485203; x=1684077203;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Wk6J9D5UydACCN0yMds0epqED88PI1qIb0uFJHIIPI0=;
 b=XBdMSFtw5szw6aJJNOGoZuFH0cPTaWqY89Xa5izJJX9+5JJfN8T0zOVAv2G6feg5tx
 VkKOUkcoLyEomDkuVs29z8WQ1ln5btTbcviWR94LGUSrA10KV7inRIlUgFuhD4j0I7uN
 Fsit4PgJ79mEwWNZyMZAR3x5ugkp1BVL0uB+AjF5o2a4P2FyOZOFiaWct9A+ziCsDhIf
 pZCpuTr+fIbDrtzC8zk3tj6bTFlmqbo0dd9iOF12ahlEPX9A43fguIqzXbzTFxRocxfd
 AERAQqXPXGKOm+4A53mPuMA0iIv2jspfrxcuUGcuVJ4xCWWXFfCk9JvVBUbKVW0VsO4+
 7Qig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681485203; x=1684077203;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Wk6J9D5UydACCN0yMds0epqED88PI1qIb0uFJHIIPI0=;
 b=OuwT5XKOZ0aPJVIfG3HL3UUc+AtOkkhpWPtdBMpP54eMPE9ckNefdMIqjycnjQG9xr
 NNUZP8NXPhMIY1tJYUKuCOgZ+jFT8mxck1FtvVyMIrOx3O0dPiRt5ffcBZr6z23HIy2G
 x5cx+CooSqtB79GJ+XTVBBpnVgrsV/zu8XmJu6eF6ussA6TA/qTG7i4PyUg2CFrIqFrn
 uYHD7gSG1XjtPCKwFF7YPoI6NNS9ayBVZG35M8tNLEb6QbngUg9UsBK6pUPKzNm/NLM3
 HLEljirHBIQ5EeBGIHWu6BKnaFru15Rri8bsSJx2d3KWo+uSlPwqc7yTPPnX1YSsk1PQ
 b0tA==
X-Gm-Message-State: AAQBX9fG5ym14gcSgCsgqqaSQMtEC5cWfKvFW5peYnS7BrClCxG625v3
 StFXQfzjnbF/BK4czDAPn5ffNA==
X-Google-Smtp-Source: AKy350a3BlYyX+9TSjNpFzyn6wWpWWoPwEVbde48ufviNvcmI0fYJ9r5EUZEp6G2tBaUZyDGflkrQw==
X-Received: by 2002:a7b:c4cd:0:b0:3f0:5074:efa7 with SMTP id
 g13-20020a7bc4cd000000b003f05074efa7mr4896506wmk.14.1681485203689; 
 Fri, 14 Apr 2023 08:13:23 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.204.198])
 by smtp.gmail.com with ESMTPSA id
 o18-20020a05600c511200b003f0472ffc7csm8302514wms.11.2023.04.14.08.13.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Apr 2023 08:13:23 -0700 (PDT)
Message-ID: <aa7d0694-6af2-6474-cc35-8ddfc1afd36d@linaro.org>
Date: Fri, 14 Apr 2023 17:13:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH 38/40] vmxnet3: Do not depend on PC
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Jason Wang <jasowang@redhat.com>, Dmitry Fleytman
 <dmitry.fleytman@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org
References: <20230414113737.62803-1-akihiko.odaki@daynix.com>
 <20230414113737.62803-39-akihiko.odaki@daynix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230414113737.62803-39-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.282,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 14/4/23 13:37, Akihiko Odaki wrote:
> vmxnet3 has no dependency on PC, and VMware Fusion actually makes it
> available on Apple Silicon according to:
> https://kb.vmware.com/s/article/90364
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   hw/net/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


