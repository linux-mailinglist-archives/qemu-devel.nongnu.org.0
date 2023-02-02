Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98999687B87
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 12:08:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNXRi-000176-0O; Thu, 02 Feb 2023 06:08:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNXRN-00011L-M1
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 06:07:50 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNXRK-0000ko-HA
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 06:07:40 -0500
Received: by mail-wr1-x42e.google.com with SMTP id m7so1334809wru.8
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 03:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+kVSl5nz96A/UMtvxO+myMdqmEfCiAhVn3Wk1HkDvio=;
 b=evuX7XVYJtBka+o7lNV5dNcZ39NV/+8gc0aIKuvvcP1sx/05BxjvrSsSSh9z6Q+Ex9
 tld9QT0UWBTW1oUcD6NzRTUvfBDcX27VS3DAjcvhFHUL4qGSdKo2QLrJWVTo5eFyodjW
 nPihEg4SLEU7T+hdcx/D/l+o/YKDosLJ4JW3vekL/+WlEppYWW9Hot7VWsK8zFbqbc5Y
 WO1uvra1PnNX3k66ilwnQHOHsyhfGqvMpmKQGiYUH+G4FmlOe6N95lB1R6y0vAqPoBdO
 TLZ0MLWyaBIJqYh1rrMlOvJYPzopdEsIadi9yGUwy8i3mvKsFkPR3cMtJWWv0Egto3iV
 P7wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+kVSl5nz96A/UMtvxO+myMdqmEfCiAhVn3Wk1HkDvio=;
 b=CaFj7hHGsEC8P3SiWv4VjR6TIt8czWqSOQSctj3wiAX27GP/goZ7H/joK0kkqO1y3s
 CIu0DkcKKhU901PDzK8PbxH/MQNZs28YkOJ8YMO1LVIGo4G9bxZ8BFRU95hREc8s9qtJ
 LPfkRLax0ZGsV9oUzBz4vc5Jiw/9zrdQsJyvX0GOUc4ZBp8KNdA6W8SRWYnAeHl1sjTn
 15yMgLKuZAMVyzp7F/5zMvHl0mZc5dTCcGFtZANrKKzJjPN4H2fx6/oI8hvKb9Hq0jup
 0AEgmGTCDBMiEhKbH8E4fl4Ipaw0A12K06NcWW+mqnN0ko3e2OvLfQ9pOVZUOEi5ybZy
 CjVw==
X-Gm-Message-State: AO0yUKVqVPeopaLHqQkqHBZRfvWGioQm33T3ePuApoANOgtTvZl9K3gb
 jXExJGTjfCER2a4zjLWNAikFAg==
X-Google-Smtp-Source: AK7set9hFRZhMDW87tJOKHldlQ/cZZLiAyDxUZTQva22IZfo9jBBSH9KGwtD2tJa5LyGEzKihE03kQ==
X-Received: by 2002:a05:6000:188f:b0:2bf:bd69:234b with SMTP id
 a15-20020a056000188f00b002bfbd69234bmr6676771wri.32.1675336054502; 
 Thu, 02 Feb 2023 03:07:34 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 r28-20020adfa15c000000b002bfd137ecddsm17821933wrr.11.2023.02.02.03.07.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Feb 2023 03:07:34 -0800 (PST)
Message-ID: <546c2c37-df67-d880-a68c-4faad651ed90@linaro.org>
Date: Thu, 2 Feb 2023 12:07:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PULL 08/34] hw/arm/virt: Let the virtio-iommu bypass MSIs
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Eric Auger <eric.auger@redhat.com>, qemu-devel@nongnu.org
References: <20200703165405.17672-1-peter.maydell@linaro.org>
 <20200703165405.17672-9-peter.maydell@linaro.org>
 <7592c27c-0c98-d52c-fecc-ac2b261ecbb3@linaro.org>
 <CAFEAcA8AXsXa7adhhmvMrh+kBoQx=tJ9PzizAnrgb=Db_vupGw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA8AXsXa7adhhmvMrh+kBoQx=tJ9PzizAnrgb=Db_vupGw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 2/2/23 11:58, Peter Maydell wrote:
> On Thu, 2 Feb 2023 at 10:47, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>> Where is "len-reserved-regions" declared?
> 
>    DEFINE_PROP_ARRAY("reserved-regions", ...)
> 
> does this. For an array property "foo" the machinery creates an integer
> property "foo-len", which must be set first. Setting that
> then creates properties "foo[0]", "foo[1]", ... which can be set.

Oh indeed now I see the array prefix:

   #define PROP_ARRAY_LEN_PREFIX "len-"

Not obvious to realize while grepping.

Thanks for the quick answer!


