Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE61448D70A
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 13:00:14 +0100 (CET)
Received: from localhost ([::1]:51178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7ym5-00039O-Q9
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 07:00:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7yeI-00023V-58
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 06:52:10 -0500
Received: from [2a00:1450:4864:20::32f] (port=55279
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7yeF-0004iT-Uq
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 06:52:09 -0500
Received: by mail-wm1-x32f.google.com with SMTP id p18so3655986wmg.4
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 03:52:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rBAArrZ7YmT92bzZLOKCqrXTbqCsb8BY2HIORQXsSaE=;
 b=IOY/uP6y/xpEp+4JZFnSwiw48IvACQlKjCuTyTke473xqokyV5lsHqSdXGvXKOhQEs
 Ojy/MUQl3u+DJKgOD9KwPsjhUa6ILY4p6HPHGg/KmGd6wqCFFh49BF4gxuJJk/UNWid1
 YnxQNU5b/iLX6lC7DDNtFQqS5egGt+SX17dE/2RvxFhdahE33RWyMcTvTSxNNJTKKzvi
 O1UOY40KLR30zBXIKeyMf+FTaqLKbEnMwLeFo0pdtijPlkFi49hVlO4f3EiUzgwoZrbl
 nwT/kAFUptiKwh6mqDfZ42GG8hLB01YOimec9OR8UYaI7Bpcdd/hLVRfzhKEIfqwpBVR
 T6Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rBAArrZ7YmT92bzZLOKCqrXTbqCsb8BY2HIORQXsSaE=;
 b=0K9IU6XLbyo+X/+4uwCicHhh3QPlECvqvoA/nY0nv+eYgZKRYCaAu9wRftpOvQHUDS
 UMRgHN11xS6s5bGHCJy4YdQ6IvhDplOI6XWwJZRNq30vZzokDkqpkNIogeQi0/qc3Z5N
 RfpIfPkYDBZK8qMQhbuhMTcdP6sulkISHHn5iL40aJnxF3huZX9lLbhoyzElbc/ifhwj
 81Nq8moYjPTWIhsaoJP1ylA4ofSYhvFFSJXj4sooj1lAEAZryHFO9Dh0Rp54V7IpnHD/
 UocLQRvewthzFRoNs4OQjDy0ZzzhkXmxgsdcDEjpxw+LCmCxpyC3aIH3qW6vEaSpw8/W
 SB8Q==
X-Gm-Message-State: AOAM531C4fztVZUDy5bmraE4bulQcAa8B1bOrKHWnIZH0+/A6Zb01nnU
 DiuNj+TvlT15s6espQMYJ8+LH1s+P/VPKk0LVeKaIA==
X-Google-Smtp-Source: ABdhPJxsx7Dn1ZrPFdxcGpbm5PmIi3yZyLG/D+BcnKQlPcebs3f/QBjxKxLTTxmNS4gYXMzr8ufowIfHxtb8ha06B+A=
X-Received: by 2002:a05:600c:3ac5:: with SMTP id
 d5mr3608153wms.32.1642074725649; 
 Thu, 13 Jan 2022 03:52:05 -0800 (PST)
MIME-Version: 1.0
References: <20220110214755.810343-1-venture@google.com>
 <CAFEAcA8Bki2dpyptkSibz5=t9Fvy-PN8SjD=Z0PwcssX3MprRA@mail.gmail.com>
In-Reply-To: <CAFEAcA8Bki2dpyptkSibz5=t9Fvy-PN8SjD=Z0PwcssX3MprRA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Jan 2022 11:51:54 +0000
Message-ID: <CAFEAcA_OfpMLzG=eUuzw0O_V_cgb57=XADciyfiF7U1mK0FzxQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] Adds designware i2c module and adds it to virt arm
To: Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: mst@redhat.com, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, ani@anisinha.ca, imammedo@redhat.com, crauer@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 13 Jan 2022 at 11:48, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Mon, 10 Jan 2022 at 21:47, Patrick Venture <venture@google.com> wrote:
> >
> > This patch series introduces a new i2c module, namely the designware one and further enables this (optionally) for the virt-arm machine.
> >
> > Chris Rauer (2):
> >   hw/i2c: Add designware i2c controller.
> >   hw/arm: Enable smbus on arm virt machine.
>
> I need to see a pretty strong justification for why we
> should be adding new kinds of devices to the virt machine,
> given that it increases complexity and potential attack
> surface for using it with KVM; this cover letter doesn't
> seem to provide any...

Forgot to mention, but my prefered approach for providing
an i2c controller on the virt board would be to have a
PCI i2c controller: that way users who do need it can plug it
in with a -device command line option, and users who don't
need it never have to worry about it. (We seem to have
an ICH9-SMB PCI device already; I have no idea if it's suitable.)

thanks
-- PMM

