Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FEE4194A8
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 14:54:32 +0200 (CEST)
Received: from localhost ([::1]:32910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUq9P-0002Q6-Gv
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 08:54:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mUq7y-000133-31
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 08:53:02 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:39895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mUq7u-0002UD-Ep
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 08:53:01 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 136-20020a1c048e000000b0030d05169e9bso464590wme.4
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 05:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OLOhl4m+70jZ3X2rS/Fi4mNjuYjmWWdWsBD/MJ21pjE=;
 b=Up4nLTiuMhpMEgDrCKgI9THfP0quB7DqUvfm4kztmE9VecAMznseKOy1Oxi8W5xfzX
 JIr4q6FyOyxH5ey/KX3GAlz4KsSD8s7K7mdcaeH/dIzSzcSDU3NLUrO2RBofyAATPfSH
 VA1bDELa2pp+Gyuekmuy/bPUFdPonPn214yS+SmnrG0kdAJ/UNECWUnRLgS4uYrvi3pD
 hgwKsNRm31zZvUccOFug8PiA/h5Bf1TDh3yuE4gQArmBwAughFIIoqw0XlfuMZLMmQJQ
 N79PKD08ZGodE+v5mU+uoVHC0jDiNG3iVAn3WiNfLiByRYW4jj/FpWRnCcvJVhOzQpBY
 S82A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OLOhl4m+70jZ3X2rS/Fi4mNjuYjmWWdWsBD/MJ21pjE=;
 b=LFS4tZszzNk1DzRjse11cCcvs1oO/rdf9MO/MynA+Cya1yO/rpXIvTVCc2rLKKQGEJ
 Ppby3NPtJn0GnEjSfEggTjUO4yKr+5vhqp4bde3NHuJBorucKFe3JqfVf0ltz8sAVz+a
 nw8x5ELosw0W+EMwLnvNDdVK7jHoDBGHpx2RjkPe3bitXaUZ9qW/56a8GD/Cm+p6XdHB
 0OvUUGlk7YEilowMV/mnus0lE5k/1K4aM144b/3uipb8etqXotv8KnL49OiSR8k6BT6R
 +0BGxssuGL+JVZodGfNHY811jRUjOQZjyU0BQUqF5K2DNxFxmTpLaMQLcsY88SqiiG4J
 2KQg==
X-Gm-Message-State: AOAM533xZcYEVluf3XI0d7ah4X8AqGCobAWMRJYX7GXPjDnCiTJH+N/3
 nkW8NpjAU5onqcZXY3Kz5K6MK7xPnUaJXKuswSDxzQ==
X-Google-Smtp-Source: ABdhPJzAcmFwzYjd4G2V/9eExa448q3w+5TH0D65zD/Oonvsjrj6Saoa/AFsKCHVDA3rEkvk25iWRmbfj2s9x24OOss=
X-Received: by 2002:a05:600c:d6:: with SMTP id
 u22mr2841469wmm.133.1632747176747; 
 Mon, 27 Sep 2021 05:52:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210924090427.9218-1-kwolf@redhat.com>
 <20210924090427.9218-12-kwolf@redhat.com>
 <CAFEAcA-Paf0+BvdFrT=B_jfzCNzGB6w4-7hjBeXWt0sJJYJs-Q@mail.gmail.com>
 <YVGqptZGZ6PhqixP@redhat.com>
In-Reply-To: <YVGqptZGZ6PhqixP@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Sep 2021 13:52:03 +0100
Message-ID: <CAFEAcA_B1SpqaoZxJtuX4y5Gcafe-AeA4KNOgZkysuAgEWu_6Q@mail.gmail.com>
Subject: Re: [PATCH 11/11] Deprecate stable non-JSON -device and -object
To: Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Krempa <pkrempa@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Libvirt <libvir-list@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 27 Sept 2021 at 12:27, Kevin Wolf <kwolf@redhat.com> wrote:
>
> Am 27.09.2021 um 11:00 hat Peter Maydell geschrieben:
> > On Fri, 24 Sept 2021 at 10:14, Kevin Wolf <kwolf@redhat.com> wrote:
> > >
> > > We want to switch both from QemuOpts to the keyval parser in the future,
> > > which results in some incompatibilities, mainly around list handling.
> > > Mark the non-JSON version of both as unstable syntax so that management
> > > tools switch to JSON and we can later make the change without breaking
> > > things.
> > >
> > > Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> >
> > > +Stable non-JSON ``-device`` and ``-object`` syntax (since 6.2)
> > > +''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> > > +
> > > +If you rely on a stable interface for ``-device`` and ``-object`` that doesn't
> > > +change incompatibly between QEMU versions (e.g. because you are using the QEMU
> > > +command line as a machine interface in scripts rather than interactively), use
> > > +JSON syntax for these options instead.
> > > +
> > > +There is no intention to remove support for non-JSON syntax entirely, but
> > > +future versions may change the way to spell some options.
> >
> > As it stands, this is basically saying "pretty much anybody
> > using the command line, your stuff may break in future, instead
> > use some other interface you've never heard of, which doesn't
> > appear to be documented in the manual and which none of the
> > documentation's examples use".
>
> The documentation is a valid criticism. We need to document the JSON
> interfaces properly (which will really mostly be a pointer to the
> existing QMP documentation at least for -object, but it's important to
> tell people where to look for the details).
>
> > Is there some more limited deprecation we can do rather than "the
> > entire commandline for almost all users" ?
>
> I don't think "almost all" users is true.

> I see three groups of users

...all of whom "rely on a stable interface for -device and -object",
and only two of whom it's reasonable to say "use the JSON version" to.

> 1. Using a management tool that is probably using libvirt. This is
>    likely the vast majority of users. They won't notice a difference
>    because libvirt abstracts it away. libvirt developers are actively
>    asking us for JSON (and QAPI) based interfaces because using the same
>    representation to describe configurations in QMP and on the CLI makes
>    their life easier.

Yes, absolutely we should be recommending that libvirt and
other management interfaces use the JSON.

> 2. People starting QEMU on the command line manually. This is
>    essentially the same situation as HMP: If something changes, you get
>    an error message, you look up the new syntax, done. Small
>    inconvenience, but that's it. This includes simple scripts that just
>    start QEMU and are only used to store a long command line somewhere.

It's a small inconvenience that we seem to be imposing on our
users on a pretty frequent basis. Moreover, each one of these
really needs to be its own deprecation, so that users actually
can have some advance notice if they need it and look up the
new syntax. We shouldn't hide them all under this umbrella
"we might break anything at any time" entry, which I think
will pretty much encourage breaking compatibility more often
because you don't have to think about "oh, we should deprecate
this and maybe print warnings about use of deprecated syntax
and then drop it later", you can just break things and point
to this "we said -device wasn't going to be stable" entry.

As a concrete example, the commit message for this patch vaguely
mentions some issues "around list handling", which gives me no
idea at all about what syntax is going to break in future or
whether it is likely to affect scripts I've written.

> 3. People writing more complex scripts or applications that invoke QEMU
>    manually instead of using libvirt. They may actually be hurt by such
>    changes. They should probably be using a proper machine interface,
>    i.e. JSON mode, so the deprecation notice is for them to change
>    their code. This is probably a small minority and not "almost all
>    users".

Yeah, this group is kind of similar to group 1 (well, at one
end it shades into group 1 and at the other into group 2).

More generally, I think I'd rather see the deprecation of
the old approach appear after some period when the JSON
command line version has been available to users and adopted
by major consumers like libvirt, not as a patch in the same
series which is introducing the JSON syntax in the first plaec.

-- PMM

