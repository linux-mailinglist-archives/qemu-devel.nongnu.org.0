Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D80103494E3
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 16:05:23 +0100 (CET)
Received: from localhost ([::1]:53886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPRY2-00037s-UK
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 11:05:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lPRWk-0002OP-9b
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 11:04:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lPRWg-0005D4-8v
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 11:04:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616684636;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=04VdyU+PqnOk+scn1/sCjYO4TUalmgkzePpXgGz18F0=;
 b=c1/+LoITFCkqd6Q7AXmLuHpfCRTk3XreHpr2L6TM7PVtlJfD0GI+iSJZwQFNENnJ7lOBdt
 7XL7hoCXhSxaFWPxkBaROGYmEtuHwAV9Dar5poCUkGss0dh0oITIuDlk15XSQaVma9K1zh
 p20RM65NwioK5ndRDUYtJLLx7QyqDk8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-457-Zj1uaE0ENTaJf87eJIIkrw-1; Thu, 25 Mar 2021 11:03:52 -0400
X-MC-Unique: Zj1uaE0ENTaJf87eJIIkrw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E1E51966344;
 Thu, 25 Mar 2021 15:03:44 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-55.ams2.redhat.com
 [10.36.114.55])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B0C255D749;
 Thu, 25 Mar 2021 15:03:43 +0000 (UTC)
Subject: Re: [PATCH] iotests: Fix typo in iotest 051
To: Tao Xu <tao3.xu@intel.com>, kwolf@redhat.com
References: <20210324084321.90952-1-tao3.xu@intel.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <67af455e-74f2-000e-e509-ab5b742d0319@redhat.com>
Date: Thu, 25 Mar 2021 16:03:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210324084321.90952-1-tao3.xu@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24.03.21 09:43, Tao Xu wrote:
> There is an typo in iotest 051, correct it.
> 
> Signed-off-by: Tao Xu <tao3.xu@intel.com>
> ---
>   tests/qemu-iotests/051        | 2 +-
>   tests/qemu-iotests/051.pc.out | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)

Thanks, applied to my block branch:

https://git.xanclic.moe/XanClic/qemu/commits/branch/block

(For the record: 051.out is not touched, which is correct because the 
affected branch is only taken for $QEMU_DEFAULT_MACHINE == pc.)


