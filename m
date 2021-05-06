Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87716375170
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 11:23:09 +0200 (CEST)
Received: from localhost ([::1]:52864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leaDs-0007PZ-Gi
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 05:23:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1lea14-0006S9-E0
 for qemu-devel@nongnu.org; Thu, 06 May 2021 05:09:55 -0400
Received: from mga06.intel.com ([134.134.136.31]:24191)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1lea12-0004bI-0A
 for qemu-devel@nongnu.org; Thu, 06 May 2021 05:09:54 -0400
IronPort-SDR: tYq4zA0OFP4qLDABjw5y9oya3J/rP3rAVlIjr77BP+Rktv2Xxio1NTjnFjwmACISwG9UyaTiXc
 Ghi6VeQprnJg==
X-IronPort-AV: E=McAfee;i="6200,9189,9975"; a="259701541"
X-IronPort-AV: E=Sophos;i="5.82,277,1613462400"; d="scan'208";a="259701541"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 02:09:49 -0700
IronPort-SDR: N8Jplj/JVC7rYzuYBK+iqXRgje+29RMrvLDMsV1FoXyElf+6dMx5aP7aWOwJggXDkY1OKEmk6U
 GIMTmMtsEOoA==
X-IronPort-AV: E=Sophos;i="5.82,277,1613462400"; d="scan'208";a="434256706"
Received: from yangzhon-virtual.bj.intel.com (HELO yangzhon-Virtual)
 ([10.238.144.101])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 06 May 2021 02:09:47 -0700
Date: Thu, 6 May 2021 16:57:18 +0800
From: Yang Zhong <yang.zhong@intel.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [RESEND PATCH 29/32] qmp: Add the qmp_query_sgx_capabilities()
Message-ID: <20210506085718.GC21621@yangzhon-Virtual>
References: <20210430062455.8117-1-yang.zhong@intel.com>
 <20210430062455.8117-30-yang.zhong@intel.com>
 <7a3a9cde-a213-91f1-b5b1-522e45dbc4df@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7a3a9cde-a213-91f1-b5b1-522e45dbc4df@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: pass client-ip=134.134.136.31; envelope-from=yang.zhong@intel.com;
 helo=mga06.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: yang.zhong@intel.com, pbonzini@redhat.com, kai.huang@intel.com,
 qemu-devel@nongnu.org, seanjc@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 03, 2021 at 01:00:37PM -0500, Eric Blake wrote:
> On 4/30/21 1:24 AM, Yang Zhong wrote:
> > The libvirt can use qmp_query_sgx_capabilities() to get the host
> 
> s/The libvirt/Libvirt/
> 
> > sgx capabilitis.
> > 
> 
> capabilities
> 
  Eric, thanks for your comments! I will change those mistakes, thanks!

  Yang
  
> > Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> > ---
> >  hw/i386/sgx-epc.c          | 66 ++++++++++++++++++++++++++++++++++++++
> >  include/hw/i386/pc.h       |  1 +
> >  monitor/qmp-cmds.c         |  5 +++
> >  qapi/misc.json             | 19 +++++++++++
> >  stubs/sgx-stub.c           |  5 +++
> >  tests/qtest/qmp-cmd-test.c |  1 +
> >  6 files changed, 97 insertions(+)
> > 
> 
> > +++ b/qapi/misc.json
> > @@ -561,3 +561,22 @@
> >  #
> >  ##
> >  { 'command': 'query-sgx', 'returns': 'SGXInfo' }
> > +
> > +
> > +##
> > +# @query-sgx-capabilities:
> > +#
> > +# Returns information from host SGX capabilities
> > +#
> > +# Returns: @SGXInfo
> > +#
> > +# Since: 5.1
> 
> 6.1
> 

  Ditto, thanks!

  Yang


> > +#
> > +# Example:
> > +#
> > +# -> { "execute": "query-sgx-capabilities" }
> > +# <- { "return": { "sgx": true, "sgx1" : true, "sgx2" : true,
> > +#                  "flc": true, "section-size" : 0 } }
> > +#
> > +##
> > +{ 'command': 'query-sgx-capabilities', 'returns': 'SGXInfo' }
> > diff --git a/stubs/sgx-stub.c b/stubs/sgx-stub.c
> > index c2b59a88fd..1dedf3f3db 100644
> > --- a/stubs/sgx-stub.c
> -- 
> Eric Blake, Principal Software Engineer
> Red Hat, Inc.           +1-919-301-3226
> Virtualization:  qemu.org | libvirt.org

