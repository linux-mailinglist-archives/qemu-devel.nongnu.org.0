Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A66DD3A760A
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 06:42:36 +0200 (CEST)
Received: from localhost ([::1]:60628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt0uJ-0006fK-PC
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 00:42:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1lt0su-0005It-OE; Tue, 15 Jun 2021 00:41:08 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:35813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1lt0ss-0008F4-Nr; Tue, 15 Jun 2021 00:41:08 -0400
Received: by mail-pg1-x532.google.com with SMTP id v7so1679259pgl.2;
 Mon, 14 Jun 2021 21:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=zgmqhRXimIbINQ5iG1wKjSAFUfOoVrW3/Yv9XZ/T30g=;
 b=SLD6G90/ZRRUC+cXSc9BCfZrBRUkujVVvAXGorzegoiotcz9Uz7DR2Zw75tcpHi7QL
 5dgWfRfMAQH2o9D1jQ3o0mWjE88lR3VbIpX8i18ClTy7yACDs/wwmJswnRuFCpYDiEqQ
 dnSDEBPhi6hwYblbxBCU/3o97/zbEHfM18JogqX5EFpXBy8v8dG3mOnClfqtL7V3Jfl4
 5EKSNIAcryUk9ZGzQLhtpA7kpkZ3sM1ZX4BLyd5zwQ8xjY6+MDby576VmTsgewlRsMeo
 rDRXdQCmcU9vUBtBopRA6sl3aYg3RjXO4IvU5tsixf71Ewo1+WWs1DhD7OKoEUfy6mlO
 Nhkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=zgmqhRXimIbINQ5iG1wKjSAFUfOoVrW3/Yv9XZ/T30g=;
 b=MVSRfWeqC2YJfYYISIL/W23uskAAwVKOSyP6Yo/JLg9ufGODqB/s08Qkn6vX0wy/u6
 Ixzf3YBZLswOfoNbsv8PRrwfh+2JcxaSta00JxrMs/jdoyqb1/ulkCPCFDooCX/gERBy
 hLCF7znJNS1NiKc3vf4qyopDNDRMOvzwkBgdViZFuEkP4haVTEcfTsGt4fzfAN6oM4z+
 9fQSENTGNsrQBmq1V4/xaPWfi/Z8BSKKRaAppVEWszzBmu0ZqXvu0LbwxrQ1FvJ4ZUVO
 mSHQpifMFWXWWY7HXolEAWgZkl1yZ+ErBqKQuuVLl8fEikDwkJhvGRTLNLqtog7aB9Q8
 3goQ==
X-Gm-Message-State: AOAM532XDUpMmPg69otD32PyNz0ucQgTGQ8lTpvYT1qhmsE4Wbpfcvh0
 HD3icG8PKsrZBijJhz+/werb1OzMVC0=
X-Google-Smtp-Source: ABdhPJxh5QM8PTGbr5EMr4zjyknSUmv0RMRznFNgVzd/pmJKJOac0R+1PTUkmPn5XpqVFyzgbLSZ8A==
X-Received: by 2002:a63:574d:: with SMTP id h13mr20357521pgm.155.1623732064143; 
 Mon, 14 Jun 2021 21:41:04 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id o16sm13658830pfu.75.2021.06.14.21.41.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 21:41:03 -0700 (PDT)
Date: Tue, 15 Jun 2021 14:40:57 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] target/ppc/spapr: Update H_GET_CPU_CHARACTERISTICS bits
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210503125833.891752-1-npiggin@gmail.com>
 <YJCYKBF2YgEl8AEA@yekko> <1620117371.82b83ry366.astroid@bobo.none>
 <YJIdDOCE6CMZ0zLF@yekko>
