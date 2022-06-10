Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABAF5467FA
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 16:03:34 +0200 (CEST)
Received: from localhost ([::1]:34958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzfEZ-0001a8-0G
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 10:03:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzfAQ-0000LL-69; Fri, 10 Jun 2022 09:59:14 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:54990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzfAO-0004Wx-Pz; Fri, 10 Jun 2022 09:59:13 -0400
Received: by mail-pj1-x1032.google.com with SMTP id j7so24086931pjn.4;
 Fri, 10 Jun 2022 06:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IYtjP5GlhRVYNEVlv0MH1rBrYn+WNryltop+DIMu1K0=;
 b=ChM8IxqTIAaFAtSJcPDyf+TIXhnmyXSL64hS7OWW6yF7y2JOHzg2KSQmG/eMurKmNI
 h9k1Iosa3Tfe/zbpJB40DmwdyM7Lbh276rHZj0h45iW4Kx+l9qwC+1Km1xUBd/A+geVa
 8fvQrlIZadBUW9TcfU9j0a9q/sZAKufgOfejhjBfxGKQpSOH0TlXsRhiRi2ffeMPYeUM
 41v1zi8eOvIxA2JG0NnVt6MT0sM5I6Sag69dD49DkE8xOUscja64GmDRP9d8H8IpgIav
 BygHgPxy4f6DKPeGniiOrU8OnnyHlQKDzws2/1kujt2lnA3f5lXqKD5rzYaqTq4yX+hS
 tlCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IYtjP5GlhRVYNEVlv0MH1rBrYn+WNryltop+DIMu1K0=;
 b=mZHEI/rv6CHOThaqi0SoXJOEsDqBNSL9ocd081lBNL5U+grU1D8HeeLkzzgCF6UK7a
 OmxNtdpOGV8WPEHvOg48PxqtTJGc412spTO3DV6WHcx0W3ZnH0DEh0b9AUFS1jiRupVl
 l863vM67OHq8Nv5vYGhKkA8L89wnfEdgKeL+YQU47c0Y6dvMhyAitfp/br/1Kqi0z7AG
 amF4oPxNsZj6geXdhyTFathcErB4Y7ptRCi8smVFtDmmcdjdKLG6BP0q0Pd8lReHhw1D
 zRpnrufIN1oUQQHKr/YZc6NJJkKmNzgu6HBPplBYqYNmmu6zTpUw5kibYV0bVssDfJIP
 V/LA==
X-Gm-Message-State: AOAM533uxvOhlsMUjfHixDqgvLWo0WAKpynRf8ycNNJtdiRctH8prEvt
 AoW00oO3j6smCbooWpWHFNs=
X-Google-Smtp-Source: ABdhPJxyvayb8Jq4qhX/VeTDFGjihI75M1VkyZwJVTdPZcXu/0g2qWPMk1O0fQ++4TDkfq/k357j0w==
X-Received: by 2002:a17:902:e8d3:b0:163:9146:2241 with SMTP id
 v19-20020a170902e8d300b0016391462241mr44241425plg.93.1654869550059; 
 Fri, 10 Jun 2022 06:59:10 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 gd3-20020a17090b0fc300b001e2da6766ecsm1761957pjb.31.2022.06.10.06.59.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jun 2022 06:59:09 -0700 (PDT)
Message-ID: <ffbf6eb4-8d50-23fa-cc68-8b557f645147@amsat.org>
Date: Fri, 10 Jun 2022 15:59:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH v3 0/3] QOM improvements for rtc/mc146818rtc
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: qemu-trivial@nongnu.org, Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20220529184006.10712-1-shentey@gmail.com>
 <CAG4p6K77BxKXxdS53df67zLh=dZfEFubeMtfPBaU1gxWtY_ZAw@mail.gmail.com>
In-Reply-To: <CAG4p6K77BxKXxdS53df67zLh=dZfEFubeMtfPBaU1gxWtY_ZAw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 2/6/22 23:18, Bernhard Beschow wrote:
> Ping
> 
> Am 29. Mai 2022 18:40:03 UTC schrieb Bernhard Beschow <shentey@gmail.com 
> <mailto:shentey@gmail.com>>:
>  >v3:
>  >* "iobase" is now u16 (Philippe)
>  >
>  >v2:
>  >* Explicitly fail with &error_abort rather than NULL (Mark)
>  >* Explicitly fail with &error_abort rather than NULL in existing code (me)
>  >* Unexport rather than remove RTC_ISA_BASE (Mark)
>  >* Use object_property_get_*u*int() also for "iobase" (me)
>  >
>  >v1:
>  >This little series enhances QOM support for mc146818rtc:
>  >* makes microvm-dt respect mc146818rtc's IRQ number set by QOM 
> property and
>  >* adds an io_base QOM property similar to other ISA devices
>  >
>  >Bernhard Beschow (3):
>  >  hw/i386/microvm-dt: Force explicit failure if retrieving QOM property
>  >    fails
>  >  hw/i386/microvm-dt: Determine mc146818rtc's IRQ number from QOM
>  >    property
>  >  rtc/mc146818rtc: QOM'ify io_base offset

Series queued via mips-next tree, thanks!

