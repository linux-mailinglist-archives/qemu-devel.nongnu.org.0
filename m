Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0F6442754
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 07:54:47 +0100 (CET)
Received: from localhost ([::1]:45422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhnh0-00071Z-AI
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 02:54:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mhnfG-0005ci-8z
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 02:52:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mhnfE-0004CJ-6S
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 02:52:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635835975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G181Tb9bV5AKcFNkZy/knRILz6AcWiifcJ4T6Xp1Aaw=;
 b=R7z3vc/Ja3ZeXOZeNuOTsuIkqq3hiSd4gc1hiZ5a000sOyZ58OfEzsLxqXCZBl+1K4FfgJ
 G/rFyv4dVQuEMln8Phj24FAfBDLXlXQjZqqmgXju65StvRV5YjdP6ZqFlfFSPsPmHAsa7K
 r5kwKDc2bfPd+M6lDLZIsj6FDxR95XQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563-50RtqHNYNCiDdJem6MzqQQ-1; Tue, 02 Nov 2021 02:52:52 -0400
X-MC-Unique: 50RtqHNYNCiDdJem6MzqQQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 54488802682;
 Tue,  2 Nov 2021 06:52:51 +0000 (UTC)
Received: from [10.39.192.88] (unknown [10.39.192.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7A4D45D705;
 Tue,  2 Nov 2021 06:52:50 +0000 (UTC)
Message-ID: <e54b7469-bd94-285d-f167-50a754706407@redhat.com>
Date: Tue, 2 Nov 2021 07:52:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v7 13/60] linux-user/host/s390: Populate host_signal.h
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211101172729.23149-1-richard.henderson@linaro.org>
 <20211101172729.23149-14-richard.henderson@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20211101172729.23149-14-richard.henderson@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.14, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/11/2021 18.26, Richard Henderson wrote:
> Split host_signal_pc and host_signal_write out of user-exec.c.
> 
> Cc: Thomas Huth <thuth@redhat.com>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/host/s390/host-signal.h  | 94 ++++++++++++++++++++++++++++-
>   linux-user/host/s390x/host-signal.h |  2 +-
>   accel/tcg/user-exec.c               | 88 +--------------------------
>   3 files changed, 95 insertions(+), 89 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


