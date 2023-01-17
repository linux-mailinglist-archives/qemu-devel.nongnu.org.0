Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9E166DA48
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 10:48:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHiZ8-0003iW-G0; Tue, 17 Jan 2023 04:47:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pHiYz-0003i5-4m
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 04:47:34 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pHiYx-0006Zm-HM
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 04:47:28 -0500
Received: by mail-wr1-x432.google.com with SMTP id e3so20733560wru.13
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 01:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=L/cEbvR+rcbh0o29r8psf/h/L5YgHJ5S8CtTZv8/X8I=;
 b=IycqWsjXHJE3ZZhh0I31aaqG4m2u0EXwr79WeQckUUNun+dAAniia6rn+K/l5Hdsud
 dEIfO7UOSWBV2Zn9GlcB8CoKzryIOP0V7/SFWzsdMUVOHPG5/sTnt465TPoBDb7Nc47D
 xasxZScFwRNseNQ9RtLfMBYnIlXKqiYg+8vg//RBkS3UPlnS7s2ZdkfDUbxjpFGIBu22
 TWp/e5V19DiFj4QKW72UawVejvef4GmXbvXjiIe/4nHUSxhRjUpZ7fweoVVBS4oC5nwD
 +DlkiDXtCOef6voVrumq9uBI0/VQbv4q93H3uEUTCTFGoc+rJGJtYzejfID+fAQUYBCN
 ikzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L/cEbvR+rcbh0o29r8psf/h/L5YgHJ5S8CtTZv8/X8I=;
 b=JPIpVV6KrHnzkWeRNMNzFEIn2Sgv5fMJjCJ7YeldhiIsSze8fAWy5Wm4DI5tUK9B2D
 osHcZPX/HDJCM43d2FURsOwFgid+M6AMlWaT8L4eN9GWjcaSglRFKV/2RY40lJJELcJi
 rRRbH1xsBtJ6dwtLD9fyAeOWf7CM8bYUB9RkQ3Nz5vwIiYK+k8c3xgltOtJIzWJfIoUC
 1BFZI0EVKioSjqAfX9HEEu+bezX/uZkJObcK9GvJEGyuSqgOiB+WPFv17Dvaqmh7rrIx
 8eMLcU1caXy9T/nDaPpy15fZgc1dcGTNYvGdb52dPT/AH7l9Udoq+TgzLcvBY3nrbK4Y
 /J1w==
X-Gm-Message-State: AFqh2koc7yhoX5Du6DAmfgJg+Yixq5n4Vyr1gdf/hEQmJSQI2Wz2NGyw
 fam1B9kxqUxlVXG8eOeUQfE=
X-Google-Smtp-Source: AMrXdXvNbvzvCzzD2Ds7jXPdCMRC+nHe+bv5J3gQu8XFxYO2wp0tgv1nS3bH6kHZh7K5NZf00OevIw==
X-Received: by 2002:adf:d229:0:b0:2ba:e2b3:118 with SMTP id
 k9-20020adfd229000000b002bae2b30118mr2326558wrh.44.1673948845797; 
 Tue, 17 Jan 2023 01:47:25 -0800 (PST)
Received: from [192.168.8.108] (54-240-197-239.amazon.com. [54.240.197.239])
 by smtp.gmail.com with ESMTPSA id
 f2-20020adff982000000b002bde537721dsm10414010wrr.20.2023.01.17.01.47.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 01:47:25 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <aee4de7c-9434-70ff-f1ba-0b29c50eaa90@xen.org>
Date: Tue, 17 Jan 2023 09:47:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v7 14/51] i386/xen: add pc_machine_kvm_type to initialize
 XEN_EMULATE mode
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, armbru@redhat.com
References: <20230116215805.1123514-1-dwmw2@infradead.org>
 <20230116215805.1123514-15-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230116215805.1123514-15-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=xadimgnik@gmail.com; helo=mail-wr1-x432.google.com
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

On 16/01/2023 21:57, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> The xen_overlay device (and later similar devices for event channels and
> grant tables) need to be instantiated. Do this from a kvm_type method on
> the PC machine derivatives, since KVM is only way to support Xen emulation
> for now.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/pc.c         | 11 +++++++++++
>   include/hw/i386/pc.h |  3 +++
>   2 files changed, 14 insertions(+)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


