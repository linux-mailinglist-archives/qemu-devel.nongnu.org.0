Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1AF2FB578
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 11:52:00 +0100 (CET)
Received: from localhost ([::1]:33952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1ocA-0000Kn-V3
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 05:51:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l1oZS-0007UA-Kj
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 05:49:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l1oZQ-0001ny-RC
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 05:49:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611053347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2T8gB5oNMiIdCvqHAogNFYShFsrAYUQqLJaUQfVu2GU=;
 b=GfBPtuLZANOnPAjzdWuJCVhst14bzKEzgbD2u6zTqUxmHDq7LwqyePAZ7EOQdapFLCDW1G
 Ur4ckNFBZTVtleKZB7etk8R1dMWb9KymafyCHrlf4QYvhK3Mb9fl+GNva13ReOQXKfW5n3
 II1VAEXj8pPWG5N+S80lEC6+AOrpD4I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-456-5uIYRWTqMfmPHyGHoKdmAg-1; Tue, 19 Jan 2021 05:49:05 -0500
X-MC-Unique: 5uIYRWTqMfmPHyGHoKdmAg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D01B5801F97;
 Tue, 19 Jan 2021 10:49:04 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-157.ams2.redhat.com [10.36.112.157])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BA14627C3C;
 Tue, 19 Jan 2021 10:49:03 +0000 (UTC)
Subject: Re: git://git.qemu.org/qemu-web.git now pulls from gitlab
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Michael Roth <mdroth@linux.vnet.ibm.com>
References: <c146373d-5a9e-8093-4f5b-48fd37152702@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <dcdee54e-ccd9-2004-6b95-58ee1f26833e@redhat.com>
Date: Tue, 19 Jan 2021 11:49:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <c146373d-5a9e-8093-4f5b-48fd37152702@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.175,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.194, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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

On 19/01/2021 11.43, Paolo Bonzini wrote:
> The qemu-web.git repository on git.qemu.org is now a mirror of gitlab. The 
> git mirror is updated every 15 minutes.
> 
> Pushing new changes to qemu.org therefore must now be done via 
> git@gitlab.org:qemu-project/qemu-web.git.
I think that should be gitlab.com instead of gitlab.org ? At least I had to 
replace it when updating my config.

  Thomas


