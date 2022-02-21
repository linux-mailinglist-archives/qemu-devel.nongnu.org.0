Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0677E4BEA4A
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 19:55:40 +0100 (CET)
Received: from localhost ([::1]:35634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMDqU-0001gF-Jc
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 13:55:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nMDjA-0007dF-0h
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 13:48:06 -0500
Received: from [2607:f8b0:4864:20::42e] (port=44772
 helo=mail-pf1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nMDiy-00057e-H1
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 13:47:53 -0500
Received: by mail-pf1-x42e.google.com with SMTP id y11so9634769pfi.11
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 10:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=0TU7m2Z3+hx8+U6FNpTt0jaWWkbN3BIwahHP0aDC0h8=;
 b=E5vmXYPvfNLlBamklt6iZ6G2frnY4p3A00+83ZIGTaCzJ/CKlormNFg9DGr1PqBcjV
 y3Qe/2lv4/UvWIzWbNRiWHqupRJRLvW70H5bNrutaMygMUPhryf35TYkXuI/05WTmo7g
 gJ6vTPdkPBR3fWPzxaAU4lEmHwomCUYS3eESvwJVQESiIOmANnlQ8X08Hah/O8GpHVKP
 64vijVzCuxZdvGubnCyVaflpZlThR1T+eilIxU6usis+H6XeGuxLQuZ3+CdhLkslfADr
 XKetKVUbLP3/5dKTZIwG/KOXHBDcUI2EySJSN8AUJ8nbPoRIMmaiICTlpC490fV3vM/s
 DPlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0TU7m2Z3+hx8+U6FNpTt0jaWWkbN3BIwahHP0aDC0h8=;
 b=znxQHVXnIMTR8D6C0O/K4w4Qi5JZlBDo0ZWhR0B4dy9SjifPzbF9PIDjYeuKB+qQOb
 nehvwQVGdf0cncuWmkz+u2URBqV2UYTu5BbZgflIOxDfZXf3JCy+5+YQFzk0afReGgo4
 xNKlS76PYo4bSxl6ad0n+7IqEmnMReS1ER0YMv2oF8UHgIkhQcDBvIiR2JshMoK32er0
 8LR6/lERsqjjKrFMaPUoVP1qDPIxoXh+KhwBjCZAh99Y1A/vlII7ZX+e7pGyjCjlJf9i
 F7iSWSnwymVQM/pI+/L+vqP80ofuXJNonktngV+K/ktuQWws3UTZF1I4VjUBpYX5DYvm
 FCSg==
X-Gm-Message-State: AOAM532/0hCyNSAhCfoJpEJBuNHEFtxJDmTuCF3Scn72QG3Ag/ARuAS+
 GlxDlO2A9cNWRJfIZFh8v6s=
X-Google-Smtp-Source: ABdhPJyCwfO6QWLb7MI9SixgOiUtCj8FFrTP3sTVjd2JBZVPNXjteYcPlXJITOm+EIAmzjv4Sp0NTQ==
X-Received: by 2002:a05:6a00:134c:b0:4e1:75b:ca4b with SMTP id
 k12-20020a056a00134c00b004e1075bca4bmr21311333pfu.37.1645469268084; 
 Mon, 21 Feb 2022 10:47:48 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id g1sm12778670pfu.32.2022.02.21.10.47.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Feb 2022 10:47:47 -0800 (PST)
Message-ID: <0375cd23-a30b-1647-e7ce-033ce8e9ef3f@gmail.com>
Date: Mon, 21 Feb 2022 19:47:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.0
Subject: Re: [PATCH] analyze-migration.py: Fix instance_id signedness
Content-Language: en-US
To: Fabiano Rosas <farosas@linux.ibm.com>, qemu-devel@nongnu.org
References: <20220221175357.2103775-1-farosas@linux.ibm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220221175357.2103775-1-farosas@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42e.google.com
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
Cc: eduardo@habkost.net, crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/2/22 18:53, Fabiano Rosas wrote:
> The instance_id field is uint32_t in the migration code, however the
> script currently handles it as a signed integer:
> 
> $ ./scripts/analyze-migration.py -f mig
>   Traceback (most recent call last):
>     File "./scripts/analyze-migration.py", line 605, in <module>
>       dump.read(dump_memory = args.memory)
>     File "./scripts/analyze-migration.py", line 539, in read
>       classdesc = self.section_classes[section_key]
>   KeyError: ('spapr_iommu', -2147483648)
> 
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> ---
>   scripts/analyze-migration.py | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


