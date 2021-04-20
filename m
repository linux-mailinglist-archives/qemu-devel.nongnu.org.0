Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2E93651FD
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 07:57:49 +0200 (CEST)
Received: from localhost ([::1]:52810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYjOO-00029z-QW
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 01:57:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lYjNE-0001fi-FS
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 01:56:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lYjND-0006ie-2E
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 01:56:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618898194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WLi1x9xJzeLH3JvlA26zRFfIwz1YAPp3q1uc6KMHl7I=;
 b=Aaw39k43XzbN2fiu7iJ9KYKEAc+PlEqxVSfM2sAK+SdWBJlbS58fccUqRdtViuLPFfHMFj
 gtpkBWoo7wv+6/B5kgqG5xafK4npPV+FDCy4EkKXzAdJuPbI1FXa/m44GT1YRrYvuItJ6z
 6kzFVRfNe+ySO/+dkCpzGBWi4O7A8G4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-zGYqeZjrN_62OsYVXOyWPw-1; Tue, 20 Apr 2021 01:56:33 -0400
X-MC-Unique: zGYqeZjrN_62OsYVXOyWPw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 726F481A281;
 Tue, 20 Apr 2021 05:56:31 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-70.ams2.redhat.com [10.36.112.70])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 884B65D9CA;
 Tue, 20 Apr 2021 05:56:29 +0000 (UTC)
Subject: Re: [PATCH 03/14] hw/block/nvme: rename __nvme_select_ns_iocs
To: Klaus Jensen <its@irrelevant.dk>, qemu-devel@nongnu.org
References: <20210419192801.62255-1-its@irrelevant.dk>
 <20210419192801.62255-4-its@irrelevant.dk>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <3065d1a5-cd1f-e4f6-dc23-e1aa7dfdec57@redhat.com>
Date: Tue, 20 Apr 2021 07:56:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210419192801.62255-4-its@irrelevant.dk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/04/2021 21.27, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> Get rid of the (reserved) double underscore use.
> 
> Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
> Cc: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>   hw/block/nvme.c | 47 +++++++++++++++++++++++------------------------
>   1 file changed, 23 insertions(+), 24 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


