Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F8C69211E
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 15:47:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQUeB-0001xf-Nj; Fri, 10 Feb 2023 09:45:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pQUe9-0001xA-TK
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 09:45:05 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pQUe7-00035y-N5
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 09:45:05 -0500
Received: by mail-wr1-x431.google.com with SMTP id co8so1547393wrb.1
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 06:45:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=apxhUB/xnes6wzdmiaKlFKzSSjCSh2peR+6IL/hxwNw=;
 b=fnt9sUxSzeVa+UzOvLnp9rLFbZCGfo58v00C7g/s2oVyvbpRUCyG20NZhE7VY/QllB
 es1M9bSELtxs+RAU62kpC35HE5BZOYUosRL7zawf2Oh7xCJE1f+l3wjA8zY6rB11cZrB
 Z44s4eCjmqt08hiq9/TFns3cBkBQhtCjRwAVsOZ9CEfL6G/DcmytiQGRj4E0UpRDB0X3
 /UfINbu37I+BuT+7syZ6k5tmghPYCI2zRKeAY8RyWtb/5rYR9nURZpVhZDpuZehioAO3
 xdFAbiLEXS+fEWtN/kAYzLKQR4tQHDb+LonnU0U/+8hgYRLUNEQSUDAGpFN+bCu3DKxj
 MOwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=apxhUB/xnes6wzdmiaKlFKzSSjCSh2peR+6IL/hxwNw=;
 b=uNGs12yDuUdPT8nj9yHXJWOAhk7TTyLgtv0s+wzIWlb4OEw1Am8u1Yk+oCRmBN9QID
 w/Z+5VO4iVVlXeDnlMU2MUBvbHxRLh+uNLtPkWfTEWElLc+A8SXwzbVyhN9Czfdtgbjy
 j8ai4Qs2ebTO7LoSX7QXMenRs3V4o8ZBR5NKhjYqtAn+48SP/v4ovY94dFdZ+Vvvf/H7
 HsSL/25pXOAiynk9BNjn2m8CcykwWvH0Gv4XsztYsOTFjTAzzIVqhB6cReT41K/0tjUS
 texd83yRl2G/qYQjEox8IEdSzaQOItXNlNBLWgYCB9xEULHfTAPmlWhEF4g2htRpyyAz
 Evcg==
X-Gm-Message-State: AO0yUKUUBU/tTP4NcayAeaxFjZXxTzysEDcYrEPq+IFiR6Cak68V5LtS
 AhbgysWA3cu86JaorEZWuZM=
X-Google-Smtp-Source: AK7set+7VDOpEZFqLns5cagScGY25t52jG9cmUjIjiDFACs73H3mn85wYAo2D9s98Y/s7W4843o4bg==
X-Received: by 2002:adf:ead1:0:b0:2bf:c0e4:1bc5 with SMTP id
 o17-20020adfead1000000b002bfc0e41bc5mr13742794wrn.56.1676040301950; 
 Fri, 10 Feb 2023 06:45:01 -0800 (PST)
Received: from [192.168.15.58] (54-240-197-232.amazon.com. [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id
 v18-20020a05600c445200b003de77597f16sm5827499wmn.21.2023.02.10.06.45.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Feb 2023 06:45:01 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <41f6979e-1dcc-f826-7361-4f93c6742659@xen.org>
Date: Fri, 10 Feb 2023 14:44:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v10 38/59] hw/xen: Implement EVTCHNOP_reset
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
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
References: <20230201143148.1744093-1-dwmw2@infradead.org>
 <20230201143148.1744093-39-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230201143148.1744093-39-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=xadimgnik@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-1.149, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 01/02/2023 14:31, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/kvm/xen_evtchn.c  | 30 ++++++++++++++++++++++++++++++
>   hw/i386/kvm/xen_evtchn.h  |  3 +++
>   target/i386/kvm/xen-emu.c | 17 +++++++++++++++++
>   3 files changed, 50 insertions(+)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


