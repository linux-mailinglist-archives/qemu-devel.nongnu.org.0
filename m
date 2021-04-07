Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FBE357132
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 17:57:45 +0200 (CEST)
Received: from localhost ([::1]:60618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUAYq-0000dI-Ck
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 11:57:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <reinoud@gorilla.13thmonkey.org>)
 id 1lUARp-0007OU-7l
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 11:50:30 -0400
Received: from 13thmonkey.org ([80.100.255.32]:65437
 helo=gorilla.13thmonkey.org) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <reinoud@gorilla.13thmonkey.org>) id 1lUARm-0005Uw-DB
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 11:50:27 -0400
Received: by gorilla.13thmonkey.org (Postfix, from userid 103)
 id 2AEEC2FF078C; Wed,  7 Apr 2021 15:50:20 +0000 (UTC)
Date: Wed, 7 Apr 2021 15:50:20 +0000
From: Reinoud Zandijk <reinoud@NetBSD.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v7 2/4] Add NVMM accelerator: x86 CPU support
Message-ID: <YG3UvN1vRzh1fdDT@gorilla.13thmonkey.org>
References: <20210402202535.11550-1-reinoud@NetBSD.org>
 <20210402202535.11550-3-reinoud@NetBSD.org>
 <604abe90-5eda-bbbd-fd5a-5fb9c5c4cf9e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <604abe90-5eda-bbbd-fd5a-5fb9c5c4cf9e@linaro.org>
Received-SPF: none client-ip=80.100.255.32;
 envelope-from=reinoud@gorilla.13thmonkey.org; helo=gorilla.13thmonkey.org
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Kamil Rytarowski <kamil@NetBSD.org>, Reinoud Zandijk <reinoud@NetBSD.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Ryo ONODERA <ryoon@netbsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 02, 2021 at 02:51:41PM -0700, Richard Henderson wrote:
> On 4/2/21 1:25 PM, Reinoud Zandijk wrote:
> > +i386_softmmu_ss.add(when: 'CONFIG_NVMM', if_true:
> > +  declare_dependency(link_args: ['-lnvmm'])
> > +)
> 
> You shouldn't be playing with link flags directly.
> 
> In patch 1, you found the nvmm library, and assigned it to the variable
> 'nvmm'.  You should just add the library as a dependency and let meson
> figure out what to do.
> 
> So I think this should just be
> 
> i386_softmmu_ss.add(when: 'CONFIG_NVMM', if_true: nvmm)

Thanks for the patch :) I will incorporate it!

Reinoud


