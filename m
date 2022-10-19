Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EE8604CC2
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 18:06:55 +0200 (CEST)
Received: from localhost ([::1]:58130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olBae-0008EI-Dd
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 12:06:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1olBRC-0007IB-Fv
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 11:56:58 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:37700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1olBRA-0000am-Jl
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 11:56:58 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 c7-20020a05600c0ac700b003c6cad86f38so327291wmr.2
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 08:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=hVupMUX+AbKGeudOf3VM2f3d4o9emAy/RsXvFXsgs1k=;
 b=Hoz1h64VhbNtpfHkg2GnQ43QHYEysX6x8fWmjZbb3LYmUCk3yEE2xhj57LzJqjNNEm
 l8X3Q2z2FN8ZK7xzhI4P/lZN8isM5sv++uF0MDnOx9+3GYx8mOd0X7Ruiug7ey05Zu9A
 0IQBNwMILplU/EC+FQw6L9mb7kh38zH/oj9dj4gVqP2l7i7u/N9o4I4wcJ8p1sHMw/aA
 jm670VNGNkZEo9Ay3FFC5XIb5wv+jPAnWxc82or4Yct/C7xiHxGLurgcuSmOCnqeY2LK
 sLfSQ/iYLW5Bpp6jjiDPyx/u6AyEm7w/3J4+x5Z4Kh8qRiQQxeC0sxYUTB4LAL/0yoxA
 mGgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hVupMUX+AbKGeudOf3VM2f3d4o9emAy/RsXvFXsgs1k=;
 b=pCnDGqbr8uDuuUESF1KeFzJyLB2i6sejERUVSJAip+jIsEcpm3nDRVjblxppNWHNKY
 nSScEKSaqqBR/b+sQUjJbiOjfaMgeFnQLhcqvv/ilec9WmxmYD030NWoxjjk8aMqVgrw
 z+HH8b3US3hKO4gzXE3HwiHPqbMYkgNlYRwf1nhdLwIaGM5UegdKT/ulgHh0iCBjUGU6
 xgk9T/HvbZoM9vVRv2hg+oBuNvkBJPdzFvAhEQEfuyC94YdNc14fzWbXB7TTiVlD0k11
 LAsa6eZCg35aSEJd8AL6ut5eAN9datG6NrAFFkbgV7mPp4NOnJaYhfOhU7z6d8gSqUEm
 wWvA==
X-Gm-Message-State: ACrzQf2VqytRfuxYE41wVn5LhYwRvVnuK0UjOSK/tTTzfWAMxhkhhEbB
 13h3qmteQyXaM0nixEs4nEA=
X-Google-Smtp-Source: AMsMyM7RcuUsQvVHd7FHqJ0owLc1kucQ4TcSIdeJKxzL9l0FF0hwuPxWV4qgGZiNjL+DS4GtbOU2DA==
X-Received: by 2002:a05:600c:3d8a:b0:3c6:f241:cb36 with SMTP id
 bi10-20020a05600c3d8a00b003c6f241cb36mr6231312wmb.115.1666195014489; 
 Wed, 19 Oct 2022 08:56:54 -0700 (PDT)
Received: from [192.168.16.131] (54-240-197-232.amazon.com. [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id
 r12-20020adff10c000000b00225239d9265sm14250557wro.74.2022.10.19.08.56.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Oct 2022 08:56:53 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <1fe17e03-dd7b-b705-4730-7b8556af014b@xen.org>
Date: Wed, 19 Oct 2022 16:56:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v1 04/12] hw/i386/xen/xen-hvm: move x86-specific fields
 out of XenIOState
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>, qemu-devel@nongnu.org
Cc: stefano.stabellini@amd.com, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
References: <20221015050750.4185-1-vikram.garhwal@amd.com>
 <20221015050750.4185-5-vikram.garhwal@amd.com>
Organization: Xen Project
In-Reply-To: <20221015050750.4185-5-vikram.garhwal@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x331.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/10/2022 06:07, Vikram Garhwal wrote:
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> In preparation to moving most of xen-hvm code to an arch-neutral location, move:
> - shared_vmport_page
> - log_for_dirtybit
> - dirty_bitmap
> - suspend
> - wakeup
> 
> out of XenIOState struct as these are only used on x86, especially the ones
> related to dirty logging.
> Updated XenIOState can be used for both aarch64 and x86.
> 
> Also, remove free_phys_offset as it was unused.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>

Reviewed-by: Paul Durrant <paul@xen.org>



