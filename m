Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D256639DA
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 08:24:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pF8zS-0004yy-7f; Tue, 10 Jan 2023 02:24:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pF8zP-0004yg-PO
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 02:24:07 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pF8zO-0004ZZ-63
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 02:24:07 -0500
Received: by mail-wr1-x431.google.com with SMTP id bn26so10765280wrb.0
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 23:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hH6ZfBcWlCzWLsm5iivNrLW5OyrVy1G+TZfInKuwdws=;
 b=fsiYakznsiwjNVqJC9e4+3HCbXheK6Sa/INU++x49zOF3HQSdu5lzo5juV4xNXQIn5
 uN0NrQbVr2wI5q0TDiaL8nfkPRA8eRu0GEbX4bk4gD4k+CMclaDri9Xwt9KWRVWHMjqs
 RyXE9AW932+eCXQNiUOyYhfEOPAp9EQr5TctDA24mxhTnBr0XPzaV851yQiBB1DWq5au
 w4225QuZlOn0WjEdecWuKRElHoMHbXDe61SRmyGnSnJ9pOdyVeC/QdDytnm6nUm3l4WM
 9SROweYRaMP0i+LK5NO9o7bRCgi3FVGHnKdd9BRuXNfhV7P9j+WQP1/DyhjrGMbDa5hg
 vZgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hH6ZfBcWlCzWLsm5iivNrLW5OyrVy1G+TZfInKuwdws=;
 b=eDWbS1kq06gRkCJ0KQxlDDvNP1VAESWFRhxdFQnSNTQwI0wPOC72Aw1UEyRuRfb+fT
 km1ZtiAFkVUnYHZ0QMJJAtgPbHybub0CznGpuRxz9XqyFhJt2UMLCttVQrtCzI/emBKX
 CdnA63zUBXl9MWDNNjMOQA3BpR3/V69C1r5i5W9fDB9/+FIMotCa9ZMaN3YSmvhrkapC
 Xvq2ehMniTO8xhfIKrRAVxsVfJKsvt3xBQ9iLX5ldWF+22D+AwFNRU/KnpSA2KsO42xY
 vlfMFbRUS1brSx0OWAj933usvNjxSEWdv1zbY/MubojtTp4G/855WIPpwpAK5Ui+8bhU
 z5nQ==
X-Gm-Message-State: AFqh2ko7GZ61V/svhdqZcsA/GdaUYgLRF0aca0VbNYsMTLQis/fELZHS
 UQRAbrhqknFmvzM0umbRUM93dQ==
X-Google-Smtp-Source: AMrXdXuRnrzYtbVz09aAgSb2+kzenHvWvGzqHN246C784AtmQQEv2w/5cAYrSrTVXNE/98r161pvnA==
X-Received: by 2002:a5d:4143:0:b0:290:3629:a824 with SMTP id
 c3-20020a5d4143000000b002903629a824mr27848623wrq.40.1673335444732; 
 Mon, 09 Jan 2023 23:24:04 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 q17-20020adfcd91000000b002b6bcc0b64dsm9182270wrj.4.2023.01.09.23.24.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 23:24:04 -0800 (PST)
Message-ID: <e30ad7d6-ce2d-7ecc-b513-3c951e04d42b@linaro.org>
Date: Tue, 10 Jan 2023 08:24:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v4 16/17] ui: Split hmp_mouse_set() and move the HMP part
 to ui/
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: kraxel@redhat.com, dgilbert@redhat.com, berrange@redhat.com
References: <20230109190321.1056914-1-armbru@redhat.com>
 <20230109190321.1056914-17-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230109190321.1056914-17-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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

On 9/1/23 20:03, Markus Armbruster wrote:
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   include/monitor/hmp.h |  1 +
>   include/ui/console.h  |  2 +-
>   monitor/misc.c        |  1 -
>   ui/input.c            | 15 +++++++--------
>   ui/ui-hmp-cmds.c      |  8 ++++++++
>   5 files changed, 17 insertions(+), 10 deletions(-)
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


