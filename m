Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D9F539127
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 14:54:57 +0200 (CEST)
Received: from localhost ([::1]:52436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nw1Oi-0008TI-A0
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 08:54:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nw1EX-0004C1-0U
 for qemu-devel@nongnu.org; Tue, 31 May 2022 08:44:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31211)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nw1EU-0000gj-Lx
 for qemu-devel@nongnu.org; Tue, 31 May 2022 08:44:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654001061;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KYQowxqIWTg8F+IPaHtd9lFotciq+fm2m+eVDBUwNug=;
 b=EeMCml0b04Mu+Qs7/mWNu5Yg4N/46ZJWuZTN/v6VkfsBVY4ZoPN8FHqwB8UiQVPjLIxM02
 NC0kGc9OztvjuNV5JUHfsw/uWybQep9BMufNERvIE0Z1huLq7gGKd+tNRV2U3DhazCOtVJ
 mVxQuPWe+M/9CMVUs7ryy8vqgGcf3Fc=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-110-HInK3d7POxOWzhYWgjVmIw-1; Tue, 31 May 2022 08:44:20 -0400
X-MC-Unique: HInK3d7POxOWzhYWgjVmIw-1
Received: by mail-ej1-f72.google.com with SMTP id
 gf24-20020a170906e21800b006fe8e7f8783so5190958ejb.2
 for <qemu-devel@nongnu.org>; Tue, 31 May 2022 05:44:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KYQowxqIWTg8F+IPaHtd9lFotciq+fm2m+eVDBUwNug=;
 b=nQrF3II7SDlp4YLcWOy3lBzvkC7xwM0F3xP9Z+snQ7uLgBAd99L0egX2SPPVuurHOv
 LPet98il8Y+rEwPKdgxsxWFsz7Vf2spRlwz138UgZl9/1ry8E5FjcVhN9+tL7J2uW8wN
 TGq1YQiBtWEAbg0djhHic2/ZNc+8INfSyxnB0Il3cOIoEyMfDK10k1+9JZXupeXcthby
 wY9uwi+KSi/Ma0mI3IR2k8k/Nc/vxwhYOFNPAJG9v9fQXu/5nbm8HP2AQ2u+fpWSTj4K
 l9VsMcoqsT+QBWslsg/Goy91t1gHse1Rokb/GK927261aCTishbt34Th0rY1t2598gjb
 qZ/w==
X-Gm-Message-State: AOAM533QDz+WHpAJv87eiSyXXtCjnxI8sMv0v/dq47nmeBy6RFTQMnSm
 5ptJVnXPZVOh1la/ddOyo3tWj3FykNp6w+thkEec38wz66UA5w+BsgvMQ8lrnJa/aBJQOQkf7ls
 +yrQIwzgySdwfuatnwixrShWzyYoJnut30SiWE2LfoVIz2N1DckBCcyV8boPbJeANNbM=
X-Received: by 2002:a05:6402:524d:b0:42a:f9e9:8013 with SMTP id
 t13-20020a056402524d00b0042af9e98013mr6719015edd.65.1654001059278; 
 Tue, 31 May 2022 05:44:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxIcFc3tEFSTVr0B9NSOooWuDE3IDr652soybpKRugb7ii1R8KTczXtw3nKLZwNmp9QLSEzGg==
X-Received: by 2002:a05:6402:524d:b0:42a:f9e9:8013 with SMTP id
 t13-20020a056402524d00b0042af9e98013mr6718987edd.65.1654001058982; 
 Tue, 31 May 2022 05:44:18 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 v8-20020a1709063bc800b00704a5c530ccsm119977ejf.162.2022.05.31.05.44.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 05:44:18 -0700 (PDT)
Date: Tue, 31 May 2022 14:44:17 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: pbonzini@redhat.com
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH 0/2] i386: fixup number of logical CPUs when
 host-cache-info=on
Message-ID: <20220531144417.73eb53b1@redhat.com>
In-Reply-To: <20220524151020.2541698-1-imammedo@redhat.com>
References: <20220524151020.2541698-1-imammedo@redhat.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Paolo,
 can you pick this up if it looks fine, please?

On Tue, 24 May 2022 11:10:18 -0400
Igor Mammedov <imammedo@redhat.com> wrote:

> Igor Mammedov (2):
>   x86: cpu: make sure number of addressable IDs for processor cores
>     meets the spec
>   x86: cpu: fixup number of addressable IDs for logical processors
>     sharing cache
> 
>  target/i386/cpu.c | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
> 


