Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC0038AFBE
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 15:13:18 +0200 (CEST)
Received: from localhost ([::1]:41856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljiUH-00042N-5S
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 09:13:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ljiS2-0002tk-Mm
 for qemu-devel@nongnu.org; Thu, 20 May 2021 09:11:00 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:43668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ljiRz-0002lG-Jh
 for qemu-devel@nongnu.org; Thu, 20 May 2021 09:10:58 -0400
Received: by mail-ej1-x635.google.com with SMTP id l4so25179095ejc.10
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 06:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=XK/k8Hwg70+xMCTfbFNGsb0UKGrM5B3TmgWFj24X+/0=;
 b=gPzhY+xA5ICMVnfbaXll/EahhZ29sKNXIneBMVpoNZlGP2t3g5zxgzats30Ufhn2Rj
 I7SvZKWoCYIJnDnPQFFii4fbAjvpP+RR7oypWC5c0Oyv/zN74p1zlaqUp9vd9VhEs/4O
 Z0G5guXdpp1/Rx5R6yWZyLVZHEHz8Ks8vv7pFr8yqohhwU0pWXbzJjNSKwbWd/ivL7r7
 FlBJBXB0aRJmkRs1XuBFy4M1rn1KVqhhsomhnSU33w9kwy6yFIdXvExF3DegQw2wa/4E
 biIaVmSmCs0+JwCj2qrkISP933PK0PcGJ7barYhY6tzjVls2pB9eWlWBP1kOVgVwSWWX
 RZrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XK/k8Hwg70+xMCTfbFNGsb0UKGrM5B3TmgWFj24X+/0=;
 b=DJDEpFoi0EULPjF4qP1Qb7MZygqQgq4WMQLqoH6xwQbdolgvD7HkkSf/A+/MQdp0sw
 SR8KGStbFeGO0Wgwp/Z0x6MefmOfJHw2SAyJTSOp0AjTBHll8DLO5Sm461XxxQ3snmY8
 ERebKajDWDH0o69PTe62ZG0Kymh7oOIAv2UyohQTJtai+3fktF/kkGrFEYk4oAgGq41C
 EuPqGP2GwdjOtU4o2iAdNOiSTTRAC+DwdNxXbTTEnnyZrWt4gLZYnS6DrbXZ1itWqSPc
 JfW9XLETU4+d5b6y5Eqg5EjQH41SlQaw88+ZTC9BmZRomCvvx3xnYy5YtuyOvn6cOpbF
 9IkA==
X-Gm-Message-State: AOAM532ntjGzz8bRs82+uCAluL7/u2PoZpO0a+8FilyoVmBeRdYbUjMj
 i2W0hKCBc7I2PxzF8WHramANU4SKnDa23SOSG0aPdQ==
X-Google-Smtp-Source: ABdhPJw0uRWPOk7uvfooR3gq9hwAW3TygS3lkL1Ge4vg/UrYiVOUcqop5jMO3Wva25wO6YFXlYt6S90rPFLSxoKLkag=
X-Received: by 2002:a17:906:b1cc:: with SMTP id
 bv12mr4512930ejb.407.1621516253973; 
 Thu, 20 May 2021 06:10:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210503104456.1036472-1-thuth@redhat.com>
 <CAFEAcA8k1DnOFT+5pjQ4ytene3asVDKB7TUOZgGhucTp_ypz2g@mail.gmail.com>
 <66206f67-f3c8-eb1c-fd5d-8c7555fe5316@redhat.com>
 <CAFEAcA_9o+h29L1Y0BVFhg9JbQbo6A=MgGwCaH_=vt3OhcERBw@mail.gmail.com>
 <c748372a-d585-7777-9dda-9faf33e97e30@redhat.com>
 <d5bf0064-052e-a0c7-cc17-72db815949e2@redhat.com>
 <b2a28a69-2525-b07e-bec8-65d7439f1154@redhat.com>
 <11382e1f-4ab9-6f04-6c53-938bd50a1e78@redhat.com>
 <9840231d-9b5b-a61e-fd8c-098c1a9a7596@redhat.com>
 <75e088da-b815-8f97-acf2-1743205967f5@redhat.com>
 <3b1e8f37-7d38-1450-b288-c23c2d14b90a@redhat.com>
 <924f165c-369e-7f52-7287-fc7211c6abbf@redhat.com>
 <8dd49eba-29c8-617c-c61a-d5c7e0bcacec@redhat.com>
In-Reply-To: <8dd49eba-29c8-617c-c61a-d5c7e0bcacec@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 May 2021 14:10:35 +0100
Message-ID: <CAFEAcA9YDZa=+XjxswAhB8bOpUS1Aypw-5dbtTTfz3dd+gxHjw@mail.gmail.com>
Subject: Re: [PULL 00/10] Gitlab-CI, qtest, moxie removal and misc patches
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 20 May 2021 at 14:06, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> On 5/20/21 9:43 AM, Paolo Bonzini wrote:
> > On 20/05/21 07:08, Thomas Huth wrote:
> >>> OK... Not sure how to detect it from ninja then.
> >>
> >> Every time you pull, there could be changes to the "configure" script
> >> which affect the build ... I guess you also won't notice those when
> >> you're only compiling with ninja? Thus at least after pulling from
> >> upstream, I think you have to type "make" once at least.
> >
> > Yes, and using "ninja" directly is not supported.
>
> Unrelated to my issue, but I find it unfair to state "using
> ninja directly is not supported" when the majority of the
> QEMU developers don't have access to the Meson 0.57 bugfix.

I dunno about "unfair". It's simply the case that the only way we document
to build QEMU is to run 'make'. Anything else might or might not work.
If there's an issue that we should be trying to fix by updating our
meson submodule, we should address it by making that update.

thanks
-- PMM

