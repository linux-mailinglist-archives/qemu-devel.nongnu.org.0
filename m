Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 525CF48E965
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 12:46:09 +0100 (CET)
Received: from localhost ([::1]:39474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8L1y-0006oK-Qy
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 06:46:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n8Kog-0005OD-HV
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 06:32:26 -0500
Received: from [2a00:1450:4864:20::434] (port=43924
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n8Koe-000814-VA
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 06:32:22 -0500
Received: by mail-wr1-x434.google.com with SMTP id o3so15065044wrh.10
 for <qemu-devel@nongnu.org>; Fri, 14 Jan 2022 03:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7o+3TJ36ee7cfHM3hyfwktSjD4IdfOHQWmZAAY95S9o=;
 b=bXIJUJC4Ps/tAJF+OPQgtF4fMOGp5ha0LlTAIaViQQUNCDInUlLyR4CE4sO5TZyTD2
 miMrDDynT12aaFCrHHiErs5/FpSmZ4mIK7I90zXlm4E0RFOwucuaOOhAaW5Kl5HHH7D3
 rwCu+1ihIIx0aTrjb9hFkCcq864MNf65d/lPwbTAB25Xqie06/mUgfFYY+zs7J0EhgCv
 BYUWBuJkddjFPAR5lb6wNPsru7Nx66dHXe0HN6Y8K+5lZzf730h2AI6zY1zsgNZ2ZySM
 Ji5ljHb2G5/AXWmNkNsS4IRYcDFTXGOhwWSyJdSKe9BUsDEg0cOiXz9QgbHAk6igDCug
 gEQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7o+3TJ36ee7cfHM3hyfwktSjD4IdfOHQWmZAAY95S9o=;
 b=p7fCeh80F/xAFZdfknFwchXmCxb12phKEwUWZGrqqsJI8nfFVdx0XxNTBmtT5LtbJ/
 A5nfbMJAGx2wE30M6GBwbnn97WPRdt8iFluyRe5qrYhrHeF+2oQjetYsKqXhHtnFoG0d
 vtq21mEP29LrOTNZQnMdizfBMqCHXtG9gk8vQkbmrGjpOPI5S5Vzn9u/iIsKIB5ESzMm
 lBicG2PART/u3V3NkTCEM1d2qm2g0YxckfqvxSNIkevPSX6ccS7IGaVZDPwnLv2ACUYr
 PUmlpPCF6wFLhKHAxZoM/5L9cyjiWB+O09bFyQ7G9vCFT3kEQDnP/pa4jjXgAX8wS9XO
 37eQ==
X-Gm-Message-State: AOAM530Fu6rscYtuo9gQt0wCrsFYEvA8r4EhLOimzK9YA/CXywOGOCRN
 PW0IE6JxZ4zoE53AcpOZ+R0=
X-Google-Smtp-Source: ABdhPJywZ+nCJQk3RyusdGWJbZj4mBdXas1AgIiHE2RyWsWS/ZD9ITWmGAFjSseUTgTjxfXOREhMaQ==
X-Received: by 2002:a05:6000:1a8a:: with SMTP id
 f10mr5308543wry.103.1642159938624; 
 Fri, 14 Jan 2022 03:32:18 -0800 (PST)
Received: from ?IPV6:2a01:e34:ec40:49e0:48b5:8fce:b44b:d951?
 ([2a01:e34:ec40:49e0:48b5:8fce:b44b:d951])
 by smtp.gmail.com with ESMTPSA id p9sm5719100wmb.32.2022.01.14.03.32.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jan 2022 03:32:18 -0800 (PST)
Message-ID: <5995c5df-435e-01cf-150c-8e06098e18c2@amsat.org>
Date: Fri, 14 Jan 2022 12:32:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH v2 2/3] migration: Add canary to VMSTATE_END_OF_LIST
Content-Language: en-US
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>,
 qemu-devel@nongnu.org, peter.maydell@linaro.org, quintela@redhat.com,
 marcandre.lureau@gmail.com
Cc: lsoaresp@redhat.com, peterx@redhat.com
References: <20220113194452.254011-1-dgilbert@redhat.com>
 <20220113194452.254011-3-dgilbert@redhat.com>
In-Reply-To: <20220113194452.254011-3-dgilbert@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 13/1/22 20:44, Dr. David Alan Gilbert (git) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> We fairly regularly forget VMSTATE_END_OF_LIST markers off descriptions;
> given that the current check is only for ->name being NULL, sometimes
> we get unlucky and the code apparently works and no one spots the error.
> 
> Explicitly add a flag, VMS_END that should be set, and assert it is
> set during the traversal.
> 
> Note: This can't go in until we update the copy of vmstate.h in slirp.

Do we need a libslirp buildsys version check to get this patch merged?

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>   include/migration/vmstate.h | 7 ++++++-
>   migration/savevm.c          | 1 +
>   migration/vmstate.c         | 2 ++
>   3 files changed, 9 insertions(+), 1 deletion(-)

