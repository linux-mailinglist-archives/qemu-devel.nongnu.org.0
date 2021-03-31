Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCBA34F836
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 07:01:39 +0200 (CEST)
Received: from localhost ([::1]:33722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRSz4-0003cz-UD
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 01:01:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lRSx7-00037U-IC
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 00:59:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27351)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lRSx2-0007P2-QH
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 00:59:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617166771;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y+nqg9kgw6h4oxEmAf0mdT7/1zov9Tsq21mXGHgAEqU=;
 b=cYpI84s6wN96MNMhQKu5OlOO7dpWIX9tUOR2c3gXcVewLeBwT9l3c6gW4Bx5O3Ku0C2ETu
 sNbg3nIrgZrmeZgGBsE/0m2lb4v5pzdWoj6qdYm3/9ycFdGLrd8dKNcLX8hQ98YqDWkDLN
 Xl+VJt89ecBI6BrDGWvYQuedbJr24SQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-aHsPk6hUMHCyPTfQ7HuDEQ-1; Wed, 31 Mar 2021 00:59:27 -0400
X-MC-Unique: aHsPk6hUMHCyPTfQ7HuDEQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD259107ACCA;
 Wed, 31 Mar 2021 04:59:26 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-75.ams2.redhat.com [10.36.112.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DF4EA6E71D;
 Wed, 31 Mar 2021 04:59:25 +0000 (UTC)
Subject: Re: Planning wiki page is outdated (says 5.0 is currently in
 development)
To: Rebecca Cran <rebecca@nuviainc.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <c6a2d07b-4406-9a52-92f9-286911c79dd3@nuviainc.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <c91deb8c-085e-d691-9ed7-b039a3d8bce9@redhat.com>
Date: Wed, 31 Mar 2021 06:59:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <c6a2d07b-4406-9a52-92f9-286911c79dd3@nuviainc.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

On 31/03/2021 04.53, Rebecca Cran wrote:
> I noticed https://wiki.qemu.org/Planning is outdated: 6.0 is listed under 
> Planning Pages, but at the top it says 5.0 is the release that's currently 
> in development.

Thanks for the hint! I've simply removed that link now since we apparently 
forgot to update it since a year already.

  Thomas



