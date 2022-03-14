Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB814D8C0D
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 20:08:33 +0100 (CET)
Received: from localhost ([::1]:36772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTq3S-0003aU-Ln
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 15:08:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nTq2C-0002b8-Rb
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 15:07:12 -0400
Received: from [2607:f8b0:4864:20::1031] (port=39554
 helo=mail-pj1-x1031.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nTq2A-0005PB-IW
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 15:07:11 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 mr24-20020a17090b239800b001bf0a375440so145857pjb.4
 for <qemu-devel@nongnu.org>; Mon, 14 Mar 2022 12:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=cne0T8c9u1ehXV5jngL/q8pdfiubSTNH0gY4WxLIW90=;
 b=uTyFhv5URSnlluu1B/786+/kkdCxisVRRFFqHOpuNvH9JtMF88obMWEFu7b3c60Uz9
 YP/cRZv5Qm44OfnDXYyJYQpplJ6Gxyg5CewP4oG2OjryqOM7kONGDIT02FeJhTf03A8T
 LEUBQL9qZql2DHpLv1LNvhHfRKqEMEj3ap3j2MsJC29MAtwa006WRiqNqXUNmp1ueKMt
 hBbwFPcTKYyWDK5tQ9i+6MpYAY6HxJ/uOzKOCXDNBnKiEz0lRmJfz8kK5D0KJyVIWB+S
 tNebutm0oUljeK7+6pGgqiradQj8GbiFPysNVYLkM0UeqxKC2mP0h/vTHpGG4VKDKJYZ
 ncOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cne0T8c9u1ehXV5jngL/q8pdfiubSTNH0gY4WxLIW90=;
 b=XWILNlXyluqeJizDc7YlVdE++p+utnfZ72NlvtbDqq/t2buPhnFuxMsI4LVAnrOTMp
 uOeNs267zPYRqByne0leJAw1Pu8OC+iJlb6KLTVESOwZEKzFkyx1CFl+cPLfpH6DsYgW
 mFk5tKWJp1ZsRqKaPvR4x/04yntn9dwmWZVb6OUTOssxP6UqNEhyPa3+ic0SAXA0XNbc
 paoSmtLq+SjZoj40HO5Ad4PYIYzpXpfDOd0CHJ7XvveMpr/flHvrqwrPcqzU2FDEOmt3
 9KG3nQWbAqINM4l1n2qwWmJi1hZusjZZshji/yMNVbjCB6zJG5OWDNwSN55QDtOyKMjR
 Y6uQ==
X-Gm-Message-State: AOAM530AsGOMGE3zKBmx+km7fqDwR97s5Ikvw3Oix3Hgg9mtTo6DR789
 lUabNqx0d9fXbWN0GAUvRMXpwA==
X-Google-Smtp-Source: ABdhPJz+q5Mq3eflr3On/eCjfx+8UIFSJVstG7dhD3R0JZwn6Wokh78jYxfDAxU6o7Bde5l/Rs32Iw==
X-Received: by 2002:a17:902:f68b:b0:151:d869:3b16 with SMTP id
 l11-20020a170902f68b00b00151d8693b16mr24963369plg.85.1647284827564; 
 Mon, 14 Mar 2022 12:07:07 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 pg5-20020a17090b1e0500b001bf48f8904fsm222472pjb.49.2022.03.14.12.07.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Mar 2022 12:07:07 -0700 (PDT)
Message-ID: <081a1629-6e5d-6835-b8be-435d23b90552@linaro.org>
Date: Mon, 14 Mar 2022 12:07:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/3] scripts/coccinelle: New use-g_new-etc.cocci
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20220314160108.1440470-1-armbru@redhat.com>
 <20220314160108.1440470-2-armbru@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220314160108.1440470-2-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1031
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 3/14/22 09:01, Markus Armbruster wrote:
> This is the semantic patch from commit b45c03f585 "arm: Use g_new() &
> friends where that makes obvious sense".
> 
> Signed-off-by: Markus Armbruster<armbru@redhat.com>
> ---
>   scripts/coccinelle/use-g_new-etc.cocci | 75 ++++++++++++++++++++++++++
>   1 file changed, 75 insertions(+)
>   create mode 100644 scripts/coccinelle/use-g_new-etc.cocci

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

