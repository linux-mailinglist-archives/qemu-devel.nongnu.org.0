Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6DB25EDA32
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 12:36:24 +0200 (CEST)
Received: from localhost ([::1]:47034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odUQN-0006lZ-N7
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 06:36:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@linux.intel.com>)
 id 1odSBd-0005qW-7l
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:12:57 -0400
Received: from mga06b.intel.com ([134.134.136.31]:3667 helo=mga06.intel.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@linux.intel.com>)
 id 1odSBa-0007xS-0x
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:12:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664352773; x=1695888773;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=WUydh4KeVaE5LqoKJNF+y6777z2ABFTIRnN2oRKQEkA=;
 b=JPPGckyDrfQ7UdoM9ZCq8Kpt5F1nVxN7Zh2biSjYUwTKRNonyThHSIzV
 REHMq7VK0kvSN6X5MeRNm1lnllYCQ7W4VFU9FgFspdHaQujxS6nAgcQhn
 +7S+w5IMqrrvCwjBh7n6tmfe6tW8HFF8RLUIYGmcAOWzcH80PEIprQ+J5
 gmSpCmEUsz8m73Xsf+zHordsvIqUsmWbj7Y/P6tuoS2guBJxCUuftf7if
 7AF3tHgK/oxc4FWv/U4ZIWBRvapcZ2Tn6GezgncmEx6fM0h4Axfsej/9n
 btaJAAbQNLskk2uw77R1toDxkMxEzVUYyGUhby8ADnqumlQw4zG8bFi0b A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="363379417"
X-IronPort-AV: E=Sophos;i="5.93,351,1654585200"; d="scan'208";a="363379417"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2022 01:12:45 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="725852890"
X-IronPort-AV: E=Sophos;i="5.93,351,1654585200"; d="scan'208";a="725852890"
Received: from yangzhon.bj.intel.com (HELO yangzhon) ([10.238.157.60])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2022 01:12:42 -0700
Date: Wed, 28 Sep 2022 04:12:32 -0400
From: Yang Zhong <yang.zhong@linux.intel.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Xiaoyao Li <xiaoyao.li@intel.com>, "Wang, Lei" <lei4.wang@intel.com>,
 paul.c.lai@intel.com, pbonzini@redhat.com, qemu-devel@nongnu.org,
 robert.hu@intel.com, chenyi.qiang@intel.com, yang.zhong@linux.intel.com
Subject: Re: [PATCH] i386: Add new CPU model SapphireRapids
Message-ID: <YzQB8GFVm6UPq1GD@yangzhon>
References: <20220812055751.14553-1-lei4.wang@intel.com>
 <Yysk/taT/eKR0Bp3@work-vm> <Yy21A2CWzrS3SIzH@yangzhon>
 <b1f238c6-ab3d-eb8f-d1b4-dbdf342c002c@intel.com>
 <YzFX04164F6KfZdY@yangzhon> <YzFoAWTHZZUE3CkW@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YzFoAWTHZZUE3CkW@work-vm>
Received-SPF: none client-ip=134.134.136.31;
 envelope-from=yang.zhong@linux.intel.com; helo=mga06.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On Mon, Sep 26, 2022 at 09:51:13AM +0100, Dr. David Alan Gilbert wrote:
