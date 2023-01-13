Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC085669119
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 09:37:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGFY1-0006fN-6o; Fri, 13 Jan 2023 03:36:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGFXi-0006eP-LH
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 03:36:08 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGFXe-0003Cd-U3
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 03:36:05 -0500
Received: by mail-wr1-x42b.google.com with SMTP id bs20so20354111wrb.3
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 00:36:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OzmjMrzZjzDix6IfQJdeda6+2jMMm3RVpFJ3VWErJyc=;
 b=XNF3fQHUrVN/P9tLVkiIwO79mCWzIAGoM7xMPpm0HVdKQ4DUcReQy31vXq21iO6pQF
 yc18Izf49LRdm72mminZoSRfZ3wPYQzD8/U43jY+E9hZB+oLB6OTF07DEAirTZyiDgw4
 QbB786u5lAlW7GLEQ08leQvjkd/q9wyH7OoHuM0zROvOa8EaQwv6qKqTsmp+ij/zg2Fh
 xCiYipVS667uIbiztZBgx/fKIm0PpTi1GdBnrnUhvlg2aKWzu8UI+vJPCvwMzbn5YNXy
 dhGUUPltHwKZsaac9QJ5own4BPlgVkYXuPSLb7dxN7nEALZK9czT3E2BPEohpyPzTaXP
 TFYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OzmjMrzZjzDix6IfQJdeda6+2jMMm3RVpFJ3VWErJyc=;
 b=O2Y8ZrMdTs2OL+w4ObBeTOH9DWCo+8bGubca4SzDP+vakAg0UE60VjKRgGHvYCp7oD
 Ims8AYU676yG7dLr+YiUQhspc03rCxbW+e7PQqgI7dX8TVPoizVM+WUAvgVDsfBKcDHX
 npCaMrYJC5i3Pn8Tt3lc1TkeM1BMrrLmoUOFcuV8i7QLPlcax5TtJ/C4GuCUH5K3cFSE
 +g/O/xWsYsfHOKmS8JvvJLpuGXmAaLdfSBIiHPpTFKp3HkPnnHMAb/khRbLmzBHi3DHA
 +RKZgMWfebi5jrh/0QkybkiUBFCSs60wh3xsTioiXCqHEdoZSPW9J6C82ZIJBpdxxVuR
 bduQ==
X-Gm-Message-State: AFqh2krj/ZZ0pSSbulqsJBgF+9g4rprUZG9NSDgEt5ImOLiNP8qS3+b+
 lIbZygXbdNmQXVIwDtEqDx93vSCpX8Y+FTUX
X-Google-Smtp-Source: AMrXdXsei+mdQKff+hLZG/38guN61tezz4JtLCtldbMXbS2Ld8NK0dNdJaHQhL2E7r3xD35KHaRUnQ==
X-Received: by 2002:a5d:4cc2:0:b0:2a3:3a96:709a with SMTP id
 c2-20020a5d4cc2000000b002a33a96709amr26060920wrt.57.1673598961218; 
 Fri, 13 Jan 2023 00:36:01 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 l13-20020adfe58d000000b00296730b5c3esm18501210wrm.102.2023.01.13.00.36.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 00:36:00 -0800 (PST)
Message-ID: <3744f78c-2c99-28db-416f-0c636235ec91@linaro.org>
Date: Fri, 13 Jan 2023 09:35:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] scripts/git.orderfile: Display MAINTAINERS changes first
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>
References: <20221216225505.26052-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221216225505.26052-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 16/12/22 23:55, Philippe Mathieu-Daudé wrote:
> If we get custom to see MAINTAINERS changes first,
> we might catch missing MAINTAINERS updates easier.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   scripts/git.orderfile | 2 ++
>   1 file changed, 2 insertions(+)

I'm queuing this patch via mips-next tree for my own convenience.


