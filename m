Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B4C5E9B37
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 09:50:32 +0200 (CEST)
Received: from localhost ([::1]:53000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocisp-0001hQ-0R
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 03:50:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@linux.intel.com>)
 id 1ocinS-0006zU-KR
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 03:44:59 -0400
Received: from mga04.intel.com ([192.55.52.120]:27635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@linux.intel.com>)
 id 1ocinP-0000AZ-Oq
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 03:44:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664178295; x=1695714295;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=OXrQ1s25mxjuSiHq5XrGHAGUgXt/l+/qrDgZMNBAKiU=;
 b=mVYx320JFKtQCK+0Mek/5DntQDfWdOumjkoFveGfR9yR+zhbyn+rHAUE
 7DVRgW2P5xbtIem14+HYdGtEvSk89wNPpA5chQIFJgyOD67OiKB70kyCz
 nyMpi8m4lBXEJS+P/HmpkhC+uOrd4j3TkGrribNXusyJqIc6MtBYLmRaE
 XgT78+1Y4J/bwcylHy3Tlmd7MeYiqYuFLp1+AkmNPll0AQoKGjXPiiOCQ
 HIp40QfsMknPKcvVtrz7tSscD1n+vzyrs1HCFGgoZs4EvwfwQeXwc3uEv
 +5IpZP8K6HPp6TuSJdDEa3ctjggS+jybgnKMOVrnfpEhMRWT+796ILeag A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10481"; a="299689430"
X-IronPort-AV: E=Sophos;i="5.93,345,1654585200"; d="scan'208";a="299689430"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2022 00:44:52 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10481"; a="572115814"
X-IronPort-AV: E=Sophos;i="5.93,345,1654585200"; d="scan'208";a="572115814"
Received: from yangzhon.bj.intel.com (HELO yangzhon) ([10.238.157.60])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2022 00:44:49 -0700
Date: Mon, 26 Sep 2022 03:42:11 -0400
From: Yang Zhong <yang.zhong@linux.intel.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Wang, Lei" <lei4.wang@intel.com>, paul.c.lai@intel.com,
 pbonzini@redhat.com, qemu-devel@nongnu.org, robert.hu@intel.com,
 chenyi.qiang@intel.com, yang.zhong@linux.intel.com
Subject: Re: [PATCH] i386: Add new CPU model SapphireRapids
Message-ID: <YzFX04164F6KfZdY@yangzhon>
References: <20220812055751.14553-1-lei4.wang@intel.com>
 <Yysk/taT/eKR0Bp3@work-vm> <Yy21A2CWzrS3SIzH@yangzhon>
 <b1f238c6-ab3d-eb8f-d1b4-dbdf342c002c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b1f238c6-ab3d-eb8f-d1b4-dbdf342c002c@intel.com>
Received-SPF: none client-ip=192.55.52.120;
 envelope-from=yang.zhong@linux.intel.com; helo=mga04.intel.com
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

