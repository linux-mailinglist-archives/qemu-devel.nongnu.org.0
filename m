Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5652569485D
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 15:43:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRa2S-00038f-T4; Mon, 13 Feb 2023 09:42:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRa2R-00033g-47
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 09:42:39 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRa2P-0005mc-0M
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 09:42:38 -0500
Received: by mail-wr1-x432.google.com with SMTP id h16so12451174wrz.12
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 06:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=u2rdAY72ubcEfGMqLpKt2lTeVI7nIjOxisBX9PwvecE=;
 b=XWiZnPxBEbdrs3uQ36EFfkB7lzi03ty7UjDPjAoGY/0+NZFEBWCtN5g2ggoP2AcYw5
 6RAjvFnwc2+CXv3ybdYLARObW0Z4NMDWmPIYzRhlwJnx5eM8fMdeRUYE0gbJTY62xH8L
 5jaEQODu69v0C3dVrIAiZxb4ou0aGVqLFoSWTPVlgRCX9hIw5ZYPioPFDT5svYGZYAAp
 11xhtvXt9XoKRA3VhfSWZ2j7o0F/VQmU/6/s+GzCskbCZyisRjH2K0K3PV/QrAVu3wdo
 +mVvllhisnA+6VAUIydTcZ8cXgdEsXEHIfACalpFg9fKfgmQYK98XXSfdYwKTcCtncZc
 rinQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=u2rdAY72ubcEfGMqLpKt2lTeVI7nIjOxisBX9PwvecE=;
 b=qpyNAKFTQ7WxsGkrgFkHGygyK2BvnfZd1YfwWD7WMdLkyfIrIOGIWCavlQgN7glXH8
 +N33SL1USx+L+qPVq1YS/B23QDqDbSMXNBVASM/rE31Ti/bELObVFebiV7eLp5srTfWo
 ENCTJgm27nel4AKf4KdN+5GJiBBPwUesWd1QqtWUUU8Hs8ueWkK71hiOxzXjzPYJR3/Q
 h2GZ0j1Mh/BYucgeWZEE9yEm0cWCl47mBk7K83fO+s6rHIWUUZ751cEKQ8c9UW9nb5Kz
 5oZwmmT5wPobYYEYaNFw0I4aCZlOzk25Czt1eVbnGWp9N/YzulyWQAk852OdHZ3e+mYa
 K8Fw==
X-Gm-Message-State: AO0yUKX7bU3xWNbcF2aDPwY7oko4/xOOqjxT1fC94XUWnzi/cANLHwx2
 Rn9XnRDB6oc5068ICu6daOYdMw==
X-Google-Smtp-Source: AK7set+XXFJxIH3dTNCzL28/nsat7NMXBAFORA5tpURl9Gwwd5ZblNQZ6kme6rFtnsY6iugfvzNSvA==
X-Received: by 2002:a5d:4812:0:b0:2c5:557a:d7d3 with SMTP id
 l18-20020a5d4812000000b002c5557ad7d3mr3810574wrq.18.1676299355253; 
 Mon, 13 Feb 2023 06:42:35 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 t8-20020a7bc3c8000000b003e00c9888besm17175778wmj.30.2023.02.13.06.42.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 06:42:34 -0800 (PST)
Message-ID: <dad95290-fef9-2b4a-7c62-14dbe3853289@linaro.org>
Date: Mon, 13 Feb 2023 15:42:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [RFC PATCH] Do not include "qemu/error-report.h" in headers that
 do not need it
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-trivial@nongnu.org,
 Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Coiby Xu <Coiby.Xu@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20230210111931.1115489-1-thuth@redhat.com>
 <87zg9lpre8.fsf@pond.sub.org>
 <383a2e03-7ee9-cc93-72d5-7f039314f932@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <383a2e03-7ee9-cc93-72d5-7f039314f932@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.345,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 13/2/23 15:24, Thomas Huth wrote:
> On 10/02/2023 14.43, Markus Armbruster wrote:
>> Thomas Huth <thuth@redhat.com> writes:
>>
>>> Include it in the .c files instead that use the error reporting
>>> functions.
>>>
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>>   RFC since it's more lines of code - but I think it's still cleaner
>>>   this way.
>>
>> Yes, please!
>>
>> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> 
> FWIW, I just noticed (thanks to the gitlab CI) that I was missing two 
> more hunks:
> 
> diff --git a/ui/dbus-console.c b/ui/dbus-console.c
> --- a/ui/dbus-console.c
> +++ b/ui/dbus-console.c
> @@ -22,6 +22,7 @@
>    * THE SOFTWARE.
>    */
>   #include "qemu/osdep.h"
> +#include "qemu/error-report.h"
>   #include "qapi/error.h"
>   #include "ui/input.h"
>   #include "ui/kbd-state.h"
> diff --git a/ui/gtk.c b/ui/gtk.c
> --- a/ui/gtk.c
> +++ b/ui/gtk.c
> @@ -36,6 +36,7 @@
>   #include "qapi/qapi-commands-machine.h"
>   #include "qapi/qapi-commands-misc.h"
>   #include "qemu/cutils.h"
> +#include "qemu/error-report.h"
>   #include "qemu/main-loop.h"

Uses without include:

$ git grep -L qemu/error-report.h \
   $(git grep -wEl 
'(error_report|error_report_once|error_report_once_cond)')

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


