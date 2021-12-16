Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D69A4775F9
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 16:30:43 +0100 (CET)
Received: from localhost ([::1]:48126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxsiQ-0001W1-5S
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 10:30:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mxsgM-0000mw-12
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 10:28:34 -0500
Received: from [2a00:1450:4864:20::331] (port=38633
 helo=mail-wm1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mxsgK-00086O-6j
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 10:28:33 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 p36-20020a05600c1da400b003457428ec78so839701wms.3
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 07:28:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GH8wM7rNeI7/vlORnQgeg8n3AqVIkJAnaLwSiVtjIIs=;
 b=pW7tXMJO1Dp3NcjfSoi/p+PLlOKhC0vtnR9WJaMedzhTtW1rMOpI0nIUNSDrycql1r
 kUqm+A1aU/RsyLDJuDeTiaeIZ63KGLO6cLicJvVNZGuS+eHu1C3oHtTTAKG0FNQAtp1H
 wZyFffelml58R/TSMeQog2ZKHsysvqyv50S6mlra0rV4bJCgP+9oxIzKGS7SPWGb9yFv
 g38sjKN1O2Z2OaIPBbqM7bG17ESwTQZg5sSRZakbQ6Ym1wwNVGVes8RNhXBq+AT8W9Z3
 lQdoITJsbz7ENKtITnSKyoaf1FuXCJMfm8ZtF07r9db3TbbDV6M8cR4Bk8cwKcddWCWM
 j2jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GH8wM7rNeI7/vlORnQgeg8n3AqVIkJAnaLwSiVtjIIs=;
 b=7P+0amea9TJ5Rlq4kCc6Et53yom8zJWoiESTQYv72KGJnvi1ivA2DXXP4tsvxydiwx
 sH2HkSbASJfm009DNEyrLjwZpO2XFgUpRAV+XmiYjbd1Usem53cVyEaL6kulb4rQGbm+
 ercUx4zN3VSamlx5D9PUb6LWVQNBmhInx0U94uaJ9ItALAXef1yIRaXnf3OLVGkRfnrE
 VXibSffE9gOV/KNkcvx60NwLYhWiT0R0x1zZDeoixOeBkPSU1OnZGNlWpyIScx2YY6pR
 Wkan0Bbjor3vh4QDUVcoukhVJ+ilk3qTcxvbzYLc5Jih30NBVAzNzbQDoeSX5HpifCh9
 Zfkw==
X-Gm-Message-State: AOAM530D/w53LK1oRLch4Kn55Z49xvppw0mepH0g1zToc95tknj1k9Mj
 zhIGKdvBX7T0K6z/CscAhxE=
X-Google-Smtp-Source: ABdhPJyOK2DENtcfHeeUHVZIrsoF1z2UM5BMsjeYwwZGnN+NXwrwnhBTV/Nyoyoe2j15vIbdrS4eYg==
X-Received: by 2002:a05:600c:4f48:: with SMTP id
 m8mr5630425wmq.50.1639668510793; 
 Thu, 16 Dec 2021 07:28:30 -0800 (PST)
Received: from [10.32.176.104] (nat-pool-mxp-t.redhat.com. [149.6.153.186])
 by smtp.googlemail.com with ESMTPSA id t11sm4864629wrz.97.2021.12.16.07.28.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 07:28:30 -0800 (PST)
Message-ID: <8dd178b7-631b-25b4-4f68-334b0d583f72@redhat.com>
Date: Thu, 16 Dec 2021 16:28:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: Redesign of QEMU startup & initial configuration
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
References: <87lf13cx3x.fsf@dusky.pond.sub.org> <YbJU5vVdesoGuug9@redhat.com>
 <87mtl88t0j.fsf@dusky.pond.sub.org>
 <a31201bb-78de-e926-1476-b48b008745c1@redhat.com>
 <878rwozfqm.fsf@dusky.pond.sub.org>
 <16cd5683-4f97-d24c-dd19-24febcab7ba8@redhat.com>
 <877dc7tnjf.fsf@dusky.pond.sub.org>
 <da52f408-6037-20a9-78a9-77f12d86f620@redhat.com>
 <875yroyhih.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <875yroyhih.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::331
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.034,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Mark Burton <mark.burton@greensocs.com>, qemu-devel@nongnu.org,
 Mirela Grujic <mirela.grujic@greensocs.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/16/21 11:24, Markus Armbruster wrote:
>> Not really, in particular the startup has been mostly reworked already
>> and I disagree that it is messy.  softmmu/vl.c is messy, sure: it has
>> N different command line parser for command line options, magic
>> related to default devices, and complicated ordering of -object
>> creation.
>>
>> But the building of emulator data structures is not messy; only the
>> code that transforms the user's instructions into startup commands.
>> The messy parts are almost entirely contained within softmmu/vl.c.
> 
> In my opinion, the worst mess is the reordering and the (commonly
> unstated, sometimes unknown) dependencies that govern it.
> The reordering is part of the stable interface.  Its finer points
> basically nobody understands, at least not without staring at the code.

Then we agree, because that's what I meant by "the messy parts are 
almost entirely contained within softmmu/vl.c".

>> The one (and important, but fixable) exception is backends for
>> on-board devices: serial_hd, drive_get, and nd_table.
> 
> Practical ideas on fixing it?

What you did with pflash, turned up to 11.

>>> * A new binary sidesteps the need to manage incompatible change.
>>
>> More precisely, a new binary sidesteps the need to integrate an
>> existing mechanism with a new transport, and deal with the
>> incompatibilities that arise.
> 
> I'm not sure I got this.

Configuring the VM part in CLI and part in QMP is not something anybody 
needs nor should desire.  A new binary can use the CLI only for things 
that really have to be done before QMP is up, for example the 
configuration of sandboxing or tracing; and even that is only 
nice-to-have and not absolutely necessary.

>> The problem is that CLI and HMP, being targeted to humans (and as you
>> say below humans matter), are not necessarily trivial transports.  If
>> people find the trivial transport unusable, we will not be able to
>> retire the old CLI.
> 
> Yes, a trivial CLI transport alone may not suffice to retire the old
> CLI.  By itself, that doesn't mean trivial transports must be avoided.
> 
> Do I have to argue the benefits of a trivial configuration file
> transport?

I think you do; I'm not sure that a trivial configuration file transport 
is useful.  It's a middle ground in sophistication that I'm not sure 
would serve many people.  The only source of bug reports for -readconfig 
has been lxd, and I think we agree that they would be served better by QMP.

> Do I have to argue the benefits of a trivial CLI transport for use by
> relatively unsophisticated programs / relatively sophisticated humans
> (such as developers)? Can we agree these benefits are not zero?

We can.  But again I think you're misunderstanding the pain that the 
existing CLI inflicts on users.  Most users do not find the ordering 
complicated in practice; they do not even know that the issue exists. 
The problem that users have is the 100+ character command lines, and 
that can be fixed in two ways:

- with a trivial configuration file transport

- with a management tool such as virt-manager or virsh.

And I maintain that most users would be better served by the latter.  In 
fact, I constantly wonder how much we're overestimating the amount of 
people that are using QEMU.  In every post (Reddit, HN, wherever) that 
mentions QEMU being too complex and not having a front-end like 
VirtualBox, there's always someone that mentions virt-manager.

For developers it's different of course.

>> Bad CLI is also very hard to deprecate because, unlike QMP (for which
>> you can delegate the workarounds to Libvirt & friends) and HMP (for
>> which people can just learn the new thing and type it), it is baked in
>> countless scripts.  People hate it when scripts break.
> 
> I assure you that bad QMP is plenty hard to deprecate, even when libvirt
> can be updated to cope.

Right, and CLI is worse. :)

>> The issues with the CLI then can be completely self-contained within
>> softmmu/vl.c, and will not influence the innards of QEMU.
> 
> The issues with the CLI will still influence its users. Can we
> agree that human users deserve something better than the current
> CLI?

Deserve, yes.  Need, not sure.  Do you agree that a lot of clients of 
QEMU would be better served by Libvirt (programs) and virt-manager (humans)?

So, if I have to choose between better QMP now and better CLI now, I 
choose better QMP now.  Exactly to avoid the "somebody could" trap and 
focus on something that "we can" do now.

> I think we can learn from our experience with HMP/QMP.
> 
> Good:
> 
> * Separate interfaces for machines and for humans
> * Layering the human interface on top of the machine interface: HMP
>    commands implemented on top of QMP's internal C interface.

Agreed.  CLI should likewise be implemented on top of QMP's internal C 
interface, the same way non-preconfig mode concludes startup with 
qmp_x_exit_preconfig(NULL).  Second choice (inferior but sometimes 
acceptable): implement it on top of the same QOM interfaces as the QOM 
commands.

> * The stable interface is clear: QMP unless explicitly marked unstable.

Agreed, the problem here is that CLI is harder to evolve.

Paolo

