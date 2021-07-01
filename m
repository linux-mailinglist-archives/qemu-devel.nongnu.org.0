Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D463B9837
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 23:34:21 +0200 (CEST)
Received: from localhost ([::1]:60316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lz4KC-0005uf-C1
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 17:34:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1lz4Ih-0004oo-Cm
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 17:32:47 -0400
Received: from forward3-smtp.messagingengine.com ([66.111.4.237]:58135)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1lz4If-0008Gt-Bx
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 17:32:46 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailforward.nyi.internal (Postfix) with ESMTP id 603AD1940612;
 Thu,  1 Jul 2021 17:32:43 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 01 Jul 2021 17:32:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=mWlQta
 zONJf20m+7LmPaIQjTDpN9ZKSOivB8Gnz9aQU=; b=CBxRH3+MKhjaLiPYU1WCya
 0jrXt76EjE4MIUWl0n7iSc+OO3Z+86CVPw/wTM5Iqt/9yHQrrlfHgszJ1F2ctZsq
 gHmSxRL1t+Yl4Oq8e+/qciVZ1PJbK8XmIpEbXCCy/my97hZwphdnsJ43hl+En7SJ
 8o5XvFuw0CINgeK658OPwx2uJ1t7nnqLB+LgvX3PzoYpW4aBWiS7RNtbDL2RBrSW
 zYYAKL+05LPLKcGVXh4fd7UFiOn0mixlRJKoWhSMkeoUjRthVR1dsKPbW/3i2LfA
 IrYD+EFbVkwnDWqhnn6Q7U4gHZq8b/UWzjM/YNZgi2PiZK+YZXcO6LQEe1l49kaw
 ==
X-ME-Sender: <xms:ejTeYEgGtnNHSjOBIdWKQSCaKLeXkGGUPwxpjifq9VoSmVqWxymMXQ>
 <xme:ejTeYNB4e1ChLGMwCFGKrtVruxrUn5NvnsxkK1cP0pquFr2nJN9lDHURNI3aS8gpl
 -BIQ5-y-5YXG2P7MxA>
X-ME-Received: <xmr:ejTeYMGoPeodIcqXaJxOXjpTVCuVoS9OHtPb5QeS1Ndp_oO4DAebxR_qbOUr4w-uOHJOBvGGEosn7Vnkku2yYvvWCbB9fa5hM9pbBIHQguU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeeiiedgudehlecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefvufgjfhfhfffkgggtsehttdertddttddtnecuhfhrohhmpeffrghvihgu
 ucfgughmohhnughsohhnuceoughmvgesughmvgdrohhrgheqnecuggftrfgrthhtvghrnh
 ephfekgeeutddvgeffffetheejvdejieetgfefgfffudegffffgeduheegteegleeknecu
 vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepughmvgesug
 hmvgdrohhrgh
X-ME-Proxy: <xmx:ejTeYFSsrVbsg0Ln4Y978qru-_iHo3w_FEIzOlc8utG1f53_f22acw>
 <xmx:ejTeYByceeLV6hByTMRG0jcUNdqjnaJ7pDk2CEwjpewDbPxYU3dAWA>
 <xmx:ejTeYD48v2L9UHuaMh_xF7jsjNG8HMxx8sK0OA4abgWD9jFFiXl3UQ>
 <xmx:ezTeYAzX9BY4XP1hocz9onM89uJImCBEqYspbw8M_FMEBIVHgGVfIw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 1 Jul 2021 17:32:42 -0400 (EDT)
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id c0eccd27;
 Thu, 1 Jul 2021 21:32:39 +0000 (UTC)
To: Babu Moger <babu.moger@amd.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: Re: [RFC PATCH 0/7] Support protection keys in an AMD EPYC-Milan VM
In-Reply-To: <31dce00c-71bf-6d30-a1d2-f0b6ce743db2@amd.com>
References: <20210520145647.3483809-1-david.edmondson@oracle.com>
 <cunpmww227f.fsf@dme.org> <31dce00c-71bf-6d30-a1d2-f0b6ce743db2@amd.com>
X-HGTTG: heart-of-gold
From: David Edmondson <dme@dme.org>
Date: Thu, 01 Jul 2021 22:32:39 +0100
Message-ID: <m21r8h3eko.fsf@dme.org>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: neutral client-ip=66.111.4.237; envelope-from=dme@dme.org;
 helo=forward3-smtp.messagingengine.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_NEUTRAL=0.779, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thursday, 2021-07-01 at 16:24:51 -05, Babu Moger wrote:

> David, Are you still working on v2 of these series? I was going to test
> and review. Thanks

Yes. I have something that works, but it's messy in places. I hope to
get it out in a couple of days.

>> -----Original Message-----
>> From: David Edmondson <dme@dme.org>
>> Sent: Tuesday, June 8, 2021 3:25 AM
>> To: qemu-devel@nongnu.org
>> Cc: kvm@vger.kernel.org; Eduardo Habkost <ehabkost@redhat.com>; Paolo
>> Bonzini <pbonzini@redhat.com>; Marcelo Tosatti <mtosatti@redhat.com>;
>> Richard Henderson <richard.henderson@linaro.org>; Moger, Babu
>> <Babu.Moger@amd.com>
>> Subject: Re: [RFC PATCH 0/7] Support protection keys in an AMD EPYC-Milan
>> VM
>> 
>> On Thursday, 2021-05-20 at 15:56:40 +01, David Edmondson wrote:
>> 
>> > AMD EPYC-Milan CPUs introduced support for protection keys, previously
>> > available only with Intel CPUs.
>> >
>> > AMD chose to place the XSAVE state component for the protection keys
>> > at a different offset in the XSAVE state area than that chosen by
>> > Intel.
>> >
>> > To accommodate this, modify QEMU to behave appropriately on AMD
>> > systems, allowing a VM to properly take advantage of the new feature.
>> >
>> > Further, avoid manipulating XSAVE state components that are not
>> > present on AMD systems.
>> >
>> > The code in patch 6 that changes the CPUID 0x0d leaf is mostly dumped
>> > somewhere that seemed to work - I'm not sure where it really belongs.
>> 
>> Ping - any thoughts about this approach?
>> 
>> > David Edmondson (7):
>> >   target/i386: Declare constants for XSAVE offsets
>> >   target/i386: Use constants for XSAVE offsets
>> >   target/i386: Clarify the padding requirements of X86XSaveArea
>> >   target/i386: Prepare for per-vendor X86XSaveArea layout
>> >   target/i386: Introduce AMD X86XSaveArea sub-union
>> >   target/i386: Adjust AMD XSAVE PKRU area offset in CPUID leaf 0xd
>> >   target/i386: Manipulate only AMD XSAVE state on AMD
>> >
>> >  target/i386/cpu.c            | 19 +++++----
>> >  target/i386/cpu.h            | 80 ++++++++++++++++++++++++++++--------
>> >  target/i386/kvm/kvm.c        | 57 +++++++++----------------
>> >  target/i386/tcg/fpu_helper.c | 20 ++++++---
>> >  target/i386/xsave_helper.c   | 70 +++++++++++++++++++------------
>> >  5 files changed, 152 insertions(+), 94 deletions(-)
>> >
>> > --
>> > 2.30.2
>> 
>> dme.
>> --
>> You know your green from your red.

dme.
-- 
When you were the brightest star, who were the shadows?

