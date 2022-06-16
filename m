Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E36DE54DCF7
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 10:34:29 +0200 (CEST)
Received: from localhost ([::1]:50114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1kxP-0001Ny-JV
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 04:34:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1o1ks4-0007v3-5G
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 04:28:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1o1ks2-0002Bb-MS
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 04:28:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655368134;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HpYFCRACnGiZr+qCzGraykDrM11xTwxcJ1Dcs9ztGqs=;
 b=dBwNMKF3gdJ5zpIORfHEmRDWsDyGhjkeJ55Hv6P0Zvi7LDIfyEeRhf4+DEdgjZ+nL7qPCL
 d3PfMiT4a8n79U2gigu7eI7m9IBuhl//9lbMNaBQk91q4mbHGu3+HCENfYq7DFNHPCb6Q3
 JQvsJRjnrhBG1uO4zIYIQlT/fwP61Wg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-322-A7oNe8I-MoKdi0ghgmJLcg-1; Thu, 16 Jun 2022 04:28:48 -0400
X-MC-Unique: A7oNe8I-MoKdi0ghgmJLcg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A9D7B85A581;
 Thu, 16 Jun 2022 08:28:47 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C3872166B29;
 Thu, 16 Jun 2022 08:28:47 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 17B681800381; Thu, 16 Jun 2022 10:28:46 +0200 (CEST)
Date: Thu, 16 Jun 2022 10:28:46 +0200
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
Message-ID: <20220616082846.wtmf3wbxzilzvqt4@sirius.home.kraxel.org>
References: <CAAH4kHYyXv3x+89Ybnj7GXms2Bz2CNn5JK0+d6DzVtMz5owTrw@mail.gmail.com>
 <PH0PR11MB50643B5AEE5A399EB8AFB000C5AD9@PH0PR11MB5064.namprd11.prod.outlook.com>
 <a89cb720-3600-51ad-2671-ea0f987cd3d1@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a89cb720-3600-51ad-2671-ea0f987cd3d1@intel.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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

> After re-read and re-think, I think the problem is better to state as: we
> need an interface for QEMU to tell OVMF how much memory it needs to accept,
> from [Minimum to All]. So for the case that user wants to boot an
> partial-enabled confidential VMs (like current Linux TDX and SNP guest),
> user needs to specify from QEMU to tell OVMF to accept all the memory.

Asking the user to manually configure stuff sucks, that's why I think
it makes sense to let firmware and guest negotiate this automatically.

That doesn't work today though, so we will need some config option
indeed.

The proposal in the parallel thread is to just accept all low memory
(below 4G) unconditionally.  So maybe it is enough to have:

  * accept all memory below 4G
  * accept all memory

Possibly we need:

  * accept all memory below 4G
  * accept all memory below 4G, plus x GB of high memory.
  * accept all memory

In any case the config option should be designed in a way that we can
add a 'automatic' choice later, i.e. we can have ...

  * automatic (default)
  * accept all memory below 4G
  * accept all memory

... once the automatic negotiation is available.

take care,
  Gerd


