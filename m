Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAECF604D0F
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 18:21:05 +0200 (CEST)
Received: from localhost ([::1]:48544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olBoV-0004yh-L7
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 12:21:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1olBUW-0003H8-MW
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 12:00:25 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:54815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1olBUU-000185-Jp
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 12:00:24 -0400
Received: by mail-wm1-x32a.google.com with SMTP id iv17so13229590wmb.4
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 09:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=hVupMUX+AbKGeudOf3VM2f3d4o9emAy/RsXvFXsgs1k=;
 b=JPTArh3Fo4mWtWDttlA0ClC01c7R8sZVod1y+p1Vsv9eXhEmp7db4MDO3syoY38G8y
 6THKAaVIYgz0zUEhaoeCW5TIff2CcMwjO5dz4MuXHAOGz+xjc9ECk+MIuGrooHCDJ7k9
 icRRACR79bQCsajRphZgSqapgH7ZFXEQ++sgb6shptuPXECUSxuJnXTs1G2ZMVKQzT8c
 2dxBLtpkSRdMO7irWPyXajs8V+kmrUQKU9hh8lFqeRBWabbaFRECGxaorFxl95RgrNag
 74fEYSmWbmQwEnhmnA+Jwk/P3uNf36vaJIEj7d/qffkS2H0X7KgtxGWL91D1j6EvvipS
 J9dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hVupMUX+AbKGeudOf3VM2f3d4o9emAy/RsXvFXsgs1k=;
 b=pGVRQu0G1/f6FySJAY4jbjuqDdEU2IXHy82TONgF7Rj4rRYdVATBR3ZLmEA3jofLL6
 2zeRshTS8rtLs6JCpM4nAUD0zfLh4Yte5/WATZsTbS8gB94TJA8sLB7kVSXL26HU46AR
 rhQ4Jx4E4XTcFf/LzOExK0jtKHNohFueLgXNFjN3TqIA8sok5G+hicE2J0h7OgZ1+Laq
 xZK+aIipK9/n+5GJA00cRUsutkY/3XcxnlpF3KqnGRE2JPpNlUkxs72lmxHzOnOrrXhJ
 cbXNFOqTJItU7O/bV45QblPGDyEaJ/U5q6pz9mTxdaA8An8mE/zIafpSdqB8rvY7x06A
 w6wg==
X-Gm-Message-State: ACrzQf0mfOGu9rh7yBll6bwVy9osthz8a7BoXi0OQ+3rpiwuCPCCaYcy
 1gzLZVzmYHoOSg8hqpC5Z8M=
X-Google-Smtp-Source: AMsMyM56wfRKb1W4RRWfr9a44/7FKXWWZbg3jEH/nJzz4jN0Z367Bev8MYCgZc5kmwy9tTq2PTMK2Q==
X-Received: by 2002:a05:600c:3148:b0:3c6:eefa:fa5 with SMTP id
 h8-20020a05600c314800b003c6eefa0fa5mr6640215wmo.88.1666195219222; 
 Wed, 19 Oct 2022 09:00:19 -0700 (PDT)
Received: from [192.168.16.131] (54-240-197-232.amazon.com. [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id
 t21-20020a7bc3d5000000b003b4a699ce8esm359817wmj.6.2022.10.19.09.00.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Oct 2022 09:00:18 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <6ccbd834-b7c5-3209-008e-a2ede8427986@xen.org>
Date: Wed, 19 Oct 2022 17:00:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v1 04/12] hw/i386/xen/xen-hvm: move x86-specific fields
 out of XenIOState
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
Content-Language: en-US
Organization: Xen Project
In-Reply-To: <20221015050750.4185-5-vikram.garhwal@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x32a.google.com
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


