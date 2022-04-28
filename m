Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D36DA5133CB
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 14:34:26 +0200 (CEST)
Received: from localhost ([::1]:42218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk3Ll-0002dI-Dg
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 08:34:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nk3KB-0000xX-Q6
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 08:32:48 -0400
Received: from mga12.intel.com ([192.55.52.136]:23566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nk3K9-0006Hy-7c
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 08:32:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651149165; x=1682685165;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=BWLq+OGNIto2IHhWqUv/JahR/YgPkmpbcagCbZtwifs=;
 b=YYZ61tosnPQ6ViSTtbO1D8b7NLLakfBL6yw7ZqG00+GJlX+Uq9DUYlYR
 wVkiplIjSrs3JyEMSiIgE21s6Swky09uB9PPfrStkmyAwBU88p5tJqIbd
 nUcqiriteupCK2fKogAH9DIWH6LlE1LyfpTmgYKEJ8bedXNs8BQEsqGIz
 +lYcDyMY2WLei2kcykxDAaZS0IZCKmvKnd1Fe03vgss8++Yi5AzL0288c
 E+hyjAs17BtdaTK3h6dj1WL6z8doxqR1dGBNJkmVj1OBBmw+hD8RE/OrT
 zYtUdw5KbDYuWiYdf2vv4NLut0XlyYlTcQn4GlRoCHNsHhwcq/rAuGLHZ A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10330"; a="246192005"
X-IronPort-AV: E=Sophos;i="5.91,295,1647327600"; d="scan'208";a="246192005"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2022 05:32:39 -0700
X-IronPort-AV: E=Sophos;i="5.91,295,1647327600"; d="scan'208";a="581330811"
Received: from yangzhon-virtual.bj.intel.com (HELO yangzhon-Virtual)
 ([10.238.145.56])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 28 Apr 2022 05:32:37 -0700
Date: Thu, 28 Apr 2022 20:16:14 +0800
From: Yang Zhong <yang.zhong@intel.com>
To: Jinpu Wang <jinpu.wang@ionos.com>
Subject: Re: RFC: sgx-epc is not listed in machine type help
Message-ID: <20220428121614.GB20626@yangzhon-Virtual>
References: <CAMGffEmEmWK99xDu=i2iq9WeTxdPwnG9-94UEqFnBSzmvv=TWQ@mail.gmail.com>
 <20220428114850.GA20626@yangzhon-Virtual>
 <CAMGffEmGjwAViuRa+ORMyO3+P7KhoOeuvNF3a3tju-WEMLdSrw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMGffEmGjwAViuRa+ORMyO3+P7KhoOeuvNF3a3tju-WEMLdSrw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: pass client-ip=192.55.52.136; envelope-from=yang.zhong@intel.com;
 helo=mga12.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

On Thu, Apr 28, 2022 at 02:18:54PM +0200, Jinpu Wang wrote:
> On Thu, Apr 28, 2022 at 2:05 PM Yang Zhong <yang.zhong@intel.com> wrote:
> >
> > On Thu, Apr 28, 2022 at 01:59:33PM +0200, Jinpu Wang wrote:
> > > Hi Yang, hi Paolo,
> > >
> > > We noticed sgx-epc machine type is not listed in the output of
> > > "qemu-system-x86_64 -M ?",
> snip
> > >
> > >
> > > I think this would cause confusion to users, is there a reason behind this?
> > >
> >
> >   No specific machine type for SGX, and SGX is only supported in Qemu PC and Q35 platform.
> Hi Yang,
> 
> Thanks for your quick reply. Sorry for the stupid question.
> The information I've got from intel or the help sample from
> https://www.qemu.org/docs/master/system/i386/sgx.html, We need to
> specify commands something like this to run SGX-EPC guest:
> qemu-system-x86-64 -m 2G -nographic -enable-kvm -cpu
> host,+sgx-provisionkey  -object
> memory-backend-epc,id=mem1,size=512M,prealloc=on -M
> sgx-epc.0.memdev=mem1,sgx-epc.0.node=0 /tmp/volume-name.img
> 
> Do you mean internally QEMU is converting -M sgx-epc to PC or Q35, can
> I choose which one to use?
>

  Qemu will replace object with compound key, in that time, Paolo asked me
  to use "-M sgx-epc..." to replace "-object sgx-epc..." from Qemu command line.
  
  So the "-M sgx-epc..." will get sgx-epc's parameters from hash key, and
  do not covert sgx-epc to PC or Q35.

  SGX is only one Intel cpu feature, and no dedicated SGX Qemu machine type for SGX. 
  
  Another compound key example:
  "-M pc,smp.cpus=4,smp.cores=1,smp.threads=1"
 
  Yang

 
> Thanks!
> Jinpu

