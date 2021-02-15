Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E6731B5C4
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 08:57:21 +0100 (CET)
Received: from localhost ([::1]:39212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBYky-0004jI-NM
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 02:57:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBYjv-0004HP-J1
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 02:56:15 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:46770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBYjr-0007Yr-4T
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 02:56:15 -0500
Received: by mail-wr1-x42e.google.com with SMTP id t15so7715757wrx.13
 for <qemu-devel@nongnu.org>; Sun, 14 Feb 2021 23:56:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Kxe2grwL7gXSNYQuQdibTAnJAe/fVXoVtjbILRwcPd8=;
 b=R2TSDzZpPEO0L6122p0L3AaeI5NC0Rhbcrry82aHcI2TJbBWXxQ55kaoHgxS1lMOnh
 rgAZlmNhUVaBqqnvFAmL+a6sSuN9jZYHW9Sip/4VoVRqK8vT7/vYGGgBEMta493OqS84
 USGbDswpTDRQGBkQii7UuuDE5IRmg4zL/0sD2mGo9m5PtgGgBY416mRaassssu3YEBTV
 MLggd8EEYMyXcsoP1ew0o2yCAiAEG0E94iH6PbXCeC/69Gk2BqLBpxTsGmrb2aoY55SE
 ODKoU977yG64UYM2utbwARcF2kBa5T0uJ5q86jZD+Kl+fseL7QBbZkS+kkHLpKRcnkdB
 CVWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Kxe2grwL7gXSNYQuQdibTAnJAe/fVXoVtjbILRwcPd8=;
 b=bgWCunOkrcCe3+zeuSSamLa/UG3TZu5BINpdwpwZJ5bjM3GwqdKhCYhabL5NncBpy+
 UDoYGfrVD/RxMMh5BABLv9IgIwLBQcy/D4Mw9UcB0icOBNlTof7IUUaXNfZgfPuESn76
 Dc4Qc7PxG3j51hehBFV2w0iDb84puNAUpdy+DWu4/LnOiovEjCJEmtG6FpHJs72nTY0q
 xytgJQ2NpHTpmmgnumOUOKgbZvcFpxThZW2JBHmXHt186/TD2WjbwQGM5FoZZcCfBthu
 l/DIJew4xYj07z3oQcjO8glRH+38NbTyBygn6Q1uvLPCl5fxRenzGYdIHQRjE+MkPOsU
 8JzQ==
X-Gm-Message-State: AOAM532zw7uCS48sCOR4pKJKWJi+oXIYrdJYHPICN8n3MpiE/x09xfvU
 RRhtvb6eFLeo+J8K6VsTl+M=
X-Google-Smtp-Source: ABdhPJwuJIeDP+ZsdRtox7KvehKiSvS8mSw1WTc0Sc4jU3slejGFQM+8zAimpRedLoTNccFQ5RB1Bw==
X-Received: by 2002:adf:df8e:: with SMTP id z14mr3849650wrl.108.1613375769314; 
 Sun, 14 Feb 2021 23:56:09 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id v17sm17321007wru.85.2021.02.14.23.56.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Feb 2021 23:56:08 -0800 (PST)
Subject: Re: Qemu mipssim patches, mips malta and virtio bugs
To: Thomas Huth <thuth@redhat.com>, Reinoud Zandijk <reinoud@NetBSD.org>,
 "Maciej W. Rozycki" <macro@orcam.me.uk>
References: <20210211153746.GA25676@dropje.13thmonkey.org>
 <acf26892-c47c-7059-f3d1-8ef5bdcdcb8b@amsat.org>
 <2951213f-7610-857d-c20c-12bc26877490@amsat.org>
 <YCekTE6Aik0OoLLg@diablo.13thmonkey.org>
 <b86fcf3d-8be4-0d6e-e85b-7b4137fc7238@amsat.org>
 <4e4e5704-ac91-f577-8b7b-ce5393cc98cd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <0541d724-d88c-47ac-ede7-6e4657af12cc@amsat.org>
Date: Mon, 15 Feb 2021 08:56:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <4e4e5704-ac91-f577-8b7b-ce5393cc98cd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Maciej & Laurent (the last time Aleksandar Rikalo made a comment
was 9 months ago).

On 2/15/21 7:39 AM, Thomas Huth wrote:
> On 13/02/2021 14.14, Philippe Mathieu-Daudé wrote:
>> On 2/13/21 11:05 AM, Reinoud Zandijk wrote:
>>> On Fri, Feb 12, 2021 at 10:44:55AM +0100, Philippe Mathieu-Daudé wrote:
>>>>>> i'd like to get the following simple patches to the MIPS/mipssim
>>>>>> target adding
>>>>>> virtio-mmio devices to it.
>>>>
>>>> Please submit your patches as a series so we can review them on
>>>> the list:
>>>> https://wiki.qemu.org/Contribute/SubmitAPatch#Use_git_format-patch
>>>
>>> Oh thanks, i didn't know that; i've created a new patch with the OR
>>> gate you
>>> suggested. We deliberated about the change here and we'll at least
>>> keep it
>>> here locally for testing and profiling code until a real `virt'
>>> platform is
>>> developed for MIPS. Until then it would IMHO be a good expansion to
>>> mipssim.
>>> I'll try to get a proper patch posted on the list :)
>>
>> What I forgot to mention is that QEMU aims to keep models the closer
>> to the hardware, so modifying MIPSsim to some Frankenstein is unlikely
>> to be accepted.
> 
> Well, mipssim never was a real hardware, in fact it is already some kind
> of "virt" machine. So you could theoretically also extend this machine
> instead of introducing a new one (but I'm not a MIPS guy, so no clue
> what makes more sense).

See docs/system/target-mips.rst:

  The mipssim pseudo board emulation provides an environment similar
  to what the proprietary MIPS emulator uses for running Linux. It
  supports:

  -  A range of MIPS CPUs, default is the 24Kf
  -  PC style serial port
  -  MIPSnet network emulation

and
https://web.archive.org/web/20180902214325/http://www.linux-mips.org/wiki/MIPSsim:

  MIPSsim is a proprietary software emulator product of MIPS
  Technologies. It emulates a fairly simple system with two
  8250-class UARTs and a simple network controller. MIPSsim
  consists of several simulators that differ in performance,
  degree of details and debugging features. One for example
  maintains every bit in the system as having three states:
  0, 1 and uninitialized. It's cycle accurate simulator may
  be slow but allows accurate predictors of performance.

  Support status

  MIPSsim support is deprecated and scheduled for removal in
  late 2012 (for the 3.7 release)

  MIPSsim is supported by a stock Linux/MIPS kernel since
  several years. MIPSsim is a proprietary product that is not
  available to the general public. However Qemu supports a
  MIPSsim target as well. That said, MIPSsim is an extremly
  simple platform and virtually everybody is better served by
  the other targets supported by Qemu and the Linux in general.
  At the same time it also appears MIPS Techologies has been
  shifting away from MIPSsim for a while and as such MIPSsim
  support in the kernel is considered obsolete and will
  eventually be removed probably whenever its continued support
  is getting in the way of more useful work.

I doubt MIPS Techologies still has plans for MIPSsim.

Anyhow if we add a virt machine, it does not make sense to use
the NS8250 and MIPSnet devices... We should use the virtio ones.

Regards,

Phil.

