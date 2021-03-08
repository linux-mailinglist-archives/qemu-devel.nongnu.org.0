Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A9533087C
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 07:55:17 +0100 (CET)
Received: from localhost ([::1]:56564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJ9nQ-000333-4q
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 01:55:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lJ9m5-0002RI-Na
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 01:53:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21228)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lJ9lz-0001Ws-Ta
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 01:53:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615186424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9w8FJ1uaOrP5h4kSs9WT4WiibK352EkWzlL3AI0yRVI=;
 b=CglL2n1Aq21osCNwS1jiYztWb0/okBcitJuygcV+D8TE639xB6AlzXATelzKsfs2tSWbKg
 SiInCdXTQZUtAvkZ1vwM94Cl1J1g+5InThOlmOZOLq5xIA/hheXavKc73hBuyxySztZbHQ
 VGwHBRMNe8VSyqQCZ6ZOnDqiBod8shY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-542-mVkSWo3KOtO3kHSjpl1iLQ-1; Mon, 08 Mar 2021 01:53:40 -0500
X-MC-Unique: mVkSWo3KOtO3kHSjpl1iLQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74C181084D70;
 Mon,  8 Mar 2021 06:53:39 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-143.ams2.redhat.com [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C0BEF5D9D0;
 Mon,  8 Mar 2021 06:53:34 +0000 (UTC)
Subject: Re: [PATCH v4 4/5] m68k: add a system controller
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20210307164828.87348-1-laurent@vivier.eu>
 <20210307164828.87348-5-laurent@vivier.eu>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <cb15e697-be77-5cbc-ec4d-555955963d65@redhat.com>
Date: Mon, 8 Mar 2021 07:53:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210307164828.87348-5-laurent@vivier.eu>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/03/2021 17.48, Laurent Vivier wrote:
> Add a system controller for the m68k-virt machine.
> This controller allows the kernel to power off or reset the machine.
> 
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/hw/misc/m68k_virt_ctrl.h |  22 +++++
>   hw/misc/m68k_virt_ctrl.c         | 152 +++++++++++++++++++++++++++++++

Wouldn't it make more sense to place this in hw/m68k than hw/misc ?

  Thomas


