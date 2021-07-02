Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 173473B9C6B
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 08:52:23 +0200 (CEST)
Received: from localhost ([::1]:46860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzD2D-0004y0-M3
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 02:52:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1lzD08-0003Qc-65
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 02:50:12 -0400
Received: from forward4-smtp.messagingengine.com ([66.111.4.238]:60539)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1lzD05-0002wo-Fk
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 02:50:11 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailforward.nyi.internal (Postfix) with ESMTP id 568AF1940773;
 Fri,  2 Jul 2021 02:50:07 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 02 Jul 2021 02:50:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=YAHFJq
 aA0xLsbatyjAwzxRGI4nuij573ksiZKFlRoOw=; b=ry0frhy6fCDumrYooVhhIE
 xmdYkftIZ885P1y4W82evEACwi9fqKCTAtfM5UbIsNYRIEGR0JmkIgNOaihRYSfw
 kPmAIArnbfKMYC6qWfF5J+IQD+Y9W6Kz6Eyx7rgLD2JhMTSqfuLhSk9RK4tDYSQn
 8I7vBARLnZ+JerBPrw9lj/zmbPU+xLUoXkwTcljNnF9hCSgGxTXA2vAEKxi5hQXl
 IWOAs0g1wtp6XE2pN9G3O5fclvtYwnK4XyrP/y2yX0zwWoSd4Y4vn8IMlSkd+wyc
 73TDw0P4Xoa+aJohNlNwe7bMuwM4CjHYPPt5hETHkaRA8OJOe4kaDBpP0Urjj/QQ
 ==
X-ME-Sender: <xms:HrfeYE-QS9ermURx4UwjQ6QNFUnPtELHoGXKh7lZHpai4TXwnd4bJA>
 <xme:HrfeYMuHnWG15Ybd7aajDhhl52umjJgZ3WzCBTtJ2r9Ys9sFb0GKTvb6ZgzwkFwc6
 RYaggT0HqZ-iNhnhAs>
X-ME-Received: <xmr:HrfeYKCLl0joDIqJ5CgYpGYXZN47rX3CWQJgel8sXbFuNKngw_0WG7FO4au-NrdJ5CKRlp6SwKPbsLH0xr1qblTpNyfrboEE5NUAo0MUAtY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeeijedguddutdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefvufgjfhfhfffkgggtsehttdertddttddtnecuhfhrohhmpeffrghvihgu
 ucfgughmohhnughsohhnuceoughmvgesughmvgdrohhrgheqnecuggftrfgrthhtvghrnh
 eptdduueegtedvfeehtedutedtkeekgefgjeevvdeuveeiudehieeutdfgffehleeknecu
 ffhomhgrihhnpehgihhthhhusgdrtghomhdpkhgvrhhnvghlrdhorhhgnecuvehluhhsth
 gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepughmvgesughmvgdrohhr
 gh
X-ME-Proxy: <xmx:HrfeYEefW8wP3BXIRIsCT-HXy0B51Uvt2QRQFNIGhP3NQjQZvTVreA>
 <xmx:HrfeYJNf1PdaL0h8CtVv3_rWxY81E48hnrO50yv9SeDVjjdMis4_uQ>
 <xmx:HrfeYOlftWk4E43WPUoAbu5LAGLPNBzI6JiFeCyeeSBK32C0QdIiQA>
 <xmx:H7feYPvHTmToJV5ahxrA02ATmrETUxA8FgBNmqjtZ-aAkZz6p34moSF1-v4>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 2 Jul 2021 02:50:05 -0400 (EDT)
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 5a89e235;
 Fri, 2 Jul 2021 06:50:03 +0000 (UTC)
To: Michael Roth <michael.roth@amd.com>, Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH] target/i386: Fix cpuid level for AMD
In-Reply-To: <162517174973.564224.1039189315728194554@amd.com>
References: <20210628132018.394994-1-pizhenwei@bytedance.com>
 <YNsoyqFvzXL0FXC8@work-vm>
 <162508068941.526217.2563710865841096339@amd.com>
 <20210701104313.5b64a9b4@redhat.com>
 <162517174973.564224.1039189315728194554@amd.com>
X-HGTTG: heart-of-gold
From: David Edmondson <dme@dme.org>
Date: Fri, 02 Jul 2021 07:50:03 +0100
Message-ID: <m2sg0x1a78.fsf@dme.org>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: neutral client-ip=66.111.4.238; envelope-from=dme@dme.org;
 helo=forward4-smtp.messagingengine.com
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
Cc: ehabkost@redhat.com, like.xu@linux.intel.com, qemu-devel@nongnu.org,
 wei.huang2@amd.com, richard.henderson@linaro.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 zhenwei pi <pizhenwei@bytedance.com>, armbru@redhat.com, babu.moger@amd.com,
 pbonzini@redhat.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thursday, 2021-07-01 at 15:35:49 -05, Michael Roth wrote:

