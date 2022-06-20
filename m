Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 593F155161C
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 12:43:56 +0200 (CEST)
Received: from localhost ([::1]:60170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3Ess-0003W0-VJ
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 06:43:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1o3ErU-0002n2-Kb
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 06:42:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1o3ErR-0003Rj-Dw
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 06:42:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655721744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7yl4Cb+BbNwmQgDIVy6qwO5/3FknpBsLjaCtrsoDuuA=;
 b=O+LNCmZye+h2d4OkzLV3F1XWMAbdoW3XQredXn4nodURCNihcYIIsp+Md4bhhHLS29YBUZ
 vjUvfJT9SczjQ/RfirRAgp4TcUt+dWhsV8CSdysNpNcRlw0cree2tEPmLPsjjb51pAY7mx
 i5YYb6vMNZ9a/7JAaPNnEjPpUR7dH1k=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-19-rmb3Y6syMuOCXGEFNiwXhA-1; Mon, 20 Jun 2022 06:42:07 -0400
X-MC-Unique: rmb3Y6syMuOCXGEFNiwXhA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 78A4D3816851;
 Mon, 20 Jun 2022 10:42:06 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 38DFC4010150;
 Mon, 20 Jun 2022 10:42:06 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id BEAAD1800084; Mon, 20 Jun 2022 12:42:04 +0200 (CEST)
Date: Mon, 20 Jun 2022 12:42:04 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Dionna Amalie Glaze <dionnaglaze@google.com>
Cc: Xiaoyao Li <xiaoyao.li@intel.com>, "Xu, Min M" <min.m.xu@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "Lendacky, Thomas" <Thomas.Lendacky@amd.com>,
 "Yao, Jiewen" <jiewen.yao@intel.com>,
 "Aktas, Erdem" <erdemaktas@google.com>,
 "Yamahata, Isaku" <isaku.yamahata@intel.com>
Subject: Re: New "IndustryStandard" fw_cfg?
Message-ID: <20220620104204.spihjw7xjmd2gppv@sirius.home.kraxel.org>
References: <CAAH4kHYyXv3x+89Ybnj7GXms2Bz2CNn5JK0+d6DzVtMz5owTrw@mail.gmail.com>
 <PH0PR11MB50643B5AEE5A399EB8AFB000C5AD9@PH0PR11MB5064.namprd11.prod.outlook.com>
 <a89cb720-3600-51ad-2671-ea0f987cd3d1@intel.com>
 <20220616082846.wtmf3wbxzilzvqt4@sirius.home.kraxel.org>
 <503fadf7-c6d1-61dd-236e-fcca895e8aef@intel.com>
 <CAAH4kHYK5XRUvUC3-QeRuFGn1uTu6LJ=TOHik_oOqw0PSYoKOw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAH4kHYK5XRUvUC3-QeRuFGn1uTu6LJ=TOHik_oOqw0PSYoKOw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
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

> Ovmf can interpret the existence of an opt/ovmf/unaccepted_memory file

> I think "false" can mean either accept all memory or "do what you need
> to" and negotiate if the memory map boot service can create unaccepted
> memory entries. Whichever appears supported.
> Then "true" can be "do whatever, including creating unaccepted memory
> entries in the memory map".
> 
> That seems the simplest way to allow a configuration of this feature.

Well, we actually have three states: file is not present, file is
present and true, file is present and false.  The existing options
use CamelCase, so we should stick to that.  A name which makes clear
what the option does would be good I think.  So, how about this:

    opt/ovmf/AcceptAllMemory=true
	ovmf must accept all memory.

    opt/ovmf/AcceptAllMemory=false
	ovmf should pass memory above 4G as unaccepted
	memory to the guest os.

    opt/ovmf/AcceptAllMemory not present
	ovmf can choose what to do (including negotiate).

take care,
  Gerd


