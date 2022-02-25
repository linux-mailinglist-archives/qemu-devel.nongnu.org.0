Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD474C4FDA
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 21:43:07 +0100 (CET)
Received: from localhost ([::1]:51822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNhQg-0001SB-Nv
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 15:43:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nNhOu-0008PG-8D
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 15:41:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nNhOp-0005qk-5n
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 15:41:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645821670;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iEzGd9LmzCB+PyeRZaT9v6bcBIPqnzEnNLu2+k5K/mQ=;
 b=RjdvvW1YUYVsdJXWrq882UqrN3WbV2MUnw2TPt1jmfa3N2h1xTOAf4iiA3W7GtArfwOBMw
 QlseGAG5qNOVvKSZvOQE6UOCLjXFnRQ2U7fKmA4DS/9tkJzFG0GVipUGYkYrryxIhhR79p
 yalbvdbbL7KR7WiQUP6fdrjfHQ2ISak=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-100-rHtOnA21PfC6DX71R6OW4A-1; Fri, 25 Feb 2022 15:41:07 -0500
X-MC-Unique: rHtOnA21PfC6DX71R6OW4A-1
Received: by mail-ua1-f69.google.com with SMTP id
 j1-20020ab064c1000000b00346afb19864so653929uaq.20
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 12:41:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iEzGd9LmzCB+PyeRZaT9v6bcBIPqnzEnNLu2+k5K/mQ=;
 b=rOz6v4oVPfZV2S075/VpRkd0jq/ktgiBtOlzkcZpQduWmFXpg7QtsOxJaHLuHPCWlw
 M7nnRXWjOWuuVDHyrOYQ9vMnOpwv0wcW2q6vc18Rq/Ab0HY2dZTcQqvs3Imk9FT4gO9Z
 A/TBymDMLcAdD8TG2xxmOYL20L4JEHpnj8soREePmCR04K0NRZCKdox6kUwynhFxfpBO
 tzt0yq3PmvWTlVzSh9rcwbs2je8JYi45HQA3zZP+mmNXdu70vubYxwRiR2ssaK5IqjYg
 P7CL2F9Lj9AxHg+sn8RVrcKEdLLkgKm+ob+H9yVNtQhsV0isQp/tyxwwn3uqGgw6Jgwm
 pQ6w==
X-Gm-Message-State: AOAM531rm++tgG+Nnb+Ztjae2X7wr3eOuzXCviq4CON78yYFUJv72kiY
 GE96ayP5V0oYg+mHN49q+Xkv5sBIb497XkCA7OaDoS9eCZcBwzSkt8Zby2CULm2Pay5G/ogfj6p
 KSUN6XnMhqh3dzL0MGhcnKtVNls6uVrk=
X-Received: by 2002:ab0:6f95:0:b0:342:91c8:f228 with SMTP id
 f21-20020ab06f95000000b0034291c8f228mr4060789uav.32.1645821666988; 
 Fri, 25 Feb 2022 12:41:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJznV1hVbpI9TrGbGMUpVbzQX3iIDDKg20zdo08KH+/zSOR9U+KcZHuLjiUON1xmVKdKQ1ZuRRMRljqUU3Rewko=
X-Received: by 2002:ab0:6f95:0:b0:342:91c8:f228 with SMTP id
 f21-20020ab06f95000000b0034291c8f228mr4060779uav.32.1645821666715; Fri, 25
 Feb 2022 12:41:06 -0800 (PST)
MIME-Version: 1.0
References: <20220221155519.2367-1-damien.hedde@greensocs.com>
In-Reply-To: <20220221155519.2367-1-damien.hedde@greensocs.com>
From: John Snow <jsnow@redhat.com>
Date: Fri, 25 Feb 2022 15:40:55 -0500
Message-ID: <CAFn=p-bUUxzzduSL+gjPA7ngJqbmkQacfiTpuHAPadwvo6hUzA@mail.gmail.com>
Subject: Re: [PATCH 0/5] qmp-shell modifications for non-interactive use
To: Damien Hedde <damien.hedde@greensocs.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, qemu-devel <qemu-devel@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 21, 2022 at 10:55 AM Damien Hedde
<damien.hedde@greensocs.com> wrote:
>
> Hi,
>
> The main idea of this series is to be a bit more user-friendly when
> using qmp-shell in a non-interactive way: with an input redirection
> from a file containing a list of commands.
>
> I'm working on dynamic qapi config of a qemu machine, this would
> be very useful to provide and reproduce small examples.
>
> This series proposes the following modifications:
> + no prompt when input is non-interactive
> + an --exit-on-error option so that the shell exits on first
>   error (disconnection, command parsing error, response is an error)
> + support for comment lines and escaping eol to have more reability
>   in the source files.
>
> I tested this using QMPShell. I tried HMPShell but did not findout
> how to successfully use it with qemu. How do I setup an HMPShell ?.
>

Should be the same. It's just passing HMP commands through the QMP
layer using {"execute": "human-monitor-command", ...}.

> ./qmp-shell -H ../../bin/git/monitor.sock
Welcome to the HMP shell!
Connected to QEMU 6.2.50

(QEMU) help
announce_self [interfaces] [id] -- Trigger GARP/RARP announcements

... (and many more lines.)

HMP is a completely different interface, with different commands, etc.
It's meant for human users, but we are trying to remove any reasons to
use it. It has its uses for some debug commands that we don't want to
support over the QMP interface, and for some commands that aren't safe
and might freeze, etc. Dan has spent a lot of time and effort
migrating the save state commands over to QMP, for example.

> Another "issue" I have is the handling of integers. I
> deal with a lot of addresses and reading/writing them as decimal is
> a bit painful (json does not support hexadecimal integer format). Do
> you think of any reasonable workaround for this ? Maybe HMP shell
> support this ?

Take a look at `def _parse_value(cls, val: str) -> object:`

int("0x13") is going to raise an Exception, so this won't be perceived
as a numerical value. You can use int(val, base=0) to have Python
guess the base from the string given (which allows for "0x", "0b" and
maybe some others.) This might cause a regression if anyone was using
this to pass "0x13" as a string on purpose.

It might also be the case that the FuzzyJSON portion of the parser
already accepts hexadecimal numbers. You'd have to check, but if you
take a look at that piece of the code, you can see that we parse
"JSON" arguments as a Python AST and then swap out the true/false/null
literals for True/False/None. This gives some flexibility to the
syntax being entered here. I don't know off the top of my head what
happens to numbers here. This parser is only used when an argument
starts with '{' or '[', though.

This is related to another problem we have, which is that the
qom-set/qom-get scripts are pretty much extremely busted for anything
other than strings. The type safety of these interfaces is not ...
really there right now. In a beautiful future utopia, we'd be able to
get the type information we need directly from QEMU and
deterministically convert everything into the right form before
sending it out over the wire without guessing around.

--js


