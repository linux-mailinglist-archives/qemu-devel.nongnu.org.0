Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D88C32F1D75
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 19:07:05 +0100 (CET)
Received: from localhost ([::1]:42694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz1ar-0004WW-0P
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 13:07:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kz1Ya-0002jO-4L
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 13:04:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kz1YY-0007VX-EK
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 13:04:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610388281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YDFmgDgRxNAaH6RohnUOtmiFzfn10DX+8iq8uU5yc/I=;
 b=CJxnkNXvH84OkSUa4wDPCjAVaozZ+Zekt64TwKbsM4nxt8Vq0aSJbC5mjF+b6iAETtg5sd
 rT8tguDcFWgpBx2ZdraTtpRyjCNNwKCSSk6TgJM2VfyBd2SUpC6yX74lycfldqTmEI6aSP
 +Yah4VlDnMgL+y5VgHp3dW1tahAt/JI=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-y0nH3v6DP9-VKZNfZsnBVg-1; Mon, 11 Jan 2021 13:04:39 -0500
X-MC-Unique: y0nH3v6DP9-VKZNfZsnBVg-1
Received: by mail-ed1-f72.google.com with SMTP id e11so49302edn.11
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 10:04:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YDFmgDgRxNAaH6RohnUOtmiFzfn10DX+8iq8uU5yc/I=;
 b=ktiUsBMGe6cJe54zmzNJCo04xujbTHy2QlV47KOl9BJz+YxNBT+5vpazTXVkw+LW2k
 62Ce4S4taNupMYhdtlEYHH5zz5n2LFIijlq593tP37lsxHUfMtZ1nH3uh2zkX2vWICpo
 n2j89fLZ+nDtNvqPxEjBLmMh88Hv70AhQ2H0Pd9111Qz5bVywwj62bsqEopJt+eWoWg5
 4DLYpfqapw+1b3RMcE2tm01Ig2KuTYbVMFj52ySH6Es2hVFe3GobfEmLz7mEtrmza6GW
 ygGeHL/oiW19cI4RIBIYMGHNg4paQUyWDB/AlvhM8nxyBEqFzTMtU9ICV3iOvBgjfWHj
 5Lwg==
X-Gm-Message-State: AOAM530AyBtDN8gx7HRGkUpbi3gc6xMStaG2KcreybylfHcaM6uVKXGD
 MZi/3ZHfMvmov0gDYpwZnqlim3Lkr8CNQn8N8p8BDj03xtC8j449ISHG+NcEMO8+24U7bv8NGat
 pn8dHI27HpM33xds=
X-Received: by 2002:a17:906:e206:: with SMTP id
 gf6mr485218ejb.342.1610388278598; 
 Mon, 11 Jan 2021 10:04:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz/eIATFh+PBzF3J4BtSB/ymjE8fFcXELl6KOECpzo5ZQ+s0HAQLJXiUQrwWyl4CzkEtxKzhA==
X-Received: by 2002:a17:906:e206:: with SMTP id
 gf6mr485177ejb.342.1610388278343; 
 Mon, 11 Jan 2021 10:04:38 -0800 (PST)
Received: from [192.168.1.36] (129.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.129])
 by smtp.gmail.com with ESMTPSA id n16sm273664edq.62.2021.01.11.10.04.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jan 2021 10:04:37 -0800 (PST)
Subject: Re: [for-6.0 v5 01/13] qom: Allow optional sugar props
To: David Gibson <david@gibson.dropbear.id.au>, pair@us.ibm.com,
 pbonzini@redhat.com, frankja@linux.ibm.com, brijesh.singh@amd.com,
 dgilbert@redhat.com, qemu-devel@nongnu.org
References: <20201204054415.579042-1-david@gibson.dropbear.id.au>
 <20201204054415.579042-2-david@gibson.dropbear.id.au>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <380065a5-f656-6f4b-edfe-ce9199f8bc62@redhat.com>
Date: Mon, 11 Jan 2021 19:04:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201204054415.579042-2-david@gibson.dropbear.id.au>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
 Greg Kurz <groug@kaod.org>, pasic@linux.ibm.com, borntraeger@de.ibm.com,
 qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, david@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/4/20 6:44 AM, David Gibson wrote:
> From: Greg Kurz <groug@kaod.org>
> 
> Global properties have an @optional field, which allows to apply a given
> property to a given type even if one of its subclasses doesn't support
> it. This is especially used in the compat code when dealing with the
> "disable-modern" and "disable-legacy" properties and the "virtio-pci"
> type.
> 
> Allow object_register_sugar_prop() to set this field as well.
> 
> Signed-off-by: Greg Kurz <groug@kaod.org>
> Message-Id: <159738953558.377274.16617742952571083440.stgit@bahia.lan>
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> ---
>  include/qom/object.h |  3 ++-
>  qom/object.c         |  4 +++-
>  softmmu/vl.c         | 16 ++++++++++------
>  3 files changed, 15 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


