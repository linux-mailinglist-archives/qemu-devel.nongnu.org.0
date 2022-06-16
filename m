Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF3754DA2D
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 08:07:20 +0200 (CEST)
Received: from localhost ([::1]:48670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1if1-0004DZ-GM
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 02:07:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1o1iYm-0002PF-Vd
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 02:00:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1o1iYj-00031u-3l
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 02:00:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655359247;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lkMqucxKqUCU3borGPA3l4F5U7p+L2MQUVCIuHEVp1w=;
 b=eNcjzv5UCisr/i4QIP+qbLvZnt4dMBr+aEtaM191MnzLGpFZFbDKEHZEYAhHop8qbSeWWO
 hCpCOHyq2299ksTJqzigXEn+qFmDKMOWwfk+WC3FZaLK8HIQDpJyizjdy5MnhJCuR0GX7Q
 psXMvRejkbQbSL5kcqYfr3hAjKr2R/4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-170-vm77MF45NuefCbeaiZNinQ-1; Thu, 16 Jun 2022 02:00:43 -0400
X-MC-Unique: vm77MF45NuefCbeaiZNinQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BA9E7101A58F;
 Thu, 16 Jun 2022 06:00:42 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 834F84047768;
 Thu, 16 Jun 2022 06:00:42 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 4E9D31800381; Thu, 16 Jun 2022 08:00:41 +0200 (CEST)
Date: Thu, 16 Jun 2022 08:00:41 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: "Xu, Min M" <min.m.xu@intel.com>,
 Dionna Amalie Glaze <dionnaglaze@google.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "Lendacky, Thomas" <Thomas.Lendacky@amd.com>,
 "Yao, Jiewen" <jiewen.yao@intel.com>,
 "Aktas, Erdem" <erdemaktas@google.com>,
 "Yamahata, Isaku" <isaku.yamahata@intel.com>
Subject: Re: New "IndustryStandard" fw_cfg?
Message-ID: <20220616060041.ej45qzw4sb3xuokt@sirius.home.kraxel.org>
References: <CAAH4kHYyXv3x+89Ybnj7GXms2Bz2CNn5JK0+d6DzVtMz5owTrw@mail.gmail.com>
 <PH0PR11MB50643B5AEE5A399EB8AFB000C5AD9@PH0PR11MB5064.namprd11.prod.outlook.com>
 <843cb055-d28e-1753-5dd5-9d4565171084@intel.com>
 <20220616053741.strgwe3mx3adxzui@sirius.home.kraxel.org>
 <6c2f350c-61eb-825d-36b7-86c913e610b3@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6c2f350c-61eb-825d-36b7-86c913e610b3@intel.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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

On Thu, Jun 16, 2022 at 01:49:11PM +0800, Xiaoyao Li wrote:
> On 6/16/2022 1:37 PM, Gerd Hoffmann wrote:
> >    Hi,
> > 
> > > Per my understanding, Unaccepted Memory in UEFI is introduced for
> > > confidential VMs, i.e., for Intel TDX and AMD SEV-SNP. The only reason
> > > UEFI/OVMF reports "Unaccepted Memory" to OS, is a confidential VM is
> > > desired.
> > 
> > No.  Reporting "Unaccepted Memory" to the OS is not a hard requirement
> > for confidential VMs, it only optimizes boot times.  Instead of doing
> > that time-consuming process in the firmware for all memory we tell the
> > guest OS which memory is accepted already and which is not.  So the
> > guest OS can go accept the remaining memory in a background process.
> 
> But for non-confidential VMs, even a range of memory is reported as
> unaccepted nothing prevents it from being accessed without accepting it, and
> it's not time-consuming. Did I miss anything?

The concept of "Unaccepted Memory" only exists for confidential VM.

That doesn't imply the guest OS must be able to handle unaccepted
memory though because it is possible to simply accept all memory
in the firmware.  Which in fact is the common case today.

take care,
  Gerd