In-Reply-To: <YJIdDOCE6CMZ0zLF@yekko>
MIME-Version: 1.0
Message-Id: <1623730922.tf1qq0s38o.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=npiggin@gmail.com; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Excerpts from David Gibson's message of May 5, 2021 2:20 pm:
> On Tue, May 04, 2021 at 06:50:54PM +1000, Nicholas Piggin wrote:
>> Excerpts from David Gibson's message of May 4, 2021 10:41 am:
>> > On Mon, May 03, 2021 at 10:58:33PM +1000, Nicholas Piggin wrote:
>> >> There are several new bits added to the hcall which reflect new issue=
s
>> >> found and new hardware mitigations.
>> >>=20
>> >> This adds the link stack flush behaviour, link stack flush accelerate=
d
>> >> instruction capability, and several L1D flush type behaviours (which =
are
>> >> now being specified as negative in order to simplify patched kernel
>> >> compatibility with older firmware).
>> >=20
>> > So, to clarify here, the bits your adding aren't advertising any new
>> > behaviour on qemu/KVM's part, they're just new ways of advertising the
>> > same behaviour?
>>=20
>> I... think so. "Behaviour" is in context of the hcall that advertises
>> how the processor behaves (or what the guest must do for security).
>=20
> Heh.  Don't get me started on how the difference between
> "characteristics" and "behaviours" in the fields is totally
> non-obvious.
>=20
>> The new NO_ bits added are for processors that don't require a particula=
r
>> flush. The FLUSH_LINK_STACK was basically always required but I think
>> Linux just keyed off the count cache flush and did both at once.
>>=20
>> The new LINK_FLUSH_ASSIST is a new processor feature the guest will use
>> to implement link stack flushing, so maybe that does need a cap?
>=20
> Yeah, sounds like it will.
>=20
>>=20
>> >=20
>> >>=20
>> >> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> >> ---
>> >>  hw/ppc/spapr_hcall.c   | 5 +++++
>> >>  include/hw/ppc/spapr.h | 6 ++++++
>> >>  2 files changed, 11 insertions(+)
>> >>=20
>> >> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
>> >> index 7275d0bba1..f656620232 100644
>> >> --- a/hw/ppc/spapr_hcall.c
>> >> +++ b/hw/ppc/spapr_hcall.c
>> >> @@ -1878,6 +1878,9 @@ static target_ulong h_get_cpu_characteristics(P=
owerPCCPU *cpu,
>> >>          behaviour |=3D H_CPU_BEHAV_L1D_FLUSH_PR;
>> >>          break;
>> >>      case SPAPR_CAP_FIXED:
>> >> +        behaviour |=3D H_CPU_BEHAV_NO_L1D_FLUSH_ENTRY;
>> >> +        behaviour |=3D H_CPU_BEHAV_NO_L1D_FLUSH_UACCESS;
>> >> +        behaviour |=3D H_CPU_BEHAV_NO_STF_BARRIER;
>> >>          break;
>> >>      default: /* broken */
>> >>          assert(safe_cache =3D=3D SPAPR_CAP_BROKEN);
>> >> @@ -1909,9 +1912,11 @@ static target_ulong h_get_cpu_characteristics(=
PowerPCCPU *cpu,
>> >>          break;
>> >>      case SPAPR_CAP_WORKAROUND:
>> >>          behaviour |=3D H_CPU_BEHAV_FLUSH_COUNT_CACHE;
>> >> +        behaviour |=3D H_CPU_BEHAV_FLUSH_LINK_STACK;
>> >>          if (count_cache_flush_assist) {
>> >>              characteristics |=3D H_CPU_CHAR_BCCTR_FLUSH_ASSIST;
>> >>          }
>> >> +        /* Should have a way to enable BCCTR_LINK_FLUSH_ASSIST */
>> >=20
>> > Do we need a new spapr capability for this link flush thing?
>>=20
>> It is independent of the FLUSH_COUNT_CACHE capability, so it seems like
>> it should I think? Should that be added as a following patch?
>=20
> No, it will have to go in first or at the same time.  Otherwise we'll
> be errneously advertising things.

Sorry to take so long to get back to this.

I think it might be more complex than I first had. IBS is for indirect=20
branches except blr type AFAIK, so link stack may still need to be=20
flushed if count cache is disabled, for example. So then we'd need a
RBS (return branch speculation) or something for the link stack, as well=20
as the cap for link stack flush assist instruction.

While STF barrier may not be quite right to key off safe cache cap,=20
maybe it needs its own cap as well? Although CPUs today follow the rule=20
that if the cache flush is required then so is the stf barrier.

At any rate, the cache flush ones are most important so I'll send a=20
patch for them alone first.

Thanks,
Nick


