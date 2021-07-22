Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2823D2761
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 18:14:59 +0200 (CEST)
Received: from localhost ([::1]:54712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6bLO-0002t3-MC
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 12:14:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m6bKZ-0001oO-Np
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 12:13:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m6bKW-0002eC-TB
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 12:13:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626970426;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Oblu5KmusJrKwka4M3MqP4X68bINYs5YtRX6xnusYKc=;
 b=d+P0m9ssvZjC5x98/V/OwNcBpEPLLTp592dG1taTmR+ISj1SDDOrLYlvfss7Jb5VupsAJ+
 xwR1kCUxkrsE/JN5irx9BsET6V3l3dJTxJ+znVIJiVkvxNye+I3sY4ibiu4h2sEBSEDu1x
 KIPRdJAmGYVeFjIv/l0TwyYfy7s/09E=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-72-a0MOYgbKNGy8X3Y2XK435A-1; Thu, 22 Jul 2021 12:13:45 -0400
X-MC-Unique: a0MOYgbKNGy8X3Y2XK435A-1
Received: by mail-wr1-f69.google.com with SMTP id
 y15-20020a5d614f0000b029013cd60e9baaso2629768wrt.7
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 09:13:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Oblu5KmusJrKwka4M3MqP4X68bINYs5YtRX6xnusYKc=;
 b=T/ITIrKWseoUrdxZ66YEGNMaNSfQzLwiWhs4nsqPFktABkxunoxzCPtSTxKVGfJuqe
 s4f9amG0b7hDn39RVIyPzm6F8G8O2sryNl9UQqJhMvlBSb6XYOMnf/LvIu+65DXu1C8T
 97JridnPignRG5BQCTLkAaF3f3BPuqYswJgAD/FsKbbMoYKnu/wxdJs9XQyf4kbC6Wo+
 LXu+a58pmBSxOazcwRgWJEBWeZND9U6GJclPSg4CMS8Lfr/qMxyX4XdGJ0sAMI5QJUB/
 PbeeVbA/nliGirrk0s62Jd3MBciMdy3cWPALexOBP14/+FHh6ncg1aYWk6pLpApfHsVv
 3iyg==
X-Gm-Message-State: AOAM5321kHAdex2/Qc+/HQPRy/Ti+HzN1LTAckC90SDHUqwqS68ukRzQ
 nV3mAEmy1AmmtKlQrNTJe7dky7V7RxKLcfgjtQf3kW3IvscGER8pIh5ylH+3tqTREBqvYNs/oqs
 9NP8E4XXTcBh6F54=
X-Received: by 2002:adf:d236:: with SMTP id k22mr769221wrh.392.1626970424244; 
 Thu, 22 Jul 2021 09:13:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxiO5n80zv7ic+SwVH1VK2CkyJVWN31dEgpO2ZYU4PtCP8AvixXsuodHKAroiNPEU5F7beI+g==
X-Received: by 2002:adf:d236:: with SMTP id k22mr769197wrh.392.1626970424031; 
 Thu, 22 Jul 2021 09:13:44 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id f7sm2914900wml.35.2021.07.22.09.13.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jul 2021 09:13:43 -0700 (PDT)
Subject: Re: [PATCH for-6.1] i386: do not call cpudef-only models functions
 for max, host, base
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>
References: <20210722083851.24068-1-cfontana@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <101ca50d-5bec-d4cc-7874-a296bf43421f@redhat.com>
Date: Thu, 22 Jul 2021 18:13:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210722083851.24068-1-cfontana@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.203, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/22/21 10:38 AM, Claudio Fontana wrote:

It seems the subject got dropped and the first line
used as subject... But I'm not sure you want to
start the description with it.

> properties set by function x86_cpu_apply_props, including
> kvm_default_props, tcg_default_props,
> and the "vendor" property for KVM and HVF,
> 

This newline is what confuses me.

> are actually to be set only for cpu models in builtin_x86_defs,
> registered with x86_register_cpu_model_type, and not for
> cpu models "base", "max", and the subclass "host".
> 
> This has been detected as a bug with Nested on AMD with cpu "host",
> as svm was not turned on by default, due to the wrongful setting of
> kvm_default_props via x86_cpu_apply_props.
> 
> Rectify the bug introduced in commit "i386: split cpu accelerators"
> and document the functions that are builtin_x86_defs-only.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Tested-by: Alexander Bulekov <alxndr@bu.edu>
> Fixes: f5cc5a5c ("i386: split cpu accelerators from cpu.c,"...)
> Buglink: https://gitlab.com/qemu-project/qemu/-/issues/477

If you want to have gitlab closes the issue once merged, you'd
need to use Resolves:/Fixes: tag instead, see
https://docs.gitlab.com/ee/user/project/issues/managing_issues.html#default-closing-pattern

> ---
>  target/i386/cpu.c         |  19 ++++++-
>  target/i386/host-cpu.c    |  13 +++--
>  target/i386/kvm/kvm-cpu.c | 105 ++++++++++++++++++++------------------
>  target/i386/tcg/tcg-cpu.c |  11 ++--
>  4 files changed, 89 insertions(+), 59 deletions(-)


