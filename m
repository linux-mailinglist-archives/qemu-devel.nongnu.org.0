Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6486C1A26
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 16:48:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peHjd-0005l6-9T; Mon, 20 Mar 2023 11:47:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1peHjb-0005kl-1z
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 11:47:43 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1peHjW-0004uw-Ba
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 11:47:39 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 az3-20020a05600c600300b003ed2920d585so9465331wmb.2
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 08:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679327256;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=703RDtzK5aHBgd1F3RzHtlXSIxMPVA8GxQPmUARvs7g=;
 b=BjqaExN/LKmn5OeTxyUL6JrGqpABOM6tnX1rjdmokdWuIDt9IE2+RtNIJxDlZX+UdD
 /WJh/7wE9ibdDvmw1MUicV/9r0hJE1aRcJom8zzkWGOUycXMUAbVmAB4LQtUYCPrzdzR
 CBl43XJdFTwVRC7RgBIbQxO+taTuER/j8y4YvbwTchhOwm4RAlRdazdhLiixotxXlCCD
 i3P7wFw8qjVtZNfboRHgoCM/DandYmpQkuvXziXcub4/R/L52EKLBMlkhYm7s8VTseLY
 BHMkuZ/BDSmp/uegBS8pi4pueNwV1n6OSYSO3c8LiRzS4hxQ7HR4AJYD0INffM5ARpv1
 IykQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679327256;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=703RDtzK5aHBgd1F3RzHtlXSIxMPVA8GxQPmUARvs7g=;
 b=dBi41nC69tQ96AX6kRqpVxul6NtqBYTOGSXd2Z+lndNutwxQGm4eh8K0rRRpEldxlE
 Ahw5UEs1ZlKYfWL3Fj6wHk/97uIqiBV0vdRludBPnmtClyYlLG75MrpmFBaV/GYI51Gz
 4u1hDAHH/P8SwrMiAdw5Zp2yGf1Ih8gDIBK8LJXE7/7LsipIO7JAOrqeLJPbuVhMV42t
 868RaF1In0g6BsEk80HFj0Ud+FSWv3oygaqodqVkrXL9/6TvTciwyYBLR+x4H2x/LlI0
 AnCMNY7yuMsFBBqqiMV3bYp7wOTjyGF9jHEKbvA1DvoX/E/f+BJD8uf+i6sA1aYcCUMX
 4u4A==
X-Gm-Message-State: AO0yUKWswMEGOnTsDYaFB1R+ciXOEkkA5Msg3RA4bWsmI0lBVhotI+Cz
 fXsF0MVxKhurJchtrm+IJD+ufg==
X-Google-Smtp-Source: AK7set8oBw1PIRS3MshO0LCSlLZeMQAAh25+LtrkjAdNcVPhcFUP4Ze/WbgNM59FgOJ7LXmw6DDbug==
X-Received: by 2002:a7b:c382:0:b0:3ed:2949:985b with SMTP id
 s2-20020a7bc382000000b003ed2949985bmr4100wmj.23.1679327256272; 
 Mon, 20 Mar 2023 08:47:36 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 l26-20020a05600c2cda00b003dd1bd0b915sm16964570wmc.22.2023.03.20.08.47.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Mar 2023 08:47:35 -0700 (PDT)
Message-ID: <393c8070-e126-70de-4e85-11ac41d6f6be@linaro.org>
Date: Mon, 20 Mar 2023 16:47:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: KVM call for agenda for 2023-03-21
Content-Language: en-US
To: quintela@redhat.com, qemu-devel <qemu-devel@nongnu.org>,
 kvm-devel <kvm@vger.kernel.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <87zg8aj5z3.fsf@secure.mitica>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>, =?UTF-8?Q?Herv=c3=a9_Poussineau?=
 <hpoussin@reactos.org>, BALATON Zoltan <balaton@eik.bme.hu>,
 "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <87zg8aj5z3.fsf@secure.mitica>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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

Hi Juan,

On 18/3/23 18:59, Juan Quintela wrote:
> 
> Hi
> 
> NOTE, NOTE, NOTE
> 
> Remember that we are back in that crazy part of the year when daylight
> saving applies.  Call is done on US timezone.  If you are anything else,
> just doublecheck that it is working for you properly.
> 
> NOTE, NOTE, NOTE
> 
> Topics in the backburner:
> - single qemu binary
>    Philippe?

Well we wanted a slot to discuss a bit the design problems we have
around some PCI-to-ISA bridges like the PIIX and VIA south bridges.

One of the main problem is figure how to instantiate circular IRQs
with QOM. Ex:

   devA exposes irqAo output
        wires to irqAi input

   devB exposes irqBo output
        wires to irqBi input

How to wire irqAo -> irqBi *AND* irqBo -> irqAi?

However personally I was busy with debugging issues opened for the
8.0 release, and it is probably very late to schedule with Mark and
Bernhard for tomorrow...

> - The future of icount.
>    Alex?  My understanding is that you are interested in
>    qemu 8.1 to open.
> 
> Anything else?
> 
> 
> Please, send any topic that you are interested in covering.
> 
> At the end of Monday I will send an email with the agenda or the
> cancellation of the call, so hurry up.

