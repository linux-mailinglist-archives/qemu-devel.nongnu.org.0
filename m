Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED37668BAF2
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 12:06:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOzJH-00082n-A0; Mon, 06 Feb 2023 06:05:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pOzJ3-00082U-It
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 06:05:08 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pOzJ1-00005F-Nt
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 06:05:05 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 m16-20020a05600c3b1000b003dc4050c94aso8434277wms.4
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 03:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YinycJG3qv79YV/7XBh/0Op9xB6A0l/6TDZNwR0+k+c=;
 b=TIb12KXUjBzaHXmdKG9u25rULlE4ZNAtpiSqP1aUBl+v5eg8IZPwF1hDggZOoVpqGR
 2zJdd0+bDGQkLhhZonbd74KbMOt/AjiTR5Uf5muIy5tI5JBAuU5ctQ85a1LY5mk36sFA
 oS27NgXqb+8i2fDHzQqUujYQvdrKeVXwHcqxya3reCTMeTEK3N2bMhuyDxyNH0jItoJw
 Pvtrsax3XPmRBgEWLt3uw2wyIfkdkPoUBOBk3Etjl3ZMCW/0Ulyvb+5PnssNYGqXn026
 YmcqyqZVJBaF7jR/wwe6PXLfA2cjOcoCmV1JOgzN2R0k1kqWx7SHdwvFO+CYm2wYUePm
 q3bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YinycJG3qv79YV/7XBh/0Op9xB6A0l/6TDZNwR0+k+c=;
 b=z02LzN3Hs0fLtfc5alNfddyS2PaF0i58Et64WjP5McQNTPeby4SCW9LqJmsn5R6aD7
 +JXaeD2NIzibF15fXE+ZQxsjesZycJ5bqH8+YIBrxwkI2pOkO65JE6afpVdAJmyP6USL
 IdXaRANJYncoghoXuyIjTZkjKNeYnKvkeSKjsvY+qF38Lv6z7+/ByRY44fgfr8TH690R
 kN8HgsaRgmG1fWUif6VAK3aCYDzHguEzg/+YXYeaxLHZm0BXrcv2rnQebE4+Oq4oiQb/
 ulCt+RTuhrVUW8KrkJMQ6+fpqAJmn8cwDpH9aSYZFdeLzEII4Hoq/sfHvcly3374Ba3i
 DdDw==
X-Gm-Message-State: AO0yUKUw9rH1HCiBPVjNYyPBVaX0/uIuD7rG16Sy4agga3nr5EhGRu6C
 62VeHw0pjZc/NA7d5nrxCWOTfQ==
X-Google-Smtp-Source: AK7set8ydUJVaD19cgXvZpaR2Q9zQE/DHozLvWMXQyFcE41Q75zdp0PsBGXVouE4IKWHUhjd/DMMPQ==
X-Received: by 2002:a05:600c:5121:b0:3dc:5a70:23dc with SMTP id
 o33-20020a05600c512100b003dc5a7023dcmr18209851wms.27.1675681501981; 
 Mon, 06 Feb 2023 03:05:01 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 y6-20020a7bcd86000000b003dc4480df80sm15844129wmj.34.2023.02.06.03.04.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 03:05:00 -0800 (PST)
Message-ID: <9d85105f-f841-f96a-1388-1ae302cf98da@linaro.org>
Date: Mon, 6 Feb 2023 12:04:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] meson: Avoid duplicates in generated config-poison.h again
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
References: <20230206102037.3621709-1-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230206102037.3621709-1-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
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

On 6/2/23 11:20, Markus Armbruster wrote:
> Commit eed56e9a89f "configure, meson: move config-poison.h to meson"
> lost a "| sort -u".  Restore it.  config-poison shrinks from ~4500 to
> ~700 lines when all targets are enabled.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   scripts/make-config-poison.sh | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