On Sat, Sep 24, 2022 at 12:01:16AM +0800, Xiaoyao Li wrote:
> On 9/23/2022 9:30 PM, Yang Zhong wrote:
> > On Wed, Sep 21, 2022 at 03:51:42PM +0100, Dr. David Alan Gilbert wrote:
> > > * Wang, Lei (lei4.wang@intel.com) wrote:
> > > > The new CPU model mostly inherits features from Icelake-Server, while
> > > > adding new features:
> > > >   - AMX (Advance Matrix eXtensions)
> > > >   - Bus Lock Debug Exception
> > > > and new instructions:
> > > >   - AVX VNNI (Vector Neural Network Instruction):
> > > >      - VPDPBUS: Multiply and Add Unsigned and Signed Bytes
> > > >      - VPDPBUSDS: Multiply and Add Unsigned and Signed Bytes with Saturation
> > > >      - VPDPWSSD: Multiply and Add Signed Word Integers
> > > >      - VPDPWSSDS: Multiply and Add Signed Integers with Saturation
> > > >   - FP16: Replicates existing AVX512 computational SP (FP32) instructions
> > > >     using FP16 instead of FP32 for ~2X performance gain
> > > >   - SERIALIZE: Provide software with a simple way to force the processor to
> > > >     complete all modifications, faster, allowed in all privilege levels and
> > > >     not causing an unconditional VM exit
> > > >   - TSX Suspend Load Address Tracking: Allows programmers to choose which
> > > >     memory accesses do not need to be tracked in the TSX read set
> > > >   - AVX512_BF16: Vector Neural Network Instructions supporting BFLOAT16
> > > >     inputs and conversion instructions from IEEE single precision
> > > > 
> > > > Features may be added in future versions:
> > > >   - CET (virtualization support hasn't been merged)
> > > > Instructions may be added in future versions:
> > > >   - fast zero-length MOVSB (KVM doesn't support yet)
> > > >   - fast short STOSB (KVM doesn't support yet)
> > > >   - fast short CMPSB, SCASB (KVM doesn't support yet)
> > > > 
> > > > Signed-off-by: Wang, Lei <lei4.wang@intel.com>
> > > > Reviewed-by: Robert Hoo <robert.hu@linux.intel.com>
> > > 
> > > Hi,
> > >     What fills in the AMX tile and tmul information leafs
> > > (0x1D, 0x1E)?
> > >    In particular, how would we make sure when we migrate between two
> > > generations of AMX/Tile/Tmul capable devices with different
> > > register/palette/tmul limits that the migration is tied to the CPU type
> > > correctly?
> > >    Would you expect all devices called a 'SappireRapids' to have the same
> > > sizes?
> > > 
> > 
> >     There is only one palette in current design. This palette include 8
> >     tiles.  Those two CPUID leafs defined bytes_per_tile, total_tile_bytes,
> >     max_rows and etc, the AMX tool will configure those values into TILECFG with
> >     ldtilecfg instrcutions. Once tiles are configured, we can use
> >     tileload instruction to load data into those tiles.
> > 
> >     We did migration between two SappireRapids with amx self test tool
> >     (tools/testing/selftests/x86/amx.c)started in two sides, the migration
> >     work well.
> > 
> >     As for SappireRapids and more newer cpu types, those two CPUID leafs
> >     definitions are all same on AMX.
> 
> I'm not sure what definitions mean here. Are you saying the CPUID values of
> leaf 0x1D and 0x1E won't change for any future Intel Silicion?
> 
> Personally, I doubt it. And we shouldn't take such assumption unless Intel
> states it SDM.

  The current 0x1D and 0x1E definitions as below:

  /* CPUID Leaf 0x1D constants: */
  #define INTEL_AMX_TILE_MAX_SUBLEAF     0x1
  #define INTEL_AMX_TOTAL_TILE_BYTES     0x2000
  #define INTEL_AMX_BYTES_PER_TILE       0x400
  #define INTEL_AMX_BYTES_PER_ROW        0x40
  #define INTEL_AMX_TILE_MAX_NAMES       0x8
  #define INTEL_AMX_TILE_MAX_ROWS        0x10

  /* CPUID Leaf 0x1E constants: */
  #define INTEL_AMX_TMUL_MAX_K           0x10
  #define INTEL_AMX_TMUL_MAX_N           0x40

  These values are defined from SDM, and from the new developping CPU,
  these values are still same with SappireRapids. thanks!

  Yang
> 
> > So, on AMX perspective, the migration
> >     should be workable on subsequent cpu types. thanks!
> 
> I think what Dave worried is that when migrating one VM created with
> "SapphireRapids" model on SPR machine to some newer platform in the future,
> where the newer platform reports different value on CPUID leaves 0x1D and
> 0x1E than SPR platform.
> 
> I think we need to contain CPUID leaves 0x1D and 0x1E into CPU model as
> well. Otherwise we will hit the same as Intel PT that SPR reports less
> capabilities that ICX.
> 