> * Yang Zhong (yang.zhong@linux.intel.com) wrote:
> > On Sat, Sep 24, 2022 at 12:01:16AM +0800, Xiaoyao Li wrote:
> > > On 9/23/2022 9:30 PM, Yang Zhong wrote:
> > > > On Wed, Sep 21, 2022 at 03:51:42PM +0100, Dr. David Alan Gilbert wrote:
> > > > > * Wang, Lei (lei4.wang@intel.com) wrote:
> > > > > > The new CPU model mostly inherits features from Icelake-Server, while
> > > > > > adding new features:
> > > > > >   - AMX (Advance Matrix eXtensions)
> > > > > >   - Bus Lock Debug Exception
> > > > > > and new instructions:
> > > > > >   - AVX VNNI (Vector Neural Network Instruction):
> > > > > >      - VPDPBUS: Multiply and Add Unsigned and Signed Bytes
> > > > > >      - VPDPBUSDS: Multiply and Add Unsigned and Signed Bytes with Saturation
> > > > > >      - VPDPWSSD: Multiply and Add Signed Word Integers
> > > > > >      - VPDPWSSDS: Multiply and Add Signed Integers with Saturation
> > > > > >   - FP16: Replicates existing AVX512 computational SP (FP32) instructions
> > > > > >     using FP16 instead of FP32 for ~2X performance gain
> > > > > >   - SERIALIZE: Provide software with a simple way to force the processor to
> > > > > >     complete all modifications, faster, allowed in all privilege levels and
> > > > > >     not causing an unconditional VM exit
> > > > > >   - TSX Suspend Load Address Tracking: Allows programmers to choose which
> > > > > >     memory accesses do not need to be tracked in the TSX read set
> > > > > >   - AVX512_BF16: Vector Neural Network Instructions supporting BFLOAT16
> > > > > >     inputs and conversion instructions from IEEE single precision
> > > > > > 
> > > > > > Features may be added in future versions:
> > > > > >   - CET (virtualization support hasn't been merged)
> > > > > > Instructions may be added in future versions:
> > > > > >   - fast zero-length MOVSB (KVM doesn't support yet)
> > > > > >   - fast short STOSB (KVM doesn't support yet)
> > > > > >   - fast short CMPSB, SCASB (KVM doesn't support yet)
> > > > > > 
> > > > > > Signed-off-by: Wang, Lei <lei4.wang@intel.com>
> > > > > > Reviewed-by: Robert Hoo <robert.hu@linux.intel.com>
> > > > > 
> > > > > Hi,
> > > > >     What fills in the AMX tile and tmul information leafs
> > > > > (0x1D, 0x1E)?
> > > > >    In particular, how would we make sure when we migrate between two
> > > > > generations of AMX/Tile/Tmul capable devices with different
> > > > > register/palette/tmul limits that the migration is tied to the CPU type
> > > > > correctly?
> > > > >    Would you expect all devices called a 'SappireRapids' to have the same
> > > > > sizes?
> > > > > 
> > > > 
> > > >     There is only one palette in current design. This palette include 8
> > > >     tiles.  Those two CPUID leafs defined bytes_per_tile, total_tile_bytes,
> > > >     max_rows and etc, the AMX tool will configure those values into TILECFG with
> > > >     ldtilecfg instrcutions. Once tiles are configured, we can use
> > > >     tileload instruction to load data into those tiles.
> > > > 
> > > >     We did migration between two SappireRapids with amx self test tool
> > > >     (tools/testing/selftests/x86/amx.c)started in two sides, the migration
> > > >     work well.
> > > > 
> > > >     As for SappireRapids and more newer cpu types, those two CPUID leafs
> > > >     definitions are all same on AMX.
> > > 
> > > I'm not sure what definitions mean here. Are you saying the CPUID values of
> > > leaf 0x1D and 0x1E won't change for any future Intel Silicion?
> > > 
> > > Personally, I doubt it. And we shouldn't take such assumption unless Intel
> > > states it SDM.
> > 
> >   The current 0x1D and 0x1E definitions as below:
> > 
> >   /* CPUID Leaf 0x1D constants: */
> >   #define INTEL_AMX_TILE_MAX_SUBLEAF     0x1
> >   #define INTEL_AMX_TOTAL_TILE_BYTES     0x2000
> >   #define INTEL_AMX_BYTES_PER_TILE       0x400
> >   #define INTEL_AMX_BYTES_PER_ROW        0x40
> >   #define INTEL_AMX_TILE_MAX_NAMES       0x8
> >   #define INTEL_AMX_TILE_MAX_ROWS        0x10
> > 
> >   /* CPUID Leaf 0x1E constants: */
> >   #define INTEL_AMX_TMUL_MAX_K           0x10
> >   #define INTEL_AMX_TMUL_MAX_N           0x40
> > 
> >   These values are defined from SDM, and from the new developping CPU,
> >   these values are still same with SappireRapids. thanks!
> 
> But there's nothing stopping them increasing in future versions ?
>
  Okay, thanks! We will add these CPUID leafs in this cpu model.

  Yang
  
> Dave
> 
> >   Yang
> > > 
> > > > So, on AMX perspective, the migration
> > > >     should be workable on subsequent cpu types. thanks!
> > > 
> > > I think what Dave worried is that when migrating one VM created with
> > > "SapphireRapids" model on SPR machine to some newer platform in the future,
> > > where the newer platform reports different value on CPUID leaves 0x1D and
> > > 0x1E than SPR platform.
> > > 
> > > I think we need to contain CPUID leaves 0x1D and 0x1E into CPU model as
> > > well. Otherwise we will hit the same as Intel PT that SPR reports less
> > > capabilities that ICX.
> > > 
> > 
> -- 
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> 
> 

