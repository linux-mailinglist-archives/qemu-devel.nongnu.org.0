Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1186F51E6A2
	for <lists+qemu-devel@lfdr.de>; Sat,  7 May 2022 13:27:29 +0200 (CEST)
Received: from localhost ([::1]:43994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnIat-0000HV-M5
	for lists+qemu-devel@lfdr.de; Sat, 07 May 2022 07:27:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nnIZO-00080G-Aq
 for qemu-devel@nongnu.org; Sat, 07 May 2022 07:25:54 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:44883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nnIZM-0002l6-NN
 for qemu-devel@nongnu.org; Sat, 07 May 2022 07:25:53 -0400
Received: by mail-pf1-x42e.google.com with SMTP id x52so8322821pfu.11
 for <qemu-devel@nongnu.org>; Sat, 07 May 2022 04:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=xbWNzaoJAfClsPjTqNhCMsz6jCB7Rrr5Bq3LtsY4ydg=;
 b=oVLqDGbVJHHXozdkA/6Hnk9f4auho19Yu5qcUaAcl6qKEPzHX1cLFhZt+mq3x0IWey
 O+xQNQuVNhyYsq3pRVX4VZRjJANtRTWAFBQywt9rlOPl8ElVjYTeQBcosRP3VM760Efg
 DcLoxp66gM/DhBkxfzf/o4bf6t8IQaacQEJ3YQpZt4pw7TLxOxYA32rwdwXd2sMuelY9
 UK7HdlifFWVnBOiBdOZMs1xJR9VXUFfekJp9RCcPjM4BhdhNcC+lCSbj/rHqJol5U2B7
 NJljmWDUQFi+HEtagw0izM+JLzivMzf6Gasq/3JG+7IfCa98xRAw4ojuF39p6jk5pDTA
 GaBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xbWNzaoJAfClsPjTqNhCMsz6jCB7Rrr5Bq3LtsY4ydg=;
 b=dgZ6as+s+mAatRkGFP6LcCEe9GfTdqWg0OZwvG9ndum1orLXdS+p8ChQS0VhUt9tkB
 yff62pZmGZ/ub7pY+PWMQmNPhH8MzKwBWuEpgbf6+v6kzl5P6weNUZCpjzIZcWm90RRm
 IMrpHxM0LtQYdsBwFj01wEKZsE2OvWKqYlQjq8/i8c/hJz3HoP8ICAM3rAujcFeQfUGC
 d4ZU+Vo07DGyGXdx4GIXbhVwf310idzYYeVqhA4PE5yiz7LGZphL+Ypl3tSkQAA4iqE8
 D7xx1F0/GygqQoIvCI1udFmpza+yVAbGJkVZuOSQ3+OtzBFbyU9q86no8Q0vx4tU8l5G
 KtDQ==
X-Gm-Message-State: AOAM532+ETnjm0+LVARoIh3sVtKWlk8H5SEEV8LzXa6rp/eivG249wP5
 rvUIddzB+e7Cspmn50+PoiQaBA==
X-Google-Smtp-Source: ABdhPJzz3KcR+DejaV4yOQ9x8rH/WvSmudspEsf60T/0ftFj4y3K1pe4d+E5/smeaH1rkBoNSgt3+w==
X-Received: by 2002:a63:4c22:0:b0:3aa:2ce2:8051 with SMTP id
 z34-20020a634c22000000b003aa2ce28051mr6315006pga.281.1651922750963; 
 Sat, 07 May 2022 04:25:50 -0700 (PDT)
Received: from [192.168.138.233] (50-233-235-3-static.hfc.comcastbusiness.net.
 [50.233.235.3]) by smtp.gmail.com with ESMTPSA id
 16-20020a621810000000b0050dc762817dsm5108490pfy.87.2022.05.07.04.25.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 May 2022 04:25:50 -0700 (PDT)
Message-ID: <00afdec7-2cc5-09ed-5d30-ca834b28bdd1@linaro.org>
Date: Sat, 7 May 2022 06:25:47 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 0/4] Clean up header guards again
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20220506134911.2856099-1-armbru@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220506134911.2856099-1-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/6/22 08:49, Markus Armbruster wrote:
> Markus Armbruster (4):
>    Clean up header guards that don't match their file name
>    Clean up ill-advised or unusual header guards
>    Normalize header guard symbol definition
>    Clean up decorations and whitespace around header guards

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

