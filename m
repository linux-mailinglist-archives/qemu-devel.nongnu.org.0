Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E1254C2C2
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 09:41:05 +0200 (CEST)
Received: from localhost ([::1]:55886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1NeB-0002rP-Hg
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 03:41:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1o1NXA-0001Cz-OY
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 03:33:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1o1NX6-0006vr-83
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 03:33:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655278422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EfffyBQuCF73+tOSSACwFgokINlimio3BcUzQvMAzRg=;
 b=h98jcIUxOuw3MrNo/iH0kD24T6Ca6Xwfn+7qzV5xZheQ97l/kTGYyul3JLGy+6piC3erJ3
 ZivujlRKFLJvmQFeTWzJfdwN1y+9S+Kwwji0W4pVqlzWrrnFY3XvgOzMmd59A8Vi6KUnQ4
 0ykVKu0BuQsVn2N4e/MlmGAPwcH/JCs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-60-r6ZlunrNNRe5GTRSgSZr7g-1; Wed, 15 Jun 2022 03:33:40 -0400
X-MC-Unique: r6ZlunrNNRe5GTRSgSZr7g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8E2DF29AB3E2;
 Wed, 15 Jun 2022 07:33:39 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 56EB3402494D;
 Wed, 15 Jun 2022 07:33:39 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E36ED1800081; Wed, 15 Jun 2022 09:33:37 +0200 (CEST)
Date: Wed, 15 Jun 2022 09:33:37 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Xu, Min M" <min.m.xu@intel.com>
Cc: Dionna Amalie Glaze <dionnaglaze@google.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "Lendacky, Thomas" <Thomas.Lendacky@amd.com>,
 "Yao, Jiewen" <jiewen.yao@intel.com>, "Li, Xiaoyao" <xiaoyao.li@intel.com>,
 "Aktas, Erdem" <erdemaktas@google.com>,
 "Yamahata, Isaku" <isaku.yamahata@intel.com>
Subject: Re: New "IndustryStandard" fw_cfg?
Message-ID: <20220615073337.jq654i7ba33xttwh@sirius.home.kraxel.org>
References: <CAAH4kHYyXv3x+89Ybnj7GXms2Bz2CNn5JK0+d6DzVtMz5owTrw@mail.gmail.com>
 <PH0PR11MB50643B5AEE5A399EB8AFB000C5AD9@PH0PR11MB5064.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PH0PR11MB50643B5AEE5A399EB8AFB000C5AD9@PH0PR11MB5064.namprd11.prod.outlook.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> > There's a new UEFI feature in v2.9 of the specification (March 2021) that
> > allows for memory ranges to be classified as "unaccepted", since both TDX
> > and SEV-SNP require that the guest VM accept any host-made changes to
> > page state. We should expect newer technologies on non-x86 architectures
> > to require memory acceptance as well. Operating systems are not
> > necessarily going to support this memory type, however.

> > For Qemu, the main code I see for adding config is here, but I'm not sure
> > what y'all's preferred external configuration method is to get a value from an

Ideally no external configuration, although I suspect we need something
at least temporarily.

IMHO the long-term goal should be to make this fully automatic, by
having efi apps (which includes the linux kernel's efi stub) and
firmware negotiate this.  Problem is this most likely requires changing
the uefi specs, which will take a while.

One possible way I see is extending efi boot services with a
GetMemoryMapEx() call, with an additional flags parameter where the
caller can specify that it can handle unaccepted memory with a flag
bit.  When the guest does not set the flag (or uses the old GetMemoryMap
call) the firmware must accept all memory and return a memory map
without unaccepted memory.

> > 2. A "well-known" file path to be included in the file slots starting at 0x0020,
> > such as "etc/min_accepted_mem_size", still plumbed through like in 1.

New options should use a file path.

See also docs/specs/fw_cfg.txt in qemu source tree.

take care,
  Gerd


