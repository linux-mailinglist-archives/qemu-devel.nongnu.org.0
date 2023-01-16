Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD7666CCD1
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 18:29:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHTHX-0002KM-Nm; Mon, 16 Jan 2023 12:28:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pHTHQ-0002Jh-ST
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 12:28:21 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pHTHP-0003r0-9r
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 12:28:20 -0500
Received: by mail-wr1-x42c.google.com with SMTP id z5so27115012wrt.6
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 09:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2Qy32fsVUGy/2kaTaWoF7pY0hSY42SutOG1j3XcdF8Y=;
 b=FnRULReYXtqIMeUf7RsWECUugB5Ckzscf+V76MFWyNia3Bg9om6CXCOKwGGoj/i5wO
 YJjqk00t+NVD6Bg7iIpe0bc2wsuExkErtPoVRheRdMpSak2siyL+L6DH1N3bqR0PKkyG
 tq28XW1BVD+O7XYKdcTM0YL20IBnQFNrxP0pAECj0lls9p0HULVE+XBIl4yrGHd79eqG
 cMg8w6EGnMOt8//eBVJMszbdm85hhEI2LofC/P+ULaHKiOJz97u924WryJ1Icz8y7vFE
 fw6onSlUkIWq3wIAeWC5tU8r7QR5HRN3P9X/irzZjKsInzzqqAL2/f5RkhkdzkqKvjpe
 sGxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2Qy32fsVUGy/2kaTaWoF7pY0hSY42SutOG1j3XcdF8Y=;
 b=GNk8ANoDr299usYX1k/Xz6qC6OMSa/9klBKbcFS35K+/nAs/bkZr22RxuV64r/flsR
 6Y/xc8LvUiu6Z5qIwnPUmhInz0mzD6v63b57a2AVE6k2BepO9xIV1rcA7rJ929AInK4z
 qIOfUqtmk2t+ywUA6jt9qO7OjL5f9Qk95Rg74AnbatSNtK227N4hNsd74XY2Wdtd1o5N
 wjmlXvB4kmz0FqcxQ7OPDKqAUxFRb7v+O+7yapJ7exb7yDOV566jF0hPzVdEfgGH5BQk
 3gN0F2IkxgLUW10KD7TbBVVRAhtNlE9oBcTU1Mpf+Iw7jK9VbuQec6D6771Rxlff05Nq
 fw8w==
X-Gm-Message-State: AFqh2kqHwnZo3M1S6WvZZ3WxU3WDcqgJ20Gp3ZS0OsZFEFDlLXSRUzye
 biS4vM54BPgRV6FT1pt5hu4=
X-Google-Smtp-Source: AMrXdXutH06Z9nh3rjRL8POneBbYWDEUxiMannbnsi9DkdWjtmuR57vdCiIwIjWWHdVqUVk89jpzug==
X-Received: by 2002:a5d:514b:0:b0:2a2:e87a:b4e1 with SMTP id
 u11-20020a5d514b000000b002a2e87ab4e1mr8146772wrt.36.1673890097212; 
 Mon, 16 Jan 2023 09:28:17 -0800 (PST)
Received: from [192.168.6.176] (54-240-197-224.amazon.com. [54.240.197.224])
 by smtp.gmail.com with ESMTPSA id
 d18-20020adfe852000000b002426d0a4048sm27456741wrn.49.2023.01.16.09.28.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 09:28:16 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <435a3259-9ecc-47cb-6e7c-26fa588e62bc@xen.org>
Date: Mon, 16 Jan 2023 17:28:14 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v6 16/51] i386/xen: implement HYPERVISOR_memory_op
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>
References: <20230110122042.1562155-1-dwmw2@infradead.org>
 <20230110122042.1562155-17-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230110122042.1562155-17-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=xadimgnik@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.097, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 10/01/2023 12:20, David Woodhouse wrote:
> From: Joao Martins <joao.m.martins@oracle.com>
> 
> Specifically XENMEM_add_to_physmap with space XENMAPSPACE_shared_info to
> allow the guest to set its shared_info page.
> 
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> [dwmw2: Use the xen_overlay device, add compat support]
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>

Reviewed-by: Paul Durrant <paul@xen.org>


