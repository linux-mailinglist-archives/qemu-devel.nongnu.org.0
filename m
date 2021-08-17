Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46EC73EF567
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 00:06:35 +0200 (CEST)
Received: from localhost ([::1]:54538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mG7E9-0000vw-O7
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 18:06:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <srutherford@google.com>)
 id 1mG7Cz-00007i-Fa
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 18:05:22 -0400
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c]:33546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <srutherford@google.com>)
 id 1mG7Cu-00079G-MQ
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 18:05:20 -0400
Received: by mail-il1-x12c.google.com with SMTP id z2so138675iln.0
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 15:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OZqPgounEIER6ocdPyrnXbdW3TYtXZWjlNEg5NQfLK8=;
 b=hRJyAcxfN5jVh6JWF7HUfeYFRkenRRp99StwCAkKyZPNNfrG6a/NC4COGxHzCvLlQz
 I6UwnYV58HANPjcsP+De8UwFM5Ro/+lnePUBlXbAtenAkq9loOCb8XAkORhs6jI4ZD68
 HjF0Xog7zdzjiuNljLfPYFT4/jDtn/yRf8qCcxHpOO3ziLuB4ckrsfme7TtnCqMbiC7Y
 VtJo82ezAZwhl/nYkl5QBJzeKZOH8TlxLwSIIFupdoCetchMUzmC0kouyoQfT82UXGp2
 yRPAR2D5W993Yx9G7yITCkeSJdKh+JJ72NQnWSFLqq4CyOaaZy1o0BqO5Kl20wozqX1M
 b3iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OZqPgounEIER6ocdPyrnXbdW3TYtXZWjlNEg5NQfLK8=;
 b=Vbp/+dHPqvZJQ1NTxCATaSNtrEoEpkUU9LAPlcJm7SNtVHMVnRUmfVh16qvFoPuInf
 Y6zEDjexO4/04450CadZvwMwjFfqf7x3cE+2Ec9bajo9csF0MeCZN6gM3/zr8/vDh7Ti
 7qAfRsTmmYSZWFliidVyhFmj9XKVd9v69NwYWqcSvZV9N0QwE7XvLuJe6g+frqhR9Jmb
 skzvf3kJKzlK7eZZ0KjSeVr5MI1rOP4qr0Od3/L2Byk1bN+LvhTyj4ALId8nk8T3rz/f
 JiiVA2NRMDjiwxZok67VtuGRbrzX5W958eNabpR5b69cgXnoq2Ug+DOLRGR8Yx376GFg
 ZmkQ==
X-Gm-Message-State: AOAM5307KoMdy+zlTwJgDw/1WsP4EMlVGsuCfLeHWYcFW19FjmqPpGmu
 tgJeuigCKDetnnYjdRHvwMgkYvmv4yjSn1S5p2rKyA==
X-Google-Smtp-Source: ABdhPJxlYq9gxQzuDtH+0kqvgJ74s7MMMkyqidnNO4T4Qi8RoJvXSbWnXgHR/zI+wGlJhp33pfEuo3XvpED6dR4bes0=
X-Received: by 2002:a05:6e02:688:: with SMTP id
 o8mr4088723ils.182.1629237908890; 
 Tue, 17 Aug 2021 15:05:08 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1629118207.git.ashish.kalra@amd.com>
 <CABayD+fyrcyPGg5TdXLr95AFkPFY+EeeNvY=NvQw_j3_igOd6Q@mail.gmail.com>
 <0fcfafde-a690-f53a-01fc-542054948bb2@redhat.com>
 <37796fd1-bbc2-f22c-b786-eb44f4d473b9@linux.ibm.com>
In-Reply-To: <37796fd1-bbc2-f22c-b786-eb44f4d473b9@linux.ibm.com>
From: Steve Rutherford <srutherford@google.com>
Date: Tue, 17 Aug 2021 15:04:32 -0700
Message-ID: <CABayD+evf56U4yT2V1TmEzaJjvV8gutUG5t8Ob2ifamruw5Qrg@mail.gmail.com>
Subject: Re: [RFC PATCH 00/13] Add support for Mirror VM.
To: Tobin Feldman-Fitzthum <tobin@linux.ibm.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Ashish Kalra <Ashish.Kalra@amd.com>,
 thomas.lendacky@amd.com, 
 brijesh.singh@amd.com, ehabkost@redhat.com, kvm@vger.kernel.org, 
 mst@redhat.com, tobin@ibm.com, jejb@linux.ibm.com, 
 richard.henderson@linaro.org, qemu-devel@nongnu.org, dgilbert@redhat.com, 
 frankeh@us.ibm.com, dovmurik@linux.vnet.ibm.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12c;
 envelope-from=srutherford@google.com; helo=mail-il1-x12c.google.com
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

On Tue, Aug 17, 2021 at 1:50 PM Tobin Feldman-Fitzthum
<tobin@linux.ibm.com> wrote:
>
>
> On 8/17/21 12:32 PM, Paolo Bonzini wrote:
> > There's three possibilities for this:
> >
> > 1) the easy one: the bottom 4G of guest memory are mapped in the
> > mirror VM 1:1.  The ram_addr_t-based addresses are shifted by either
> > 4G or a huge value such as 2^42 (MAXPHYADDR - physical address
> > reduction - 1). This even lets the migration helper reuse the OVMF
> > runtime services memory map (but be careful about thread safety...).
>
> This is essentially what we do in our prototype, although we have an
> even simpler approach. We have a 1:1 mapping that maps an address to
> itself with the cbit set. During Migration QEMU asks the migration
> handler to import/export encrypted pages and provides the GPA for said
> page. Since the migration handler only exports/imports encrypted pages,
> we can have the cbit set for every page in our mapping. We can still use
> OVMF functions with these mappings because they are on encrypted pages.
> The MH does need to use a few shared pages (to communicate with QEMU,
> for instance), so we have another mapping without the cbit that is at a
> large offset.
>
> I think this is basically equivalent to what you suggest. As you point
> out above, this approach does require that any page that will be
> exported/imported by the MH is mapped in the guest. Is this a bad
> assumption? The VMSA for SEV-ES is one example of a region that is
> encrypted but not mapped in the guest (the PSP handles it directly). We
> have been planning to map the VMSA into the guest to support migration
> with SEV-ES (along with other changes).

Ahh, It sounds like you are looking into sidestepping the existing
AMD-SP flows for migration. I assume the idea is to spin up a VM on
the target side, and have the two VMs attest to each other. How do the
two sides know if the other is legitimate? I take it that the source
is directing the LAUNCH flows?


--Steve

