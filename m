Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF8548A5DB
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 03:49:55 +0100 (CET)
Received: from localhost ([::1]:57408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n77EQ-00009n-9h
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 21:49:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1n77CE-0006UO-Hu
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 21:47:39 -0500
Received: from mga06.intel.com ([134.134.136.31]:32186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1n77C6-0003WB-Rd
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 21:47:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641869250; x=1673405250;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=SEoeUZ4pmX3niOq77N4qawvGaQz6PTVTOr+bcINN9Oo=;
 b=PsIFZgQnvWE3I9aGb2Ebhbd3k0pY79mMxWpFYBgt9V5riTSIDFLa64vH
 VoBbRNSVKn9dUlPZ2RCXJPlIeiFF+pn5y36yq8NFUn67eGMPeYbfugUez
 3UWsS94XQJFCCxBOV3O/jfYwOzB63DOrCqPCfy6bWbqD6THTNr3weB1hB
 klphAKqyo/8RFLPHQ9JAKrirXh/XLJEBHgUS06wThw7OoDp/N5dY0QVgh
 F9PHiFxKTLBrZ29iRBwOfaT5IsQMcg77njLcw+HN0Y7fWkho7OaCOB1yQ
 FMU5s2Sk4SNNhlYVjVBJaQDrQOG0Zb8bJItFJjS/i4AqXm0B08fH/0nPL w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10223"; a="304124701"
X-IronPort-AV: E=Sophos;i="5.88,278,1635231600"; d="scan'208";a="304124701"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2022 18:47:28 -0800
X-IronPort-AV: E=Sophos;i="5.88,278,1635231600"; d="scan'208";a="514917192"
Received: from yangzhon-virtual.bj.intel.com (HELO yangzhon-Virtual)
 ([10.238.145.56])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 10 Jan 2022 18:47:19 -0800
Date: Tue, 11 Jan 2022 10:32:06 +0800
From: Yang Zhong <yang.zhong@intel.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [RFC PATCH 2/7] x86: Add AMX XTILECFG and XTILEDATA components
Message-ID: <20220111023206.GB10706@yangzhon-Virtual>
References: <20220107093134.136441-1-yang.zhong@intel.com>
 <20220107093134.136441-3-yang.zhong@intel.com>
 <BN9PR11MB5276EA0D1E39DDA511B0A9B38C509@BN9PR11MB5276.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN9PR11MB5276EA0D1E39DDA511B0A9B38C509@BN9PR11MB5276.namprd11.prod.outlook.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: pass client-ip=134.134.136.31; envelope-from=yang.zhong@intel.com;
 helo=mga06.intel.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: yang.zhong@intel.com, "Christopherson, , Sean" <seanjc@google.com>,
 "jing2.liu@linux.intel.com" <jing2.liu@linux.intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Wang,
 Wei W" <wei.w.wang@intel.com>, "Zeng, Guang" <guang.zeng@intel.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 10, 2022 at 04:23:47PM +0800, Tian, Kevin wrote:
> > From: Zhong, Yang <yang.zhong@intel.com>
> > Sent: Friday, January 7, 2022 5:31 PM
> >
> > From: Jing Liu <jing2.liu@intel.com>
> >
> > AMX XTILECFG and XTILEDATA are managed by XSAVE feature
> > set. State component 17 is used for 64-byte TILECFG register
> > (XTILECFG state) and component 18 is used for 8192 bytes
> > of tile data (XTILEDATA state).
> 
> to be consistent, "tile data" -> "TILEDATA"
> 
> >
> > Add AMX feature bits to x86_ext_save_areas array to set
> > up AMX components. Add structs that define the layout of
> > AMX XSAVE areas and use QEMU_BUILD_BUG_ON to validate the
> > structs sizes.
> >
> > Signed-off-by: Jing Liu <jing2.liu@intel.com>
> > Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> > ---
> >  target/i386/cpu.h | 16 +++++++++++++++-
> >  target/i386/cpu.c |  8 ++++++++
> >  2 files changed, 23 insertions(+), 1 deletion(-)
> >
> > diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> > index 7f9700544f..768a8218be 100644
> > --- a/target/i386/cpu.h
> > +++ b/target/i386/cpu.h
> > @@ -537,6 +537,8 @@ typedef enum X86Seg {
> >  #define XSTATE_ZMM_Hi256_BIT            6
> >  #define XSTATE_Hi16_ZMM_BIT             7
> >  #define XSTATE_PKRU_BIT                 9
> > +#define XSTATE_XTILE_CFG_BIT            17
> > +#define XSTATE_XTILE_DATA_BIT           18
> >
> >  #define XSTATE_FP_MASK                  (1ULL << XSTATE_FP_BIT)
> >  #define XSTATE_SSE_MASK                 (1ULL << XSTATE_SSE_BIT)
> > @@ -1343,6 +1345,16 @@ typedef struct XSavePKRU {
> >      uint32_t padding;
> >  } XSavePKRU;
> >
> > +/* Ext. save area 17: AMX XTILECFG state */
> > +typedef struct XSaveXTILE_CFG {
> 
> remove "_"?
> 
> > +    uint8_t xtilecfg[64];
> > +} XSaveXTILE_CFG;
> > +
> > +/* Ext. save area 18: AMX XTILEDATA state */
> > +typedef struct XSaveXTILE_DATA {
> 
> ditto
>

  Thanks Kevin, I will update this in new version.

  Yang 

