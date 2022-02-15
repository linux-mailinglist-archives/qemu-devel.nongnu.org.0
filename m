Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF634B6ABE
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 12:26:13 +0100 (CET)
Received: from localhost ([::1]:46424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJvyG-0002AT-IC
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 06:26:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJvns-0004kg-Pi
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 06:15:28 -0500
Received: from [2607:f8b0:4864:20::1030] (port=50895
 helo=mail-pj1-x1030.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJvnq-00010l-7T
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 06:15:28 -0500
Received: by mail-pj1-x1030.google.com with SMTP id m7so17184349pjk.0
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 03:15:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kC7/m81GU7D0Mm6MDJ8k+VUcUgx0DZzPjwi5zvVjdZY=;
 b=SLM6jE6bg8vSjfwfIN6K92nXvwFWZvnuFmn4glTBXvndCrzN7XXbyZnFyIlW4O4Wuw
 xuXWWaAkY24BMZaAiZ+S8LS0Vfdb6sqvqJr2M6976OfknvI+kiPRgk8UFQpIkTKhNDF2
 WA9WW/OZ3Ch/Xae4Zw4f/MJa+lXpD17CWtzFk455bzeZafiuD8ajnCTvAhKHo60yE3sF
 z3m6dclSeoxsV3Puxp7nsGaoTiuDUMwm8Bc60BhBlBU7FPGULtD9/7npggKk9h3Fy1yw
 XMNRrV5+vIYwogVVDvP5uSNVZqdspV905+s50rxBISq3PCVkyjeFNrVNg+oojH//khBd
 qDoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kC7/m81GU7D0Mm6MDJ8k+VUcUgx0DZzPjwi5zvVjdZY=;
 b=qN/ZUc4cps+XR2MkPVuDVhl1cAiQSslsH2zRNiiufvVHmfptBZjBSpc4BapH5Jugzj
 6jg0xKW4oiHFWVYxbqbaL+hnN3kbEdg1c2K1H7HNkb2UN8axmAB74lHXTqCI8FVVV00I
 Ds/F1hKJQ2XprqS9qlKZCocrQMN/OEzaZvqJcjEAWD+YPIEPkn25R2EpxQMC9bNSo6V1
 ErREgpUl3pmNCa7WWV2SUUzn8VlfS86OT4uyyqVKkc3NkCJTdhYaMKjZMlJZp/J8cnax
 x7CZXpE1BiI9jDQGrs/h8TuQqsdyVnJpGD/BP+V+vewsmcO4fsLjZk0YkAD4f6cisIez
 EmpQ==
X-Gm-Message-State: AOAM532yKNgAXE95efzdnL+ILqMWQQe/7y4Z+ay6QWH1Dfd0HK357Gfo
 W35vdM0aq5Halc0nD16Y2sU=
X-Google-Smtp-Source: ABdhPJxIgccC6euHmuWQ6SnwkICMlEugBBbZaEj754w19uEs+Pv8Za395z0itHUqEOaNEFDzdsXzrg==
X-Received: by 2002:a17:90a:fb50:b0:1b8:a941:ec78 with SMTP id
 iq16-20020a17090afb5000b001b8a941ec78mr3768243pjb.147.1644923724246; 
 Tue, 15 Feb 2022 03:15:24 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id 16sm28703743pfm.200.2022.02.15.03.15.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Feb 2022 03:15:23 -0800 (PST)
Message-ID: <b7b7498a-0809-316f-25f1-9695e13b494a@amsat.org>
Date: Tue, 15 Feb 2022 12:15:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: qdev instance_init vs realize split
Content-Language: en-US
To: Damien Hedde <damien.hedde@greensocs.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini
 <pbonzini@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
References: <e9bae713-1051-1bf0-5f3a-d9bb61aade8a@greensocs.com>
In-Reply-To: <e9bae713-1051-1bf0-5f3a-d9bb61aade8a@greensocs.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1030
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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

On 15/2/22 11:19, Damien Hedde wrote:
> Hi,
> 
> I'm wondering if there are rules or convention about what we put in the 
> instance_init() vs realize() for simple devices ? (For complex ones we 
> generally have no choice to put everything in realize())

See Peter's recommendations here:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg723958.html

> For example we can declare irqs and mmios in instance_init() or 
> realize() if they do not depend on some property.
> 
> This is not a big deal, but given how works the help message generation 
> in the monitor, there are difference if the device is user-creatable.
> 
> If we leave irqs and mmios declaration in the instance_init(). They 
> appear in the help message.
>  > (qemu) device_add ibex-timer,help
>  > ibex-timer options:
>  >   ibex-timer[0]=<child<memory-region>>
>  >   sysbus-irq[0]=<link<irq>>
>  >   timebase-freq=<uint32> -  (default: 10000)
> 
> If we delay the declaration in realize(), we only have the declared 
> qdev-properties (which is maybe more what we expect at this point):
> 
>  > (qemu) device_add ibex-timer,help
>  > ibex-timer options:
>  >   timebase-freq=<uint32> -  (default: 10000)
> 
> Any comments ?
> 
> Thanks,
> Damien


