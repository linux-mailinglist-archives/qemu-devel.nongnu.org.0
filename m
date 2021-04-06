Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74959355A07
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 19:09:45 +0200 (CEST)
Received: from localhost ([::1]:43700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTpCy-00041h-F9
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 13:09:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1lTp9m-00030R-UQ
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 13:06:26 -0400
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732]:35561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1lTp9l-0004G4-7W
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 13:06:26 -0400
Received: by mail-qk1-x732.google.com with SMTP id i9so15721110qka.2
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 10:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QsJFEF5P7aUf9pNEQ7K/wmOsKJd3/wpLUCybSkUtgOw=;
 b=PLMX6+0mOct4ZEQ1neisbJ+PWr+WvYVQkeAwIP3WrsYIVXePNT45vHIVikM45/QsMA
 d2tuk0eF3wFqbFEn8adL+zMZvDQ6wIY7x/v3jE4xVUoK5vQmYsH2QgDPuFcEEAKR9nTJ
 r1cSODXLQjdFjdFxWmghKjmZjxwo5epTDufmWOdE0GS60Xy4E/jDUofOL06fzBjDuISX
 IrjTfMUmobL2SAg7JfbKoGhF3oKGFKt/S+PWzjOzlMa5udlxVeUsBi2QhBk9y6U3TDi7
 P3bUp5+ya0k2Tu1mLkCv5RF09BmCDr7YSJkbgzZNjHyLO6Ch0iX7zk9yLZOF9V2zAAaG
 5ijQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QsJFEF5P7aUf9pNEQ7K/wmOsKJd3/wpLUCybSkUtgOw=;
 b=L5LtYm6cude2GMYyYIHxuNJkXJJjY59W1obKW7QTIS0abp8VbI1vyWvVFZNU3m6tNm
 pATcElXzCnFchMTLAlppmwtkbkR+vIFK4uFKkG0sp75xZ9YbDp7KbQNnxvB2ZyqD1Jzu
 Qqbyuf/3XDgsxhmTVXXYqqe5y+Ju0n8lpQAkkNrosXuz5t87rR6R3hGD7S0ilBw/tqJ8
 yUP8Q7t2pUoP1vjOR1Ou6qWja2S7dlRXARLBz7pbUI94dlsBaiFqv+F13lBg5oj9SaBL
 wcPx+WvJNvp8gSIaEey8GdeqEPpCDU1v+2KjroZNlBLnCHHLt0zCgk04Y9QyyMmqZnUJ
 2UaA==
X-Gm-Message-State: AOAM53057Bchd4I5JD7r1foyt6KeLUrQa+9LNBzR6PjpTUmSFT/L7RKW
 tQnmrMHcB5xylLvbYzr27hvRUr9AMPstx3NOzJm7qz7LgTFYCw==
X-Google-Smtp-Source: ABdhPJz+jrfLioSp0ezx0iui5tbG+XIcgS8v0v1GZM4Wi2ARlr14AC6Oosf3FMn1FsCDWdwyyXwygnQMqWL0iTqNQIA=
X-Received: by 2002:a37:40d5:: with SMTP id n204mr30229328qka.79.1617728781006; 
 Tue, 06 Apr 2021 10:06:21 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=noty9JPU7L8XXKs48TEC9SrJ6j44boA=6ZQP4b_4Z3oy4Kw@mail.gmail.com>
 <20210406165427.GQ7167@minyard.net>
In-Reply-To: <20210406165427.GQ7167@minyard.net>
From: Patrick Venture <venture@google.com>
Date: Tue, 6 Apr 2021 10:06:09 -0700
Message-ID: <CAO=noty0eTbxf0OXLgqVVv4he2mwXJTRtZWBM2-1Os8zAjXMvQ@mail.gmail.com>
Subject: Re: IPMI Smbus
To: Corey Minyard <cminyard@mvista.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::732;
 envelope-from=venture@google.com; helo=mail-qk1-x732.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 6, 2021 at 9:54 AM Corey Minyard <cminyard@mvista.com> wrote:
>
> On Tue, Apr 06, 2021 at 09:04:35AM -0700, Patrick Venture wrote:
> > Corey;
> >
> > I saw you have a branch that is working on adding smbus IPMI support
> > (the ssif approach).
> >
> > Can you provide details on the status of this work?
>
> There is already an SMBus BMC device that can sit on the I2C bus.  It's
> in mainstream qemu now.

This device:

github.com/qemu/qemu/blob/master/hw/ipmi/smbus_ipmi.c

So this device gets added to the BMC's i2c, and it's just that there's
no host-side support to then master this device?  in a multi-node
simulation.

I'm asking because my team is currently working on implementing ssif
support (between two nodes).

>
> It does not have smbus alert support, though.  I have patches for that,
> but qemu doesn't have a flexibly general interrupt infrastructure, so I
> hacked something in, and it's likely to be contentious.  The trouble is
> that the interrupt is disconnected from any real device, and qemu
> doesn't handle that very well.  And like the other things, I really only
> created it for my testing.
>
> For doing what you are trying to do, I don't think you need any special
> support on either side for SSIF to work.
>
> -corey
>
> >
> > Patrick

