Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B25E5AF658
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 22:50:40 +0200 (CEST)
Received: from localhost ([::1]:49770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVfWp-00080z-8B
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 16:50:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arnd@arndb.de>)
 id 1oVfRp-0004iU-Ry; Tue, 06 Sep 2022 16:45:31 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:51087)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arnd@arndb.de>)
 id 1oVfRm-0000pn-TJ; Tue, 06 Sep 2022 16:45:28 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id B089A58055A;
 Tue,  6 Sep 2022 16:45:22 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
 by compute3.internal (MEProxy); Tue, 06 Sep 2022 16:45:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1662497122; x=
 1662500722; bh=u8PqlsTGRRNhe8EU7QHSPpRYK1LxejqlRIXFdMaPpxs=; b=f
 aa6qsM7J5koeNq9oc8EmcPK54+LY93/nnBx5RNLy1CRQ3PLMEDLR6m0mqikAJA3O
 O3/kQpcWFK7gC+WcpNUsRmW2cRIxk7tLbxLA52GdAGr6LvalZvyLwdG+RR+3fUJH
 xq9rh/mXU5GffnSRSGd0TWDgH5EZjI05g6ZQPiTPHNDf6gqowpWiVLujFbstYlK/
 c0zEI3SgPF899LCdeHWxBaW1Y04L71Jdz2+UmSmwDrEP11m5cttm/FtdNi/i3ff4
 4ZYop/y/kKUhvZ1Q532HbyIvbuqY+zyoURPa9gzCtntaYYDyDuWFVp/ksuvZrQzj
 u3wvOEa3sSsh0fBPpgEDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1662497122; x=
 1662500722; bh=u8PqlsTGRRNhe8EU7QHSPpRYK1LxejqlRIXFdMaPpxs=; b=D
 aDtKzE17UfrF6dgZcEoeJ+Hhjc8nyUK6xyLt5vIkjTat5c9oxYpRIrdSCByk9VC5
 w6AKWlz1+8ap8lL6FGRl59ocTzFT9vE/Y+dGQjbNaU0xQFqclVxi00dNw0A7mVvG
 QSIznq0p1/VPlr/SDabVrenzvXcas3zkLzjKoDmtke/zX4A5a2qz9Q1k4tOKVzqW
 xDhqL7secVigiYANPu+OTLcSKuoMAZuNKA0myn7fa/v+cCXsIriw4U/VjvUN4WQV
 3aOiEuRc+wSWBUqnhm73I/xyn5aIADADKLAFsxitmDfvrkf0m03G6T2n8S1QOxzj
 qkuN2oTwJC3F13pIUHxPg==
X-ME-Sender: <xms:YrEXY4rZNnBloMcp9N_XbqGwDIrH63ayoW-whR--72zJdmynyRLn5Q>
 <xme:YrEXY-q3-o1icWTQnHDqDlpfwGX9OfSporvpbi5j-IhRz5ByJLLPW5KPQ70nr4_5M
 DuJlqBf8xRFquebadA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdelkedgudehgecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedf
 tehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrf
 grthhtvghrnhepgeefjeehvdelvdffieejieejiedvvdfhleeivdelveehjeelteegudek
 tdfgjeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:YrEXY9PiFCTZkvv17d_3lLv1reIMkggUKcoCicpakgFb1jXRt_dVXA>
 <xmx:YrEXY_6RFXqDgD0b6BCLxkMjDIFdxlFtZvlytXkH6GgfonQGh24u6g>
 <xmx:YrEXY34hxXLeWPUX0jsJgBl_N_44iRhyEkCZ942IkewdOq95APa33w>
 <xmx:YrEXY5nf_0PUvtG4AJMoaY6I37y_UH1x3DXsWrXOryoov0nkiLL1EA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 632A1B60083; Tue,  6 Sep 2022 16:45:22 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-927-gf4c98c8499-fm-20220826.002-gf4c98c84
Mime-Version: 1.0
Message-Id: <49a0474b-96b6-4366-a6a2-f59ad0b5a0bf@www.fastmail.com>
In-Reply-To: <20220906172257.2776521-1-alex.bennee@linaro.org>
References: <20220906172257.2776521-1-alex.bennee@linaro.org>
Date: Tue, 06 Sep 2022 22:45:02 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: "Arnd Bergmann" <arnd@linaro.org>,
 "Anders Roxell" <anders.roxell@linaro.org>,
 "Peter Maydell" <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Subject: Re: [RFC PATCH] target/arm: update the cortex-a15 MIDR to latest rev
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=66.111.4.229; envelope-from=arnd@arndb.de;
 helo=new3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 6, 2022, at 7:22 PM, Alex Benn=C3=A9e wrote:
>
> index 3099b38e32..59d5278868 100644
> --- a/target/arm/cpu_tcg.c
> +++ b/target/arm/cpu_tcg.c
> @@ -588,7 +588,9 @@ static void cortex_a15_initfn(Object *obj)
>      set_feature(&cpu->env, ARM_FEATURE_EL3);
>      set_feature(&cpu->env, ARM_FEATURE_PMU);
>      cpu->kvm_target =3D QEMU_KVM_ARM_TARGET_CORTEX_A15;
> -    cpu->midr =3D 0x412fc0f1;
> +    /* r4p0 cpu, not requiring expensive tlb flush errata */
> +    cpu->midr =3D 0x414fc0f0;
> +    cpu->revidr =3D 0x200;
>      cpu->reset_fpsid =3D 0x410430f0;
>      cpu->isar.mvfr0 =3D 0x10110222;
>      cpu->isar.mvfr1 =3D 0x11111111;

This will work correctly with Linux, but after I checked the
Cortex-A15 MPCore r2/r3/r4 Software Developers Errata Notice again,
I think that setting revidr here is not fully correct:

With an r3p3 CPU, bit 9 of revidr (0x200) indicates that no
workaround is necessary, but with r4p0 and higher, this bit
is marked as reserved and both the Documentation and the
Linux source code assume the hardware works correctly.

So I think this should either be 0x413fc0f3/0x200
or 0x414fc0f0/0.

     Arnd

