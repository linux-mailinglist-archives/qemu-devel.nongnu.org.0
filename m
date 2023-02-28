Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A6B6A5A10
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 14:37:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX0A0-0000z6-3h; Tue, 28 Feb 2023 08:36:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pX09x-0000yQ-A8
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 08:36:49 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pX09v-0000Qi-Q3
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 08:36:49 -0500
Received: by mail-wm1-x330.google.com with SMTP id p26so6411983wmc.4
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 05:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vJIjSmuRsSgmKWW902VVWQlGaar58p0NWN9VtAFAlp8=;
 b=lWQk/cfIb+8UyDsinb8lfrCjPt/E7UWTkQciIe7alf4vZRqXYLYUwbxDA99gUSJvWd
 BH4CqRbfqVVyPEZQC8gWz90wknD8pxHOFnppdd99k1f8/pb69VmA3gJY7gc8ZKDyJPHQ
 6yJ0oTEZiGNltveYQvsnxbW+knj84BxyH/MqzPNi/olCifznhPsyYaBv6896gPE5QE43
 mUT20uHwjp5wCKi1dwLsCmT6q8N6MyxSnQ0AmK2Y27AJHd9YuGyc+qS5n8A70PQFsz8B
 tEoDjKbXgrfuuE/RYLBl5LwiFi+WOnDA0jzv0W8mGACjvWs54VSRmEXtbtvpAYzfnYVc
 Oc3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vJIjSmuRsSgmKWW902VVWQlGaar58p0NWN9VtAFAlp8=;
 b=l7erfyNFGuVx8pNrGmZLNIeUysra6cREXi2J3+7KLHdorX+3OQT81k3wspgrNaM0LS
 Jeo1/kq0xrZYn8EO0j8aGfEvBWKrzA/aOmbYWSGcc+7GHFSyzb8HE5Eoe2fkhu394F+H
 /KLZ4Juf9YPtXrwpWSZzmSIGIUmcJp5pJIaNx2w/ASTMncQJ5PYPLjW+c9gVnoTxehn/
 rI6Re17uuVW3e1LusZzE+Wx5PXC7jJqeBB6uGB2T9obSbNtoaXYM0ugRVYOXFS7wAAb2
 m+JRvMcfP3WPHnDtvK3tm+ny3ZnS8wJrUNxkao63FQ4i8BkvHfUE55qr6c/2H0XXHZW3
 c4lw==
X-Gm-Message-State: AO0yUKVfCipAQW4iEskwrPVrsvFoyw3TcRcHKBcZfczd77I7oTklvSDy
 6ljhCZsuHXeeIMJx/FJyrUre3CIGPmGV2T00
X-Google-Smtp-Source: AK7set9Y8sp2KrnUqiZmaCHdpakPPlDnrAjIiLvR5bgpmfEUnfl1SARPM+jINnZfo8fOARy3oa3Mxg==
X-Received: by 2002:a05:600c:3508:b0:3eb:37ce:4c39 with SMTP id
 h8-20020a05600c350800b003eb37ce4c39mr2197131wmq.6.1677591406066; 
 Tue, 28 Feb 2023 05:36:46 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 k12-20020a7bc30c000000b003e208cec49bsm2274308wmj.3.2023.02.28.05.36.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Feb 2023 05:36:45 -0800 (PST)
Message-ID: <e6f93935-70a1-a791-4026-c344e0fa95ca@linaro.org>
Date: Tue, 28 Feb 2023 14:36:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 0/3] hw/acpi/cpu_hotplug: Convert 'Object *device' ->
 'DeviceState *parent'
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org, Ani Sinha <ani@anisinha.ca>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>
References: <20230203163021.35754-1-philmd@linaro.org>
 <00dd2e23-7b5c-272f-b8ea-f0d1677d18da@linaro.org>
In-Reply-To: <00dd2e23-7b5c-272f-b8ea-f0d1677d18da@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
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

ping^2

On 22/2/23 22:34, Philippe Mathieu-Daudé wrote:
> On 3/2/23 17:30, Philippe Mathieu-Daudé wrote:
>> To ease code review, rename ACPI CPU hotplug variables
>> to more meaningful names.
>>
>> Since hotplug parent can't be any QOM object, and must be
>> a QDev, convert AcpiCpuHotplug::device from Object* to
>> DeviceState*.
>>
>> Philippe Mathieu-Daudé (3):
>>    hw/acpi/cpu_hotplug: Rename gpe_cpu -> gpe
>>    hw/acpi/cpu_hotplug: Rename 'parent' MemoryRegion as 'container'
>>    hw/acpi/cpu_hotplug: Convert 'Object *device' -> 'DeviceState *parent'
> 
> ping


