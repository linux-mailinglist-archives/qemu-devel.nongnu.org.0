Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9516900A7
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 08:03:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ0wv-0003hH-PY; Thu, 09 Feb 2023 02:02:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQ0wo-0003fa-4g
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 02:02:22 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQ0wm-0005rk-Cn
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 02:02:21 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 n28-20020a05600c3b9c00b003ddca7a2bcbso758109wms.3
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 23:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pTAaucdDP7AfstX/axwCqvdniRYz73E1iQO7ilLjLck=;
 b=y163eE01cOG0fQuyJkfSgExwPB2ukCJ+DnJkWVrMjomU6P4nO2IRN0tVXZhp0CTaEG
 +1qYp10jgOQd+Ne/J3dWYY6Cphal7JbSPT50folwhr0n70yfzbyaVvdlrQCS/Y3A8yz6
 +uYYrC8Shh4eF1yfrYVX168IuNq7tzZWuV2g2vfO+CqJUSJpn6/lxvyc6NwXVhqMuco3
 u9HpFRIksJUIpmQFj0TIz3X43WVyoxyqr8yQfQ2oJICLLGMq6X9JoqelfS1RCFSyrFDH
 6t8+7AU5DHXlSvfmiPfzLlnN3AOXKKOOQeX6VC+BQm/jx6mBPONFwtAeDRlwibsdYCxS
 /nNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pTAaucdDP7AfstX/axwCqvdniRYz73E1iQO7ilLjLck=;
 b=ERxwzpdSCxltENdVGWN1RjPlEJ93E5hWlUaNGo8NAftscCUfmdAhbi3ODhF/xkHHyJ
 VcUWNzfqMQ1iVzwAQS9inLcUkX0UU4Pir6jeVpnW7NGy0/lQBOpmFA5mZ6ftz1euMNbK
 I9XySJSDz5qDBrvTWxhWrrS//+feexU5iYjxGXw/k6lssX3ytP+s09xZFQHTa20ZesTZ
 AB0kjYfLNTZ8c0T588a60G3WQarNc5B2uckkjd4ByYEGUElO91M2rU/aMQagIqYPoWRB
 aFtQzpwHvuPypj7SIMuSodtzcMlpdpoI2baR7EJsHuljaLx18R7ezmNUBbLUHZkuNCH3
 xJpA==
X-Gm-Message-State: AO0yUKWhD8ouMpOY1Y4xC8/2OL+IJ11zF0AyjzGi2a4lGl0CzVwZq5sk
 /HfL92G05WVSBVY8NkRkWaExjQ==
X-Google-Smtp-Source: AK7set8Ve9C9snI0KUC2BKmgUVJpYqQW/eUeCk5kJp7ORlNc+foeSNJywaO6E5YiipQ8SGVRqCWWjA==
X-Received: by 2002:a05:600c:18a6:b0:3e0:e77:3056 with SMTP id
 x38-20020a05600c18a600b003e00e773056mr8815682wmp.30.1675926138566; 
 Wed, 08 Feb 2023 23:02:18 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 h2-20020a05600c350200b003dc434b39c7sm8225204wmq.0.2023.02.08.23.02.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Feb 2023 23:02:17 -0800 (PST)
Message-ID: <0f9d4ec3-5ee9-9643-a95f-e3a429f6150c@linaro.org>
Date: Thu, 9 Feb 2023 08:02:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH v2 0/3] Vhost-user: replace _SLAVE_ with _BACKEND_
Content-Language: en-US
To: Maxime Coquelin <maxime.coquelin@redhat.com>, qemu-devel@nongnu.org,
 mst@redhat.com, pbonzini@redhat.com, stephen@networkplumber.org,
 chenbo.xia@intel.com, thomas@monjalon.net, dmarchan@redhat.com
References: <20230208203259.381326-1-maxime.coquelin@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230208203259.381326-1-maxime.coquelin@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.146,
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

On 8/2/23 21:32, Maxime Coquelin wrote:

> Maxime Coquelin (3):
>    docs: vhost-user: replace _SLAVE_ with _BACKEND_
>    libvhost-user: Adopt new backend naming
>    vhost-user: Adopt new backend naming
> 
>   docs/interop/vhost-user.rst               | 40 +++++++++++------------
>   hw/virtio/vhost-user.c                    | 30 ++++++++---------
>   hw/virtio/virtio-qmp.c                    | 12 +++----
>   subprojects/libvhost-user/libvhost-user.c | 20 ++++++------
>   subprojects/libvhost-user/libvhost-user.h | 20 ++++++------
>   5 files changed, 61 insertions(+), 61 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



