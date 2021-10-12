Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0D842AEBE
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 23:19:38 +0200 (CEST)
Received: from localhost ([::1]:34272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maPBR-0001db-Bs
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 17:19:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1maPAK-0000xu-7d
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 17:18:28 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:46738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1maPAI-0007qO-Ia
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 17:18:27 -0400
Received: by mail-ed1-x532.google.com with SMTP id z20so1313587edc.13
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 14:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/kLeacM9AFyQp95FRN4kazRzBraztdJTLTW4SXF4/5w=;
 b=yWH7wzmQpUC7kGYINwzCuQd+Knh1tLGn68XF8EldRgv+Jj1CDX8ByAkOAePGCYadN7
 1vXxQF3YYo/jo9JU9zvNQ0jcqSNOsWjSS4xFheKEZcW/foeBZLWKTediSWk606bRtW1E
 KWkzSBMMFgl9w/6htN+ql+mvAEFpZflv5zp9N3qg+FkXEabh3lYlWWxICFo4UUu4wSJE
 2GmlDJfRQ/diyz31g2L2w2LbIRfaQqdSyM5QcKpq92CovtQnr/lfgGga86QoMSW5/2b/
 ZgTVrlsCVtW0pW30QgJH4mW7+a4N4yAT3/OVTleUd7wwAUejTM6VgwbDy/JHGkUsoRjh
 AO+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/kLeacM9AFyQp95FRN4kazRzBraztdJTLTW4SXF4/5w=;
 b=v1GXkKbbtUC8uQOGhrCrPGyFbKiATe3MtTFmKcbMSrLy1ouCb97hGm1hQqz4IR3m/N
 3amW5J4RNzxkFvlnyeFQAeVTg5CpoqG5QbQuicms/H00fSchLbDevX9mwti6vQJvx2a6
 LWXB77u+3z/iX+NEqftKa58GPGzQ4urIsrCAZAfr4ZctiRNwjtK/1eBI73+ZAhYS1cvB
 hhyyLZvMFJG2WfHE8glOFjDZ9K1Rch9c772dYy0ljfNVN3rDjivxv/2At7G03u8u1ZJa
 HHZJGoglwfGUEhUIl6heq+ftBcalfuIqaw0FDp4jahg2gvh+urdPGUYhwFI33Icrx2xY
 Py0A==
X-Gm-Message-State: AOAM5337IxyuDA8GJ14dajS4QotcM36ducWeyDQRPSuAic/t9yCCK6ow
 OPJCTw+K2bkiUB6yY/xSeWEAufwBphyPjAlca7uqAw==
X-Google-Smtp-Source: ABdhPJxaWykt7bTAgQkt8yOW4d9CdSiH2xxcCoTKbs7+K+c2RmPYdaO76Z7/+Fd278QfRLoJ/ZbiJCBW4TyWNKgs+oc=
X-Received: by 2002:a17:906:1381:: with SMTP id
 f1mr6170379ejc.547.1634073504874; 
 Tue, 12 Oct 2021 14:18:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210927221359.2917482-1-mathieu.poirier@linaro.org>
 <20210927221359.2917482-4-mathieu.poirier@linaro.org>
 <20211005112437-mutt-send-email-mst@kernel.org>
In-Reply-To: <20211005112437-mutt-send-email-mst@kernel.org>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 12 Oct 2021 15:18:12 -0600
Message-ID: <CANLsYkwiE=m3Nha3RMa8V1tLf8h15oVR09j0xkO2bb-4BJX2=A@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] docs: Add documentation for vhost based RNG
 implementation
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-ed1-x532.google.com
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 5 Oct 2021 at 09:24, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Mon, Sep 27, 2021 at 04:13:59PM -0600, Mathieu Poirier wrote:
> > Add description and example for the vhost-user based RNG implementation.
> >
> > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
>
> Causes a build failure:
>
> Warning, treated as error:
> /scm/qemu/docs/system/devices/vhost-user-rng.rst:document isn't included in any toctree
>

(Sigh...)

I simply don't see those errors on my side...  I wonder if it's a
tooling version problem.  Anyways I sent a new revision, hopefully it
will be enough to make the build happy.

Thanks for the patience,
Mathieu

>
>
> > ---
> >  docs/system/devices/vhost-user-rng.rst | 39 ++++++++++++++++++++++++++
> >  1 file changed, 39 insertions(+)
> >  create mode 100644 docs/system/devices/vhost-user-rng.rst
> >
> > diff --git a/docs/system/devices/vhost-user-rng.rst b/docs/system/devices/vhost-user-rng.rst
> > new file mode 100644
> > index 000000000000..a145d4105c1a
> > --- /dev/null
> > +++ b/docs/system/devices/vhost-user-rng.rst
> > @@ -0,0 +1,39 @@
> > +QEMU vhost-user-rng - RNG emulation
> > +===================================
> > +
> > +Background
> > +----------
> > +
> > +What follows builds on the material presented in vhost-user.rst - it should
> > +be reviewed before moving forward with the content in this file.
> > +
> > +Description
> > +-----------
> > +
> > +The vhost-user-rng device implementation was designed to work with a random
> > +number generator daemon such as the one found in the vhost-device crate of
> > +the rust-vmm project available on github [1].
> > +
> > +[1]. https://github.com/rust-vmm/vhost-device
> > +
> > +Examples
> > +--------
> > +
> > +The daemon should be started first:
> > +
> > +::
> > +
> > +  host# vhost-device-rng --socket-path=rng.sock -c 1 -m 512 -p 1000
> > +
> > +The QEMU invocation needs to create a chardev socket the device can
> > +use to communicate as well as share the guests memory over a memfd.
> > +
> > +::
> > +
> > +  host# qemu-system                                                          \
> > +      -chardev socket,path=$(PATH)/rng.sock,id=rng0                          \
> > +      -device vhost-user-rng-pci,chardev=rng0                                        \
> > +      -m 4096                                                                        \
> > +      -object memory-backend-file,id=mem,size=4G,mem-path=/dev/shm,share=on  \
> > +      -numa node,memdev=mem                                                  \
> > +      ...
> > --
> > 2.25.1
>

