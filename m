Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DF66EA663
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 10:57:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppmZh-0007dM-0l; Fri, 21 Apr 2023 04:57:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ppmZf-0007bh-Bk
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 04:56:59 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ppmZd-0004ev-Nl
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 04:56:59 -0400
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-94f7a7a3351so226762666b.2
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 01:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682067414; x=1684659414;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Upgt2zTS4BKKJHI4sGKXXAPlcrkhJ5ScElBRI+AB7Ow=;
 b=HcTBrjlU4VH3t/ik2xRwUz2ZtdBSy8qWbUJ5R6y7cR1E+96L8ArarAAIee7iupbn0h
 U3KErtSdwuVHmbz+xIaHZJ07EcY1IqTZmMlcxj2EFq8ZyfIkBU7TLvtOdWrosoh7TFR9
 ubkNMiBH6rsNZDFH1wp/UcAni3WItWKRsOZNWqkFt7zz35nrnnDKtxTOHx1UydeTbQ7e
 iHbCHITjXEl0yHLRp75IqwzD0J3eZ2STgiBfcqz3xAfysVG/Qy1f3N4nZ8c4/h31z7KB
 yan5zjjhw0ttcScGGlGwjSfmOWJOQiU8uP0cLovoddCFxpgU6I++MAot8io332qD06sz
 ddxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682067414; x=1684659414;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Upgt2zTS4BKKJHI4sGKXXAPlcrkhJ5ScElBRI+AB7Ow=;
 b=HGUJiQJ0fMIMKVHPV9gvn/Mu9lq/2ggfiGfaDMR4TtgLaUixOTDefZyQQYQ2+q54e1
 TGo+0Wc9C6lgHpHPXfGuoUDcPCRzgNiADf/vL/xIPzxdweY8a2wgla+H8SDI9YKB/0jd
 Zf+X3xeTaaWWuVUDM5OvXGLn26eNYea5Nja3zjj1H1l5uOrvXbJGF5lZ5WZWGw3+jJhI
 r5rH/mYjLR8Nic2vbeZT5+xFXLnHtJOMASh6rPwg5jFbvmIXuuG7280QXtvPblaAKWvE
 Xm2OqkIa2vqtwHP6NYyYLxiBz++MNrQXpgh6VqqwBo2hVcMZ0/0ATBlDMrqLWWKHlpEi
 /2Xw==
X-Gm-Message-State: AAQBX9c1CtQWbX7IxIFHDfmojF1TqcyzHFx+NN1JnzXOxOYZ6VC/DZav
 xLeMpRv7QdxThJ/LGZCKTKsNK+JMylm4VR3YkSynjQ==
X-Google-Smtp-Source: AKy350YFxV5Ofo99SguE1YQSIQDJJxjaD/VStTgcnMFwTqk6ygT0IVxUb6k1/2SpBz+63BIVVWQPt5FIYAicNMS8CnI=
X-Received: by 2002:a17:907:168d:b0:92b:f118:ef32 with SMTP id
 hc13-20020a170907168d00b0092bf118ef32mr1670252ejc.48.1682067414502; Fri, 21
 Apr 2023 01:56:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230420150352.1039408-1-peter.maydell@linaro.org>
 <20230420150352.1039408-3-peter.maydell@linaro.org>
 <7dx7hhd5pk5xazhvuadweiirtdhygxapz66kdnoisn67xnycqu@mh7uwlip3er2>
In-Reply-To: <7dx7hhd5pk5xazhvuadweiirtdhygxapz66kdnoisn67xnycqu@mh7uwlip3er2>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 21 Apr 2023 09:56:43 +0100
Message-ID: <CAFEAcA9LSJ9te=zmgR4YYUmYtsKuoPRzuREg6Eh9EcjiLThimw@mail.gmail.com>
Subject: Re: [PATCH 2/2] docs/interop: Delete qmp-intro.txt
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 20 Apr 2023 at 20:43, Eric Blake <eblake@redhat.com> wrote:
>
> On Thu, Apr 20, 2023 at 04:03:52PM +0100, Peter Maydell wrote:
> > qmp-intro.txt is quite small and provides very little information
> > that isn't already in the documentation elsewhere.  Fold the example
> > command lines into qemu-options.hx, and delete the now-unneeded plain
> > text document.
> >
> > While we're touching the qemu-options.hx documentation text,
> > wordsmith it a little bit and improve the rST formatting.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >  docs/interop/qmp-intro.txt | 88 --------------------------------------
> >  qemu-options.hx            | 26 ++++++++---
> >  2 files changed, 21 insertions(+), 93 deletions(-)
> >  delete mode 100644 docs/interop/qmp-intro.txt
>
> Reviewed-by: Eric Blake <eblake@redhat.com>
>
> >  DEF("mon", HAS_ARG, QEMU_OPTION_mon, \
> >      "-mon [chardev=]name[,mode=readline|control][,pretty[=on|off]]\n", QEMU_ARCH_ALL)
> >  SRST
> >  ``-mon [chardev=]name[,mode=readline|control][,pretty[=on|off]]``
> > -    Setup monitor on chardev name. ``mode=control`` configures
> > -    a QMP monitor (a JSON RPC-style protocol) and it is not the
> > -    same as HMP, the human monitor that has a "(qemu)" prompt.
> > +    Set up a monitor connected to the chardev ``name``.
> > +    QEMU supports two monitors: the Human Monitor Protocol
> > +    (HMP; for human interaction), and the QEMU Monitor Protocol
> > +    (QMP; a JSON RPC-style protocol).
> > +    The default is HMP; ``mode=control`` selects QMP instead.
> >      ``pretty`` is only valid when ``mode=control``,
>
> Is the pre-existing trailing space on this line important to rST?

I don't think so -- it's just a line I didn't touch.

-- PMM

