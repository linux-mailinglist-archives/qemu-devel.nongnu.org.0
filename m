Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8EE16AE0DD
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 14:40:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZXYR-0006MW-BA; Tue, 07 Mar 2023 08:40:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pZXYN-0006LW-E3
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 08:40:33 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pZXYL-00063d-Ug
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 08:40:31 -0500
Received: by mail-wm1-x32f.google.com with SMTP id k37so7823889wms.0
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 05:40:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678196428;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nNICl/NyVJukFnVn6RmR6QpZM8fyn1UqtyTmNPAEbyo=;
 b=hdn8Y7R39GmvpdRZY10YxOr6oayLFTMnukmy84ND49jcL2labjwnK7GPvYowZahppt
 y/N6YpIj7c1xwBa4OKcVa8Bk/eMt2WAc8UbkUZLu4XnOfVUGohWuaj8DHie9dZX/cCSU
 mHKBprsJLkxyeOH4Zzcl+CK3oM4MwYK8dLiZAX3uGLaOdb3Z98MrYClgMRilZAuGv5Ro
 WEhFkek1SXfG9txDHVD9sj6FDq7uT5kDyN8gxrb91hweDi6BDuTSMDwUrsxTzaoH3HWJ
 gYRw3RzguTUgVyKhVgRJh9nXMAuv3w8tdRp491NS6v4gmZ1WgqPnTW56DhGy0iQy2igS
 xQPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678196428;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nNICl/NyVJukFnVn6RmR6QpZM8fyn1UqtyTmNPAEbyo=;
 b=YBbVs3DWTa5QNqqLZRE3Mi/v6Rt/rp0RFV6+miZk1Yr8wzoefjl6WnrSFTDcdZkdu1
 IZc45iKKfhuY33xmoxBo3+mVjKq8Q+k8IlbjgsJJI2Rps1a+RqPTbxPXhc1E1BUGlDOH
 s2P2HR8+LdKWFrhECLs7Q7vNyioHuWnOVjIR9/ABuQoVYhJX80GG5NbThbzIDeZUHjNZ
 4t2ydV1NJ83C0xSQE8MTQlpboNvuVJbMsoBbhFYy/lL2OWM9AoXXJprEVhMHf7PEKqEH
 fr/FE2Tz+up1Uwb1kHSWnQWo3VMYuEekIq/N+MIoItlAPPDhVIoC4U/cIcy7rGHElFGF
 LUvA==
X-Gm-Message-State: AO0yUKU/qZDITV0aCUPKHL8xybclTyh6yK6/Z2r/T32DasuFqLpWtcQh
 2rrxK7pRfd8Lxxh/a/WgVXg=
X-Google-Smtp-Source: AK7set9yGcoS7orl6s6X+QorQrZ+Wi6unxTHJGCLiXxioA3KnRgKc/BJ8RBynR3npr1YSyHmW33uJA==
X-Received: by 2002:a1c:750a:0:b0:3ea:e834:d0d1 with SMTP id
 o10-20020a1c750a000000b003eae834d0d1mr12496383wmc.36.1678196428403; 
 Tue, 07 Mar 2023 05:40:28 -0800 (PST)
Received: from [192.168.25.218] (54-240-197-238.amazon.com. [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id
 l26-20020a05600c1d1a00b003e20970175dsm18819769wms.32.2023.03.07.05.40.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 05:40:27 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <69d9c353-8bb3-b184-4cbe-1bcacf71b49b@xen.org>
Date: Tue, 7 Mar 2023 13:40:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH v1 06/25] hw/xen: Implement XenStore permissions
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20230302153435.1170111-1-dwmw2@infradead.org>
 <20230302153435.1170111-7-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230302153435.1170111-7-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: paul@xen.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 02/03/2023 15:34, David Woodhouse wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> Store perms as a GList of strings, check permissions.
> 
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/kvm/xen_xenstore.c  |   2 +-
>   hw/i386/kvm/xenstore_impl.c | 259 +++++++++++++++++++++++++++++++++---
>   hw/i386/kvm/xenstore_impl.h |   8 +-
>   tests/unit/test-xs-node.c   |  27 +++-
>   4 files changed, 275 insertions(+), 21 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


