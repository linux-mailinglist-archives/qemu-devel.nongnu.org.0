Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE77E226E7E
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jul 2020 20:44:34 +0200 (CEST)
Received: from localhost ([::1]:38040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jxam9-0004YM-Ak
	for lists+qemu-devel@lfdr.de; Mon, 20 Jul 2020 14:44:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jxal9-00048q-TS
 for qemu-devel@nongnu.org; Mon, 20 Jul 2020 14:43:31 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:54688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jxal8-0006tT-7w
 for qemu-devel@nongnu.org; Mon, 20 Jul 2020 14:43:31 -0400
Received: by mail-wm1-x342.google.com with SMTP id o8so477772wmh.4
 for <qemu-devel@nongnu.org>; Mon, 20 Jul 2020 11:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3t50S4nFrF2u3e/OoZCW/FVAH3XFx2/20dJyhqxIe30=;
 b=HlzLWTYv0ZpqcXNgYFpGgYcnyHuO9aOpcx9F/+u7cZ2RaV4K/DMbzzVXimYu3PD28q
 4OSVEw4+zKQwhBS/0bmawNZxwagT8P4xLhX4DpTP+fu2Vze4FwXDfK75xcnMKlkDZ7VO
 l6e0iPu8QasyhUyvZ6Gy/4FkiEHwz1+EXwSGUMEkFslmxm7Il0nBVFP8qE031f7EbW/G
 TQ+7lTEHupPnlNLJxd3k3w13NkP+NvZPZVdvI/MRrLAJ5vsd1FwZtW44P6s5yNSPB3wy
 XgF2nRk908xRvicyHCZ0ELA6qpQYNB6fIBc+qJ+d5Uiq6TJ4IQtm5/YgU/uT5N3V3YyW
 3hpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3t50S4nFrF2u3e/OoZCW/FVAH3XFx2/20dJyhqxIe30=;
 b=SXmzQfQBwnZCy6L1yaM4Ob2zfltrrcArT0KXHsxLqKrC772bUjvEG8nRdqEL0LanNP
 z2CDo4q56qxyacKCapMf+fq4IyeQCgYDDT1ZgP7lFE6Qn0LmGw6ebBcQbAWiwb/Q38NG
 NOkTzkMSCk2KpYbI9UTgdUyFgDExMDOhkFUHJjdG30EJYdXlNjjbVEDAdVIADiIMe6hI
 rSkXp5JAVKeqeh1Xu758CVEjEgCQzgImjQcIgfA4CC7wCs6NWLZJKehVRTX64I+vv8iJ
 4e3BYibNXaf1rlFrCyX5FYabHwpzTckQK4k2D2hmrDY4LgbVaASLj58VwUVEfczUnI2A
 NIgw==
X-Gm-Message-State: AOAM531u+5S4cQ+zRMaDMZxqQRGX+ONt3SQ4tXoZvw3k50b9h2ZfvsYf
 uCcRfKjkTYzH+uTm2Dd4E9Q=
X-Google-Smtp-Source: ABdhPJwSitBl3b1QplvZRNbdE/xJT2m9c7AdqoyK22VQ/rSteprgWhI1bkHRMkVWyk7/rFtq2QSwTQ==
X-Received: by 2002:a1c:2dc6:: with SMTP id t189mr659368wmt.26.1595270608738; 
 Mon, 20 Jul 2020 11:43:28 -0700 (PDT)
Received: from [192.168.1.37] (138.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.138])
 by smtp.gmail.com with ESMTPSA id x7sm34472255wrr.72.2020.07.20.11.43.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jul 2020 11:43:27 -0700 (PDT)
Subject: Re: [PATCH-for-5.1 3/4] qemu-common: Document qemu_find_file()
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20200714164257.23330-1-f4bug@amsat.org>
 <20200714164257.23330-4-f4bug@amsat.org> <20200720141607.GH643836@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <7a2a34b7-9973-08ca-fa5f-f01332584cf4@amsat.org>
Date: Mon, 20 Jul 2020 20:43:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200720141607.GH643836@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sarah Harris <S.E.Harris@kent.ac.uk>, Stefan Weil <sw@weilnetz.de>,
 qemu-devel@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/20/20 4:16 PM, Daniel P. Berrangé wrote:
> On Tue, Jul 14, 2020 at 06:42:56PM +0200, Philippe Mathieu-Daudé wrote:
>> Document qemu_find_file(), in particular the returned
>> value which must be freed.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  include/qemu-common.h | 14 ++++++++++++++
>>  1 file changed, 14 insertions(+)
> 
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> 
>>
>> diff --git a/include/qemu-common.h b/include/qemu-common.h
>> index d0142f29ac..d6a08259d3 100644
>> --- a/include/qemu-common.h
>> +++ b/include/qemu-common.h
>> @@ -110,6 +110,20 @@ const char *qemu_get_vm_name(void);
>>  
>>  #define QEMU_FILE_TYPE_BIOS   0
>>  #define QEMU_FILE_TYPE_KEYMAP 1
>> +/**
>> + * qemu_find_file:
>> + * @type: QEMU_FILE_TYPE_BIOS (for BIOS, VGA BIOS)
>> + *        or QEMU_FILE_TYPE_KEYMAP (for keymaps).
>> + * @name: File name
> 
> s/File name/relative or absolute file name/
> 
>> + *
> 
> Insert:
> 
>   "If @name exists on disk as an absolute path, or a path relative
>    to the current directory, then returns @name unchanged.
> 
> 
>> + * Search for @name file in the data directories, either configured at
>> + * build time (DATADIR) or registered with the -L command line option.
> 
> s/Search/Otherwise searches/
> 
> 
>> + *
>> + * The caller must use g_free() to free the returned data when it is
>> + * no longer required.
>> + *
>> + * Returns: absolute path to the file or NULL on error.
> 
> It doesn't always return an absolute path. It can return a path
> relative to the currently working directory via the initial
> short-circuit access() check.
> 
>    Returns: a path that can access @name, or NULL if no matching
>             file exists.
> 

Thanks for the corrections!

> 
> Regards,
> Daniel
> 

