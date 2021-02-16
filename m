Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB4B31C903
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 11:45:37 +0100 (CET)
Received: from localhost ([::1]:51282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBxrM-0000sV-K4
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 05:45:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lBxpn-0000I8-3t
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 05:43:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lBxpl-0004eE-Dn
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 05:43:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613472236;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vf77m73R06T6l/NjzFMYRHKpgQXovrierbD1h/N5H6w=;
 b=YAyTheQE1uu7Jhgho0KqM+8bWtWibxFs2qJdh5beFsR+Qs3lVt1FxSQOwQqzqpNEBqGi37
 N9aLmVZ0fBiuf1VXgLxCtsjxpsdaaT0xo/z9XTCI9X/APCNu9/Yiy6FB2YGrvcX92LyVgg
 9/j0UDdJg0zUHWRLBUW+IWmrzqT+5/k=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-196-TFGm67bwPF6so6gUAFeUGg-1; Tue, 16 Feb 2021 05:43:53 -0500
X-MC-Unique: TFGm67bwPF6so6gUAFeUGg-1
Received: by mail-ed1-f69.google.com with SMTP id dk21so201211edb.10
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 02:43:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Vf77m73R06T6l/NjzFMYRHKpgQXovrierbD1h/N5H6w=;
 b=KN8GPcfKvRSp1s3KZcUxcxBFtdL1q5gcMZYPiRDUCz/L9OOQj7vxuaWos1VUnxvD7f
 146QAyCV0CmmQXrbmhmaDJiNcTcuaMd2nVbFtD14lH3lBuR4Hywq35lXnofbKoSgHYsD
 ts3+imgqE/Zqf0gJchAZ9l9sQO+mZl3VRknX8ngu+la1eUnJsGEhvYwbVTuBk3otW8Z+
 WE6ButjulZD5IoyFXHn9euIv0FgmbK/NcvMvTKLrASEzmPRDAO6h37qsbt/AtFYSzvnk
 QV56KExQ19HQMDNtV0WQ+Cc82G7ql4+ZDklRzw0orDqcEqW+VnjNE1X9rMEX857K1Ld1
 F6kw==
X-Gm-Message-State: AOAM530k4Cayg7GS1KyKiiDHaYS3NbD2Z6aqZPB3/FlU3L/aHyqiMzDJ
 hyQyukVlGXNNjjfSX4ok5dWlb27/gAqs4LjkqT0gPyNUQ090SVT/21iU8BijGSsEf9cSmj8jdbK
 I6RLMUlnwx6g99HVkEL4SUSdF+Epcd2XS0oyGElc5cRI6WbLI+NWJjmgZwfH4QJ8xrh4=
X-Received: by 2002:a05:6402:2053:: with SMTP id
 bc19mr19679374edb.230.1613472231714; 
 Tue, 16 Feb 2021 02:43:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzAYoe8b60AW+ZTe0X77rFQ0ewlLsX4HIoU/4BVSIzZRGFyyyV3H9E7XEeGTvAYkLR+mz4eOg==
X-Received: by 2002:a05:6402:2053:: with SMTP id
 bc19mr19679363edb.230.1613472231493; 
 Tue, 16 Feb 2021 02:43:51 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id k9sm13277846edo.30.2021.02.16.02.43.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Feb 2021 02:43:50 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210123143128.1167797-1-pbonzini@redhat.com>
 <20210123143128.1167797-32-pbonzini@redhat.com>
 <CAFEAcA8R84_-BPG-suKDvkpE1BxG8o1edGv=zfU_CCw27pK4eg@mail.gmail.com>
 <CABgObfZNy_j3DYt3NKKvC1Ou8TW2zACZ2LffnrR7LU8PeS5hww@mail.gmail.com>
 <CAFEAcA_6RiR+ud5U0Y9K3jNmEoQ-Ex8fZN3-o0MkLxpK8PROgw@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PULL 31/31] qemu-option: warn for short-form boolean options
Message-ID: <378df6af-8383-8a51-4286-54739dba99e4@redhat.com>
Date: Tue, 16 Feb 2021 11:43:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_6RiR+ud5U0Y9K3jNmEoQ-Ex8fZN3-o0MkLxpK8PROgw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/02/21 10:58, Peter Maydell wrote:
>> Unfortunately there is no way to change the code to distinguish okay
>> uses from broken ones. The fundamental issue is that QemuOpts is
>> sometimes typed and sometimes not, so it lacks the information to say
>> that "-chardev socket,server" is fine but "-device virtio-blk-pci,noserial"
>> ("set serial number to the string 'no'") is not.
>
> That is definitely a nonsensical example. But it's not clear to me
> that it's an improvement to start forbidding previously sensible and
> working command lines in order to be able to diagnose nonsensical
> command lines which it seems unlikely that anybody was ever actually
> using.

The problem with QemuOpts is twofold, in general and specifically for 
short-form boolean options.

On one hand it's the parser itself that is too permissive, because it 
applies a concept that is valid for boolean (short-form options) to all 
types.  This is the above "noserial" case.

On the other hand, the typing of QemuOpts itself is not something that 
is used a lot, especially as more and more options become a sort of 
discriminated union and therefore cannot really have a schema that is 
described in QemuOptsList and this means that it's not really possible 
to fix the other problem within QemuOpts.

The question is whether it's fixable in general.

For this to work, one would need to have a typed string->QAPI parser, 
i.e. one that takes the schema as input rather than doing a generic 
parsing to QDict and then using the schema via the visitor.  That would 
IMHO be overengineered for the purpose of saving five keystrokes on 
"server,nowait".  But even if that were possible, there are two issues:

1) the short-form "-machine kernel-irqchip" is applied not to a boolean 
but rather to an on/off/split enum.  So we would have to either 
introduce extra complication in the schema visitor to distinguish 
"extended boolean" enums from the others (and then, once we have defined 
the concept of "extended boolean enums", would we also accept yes/no in 
addition to on/off?).

2) the lexing is ambiguous.  For example virtio devices define a 
"notify_on_empty" property.  Attempting to set this property with a 
short form would fail, as it would be interpreted as 
"tify_on_empty=off".  Even worse is hw/isa/lpc_ich9.c's "noreboot" 
property (though the device is not user-creatable) for which it is 
possible to write "nonoreboot" but not "noreboot" (interpreted as 
reboot=yes).

I understand that none of these problems make it *impossible* to keep 
the short-form boolean options or even to reimplement them.  However, 
they do make me question whether they are a good idea and not just a 
historical wart.

Again, I do not plan to remove the short forms from QemuOpts.  However, 
I would like not to lock QEMU into the QemuOpts parser and its many 
issues, which are preventing a cleaner evolution of the QEMU command 
line.  (In particular I would like many command line options such as 
-smp, -m or -icount to be syntactic sugar for record properties -machine 
smp.xxx, -machine mem.xxx or -accel tcg,icount.xxx).  Even though I have 
not yet posted patches for this due to the deprecation period of 
short-form boolean options, I _did_ propose the deprecation only after 
writing a bunch of other code around command-line parsing cleanups.

Paolo


