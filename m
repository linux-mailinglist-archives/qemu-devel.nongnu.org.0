Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A264A6AED
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 05:34:18 +0100 (CET)
Received: from localhost ([::1]:47068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF7LV-0000k4-Ha
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 23:34:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nF4J7-0004G6-MB
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 20:19:38 -0500
Received: from [2607:f8b0:4864:20::f29] (port=35779
 helo=mail-qv1-xf29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nF4J4-0007U4-L1
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 20:19:37 -0500
Received: by mail-qv1-xf29.google.com with SMTP id d8so17706565qvv.2
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 17:19:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NTnWhsRXNezkSGDAIwIaEiwrgqrOXm7Alk6fdC0ws5I=;
 b=mr3YotkySa3k/s5r2N7ACkGClxD4wdIhWFhHHMxIPjDaLkTaHRoPnUi8oO5c17gvYL
 K8RfbJ8V1XuFssn8RDpUGw5iKWNIBEfHjEGiMdbPnOYPXn1BOe9j8Foul4Dx4feg9aWR
 JnDjusVLHEgQPb6+tekU+CNQO8xTY7vNbkhjiS+j+D9/b+7Hm+TNZ+WM65r6kDNDtJEr
 mzcqzDIkJglbTiZegdBhKZcN0JPhZRtNF1EBSQoKUSnvushLR5yj1gbVnig9GB2AtHZ5
 9zGlYuxF2vg1V9nYBNvXwt85A1pmYm28j6TtAOcBzmSDKBbbSHADLFmMHzSuL5Ufpvrk
 Ncow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NTnWhsRXNezkSGDAIwIaEiwrgqrOXm7Alk6fdC0ws5I=;
 b=OJNYKnbxPqFFUkcJedHwDLFTpvSqwH7GKvCbEiL/317q+H4yViRjdYBkVdYdmhCDPp
 j9pXvBpNYl5XOtVemeHTFGhjxou8CCK+yKYoj4cNAtR9qQtaLlXehK0k7/xrIHolQInB
 L/cBpVS31zI7E2LZwfiEf1m5Osl5bzI8lqpp7RtMktqNl1rPWL6Et3p+EjIKfORPmWv4
 IHk4gI7NWZrnM3EdbOmws4zNCJ0duU3N+Y6tD01N9mUvahv8biRarwLZzq2YxNbStPSy
 faQx7R5zVA/WlNGOw45EMn3cyyT85aJdFOD5tRleiwmAHibHryL5MvP/QFXW+bevSdAs
 NVEw==
X-Gm-Message-State: AOAM5320FrIhqBMXwrceJuOcgi6ROSGy+F5r2hpaecG3I9gRCqQCbJJB
 bnnn30kjGudX9POcRAPRMTo=
X-Google-Smtp-Source: ABdhPJydoh3f5a+fJaBgHePsA9VJAkU8C5NjqLlP3b/Geh4A596o5uTPJUyA+qgQ2gKxf8RlOQl7iw==
X-Received: by 2002:ad4:5745:: with SMTP id q5mr24243463qvx.55.1643764770594; 
 Tue, 01 Feb 2022 17:19:30 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id u17sm5643496qkp.23.2022.02.01.17.19.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 17:19:30 -0800 (PST)
Message-ID: <d63de344-2aee-f0c2-78a0-36ac72a1d578@amsat.org>
Date: Wed, 2 Feb 2022 02:19:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH v2 14/25] tests/lcitool: Allow lcitool-refresh in
 out-of-tree builds, too
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: minyihh@uci.edu, ma.mandourr@gmail.com, Luke.Craig@ll.mit.edu,
 cota@braap.org, aaron@os.amperecomputing.com, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com, fam@euphon.net,
 berrange@redhat.com, aurelien@aurel32.net, pbonzini@redhat.com,
 stefanha@redhat.com, crosa@redhat.com, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20220201182050.15087-1-alex.bennee@linaro.org>
 <20220201182050.15087-15-alex.bennee@linaro.org>
In-Reply-To: <20220201182050.15087-15-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f29
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f29;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-qv1-xf29.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 1/2/22 19:20, Alex Bennée wrote:
> From: Thomas Huth <thuth@redhat.com>
> 
> When running "make lcitool-refresh" in an out-of-tree build, it
> currently fails with an error message from git like this:
> 
>   fatal: not a git repository (or any parent up to mount point /)
>   Stopping at filesystem boundary (GIT_DISCOVERY_ACROSS_FILESYSTEM not set).
> 
> Fix it by changing to the source directory first before updating
> the submodule.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> Message-Id: <20220201085554.85733-1-thuth@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/lcitool/Makefile.include | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

