Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BAC44BEA5E
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 20:33:36 +0100 (CET)
Received: from localhost ([::1]:38300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMERD-0007VA-I7
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 14:33:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nMEMG-00056M-QL; Mon, 21 Feb 2022 14:28:29 -0500
Received: from [2607:f8b0:4864:20::52b] (port=35617
 helo=mail-pg1-x52b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nMEME-0003Vb-Ll; Mon, 21 Feb 2022 14:28:27 -0500
Received: by mail-pg1-x52b.google.com with SMTP id p23so15120856pgj.2;
 Mon, 21 Feb 2022 11:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=P9iQjxvCHjvPv0r552afxH0ww/IEoP3Oy7bUod072jo=;
 b=ndpNSiVEztDz23hk0qPThOlmiwrBbXRrwQyG/LUATLyKJlNq6JEUOb7IUgJo99MIBB
 P4eSHn31QJQwTfC+ZkoaoSYpemtfKputuqKkLva1rcvD9Eg84VAWl8Za8luv//TaWcS/
 5OhHf82JJ5ld005b8QMNLM89eUmIpt9/0cJZO9xz+8raUyidbbl5/QfwvF7Bw/SA+InV
 jgj7CIcOP9lP8S5Uszu96Uu+T/Wf/eEDQzHVD7K17yoF/9t/uHICAQHo4EcfRfyfWH8O
 OQapKXWvqSlb0f7GNynKttP+DHpqjByf6p+gwhdhzZZWHlFkGorxwrJbadDHeJVD96Lx
 nafA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=P9iQjxvCHjvPv0r552afxH0ww/IEoP3Oy7bUod072jo=;
 b=dLR5OAk3Dbis3s1cXvPFkAn+vNi/DcP7FU1b66jBQHs9bpvFIEriLZv7azD9sobqXj
 4HuT6UySfksg7IgQvYt+cRallmmIc78jzfskpdA2paguUFNCepNRhjo//yUyMRG1TrGt
 tbZ31ZutcZYBFkgH9J1nBFvmJSQ2F9k/X5xP/Q8YsuNA185oMcnX/U5SDBCQEuwwavt6
 4WNijq+3PF6LSO6JaNOskLdZlTyPQiSwSnMDb/6xnz3WLEr0vCvO/UkngSZQyAZeU/ri
 8CPRKL63w29Zsf1t+nqgIvhVDY8IpvgXgeu2lv557M27HGzHBzfKere2GyRkkeA6G4Zw
 iKOA==
X-Gm-Message-State: AOAM530BFpzaO8T9mwbORBvmVdj1RqeHbJbcOPZUOu9zv24gtb+++mq6
 1StU67YCPV/TnSf2nnvhAyM=
X-Google-Smtp-Source: ABdhPJzefG7guj/H4Or09tffJHG4fKUYOO9TeF3/qs7o1TeuLjlNL7BYZThFc9mVKT6SAP9d7u6JOw==
X-Received: by 2002:aa7:8819:0:b0:4e7:8ca4:6820 with SMTP id
 c25-20020aa78819000000b004e78ca46820mr17927786pfo.14.1645471705151; 
 Mon, 21 Feb 2022 11:28:25 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id q21sm13750515pfu.188.2022.02.21.11.28.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Feb 2022 11:28:24 -0800 (PST)
Message-ID: <870b516c-3cec-1ab9-bc95-7262b06e10dc@gmail.com>
Date: Mon, 21 Feb 2022 20:28:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.0
Subject: Re: [PATCH v2 3/3] hw/rtc: Compile pl031 once-only
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220221192123.749970-1-peter.maydell@linaro.org>
 <20220221192123.749970-4-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220221192123.749970-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/2/22 20:21, Peter Maydell wrote:
> Now that the RTC_CHANGE event is no longer target-specific,
> we can move the pl031 back to a compile-once source file
> rather than a compile-per-target one.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/rtc/meson.build | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


