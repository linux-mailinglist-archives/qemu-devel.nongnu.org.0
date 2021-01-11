Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA872F1DA1
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 19:10:59 +0100 (CET)
Received: from localhost ([::1]:47512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz1ec-0006iy-Ia
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 13:10:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kz1cv-0005hF-D8
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 13:09:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49136)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kz1cr-00089i-Ry
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 13:09:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610388549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LDmq4fV0YrNy0Sk1Sj2wa2wxIplOf4L7lrzO8gvGa44=;
 b=MYxKO8fbluidycX782LGtccVfvxHfqotGLBvFwBFDyCH6U71KAPPQyb3ujBKp5qV/2r3iT
 +G7qGfG3RvPWsVq8eeqXGVYVmudxNHbYV66D8Qxp5qbNJb87rb32iqurp4v6LnAatxyBdv
 hGa2kiEMGeD47VUh+7oGGbGjh4wAAtc=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-D3brweYfP6eVHYL9aGlXkw-1; Mon, 11 Jan 2021 13:09:07 -0500
X-MC-Unique: D3brweYfP6eVHYL9aGlXkw-1
Received: by mail-ej1-f72.google.com with SMTP id ov1so237070ejb.1
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 10:09:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LDmq4fV0YrNy0Sk1Sj2wa2wxIplOf4L7lrzO8gvGa44=;
 b=HYfvQ1YyiCv55zLCK0fZvVsO1lVIvjQDXfcMzL1QBBgyPPZsKFf588MdpjoJCzIi9j
 SnXAo84eeac8bMefub432Jg2Dii5aEu1xSFVK+HWcPTRa5ofO7ORVKFWBN1E7sxSLrl7
 cSroZkBVgKBBO6ZnQ9aTzx528kj7HgwiSYPhWnPl665rz8+BGgaHeIN6Eu+UB3nnYKr+
 bAfRTN8TZwTfAR6gKCW92M6bPLGJbwv45PoWmkTyt3/ob2IV+4Gh0tZBuseNSp1zP2TU
 OuxIFjg/0bnE6Z2QFm5S5k9H4+XhHnkddvtDiVQIygH3FLOdqiGqtsxasbU7l+3ru4oK
 M5UA==
X-Gm-Message-State: AOAM533/wNer3adSSfRpLLMssDlJnWP8CTA/tXg3mDE/RzjyOvBWwVkJ
 I1apU1s+rHA+dCF7EkGT/vqutnCJMYXRNWEISz3Uw8S5ZtZqYXx/L7onLMgrZdU/zbkAC22WSHM
 QKQTfrzbQ8yvItF0=
X-Received: by 2002:a50:eb44:: with SMTP id z4mr425046edp.167.1610388546526;
 Mon, 11 Jan 2021 10:09:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwsdYmcPCQW8JgADQ4kw4erWcJz0etvOGYoGwMhfC7ASHM+4OJl7UEC5wiPso1X/J1774zDpQ==
X-Received: by 2002:a50:eb44:: with SMTP id z4mr425011edp.167.1610388546158;
 Mon, 11 Jan 2021 10:09:06 -0800 (PST)
Received: from [192.168.1.36] (129.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.129])
 by smtp.gmail.com with ESMTPSA id t12sm277730edy.49.2021.01.11.10.09.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jan 2021 10:09:05 -0800 (PST)
Subject: Re: [for-6.0 v5 05/13] securable guest memory: Rework the
 "memory-encryption" property
To: David Gibson <david@gibson.dropbear.id.au>, pair@us.ibm.com,
 pbonzini@redhat.com, frankja@linux.ibm.com, brijesh.singh@amd.com,
 dgilbert@redhat.com, qemu-devel@nongnu.org
References: <20201204054415.579042-1-david@gibson.dropbear.id.au>
 <20201204054415.579042-6-david@gibson.dropbear.id.au>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <daf60f1f-354d-785e-4a15-6347fd655147@redhat.com>
Date: Mon, 11 Jan 2021 19:09:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201204054415.579042-6-david@gibson.dropbear.id.au>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: thuth@redhat.com, Marcelo Tosatti <mtosatti@redhat.com>,
 berrange@redhat.com, Eduardo Habkost <ehabkost@redhat.com>,
 kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>, cohuck@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>, mdroth@linux.vnet.ibm.com,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org, david@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/4/20 6:44 AM, David Gibson wrote:
> Currently the "memory-encryption" property is only looked at once we
> get to kvm_init().  Although protection of guest memory from the
> hypervisor isn't something that could really ever work with TCG, it's
> not conceptually tied to the KVM accelerator.
> 
> In addition, the way the string property is resolved to an object is
> almost identical to how a QOM link property is handled.
> 
> So, create a new "securable-guest-memory" link property which sets
> this QOM interface link directly in the machine.  For compatibility we
> keep the "memory-encryption" property, but now implemented in terms of
> the new property.
> 
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/kvm/kvm-all.c | 22 ++++++----------------
>  hw/core/machine.c   | 43 +++++++++++++++++++++++++++++++++++++------
>  include/hw/boards.h |  2 +-
>  3 files changed, 44 insertions(+), 23 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


