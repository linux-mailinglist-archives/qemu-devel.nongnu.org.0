Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC2151408D
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 04:23:52 +0200 (CEST)
Received: from localhost ([::1]:44990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkGIR-0003hd-Ir
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 22:23:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nkGH5-00031T-Aw
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 22:22:27 -0400
Received: from mga09.intel.com ([134.134.136.24]:52032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nkGH2-0000pb-I9
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 22:22:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651198944; x=1682734944;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Iha0AcZuglCElnkBwRpsiHjV/h5pgyofnObuC26qy8o=;
 b=V/ZDeviMWQ/U2HEP7SH/7+Ol6wfcTUmvknQevsVa6EoKk6HcTVMtSd7/
 IHhXKIJS3Znb2qDlWkZoOKf0wHyHYADi+jNnE5xwRGGrgWVcb+c3jCKnz
 obcYpTyvskU9UFC6kHASAYljm07M41CRUJ36tEYPgo1R9iLjrdoYHgALB
 6x+x5ieQUlLH4A4EgoXwga+84mjpNDPeJt5YM17bqWahMRtsGH2DLphVU
 /53kK8ZogX0k0kD1tOZQI0cCM2X02aJI94vW9w7IqT+I8Mtj9Zveu23Th
 RunO8k8RjefsERsxzgYVuAxd9pxCArfVm5kaBPrMJ6Ejc+z1O5JCWTHT8 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10331"; a="266026746"
X-IronPort-AV: E=Sophos;i="5.91,296,1647327600"; d="scan'208";a="266026746"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2022 19:22:22 -0700
X-IronPort-AV: E=Sophos;i="5.91,296,1647327600"; d="scan'208";a="560038211"
Received: from yangzhon-virtual.bj.intel.com (HELO yangzhon-Virtual)
 ([10.238.145.56])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 28 Apr 2022 19:22:20 -0700
Date: Fri, 29 Apr 2022 10:05:57 +0800
From: Yang Zhong <yang.zhong@intel.com>
To: Jinpu Wang <jinpu.wang@ionos.com>
Subject: Re: RFC: sgx-epc is not listed in machine type help
Message-ID: <20220429020557.GA21670@yangzhon-Virtual>
References: <CAMGffEmEmWK99xDu=i2iq9WeTxdPwnG9-94UEqFnBSzmvv=TWQ@mail.gmail.com>
 <20220428114850.GA20626@yangzhon-Virtual>
 <CAMGffEmGjwAViuRa+ORMyO3+P7KhoOeuvNF3a3tju-WEMLdSrw@mail.gmail.com>
 <20220428121614.GB20626@yangzhon-Virtual>
 <CAMGffEkmoEFoY6opV8fxp4RqmBUPojG44F7AFBY63=Ab267W1g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMGffEkmoEFoY6opV8fxp4RqmBUPojG44F7AFBY63=Ab267W1g@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: pass client-ip=134.134.136.24; envelope-from=yang.zhong@intel.com;
 helo=mga09.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: yang.zhong@intel.com, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, Yu Zhang <yu.zhang@ionos.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 28, 2022 at 02:56:50PM +0200, Jinpu Wang wrote:
> On Thu, Apr 28, 2022 at 2:32 PM Yang Zhong <yang.zhong@intel.com> wrote:
> >
> > On Thu, Apr 28, 2022 at 02:18:54PM +0200, Jinpu Wang wrote:
> > > On Thu, Apr 28, 2022 at 2:05 PM Yang Zhong <yang.zhong@intel.com> wrote:
> > > >
> > > > On Thu, Apr 28, 2022 at 01:59:33PM +0200, Jinpu Wang wrote:
> > > > > Hi Yang, hi Paolo,
> > > > >
> > > > > We noticed sgx-epc machine type is not listed in the output of
> > > > > "qemu-system-x86_64 -M ?",
> > > snip
> > > > >
> > > > >
> > > > > I think this would cause confusion to users, is there a reason behind this?
> > > > >
> > > >
> > > >   No specific machine type for SGX, and SGX is only supported in Qemu PC and Q35 platform.
> > > Hi Yang,
> > >
> > > Thanks for your quick reply. Sorry for the stupid question.
> > > The information I've got from intel or the help sample from
> > > https://www.qemu.org/docs/master/system/i386/sgx.html, We need to
> > > specify commands something like this to run SGX-EPC guest:
> > > qemu-system-x86-64 -m 2G -nographic -enable-kvm -cpu
> > > host,+sgx-provisionkey  -object
> > > memory-backend-epc,id=mem1,size=512M,prealloc=on -M
> > > sgx-epc.0.memdev=mem1,sgx-epc.0.node=0 /tmp/volume-name.img
> > >
> > > Do you mean internally QEMU is converting -M sgx-epc to PC or Q35, can
> > > I choose which one to use?
> > >
> >
> >   Qemu will replace object with compound key, in that time, Paolo asked me
> >   to use "-M sgx-epc..." to replace "-object sgx-epc..." from Qemu command line.
> >
> >   So the "-M sgx-epc..." will get sgx-epc's parameters from hash key, and
> >   do not covert sgx-epc to PC or Q35.
> >
> >   SGX is only one Intel cpu feature, and no dedicated SGX Qemu machine type for SGX.
> >
> >   Another compound key example:
> >   "-M pc,smp.cpus=4,smp.cores=1,smp.threads=1"
> >
> >   Yang
> ah, ok. thx for the sharing.
> so if I specify "-M pc -M sgx-epc.." it will be the explicit way to
> choose PC machine type with sgx feature.
> and "-M q35 -M sgx-epc.." qemu will use Q35 machine type?

  The below command is okay,
  "-M pc,sgx-epc.." or "-M q35,sgx-epc.."

  Yang

> >
> >
> > > Thanks!
> > > Jinpu

