Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2C74762A9
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 21:09:02 +0100 (CET)
Received: from localhost ([::1]:35586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxaaD-0006fZ-F7
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 15:09:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mxaSv-0004BX-Rn
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 15:01:29 -0500
Received: from [2a00:1450:4864:20::333] (port=34360
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mxaSu-0004R7-1r
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 15:01:29 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 bg19-20020a05600c3c9300b0034565e837b6so383365wmb.1
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 12:01:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/npYIIDoLCXJvZ4/Mgp8oh9rnl/qZSQe5Bc2giuyL8s=;
 b=K6NCD/vKQq28OIIM0L3lN+Qb1dvdvjdpp+zHlZ7vEeDOBbgUNuGQVi+C3GzJSDxj2n
 i/dY03X/RmQ8yC+TMbsDsw4eUhOHDIadjVqqLtum7qGcQZVlY+3Fl1r5OgUAw0atZCZm
 CTgnsWxxD1fmzlolKkafxR+CWa8yroEX81cCTwMqAbNrOlkWUWnJAdXcK+/ErDzkRVSg
 zkcwtYu57zHqSTd8y2jhuyTGHtD3NWif+9fLPs4ZLEa1GFJC1igvF4OFsPNqhrVkDwcw
 S/gkcjkCz+I+xK+VSFrfe8mffx24Lrvca38fUAECQHi4DVp6nnVPYlNajwI5VNKx4jqd
 2dvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/npYIIDoLCXJvZ4/Mgp8oh9rnl/qZSQe5Bc2giuyL8s=;
 b=aGVNPfcI+54nAjzICGILg+3J+gTeVZfIuFXZEMZLAyH0F91OMEek4WXj8rRYSXOy3q
 XAvH4HD6yt1weuLg8UEnk0kF6N+av3J3VCG9bt/r2v3abEr4MLpqouxu/miTHQK2F64Y
 43KQLFAENYBzg8QELQzhfj21XC7ukD/PT7kGYIALsKHUV3aiwYqYuuA84NBfhw8/A59W
 lZ1rLRRVeZ1b/YxBdzMzJPAisc1M7OW+hKgEEroQitXdYdXQhSqJj59q9bC+2HUOcWpu
 YdLfmRChT9ALvXiV0u4FHQN0eSAyZdm2/5GujVQHsLypCt+qSNiFzNsZI4LAeLx3TZE1
 3egA==
X-Gm-Message-State: AOAM533/toQ/Y33uKyXDhnO+N03Au74pgELr0XT9OdxQ7xS4MKlhBrw3
 9vXPuJauivMInxZ98QBM0vM=
X-Google-Smtp-Source: ABdhPJwc+xznHPAQWl1D4MD2ldgy1eSj0rn/gfKfVwg59RANu9KEUO77v2ZUV8fubB+9OmsnaBx2KQ==
X-Received: by 2002:a05:600c:5101:: with SMTP id
 o1mr1744471wms.81.1639598486334; 
 Wed, 15 Dec 2021 12:01:26 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.googlemail.com with ESMTPSA id y11sm3742637wry.70.2021.12.15.12.01.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 12:01:25 -0800 (PST)
Message-ID: <da52f408-6037-20a9-78a9-77f12d86f620@redhat.com>
Date: Wed, 15 Dec 2021 21:00:46 +0100
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
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <877dc7tnjf.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.64,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Mark Burton <mark.burton@greensocs.com>, qemu-devel@nongnu.org,
 Mirela Grujic <mirela.grujic@greensocs.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/14/21 12:48, Markus Armbruster wrote:
> Let's start with where we (hopefully) agree:

More or less I do agree with this, except for a couple points below 
where I think we disagree.

> * We need a single, cohesive, low-level interface suitable for
>    management applications.
> 
> * The existing interface is specified in QAPI.  Its concrete transport
>    is QMP.
> 
> * The existing interface is not complete: certain things can only be
>    done with the CLI.
>
> * The existing transport is not available early enough to permit
>    completing the interface.

So far so good.

> * Fixing that involves a rework of startup.
> * Reworking the existing startup and managing incompatible changes is
>    impractical, and likely to make the mess we have on our hands worse.

Not really, in particular the startup has been mostly reworked already 
and I disagree that it is messy.  softmmu/vl.c is messy, sure: it has N 
different command line parser for command line options, magic related to 
default devices, and complicated ordering of -object creation.

But the building of emulator data structures is not messy; only the code 
that transforms the user's instructions into startup commands.  The 
messy parts are almost entirely contained within softmmu/vl.c.

The one (and important, but fixable) exception is backends for on-board 
devices: serial_hd, drive_get, and nd_table.

> * A new binary sidesteps the need to manage incompatible change.

More precisely, a new binary sidesteps the need to integrate an existing 
mechanism with a new transport, and deal with the incompatibilities that 
arise.

> Any objections so far?
> 
> Now let me make a few more points:
> 
> * Single, cohesive interface does not require single transport.  In
>    fact, we already have two: QMP and the (internal) C interface.
> 
> * QMP encodes the abstract interface in JSON, and offers the result on a
>    Unix domain socket[1].
> 
> * The (internal) C interface encodes the abstract interface as a set of
>    C data types and functions.
> 
> * Consider a configuration file transport that encodes the abstract
>    interface in JSON.  The only wart this adds is syntax that is
>    arguiably ill-suited to the purpose.  More suitable syntax exists.
> 
> * Similar for CLI.
> 
> * To get a "a second set of warts layered on top", we actually have to
>    layer something on top that isn't utterly trivial.  Like a
>    higher-level interface.  The "second set of warts" objection does not
>    apply to (sane) transports.

The problem is that CLI and HMP, being targeted to humans (and as you 
say below humans matter), are not necessarily trivial transports.  If 
people find the trivial transport unusable, we will not be able to 
retire the old CLI.

Bad CLI is also very hard to deprecate because, unlike QMP (for which 
you can delegate the workarounds to Libvirt & friends) and HMP (for 
which people can just learn the new thing and type it), it is baked in 
countless scripts.  People hate it when scripts break.

> * The old CLI is partly layered on QMP, partly on HMP, and partly on
>    internal C interfaces.  It's full of warts.

I've worked on moving it more towards QMP or at least QOM, and much less 
on internal C interfaces.  It still has warts but they are 
self-contained and due to the baroque ordering of options.  My point is 
that we can continue this work to the point that having separate entry 
points (one CLI-centered, one QMP-only) is not a problem.

The issues with the CLI then can be completely self-contained within 
softmmu/vl.c, and will not influence the innards of QEMU.

Paolo

> * Management applications are not the only users that matter.  Humans
>    matter.  Simple programs like ad hoc scripts matter.

