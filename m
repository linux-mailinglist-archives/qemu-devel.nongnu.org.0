Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C196535D0
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 19:04:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p83RN-00022g-CS; Wed, 21 Dec 2022 13:03:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1p83RG-000208-9b
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 13:03:35 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1p83RD-0004V0-V6
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 13:03:33 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 ay2-20020a05600c1e0200b003d22e3e796dso2042455wmb.0
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 10:03:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ujhZlRSTsW7Rt3GQEzbKDn6qcHZ+t7mTJYxtj4u2Q6I=;
 b=bLVrm7xsaNBKtF/XJ+hVRDUuSILcS7BSKNOplEQt5C80PB9I3Duj0NF81PN4l4DF5F
 houGvo3xbcQ7FYEqQKNg13BPcwh/9ruxa8pKAuvZmsVS1HDIaS33eWTvrhZ7EDiQH2G5
 UQyC58oo8C41HmWpCHJ9XIN5gSQgLQiBI5/QTn+w27d/ZCna3HMM3jlQh4ec7nTD7Ojs
 4Y0BXRxKd+8ILQXJaLzEHTClPiZQrP21YIEqmCQyiOwA+9rt40hI6z0zZ2R0EpyyBoux
 QQ49yEJoSFT9vs7fzP/5qj2hI7bWG1iUiGGdRD8kZTffyhXTg8U39dN0jNRrG1lY5EGk
 o9jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ujhZlRSTsW7Rt3GQEzbKDn6qcHZ+t7mTJYxtj4u2Q6I=;
 b=zxWVGcGPFDJQzCgtC53hSQ2RTVeWEAgXvjhYoRjV630QAGSnSzewfj/OLQbLhpBKkb
 hBIq5WiNIlgK/f2on1XK+S8eAC3t2qmdmpO0VpX60IqhCHdNn0c1uGPa2iwW9A5IYHME
 3OVNWzOdzOtM55ipTdOOOXj6UPJhv3q4xcSnnK3CklNuP8snT33WHPcL7KgPjZhjHqUd
 w3AseB+gwEIwRSck9IjdLWeOSaPyfgUfmF8QyqKPkjqdhLqdtT8wxW+d4ikbeZgtRb8r
 hHdzreXWhhumD2CRQhGgJHJa+g+WFbh2ZRm6g/E/m+phdpbZ/0KyRl5a/sBkwcgM6AVO
 w7Hg==
X-Gm-Message-State: AFqh2kp4z1FDYmKVj+/0vNXKZc2G+EPVI00oaOCSFCPYZbiPVYy+eCre
 WBvFa9L/LK2Y719wKJxpO4c=
X-Google-Smtp-Source: AMrXdXtv63xRUgT8CuAOhpKji7VkkBCMr/PoiZ1TYqAZ7nMWidFxzn2XrWnFBIe1axiwoojuDzLnWA==
X-Received: by 2002:a05:600c:1e1d:b0:3cf:b07a:cd2f with SMTP id
 ay29-20020a05600c1e1d00b003cfb07acd2fmr2413710wmb.37.1671645810445; 
 Wed, 21 Dec 2022 10:03:30 -0800 (PST)
Received: from [192.168.6.210] (54-240-197-232.amazon.com. [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id
 o11-20020a1c750b000000b003c65c9a36dfsm2901698wmc.48.2022.12.21.10.03.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Dec 2022 10:03:30 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <c113208f-e01d-9dbf-be78-56bc3a8e7095@xen.org>
Date: Wed, 21 Dec 2022 18:03:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RFC PATCH v4 11/47] i386/xen: implement HYPERVISOR_xen_version
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>
References: <20221221010623.1000191-1-dwmw2@infradead.org>
 <20221221010623.1000191-12-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20221221010623.1000191-12-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 21/12/2022 01:05, David Woodhouse wrote:
> From: Joao Martins <joao.m.martins@oracle.com>
> 
> This is just meant to serve as an example on how we can implement
> hypercalls. xen_version specifically since Qemu does all kind of
> feature controllability. So handling that here seems appropriate.
> 
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> [dwmw2: Implement kvm_gva_rw() safely]
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   target/i386/kvm/xen-emu.c | 86 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 86 insertions(+)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


