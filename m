Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D105B375421
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 14:52:17 +0200 (CEST)
Received: from localhost ([::1]:36792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ledUG-0002LI-EH
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 08:52:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1ledTE-0001vD-7r
 for qemu-devel@nongnu.org; Thu, 06 May 2021 08:51:12 -0400
Received: from mga18.intel.com ([134.134.136.126]:7631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1ledT8-0003C4-OK
 for qemu-devel@nongnu.org; Thu, 06 May 2021 08:51:11 -0400
IronPort-SDR: 2SBF9oIb5XIegf7OWgM2Hk5G8WRIQC+uajYM4z/9FgNc5RrcmWkW4pAfxA0sck/0mZzpmvaiVc
 4Z9vAWSjxtUg==
X-IronPort-AV: E=McAfee;i="6200,9189,9975"; a="185924113"
X-IronPort-AV: E=Sophos;i="5.82,277,1613462400"; d="scan'208";a="185924113"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 05:50:50 -0700
IronPort-SDR: 01tRQHzNNQVNUhkhdKzVy3rvIW45g+cLbbxbV5WN9hH/4rQNVNkpFqh7tljvuqLW1K4vvgzD6c
 y5CcQ3fZdOGQ==
X-IronPort-AV: E=Sophos;i="5.82,277,1613462400"; d="scan'208";a="434335338"
Received: from yangzhon-virtual.bj.intel.com (HELO yangzhon-Virtual)
 ([10.238.144.101])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 06 May 2021 05:50:48 -0700
Date: Thu, 6 May 2021 20:38:19 +0800
From: Yang Zhong <yang.zhong@intel.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [RESEND PATCH 03/32] qom: Add memory-backend-epc ObjectOptions
 support
Message-ID: <20210506123819.GE21621@yangzhon-Virtual>
References: <20210430062455.8117-1-yang.zhong@intel.com>
 <20210430062455.8117-4-yang.zhong@intel.com>
 <0ebd92e8-c43c-9a7b-07a2-3ad7afeab436@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0ebd92e8-c43c-9a7b-07a2-3ad7afeab436@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=yang.zhong@intel.com; helo=mga18.intel.com
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

On Mon, May 03, 2021 at 12:56:55PM -0500, Eric Blake wrote:
> On 4/30/21 1:24 AM, Yang Zhong wrote:
> > Add the new 'memory-backend-epc' user creatable QOM object in
> > the ObjectOptions to support SGX, or the sgx backend object
> > cannot bootup.
> > 
> > Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> > ---
> >  qapi/qom.json | 2 ++
> >  1 file changed, 2 insertions(+)
> 
> Missing documentation, including a 'since 6.1' blurb, for the new addition.
> 

  Eric, thanks for your comments! i will add new MemoryBackendEpcProperties
  properties and documents for sgx epc. thanks!

  Yang

> > 
> > diff --git a/qapi/qom.json b/qapi/qom.json
> > index cd0e76d564..fd6fbee597 100644
> > --- a/qapi/qom.json
> > +++ b/qapi/qom.json
> > @@ -767,6 +767,7 @@
> >      { 'name': 'memory-backend-memfd',
> >        'if': 'defined(CONFIG_LINUX)' },
> >      'memory-backend-ram',
> > +    'memory-backend-epc',
> >      'pef-guest',
> >      'pr-manager-helper',
> >      'rng-builtin',
> > @@ -824,6 +825,7 @@
> >        'memory-backend-memfd':       { 'type': 'MemoryBackendMemfdProperties',
> >                                        'if': 'defined(CONFIG_LINUX)' },
> >        'memory-backend-ram':         'MemoryBackendProperties',
> > +      'memory-backend-epc':         'MemoryBackendProperties',
> >        'pr-manager-helper':          'PrManagerHelperProperties',
> >        'rng-builtin':                'RngProperties',
> >        'rng-egd':                    'RngEgdProperties',
> > 
> 
> -- 
> Eric Blake, Principal Software Engineer
> Red Hat, Inc.           +1-919-301-3226
> Virtualization:  qemu.org | libvirt.org

