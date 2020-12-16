Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4A52DBE15
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 10:57:08 +0100 (CET)
Received: from localhost ([::1]:52168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpTYR-00087G-JT
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 04:57:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kpTVG-0005eJ-Ml
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 04:53:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kpTV6-0004b2-Ru
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 04:53:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608112419;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G5xrhVDnQlR+l+pqOrv/RRQM3CQrp+mYXDiVF5RE5rE=;
 b=ekwQe7q811ypNV80vt/IR/ws6o2VWmYHwsUrIQs302lAJOZ876/aTS9D6sKZjk0waCSW51
 lm4GnsEbKF/jL69nGBATUGEDpLnYHH8uGPf9evUIF3JjbpMC2pjKtDiP/d5O3cF2k7jaHX
 yq5NULNrOI3Rte9fne/6e2I7DbHPqKU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-u3pqpAfINN-0twSB2Ta1hQ-1; Wed, 16 Dec 2020 04:53:37 -0500
X-MC-Unique: u3pqpAfINN-0twSB2Ta1hQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4CB7615723;
 Wed, 16 Dec 2020 09:53:36 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-113-7.ams2.redhat.com [10.36.113.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BE6A45D719;
 Wed, 16 Dec 2020 09:53:35 +0000 (UTC)
Subject: Re: CXL support in QEMU
To: Prashant V Agarwal <agpr123@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <CALOWxgPkoiR9jHSP-S+hYkWZb89xi8kLVY4vsHqTMzpg6Sv=jQ@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <07f753bd-45d8-d65d-6195-25f9dfb74795@redhat.com>
Date: Wed, 16 Dec 2020 10:53:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CALOWxgPkoiR9jHSP-S+hYkWZb89xi8kLVY4vsHqTMzpg6Sv=jQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/12/2020 06.05, Prashant V Agarwal wrote:
> Hi,
> Is there a way to know the support plans for CXL protocol in QEMU?
> I see that there is side branch development going on:
> 
> https://gitlab.com/bwidawsk/qemu/-/tree/cxl-2.0v2
> <https://gitlab.com/bwidawsk/qemu/-/tree/cxl-2.0v2>
> 
> But when does it get merged and gets released in QEMU formally?
> Is there a way to know a rough timeline?

You should rather the authors of that repository whether and when they plan
to contribute their changes to the QEMU project. It's certainly not going to
happen automatically that these patches get merged into the main repository.

 Thomas