> Quoting Igor Mammedov (2021-07-01 03:43:13)
>> On Wed, 30 Jun 2021 14:18:09 -0500
>> Michael Roth <michael.roth@amd.com> wrote:
>> 
>> > Quoting Dr. David Alan Gilbert (2021-06-29 09:06:02)
>> > > * zhenwei pi (pizhenwei@bytedance.com) wrote:  
>> > > > A AMD server typically has cpuid level 0x10(test on Rome/Milan), it
>> > > > should not be changed to 0x1f in multi-dies case.
>> > > > 
>> > > > Fixes: a94e1428991 (target/i386: Add CPUID.1F generation support
>> > > > for multi-dies PCMachine)
>> > > > Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>  
>> > > 
>> > > (Copying in Babu)
>> > > 
>> > > Hmm I think you're right.  I've cc'd in Babu and Wei.
>> > > 
>> > > Eduardo: What do we need to do about compatibility, do we need to wire
>> > > this to machine type or CPU version?  
>> > 
>> > FWIW, there are some other CPUID entries like leaves 2 and 4 that are
>> > also Intel-specific. With SEV-SNP CPUID enforcement, advertising them to
>> > guests will result in failures when host SNP firmware checks the
>> > hypervisor-provided CPUID values against the host-supported ones.
>> > 
>> > To address this we've been planning to add an 'amd-cpuid-only' property
>> > to suppress them:
>> > 
>> >   https://github.com/mdroth/qemu/commit/28d0553fe748d30a8af09e5e58a7da3eff03e21b
>> > 
>> > My thinking is this property should be off by default, and only defined
>> > either via explicit command-line option, or via new CPU types. We're also
>> > planning to add new CPU versions for EPYC* CPU types that set this
>> > 'amd-cpuid-only' property by default:
>> > 
>> >   https://github.com/mdroth/qemu/commits/new-cpu-types-upstream
>> It look like having new cpu versions is enough to change behavior,
>> maybe keep 'amd-cpuid-only' as internal field and not expose it to users
>> as a property.
>
> Hmm, I defined it as a property mainly to make use of
> X86CPUVersionDefinition.props to create new versions of the CPU types
> with those properties set.
>
> There's a patch there that adds X86CPUVersionDefinition.cache_info so
> that new cache definitions can be provided for new CPU versions. So
> would you suggest a similar approach here, e.g. adding an
> X86CPUVersionDefinition.amd_cpuid_only field that could be used directly
> rather than going through X86CPUVersionDefinition.props?
>
> There's also another new "amd-xsave" prop in that series that does something
> similar to "amd-cpuid-only", so a little worried about tacking to much extra
> into X86CPUVersionDefinition. But maybe that one could just be rolled into
> "amd-cpuid-only" since it is basically fixing up xsave-related cpuid
> entries for AMD...

The XSAVE changes are similar to
https://lore.kernel.org/r/20210520145647.3483809-1-david.edmondson@oracle.com,
in response to which Paolo suggested that I should have QEMU observe the
CPUID 0xd leaves rather than encoding knowledge about the state offsets
(at least, that's how I understood his comment).

I have patches that do this (which includes making X86XSaveArea a
TCG-only thing) that I plan to send out in the next couple of days. They
should make "amd-xsave" unnecessary.

>> 
>> > So in general I think maybe this change should be similarly controlled by
>> > this proposed 'amd-cpuid-only' property. Maybe for this particular case it's
>> > okay to do it unconditionally, but it sounds bad to switch up the valid CPUID
>> > range after a guest has already booted (which might happen with old->new
>> > migration for instance), since it might continue treating values in the range
>> > as valid afterward (but again, not sure that's the case here or not).
>> > 
>> > There's some other changes with the new CPU types that we're still
>> > considering/testing internally, but should be able to post them in some form
>> > next week.
>> > 
>> > -Mike
>> > 
>> > > 
>> > > Dave
>> > >   
>> > > > ---
>> > > >  target/i386/cpu.c | 8 ++++++--
>> > > >  1 file changed, 6 insertions(+), 2 deletions(-)
>> > > > 
>> > > > diff --git a/target/i386/cpu.c b/target/i386/cpu.c
>> > > > index a9fe1662d3..3934c559e4 100644
>> > > > --- a/target/i386/cpu.c
>> > > > +++ b/target/i386/cpu.c
>> > > > @@ -5961,8 +5961,12 @@ void x86_cpu_expand_features(X86CPU *cpu, Error **errp)
>> > > >              }
>> > > >          }
>> > > >  
>> > > > -        /* CPU topology with multi-dies support requires CPUID[0x1F] */
>> > > > -        if (env->nr_dies > 1) {
>> > > > +        /*
>> > > > +         * Intel CPU topology with multi-dies support requires CPUID[0x1F].
>> > > > +         * For AMD Rome/Milan, cpuid level is 0x10, and guest OS should detect
>> > > > +         * extended toplogy by leaf 0xB. Only adjust it for Intel CPU.
>> > > > +         */
>> > > > +        if ((env->nr_dies > 1) && IS_INTEL_CPU(env)) {
>> > > >              x86_cpu_adjust_level(cpu, &env->cpuid_min_level, 0x1F);
>> > > >          }
>> > > >  
>> > > > -- 
>> > > > 2.25.1
>> > > > 
>> > > >   
>> > > -- 
>> > > Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
>> > > 
>> > >  
>> > 
>> 
>>

dme.
-- 
I had my eyes closed in the dark.

